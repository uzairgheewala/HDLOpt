from .base import Rule
from ..patterns.string_match import StringMatchPattern

class PrefixSumLogicRule(Rule):
    def __init__(self, bit_width=4):
        super().__init__(input_vars=["p_i", "g_i", "p_j", "g_j"], output_vars=["p_kj", "g_kj"],
                         name="PrefixSumLogicRule", pattern=StringMatchPattern("prefix_sum_logic"), default_bit_width=bit_width)

    def generate_expected(self, test_case):
        p_kj = test_case["p_i"] & test_case["p_j"]
        g_kj = test_case["g_i"] | (test_case["p_i"] & test_case["g_j"])
        return {"p_kj": p_kj, "g_kj": g_kj}