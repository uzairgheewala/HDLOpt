import os
import shutil
import pytest
import logging

from ..scripts.directory_structure import (
    identify_submodules,
    filter_filenames,
    create_directory_structure,
    print_directory_structure,
)
from ..patterns.substring import SubstringPattern

@pytest.fixture
def setup_verilog_files(tmpdir, capsys):
    # Create a temporary directory with Verilog files
    src_dir = tmpdir.mkdir("src")
    dest_dir = tmpdir.mkdir("dest")

    # Create a Verilog file with submodules
    alu_content = """module alu();
    sub1 Sub1(); // Module
endmodule
"""
    alu_file = src_dir.join("alu.v")
    with open(alu_file, "w") as f:
        f.write(alu_content)

    # Create the submodule Verilog file
    sub1_content = """module sub1();
endmodule
"""
    sub1_file = src_dir.join("sub1.v")
    with open(sub1_file, "w") as f:
        f.write(sub1_content)

    # Create another Verilog file
    adder_content = """module adder();
endmodule
"""
    adder_file = src_dir.join("adder.v")
    with open(adder_file, "w") as f:
        f.write(adder_content)

    # Optional: Verify file creation
    captured = capsys.readouterr()
    print(f"Created files in {src_dir}:")
    for file in [alu_file, sub1_file, adder_file]:
        print(f" - {file}")
        with open(file, 'r') as f_read:
            content = f_read.read()
            print(f"   Content:\n{content}")

    return str(src_dir), str(dest_dir)

def test_identify_submodules(setup_verilog_files):
    src_dir, _ = setup_verilog_files
    verilog_file = os.path.join(src_dir, "alu.v")
    submodules = identify_submodules(verilog_file)
    assert submodules == ["sub1"], f"Expected ['sub1'], got {submodules}"

def test_filter_filenames(setup_verilog_files):
    src_dir, _ = setup_verilog_files
    patterns = [SubstringPattern("alu")]
    filtered_files = filter_filenames(source_dir=src_dir, patterns=patterns)
    expected_file = os.path.join(src_dir, "alu.v")
    unexpected_file = os.path.join(src_dir, "adder.v")
    assert expected_file in filtered_files, f"{expected_file} should be in filtered_files"
    assert unexpected_file not in filtered_files, f"{unexpected_file} should not be in filtered_files"

def test_create_directory_structure(setup_verilog_files):
    src_dir, dest_dir = setup_verilog_files
    hierarchy = {}
    alu_v_path = os.path.join(src_dir, "alu.v")
    create_directory_structure(
        component_name=alu_v_path,
        src_folder=src_dir,
        dest_folder=dest_dir,
        hierarchy=hierarchy
    )
    expected_alu_path = os.path.join(dest_dir, "alu", "alu.v")
    expected_sub1_path = os.path.join(dest_dir, "alu", "sub1", "sub1.v")
    assert os.path.exists(expected_alu_path), f"{expected_alu_path} should exist"
    assert os.path.exists(expected_sub1_path), f"{expected_sub1_path} should exist"
    expected_hierarchy = {"alu": ["sub1"], "sub1": []}
    assert hierarchy == expected_hierarchy, f"Expected hierarchy {expected_hierarchy}, got {hierarchy}"

def test_print_directory_structure(setup_verilog_files):
    src_dir, dest_dir = setup_verilog_files
    hierarchy = {}
    alu_v_path = os.path.join(src_dir, "alu.v")
    create_directory_structure(
        component_name=alu_v_path,
        src_folder=src_dir,
        dest_folder=dest_dir,
        hierarchy=hierarchy
    )
    directory_hierarchy = print_directory_structure(dest_dir)
    expected_hierarchy = {
        "alu": {
            "alu.v": None,
            "sub1": {
                "sub1.v": None
            }
        }
    }
    assert directory_hierarchy == expected_hierarchy, f"Expected {expected_hierarchy}, got {directory_hierarchy}"

def test_filter_filenames_with_submodules(setup_verilog_files, caplog):
    src_dir, _ = setup_verilog_files
    patterns = [SubstringPattern("alu")]
    with caplog.at_level(logging.DEBUG):
        filtered_files = filter_filenames(source_dir=src_dir, patterns=patterns, subs=True)
    
    expected_alu = os.path.join(src_dir, "alu.v")
    expected_sub1 = os.path.join(src_dir, "sub1.v")
    unexpected_adder = os.path.join(src_dir, "adder.v")
    
    assert expected_alu in filtered_files, f"{expected_alu} should be in filtered_files"
    assert expected_sub1 in filtered_files, f"{expected_sub1} should be in filtered_files"
    assert unexpected_adder not in filtered_files, f"{unexpected_adder} should not be in filtered_files"
    
    # Optional: Inspect captured logs for debugging
    for record in caplog.records:
        print(record.levelname, record.message)