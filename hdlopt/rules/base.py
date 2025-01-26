from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Dict, List, Any, Optional, Type, Union
import inspect
from ..patterns.base import Pattern
from ..patterns.string_match import StringMatchPattern

@dataclass
class TestCase:
    """Represents a single test case with inputs and expected outputs."""
    inputs: Dict[str, Any]
    expected_outputs: Dict[str, Any]
    actual_outputs: Optional[Dict[str, Any]] = None
    passed: Optional[bool] = None

@dataclass
class TestResult:
    """Represents the result of running a test."""
    test_case: TestCase
    passed: bool
    rule_name: str
    error_message: Optional[str] = None

@dataclass
class BitWidthSpec:
    """Specifies bit width and signedness for a signal."""
    width: int
    signed: bool = False
    
    def get_range(self) -> tuple[int, int]:
        """Get valid range for this bit width spec."""
        if self.signed:
            min_val = -(1 << (self.width - 1))
            max_val = (1 << (self.width - 1)) - 1
        else:
            min_val = 0
            max_val = (1 << self.width) - 1
        return (min_val, max_val)

class Rule(ABC):
    """Base class for all HDL rules."""
    
    def __init__(self, input_vars: List[str], output_vars: List[str], 
                 name: str, pattern: Pattern, default_bit_width: int = 8):
        self.input_vars = input_vars
        self.output_vars = output_vars
        self.name = name
        self.pattern = pattern
        self._default_bit_width = default_bit_width
        self.bit_width = default_bit_width
        self._bit_width_specs: Dict[str, BitWidthSpec] = {}

    def __eq__(self, other):
        if not isinstance(other, Rule):
            return False
        return self.name == other.name

    def __hash__(self):
        return hash(self.name)

    def set_bit_width(self, bit_width: int) -> None:
        """Set default bit width for all signals without specific specs."""
        #self._default_bit_width = bit_width
        self.bit_width = bit_width
        # Clear any existing specs using the default
        self._bit_width_specs = {
            name: spec for name, spec in self._bit_width_specs.items()
            if spec.width != bit_width
        }

    def set_signal_spec(self, signal_name: str, width: int, signed: bool = False) -> None:
        """Set specific bit width and signedness for a signal."""
        if signal_name not in (self.input_vars + self.output_vars):
            raise ValueError(f"Unknown signal: {signal_name}")
        self._bit_width_specs[signal_name] = BitWidthSpec(width, signed)

    def get_signal_spec(self, signal_name: str) -> BitWidthSpec:
        """Get bit width spec for a signal."""
        return self._bit_width_specs.get(
            signal_name, 
            BitWidthSpec(self._default_bit_width)
        )

    @abstractmethod
    def generate_expected(self, inputs: Dict[str, Any]) -> Dict[str, Any]:
        """Generate expected outputs for given inputs."""
        pass

    def matches(self, filename: str) -> bool:
        """Check if rule matches filename."""
        return self.pattern.matches(filename)

    def __str__(self) -> str:
        return inspect.getsource(self.generate_expected)
    
class MockRule(Rule):
    """Mock rule for testing"""
    def __init__(self, matches_pattern: str = "test"):
        super().__init__(
            input_vars=["a", "b"],
            output_vars=["y"],
            name="MockRule",
            pattern=StringMatchPattern(matches_pattern)
        )
        
    def generate_expected(self, inputs):
        return {"y": inputs["a"] + inputs["b"]}