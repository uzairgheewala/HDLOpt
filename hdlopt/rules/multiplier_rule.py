from .base import Rule
from ..patterns.substring import SubstringPattern


class MultiplierRule(Rule):
    def __init__(self, bit_width=4, signed=False):
        super().__init__(
            input_vars=["A", "B"],
            output_vars=["P"],
            name="MultiplierRule",
            pattern=SubstringPattern("multiplier"),
            default_bit_width=bit_width,
        )

        # Input operands use base bit width
        self.set_signal_spec("A", bit_width, signed=signed)
        self.set_signal_spec("B", bit_width, signed=signed)

        # Output needs twice the width to hold full product
        self.set_signal_spec("P", bit_width * 2, signed=signed)

    def generate_expected(self, test_case):
        # Get input bit masks based on specifications
        input_mask = (1 << self.get_signal_spec("A").width) - 1
        output_mask = (1 << self.get_signal_spec("P").width) - 1

        # Mask inputs to ensure correct bit width
        a = test_case["A"] & input_mask
        b = test_case["B"] & input_mask

        # Handle signed multiplication if needed
        if self.get_signal_spec("A").signed:
            # Convert to signed if in upper half of range
            if a > (input_mask >> 1):
                a = a - (1 << self.get_signal_spec("A").width)
            if b > (input_mask >> 1):
                b = b - (1 << self.get_signal_spec("B").width)

        # Calculate product
        product = a * b

        # For signed output, handle negative results
        if self.get_signal_spec("P").signed and product < 0:
            # Convert negative number to two's complement
            product = product & output_mask
        else:
            # For unsigned, just mask to output width
            product = product & output_mask

        return {"P": product}

    """
    def generate_expected(self, test_case):
        max_val = (1 << (2 * self.bit_width)) - 1
        product = test_case["A"] * test_case["B"]
        outs = {
            "P": product & max_val
        }
        return outs
    """
