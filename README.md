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

## Prerequisites

- Python 3.8+
- Git
- One of the following HDL simulators:
  - ModelSim/Questa (recommended)
  - Icarus Verilog (iverilog)
- For resource analysis:
  - Yosys synthesis tool
  - OSS CAD Suite (recommended for Windows users)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/hdlopt.git
cd hdlopt
```

2. Create and activate a virtual environment:
```bash
# On Linux/MacOS
python -m venv venv
source venv/bin/activate

# On Windows
python -m venv venv
venv\Scripts\activate
```

3. Install required packages:
```bash
pip install -r requirements.txt
```

4. Optional: Install PyVerilog for enhanced parsing capabilities:
```bash
pip install pyverilog
```

### Environment Setup

#### ModelSim/Questa Setup
1. Ensure ModelSim/Questa is installed and added to system PATH
2. Verify installation:
```bash
vlog -version
vsim -version
```

#### Icarus Verilog Setup
1. Install Icarus Verilog:
```bash
# Ubuntu/Debian
sudo apt-get install iverilog

# MacOS
brew install icarus-verilog

# Windows
# Download installer from http://bleyer.org/icarus/
```
2. Verify installation:
```bash
iverilog -v
```

#### Yosys Setup
1. Install Yosys:
```bash
# Ubuntu/Debian
sudo apt-get install yosys

# MacOS
brew install yosys

# Windows
# Install OSS CAD Suite from https://github.com/YosysHQ/oss-cad-suite-build
```
2. Verify installation:
```bash
yosys --version
```

## Features

- **Robust Verilog Parsing**: Multi-mode parsing engine with native and PyVerilog backends
- **Modular Pattern Matching**: Flexible pattern matching for HDL code analysis
- **JSON Serialization**: Standardized format for storing and exchanging HDL component data
- **Comprehensive Testing**: Extensive test suite ensuring reliability
- **Automated Testbench Generation**: Intelligent testbench creation with configurable parameters
- **Resource Usage Analysis**: Design analysis using Yosys with detailed metrics
- **Timing Analysis**: Critical path and timing constraint analysis using Vivado
- **Power Analysis**: Dynamic and static power analysis with supply usage details
- **Waveform Analysis**: VCD waveform parsing and visualization with timing checks
- **Schematic Generation**: Gate-level schematic visualization using Yosys+Graphviz and Vivado
- **Comprehensive Reporting**: PDF report generation for all analysis results
- **Recursive Analysis**: Support for hierarchical designs and submodule analysis

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

### Testbench Generation

The testbench generator creates comprehensive testbenches for Verilog modules:

```python
from hdlopt.scripts.testbench.core import TestbenchGenerator
from hdlopt.rules.base import Rule

# Create generator with rules
generator = TestbenchGenerator(
    component_name="adder",
    rules=[AdderRule()],
    constraints=ConstraintConfig(
        param_constraints={"adder": lambda n: n <= 64},
        input_constraints={"adder": {"a": lambda r: r[0] >= 0}}
    ),
    timing=TimingConfig(
        clk_period=10,
        operation_delay=20
    )
)

# Generate testbenches
generator.generate(recursive=True)  # Also generates for submodules
```

### Advanced Analysis

#### Resource Analysis

Analyze HDL designs using the ResourceAnalyzer:

#### Timing Analysis

Analyze timing constraints and critical paths using Vivado:

```python
from hdlopt.scripts.analysis.timing import TimingAnalyzer, TimingConfig

# Configure timing analysis
config = TimingConfig(
    clk_period={"clk": 10, "clk_div2": 20},  # Clock periods in ns
    operation_delay=5,
    rule_delay={"adder": "wait(valid);"}
)

# Create analyzer and run analysis
analyzer = TimingAnalyzer("adder", config)
results = analyzer.analyze()
```

#### Power Analysis

Analyze power consumption:

```python
from hdlopt.scripts.analysis.power import PowerAnalyzer, PowerConfig

# Configure power analysis
config = PowerConfig(
    temperature=85.0,  # Junction temperature
    process="typical",
    toggle_rate=0.5
)

# Create analyzer and run analysis
analyzer = PowerAnalyzer("adder", config)
results = analyzer.analyze()
```

#### Waveform Analysis

Analyze VCD waveforms:

```python
from hdlopt.scripts.analysis.waveform import WaveformAnalyzer, WaveformConfig

# Configure waveform analysis
config = WaveformConfig(
    signals=["clk", "rst", "data_in", "data_out"],
    include_value_changes=True,
    include_timing_violations=True
)

