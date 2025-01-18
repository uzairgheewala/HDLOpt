# HDLOpt

HDLOpt is a comprehensive toolset for optimizing and analyzing hardware description language (HDL) code, with a focus on Verilog. It provides robust parsing, analysis, and optimization capabilities for HDL designs.

## Table of Contents

1. [Installation](#installation)
2. [Features](#features)
3. [Usage](#usage)
4. [Architecture](#architecture)
5. [Module Documentation](#module-documentation)
6. [Contributing](#contributing)
7. [License](#license)

## Installation

```bash
# Installation instructions will be added here
```

## Features

- **Robust Verilog Parsing**: Multi-mode parsing engine with native and PyVerilog backends
- **Modular Pattern Matching**: Flexible pattern matching for HDL code analysis
- **JSON Serialization**: Standardized format for storing and exchanging HDL component data
- **Comprehensive Testing**: Extensive test suite ensuring reliability
- _(Future features will be added here)_

## Usage

### Parsing Verilog Files

HDLOpt provides two parsing modes: native parsing and PyVerilog-based parsing. Here's how to use them:

```python
from hdlopt.scripts.parsing import VerilogParser, ParserMode

# Using native parser (default)
parser = VerilogParser(mode=ParserMode.NATIVE)
modules = parser.parse_file("path/to/your/design.v")

# Using PyVerilog parser (if PyVerilog is installed)
parser = VerilogParser(mode=ParserMode.PYVERILOG)
modules = parser.parse_file("path/to/your/design.v")
```

### Working with Parsed Modules

Once you've parsed a Verilog file, you can work with the module objects:

```python
for module in modules:
    # Access module properties
    print(f"Module name: {module.name}")
    print(f"Parameters: {module.parameters}")
    print(f"Inputs: {[input.name for input in module.inputs]}")
    print(f"Outputs: {[output.name for output in module.outputs]}")
    
    # Serialize to JSON
    module.serialize_to_json("output.json")
```

### JSON Output Format

The parser produces standardized JSON output for each module. Here's an example:

```json
{
    "component_name": "complex_alu",
    "parameters": [
        {
            "name": "WIDTH",
            "value": "8",
            "description": "Data width parameter"
        }
    ],
    "inputs": [
        {
            "name": "clk",
            "type": "wire",
            "sign": "unsigned",
            "bit_width": "1",
            "comment": "System clock",
            "default_value": "1'b0"
        }
    ],
    "outputs": [...],
    "internals": [...],
    "mode": "sequential",
    "submodules": ["full_adder", "carry_lookahead"]
}
```

## Architecture

### Parser Architecture

The parsing system is built with a flexible, extensible architecture:

- **Base Parser Interface**: Defined in `VerilogParserBase`
- **Implementation Modes**:
  - Native Parser: Pure Python implementation using regex and state machines
  - PyVerilog Parser: Wrapper around PyVerilog's parsing capabilities
- **Core Components**:
  - Signal Class: Represents Verilog signals (inputs, outputs, wires, regs)
  - VerilogModule Class: Represents complete Verilog module structure
  - Pattern Matching System: Flexible pattern matching for code analysis

### Pattern Matching System

The pattern matching system supports multiple strategies:

- **String Matching**: Exact string comparison
- **Substring Matching**: Partial string matching with optional count constraints
- **Regex Matching**: Regular expression-based pattern matching

## Module Documentation

### Parsing Module

#### VerilogParser Class

Primary interface for parsing Verilog files.

```python
class VerilogParser:
    def __init__(self, mode: ParserMode = ParserMode.NATIVE, **kwargs):
        """Initialize parser with specified mode."""
        
    def parse_file(self, filepath: str) -> List[VerilogModule]:
        """Parse a Verilog file and return list of modules."""
        
    def serialize_module_details(self, module: VerilogModule, output_path: str):
        """Serialize module details to JSON."""
```

#### Signal Class

Represents a Verilog signal with its properties.

```python
@dataclass
class Signal:
    name: str           # Signal name
    type: str          # Signal type (wire/reg)
    sign: str          # Signal sign (signed/unsigned)
    bit_width: str     # Bit width specification
    comment: str       # Associated comment
    default_value: Optional[str]  # Default value if specified
```

#### VerilogModule Class

Represents a parsed Verilog module.

```python
class VerilogModule:
    name: str                  # Module name
    parameters: List[Dict]     # Module parameters
    inputs: List[Signal]       # Input signals
    outputs: List[Signal]      # Output signals
    internals: List[Signal]    # Internal signals
    mode: str                 # Circuit mode (combinational/sequential)
    submodules: List[str]     # Instantiated submodules
```

## Contributing

_(Contributing guidelines will be added here)_

## License

_(License information will be added here)_