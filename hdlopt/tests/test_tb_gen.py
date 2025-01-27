import json

import pytest

from ..rules.base import MockRule
from ..scripts.testbench.core import (
    ConstraintConfig,
    SignalConfig,
    TestbenchGenerator,
    TimingConfig,
)


@pytest.fixture
def sample_component():
    """Create sample component details"""
    return {
        "component_name": "test_component",
        "parameters": [
            {"name": "WIDTH", "value": "8"},
            {"name": "DEPTH", "value": "4"},
        ],
        "inputs": [
            ["data_in", "wire", "unsigned", "WIDTH-1:0"],
            ["clk", "wire", "unsigned", "1"],
            ["rst", "wire", "unsigned", "1"],
        ],
        "outputs": [["data_out", "reg", "unsigned", "WIDTH-1:0"]],
    }


@pytest.fixture
def temp_component_dir(tmp_path, sample_component):
    """Create temporary component directory with files"""
    component_dir = tmp_path / "test_component"
    component_dir.mkdir()

    # Write component details
    with open(component_dir / "test_component_details.json", "w") as f:
        json.dump(sample_component, f)

    return component_dir


@pytest.fixture
def testbench_generator(temp_component_dir):
    """Create TestbenchGenerator instance"""
    return TestbenchGenerator(
        component_name="test_component",
        rules=[MockRule("test_component")],
        base_dir=str(temp_component_dir.parent),
    )


