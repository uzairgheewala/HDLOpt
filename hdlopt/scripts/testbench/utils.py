import os


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
            # Two's complement for negative numbers
            value = (1 << bit_width) + value
        binary_str = f"{value:0{bit_width}b}"
        msb = binary_str[0]
        padding_char = msb
    else:
        # Handle unsigned conversion
        binary_str = f"{value:0{bit_width}b}"
        padding_char = "0"

    # Ensure the string is always of length bit_width
    if len(binary_str) < bit_width:
        binary_str = padding_char * (bit_width - len(binary_str)) + binary_str

    return binary_str


def determine_input_ranges(bit_width, sign_type):
    if bit_width is None or bit_width == "1":
        width = 1

    if ":" in bit_width:
        high, low = map(int, bit_width.split(":"))
        width = high - low + 1
    else:
        width = int(bit_width)

    if sign_type == "signed":
        return range(-(2 ** (width - 1)), 2 ** (width - 1))
    else:
        if width > 16:
            width = 16
        return range(0, 2**width)


def find_component_directory(
    component_name, hierarchy="hierarchy.json", base_dir="generated"
):
    for root, dirs, files in os.walk(base_dir):
        if component_name in dirs:  # f"{component_name}.v" in files:
            d = dirs[dirs.index(component_name)]
            return os.path.join(base_dir, d)
    return None
