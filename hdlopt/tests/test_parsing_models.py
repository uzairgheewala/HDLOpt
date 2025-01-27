"""Tests for Verilog parser data models."""

import pytest

from ..scripts.parsing.exceptions import SerializationError
from ..scripts.parsing.models import Signal, VerilogModule


class TestSignal:
    """Test suite for Signal class."""

    def test_signal_creation(self):
        """Test basic signal creation with default values."""
        signal = Signal(name="clk", type="wire")
        assert signal.name == "clk"
        assert signal.type == "wire"
        assert signal.sign == "unsigned"
        assert signal.bit_width == "1"
        assert signal.comment == ""
        assert signal.default_value is None

    def test_signal_full_initialization(self):
        """Test signal creation with all attributes specified."""
        signal = Signal(
            name="data",
            type="reg",
            sign="signed",
            bit_width="7:0",
            comment="Data input",
            default_value="8'b0",
        )
        assert signal.name == "data"
        assert signal.type == "reg"
        assert signal.sign == "signed"
        assert signal.bit_width == "7:0"
        assert signal.comment == "Data input"
        assert signal.default_value == "8'b0"

    def test_signal_serialization(self):
        """Test signal serialization to and from dictionary."""
        original = Signal(
            name="addr",
            type="wire",
            sign="unsigned",
            bit_width="31:0",
            comment="Address bus",
            default_value="32'b0",
        )

        # Test to_dict
        data = original.to_dict()
        assert isinstance(data, dict)
        assert data["name"] == "addr"
        assert data["type"] == "wire"
        assert data["bit_width"] == "31:0"

        # Test from_dict
        reconstructed = Signal.from_dict(data)
        assert reconstructed.name == original.name
        assert reconstructed.type == original.type
        assert reconstructed.sign == original.sign
        assert reconstructed.bit_width == original.bit_width
        assert reconstructed.comment == original.comment
        assert reconstructed.default_value == original.default_value


class TestVerilogModule:
    """Test suite for VerilogModule class."""

    @pytest.fixture
    def sample_module(self):
        """Create a sample module for testing."""
        module = VerilogModule(name="test_module")
        module.add_parameter("WIDTH", "8", "Data width")

        # Add some signals
        module.add_signal(Signal("clk", "wire", comment="Clock signal"), "input")
        module.add_signal(
            Signal("data", "reg", "signed", "WIDTH-1:0", "Data output", "8'b0"),
            "output",
        )
        module.add_signal(Signal("temp", "wire", bit_width="8"), "internal")

        # Add a submodule
        module.add_submodule("counter")

        return module

    def test_module_creation(self):
        """Test basic module creation."""
        module = VerilogModule("alu")
        assert module.name == "alu"
        assert module.mode == "combinational"
        assert len(module.parameters) == 0
        assert len(module.inputs) == 0
        assert len(module.outputs) == 0
        assert len(module.internals) == 0
        assert len(module.submodules) == 0

    def test_parameter_addition(self):
        """Test adding parameters to a module."""
        module = VerilogModule("test")
        module.add_parameter("WIDTH", "8", "Data width")
        assert len(module.parameters) == 1
        param = module.parameters[0]
        assert param["name"] == "WIDTH"
        assert param["value"] == "8"
        assert param["description"] == "Data width"

    def test_signal_addition(self):
        """Test adding signals of different types."""
        module = VerilogModule("test")
        signal = Signal("clk", "wire")

        module.add_signal(signal, "input")
        assert len(module.inputs) == 1
        assert module.inputs[0].name == "clk"

        with pytest.raises(ValueError):
            module.add_signal(signal, "invalid_type")

    def test_submodule_addition(self):
        """Test adding submodules."""
        module = VerilogModule("test")
        module.add_submodule("counter")
        assert "counter" in module.submodules

        # Test duplicate addition
        module.add_submodule("counter")
        assert module.submodules.count("counter") == 1

    def test_dependencies(self):
        """Test dependency extraction."""
        module = VerilogModule("test")
        module.add_parameter("WIDTH", "8")
        module.add_submodule("counter")

        deps = module.get_dependencies()
        assert "counter.v" in deps["direct"]
        assert "WIDTH" in deps["parameters"]

    def test_metadata(self):
        """Test metadata handling."""
        module = VerilogModule("test")
        module.set_file_metadata("test.v", "2025-01-17T10:30:00Z")

        assert module._metadata["file_path"] == "test.v"
        assert module._metadata["last_modified"] == "2025-01-17T10:30:00Z"
        assert "parse_time" in module._metadata
        assert "parser_version" in module._metadata

    def test_serialization(self, sample_module):
        """Test module serialization to and from dictionary."""
        # Test to_dict
        data = sample_module.to_dict()
        assert isinstance(data, dict)
        assert data["component_name"] == "test_module"
        assert len(data["parameters"]) == 1
        assert len(data["inputs"]) == 1
        assert len(data["outputs"]) == 1
        assert len(data["internals"]) == 1
        assert "metadata" in data
        assert "dependencies" in data

        # Test from_dict
        reconstructed = VerilogModule.from_dict(data)
        assert reconstructed.name == sample_module.name
        assert len(reconstructed.parameters) == len(sample_module.parameters)
        assert len(reconstructed.inputs) == len(sample_module.inputs)
        assert len(reconstructed.outputs) == len(sample_module.outputs)
        assert reconstructed.mode == sample_module.mode

    def test_serialization_error(self):
        """Test serialization error handling."""
        module = VerilogModule("test")
        # Create a condition that would cause serialization to fail
        # This should be a Signal object
        module.inputs.append("invalid_signal")

        with pytest.raises(SerializationError):
            module.to_dict()
