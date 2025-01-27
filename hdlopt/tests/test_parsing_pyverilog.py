"""Tests for PyVerilog parser implementation."""

from unittest.mock import patch

import pytest

from ..scripts.parsing.exceptions import SignalDeclarationError
from ..scripts.parsing.pyverilog import PYVERILOG_AVAILABLE, PyVerilogParser


@pytest.fixture
def sample_verilog_text():
    """Create sample Verilog code for testing."""
    return """
    module test_module #(
        parameter WIDTH = 8,
        parameter SIGNED = 1'b0
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


@pytest.fixture
def mock_pyverilog_ast():
    """Create mock PyVerilog AST for testing."""
    if not PYVERILOG_AVAILABLE:
        return None

    from pyverilog.vparser.ast import (
        Description,
        IntConst,
        ModuleDef,
        Parameter,
        Paramlist,
        Port,
        Portlist,
        Source,
        Width,
    )

    # Create mock AST structure
    module = ModuleDef(
        name="test_module",
        paramlist=Paramlist(
            [
                Parameter(name="WIDTH", value=IntConst("8")),
                Parameter(name="SIGNED", value=IntConst("0")),
            ]
        ),
        portlist=Portlist(
            [
                Port(name="clk", width=None, type="wire", sign=False),
                Port(name="rst_n", width=None, type="wire", sign=False),
                Port(
                    name="a",
                    width=Width(msb=IntConst("7"), lsb=IntConst("0")),
                    type="wire",
                    sign=False,
                ),
            ]
        ),
        items=[],
    )

    description = Description([module])
    return Source([description])


@pytest.mark.skipif(not PYVERILOG_AVAILABLE, reason="PyVerilog not installed")
class TestPyVerilogParser:
    """Test suite for PyVerilog parser when PyVerilog is available."""

    @pytest.fixture
    def parser(self):
        """Create parser instance for tests."""
        return PyVerilogParser()

    def test_initialization(self, parser):
        """Test parser initialization."""
        assert parser.clk_name == "clk"
        assert parser.rst_name == "rst"
        assert parser.ast_types is not None

    def test_parse_file_with_string(self, parser, sample_verilog_text):
        """Test parsing Verilog code from string."""
        modules = parser.parse_file(sample_verilog_text)
        assert len(modules) == 1
        module = modules[0]

        # Verify basic module structure
        assert module.name == "test_module"
        assert len(module.parameters) == 2
        assert len(module.inputs) == 3
        assert len(module.outputs) == 1

        print(module.parameters)

        # Verify parameters
        assert module.parameters[0]["name"] == "WIDTH"
        assert module.parameters[0]["value"] == "8"
        assert module.parameters[1]["name"] == "SIGNED"
        assert module.parameters[1]["value"] == "1'b0"

        # Verify signals
        assert module.inputs[0].name == "clk"
        assert module.inputs[1].name == "rst_n"
        assert module.mode == "sequential"  # Due to clk/rst signals

    @pytest.mark.parametrize(
        "signal_text,expected_error",
        [
            ("", "Empty signal declaration"),
            ("wire", "Invalid signal declaration"),
            ("input output wire sig", "Contradictory signal directions"),  # ,
            # ("reg [5 data", "Invalid bit width")
        ],
    )
    def test_invalid_signal_declarations(self, parser, signal_text, expected_error):
        """Test handling of invalid signal declarations."""
        with pytest.raises(SignalDeclarationError) as exc_info:
            parser.parse_signal(signal_text)
        msg = exc_info.value
        if type(msg) is not str:
            msg = msg.message
        assert expected_error in msg

    def test_parameter_parsing(self, parser, sample_verilog_text):
        """Test parameter parsing."""
        modules = parser.parse_file(sample_verilog_text)
        module = modules[0]

        # Check parameters
        assert len(module.parameters) == 2
        width_param = next(p for p in module.parameters if p["name"] == "WIDTH")
        signed_param = next(p for p in module.parameters if p["name"] == "SIGNED")

        assert width_param["value"] == "8"
        assert signed_param["value"] == "1'b0"

    def test_preprocess_verilog(self, parser):
        """Test Verilog preprocessing."""
        code = """
        input wire a = 1, // With default
        output reg [7:0] b, // Comment
        /* Multi-line
           comment */
        input c
        """
        processed = parser.preprocess_verilog(code)

        assert "=" not in processed  # Default values removed
        assert "//" not in processed  # Single-line comments removed
        assert "/*" not in processed  # Multi-line comments removed
        assert "*/" not in processed


@pytest.mark.skipif(PYVERILOG_AVAILABLE, reason="PyVerilog is installed")
class TestPyVerilogParserNotAvailable:
    """Test suite for when PyVerilog is not available."""

    def test_initialization_fails(self):
        """Test that parser creation fails when PyVerilog is not available."""
        with pytest.raises(ImportError) as exc_info:
            PyVerilogParser()
        assert "PyVerilog is required" in str(exc_info.value)

    def test_parse_file_fails(self):
        """Test that parse_file fails when PyVerilog is not available."""
        with pytest.raises(ImportError):
            # Need to mock the initialization check to test parse_file
            with patch("..scripts.parsing.pyverilog.PYVERILOG_AVAILABLE", True):
                parser = PyVerilogParser()
                parser.parse_file("test.v")
