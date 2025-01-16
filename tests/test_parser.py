import pytest
from typing import List
import subprocess
import logging
from ..scripts.parser import (
    VerilogParser, ParserMode, VerilogModule, Signal,
    VerilogParsingError, ModuleDefinitionError, SignalDeclarationError,
    FileProcessingError, PYVERILOG_AVAILABLE
)
import json

@pytest.fixture
def test_tmpdir(tmpdir):
    return tmpdir

@pytest.fixture
def complex_verilog_file(tmpdir):
    """Create a complex Verilog file with multiple modules and various signal types."""
    content = """
    // First module with complex signals
    module complex_alu #(
        parameter WIDTH = 8,
        parameter MODE = 2'b00
    ) (
        // Clock and control
        input wire clk,          // System clock
        input wire rst_n,        // Active low reset
        
        // Data inputs
        input wire signed [WIDTH-1:0] a,  // First operand
        input wire signed [WIDTH-1:0] b,  // Second operand
        input wire [1:0] op,             // Operation select
        
        // Status outputs
        output reg valid,        // Output valid flag
        output wire zero,        // Zero flag
        output wire overflow,    // Overflow flag
        
        // Result output
        output reg signed [WIDTH-1:0] result     // Operation result
    );
        // Internal signals
        wire signed [WIDTH:0] temp_sum;
        reg [3:0] state, next_state;
        
        // Initial values
        initial begin
            a = 8'b0;
            b = 8'b0;
            op = 2'b00;
        end
        
        // Submodule instantiation
        full_adder fa1(
            .a(a[0]),
            .b(b[0]),
            .cin(1'b0),
            .sum(result[0]),
            .cout(temp_carry)
        );
        
        // Module implementation
        assign temp_sum = a + b;
        
    endmodule

    // Second module - simple combinational
    module simple_add (
        input [3:0] x,
        input [3:0] y,
        output [4:0] sum
    );
        assign sum = x + y;
    endmodule
    """
    verilog_file = tmpdir.join("complex.v")
    verilog_file.write(content)
    return str(verilog_file)

@pytest.fixture
def edge_case_verilog_file(tmpdir):
    """Create a Verilog file with edge cases and unusual constructs."""
    content = """
    module edge_case #(
        parameter REALLY_LONG_PARAMETER_NAME_1234567890 = 32'hDEADBEEF,
        parameter [1:0] PACKED_PARAM = 2'b10
    ) (
        // Empty signals array
        input wire [],
        // Multi-dimensional arrays
        input wire [2:0][3:0] matrix_in,
        // Signal with unusual characters
        input wire _valid_$signal,
        // Multiple signals in one line
        input wire a, b, c, d,
        // Output with strange spacing
        output      reg     [  7 : 0  ]    strange_spacing,
        // Signal with all optional parts
        input wire signed [WIDTH-1:0] complete_signal = DEFAULT_VAL // Comment
    );
        // Declare signals with same name as parameters
        wire [7:0] PACKED_PARAM;
        reg [3:0] matrix_in;
    endmodule
    """
    verilog_file = tmpdir.join("edge_case.v")
    verilog_file.write(content)
    return str(verilog_file)

@pytest.fixture
def invalid_verilog_file(tmpdir):
    """Create an invalid Verilog file to test error handling."""
    content = """
    // Missing mod name
    module (
        input clk,
        output reg [3:0] count
    );
        // Unclosed block
        always @(posedge clk) begin
            count <= count + 1;
        // Missing endmod
    """
    verilog_file = tmpdir.join("invalid.v")
    verilog_file.write(content)
    return str(verilog_file)

def test_multiple_modules_parsing(complex_verilog_file):
    """Test parsing of multiple modules from a single file."""
    parser = VerilogParser(mode=ParserMode.NATIVE)
    modules = parser.parse_file(complex_verilog_file)
    
    assert len(modules) == 2, "Should parse two modules"
    assert modules[0].name == "complex_alu"
    assert modules[1].name == "simple_add"
    
    # Check complex_alu module
    alu = modules[0]
    assert len(alu.parameters) == 2
    assert len(alu.inputs) == 5
    assert len(alu.outputs) == 4
    assert len(alu.internals) == 3
    assert alu.mode == "sequential"
    
    # Check simple_add module
    adder = modules[1]
    assert len(adder.parameters) == 0
    assert len(adder.inputs) == 2
    assert len(adder.outputs) == 1
    assert adder.mode == "combinational"

def test_signal_attributes():
    """Test creation and attributes of Signal objects."""
    signal = Signal(
        name="data",
        type="wire",
        sign="signed",
        bit_width="7:0",
        comment="Test signal",
        default_value="8'b0"
    )
    
    assert signal.name == "data"
    assert signal.type == "wire"
    assert signal.sign == "signed"
    assert signal.bit_width == "7:0"
    assert signal.comment == "Test signal"
    assert signal.default_value == "8'b0"

def test_complex_signal_declarations(complex_verilog_file):
    """Test parsing of complex signal declarations."""
    parser = VerilogParser(mode=ParserMode.NATIVE)
    module = parser.parse_file(complex_verilog_file)[0]
    
    # Check parametric width signal
    a_input = next(s for s in module.inputs if s.name == "a")
    assert a_input.bit_width == "WIDTH-1:0"
    assert a_input.sign == "signed"
    assert a_input.default_value == "8'b0"
    
    # Check multi-bit signal
    op_input = next(s for s in module.inputs if s.name == "op")
    assert op_input.bit_width == "1:0"
    
    # Check internal state registers
    state_reg = next(s for s in module.internals if s.name == "state")
    assert state_reg.type == "reg"
    assert state_reg.bit_width == "3:0"

