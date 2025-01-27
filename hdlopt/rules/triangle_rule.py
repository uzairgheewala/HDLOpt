from .base import Rule
from ..patterns.string_match import StringMatchPattern


class TriangleRule(Rule):
    def __init__(self, default_bit_width=4):
        super().__init__(
            input_vars=["Pi", "CiPrev"],
            output_vars=["Si"],
            name="TriangleRule",
            pattern=StringMatchPattern("triangle"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        P_bits = [(test_case["Pi"] >> i) & 1 for i in range(self.bit_width)]
        CiPrev_bits = [(test_case["CiPrev"] >> i) & 1 for i in range(self.bit_width)]

        S = [P_bits[i] ^ CiPrev_bits[i] for i in range(self.bit_width)]

        S_int = sum(S[i] << i for i in range(self.bit_width))

        return {"Si": S_int}
