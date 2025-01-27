from ..patterns.string_match import StringMatchPattern
from .base import Rule


class CarrySaveAdderRule(Rule):
    def __init__(self, bit_width=8):
        super().__init__(
            input_vars=["a", "b", "c"],
            output_vars=["result"],
            name="CarrySaveAdderRule",
            pattern=StringMatchPattern("carry_save_adder"),
            default_bit_width=bit_width,
        )
        # Input operands are N bits wide
        self.set_signal_spec("a", bit_width, signed=False)
        self.set_signal_spec("b", bit_width, signed=False)
        self.set_signal_spec("c", bit_width, signed=False)

        # Result is N+1 bits wide to accommodate carry
        self.set_signal_spec("result", bit_width + 1, signed=False)

    def generate_expected(self, test_case):
        # Get max values based on actual bit widths
        input_mask = (1 << self.get_signal_spec("a").width) - 1
        result_mask = (1 << self.get_signal_spec("result").width) - 1

        # Mask inputs to ensure correct bit widths
        a = test_case["a"] & input_mask
        b = test_case["b"] & input_mask
        c = test_case["c"] & input_mask

        # Calculate sum and carry terms
        sum1 = a ^ b ^ c
        carry1 = ((a & b) | (b & c) | (c & a)) << 1

        # Final result with proper masking
        result = (sum1 + carry1) & result_mask

        return {"result": result}

    """
    def generate_expected(self, test_case):
        max_val = (1 << (self.bit_width + 1)) - 1
        sum1 = (test_case["a"] ^ test_case["b"] ^ test_case["c"]) & max_val
        carry1 = ((test_case["a"] & test_case["b"]) | (test_case["b"] & test_case["c"]) | (test_case["c"] & test_case["a"])) << 1
        result = (sum1 + carry1) & max_val
        return {
            "result": result
        }
    """
