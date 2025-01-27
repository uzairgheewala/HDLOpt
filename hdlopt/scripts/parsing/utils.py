"""Utility functions for Verilog parsing.

This module contains utility functions shared between different parser
implementations.
"""

import re
from typing import List, Dict, Tuple, Optional


def clean_comments(text: str) -> str:
    """Remove comments from Verilog code.

    Args:
        text: Verilog code

    Returns:
        Text with comments removed
    """
    # Remove multi-line comments first
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.DOTALL)

    # Remove single-line comments
    text = re.sub(r"//.*$", "", text, flags=re.MULTILINE)

    return text.strip()


def split_port_list(port_text: str) -> List[str]:
    """Split port list text into individual port declarations.

    Args:
        port_text: Text containing port declarations

    Returns:
        List of port declaration strings
    """
    ports = []
    current_port = []
    paren_count = 0
    bracket_count = 0

    for line in port_text.split("\n"):
        line = line.strip()

        # Skip empty lines
        if not line:
            continue

        # Process the line character by character for accurate counting
        for char in line:
            if char == "(":
                paren_count += 1
            elif char == ")":
                paren_count -= 1
            elif char == "[":
                bracket_count += 1
            elif char == "]":
                bracket_count -= 1

        current_port.append(line)

        # Port declaration is complete if all pairs are balanced and we hit a comma
        if paren_count == 0 and bracket_count == 0:
            # Join and clean the current port
            port = " ".join(current_port)

            # Check if it's a complete declaration (ends with comma or semicolon)
            if port.rstrip().endswith(",") or port.rstrip().endswith(";"):
                port = port.rstrip(",;").strip()
                if port:
                    ports.append(port)
                current_port = []

    # Handle the last port if it doesn't end with comma/semicolon
    if current_port:
        port = " ".join(current_port).strip()
        if port and not port.endswith((",", ";")):
            ports.append(port)

    return ports


def extract_bit_width(width_spec: str) -> Tuple[Optional[int], Optional[int]]:
    """Parse a bit width specification into MSB and LSB.

    Args:
        width_spec: Bit width specification (e.g., "7:0", "WIDTH-1:0")

    Returns:
        Tuple of (MSB, LSB) or (None, None) if not numeric
    """
    if ":" not in width_spec:
        if width_spec.isdigit():
            return (int(width_spec), 0)
        return (None, None)

    msb, lsb = width_spec.split(":")

    try:
        msb_val = int(msb)
        lsb_val = int(lsb)
        return (msb_val, lsb_val)
    except ValueError:
        return (None, None)


def calculate_width(msb: Optional[int], lsb: Optional[int], default: int = 8) -> int:
    """Calculate bit width from MSB and LSB values.

    Args:
        msb: Most significant bit (or None if parametric)
        lsb: Least significant bit (or None if parametric)
        default: Default width to use if width is parametric

    Returns:
        Bit width as integer
    """
    if msb is not None and lsb is not None:
        return msb - lsb + 1
    return default


def validate_identifier(name: str) -> bool:
    """Validate a Verilog identifier name.

    Args:
        name: Identifier to validate

    Returns:
        True if valid, False otherwise
    """
    return bool(re.match(r"^[a-zA-Z_][a-zA-Z0-9_]*$", name))
