from .base import Rule
from ..patterns.substring import SubstringPattern

class SubtractorRule(Rule):
    def __init__(self, default_bit_width=8):
        super().__init__(input_vars=["a", "b", "bin"], output_vars=["diff", "bout"],
                         name="SubtractorRule", pattern=SubstringPattern("subtractor"), default_bit_width=default_bit_width)

    def generate_expected(self, test_case):
        max_val = (1 << self.bit_width) - 1
        if "bin" in test_case:
            diff_val = test_case["a"] - test_case["b"] - test_case["bin"]
            if diff_val < 0:
                diff_val += (1 << self.bit_width)
                bout = 1
            else:
                bout = 0
            outs = {
                "diff": diff_val & max_val,
                "bout": bout
            }
        else:
            diff_val = test_case["a"] - test_case["b"]
            if diff_val < 0:
                diff_val += (1 << self.bit_width)
                bout = 1
            else:
                bout = 0
            outs = {
                "diff": diff_val & max_val,
                "bout": bout
            }
        return outs