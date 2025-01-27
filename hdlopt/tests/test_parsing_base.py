"""Tests for base parser classes."""

from typing import List

import pytest

from ..scripts.parsing.base import ParserMode, VerilogParserBase
from ..scripts.parsing.exceptions import (
    FileProcessingError,
    ParserConfigurationError,
    VerilogParsingError,
)
from ..scripts.parsing.models import Signal, VerilogModule


class MockParser(VerilogParserBase):
    """Mock implementation of VerilogParserBase for testing."""

    def parse_file(self, filepath: str) -> List[VerilogModule]:
        """Mock implementation that returns a simple module."""
        # Simulate parsing failure for specific filename
        if "fail" in filepath:
            raise VerilogParsingError("Mock parsing error")

        module = VerilogModule("test_module")
        module.add_signal(Signal("clk", "wire", comment="Clock signal"), "input")
        return [module]

    def parse_signal(self, declaration: str, comment: str = "") -> Signal:
        """Mock implementation that returns a simple signal."""
        return Signal("test", "wire", comment=comment)


@pytest.fixture
def parser():
    """Create a mock parser instance."""
    return MockParser()


@pytest.fixture
def temp_verilog_file(tmp_path):
    """Create a temporary Verilog file."""
    file_path = tmp_path / "test.v"
    with open(file_path, "w") as f:
        f.write("module test; endmodule")
    return str(file_path)


class TestParserMode:
    """Test suite for ParserMode enumeration."""

    def test_parser_mode_values(self):
        """Test ParserMode enumeration values."""
        assert ParserMode.NATIVE.value == "native"
        assert ParserMode.PYVERILOG.value == "pyverilog"

    def test_parser_mode_comparison(self):
        """Test ParserMode comparison operations."""
        assert ParserMode.NATIVE == ParserMode.NATIVE
        assert ParserMode.NATIVE != ParserMode.PYVERILOG


class TestVerilogParserBase:
    """Test suite for VerilogParserBase class."""

    def test_initialization(self, parser):
        """Test parser initialization."""
        assert parser.clk_name == "clk"
        assert parser.rst_name == "rst"

        # Test custom signal names
        custom_parser = MockParser(clk_name="clock", rst_name="reset")
        assert custom_parser.clk_name == "clock"
        assert custom_parser.rst_name == "reset"

    def test_process_file(self, parser, temp_verilog_file):
        """Test process_file method."""
        modules = parser.process_file(temp_verilog_file)
        assert len(modules) == 1
        assert isinstance(modules[0], VerilogModule)

        # Verify metadata
        module = modules[0]
        assert "file_path" in module._metadata
        assert "last_modified" in module._metadata
        assert "parse_time" in module._metadata
        assert module._metadata["file_path"] == temp_verilog_file

    def test_process_nonexistent_file(self, parser):
        """Test processing a non-existent file."""
        with pytest.raises(FileProcessingError) as exc_info:
            parser.process_file("nonexistent.v")
        assert "File not found" in str(exc_info.value)

    def test_parse_files(self, parser, tmp_path):
        """Test parsing multiple files."""
        # Create test files
        file1 = tmp_path / "test1.v"
        file2 = tmp_path / "test2.v"
        file1.write_text("module test1; endmodule")
        file2.write_text("module test2; endmodule")

        # Test successful parsing
        results = parser.parse_files([str(file1), str(file2)])
        assert len(results) == 2
        assert str(file1) in results
        assert str(file2) in results

    def test_parse_files_with_errors(self, parser, tmp_path):
        """Test parsing multiple files with some failures."""
        # Create test files
        good_file = tmp_path / "good.v"
        fail_file = tmp_path / "fail.v"
        good_file.write_text("module test; endmodule")
        fail_file.write_text("module test; endmodule")

        with pytest.raises(FileProcessingError) as exc_info:
            parser.parse_files([str(good_file), str(fail_file)])
        assert "fail.v" in str(exc_info.value)

    def test_validate_configuration(self, parser):
        """Test configuration validation."""
        # Valid configuration
        parser.validate_configuration()

        # Test invalid configurations
        with pytest.raises(ParserConfigurationError) as exc_info:
            MockParser(clk_name="")
        assert "Invalid clock signal name" in str(exc_info.value)

        with pytest.raises(ParserConfigurationError) as exc_info:
            MockParser(rst_name="")
        assert "Invalid reset signal name" in str(exc_info.value)

        with pytest.raises(ParserConfigurationError) as exc_info:
            MockParser(clk_name=123)
        assert "Invalid clock signal name" in str(exc_info.value)

        with pytest.raises(ParserConfigurationError) as exc_info:
            MockParser(rst_name=None)
        assert "Invalid reset signal name" in str(exc_info.value)

    def test_custom_mock_parser(self, parser):
        """Test the mock parser implementation."""
        # Test parse_file
        modules = parser.parse_file("test.v")
        assert len(modules) == 1
        assert modules[0].name == "test_module"
        assert len(modules[0].inputs) == 1
        assert modules[0].inputs[0].name == "clk"

        # Test parse_signal
        signal = parser.parse_signal("wire test;", "Test signal")
        assert signal.name == "test"
        assert signal.type == "wire"
        assert signal.comment == "Test signal"

    def test_error_handling(self, parser):
        """Test error handling in the parser."""
        # Test parsing error
        with pytest.raises(VerilogParsingError):
            parser.parse_file("fail.v")

        # Test file processing error with specific message
        with pytest.raises(FileProcessingError) as exc_info:
            parser.process_file("nonexistent.v")
        assert "File not found" in str(exc_info.value)

        # Test configuration error
        with pytest.raises(ParserConfigurationError) as exc_info:
            invalid_parser = MockParser(clk_name="")
            invalid_parser.validate_configuration()
        assert "Invalid clock signal name" in str(exc_info.value)
