#!/bin/bash

# Set the module and testbench file names
MODULE_FILE="alu.v"
TESTBENCH_FILE="alu_tb.v"

# List of all submodule files
SUBMODULE_FILES=(
    "ripple_carry_adder.v"
    "carry_lookahead_adder.v"
    "kogge_stone_adder.v"
    "carry_save_adder.v"
    "carry_skip_adder.v"
    "carry_select_adder.v"
    "mcc_adder.v"
    "ripple_carry_subtractor.v"
    "carry_lookahead_subtractor.v"
    "borrow_lookahead_subtractor.v"
    "wallace_tree_multiplier.v"
    "array_multiplier.v"
    "booth_multiplier.v"
    "restoring_divider.v"
    "non_restoring_divider.v"
    "ConditionalShifter.v"
)

# Compile all modules and the testbench
iverilog -o alu_sim $MODULE_FILE $TESTBENCH_FILE ${SUBMODULE_FILES[@]}

# Run the simulation
vvp alu_sim

# To view the waveform, you can use gtkwave
# Generate the vcd file for waveform analysis
# vvp alu_sim -lxt2

# Uncomment the following line to open the waveform in gtkwave
# gtkwave alu_tb.vcd