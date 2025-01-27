"""Tests for Verilog parser exception classes."""

import pytest
from ..scripts.parsing.exceptions import (
    VerilogParsingError,
    ModuleDefinitionError,
    SignalDeclarationError,
    FileProcessingError,
    ParserConfigurationError,
    SerializationError,
)


def test_basic_error_creation():
    """Test basic error creation without line numbers or file paths."""
    error = VerilogParsingError("Test error")
    assert str(error) == "Test error"
    assert error.message == "Test error"
    assert error.line_number is None
    assert error.file_path is None


def test_error_with_line_number():
    """Test error creation with line numbers."""
    error = VerilogParsingError("Test error", line_number=42)
    assert str(error) == "Line 42: Test error"
    assert error.message == "Test error"
    assert error.line_number == 42


def test_error_with_file_path():
    """Test error creation with file paths."""
    error = VerilogParsingError("Test error", file_path="test.v")
    assert str(error) == "File 'test.v': Test error"
    assert error.message == "Test error"
    assert error.file_path == "test.v"


def test_error_with_full_info():
    """Test error creation with both line numbers and file paths."""
    error = VerilogParsingError("Test error", line_number=42, file_path="test.v")
    assert str(error) == "File 'test.v': Line 42: Test error"
    assert error.message == "Test error"
    assert error.line_number == 42
    assert error.file_path == "test.v"


def test_specific_errors():
    """Test creation of specific error types."""
    errors = [
        (ModuleDefinitionError, "Invalid module"),
        (SignalDeclarationError, "Invalid signal"),
        (FileProcessingError, "File error"),
        (ParserConfigurationError, "Config error"),
        (SerializationError, "JSON error"),
    ]

    for error_class, message in errors:
        error = error_class(message, line_number=10, file_path="test.v")
        assert isinstance(error, VerilogParsingError)
        assert error.message == message
        assert error.line_number == 10
        assert error.file_path == "test.v"


def test_error_inheritance():
    """Test that all error types properly inherit from VerilogParsingError."""
    error_classes = [
        ModuleDefinitionError,
        SignalDeclarationError,
        FileProcessingError,
        ParserConfigurationError,
        SerializationError,
    ]

    for error_class in error_classes:
        error = error_class("Test")
        assert isinstance(error, VerilogParsingError)
        assert isinstance(error, Exception)


def test_error_handling():
    """Test that errors can be caught and handled properly."""
    try:
        raise ModuleDefinitionError("Bad module", line_number=20)
    except VerilogParsingError as e:
        assert "Line 20" in str(e)
        assert "Bad module" in str(e)
    except Exception:
        pytest.fail("VerilogParsingError not caught properly")
