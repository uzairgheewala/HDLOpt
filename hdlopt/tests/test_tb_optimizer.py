import json
import os
import shutil
import tempfile
from pathlib import Path
from unittest.mock import MagicMock, patch

import numpy as np
import pytest

from ..scripts.testbench.optimizer import (
    ModuleComplexity,
    TestCaseMetrics,
    TestOptimizer,
)


@pytest.fixture
def setup_component_dir(tmp_path):
    """Set up a temporary component directory structure."""
    # Create component directory
    comp_dir = tmp_path / "test_adder"
    comp_dir.mkdir(parents=True)

    # Create a mock details file
    details = {
        "component_name": "test_adder",
        "parameters": [{"name": "WIDTH", "value": "8"}],
        "inputs": [
            ["a", "wire", "unsigned", "WIDTH-1:0"],
            ["b", "wire", "unsigned", "WIDTH-1:0"],
            ["clk", "wire", "unsigned", "1"],
            ["rst", "wire", "unsigned", "1"],
        ],
        "outputs": [
            ["sum", "wire", "unsigned", "WIDTH-1:0"],
            ["cout", "wire", "unsigned", "1"],
        ],
        "internals": [
            ["carry", "wire", "unsigned", "WIDTH-1:0"],
            ["temp", "reg", "unsigned", "WIDTH-1:0"],
        ],
        "mode": "combinational",
    }

    with open(comp_dir / "test_adder_details.json", "w") as f:
        json.dump(details, f)

    return tmp_path, details


@pytest.fixture
def sample_module_details(setup_component_dir):
    """Create sample module details dictionary."""
    _, details = setup_component_dir
    return details


@pytest.fixture
def sample_input_ranges():
    """Create sample input ranges dictionary."""
    return {"a": [0, 255], "b": [0, 255]}


@pytest.fixture
def mock_rules():
    """Create mock rules for testing."""
    mock_rule = MagicMock()
    mock_rule.name = "test_rule"
    mock_rule.matches.return_value = True
    mock_rule.generate_expected.return_value = {"sum": 0, "cout": 0}
    mock_rule.set_bit_width = MagicMock()
    return [mock_rule]


@pytest.fixture
def temp_optimizer(setup_component_dir, mock_rules):
    """Create TestOptimizer instance with temporary directory."""
    base_path, _ = setup_component_dir
    optimizer = TestOptimizer(base_path=base_path, max_parallel=2, rules=mock_rules)
    return optimizer


@pytest.fixture
def metrics_db():
    """Create sample metrics database."""
    return {
        "test_adder": {
            "complexity": 0.45,
            "test_cases": [
                {"execution_time": 0.1, "memory_usage": 50.0, "file_size": 1024},
                {"execution_time": 0.15, "memory_usage": 52.0, "file_size": 1024},
            ],
        }
    }


class TestModuleComplexity:
    """Test suite for ModuleComplexity class."""

    def test_calculation(self):
        """Test complexity score calculation."""
        complexity = ModuleComplexity(
            param_count=2,
            input_width_total=16,
            output_width_total=8,
            state_bits=32,
            submodule_count=3,
            sequential=True,
        )

        score = complexity.calculate_score()

        # Verify components:
        # params: 0.02 * 2 = 0.04
        # inputs: 0.25 * log1p(16) ≈ 0.7
        # outputs: 0.25 * log1p(8) ≈ 0.54
        # state: 0.4 * log1p(32) ≈ 1.4
        # submodules: 0.05 * 3 = 0.15
        # sequential: 0.5
        # Total ≈ 3.33
        assert 3.2 < score < 3.5

    def test_normalized_score(self):
        """Test normalized complexity score."""
        # Create near-maximum complexity
        max_complexity = ModuleComplexity(
            param_count=50,
            input_width_total=4096,
            output_width_total=4096,
            state_bits=4096,
            submodule_count=100,
            sequential=True,
        )

        norm_score = max_complexity.normalized_score()
        assert 0.9 < norm_score <= 1.0

        # Create minimal complexity
        min_complexity = ModuleComplexity(
            param_count=1,
            input_width_total=1,
            output_width_total=1,
            state_bits=0,
            submodule_count=0,
            sequential=False,
        )

        norm_score = min_complexity.normalized_score()
        assert 0 < norm_score < 0.1


