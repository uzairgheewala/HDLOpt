from .base import Rule
from ..patterns.string_match import StringMatchPattern


class CarrySkipBlockRule(Rule):
    def __init__(self, default_bit_width=4):
        super().__init__(
            input_vars=["a", "b", "cin"],
            output_vars=["sum", "cout", "block_carry_out"],
            name="CarrySkipBlockRule",
            pattern=StringMatchPattern("carry_skip_block"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        width = self.bit_width
        carry = [0] * (width + 1)
        carry[0] = test_case["cin"]
        sum_ = [0] * width
        g = [0] * width
        p = [0] * width

        a_bits = [(test_case["a"] >> i) & 1 for i in range(width)]
        b_bits = [(test_case["b"] >> i) & 1 for i in range(width)]

        for i in range(width):
            sum_[i] = (a_bits[i] + b_bits[i] + carry[i]) & 1
            carry[i + 1] = (a_bits[i] + b_bits[i] + carry[i]) >> 1
            g[i] = a_bits[i] & b_bits[i]
            p[i] = a_bits[i] | b_bits[i]

        block_carry_out = g[width - 1] | (p[width - 1] & carry[width - 1])
        cout = carry[width]

        sum_int = sum(sum_[i] << i for i in range(width))

        return {"sum": sum_int, "cout": cout, "block_carry_out": block_carry_out}
