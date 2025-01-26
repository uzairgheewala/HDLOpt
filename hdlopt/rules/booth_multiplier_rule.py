from .base import Rule
from ..patterns.string_match import StringMatchPattern

class BoothMultiplierRule(Rule):
    def __init__(self, bit_width: int = 8):
        super().__init__(
            input_vars=["X", "Y"],
            output_vars=["Z"],
            name="BoothMultiplierRule",
            pattern=StringMatchPattern("booth_multiplier"),
            default_bit_width=bit_width
        )
        # Multiplier output is twice the input width
        self.set_signal_spec("X", bit_width, signed=True)
        self.set_signal_spec("Y", bit_width, signed=True)
        self.set_signal_spec("Z", bit_width * 2, signed=True)
    
    def generate_expected(self, test_case):
        max_val = (1 << (2 * self.bit_width)) - 1

        multiplicand = test_case["X"]
        multiplier = test_case["Y"]
        product = multiplicand * multiplier

        # Handle signed 2*N-bit product adjustment
        if product >= (1 << (2 * self.bit_width - 1)):
            product -= (1 << (2 * self.bit_width))
        elif product < -(1 << (2 * self.bit_width - 1)):
            product += (1 << (2 * self.bit_width))

        outs = {
            "Z": product
        }
        return outs