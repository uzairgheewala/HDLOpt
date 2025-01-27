"""Exception classes for Verilog parsing.

This module contains all custom exceptions that may be raised during Verilog parsing.
Each exception type corresponds to a specific category of parsing error.
"""


class VerilogParsingError(Exception):
    """Base class for Verilog parsing errors."""

    def __init__(self, message: str, line_number: int = None, file_path: str = None):
        self.message = message
        self.line_number = line_number
        self.file_path = file_path

        # Build the full error message
        full_message = message
        if line_number is not None:
            full_message = f"Line {line_number}: {full_message}"
        if file_path is not None:
            full_message = f"File '{file_path}': {full_message}"

        super().__init__(full_message)


class ModuleDefinitionError(VerilogParsingError):
    """Raised when there's an error in the module definition."""


class SignalDeclarationError(VerilogParsingError):
    """Raised when there's an error in signal declarations."""


class FileProcessingError(VerilogParsingError):
    """Raised when there's an error processing the Verilog file."""


class ParserConfigurationError(VerilogParsingError):
    """Raised when there's an error in parser configuration or initialization."""


class SerializationError(VerilogParsingError):
    """Raised when there's an error serializing parser output to JSON."""
