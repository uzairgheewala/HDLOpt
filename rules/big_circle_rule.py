from .base import Rule
from ..patterns.string_match import StringMatchPattern

class BigCircleRule(Rule):
    def __init__(self, default_bit_width=4):
        super().__init__(input_vars=["Gi", "Pi", "GiPrev", "PiPrev"], output_vars=["G", "P"],
                         name="BigCircleRule", pattern=StringMatchPattern("big_circle"), default_bit_width=default_bit_width)

    def generate_expected(self, test_case):
        width = self.bit_width
        G = [0] * width
        P = [0] * width

        for i in range(width):
            e = (test_case["Pi"] >> i) & 1 & (test_case["GiPrev"] >> i) & 1
            G[i] = e | (test_case["Gi"] >> i) & 1
            P[i] = (test_case["Pi"] >> i) & 1 & (test_case["PiPrev"] >> i) & 1

        G_int = sum(G[i] << i for i in range(width))
        P_int = sum(P[i] << i for i in range(width))

        return {
            "G": G_int,
            "P": P_int
        }