from .base import Rule
from ..patterns.string_match import StringMatchPattern

class Xor2Rule(Rule):
    def __init__(self, bit_width=1):
        super().__init__(input_vars=["i0", "i1"], output_vars=["o"],
                         name="Xor2Rule", pattern=StringMatchPattern("xor2"), default_bit_width=bit_width)

    def generate_expected(self, test_case):
        return {"o": test_case["i0"] ^ test_case["i1"]}