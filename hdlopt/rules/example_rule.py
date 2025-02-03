from .base import Rule
from ..patterns.string_match import StringMatchPattern

class ExampleModuleRule(Rule):
    def __init__(self, default_bit_width=8):
        super().__init__(
            input_vars=["clk", "rst_n", "data_in"],
            output_vars=["data_out"],
            name="ExampleModuleRule",
            pattern=StringMatchPattern("example_module"),
            default_bit_width=default_bit_width
        )

    def generate_expected(self, test_case):
        """Generate expected outputs for given inputs."""
        # Simple register behavior: data_out follows data_in
        # Reset puts zeros on output
        if test_case["rst_n"] == 0:
            return {
                "data_out": 0
            }
        else:
            return {
                "data_out": test_case["data_in"]
            }