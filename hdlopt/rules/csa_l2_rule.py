from .base import Rule
from ..patterns.string_match import StringMatchPattern


class CarrySaveAdderL2Rule(Rule):
    def __init__(self, default_bit_width=8):
        super().__init__(
            input_vars=["a", "b", "c"],
            output_vars=["sum", "carry"],
            name="CarrySaveAdderRule",
            pattern=StringMatchPattern("carry_save_adder_l2"),
            default_bit_width=default_bit_width,
        )

    def generate_expected(self, test_case):
        max_val = (1 << self.bit_width) - 1
        sum_vals = []
        carry_vals = []

        for i in range(self.bit_width):
            a_i = (test_case["a"] >> i) & 1
            b_i = (test_case["b"] >> i) & 1
            c_i = (test_case["c"] >> i) & 1
            sum_i = a_i ^ b_i ^ c_i
            carry_i = (a_i & b_i) | (b_i & c_i) | (a_i & c_i)
            sum_vals.append(sum_i)
            carry_vals.append(carry_i)

        sum_val = sum(sum_i << i for i, sum_i in enumerate(sum_vals))
        carry_val = sum(carry_i << i for i, carry_i in enumerate(carry_vals))

        return {"sum": sum_val & max_val, "carry": carry_val & max_val}
