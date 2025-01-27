from .base import Rule
from ..patterns.string_match import StringMatchPattern


class CarryLogicRule(Rule):
    def __init__(self, default_bit_width=8):
        super().__init__(
            input_vars=["p", "g", "c_in"],
            output_vars=["c_out"],
            name="CarryLogicRule",
            pattern=StringMatchPattern("carry_logic"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        return {"c_out": test_case["g"] | (test_case["p"] & test_case["c_in"])}
