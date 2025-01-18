"""Data models for Verilog parsing.

This module contains the core data structures used to represent Verilog modules
and their components (signals, parameters, etc.).
"""

from dataclasses import dataclass
from typing import List, Dict, Optional, Union
from datetime import datetime
from .exceptions import SerializationError

@dataclass
class Signal:
    """Represents a Verilog signal with its properties.
    
    Attributes:
        name (str): Signal name
        type (str): Signal type (wire/reg)
        sign (str): Signal sign (signed/unsigned)
        bit_width (str): Bit width specification
        comment (str): Associated comment
        default_value (Optional[str]): Default value if specified
    """
    name: str
    type: str
    sign: str = "unsigned"
    bit_width: str = "1"
    comment: str = ""
    default_value: Optional[str] = None

    def to_dict(self) -> Dict:
        """Convert the signal to a dictionary representation."""
        return {
            "name": self.name,
            "type": self.type,
            "sign": self.sign,
            "bit_width": self.bit_width,
            "comment": self.comment,
            "default_value": self.default_value
        }

    @classmethod
    def from_dict(cls, data: Dict) -> 'Signal':
        """Create a Signal instance from a dictionary."""
        return cls(
            name=data["name"],
            type=data["type"],
            sign=data.get("sign", "unsigned"),
            bit_width=data.get("bit_width", "1"),
            comment=data.get("comment", ""),
            default_value=data.get("default_value")
        )

class VerilogModule:
    """Represents a parsed Verilog module with all its components.
    
    Attributes:
        name (str): Module name
        parameters (List[Dict]): Module parameters
        inputs (List[Signal]): Input signals
        outputs (List[Signal]): Output signals
        internals (List[Signal]): Internal signals
        mode (str): Circuit mode (combinational/sequential)
        submodules (List[str]): Instantiated submodules
    """
    def __init__(self, name: str):
        self.name: str = name
        self.parameters: List[Dict[str, str]] = []
        self.inputs: List[Signal] = []
        self.outputs: List[Signal] = []
        self.internals: List[Signal] = []
        self.mode: str = "combinational"
        self.submodules: List[str] = []
        self._metadata: Dict = {
            "parse_time": datetime.utcnow().isoformat(),
            "parser_version": "1.0.0"
        }

    def set_file_metadata(self, file_path: str, last_modified: Optional[str] = None):
        """Set file-related metadata."""
        self._metadata["file_path"] = file_path
        if last_modified:
            self._metadata["last_modified"] = last_modified

    def add_parameter(self, name: str, value: str, description: str = ""):
        """Add a parameter to the module."""
        self.parameters.append({
            "name": name,
            "value": value,
            "description": description
        })

    def add_signal(self, signal: Signal, signal_type: str):
        """Add a signal to the appropriate list based on type."""
        if signal_type == "input":
            self.inputs.append(signal)
        elif signal_type == "output":
            self.outputs.append(signal)
        elif signal_type == "internal":
            self.internals.append(signal)
        else:
            raise ValueError(f"Invalid signal type: {signal_type}")

    def add_submodule(self, submodule_name: str):
        """Add a submodule to the module."""
        if submodule_name not in self.submodules:
            self.submodules.append(submodule_name)

    def get_dependencies(self) -> Dict[str, List[str]]:
        """Get module dependencies."""
        direct_deps = [f"{submod}.v" for submod in self.submodules]
        param_deps = [param["name"] for param in self.parameters]
        return {
            "direct": direct_deps,
            "parameters": param_deps
        }

    def to_dict(self) -> Dict:
        """Convert the module to a dictionary representation."""
        try:
            return {
                "component_name": self.name,
                "parameters": self.parameters,
                "inputs": [signal.to_dict() for signal in self.inputs],
                "outputs": [signal.to_dict() for signal in self.outputs],
                "internals": [signal.to_dict() for signal in self.internals],
                "mode": self.mode,
                "submodules": self.submodules,
                "metadata": self._metadata,
                "dependencies": self.get_dependencies()
            }
        except Exception as e:
            raise SerializationError(f"Failed to serialize module {self.name}: {str(e)}")

    @classmethod
    def from_dict(cls, data: Dict) -> 'VerilogModule':
        """Create a VerilogModule instance from a dictionary."""
        module = cls(name=data["component_name"])
        module.parameters = data["parameters"]
        module.inputs = [Signal.from_dict(s) for s in data["inputs"]]
        module.outputs = [Signal.from_dict(s) for s in data["outputs"]]
        module.internals = [Signal.from_dict(s) for s in data["internals"]]
        module.mode = data["mode"]
        module.submodules = data["submodules"]
        if "metadata" in data:
            module._metadata = data["metadata"]
        return module