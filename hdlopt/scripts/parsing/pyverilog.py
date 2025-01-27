import os
import tempfile
from typing import Dict, List, Optional

from ..logger import logger
from .base import VerilogParserBase
from .exceptions import FileProcessingError, SignalDeclarationError
from .models import Signal, VerilogModule

try:
    from pyverilog.vparser.ast import (
        Decl,
        Description,
        Identifier,
        Inout,
        Input,
        InstanceList,
        IntConst,
        Ioport,
        ModuleDef,
        Node,
        Output,
        Parameter,
        Paramlist,
        Port,
        Portlist,
        Reg,
        Source,
        Width,
        Wire,
    )
    from pyverilog.vparser.parser import parse

    PYVERILOG_AVAILABLE = True
except ImportError:
    PYVERILOG_AVAILABLE = False
    logger.warning("PyVerilog not available. PyVerilog parser will not be usable.")


class PyVerilogParser(VerilogParserBase):
    """Verilog parser implementation using PyVerilog library."""

    def __init__(self, clk_name="clk", rst_name="rst"):
        if not PYVERILOG_AVAILABLE:
            raise ImportError("PyVerilog is required but not installed")

        super().__init__(clk_name=clk_name, rst_name=rst_name)

        self.ast_types = {
            "Source": Source,
            "Description": Description,
            "ModuleDef": ModuleDef,
            "Ioport": Ioport,
            "Inout": Inout,
            "Node": Node,
            "Paramlist": Paramlist,
            "Portlist": Portlist,
            "Port": Port,
            "Width": Width,
            "Identifier": Identifier,
            "IntConst": IntConst,
            "Input": Input,
            "Output": Output,
            "Wire": Wire,
            "Reg": Reg,
            "Parameter": Parameter,
            "InstanceList": InstanceList,
            "Decl": Decl,
        }

    def preprocess_verilog(self, content: str) -> str:
        """Preprocess Verilog code to make it more compatible with PyVerilog.

        This method:
        - Removes all comments (single-line and multi-line)
        - Removes default values from port declarations
        - Cleans up whitespace
        """
        logger.debug("Starting enhanced preprocessing...")

        # First remove multi-line comments
        while True:
            start = content.find("/*")
            if start == -1:
                break
            end = content.find("*/", start)
            if end == -1:
                break
            content = content[:start] + content[end + 2 :]

        # Process line by line
        lines = []
        for line in content.split("\n"):
            # Remove single-line comments
            if "//" in line:
                line = line[: line.find("//")]

            # Handle port declarations with default values
            if "=" in line and any(x in line for x in ["input", "output"]):
                # Remove the default value assignment
                comma_pos = line.find(",")
                if comma_pos != -1:
                    line = line[: line.find("=")].rstrip() + line[comma_pos:]
                else:
                    line = line[: line.find("=")].rstrip()

            # Add non-empty lines
            if line.strip():
                lines.append(line)

        return "\n".join(lines)

    def parse_file(self, file_or_content: str) -> List[VerilogModule]:
        """Parse a Verilog file or content string using PyVerilog.

        Args:
            file_or_content: Either a filepath or Verilog code string

        Returns:
            List of parsed VerilogModule objects

        Raises:
            FileProcessingError: If parsing fails
        """
        try:
            # Determine if input is file or content
            if os.path.exists(file_or_content):
                with open(file_or_content) as f:
                    content = f.read()
            else:
                content = file_or_content

            logger.debug(f"Original content:\n{content}")

            # Preprocess the content
            preprocessed = self.preprocess_verilog(content)
            logger.debug(f"Preprocessed content:\n{preprocessed}")

            # Write to temporary file (PyVerilog requires a file)
            with tempfile.NamedTemporaryFile(
                mode="w", suffix=".v", delete=False
            ) as tmp:
                tmp.write(preprocessed)
                tmp_path = tmp.name

            try:
                # Parse using PyVerilog
                ast, _ = parse([tmp_path])
                logger.debug("Parsing successful")

                # Process AST
                modules = []
                for node in ast.children():
                    for item in node.children():
                        if isinstance(item, self.ast_types["ModuleDef"]):
                            logger.debug(f"Processing module: {item.name}")
                            module = self._parse_module_def(item)
                            modules.append(module)

                return modules

            finally:
                os.unlink(tmp_path)

        except Exception as e:
            logger.error(f"Parsing error: {str(e)}")
            # Add context for line-based errors
            if hasattr(e, "lineno"):
                content_lines = content.splitlines()
                line_num = e.lineno
                if 0 <= line_num - 1 < len(content_lines):
                    context = "\n".join(
                        content_lines[
                            max(0, line_num - 3) : min(len(content_lines), line_num + 2)
                        ]
                    )
                    logger.error(f"Error context around line {line_num}:\n{context}")

            raise FileProcessingError(
                f"PyVerilog parsing failed: {str(e)}\n" "See logs for details."
            )

    def _parse_module_def(self, module_node) -> VerilogModule:
        """Parse a PyVerilog ModuleDef node into a VerilogModule."""
        try:
            module = VerilogModule(name=module_node.name)

            # Parse parameters
            if module_node.paramlist:
                for param in module_node.paramlist.params:
                    # Extract parameter information based on the AST structure
                    param_name = self._get_name(param)
                    param_value = self._get_parameter_value(param)
                    print(param_name, param_value)

                    if param_name and param_value:
                        parameter = {"name": param_name, "value": param_value}
                        module.parameters.append(parameter)
                        logger.debug(f"Added parameter: {parameter}")

            # Parse ports
            if module_node.portlist:
                self._parse_ports(module, module_node.portlist)

            # Parse body items
            if module_node.items:
                self._parse_items(module, module_node.items)

            return module

        except Exception as e:
            logger.error(f"Error parsing module {module_node.name}: {str(e)}")
            logger.error(f"Module node content: {dir(module_node)}")
            logger.error(f"Module node structure: {module_node}")
            if module_node.paramlist:
                logger.error(f"Parameter list content: {dir(module_node.paramlist)}")
                logger.error(
                    f"Parameter list structure: {
                        module_node.paramlist}"
                )
            raise

    def _get_parameter_value(self, param_node) -> str:
        """Extract parameter value from AST node.

        Args:
            param_node: PyVerilog parameter AST node

        Returns:
            String representation of parameter value
        """
        try:
            # Get the Parameter node
            param = param_node
            if hasattr(param_node, "children"):
                for child in param_node.children():
                    if isinstance(child, self.ast_types["Parameter"]):
                        param = child
                        break

            # print(param.attr_names, param.value, param.value.var)

            # Get the value node
            if hasattr(param, "value"):
                value_node = param.value
                # print(value_node)
            else:
                return "unknown"

            # Extract actual value from the value node
            if hasattr(value_node, "var"):
                # Direct value access
                return str(value_node.var)

            if hasattr(value_node, "data"):
                # Some nodes store value in data
                return str(value_node.data)

            raw_str = str(value_node)
            # Clean up PyVerilog's string representation
            cleaned = raw_str.strip()
            if cleaned.startswith("<") and cleaned.endswith(">"):
                # Extract from PyVerilog repr format
                parts = cleaned.split("=")
                if len(parts) > 1:
                    return parts[-1].strip("> ")

            return raw_str

        except Exception as e:
            logger.error(f"Error extracting parameter value: {str(e)}")
            return "unknown"

    def _get_name(self, node) -> Optional[str]:
        """Extract name from AST node.

        Args:
            node: PyVerilog AST node

        Returns:
            Name string if found, None otherwise
        """
        if hasattr(node, "name"):
            return node.name

        if hasattr(node, "children"):
            for child in node.children():
                if hasattr(child, "name"):
                    return child.name

        return None

    def _parse_ports(self, module: VerilogModule, portlist) -> None:
        if not portlist:
            return

        for port in portlist.ports:
            # 1) Create the Signal object
            signal = self._create_signal_from_port(port)

            # 2) Figure out direction from either `port` or `port.first`
            if isinstance(port, Ioport):
                direction_node = port.first
                # If `direction_node` is Input => module.inputs.append(signal)
                if isinstance(direction_node, Input):
                    module.inputs.append(signal)
                    if signal.name in (self.clk_name, self.rst_name):
                        module.mode = "sequential"
                elif isinstance(direction_node, Output):
                    module.outputs.append(signal)
                elif isinstance(direction_node, Inout):
                    # If you handle inouts:
                    module.inputs.append(signal)
                    module.outputs.append(signal)
                else:
                    # Some fallback?
                    pass
            else:
                # If your code ever sees direct `Input(...)` or `Output(...)` (rare),
                # do the old logic:
                if isinstance(port, Input):
                    module.inputs.append(signal)
                    if signal.name in (self.clk_name, self.rst_name):
                        module.mode = "sequential"
                elif isinstance(port, Output):
                    module.outputs.append(signal)

    def _parse_items(self, module: VerilogModule, items) -> None:
        """Parse module items (internal declarations, instances, etc.).

        Args:
            module: VerilogModule to update
            items: List of PyVerilog item nodes
        """
        if not items:
            return

        for item in items:
            # Handle wire/reg declarations
            if isinstance(item, self.ast_types["Decl"]):
                for declaration in item.list:
                    signal = self._create_signal_from_declaration(declaration)
                    module.internals.append(signal)

            # Handle module instantiations
            elif isinstance(item, self.ast_types["InstanceList"]):
                module_type = item.module
                module.submodules.append(module_type)

    def _create_signal_from_declaration(self, decl) -> Signal:
        """Create a Signal object from a PyVerilog declaration node."""
        try:
            # The actual name might be in different places depending on the AST
            # structure
            if hasattr(decl, "name"):
                name = decl.name
            elif hasattr(decl, "children"):
                # Try to find name in children
                for child in decl.children():
                    if hasattr(child, "name"):
                        name = child.name
                        break
                else:
                    logger.error(f"Could not find name in declaration: {decl}")
                    return None
            else:
                logger.error(f"Declaration has no name attribute or children: {decl}")
                return None

            sign = "signed" if hasattr(decl, "signed") and decl.signed else "unsigned"
            sig_type = "reg" if isinstance(decl, self.ast_types["Reg"]) else "wire"

            # Parse bit width
            bit_width = "1"
            if hasattr(decl, "width") and decl.width:
                msb = self._get_value(decl.width.msb)
                lsb = self._get_value(decl.width.lsb)
                bit_width = f"{msb}:{lsb}"

            # Get default value if present
            default_value = None
            if hasattr(decl, "value"):
                default_value = self._get_value(decl.value)

            return Signal(
                name=name,
                type=sig_type,
                sign=sign,
                bit_width=bit_width,
                comment="",
                default_value=default_value,
            )
        except Exception as e:
            logger.error(f"Error creating signal from declaration: {str(e)}")
            return None

    def _create_signal_from_port(self, port) -> Signal:
        """
        Create a Signal object from a PyVerilog port node (Input, Output, etc.).
        """
        # If it's Ioport, the real port node is likely in port.first
        if isinstance(port, self.ast_types["Ioport"]):  # Ioport
            direction_node = port.first  # e.g. an Input(...) or Output(...)
            # If direction_node is None or not a recognized AST node, raise
            if not direction_node or not isinstance(
                direction_node,
                (
                    self.ast_types["Input"],
                    self.ast_types["Output"],
                    self.ast_types["Inout"],
                ),
            ):
                raise SignalDeclarationError("Ioport node has invalid children")

            name = getattr(direction_node, "name", None)
            # Possibly also check if direction_node.children() has an Identifier
            # e.g. direction_node.children()[0] if it's there

            # If name is still None, fall back to paramlike?
            if not name:
                # For example, if direction_node looks like Input(width=Width(...), ...)
                # sometimes name is in direction_node.children()[0].name
                for child in direction_node.children():
                    if isinstance(child, self.ast_types["Identifier"]):
                        name = child.name
                        break

            if not name:
                raise SignalDeclarationError(
                    "Ioport has no valid name in Input/Output node"
                )

            # If Output + reg = True => type = 'reg', else 'wire'
            sig_type = "wire"
            if isinstance(direction_node, self.ast_types["Output"]) and getattr(
                direction_node, "reg", False
            ):
                sig_type = "reg"

            # Extract bit width
            bit_width = "1"
            width_obj = getattr(direction_node, "width", None)
            if width_obj:
                msb = self._get_value(width_obj.msb)
                lsb = self._get_value(width_obj.lsb)
                bit_width = f"{msb}:{lsb}"

            # sign
            sign = "signed" if getattr(direction_node, "signed", False) else "unsigned"

            return Signal(
                name=name,
                type=sig_type,
                sign=sign,
                bit_width=bit_width,
                comment="",
                default_value=None,
            )

        else:
            # If it's already an Input/Output node, do it directly...
            # 1) Determine signal name
            #    Port nodes may store the name in different attributes depending on AST structure.
            #    Typically, `port.name` is the actual string, and `port.width` is the bit width.
            # If it’s an `Output` node with `reg` specified, you might do extra
            # checks.
            name = getattr(port, "name", None)
            if not name:
                # Fallback logic if the name attribute is not present
                raise SignalDeclarationError("Port has no valid name")

            # 2) Determine direction (input vs output) – can be used to infer default_value or type
            # direction = (
            #    "input" if isinstance(port, self.ast_types["Input"]) else "output"
            # )

            # 3) Determine the bit width
            bit_width = "1"
            sign = "unsigned"
            if getattr(port, "width", None):
                msb = self._get_value(port.width.msb)
                lsb = self._get_value(port.width.lsb)
                bit_width = f"{msb}:{lsb}"

            # 4) If it’s output reg, you might see something like port.__class__.__name__ == 'Output' and port.reg is True
            #    Or you can store a small helper to check if 'reg' is declared
            # For now, assume 'wire' for all inputs/outputs except if you
            # detect "output reg"
            sig_type = "wire"
            if isinstance(port, self.ast_types["Output"]) and getattr(
                port, "reg", False
            ):
                sig_type = "reg"

            # 5) Construct the Signal
            signal = Signal(
                name=name,
                type=sig_type,
                sign=sign,
                bit_width=bit_width,
                comment="",  # If you want to store comments, you can do so in a separate pass
                default_value=None,  # This can be determined from your existing logic if needed
            )

            # If clk/rst detection is relevant for setting module.mode, that
            # logic is in _parse_ports anyway
            return signal

    def _get_value(self, node) -> str:
        """Extract value from PyVerilog value node.

        Args:
            node: PyVerilog node containing a value

        Returns:
            String representation of the value
        """
        if hasattr(node, "value"):
            return str(node.value)
        if hasattr(node, "name"):
            return node.name

        # Handle Rvalue types
        try:
            raw_str = str(node)
            if "=" in raw_str:
                return raw_str.split("=")[1].strip()
            if "value=" in raw_str:
                return raw_str.split("value=")[1].strip("> '\"")

            # Convert other raw string formats
            cleaned = raw_str.strip("< >'\"")
            if cleaned.isdigit():
                return cleaned
            if cleaned.startswith("0x") or cleaned.startswith("0b"):
                return cleaned
            if "'" in cleaned:  # Handle Verilog literals like 8'b0
                return cleaned
        except Exception as e:
            print(str(e))

        return str(node)

    def _map_error_message(self, error: Exception) -> str:
        """Map PyVerilog error messages to our expected error messages.

        Args:
            error: Original exception

        Returns:
            Mapped error message
        """
        err_str = str(error).lower()

        if any(x in err_str for x in ["invalid bit width", "bit", "width", "array"]):
            return "Invalid bit width"
        if any(x in err_str for x in ["bracket", "[", "]", "unterminated"]):
            return "Invalid bit width"
        if any(x in err_str for x in ["syntax error", "unexpected", "token"]):
            if any(x in err_str for x in ["bit", "width", "array", "dimension"]):
                return "Invalid bit width"

        return "Invalid signal declaration"

    def parse_signal(
        self,
        declaration: str,
        comment: str = "",
        parameters: List[Dict[str, str]] = None,
        is_input: bool = False,
    ) -> Optional[Signal]:
        """Parse a signal declaration using PyVerilog's parser.

        Args:
            declaration: Signal declaration string
            comment: Optional comment
            parameters: Optional list of module parameters
            is_input: Whether the signal is an input

        Returns:
            Signal object if valid, None if invalid

        Raises:
            SignalDeclarationError: If declaration cannot be parsed
        """
        try:
            # Basic validation first
            if not declaration.strip():
                raise SignalDeclarationError("Empty signal declaration")

            # Check for contradictory directions
            if "input" in declaration and "output" in declaration:
                raise SignalDeclarationError("Contradictory signal directions")

            # Write content to temporary file
            content = f"module test_mod; {declaration}; endmodule"
            with tempfile.NamedTemporaryFile(
                mode="w", suffix=".v", delete=False
            ) as tmp:
                tmp.write(content)
                tmp_path = tmp.name

            try:
                ast, _ = parse([tmp_path])

                # Extract the signal information from the AST
                if len(ast.children()) > 0:
                    for node in ast.children()[0].children():
                        if isinstance(
                            node,
                            (
                                self.ast_types["Input"],
                                self.ast_types["Output"],
                                self.ast_types["Wire"],
                                self.ast_types["Reg"],
                            ),
                        ):
                            signal = self._create_signal_from_port(node)
                            return signal

                raise SignalDeclarationError("Invalid signal declaration")

            finally:
                os.unlink(tmp_path)

        except SignalDeclarationError:
            raise
        except Exception as e:
            # Map the error to expected error messages
            err_str = str(e).lower()
            print("Err Str:", err_str)
            if "bit" in err_str and "width" in err_str:
                raise SignalDeclarationError("Invalid bit width")
            elif "incomplete" in err_str:
                raise SignalDeclarationError("Invalid signal declaration")
            raise SignalDeclarationError("Invalid signal declaration")
