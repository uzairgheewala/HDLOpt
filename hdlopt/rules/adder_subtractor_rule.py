from .base import Rule
from ..patterns.string_match import StringMatchPattern


class AdderSubtractorRule(Rule):
    def __init__(self, default_bit_width=8):
        super().__init__(
            input_vars=["cin", "i0", "i1"],
            output_vars=["sum"],
            name="AdderSubtractorRule",
            pattern=StringMatchPattern("adder_subtractor"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        max_val = (1 << self.bit_width) - 1
        if test_case["cin"] == 1:
            int_ip = ~test_case["i1"] & max_val  # One's complement
            sum_val = test_case["i0"] + int_ip + 1  # Two's complement addition
        else:
            sum_val = test_case["i0"] + test_case["i1"]  # Simple addition

        return {"sum": sum_val & max_val}  # Mask to bit width
