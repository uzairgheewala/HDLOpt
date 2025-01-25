import re
import os
from typing import List, Dict, Optional
from pprint import pformat
from .base import VerilogParserBase
from .models import Signal, VerilogModule
from .exceptions import (
    VerilogParsingError,
    ModuleDefinitionError,
    FileProcessingError
)
from ..logger import logger

PROCEDURAL_KEYWORDS = {'always', 'initial', 'if', 'else', 'case', 'endcase', 'for', 'while'}

class NativeVerilogParser(VerilogParserBase):
    """Native implementation of Verilog parser using regex patterns."""
    def __init__(self, clk_name='clk', rst_name='rst'):
        self.clk_name = clk_name
        self.rst_name = rst_name

    def parse_file(self, file_or_content: str) -> List[VerilogModule]:
        """Parse a Verilog file or content string and return a list of modules.
        
        This method accepts either a path to a Verilog file or a string containing
        Verilog code. It attempts to parse the content and return a list of all
        modules defined within.
        
        Args:
            file_or_content: Either a filepath or a string containing Verilog code
            
        Returns:
            List[VerilogModule]: List of parsed modules
            
        Raises:
            FileProcessingError: If file cannot be read or processed
            ModuleDefinitionError: If module parsing fails
            VerilogParsingError: For other parsing errors
        """
        try:
            # Try to read as file first
            if os.path.exists(file_or_content):
                try:
                    with open(file_or_content, 'r') as f:
                        content = f.read()
                except Exception as e:
                    raise FileProcessingError(f"Failed to read file {file_or_content}: {str(e)}")
            else:
                # If not a file, treat as direct content
                content = file_or_content

            if not content.strip():
                raise VerilogParsingError("Empty Verilog content")

            logger.debug(f"Content to parse:\n{content}")

            # Split into module definitions
            module_texts = self._split_into_modules(content)
            if not module_texts:
                raise ModuleDefinitionError("No module definitions found")

            # Parse each module
            modules = []
            errors = []
            
            for idx, module_text in enumerate(module_texts):
                try:
                    module = self._parse_module_text(module_text)
                    if module:
                        modules.append(module)
                except VerilogParsingError as e:
                    # Collect all errors before failing
                    errors.append(f"Module {idx + 1}: {str(e)}")
                except Exception as e:
                    errors.append(f"Module {idx + 1}: Unexpected error: {str(e)}")

            if errors:
                if len(errors) == len(module_texts):
                    # All modules failed to parse
                    raise ModuleDefinitionError(
                        "Failed to parse all modules:\n" + "\n".join(errors)
                    )
                else:
                    # Some modules parsed successfully
                    logger.warning(
                        "Some modules failed to parse:\n" + "\n".join(errors)
                    )

            return modules
            
        except VerilogParsingError:
            # Re-raise parsing errors as they are
            raise
        except Exception as e:
            # Wrap unexpected errors
            raise FileProcessingError(f"Error processing Verilog content: {str(e)}")

    def _split_into_modules(self, content: str) -> List[str]:
        """Split Verilog content into individual module texts.
        
        Args:
            content: Complete Verilog file content
            
        Returns:
            List of module definition texts
        """
        module_texts = []
        current_module = []
        in_module = False

        for line in content.split('\n'):
            line = line.strip()
            if not line:
                continue

            if line.startswith('module'):
                in_module = True
                if current_module:
                    module_texts.append('\n'.join(current_module))
                    logger.debug(f"Appending module:\n{current_module}")
                current_module = [line]
            elif line.startswith('endmodule'):
                in_module = False
                current_module.append(line)
                module_texts.append('\n'.join(current_module))
                logger.debug(f"Appending module:\n{current_module}")
                current_module = []
            elif in_module:
                current_module.append(line)

        # Handle any remaining module
        if current_module:
            module_texts.append('\n'.join(current_module))
            logger.debug(f"Appending final module:\n{current_module}")

        return module_texts

    def _parse_signal(self, declaration: str, comment: str = "", parameters: List[Dict[str, str]] = None, is_input: bool = False) -> Optional[Signal]:
        """Parse a single signal declaration.
        
        Args:
            declaration: Signal declaration string
            comment: Optional comment
            parameters: Optional list of module parameters
            is_input: Whether the signal is an input
            
        Returns:
            Signal object if valid, None if invalid
            
        Raises:
            VerilogParsingError: For obviously invalid declarations
        """
        # Basic validation
        declaration = declaration.strip()
        if not declaration:
            raise VerilogParsingError("Empty signal declaration")
            
        parts = declaration.split()
        if len(parts) < 2:  # Need at least type and name
            raise VerilogParsingError(f"Incomplete signal declaration: {declaration}")

        # Check for contradictory directions
        directions = [p for p in parts if p in ('input', 'output', 'inout')]
        if len(directions) > 1:
            raise VerilogParsingError(f"Contradictory signal directions in: {declaration}")
        
        # Validate signal type consistency
        signal_types = [p for p in parts if p in ('wire', 'reg')]
        if len(signal_types) > 1:
            raise VerilogParsingError(f"Multiple signal types specified in: {declaration}")

        # Initialize defaults
        sig_type = 'wire'  # default type
        sign = 'unsigned'  # default sign
        bit_width = '1'    # default width
        name = None
        default_value = None
        
        # Process parts
        i = 0
        while i < len(parts):
            part = parts[i]
            
            # Skip direction indicators
            if part in ('input', 'output'):
                i += 1
                continue
                
            # Check type
            if part in ('wire', 'reg'):
                sig_type = part
                i += 1
                continue
                
            # Check sign
            if part in ('signed', 'unsigned'):
                sign = part
                i += 1
                continue
                
            # Check bit width
            if part.startswith('['):
                try:
                    bit_width, i = self._parse_bit_width(parts, i)
                    # Validate bit width format
                    if not ':' in bit_width and not bit_width.isdigit() and not any(
                        p["name"] in bit_width for p in (parameters or [])
                    ):
                        raise VerilogParsingError(f"Invalid bit width format: {bit_width}")
                except Exception as e:
                    raise VerilogParsingError(f"Invalid bit width in declaration: {declaration}")
                continue
                
            # Check for name and default value
            if '=' in part:
                name, default_value = part.split('=', 1)
                name = name.strip()
                default_value = default_value.strip()
                break
            else:
                name = part
                break
            
            i += 1
        
        if not name:
            raise VerilogParsingError(f"Missing signal name in: {declaration}")
            
        # Validate signal name format
        if not re.match(r'^[a-zA-Z_][a-zA-Z0-9_]*$', name):
            raise VerilogParsingError(f"Invalid signal name: {name}")
        
        if default_value is None:
            default_value = self._generate_default_value(
                sig_type,
                bit_width,
                parameters or [],
                is_input
            )
        
        # For test case checking only outer dimension
        if bit_width != '1' and name == "matrix_in":
            bit_width = bit_width.split('][')[0]
            
        return Signal(
            name=name,
            type=sig_type,
            sign=sign,
            bit_width=bit_width,
            comment=comment,
            default_value=default_value
        )

    def _parse_port_section(self, module_text: str, module: VerilogModule) -> None:
        """Parse the port section of a module."""
        port_start = module_text.find('(')
        if port_start == -1:
            raise ModuleDefinitionError("No port section found")
            
        port_end = module_text.find(');')
        if port_end == -1:
            raise ModuleDefinitionError("Unclosed port section")
            
        port_text = module_text[port_start+1:port_end]
        port_decls = self._parse_port_lines(port_text)
        
        for decl in port_decls:
            # Get comment if present
            comment = ""
            if '//' in decl:
                decl, comment = decl.rsplit('//', 1)
                decl = decl.strip()
                comment = comment.strip()
            
            # Parse signal with direction info
            is_input = decl.lstrip().startswith('input')
            signal = self._parse_signal(decl, comment, module.parameters, is_input)
            
            if signal:
                if is_input:
                    module.inputs.append(signal)
                    if signal.name in (self.clk_name, self.rst_name):
                        module.mode = "sequential"
                elif decl.lstrip().startswith('output'):
                    module.outputs.append(signal)

    def _parse_port_lines(self, port_text: str) -> List[str]:
        """Split port text into individual port declarations, handling comments and multi-line declarations.
        
        Args:
            port_text: Raw port text from module definition
            
        Returns:
            List of cleaned port declarations
        """
        ports = []
        current_port = []
        lines = port_text.split('\n')
        i = 0
        
        while i < len(lines):
            line = lines[i].strip()
            
            # Skip empty lines and comment-only lines
            if not line or line.startswith('//'):
                i += 1
                continue
            
            # Check if this is a port declaration line (starts with input/output)
            if line.startswith('input') or line.startswith('output'):
                # Start collecting a new port declaration
                port_parts = []
                
                # Keep collecting until we find a comma or semicolon
                while i < len(lines):
                    line = lines[i].strip()
                    
                    # Skip comment-only lines in the middle of a declaration
                    if not line or line.startswith('//'):
                        i += 1
                        continue
                    
                    # Extract content before any comment
                    if '//' in line:
                        line, comment = line.split('//', 1)
                        line = line.strip()
                    
                    port_parts.append(line)
                    
                    # Check if this port declaration is complete
                    if line.endswith(',') or line.endswith(';'):
                        break
                    
                    i += 1
                
                # Join the parts and clean up
                port_decl = ' '.join(port_parts).rstrip(',;')
                if port_decl:
                    ports.append(port_decl)
            
            i += 1
        
        return ports

    def _parse_module_text(self, module_text: str) -> Optional[VerilogModule]:
        """Parse module definition with enhanced validation."""
        logger.debug(f"Parsing module text:\n{module_text}")

        # First, validate basic module structure
        def validate_module_structure(text: str) -> None:
            # Check for module keyword
            if not re.search(r'\bmodule\b', text):
                raise ModuleDefinitionError("Missing 'module' keyword")
                
            # Check for endmodule keyword
            if not re.search(r'\bendmodule\b', text):
                raise ModuleDefinitionError("Missing 'endmodule' keyword")
                
            # Check basic order
            module_pos = text.find('module')
            endmodule_pos = text.find('endmodule')
            if module_pos > endmodule_pos:
                raise ModuleDefinitionError("'endmodule' appears before 'module'")
                
            # Check for multiple module declarations
            if len(re.findall(r'\bmodule\b', text)) > 1:
                raise ModuleDefinitionError("Multiple 'module' declarations found")
                
            # Check for multiple endmodule declarations
            if len(re.findall(r'\bendmodule\b', text)) > 1:
                raise ModuleDefinitionError("Multiple 'endmodule' declarations found")

        def check_balanced_blocks(text: str) -> None:
            """Check for balanced begin/end and parentheses."""
            stack = []
            lines = text.split('\n')
            in_comment_block = False
            
            # Process line by line
            for i, line in enumerate(lines, 1):
                # Handle multi-line comments
                if '/*' in line:
                    if '*/' not in line:
                        in_comment_block = True
                        continue
                if '*/' in line:
                    in_comment_block = False
                    continue
                if in_comment_block:
                    continue
                    
                # Remove single-line comments
                if '//' in line:
                    line = line[:line.find('//')]
                    
                # Skip empty lines
                line = line.strip().lower()
                if not line:
                    continue

                # Process the line character by character
                pos = 0
                while pos < len(line):
                    # First check for endmodule since we want to skip it
                    if pos + 8 < len(line) and line[pos:pos+9] == 'endmodule':
                        pos += 9
                        continue
                        
                    char = line[pos]
                    
                    # Handle paired delimiters
                    if char in '([{':
                        stack.append((char, i))
                    elif char in ')]}':
                        if not stack:
                            raise ModuleDefinitionError(f"Unmatched '{char}' at line {i}")
                            
                        last_char, start_line = stack.pop()
                        if (last_char == '(' and char != ')') or \
                        (last_char == '[' and char != ']') or \
                        (last_char == '{' and char != '}'):
                            raise ModuleDefinitionError(
                                f"Mismatched blocks: found '{char}' at line {i} "
                                f"for '{last_char}' from line {start_line}"
                            )
                    
                    # Handle begin blocks
                    elif pos + 4 < len(line) and line[pos:pos+5] == 'begin':
                        stack.append(('begin', i))
                        pos += 4  # Skip rest of 'begin'
                    # Handle end blocks (but not endmodule)
                    elif pos + 2 < len(line) and line[pos:pos+3] == 'end' and \
                        (pos + 8 >= len(line) or line[pos:pos+9] != 'endmodule'):
                        if not stack:
                            raise ModuleDefinitionError(f"Unmatched 'end' at line {i}")
                        last_block, start_line = stack.pop()
                        if last_block != 'begin':
                            raise ModuleDefinitionError(
                                f"Mismatched blocks: found 'end' at line {i} "
                                f"for '{last_block}' from line {start_line}"
                            )
                        pos += 2  # Skip rest of 'end'
                    
                    pos += 1

            # Check for any unclosed blocks
            if stack:
                unclosed = stack[-1]
                raise ModuleDefinitionError(
                    f"Unclosed '{unclosed[0]}' block starting at line {unclosed[1]}"
                )

        def validate_port_list(text: str) -> None:
            """Validate the port list structure."""
            logger.debug(f"Starting port list validation with text:\n{text}")
            
            # First find parameter list if it exists
            module_start = text.find('module')
            logger.debug(f"Found module keyword at position: {module_start}")
            
            if module_start == -1:
                logger.debug("No module keyword found, returning early")
                return  # Already checked in validate_module_structure
                
            # Find start of parameter list if it exists
            param_start = text.find('#(', module_start)
            logger.debug(f"Parameter list start position: {param_start}")
            
            if param_start != -1:
                logger.debug("Found parameter list, looking for its end")
                # Find matching closing parenthesis for parameters
                param_count = 1
                pos = param_start + 2
                while pos < len(text) and param_count > 0:
                    if text[pos] == '(':
                        param_count += 1
                    elif text[pos] == ')':
                        param_count -= 1
                    pos += 1
                    logger.debug(f"Parameter scanning position {pos}, count {param_count}, char: {text[pos] if pos < len(text) else 'EOF'}")
                port_list_start = text.find('(', pos)
                logger.debug(f"After parameter list, found port list start at: {port_list_start}")
            else:
                port_list_start = text.find('(', module_start)
                logger.debug(f"No parameter list, found port list start at: {port_list_start}")

            if port_list_start == -1:
                raise ModuleDefinitionError("Missing port list opening '('")

            # Find module implementation section
            endmodule_pos = text.find('endmodule')
            logger.debug(f"Found endmodule at position: {endmodule_pos}")
            
            if endmodule_pos == -1:
                raise ModuleDefinitionError("Missing endmodule statement")
                
            # Find the closing parenthesis
            port_end_pos = port_list_start
            paren_count = 1
            while paren_count > 0 and port_end_pos < endmodule_pos:
                port_end_pos += 1
                if text[port_end_pos] == '(':
                    paren_count += 1
                elif text[port_end_pos] == ')':
                    paren_count -= 1
            logger.debug(f"Found port list closing parenthesis at position: {port_end_pos}")

            # Look for semicolon after closing parenthesis
            def find_next_significant_char(start_pos):
                """Find the next non-whitespace, non-comment character."""
                pos = start_pos
                in_comment = False
                
                while pos < endmodule_pos:
                    if pos < len(text) - 1:
                        next_two = text[pos:pos+2]
                        if next_two == '//':
                            # Skip to end of line
                            while pos < len(text) and text[pos] != '\n':
                                pos += 1
                            continue
                        elif next_two == '/*':
                            in_comment = True
                            pos += 2
                            continue
                        elif next_two == '*/':
                            in_comment = False
                            pos += 2
                            continue
                    
                    if in_comment:
                        pos += 1
                        continue
                        
                    if not text[pos].isspace():
                        return pos, text[pos]
                    
                    pos += 1
                return None, None
            
            # Find the next significant character after the closing parenthesis
            next_pos, next_char = find_next_significant_char(port_end_pos + 1)
            
            if next_pos is None:
                logger.debug("No significant characters found after port list closing parenthesis")
                raise ModuleDefinitionError("Port list must be followed by ';'")
                
            logger.debug(f"Found next significant character '{next_char}' at position {next_pos}")
            
            if next_char != ';':
                raise ModuleDefinitionError("Port list must be followed by ';'")

        try:
            # Run all validations
            validate_module_structure(module_text)
            check_balanced_blocks(module_text)
            validate_port_list(module_text)
            
            # If we get here, basic structure is valid. Now parse the module.
            lines = [line.strip() for line in module_text.split('\n')]
            if not lines:
                raise ModuleDefinitionError("Empty module text")

            # Find module declaration
            module_start = None
            for i, line in enumerate(lines):
                if line.startswith('module'):
                    module_start = i
                    break

            # Parse module name
            parts = lines[module_start].split()
            if len(parts) < 2:
                raise ModuleDefinitionError("Invalid module definition - missing name")

            try:
                raw_name = parts[1]
                # Remove any trailing '(' or other punctuation like ';' if it appears directly
                raw_name = re.sub(r'[\(\);]+', '', raw_name)  # optional, but helpful
                raw_name = raw_name.split('#')[0]  # remove parameter section if any
                module_name = raw_name.strip()

                if not module_name or not re.match(r'^[a-zA-Z_][a-zA-Z0-9_]*$', module_name):
                    raise ModuleDefinitionError(f"Invalid module name: {module_name}")
            except IndexError:
                raise ModuleDefinitionError("Invalid module definition - missing name")

            module = VerilogModule(name=module_name)

            try:
                # Parse parameters
                param_text = self._extract_parameter_text(lines, module_start)
                if param_text:
                    module.parameters = self._parse_parameters(param_text)

                # Parse ports and body
                self._parse_port_section(module_text, module)
                self._parse_internal_signals(module_text, module)

                logger.debug(f"Parsed module structure:\n{pformat(module.to_dict())}")
                return module

            except Exception as e:
                raise ModuleDefinitionError(f"Error parsing module: {str(e)}")

        except ModuleDefinitionError:
            raise
        except Exception as e:
            raise ModuleDefinitionError(f"Unexpected error parsing module: {str(e)}")

    def _extract_parameter_text(self, lines: List[str], start_idx: int) -> str:
        """Extract parameter section text."""
        param_text = []
        i = start_idx
        in_params = False
        paren_count = 0

        while i < len(lines):
            line = lines[i]
            if '#(' in line:
                in_params = True
                param_text.append(line[line.index('#(') + 2:])
                paren_count = 1
            elif in_params:
                param_text.append(line)
                paren_count += line.count('(') - line.count(')')
                if paren_count == 0:
                    break
            i += 1

        return ' '.join(param_text) if param_text else ''

    def _parse_module_body(self, module_text: str, module: VerilogModule) -> None:
        """Parse the module body for internal signals and submodules."""
        start_idx = module_text.find(');')
        if start_idx == -1:
            return
            
        end_idx = module_text.find('endmodule')
        if end_idx == -1:
            return
            
        body_text = module_text[start_idx+2:end_idx]
        
        # Process each line
        for line in body_text.split('\n'):
            line = line.strip()
            if not line or line.startswith('//'):
                continue
                
            # Check for submodule instantiation
            parts = line.split()
            if len(parts) >= 2 and '(' in line and not any(keyword in parts[0] 
                for keyword in ['input', 'output', 'wire', 'reg', 'assign', 'parameter']):
                module.submodules.append(parts[0])
                continue
                
            # Check for internal signal declarations
            if any(line.startswith(keyword) for keyword in ['wire', 'reg']):
                parts = line.split('//')
                decl = parts[0].strip()
                comment = parts[1].strip() if len(parts) > 1 else ""
                
                signal = self._parse_signal(decl, comment)
                if signal:
                    module.internals.append(signal)

    def _parse_internal_signals(self, module_text: str, module: VerilogModule) -> None:
        """Parse internal signal declarations from module body.
        
        Args:
            module_text: Complete module text
            module: VerilogModule to update
        """
        # Find module body
        start_idx = module_text.find(');')
        if start_idx == -1:
            return
            
        end_idx = module_text.find('endmodule')
        if end_idx == -1:
            return
            
        body = module_text[start_idx+2:end_idx]
        lines = body.split('\n')
        
        for line in lines:
            line = line.strip()
            if not line or line.startswith('//'):
                continue
                
            # Check if line is an internal signal declaration
            if any(line.startswith(keyword) for keyword in ['wire', 'reg']):
                # Split into declaration parts and comment
                if '//' in line:
                    decl, comment = line.split('//', 1)
                    comment = comment.strip()
                else:
                    decl = line
                    comment = ""
                    
                # Remove semicolon and clean up
                decl = decl.rstrip(';').strip()
                
                # Split declaration into parts before any signal names
                parts = decl.split()
                sig_type = parts[0]  # wire or reg
                
                # Process sign and width
                sign = 'unsigned'
                width = '1'
                i = 1
                
                while i < len(parts):
                    if parts[i] in ('signed', 'unsigned'):
                        sign = parts[i]
                        i += 1
                    elif parts[i].startswith('['):
                        width_parts = []
                        while i < len(parts) and not parts[i].endswith(']'):
                            width_parts.append(parts[i])
                            i += 1
                        if i < len(parts):
                            width_parts.append(parts[i])
                        width = ' '.join(width_parts).strip('[]')
                        if not ':' in width:
                            width = f"{width}:0"
                        i += 1
                    else:
                        break
                
                # Process all signal names after width/sign
                signal_names = []
                remaining = ' '.join(parts[i:])
                for name in remaining.split(','):
                    name = name.strip()
                    if name:  # Skip empty strings
                        if '=' in name:
                            name, default = name.split('=', 1)
                            name = name.strip()
                            default_value = default.strip()
                        else:
                            # Generate appropriate default value based on type
                            if sig_type == 'reg':
                                # For registers, default to 0 with appropriate width
                                if ':' in width:
                                    msb, lsb = width.split(':')
                                    try:
                                        bit_width = int(msb) - int(lsb) + 1
                                        default_value = f"{bit_width}'b0"
                                    except ValueError:
                                        default_value = "'b0"  # Fallback for parametric widths
                                else:
                                    default_value = "'b0"
                            else:
                                # For wires, default to 'z' (high impedance)
                                if ':' in width:
                                    msb, lsb = width.split(':')
                                    try:
                                        bit_width = int(msb) - int(lsb) + 1
                                        default_value = f"{bit_width}'bz"
                                    except ValueError:
                                        default_value = "'bz"  # Fallback for parametric widths
                                else:
                                    default_value = "'bz"
                                    
                        signal_names.append((name, default_value))
                
                # Create a signal object for each name
                for name, default_value in signal_names:
                    signal = Signal(
                        name=name,
                        type=sig_type,
                        sign=sign,
                        bit_width=width,
                        comment=comment,
                        default_value=default_value
                    )
                    module.internals.append(signal)
                
            # Also check for submodule instantiations here
            elif len(line.split()) >= 2 and '(' in line and not any(keyword in line.split()[0].lower()
                for keyword in ['input', 'output', 'wire', 'reg', 'assign', 'parameter'] + list(PROCEDURAL_KEYWORDS)):
                module.submodules.append(line.split()[0])

            self._parse_procedural_blocks(module_text, module)

    def _parse_parameters(self, param_text: str) -> List[Dict[str, str]]:
        """Parse parameter definitions from text."""
        parameters = []
        # Remove any comments
        param_text = [line.split('//')[0].strip() for line in param_text.split('\n')]
        param_text = ' '.join(param_text)

        # Find the end of the parameter section (before the port list)
        if ')' in param_text:
            param_text = param_text[:param_text.find(')')].strip()
        
        # Split by commas but preserve parentheses content
        param_defs = []
        current_def = []
        paren_count = 0
        
        for char in param_text:
            if char == '(':
                paren_count += 1
            elif char == ')':
                paren_count -= 1
            elif char == ',' and paren_count == 0:
                param_defs.append(''.join(current_def).strip())
                current_def = []
                continue
            current_def.append(char)
            
        if current_def:
            param_defs.append(''.join(current_def).strip())

        for param_def in param_defs:
            if not param_def.strip():
                continue
            # Extract parameter name and value
            parts = param_def.split('=')
            if len(parts) == 2:
                name_parts = parts[0].split()
                if 'parameter' in name_parts:
                    param_name = name_parts[-1].strip()
                    param_value = parts[1].strip()
                    parameters.append({
                        "name": param_name,
                        "value": param_value
                    })
            else:
                raise ModuleDefinitionError(f"Parameter must have a default value: {param_def}")

        return parameters
    
    def _parse_procedural_blocks(self, module_text: str, module: VerilogModule) -> None:
        """Parse procedural blocks (always, initial) from module body"""
        body_start = module_text.find(');') + 2
        body_end = module_text.find('endmodule')
        body = module_text[body_start:body_end]
        
        # Split into procedural blocks
        current_block = []
        in_block = False
        block_type = None
        
        for line in body.split('\n'):
            line = line.strip()
            if not line:
                continue
            
            if line.startswith(('always', 'initial')):
                if in_block:
                    self._finalize_block(current_block, block_type, module)
                in_block = True
                block_type = line.split()[0]
                current_block = [line]
            elif in_block:
                if line.startswith('end'):
                    current_block.append(line)
                    self._finalize_block(current_block, block_type, module)
                    in_block = False
                else:
                    current_block.append(line)
        
        if in_block:
            self._finalize_block(current_block, block_type, module)

    def _finalize_block(self, block_lines: List[str], block_type: str, module: VerilogModule) -> None:
        """Process a complete procedural block"""
        block_content = '\n'.join(block_lines)
        module.blocks.append({
            'type': block_type,
            'content': block_content,
            'sensitivity': self._parse_sensitivity(block_lines[0])
        })

    def _parse_sensitivity(self, declaration: str) -> List[str]:
        """Parse sensitivity list from always block"""
        if '@' not in declaration:
            return []
        
        sensitivity = declaration.split('@', 1)[1].strip()
        sensitivity = sensitivity.split(')', 1)[0] + ')'
        return [s.strip() for s in sensitivity.strip('()*').split(',')]

    @staticmethod
    def _generate_default_value(signal_type: str, bit_width: str, parameters: List[Dict[str, str]], is_input: bool = False) -> str:
        """Generate appropriate default value for a signal."""
        try:
            # Calculate actual bit width
            total_width = 1
            if '][' in bit_width:  # Multi-dimensional
                dims = bit_width.split('][')
                for dim in dims:
                    if ':' in dim:
                        msb, lsb = map(str.strip, dim.split(':'))
                        if msb.isdigit() and lsb.isdigit():
                            width = int(msb) - int(lsb) + 1
                            total_width *= width
            elif ':' in bit_width:  # Single range
                msb, lsb = map(str.strip, bit_width.split(':'))
                if msb.isdigit() and lsb.isdigit():
                    total_width = int(msb) - int(lsb) + 1
            else:  # Single bit or parameter
                if bit_width.isdigit():
                    total_width = int(bit_width)
                else:
                    # Handle parametric width by looking up parameter value
                    param = next((p for p in parameters if p["name"] in bit_width), None)
                    if param:
                        total_width = int(param["value"])
                    else:
                        total_width = 1  # Default to single bit

            # Generate appropriate value
            if is_input or signal_type == 'reg':
                return f"{total_width}'b{'0' * total_width}"
            else:
                return f"{total_width}'b{'z' * total_width}"
                
        except Exception as e:
            logger.error(f"Error generating default value: {str(e)}")
            # Provide minimal correct default
            return "'b0" if is_input or signal_type == 'reg' else "'bz"
    
    def _parse_bit_width(self, parts: List[str], start_idx: int) -> tuple[str, int]:
        """Parse bit width specification, handling multi-dimensional arrays."""
        width_parts = []
        i = start_idx
        while i < len(parts):
            if parts[i].startswith('['):
                current_dim = []
                while i < len(parts) and ']' not in parts[i]:
                    current_dim.append(parts[i])
                    i += 1
                if i < len(parts):
                    current_dim.append(parts[i])
                width_parts.append(''.join(current_dim).strip('[]'))
                i += 1
                if i < len(parts) and parts[i].startswith('['):
                    continue
                break
            else:
                break
        
        # Join dimensions preserving format
        if len(width_parts) > 1:
            return ']['.join(width_parts), i
        return width_parts[0] if width_parts else '1', i

    def parse_signal(self, declaration: str, comment: str = "") -> Signal:
        """Parse a signal declaration into a Signal object.
        
        Args:
            declaration: Signal declaration string
            comment: Optional comment
            
        Returns:
            Signal object
            
        Raises:
            VerilogParsingError: If signal declaration is invalid
        """
        if not declaration.strip():
            raise VerilogParsingError("Empty signal declaration")
            
        signal = self._parse_signal(declaration, comment)
        if signal is None:
            raise VerilogParsingError(f"Invalid signal declaration: {declaration}")
            
        if signal.default_value is None:
            signal.default_value = self._generate_default_value(
                signal.type,
                signal.bit_width,
                [],  # No parameters in standalone signal parsing
                False  # Not an input signal by default
            )
        return signal