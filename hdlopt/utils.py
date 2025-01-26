import os
import nbformat
from IPython import get_ipython

def to_binary_string(value, bit_width, sign):
    """
    Convert a value to its binary string representation, considering signed or unsigned format.
    
    Args:
    value (int): The value to convert.
    bit_width (int): The bit width for the binary representation.
    sign (str): The sign type, either "signed" or "unsigned".
    
    Returns:
    str: The binary string representation of the value.
    """
    if sign == "signed":
        # Handle signed conversion
        if value < 0:
            value = (1 << bit_width) + value  # Two's complement for negative numbers
        binary_str = f"{value:0{bit_width}b}"
        msb = binary_str[0]
        padding_char = msb
    else:
        # Handle unsigned conversion
        binary_str = f"{value:0{bit_width}b}"
        padding_char = '0'
    
    # Ensure the string is always of length bit_width
    if len(binary_str) < bit_width:
        binary_str = padding_char * (bit_width - len(binary_str)) + binary_str

    return binary_str

def determine_input_ranges(bit_width, sign_type):
    if bit_width is None or bit_width == '1':
        width = 1

    if ':' in bit_width:
        high, low = map(int, bit_width.split(':'))
        width = high - low + 1
    else:
        width = int(bit_width)

    if sign_type == 'signed':
        return range(-(2**(width-1)), 2**(width-1))
    else:
        if width > 16:
            width = 16
        return range(0, 2**width)
    
def count_lines_in_notebook(notebook_path):
    with open(notebook_path, 'r') as f:
        notebook = nbformat.read(f, as_version=4)
    
    # Count lines in code cells
    count = 0
    for cell in notebook.cells:
        if cell.cell_type == 'code':
            count += len(cell.source.split('\n'))

    print(f"Total lines in code cells: {count}")
    return count

def count_lines_in_verilog(src_dir):
    verilog_line_count = 0

    # Walk through the src_dir and count the lines in Verilog files
    for root, dirs, files in os.walk(src_dir):
        for file in files:
            if file.endswith('.v') or file.endswith('.sv'):  # Check for Verilog files
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as verilog_file:
                    lines = verilog_file.readlines()
                    verilog_line_count += len(lines)

    print(f"Total lines in Verilog files: {verilog_line_count}")
    return verilog_line_count

def count_lines_in_py_files(src_dir):
    py_line_count = 0

    # Walk through the src_dir and count the lines in Python files
    for root, dirs, files in os.walk(src_dir):
        for file in files:
            if file.endswith('.py'):  # Check for Python files
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as py_file:
                    lines = py_file.readlines()
                    py_line_count += len(lines)

    print(f"Total lines in Python files: {py_line_count}")
    return py_line_count

def count_lines():
    notebook_path = os.path.join(os.getcwd(), 'benchmarking.ipynb')
    if notebook_path is None:
        raise ValueError("Couldn't determine notebook path.")

    notebook_lines = count_lines_in_notebook(notebook_path)
    verilog_lines = count_lines_in_verilog(os.path.join(os.getcwd(), 'src'))
    py_lines = count_lines_in_py_files(os.path.join(os.getcwd(), 'scripts'))
    total_lines = notebook_lines + verilog_lines + py_lines

    print(f"Total lines in code cells, Verilog files, and Python files: {total_lines}")
