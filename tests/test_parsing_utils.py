"""Tests for Verilog parser utilities."""

import pytest
from ..scripts.parsing.utils import (
    clean_comments,
    split_port_list,
    extract_bit_width,
    calculate_width,
    validate_identifier
)

def test_clean_comments():
    """Test comment removal."""
    text = """
    // Single line comment
    module test ( // Inline comment
        input clk,    /* Multi-line
                        comment */
        output reg data // Another comment
    );
    endmodule
    """
    
    clean = clean_comments(text)
    assert "//" not in clean
    assert "/*" not in clean
    assert "*/" not in clean
    assert "module test (" in clean
    assert "input clk," in clean
    assert "output reg data" in clean

def test_split_port_list():
    """Test port list splitting."""
    ports = split_port_list("""
        input wire clk,
        input wire rst_n,
        input wire [7:0] data,
        output reg [15:0] result
    """)
    
    assert len(ports) == 4
    assert "input wire clk" in ports[0]
    assert "input wire rst_n" in ports[1]
    assert "[7:0] data" in ports[2]
    assert "[15:0] result" in ports[3]

def test_extract_bit_width():
    """Test bit width extraction."""
    test_cases = [
        ("7:0", (7, 0)),
        ("WIDTH-1:0", (None, None)),
        ("15", (15, 0)),
        ("3:1", (3, 1)),
        ("FOO:BAR", (None, None)),
    ]
    
    for width_spec, expected in test_cases:
        assert extract_bit_width(width_spec) == expected

def test_calculate_width():
    """Test width calculation."""
    test_cases = [
        ((7, 0), 8),
        ((15, 0), 16),
        ((3, 1), 3),
        ((None, None), 8),  # Default
        ((31, 0), 32),
    ]
    
    for (msb, lsb), expected in test_cases:
        assert calculate_width(msb, lsb) == expected

def test_validate_identifier():
    """Test identifier validation."""
    valid = [
        "clk",
        "data_in",
        "DATA_OUT",
        "_signal",
        "a123",
        "valid_1",
    ]
    
    invalid = [
        "",
        "123data",
        "data!",
        "test-signal",
        "signal space",
        "@data",
    ]
    
    for name in valid:
        assert validate_identifier(name)
        
    for name in invalid:
        assert not validate_identifier(name)

def test_complex_port_splitting():
    """Test splitting complex port declarations."""
    ports = split_port_list("""
        input wire [2:0][3:0] matrix_in,
        input wire signed [WIDTH-1:0] data (
            .param1(value1),
            .param2(value2)
        ),
        output reg [DEPTH-1:0][WIDTH-1:0] memory [0:15]
    """)
    
    assert len(ports) == 3
    assert "matrix_in" in ports[0]
    assert "signed" in ports[1]
    assert "memory" in ports[2]