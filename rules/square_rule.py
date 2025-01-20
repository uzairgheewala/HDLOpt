from .base import Rule
from ..patterns.string_match import StringMatchPattern

class SquareRule(Rule):
    def __init__(self, default_bit_width=4):
        super().__init__(input_vars=["Ai", "Bi"], output_vars=["G", "P"],
                         name="SquareRule", pattern=StringMatchPattern("square"), default_bit_width=default_bit_width)

    def generate_expected(self, test_case):
        a_bits = [(test_case["Ai"] >> i) & 1 for i in range(self.bit_width)]
        b_bits = [(test_case["Bi"] >> i) & 1 for i in range(self.bit_width)]

        G = [a_bits[i] & b_bits[i] for i in range(self.bit_width)]
        P = [a_bits[i] ^ b_bits[i] for i in range(self.bit_width)]

        G_int = sum(G[i] << i for i in range(self.bit_width))
        P_int = sum(P[i] << i for i in range(self.bit_width))

        return {
            "G": G_int,
            "P": P_int
        }