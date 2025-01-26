from .base import Rule
from ..patterns.substring import SubstringPattern

class CounterRule(Rule):
    def __init__(self, default_bit_width=4):
        super().__init__(
            input_vars=["clk", "rst"],
            output_vars=["count"],
            name="CounterRule",
            pattern=SubstringPattern("counter"),
            default_bit_width=default_bit_width
        )
        self._prev_count = 0  # To track counter state between test cases

    def generate_expected(self, test_case):
        # Handle synchronous counter behavior
        if test_case.get("clk_rising", False):
            if test_case.get("rst", 0):
                self._prev_count = 0
            else:
                max_val = (1 << self.bit_width) - 1
                self._prev_count = (self._prev_count + 1) & max_val
        
        return {
            "count": self._prev_count if test_case.get("clk", 0) else "x"
        }

    def reset(self):
        """Reset internal state between test sequences"""
        self._prev_count = 0