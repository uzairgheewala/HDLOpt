from .base import Rule
from ..patterns.substring import SubstringPattern


class AdderRule(Rule):
    def __init__(self, default_bit_width=8):
        super().__init__(
            input_vars=["a", "b", "cin"],
            output_vars=["sum", "cout"],
            name="AdderRule",
            pattern=SubstringPattern("adder"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        max_val = (1 << self.bit_width) - 1
        if "cin" in test_case:
            sum_val = test_case["a"] + test_case["b"] + test_case["cin"]
            outs = {"sum": sum_val & max_val, "cout": sum_val >> self.bit_width}
        else:
            sum_val = test_case["a"] + test_case["b"]
            outs = {"sum": sum_val & max_val, "cout": sum_val >> self.bit_width}
        return outs
