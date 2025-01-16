import os
import pytest

from ..setup import count_lines_in_notebook, count_lines_in_verilog, count_lines_in_py_files

def test_count_lines_in_notebook():
    notebook_path = os.path.join(os.getcwd(), 'benchmarking/benchmarking.ipynb')
    assert count_lines_in_notebook(notebook_path) > 0

def test_count_lines_in_verilog():
    src_dir = os.path.join(os.getcwd(), 'src')
    assert count_lines_in_verilog(src_dir) > 0

def test_count_lines_in_py_files():
    src_dir = os.path.join(os.getcwd(), 'scripts')
    assert count_lines_in_py_files(src_dir) > 0