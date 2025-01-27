from .base import Rule
from ..patterns.string_match import StringMatchPattern


class SkipLogicRule(Rule):
    def __init__(self, default_bit_width=4):
        super().__init__(
            input_vars=["a", "b", "cin", "cout"],
            output_vars=["cin_next"],
            name="SkipLogicRule",
            pattern=StringMatchPattern("skip_logic"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        width = self.bit_width

        a_bits = [(test_case["a"] >> i) & 1 for i in range(width)]
        b_bits = [(test_case["b"] >> i) & 1 for i in range(width)]

        propagate = [a_bits[i] | b_bits[i] for i in range(width)]
        P = all(propagate)
        cin_next = (P & test_case["cin"]) | test_case["cout"]

        return {"cin_next": cin_next}
