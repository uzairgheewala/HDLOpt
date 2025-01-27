from ..patterns.string_match import StringMatchPattern
from .base import Rule


class RestoringDividerRule(Rule):
    def __init__(self, default_bit_width=8):
        super().__init__(
            input_vars=["X", "Y"],
            output_vars=["quot", "rem"],
            name="RestoringDividerRule",
            pattern=StringMatchPattern("restoring_divider"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        divisor = test_case["Y"]
        dividend = test_case["X"]

        # Handle division by zero
        if divisor == 0:
            quotient = (
                1 << self.bit_width
            ) - 1  # Set quotient to maximum value for divide by zero case
            remainder = dividend  # Set remainder as the dividend
        else:
            quotient = dividend // divisor
            remainder = dividend % divisor

        outs = {"quot": quotient, "rem": remainder}
        return outs
