"""Tests for Verilog parser factory."""

import pytest
from ..scripts.parsing.factory import PYVERILOG_AVAILABLE
from ..scripts.parsing.factory import VerilogParser
from ..scripts.parsing.base import ParserMode
from ..scripts.parsing.native import NativeVerilogParser
from ..scripts.parsing.exceptions import ParserConfigurationError

def test_create_native_parser():
    """Test creating a native parser."""
    parser = VerilogParser.create(mode=ParserMode.NATIVE)
    assert isinstance(parser, NativeVerilogParser)

def test_default_to_native_parser():
    """Test default parser creation."""
    parser = VerilogParser.create()
    assert isinstance(parser, NativeVerilogParser)

def test_create_with_custom_params():
    """Test creating parser with custom parameters."""
    parser = VerilogParser.create(
        mode=ParserMode.NATIVE,
        clk_name="clock",
        rst_name="reset"
    )
    assert parser.clk_name == "clock"
    assert parser.rst_name == "reset"

@pytest.mark.skipif(
    PYVERILOG_AVAILABLE,
    reason="Test only valid when PyVerilog is not installed"
)
def test_pyverilog_not_available():
    """Test appropriate error when PyVerilog is not available."""
    with pytest.raises(ParserConfigurationError) as exc_info:
        VerilogParser.create(mode=ParserMode.PYVERILOG)
    assert "PyVerilog is not installed" in str(exc_info.value)

def test_method_delegation():
    """Test that methods are properly delegated to underlying parser."""
    factory = VerilogParser(mode=ParserMode.NATIVE)
    # Test a few core methods
    assert hasattr(factory, 'parse_file')
    assert hasattr(factory, 'parse_signal')
    assert hasattr(factory, 'validate_configuration')