# Create analyzer and analyze VCD file
analyzer = WaveformAnalyzer("adder", config)
results = analyzer.analyze("simulation.vcd")
```

#### Schematic Generation

Generate gate-level schematics using either Yosys+Graphviz or Vivado:

```python
from hdlopt.scripts.analysis.schematic import (
    SchematicGenerator, SchematicConfig, SchematicTool, SchematicFormat
)

# Using Yosys + Graphviz
config = SchematicConfig(
    tool=SchematicTool.YOSYS,
    format=SchematicFormat.PNG,
    graph_attrs={'rankdir': 'LR'}
)

# Generate schematic
generator = SchematicGenerator("adder", config)
schematic_path = generator.generate()

# Using Vivado
vivado_config = SchematicConfig(
    tool=SchematicTool.VIVADO,
    format=SchematicFormat.PDF
)
vivado_gen = SchematicGenerator("adder", vivado_config)
vivado_path = vivado_gen.generate()

```python
from hdlopt.scripts.analysis.resource import ResourceAnalyzer, ResourceAnalysisConfig

# Configure analysis
config = ResourceAnalysisConfig(
    increment_rules={
        "adder": {
            "param_name": "WIDTH",
            "cell_type": "full_adder",
            "increment_per_param": 1,
            "base_value": 4
        }
    },
    recursive=True
)

# Create analyzer and run analysis
analyzer = ResourceAnalyzer("adder", config)
results = analyzer.analyze()
```

### Testbench Runner

Execute generated testbenches:

```python
from hdlopt.scripts.testbench.runner import TestbenchRunner

# Create runner
runner = TestbenchRunner(
    simulator="modelsim",  # or "iverilog"
    timeout=300
)

# Run testbenches recursively
results = runner.run_recursive(
    component_name="adder",
    base_dir="generated",
    force_recompile=False
)

# Check results
for result in results:
    print(f"Component: {result.component_name}")
    print(f"Tests passed: {result.passed_tests}/{result.num_tests}")
```

### Analysis Outputs

#### Resource Analysis Output

The resource analyzer produces detailed metrics in JSON format:

#### Timing Analysis Output

The timing analyzer produces timing path and constraint analysis data:

```json
{
    "timing_summary": {
        "wns": -2.5,        // Worst Negative Slack
        "tns": -10.3,       // Total Negative Slack
        "whs": 0.5,         // Worst Hold Slack
        "failing_endpoints": 3,
        "total_endpoints": 100
    },
    "clock_summary": [{
        "name": "clk",
        "period": 10.0,
        "wns": -2.5,
        "tns": -5.2,
        "failing_endpoints": 2
    }],
    "path_groups": [...],
    "inter_clock": [...]
}
```

#### Power Analysis Output

The power analyzer provides detailed power consumption data:

```json
{
    "summary": {
        "total_on_chip": 1.5,     // Watts
        "dynamic": 0.8,
        "static": 0.7,
        "effective_thetaja": 28.4,
        "junction_temp": 85.0
    },
    "on_chip_components": [{
        "name": "Clocking",
        "power": 0.2,
        "used": 1,
        "utilization": 25.0
    }],
    "power_supply": [{
        "source": "Vccint",
        "voltage": 1.0,
        "total_current": 0.5,
        "dynamic_current": 0.3,
        "static_current": 0.2
    }]
}
```

#### Waveform Analysis Output

The waveform analyzer provides timing and signal analysis data:

