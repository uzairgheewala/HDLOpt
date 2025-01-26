from .base import Rule
from ..patterns.string_match import StringMatchPattern
from .logical_shifter_rule import LogicalShifterRule
from .arithmetic_shifter_rule import ArithmeticShifterRule

class ConditionalShifterRule(Rule):
    def __init__(self, bit_width=32):
        super().__init__(
            input_vars=["signed_data_in", "unsigned_data_in", "shift_amount", "shifter_sel", "direction"],
            output_vars=["data_out"],
            name="ConditionalShifterRule", 
            pattern=StringMatchPattern("conditional_shifter"), 
            default_bit_width=bit_width
        )
        # Main data paths
        self.set_signal_spec("signed_data_in", bit_width, signed=True)
        self.set_signal_spec("unsigned_data_in", bit_width, signed=False)
        self.set_signal_spec("data_out", bit_width, signed=False)  # Output matches input width
        
        # Control signals
        shift_bits = (bit_width - 1).bit_length()  # $clog2(N) in Verilog
        self.set_signal_spec("shift_amount", shift_bits, signed=False)
        self.set_signal_spec("shifter_sel", 1, signed=False)  # 1-bit control
        self.set_signal_spec("direction", 1, signed=False)    # 1-bit control

        # Initialize sub-rules with same bit width
        self.logical_shifter = LogicalShifterRule(bit_width)
        self.arithmetic_shifter = ArithmeticShifterRule(bit_width)

    def generate_expected(self, test_case):
        shift_amount = test_case["shift_amount"]
        direction = test_case["direction"]
        mask = (1 << self.bit_width) - 1
        
        if test_case["shifter_sel"] == 0:
            # Use Arithmetic Shifter - need to mask result to match Verilog behavior
            result = self.arithmetic_shifter.generate_expected({
                "data_in": test_case["signed_data_in"],
                "shift_amount": shift_amount,
                "direction": direction
            })["data_out"]
            # Convert signed result to unsigned value with mask
            return {"data_out": result & mask}
        else:
            # Use Logical Shifter - already unsigned
            return {
                "data_out": self.logical_shifter.generate_expected({
                    "data_in": test_case["unsigned_data_in"],
                    "shift_amount": shift_amount,
                    "direction": direction
                })["data_out"]
            }

    """
    def generate_expected(self, test_case):
        shift_amount = test_case["shift_amount"]
        direction = test_case["direction"]
        
        if test_case["shifter_sel"] == 0:
            # Use Arithmetic Shifter
            return self.arithmetic_shifter.generate_expected({
                "data_in": test_case["signed_data_in"],
                "shift_amount": shift_amount,
                "direction": direction
            })
        elif test_case["shifter_sel"] == 1:
            # Use Logical Shifter
            return self.logical_shifter.generate_expected({
                "data_in": test_case["unsigned_data_in"],
                "shift_amount": shift_amount,
                "direction": direction
            })
        else:
            # Default to logical shifter if unspecified (same as shifter_sel == 1)
            return self.logical_shifter.generate_expected({
                "data_in": test_case["unsigned_data_in"],
                "shift_amount": shift_amount,
                "direction": direction
            })
    """