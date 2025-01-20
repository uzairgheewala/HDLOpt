from .base import Rule
from ..patterns.string_match import StringMatchPattern
from ..utils import to_binary_string

class ArithmeticShifterRule(Rule):
    def __init__(self, default_bit_width=32):
        super().__init__(
            input_vars=["data_in", "shift_amount", "direction"],
            output_vars=["data_out"],
            name="ArithmeticShifterRule", 
            pattern=StringMatchPattern("arithmetic_shifter"),
            default_bit_width=default_bit_width
        )
        
        # data_in and data_out are signed and same width as bit_width parameter
        self.set_signal_spec("data_in", default_bit_width, signed=True)
        self.set_signal_spec("data_out", default_bit_width, signed=True)
        
        # shift_amount is unsigned and requires ceil(log2(bit_width)) bits
        shift_bits = (default_bit_width - 1).bit_length()  # This gives us ceiling(log2(N))
        self.set_signal_spec("shift_amount", shift_bits, signed=False)
        
        # direction is a single unsigned bit
        self.set_signal_spec("direction", 1, signed=False)

    def generate_expected(self, test_case):
        a = test_case["data_in"]
        shift = test_case["shift_amount"]
        direction = test_case["direction"]

        # Convert input `a` to a binary string (signed format)
        binary_str = to_binary_string(a, self.bit_width, "signed")

        # Perform the shift
        if shift == 0:
            result_bin = binary_str  # No shift needed
        else:
            if direction == 0:
                # Logical left shift
                result_bin = binary_str[shift:] + '0' * shift
                result_bin = result_bin[:self.bit_width]  # Trim to the bit width
            else:
                # Arithmetic right shift: Keep sign extension for negative numbers
                sign_bit = binary_str[0]
                result_bin = sign_bit * shift + binary_str[:-shift]
                result_bin = result_bin[-self.bit_width:]  # Ensure it's the correct bit width

        # Convert the binary string result back to an integer (signed)
        if result_bin[0] == '1':  # If it's a negative number in two's complement
            result_int = int(result_bin, 2) - (1 << self.bit_width)
        else:
            result_int = int(result_bin, 2)

        outs = {
            "data_out": result_int
        }
        return outs