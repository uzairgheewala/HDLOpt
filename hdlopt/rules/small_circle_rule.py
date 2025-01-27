from .base import Rule
from ..patterns.string_match import StringMatchPattern


class SmallCircleRule(Rule):
    def __init__(self, default_bit_width=4):
        super().__init__(
            input_vars=["Gi"],
            output_vars=["Ci"],
            name="SmallCircleRule",
            pattern=StringMatchPattern("small_circle"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        width = self.bit_width
        Ci = [(test_case["Gi"] >> i) & 1 for i in range(width)]

        Ci_int = sum(Ci[i] << i for i in range(width))

        return {"Ci": Ci_int}
