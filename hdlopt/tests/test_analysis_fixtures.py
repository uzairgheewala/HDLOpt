import pytest
from pathlib import Path
import json


@pytest.fixture
def sample_netlist():
    """Create sample Yosys JSON netlist"""
    return {
        "modules": {
            "test_module": {
                "name": "test_module",
                "ports": {
                    "clk": {"direction": "input", "bits": [2]},
                    "rst": {"direction": "input", "bits": [3]},
                    "out": {"direction": "output", "bits": [4, 5, 6, 7]},
                },
                "cells": {
                    "add1": {
                        "type": "full_adder",
                        "port_directions": {
                            "a": "input",
                            "b": "input",
                            "cin": "input",
                            "sum": "output",
                            "cout": "output",
                        },
                    },
                    "$and1": {
                        "type": "$_AND_",
                        "port_directions": {"A": "input", "B": "input", "Y": "output"},
                    },
                },
                "netnames": {"net1": {"bits": [0]}, "net2": {"bits": [1, 2, 3]}},
            },
            "full_adder": {
                "name": "full_adder",
                "ports": {
                    "a": {"direction": "input", "bits": [0]},
                    "b": {"direction": "input", "bits": [1]},
                    "cin": {"direction": "input", "bits": [2]},
                    "sum": {"direction": "output", "bits": [3]},
                    "cout": {"direction": "output", "bits": [4]},
                },
                "cells": {"$xor1": {"type": "$_XOR_"}, "$and1": {"type": "$_AND_"}},
                "netnames": {"net1": {"bits": [0]}, "net2": {"bits": [1]}},
            },
        }
    }


@pytest.fixture
def temp_component_dir(tmp_path):
    """Create temporary component test directory"""
    # Create component directory
    comp_dir = tmp_path / "test_component"
    comp_dir.mkdir()

    # Create Verilog source
    src = """
    module test_component #(
        parameter WIDTH = 4
    ) (
        input clk,
        input rst,
        input [WIDTH-1:0] in_a,
        input [WIDTH-1:0] in_b,
        output reg [WIDTH-1:0] out
    );
        always @(posedge clk)
            if (rst)
                out <= 0;
            else 
                out <= in_a + in_b;
    endmodule
    """

    (comp_dir / "test_component.v").write_text(src)

    # Create testbench
    tb = """
    module tb_WIDTH4_test_component;
        parameter WIDTH = 4;
        reg clk, rst;
        reg [WIDTH-1:0] in_a, in_b;
        wire [WIDTH-1:0] out;
        
        test_component #(WIDTH) dut (.*);
        
        initial begin
            // Test stimulus
        end
    endmodule
    """

    (comp_dir / "tb_WIDTH4_test_component.v").write_text(tb)

    # Create component details
    details = {
        "component_name": "test_component",
        "parameters": [{"name": "WIDTH", "value": "4"}],
        "inputs": [
            ["input", "wire", "unsigned", "1", "clk"],
            ["input", "wire", "unsigned", "1", "rst"],
            ["input", "wire", "unsigned", "WIDTH-1:0", "in_a"],
            ["input", "wire", "unsigned", "WIDTH-1:0", "in_b"],
        ],
        "outputs": [["output", "reg", "unsigned", "WIDTH-1:0", "out"]],
    }

    with open(comp_dir / "test_component_details.json", "w") as f:
        json.dump(details, f)

    return comp_dir


if __name__ == "__main__":
    pytest.main([__file__])