def test_edge_cases(edge_case_verilog_file):
    """Test parsing of edge cases and unusual constructs."""
    parser = VerilogParser(mode=ParserMode.NATIVE)
    module = parser.parse_file(edge_case_verilog_file)[0]
    
    # Check long parameter name
    assert any(p["name"] == "REALLY_LONG_PARAMETER_NAME_1234567890" 
              for p in module.parameters)
    
    # Check unusual signal names
    assert any(s.name == "_valid_$signal" for s in module.inputs)
    
    # Check multi-dimensional arrays
    matrix = next(s for s in module.inputs if s.name == "matrix_in")
    assert matrix.bit_width == "2:0"  # Should capture outer dimension

def test_error_handling(invalid_verilog_file, caplog):
    """Test error handling for invalid Verilog files."""
    parser = VerilogParser(mode=ParserMode.NATIVE)

    # Test invalid file path
    with pytest.raises(FileProcessingError):
        parser.parse_file("nonexistent.v")

    # Test invalid module definition
    malformed_verilog = """module incomplete(
input clk,
output reg [3:0] count
// Notice we never close the port parenthesis or add endmod
begin // Missing ) altogether
    always @(posedge clk)
        count <= count + 1;
end
"""  # No endmodule, no indentation, trailing newline

    with open(invalid_verilog_file, 'w') as f:
        f.write(malformed_verilog)

    # Read back the file and print to verify
    with open(invalid_verilog_file, 'r') as f:
        file_content = f.read()
    print(f"Invalid Verilog file content:\n{file_content}")

    # Capture logs while parsing the invalid module
    with caplog.at_level(logging.DEBUG):
        try:
            parser.parse_file(invalid_verilog_file)
        except ModuleDefinitionError as e:
            # Check if the error message contains 'endmodule'
            assert "endmodule" in str(e).lower(), "Error message should mention missing 'endmodule'"
            # Inspect captured logs
            print(f"Logged errors:\n{caplog.text}")
            print(f"Raised ModuleDefinitionError: {e}")
        except Exception as e:
            # Print unexpected exceptions
            print(f"Raised unexpected exception: {e}")
            raise
        else:
            # If no exception is raised, fail the test
            pytest.fail("ModuleDefinitionError was not raised for invalid module")
            
def _is_iverilog_available():
    """Check if iverilog is available in the system path."""
    try:
        subprocess.run(['iverilog', '--version'], 
                      stdout=subprocess.PIPE, 
                      stderr=subprocess.PIPE)
        return True
    except FileNotFoundError:
        return False

IVERILOG_AVAILABLE = _is_iverilog_available()

@pytest.mark.skipif(not PYVERILOG_AVAILABLE or not IVERILOG_AVAILABLE,
                    reason="PyVerilog or iverilog not installed")
class TestPyVerilogParser:
    """Test suite for PyVerilog parser implementation."""
    
    def test_pyverilog_parsing(self, complex_verilog_file):
        """Test basic PyVerilog parsing functionality."""
        parser = VerilogParser(mode=ParserMode.PYVERILOG)
        modules = parser.parse_file(complex_verilog_file)
        
        assert len(modules) == 2
        assert all(isinstance(module, VerilogModule) for module in modules)
    
    def test_pyverilog_signal_parsing(self, complex_verilog_file):
        """Test signal parsing using PyVerilog."""
        parser = VerilogParser(mode=ParserMode.PYVERILOG)
        module = parser.parse_file(complex_verilog_file)[0]
        
        # Check signal parsing
        clk = next(s for s in module.inputs if s.name == "clk")
        assert isinstance(clk, Signal)
        assert clk.type == "wire"

def test_mode_detection(test_tmpdir):
    """Test detection of sequential vs combinational circuits."""
    parser = VerilogParser(mode=ParserMode.NATIVE)
    
    # Test sequential detection
    seq_module = """
    module sequential(
        input wire clk,    // Clock input
        input wire data,   // Data input
        output reg out     // Registered output
    );
    endmodule
    """
    
    # Test combinational detection
    comb_module = """
    module combinational(
        input wire a,      // First input
        input wire b,      // Second input
        output wire sum    // Sum output
    );
    endmodule
    """
    
    def test_module(content, expected_mode):
        vfile = test_tmpdir.join(f"{expected_mode}.v")
        vfile.write(content)
        module = parser.parse_file(str(vfile))[0]
        assert module.mode == expected_mode
    
    test_module(seq_module, "sequential")
    test_module(comb_module, "combinational")

def test_submodule_detection(complex_verilog_file):
    """Test detection of submodule instantiations."""
    parser = VerilogParser(mode=ParserMode.NATIVE)
    module = parser.parse_file(complex_verilog_file)[0]
    
    assert "full_adder" in module.submodules
    assert len(module.submodules) == 1

def test_serialization(complex_verilog_file, tmpdir):
    """Test serialization of parsed modules to JSON."""
    parser = VerilogParser(mode=ParserMode.NATIVE)
    module = parser.parse_file(complex_verilog_file)[0]
    
    output_path = tmpdir.join("module.json")
    parser.serialize_module_details(module, str(output_path))
    
    # Read back and verify
    with open(str(output_path), 'r') as f:
        data = json.load(f)
    
    assert data["component_name"] == module.name
    assert len(data["inputs"]) == len(module.inputs)
    assert len(data["outputs"]) == len(module.outputs)
    assert data["mode"] == module.mode