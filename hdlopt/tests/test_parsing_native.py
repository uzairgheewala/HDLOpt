"""Tests for native Verilog parser implementation."""

import pytest
from textwrap import dedent
from ..scripts.parsing.native import NativeVerilogParser
from ..scripts.parsing.models import Signal, VerilogModule
from ..scripts.parsing.exceptions import (
    VerilogParsingError,
    ModuleDefinitionError,
    FileProcessingError,
)


@pytest.fixture
def parser():
    """Create a native parser instance for testing."""
    return NativeVerilogParser()


@pytest.fixture
def sample_module_text():
    """Create a sample Verilog module text for testing."""
    return dedent(
        """
        module test_module #(
            parameter WIDTH = 8,
            parameter SIGNED = 0
        ) (
            input wire clk,          // System clock
            input wire rst_n,        // Active low reset
            input wire [WIDTH-1:0] a,  // Input a
            output reg [WIDTH-1:0] result = 0  // Result
        );
            // Internal signals
            wire [WIDTH:0] temp;
            reg [3:0] state;
            
            // Submodule instance
            adder add1 (
                .a(a),
                .b(temp),
                .sum(result)
            );
            
        endmodule
    """
    )


def test_split_into_modules(parser):
    """Test splitting file content into module definitions."""
    content = """
    module mod1;
    endmodule
    
    module mod2;
    endmodule
    """
    modules = parser._split_into_modules(content)
    assert len(modules) == 2
    assert "module mod1" in modules[0]
    assert "module mod2" in modules[1]


def test_parse_single_module(parser, sample_module_text):
    """Test parsing a single module definition."""
    modules = parser._split_into_modules(sample_module_text)
    assert len(modules) == 1

    module = parser._parse_module_text(modules[0])
    assert module.name == "test_module"
    assert len(module.parameters) == 2
    assert len(module.inputs) == 3
    assert len(module.outputs) == 1
    assert len(module.internals) == 2
    assert module.mode == "sequential"  # Due to clk signal
    assert "adder" in module.submodules


def test_parse_complete_signal(parser):
    """Test parsing complete signal declarations."""
    test_cases = [
        (
            "input wire [7:0] data",
            Signal("data", "wire", "unsigned", "7:0", "", "8'b0"),
        ),
        (
            "output reg signed [15:0] result = 16'h0000",
            Signal("result", "reg", "signed", "15:0", "", "16'h0000"),
        ),
        (
            "wire [WIDTH-1:0] temp",  # Parametric width
            Signal("temp", "wire", "unsigned", "WIDTH-1:0", "", "8'bz"),
        ),
    ]

    for decl, expected in test_cases:
        signal = parser.parse_signal(decl)
        assert signal.name == expected.name
        assert signal.type == expected.type
        assert signal.sign == expected.sign
        assert signal.bit_width == expected.bit_width
        assert signal.default_value is not None


def test_parse_signal_with_comments(parser):
    """Test parsing signals with comments."""
    decl = "input wire clk  // System clock"
    signal = parser.parse_signal(decl, "System clock")
    assert signal.name == "clk"
    assert signal.type == "wire"
    assert signal.comment == "System clock"


def test_invalid_signal_declaration(parser):
    """Test handling of invalid signal declarations."""
    invalid_decls = [
        "",  # Empty declaration
        "wire",  # Missing signal name
        "input output wire sig",  # Contradictory direction
        "reg [5 data",  # Invalid bit width format
    ]

    for decl in invalid_decls:
        with pytest.raises(VerilogParsingError):
            parser.parse_signal(decl)


def test_module_with_parameters(parser):
    """Test parsing modules with parameters."""
    module_text = """
    module param_test #(
        parameter WIDTH = 8,
        parameter SIGNED = 1'b0
    ) (
        input [WIDTH-1:0] in_data
    );
    endmodule
    """

    modules = parser.parse_file(module_text)
    assert len(modules) == 1
    module = modules[0]

    assert len(module.parameters) == 2
    assert module.parameters[0]["name"] == "WIDTH"
    assert module.parameters[0]["value"] == "8"
    assert module.parameters[1]["name"] == "SIGNED"
    assert module.parameters[1]["value"] == "1'b0"


def test_module_with_multiline_ports(parser):
    """Test parsing modules with multi-line port declarations."""
    module_text = """
    module multiline_test (
        input wire
            clk,
        input wire
            [7:0]
            data,
        output
            reg
            [15:0]
            result
    );
    endmodule
    """

    modules = parser.parse_file(module_text)
    assert len(modules) == 1
    module = modules[0]

    assert len(module.inputs) == 2
    assert len(module.outputs) == 1
    assert module.outputs[0].bit_width == "15:0"


def test_complex_port_declarations(parser):
    """Test parsing complex port declarations."""
    module_text = """
    module complex_ports (
        input wire [2:0][3:0] matrix_in,
        input wire signed [WIDTH-1:0] data,
        output reg [DEPTH-1:0][WIDTH-1:0] memory [0:15]
    );
    endmodule
    """

    modules = parser.parse_file(module_text)
    assert len(modules) == 1
    module = modules[0]

    matrix = next(s for s in module.inputs if s.name == "matrix_in")
    assert matrix.bit_width.startswith("2:0")

    data = next(s for s in module.inputs if s.name == "data")
    assert data.sign == "signed"
    assert "WIDTH" in data.bit_width