```json
{
    "signals": {
        "clk": {
            "transitions": 1000,
            "toggle_rate": 0.5,
            "min_pulse_width": 4.2
        }
    },
    "timing_violations": [{
        "type": "setup",
        "time": 156.2,
        "slack": -0.5,
        "source": "reg1",
        "destination": "reg2"
    }],
    "glitches": [{
        "signal": "data",
        "time": 245.8,
        "width": 0.6
    }]
}

```json
{
    "4": {  // WIDTH=4 configuration
        "test_module": {
            "wire_count": 10,
            "wire_bits": 32,
            "port_count": 5,
            "port_bits": 16,
            "cell_count": 3,
            "hierarchy_depth": 2,
            "cells": {
                "full_adder": 2,
                "half_adder": 1
            },
            "raw_gates": {
                "$_AND_": 4,
                "$_XOR_": 2
            },
            "sub_modules": {
                "half_adder": 1
            }
        }
    }
}
```

### PDF Reports

HDLOpt generates comprehensive PDF reports for all analysis types:

- **Testbench Reports**: Include test configurations, pass/fail statistics, and detailed test case results
- **Resource Reports**: Show resource utilization with:
  - Gate-level metrics
  - Hierarchy analysis
  - Cell usage statistics
  - Raw gate counts
- **Timing Reports**: Include:
  - Setup/hold timing analysis
  - Clock domain summaries
  - Critical path details
  - Inter-clock transfers
- **Power Reports**: Show:
  - On-chip power breakdown
  - Supply voltage/current analysis
  - Thermal metrics
  - Component-level power usage
- **Waveform Reports**: Display:
  - Signal transition analysis
  - Timing violation details
  - Glitch detection
  - Clock domain analysis
- **Schematic Reports**: Present:
  - Gate-level diagrams
  - Hierarchical views
  - Module interconnections
  - Signal flow visualization

- **Testbench Reports**: Include test configurations, pass/fail statistics, and detailed test case results
- **Resource Reports**: Show resource utilization across different parameter configurations with:
  - Gate-level metrics
  - Hierarchy analysis
  - Cell usage statistics
  - Raw gate counts

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
    
### Testbench Generator Module

#### TestbenchGenerator Class

Generates parameterized testbenches for Verilog modules.

```python
class TestbenchGenerator:
    def __init__(
        self,
        component_name: str,
        rules: List[Rule],
        constraints: Optional[ConstraintConfig] = None,
        timing: Optional[TimingConfig] = None,
        signals: Optional[SignalConfig] = None,
        base_dir: str = "generated"
    ):
        """Initialize testbench generator."""
        
    def generate(self, recursive: bool = False) -> None:
        """Generate testbench(es) for component(s)."""
```

#### TestbenchRunner Class

Executes generated testbenches and collects results.

```python
class TestbenchRunner:
    def __init__(
        self,
        simulator: str = "modelsim",
        work_dir: Optional[str] = None,
        timeout: int = 300
    ):
        """Initialize testbench runner."""
        
    def run_recursive(
        self, 
        component_name: str,
        base_dir: str = "generated",
        force_recompile: bool = False
    ) -> List[TestbenchResult]:
        """Run all testbenches recursively."""
```

### Analysis Modules

#### TimingAnalyzer Class

Performs timing analysis using Vivado.

```python
class TimingAnalyzer:
    def __init__(
        self,
        component_name: str,
        config: Optional[TimingConfig] = None,
        base_dir: Optional[str] = None
    ):
        """Initialize timing analyzer."""
        
    def analyze(self) -> Dict:
        """Run timing analysis and generate report."""
```

#### PowerAnalyzer Class

Analyzes power consumption using Vivado.

```python
class PowerAnalyzer:
    def __init__(
        self,
        component_name: str,
        config: Optional[PowerConfig] = None,
        base_dir: Optional[str] = None
    ):
        """Initialize power analyzer."""
        
    def analyze(self) -> Dict:
        """Run power analysis and generate report."""
```

#### WaveformAnalyzer Class

Analyzes VCD waveform files.

```python
class WaveformAnalyzer:
    def __init__(
        self,
        component_name: str,
        config: Optional[WaveformConfig] = None,
        base_dir: Optional[str] = None
    ):
        """Initialize waveform analyzer."""
        
    def analyze(self, vcd_file: Path) -> Dict:
        """Analyze VCD file and generate report."""
```

#### SchematicGenerator Class

Generates gate-level schematics using Yosys+Graphviz or Vivado.

```python
class SchematicGenerator:
    def __init__(
        self,
        component_name: str,
        config: Optional[SchematicConfig] = None,
        base_dir: Optional[str] = None
    ):
        """Initialize schematic generator."""
        
    def generate(self) -> Path:
        """Generate schematic and return file path."""
```

### Resource Analysis Module

#### ResourceAnalyzer Class

Analyzes HDL design resource usage using Yosys.

```python
class ResourceAnalyzer:
    def __init__(
        self, 
        component_name: str,
        config: Optional[ResourceAnalysisConfig] = None,
        base_dir: Optional[str] = None
    ):
        """Initialize resource analyzer."""
        
    def analyze(self) -> Dict:
        """Run resource analysis and generate report."""
```

#### ModuleMetrics Class

Contains resource usage metrics for a module.

```python
@dataclass
class ModuleMetrics:
    wire_count: int = 0
    wire_bits: int = 0
    port_count: int = 0
    port_bits: int = 0
    cell_count: int = 0
    hierarchy_depth: int = 0
    cells: Dict[str, int] = None        # Cell type counts
    raw_gates: Dict[str, int] = None    # Gate-level counts
    sub_modules: Dict[str, int] = None  # Submodule instance counts
```

## Contributing

_(Contributing guidelines will be added here)_

## License

_(License information will be added here)_