class TestTestbenchGenerator:
    """Test suite for TestbenchGenerator"""

    def test_initialization(self, testbench_generator):
        """Test basic initialization"""
        assert testbench_generator.component_name == "test_component"
        assert len(testbench_generator.rules) == 1
        assert isinstance(testbench_generator.rules[0], MockRule)
        assert isinstance(testbench_generator.constraints, ConstraintConfig)
        assert isinstance(testbench_generator.timing, TimingConfig)
        assert isinstance(testbench_generator.signals, SignalConfig)

    def test_input_range_calculation(self, testbench_generator):
        """Test input range calculation"""
        # Test single bit
        range_1bit = testbench_generator._determine_input_ranges("1", "unsigned")
        assert list(range_1bit) == [0, 1]

        # Test multi-bit unsigned
        range_4bit = testbench_generator._determine_input_ranges("3:0", "unsigned")
        assert list(range_4bit) == list(range(16))

        # Test signed
        range_signed = testbench_generator._determine_input_ranges("3:0", "signed")
        assert list(range_signed) == list(range(-8, 8))

    def test_parameter_processing(self, testbench_generator, sample_component):
        """Test parameter range processing"""
        param_ranges = testbench_generator._process_parameters(sample_component)

        assert len(param_ranges) == 2
        assert param_ranges[0] == ("WIDTH", (1, 8))
        assert param_ranges[1] == ("DEPTH", (1, 8))

    def test_test_case_generation(self, testbench_generator):
        """Test random test case generation"""
        input_ranges = {"a": [0, 3], "b": [-2, 2]}

        test_cases = testbench_generator._generate_test_cases(input_ranges, 10)

        assert len(test_cases) == 10
        for case in test_cases:
            assert 0 <= case["a"] <= 3
            assert -2 <= case["b"] <= 2

        # Test uniqueness
        assert len({frozenset(case.items()) for case in test_cases}) == 10

    def test_rule_assignment(self, testbench_generator, sample_component):
        """Test rule assignment to test cases"""
        test_cases = [{"a": 1, "b": 2}, {"a": 3, "b": 4}]

        replaced_inp = ["data_in", "wire", "unsigned", "7:0"]
        replaced_out = ["data_out", "reg", "unsigned", "7:0"]
        sample_component["inputs"][0] = replaced_inp
        sample_component["outputs"][0] = replaced_out

        expected_values = testbench_generator._assign_rules(
            test_cases, sample_component
        )

        assert len(expected_values) == 2
        assert expected_values[0] == {"y": 3}  # 1 + 2
        assert expected_values[1] == {"y": 7}  # 3 + 4
        assert "MockRule" in sample_component["rules"]

    def test_testbench_generation(self, testbench_generator, temp_component_dir):
        """Test complete testbench generation process"""
        testbench_generator.generate()

        # Check that testbench files were created
        testbench_files = list(temp_component_dir.glob("tb_*.v"))
        assert len(testbench_files) > 0

        # Verify testbench content
        with open(testbench_files[0]) as f:
            content = f.read()
            assert "module tb_" in content
            assert "test_component" in content
            assert "// Clock generation" in content
            assert "initial begin" in content

    def test_input_validation(self, testbench_generator):
        """Test input constraint validation"""

        def constrain_input(range_val):
            return [max(range_val[0], 1), range_val[1]]  # Ensure input >= 1

        testbench_generator.constraints = ConstraintConfig(
            input_constraints={"test_component": {"data_in": constrain_input}}
        )

        input_ranges = {"data_in": [0, 10], "other": [-5, 5]}
        validated = testbench_generator._validate_inputs(
            input_ranges, {"component_name": "test_component"}
        )

        assert validated["data_in"] == [1, 10]  # Constrained
        assert validated["other"] == [-5, 5]  # Unchanged

    def test_recursive_generation(self, temp_component_dir):
        """Test recursive testbench generation for hierarchical components"""
        # Create submodule
        submodule_dir = temp_component_dir / "submodule"
        submodule_dir.mkdir()

        submodule_details = {
            "component_name": "submodule",
            "parameters": [{"name": "WIDTH", "value": "4"}],
            "inputs": [["in", "wire", "unsigned", "WIDTH-1:0"]],
            "outputs": [["out", "reg", "unsigned", "WIDTH-1:0"]],
        }

        with open(submodule_dir / "submodule_details.json", "w") as f:
            json.dump(submodule_details, f)

        # Update main component with submodule
        with open(temp_component_dir / "test_component_details.json") as f:
            main_details = json.load(f)

        main_details["submodules"] = {"submodule": submodule_details}

        with open(temp_component_dir / "test_component_details.json", "w") as f:
            json.dump(main_details, f)

        # Create generator and test
        generator = TestbenchGenerator(
            component_name="test_component",
            rules=[MockRule("test_component"), MockRule("submodule")],
            base_dir=str(temp_component_dir.parent),
        )

        generator.generate(recursive=True)

        # Verify testbenches were created for both components
        assert any(f.name.startswith("tb_") for f in temp_component_dir.iterdir())
        assert any(f.name.startswith("tb_") for f in submodule_dir.iterdir())

    def test_timing_config(self, testbench_generator, temp_component_dir):
        """Test timing configuration handling"""
        testbench_generator.timing = TimingConfig(
            clk_period={"test_component": [10, 20]},  # Multiple clock domains
            operation_delay=15,
            rule_delay={"test_component": "wait(valid);"},
        )

        testbench_generator.generate()

        # Check timing in generated testbench
        testbench_files = list(temp_component_dir.glob("tb_*.v"))
        with open(testbench_files[0]) as f:
            content = f.read()
            assert "#10" in content  # Clock period
            assert "#15" in content  # Operation delay
            assert "wait(valid);" in content  # Rule delay

    def test_signal_handling(self, testbench_generator):
        """Test special signal configuration handling"""
        testbench_generator.signals = SignalConfig(
            clk_names={"test_component": ["clk", "clk2"]},
            rst_names={"test_component": ["rst_n"]},
            start_names={"test_component": ["start"]},
            valid_names={"test_component": ["valid", "data_valid"]},
        )

        # Generate test cases
        test_cases = testbench_generator._generate_test_cases(
            {"data": [0, 255]}, num_tests=5
        )

        # Verify special signals are handled correctly
        for case in test_cases:
            assert "clk" not in case
            assert "clk2" not in case
            assert "rst_n" not in case
            assert "start" not in case
            assert "valid" not in case
            assert "data_valid" not in case
            assert 0 <= case["data"] <= 255

    @pytest.mark.parametrize(
        "bit_width,sign_type,expected",
        [
            ("3:0", "unsigned", (0, 15)),
            ("7:0", "signed", (-128, 127)),
            ("1", "unsigned", (0, 1)),
            ("15:0", "unsigned", (0, 65535)),
        ],
    )
    def test_bit_width_handling(
        self, testbench_generator, bit_width, sign_type, expected
    ):
        """Test handling of different bit widths and sign types"""
        input_range = testbench_generator._determine_input_ranges(bit_width, sign_type)
        assert input_range.start == expected[0]
        assert input_range.stop - 1 == expected[1]

    def test_error_handling(self, tmp_path):
        """Test error handling for various failure cases"""
        # Test nonexistent component
        with pytest.raises(FileNotFoundError):
            TestbenchGenerator(
                component_name="nonexistent", rules=[MockRule()], base_dir=str(tmp_path)
            ).generate()

        # Test invalid parameter ranges
        test_dir = tmp_path / "test_component"
        test_dir.mkdir()
        with open(test_dir / "test_component_details.json", "w") as f:
            # Invalid parameter value that will cause ValueError
            json.dump(
                {
                    "component_name": "test_component",
                    "parameters": [{"name": "WIDTH", "value": "-1"}],
                    "inputs": [],
                    "outputs": [],
                },
                f,
            )

        generator = TestbenchGenerator(
            component_name="test_component", rules=[MockRule()], base_dir=str(tmp_path)
        )

        with pytest.raises(ValueError):
            generator._process_parameters(
                {
                    "parameters": [
                        # Invalid negative value
                        {"name": "WIDTH", "value": "-1"}
                    ]
                }
            )

        # Test missing required signals
        with pytest.raises(ValueError):
            generator.generate()
            generator._validate_inputs(
                {},
                {
                    "component_name": "test",
                    "inputs": [["input", "wire", "unsigned", "1", "clk"]],
                },
            )


if __name__ == "__main__":
    pytest.main([__file__])
