"""Factory class for creating Verilog parsers.

This module provides a factory class that creates the appropriate parser
based on the requested mode and available dependencies.
"""

from typing import Optional
from .base import VerilogParserBase, ParserMode
from .native import NativeVerilogParser
from .exceptions import ParserConfigurationError

# Try to import PyVerilog
try:
    from .pyverilog import PyVerilogParser
    PYVERILOG_AVAILABLE = True
except ImportError:
    PYVERILOG_AVAILABLE = False

class VerilogParser:
    """Main factory class for creating Verilog parsers.
    
    This class selects and instantiates the appropriate parser implementation
    based on the requested mode and available dependencies.
    """
    
    def __init__(self, mode: ParserMode = ParserMode.NATIVE, **kwargs):
        """Initialize parser factory with specified mode.
        
        Args:
            mode: Parser mode (NATIVE or PYVERILOG)
            **kwargs: Additional arguments for the specific parser
            
        Raises:
            ParserConfigurationError: If requested mode is not available
        """
        self.mode = mode
        
        # Fall back to native parser if PyVerilog not available
        if mode == ParserMode.PYVERILOG and not PYVERILOG_AVAILABLE:
            raise ParserConfigurationError(
                "PyVerilog parser requested but PyVerilog is not installed. "
                "Please install PyVerilog or use the native parser."
            )
        
        # Create appropriate parser instance
        if mode == ParserMode.PYVERILOG:
            self.parser = PyVerilogParser(**kwargs)
        else:
            self.parser = NativeVerilogParser(**kwargs)

    def __getattr__(self, name):
        """Delegate all undefined attributes to the underlying parser."""
        return getattr(self.parser, name)
        
    @classmethod
    def create(cls, mode: ParserMode = ParserMode.NATIVE, **kwargs) -> VerilogParserBase:
        """Factory method to create a parser instance.
        
        Args:
            mode: Parser mode (NATIVE or PYVERILOG)
            **kwargs: Additional arguments for the specific parser
            
        Returns:
            Instance of VerilogParserBase
        """
        return cls(mode, **kwargs).parser