"""Base classes for Verilog parsing.

This module contains the abstract base classes that define the interface
for Verilog parsers.
"""

import os
from abc import ABC, abstractmethod
from datetime import datetime
from enum import Enum
from typing import Dict, List

from .exceptions import (
    FileProcessingError,
    ParserConfigurationError,
    VerilogParsingError,
)
from .models import Signal, VerilogModule


class ParserMode(Enum):
    """Enumeration of available parser modes."""

    NATIVE = "native"
    PYVERILOG = "pyverilog"


class VerilogParserBase(ABC):
    """Abstract base class for Verilog parsers.

    This class defines the interface that all Verilog parser implementations
    must follow. It provides some common utility methods while requiring
    implementation of core parsing functionality.
    """

    def __init__(self, clk_name: str = "clk", rst_name: str = "rst"):
        """Initialize the parser with configuration options.

        Args:
            clk_name: Name of the clock signal for mode detection
            rst_name: Name of the reset signal for mode detection

        Raises:
            ParserConfigurationError: If configuration options are invalid
        """
        if not isinstance(clk_name, str) or not clk_name:
            raise ParserConfigurationError("Invalid clock signal name")
        if not isinstance(rst_name, str) or not rst_name:
            raise ParserConfigurationError("Invalid reset signal name")

        self.clk_name = clk_name
        self.rst_name = rst_name

    @abstractmethod
    def parse_file(self, filepath: str) -> List[VerilogModule]:
        """Parse a Verilog file and return the module(s).

        Args:
            filepath: Path to the Verilog file to parse

        Returns:
            List of parsed VerilogModule objects

        Raises:
            FileProcessingError: If file cannot be read or processed
            VerilogParsingError: If parsing fails
        """

    @abstractmethod
    def parse_signal(self, declaration: str, comment: str = "") -> Signal:
        """Parse a signal declaration string.

        Args:
            declaration: Signal declaration string
            comment: Optional comment for the signal

        Returns:
            Parsed Signal object

        Raises:
            VerilogParsingError: If parsing fails
        """

    def process_file(self, filepath: str) -> List[VerilogModule]:
        """Process a Verilog file with proper error handling and metadata.

        This is a template method that handles common file processing tasks
        while delegating the actual parsing to subclasses.

        Args:
            filepath: Path to the Verilog file to process

        Returns:
            List of parsed VerilogModule objects with metadata

        Raises:
            FileProcessingError: If file cannot be read or processed
        """
        if not os.path.exists(filepath):
            raise FileProcessingError(f"File not found: {filepath}")

        try:
            # Get file metadata
            last_modified = datetime.fromtimestamp(
                os.path.getmtime(filepath)
            ).isoformat()

            # Parse the file
            modules = self.parse_file(filepath)

            # Add metadata to each module
            for module in modules:
                module.set_file_metadata(
                    file_path=filepath, last_modified=last_modified
                )

            return modules

        except VerilogParsingError:
            # Re-raise parsing errors as they are
            raise
        except Exception as e:
            # Wrap other exceptions
            raise FileProcessingError(
                f"Error processing file {filepath}: {
                    str(e)}"
            )

    def parse_files(self, filepaths: List[str]) -> Dict[str, List[VerilogModule]]:
        """Parse multiple Verilog files.

        Args:
            filepaths: List of paths to Verilog files

        Returns:
            Dictionary mapping file paths to lists of parsed modules

        Raises:
            FileProcessingError: If any file cannot be processed
        """
        results = {}
        errors = []

        for filepath in filepaths:
            try:
                modules = self.process_file(filepath)
                results[filepath] = modules
            except VerilogParsingError as e:
                errors.append(f"{filepath}: {str(e)}")

        if errors:
            raise FileProcessingError(
                "Failed to parse some files:\n" + "\n".join(errors)
            )

        return results

    def validate_configuration(self) -> None:
        """Validate parser configuration.

        This method should be called by subclasses to verify their configuration
        is valid before parsing.

        Raises:
            ParserConfigurationError: If configuration is invalid
        """
        if not isinstance(self.clk_name, str) or not self.clk_name:
            raise ParserConfigurationError("Invalid clock signal name")
        if not isinstance(self.rst_name, str) or not self.rst_name:
            raise ParserConfigurationError("Invalid reset signal name")
