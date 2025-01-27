from .base import Rule
from ..patterns.string_match import StringMatchPattern


class LogicalShifterRule(Rule):
    def __init__(self, default_bit_width=4):
        super().__init__(
            input_vars=["data_in", "shift_amount", "direction"],
            output_vars=["data_out"],
            name="LogicalShifterRule",
            pattern=StringMatchPattern("logic_shifter"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        max_val = (1 << self.bit_width) - 1
        if test_case["direction"] == 0:
            result = (test_case["data_in"] << test_case["shift_amount"]) & max_val
        else:  # right shift
            result = (test_case["data_in"] >> test_case["shift_amount"]) & max_val

        outs = {"data_out": result}
        return outs