class TestTestOptimizer:
    """Test suite for TestOptimizer class."""

    def test_calculate_module_complexity(self, temp_optimizer, sample_module_details):
        """Test module complexity calculation."""
        complexity = temp_optimizer.calculate_module_complexity(sample_module_details)

        assert isinstance(complexity, ModuleComplexity)
        assert complexity.param_count == 1
        assert complexity.input_width_total == 18  # 8+8+1+1
        assert complexity.output_width_total == 9  # 8+1
        assert complexity.state_bits == 8  # One 8-bit reg
        assert not complexity.sequential  # Marked as combinational

        # Test sequential mode
        sample_module_details["mode"] = "sequential"
        seq_complexity = temp_optimizer.calculate_module_complexity(
            sample_module_details
        )
        assert seq_complexity.sequential
        assert seq_complexity.calculate_score() > complexity.calculate_score()

    def test_estimate_execution_time(self, temp_optimizer, sample_module_details):
        """Test execution time estimation."""
        complexity = temp_optimizer.calculate_module_complexity(sample_module_details)

        # Test without history
        time_est = temp_optimizer.estimate_execution_time(complexity, 100)
        assert time_est > 0

        # Test with history
        temp_optimizer.metrics_db = {
            "test_adder": {
                "complexity": complexity.calculate_score(),
                "test_cases": [{"execution_time": 0.1} for _ in range(5)],
            }
        }

        time_est = temp_optimizer.estimate_execution_time(complexity, 100)
        expected_time = 100 * 0.1  # 100 cases * 0.1s per case
        assert abs(time_est - expected_time) < 0.1 * expected_time  # 10% tolerance

    def test_identify_edge_cases(self, temp_optimizer, sample_input_ranges):
        """Test edge case identification."""
        special_signals = {"clk", "rst"}
        edge_cases = temp_optimizer.identify_edge_cases(
            sample_input_ranges, special_signals
        )

        # Verify edge cases
        assert len(edge_cases) > 0
        for case in edge_cases:
            # Check no special signals included
            assert not any(sig in case for sig in special_signals)

            # Verify values are valid edge cases
            for signal, value in case.items():
                min_val, max_val = sample_input_ranges[signal]
                assert min_val <= value <= max_val

    def test_split_test_cases(self, temp_optimizer, sample_module_details):
        """Test splitting test cases into batches."""
        complexity = temp_optimizer.calculate_module_complexity(sample_module_details)

        # Create test cases
        edge_cases = [{"a": 0, "b": 0}, {"a": 255, "b": 255}]
        regular_cases = [{"a": i, "b": i} for i in range(1, 1000)]

        batches = temp_optimizer.split_test_cases(regular_cases, edge_cases, complexity)

        # Verify batching
        assert len(batches) > 0
        assert edge_cases[0] in batches[0]  # Edge cases in first batch
        assert len(batches[0]) <= temp_optimizer.target_cases

    @patch("hdlopt.scripts.testbench.optimizer.ProcessPoolExecutor")
    def test_parallel_generate_testbenches(
        self, mock_executor, temp_optimizer, sample_module_details
    ):
        """Test parallel testbench generation."""
        test_batches = [[{"a": 0, "b": 0}], [{"a": 1, "b": 1}]]

        # Create a mock Future object
        def create_mock_future():
            future = MagicMock()
            future.result.return_value = TestCaseMetrics(
                generation_time=0.1,
                execution_time=0.1,
                memory_usage=50.0,
                file_size=1024,
            )
            return future

        # Set up the mock executor
        mock_context = MagicMock()
        mock_context.submit = MagicMock(return_value=create_mock_future())
        mock_executor.return_value.__enter__.return_value = mock_context

        # Mock the testbench generation function to avoid actual file
        # operations
        with patch(
            "hdlopt.scripts.testbench.core.TestbenchGenerator.generate"
        ) as mock_generate, patch("pathlib.Path.stat") as mock_stat:
            mock_generate.return_value = None
            # Mock stat to return an object with st_size attribute
            mock_stat_result = MagicMock()
            mock_stat_result.st_size = 1024
            mock_stat.return_value = mock_stat_result

            # Create necessary directory structure
            os.makedirs(
                os.path.join(temp_optimizer.base_path, "test_adder"), exist_ok=True
            )

            temp_optimizer.parallel_generate_testbenches(
                test_batches, sample_module_details, Path(temp_optimizer.base_path)
            )

            # Verify the executor was used correctly
            assert mock_context.submit.call_count == len(test_batches)

    @patch("concurrent.futures.ThreadPoolExecutor")
    def test_parallel_execute_testbenches(self, mock_executor, temp_optimizer):
        """Test parallel testbench execution."""
        # Setup mock results
        mock_result = {
            "result": MagicMock(),
            "metrics": TestCaseMetrics(
                execution_time=0.1, memory_usage=50.0, file_size=1024
            ),
        }
        mock_future = MagicMock()
        mock_future.result.return_value = mock_result
        mock_executor.return_value.__enter__.return_value.submit.return_value = (
            mock_future
        )

        # Mock the Runner class
        mock_runner = MagicMock()
        mock_runner.run.return_value = mock_result["result"]

        with patch(
            "hdlopt.scripts.testbench.optimizer.Runner", return_value=mock_runner
        ):
            testbench_files = [Path("tb_1.v"), Path("tb_2.v")]
            results = temp_optimizer.parallel_execute_testbenches(testbench_files)

        assert len(results) == len(testbench_files)
        assert all(isinstance(r["metrics"], TestCaseMetrics) for r in results.values())

    def test_coverage_matrix(self, temp_optimizer, sample_input_ranges):
        """Test coverage matrix generation."""
        test_cases = [{"a": 0, "b": 0}, {"a": 255, "b": 255}, {"a": 128, "b": 128}]

        matrix = temp_optimizer.generate_coverage_matrix(
            test_cases, sample_input_ranges, granularity=0.1
        )

        # Verify matrix properties
        assert isinstance(matrix, np.ndarray)
        assert matrix.ndim == len(sample_input_ranges)
        assert np.sum(matrix > 0) == len(test_cases)

    def test_optimize_test_selection(self, temp_optimizer, sample_input_ranges):
        """Test test case optimization."""
        # Generate test cases
        test_cases = []
        # Add edge cases
        test_cases.extend(
            [
                {"a": 0, "b": 0},
                {"a": 255, "b": 255},
                {"a": 0, "b": 255},
                {"a": 255, "b": 0},
            ]
        )
        # Add regular cases
        test_cases.extend([{"a": i, "b": i} for i in range(1, 100)])

        target_cases = 10
        optimized = temp_optimizer.optimize_test_selection(
            test_cases, sample_input_ranges, target_cases
        )

        # Verify optimization
        assert len(optimized) == target_cases
        # Edge cases should be preserved
        assert {"a": 0, "b": 0} in optimized
        assert {"a": 0, "b": 255} in optimized

    def test_coverage_visualization(self, temp_optimizer, sample_input_ranges):
        """Test coverage visualization generation."""
        test_cases = temp_optimizer.generate_test_distribution(sample_input_ranges, 100)

        temp_dir = Path(tempfile.mkdtemp())
        try:
            output_path = temp_dir / "coverage.png"
            temp_optimizer.visualize_coverage(
                test_cases, sample_input_ranges, output_path
            )
            assert output_path.exists()
            assert output_path.stat().st_size > 0
        finally:
            shutil.rmtree(temp_dir)

    def test_metrics_db_handling(self, temp_optimizer, metrics_db):
        """Test metrics database operations."""
        # Ensure base path exists
        temp_optimizer.base_path.mkdir(parents=True, exist_ok=True)

        # Test saving
        temp_optimizer.metrics_db = metrics_db

        db_path = temp_optimizer.base_path / "test_metrics.json"
        assert db_path.exists()

        # Test loading
        loaded_db = temp_optimizer.metrics_db
        assert loaded_db == metrics_db

    @pytest.mark.parametrize(
        "num_cases,available_time,expected_success",
        [
            (1000, 60, True),  # Should fit in time
            (100000, 1, False),  # Too many cases for time
            (500, None, True),  # No time constraint
        ],
    )
    def test_time_constrained_optimization(
        self,
        temp_optimizer,
        sample_module_details,
        sample_input_ranges,
        num_cases,
        available_time,
        expected_success,
    ):
        """Test optimization with time constraints."""
        complexity = temp_optimizer.calculate_module_complexity(sample_module_details)

        with patch.object(temp_optimizer, "estimate_execution_time") as mock_estimate:
            # Set fixed time per case for predictable testing
            mock_estimate.return_value = num_cases * 0.001  # 1ms per case

            est_time = temp_optimizer.estimate_execution_time(complexity, num_cases)

            if available_time is not None:
                success = est_time <= available_time
                assert success == expected_success
            else:
                assert expected_success  # No time constraint always succeeds

    def test_adaptive_test_planning(self, temp_optimizer, sample_module_details):
        """Test adaptive test planning."""
        plan = temp_optimizer.adaptive_test_planning(
            sample_module_details, total_cases=1000, available_time=60.0
        )

        assert isinstance(plan, dict)
        assert "feasible" in plan
        if plan["feasible"]:
            assert "test_plan" in plan
            assert plan["test_plan"]["total_cases"] == 1000
        else:
            assert "recommendation" in plan
            assert plan["recommendation"]["total_batches"] > 0


if __name__ == "__main__":
    pytest.main([__file__])
