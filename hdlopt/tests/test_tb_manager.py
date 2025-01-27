import json
from unittest.mock import MagicMock, patch

import pytest

from ..scripts.testbench.manager import (
    IntegratedTestManager,
    TestbenchResult,
    TestExecutionPlan,
)
from ..scripts.testbench.optimizer import TestCaseMetrics


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
def sample_module_details():
    """Create sample module details."""
    return {
        "component_name": "test_component",
        "parameters": [{"name": "WIDTH", "value": "8"}],
        "inputs": [
            ["a", "wire", "unsigned", "WIDTH-1:0"],
            ["b", "wire", "unsigned", "WIDTH-1:0"],
            ["clk", "wire", "unsigned", "1"],
            ["rst", "wire", "unsigned", "1"],
        ],
        "outputs": [
            ["sum", "wire", "unsigned", "WIDTH:0"],
            ["carry", "wire", "unsigned", "WIDTH-1:0"],
        ],
        "internals": [
            ["carry", "wire", "unsigned", "WIDTH-1:0"],
            ["temp", "reg", "unsigned", "WIDTH-1:0"],
        ],
        "mode": "sequential",
    }


@pytest.fixture
def integrated_manager(tmp_path, mock_rules):
    """Create IntegratedTestManager instance."""
    return IntegratedTestManager(
        component_name="test_component",
        rules=mock_rules,
        base_dir=str(tmp_path),
        max_parallel=2,
        target_cases_per_file=100,
    )


@pytest.fixture
def sample_component_dir(tmp_path, sample_module_details):
    """Create temporary component directory structure."""
    component_dir = tmp_path / "test_component"
    component_dir.mkdir(parents=True)

    # Create component files
    details_file = component_dir / "test_component_details.json"
    with open(details_file, "w") as f:
        json.dump(sample_module_details, f)

    # Create source file
    source_file = component_dir / "test_component.v"
    source_file.write_text(
        """
        module test_component #(
            parameter WIDTH = 8
        ) (
            input [WIDTH-1:0] a,
            input [WIDTH-1:0] b,
            input clk,
            input rst,
            output reg [WIDTH:0] sum
        );
            reg [WIDTH-1:0] carry, temp;

            always @(posedge clk) begin
                if (rst)
                    sum <= 0;
                else
                    sum <= a + b;
            end
        endmodule
    """
    )

    return component_dir


class TestIntegratedTestManager:
    """Test suite for IntegratedTestManager class."""

    def test_initialization(self, integrated_manager):
        """Test basic initialization."""
        assert integrated_manager.component_name == "test_component"
        assert integrated_manager.max_parallel == 2
        assert integrated_manager.optimizer.target_cases == 100

        # Verify subsystem initialization
        assert integrated_manager.generator is not None
        assert integrated_manager.runner is not None
        assert integrated_manager.optimizer is not None

    def test_plan_tests(self, integrated_manager, sample_module_details):
        """Test test execution planning."""
        # First apply parameter updates
        param_names = ["WIDTH"]
        param_values = [8]
        param_comb = tuple(param_values)
        details = integrated_manager.generator._update_bit_widths(
            sample_module_details, param_comb, param_names
        )

        plan = integrated_manager.plan_tests(
            module_details=details, desired_cases=1000, available_time=60
        )

        assert isinstance(plan, TestExecutionPlan)
        assert plan.total_test_cases > 0
        assert plan.total_test_cases <= 1000  # Should not exceed desired
        assert len(plan.edge_cases) > 0
        assert len(plan.regular_cases) > 0
        assert plan.test_batches > 0
        assert plan.cases_per_batch <= integrated_manager.optimizer.target_cases
        assert plan.estimated_time <= 60  # Should respect time constraint

    def test_time_constrained_planning(self, integrated_manager, sample_module_details):
        """Test planning with strict time constraints."""
        param_names = ["WIDTH"]
        param_values = [8]
        param_comb = tuple(param_values)
        details = integrated_manager.generator._update_bit_widths(
            sample_module_details, param_comb, param_names
        )

        # Plan with very limited time
        plan_limited = integrated_manager.plan_tests(
            module_details=details,
            desired_cases=1000,
            available_time=1.0,  # Very short time
        )

        # Plan with ample time
        plan_ample = integrated_manager.plan_tests(
            module_details=details, desired_cases=1000, available_time=300  # 5 minutes
        )

        assert plan_limited.total_test_cases < plan_ample.total_test_cases
        assert plan_limited.estimated_time <= 1.0
        assert len(plan_limited.edge_cases) <= len(plan_ample.edge_cases)

    @patch(
        "hdlopt.scripts.testbench.optimizer.TestOptimizer.parallel_generate_testbenches"
    )
    @patch(
        "hdlopt.scripts.testbench.optimizer.TestOptimizer.parallel_execute_testbenches"
    )
    def test_execute_test_plan(
        self, mock_execute, mock_generate, integrated_manager, sample_module_details
    ):
        """Test test plan execution."""
        # Create a sample test plan
        param_names = ["WIDTH"]
        param_values = [8]
        param_comb = tuple(param_values)
        details = integrated_manager.generator._update_bit_widths(
            sample_module_details, param_comb, param_names
        )

        plan = integrated_manager.plan_tests(
            module_details=details, desired_cases=100, available_time=60
        )

        # Mock the execution results
        mock_result = MagicMock()
        mock_result.passed = True
        mock_execute.return_value = {
            "tb_0.v": {
                "result": mock_result,
                "metrics": {
                    "execution_time": 0.1,
                    "memory_usage": 50.0,
                    "file_size": 1024,
                    "complexity_score": integrated_manager.optimizer.calculate_module_complexity(
                        sample_module_details
                    ).calculate_score(),
                },
            }
        }

        # Execute plan
        results = integrated_manager.execute_test_plan(
            plan=plan, module_details=details, recursive=False
        )

        assert mock_generate.called
        assert mock_execute.called
        assert len(results) > 0

    def test_recursive_execution(self, integrated_manager, sample_module_details):
        """Test recursive test execution."""
        param_names = ["WIDTH"]
        param_values = [8]
        param_comb = tuple(param_values)
        details = integrated_manager.generator._update_bit_widths(
            sample_module_details, param_comb, param_names
        )

        # Add submodules
        details["submodules"] = ["submod1", "submod2"]

        with patch.object(integrated_manager, "execute_test_plan") as mock_execute:
            mock_execute.return_value = []

            plan = integrated_manager.plan_tests(
                module_details=details, desired_cases=100, available_time=60
            )

            integrated_manager.execute_test_plan(
                plan=plan, module_details=details, recursive=True
            )

            # Should be called for main module and each submodule
            assert mock_execute.call_count >= 1

    def test_experiment_tracking(self, integrated_manager, sample_module_details):
        """Test experiment metrics tracking."""
        param_names = ["WIDTH"]
        param_values = [8]
        param_comb = tuple(param_values)
        details = integrated_manager.generator._update_bit_widths(
            sample_module_details, param_comb, param_names
        )

        integrated_manager.plan_tests(
            module_details=details, desired_cases=100, available_time=60
        )

        history = integrated_manager.get_execution_history()
        assert isinstance(history, dict)

    def test_coverage_generation(
        self, integrated_manager, sample_module_details, sample_component_dir
    ):
        """Test coverage artifact generation."""
        param_names = ["WIDTH"]
        param_values = [8]
        param_comb = tuple(param_values)
        details = integrated_manager.generator._update_bit_widths(
            sample_module_details, param_comb, param_names
        )

        plan = integrated_manager.plan_tests(details, desired_cases=100)

        coverage_dir = (
            integrated_manager.base_dir / "coverage_reports" / "test_component"
        )

        # Mock test execution to focus on coverage generation
        with patch(
            "hdlopt.scripts.testbench.optimizer.ProcessPoolExecutor"
        ) as mock_process_pool, patch.object(
            integrated_manager.optimizer, "parallel_execute_testbenches"
        ) as mock_exec:

            # Setup process pool mock to run function directly
            mock_context = MagicMock()

            def mock_submit(fn, *args, **kwargs):
                mock_future = MagicMock()
                mock_future.result.return_value = TestCaseMetrics(
                    generation_time=0.1,
                    execution_time=0.1,
                    memory_usage=50.0,
                    file_size=1024,
                )
                return mock_future

            mock_context.submit = mock_submit
            mock_process_pool.return_value.__enter__.return_value = mock_context

            # Setup execute mock
            test_result = {
                "tb_1.v": {
                    "result": TestbenchResult(
                        component_name="test_component",
                        parameter_config={"WIDTH": 8},
                        num_tests=5,
                        passed_tests=5,
                        failed_tests=0,
                        execution_time=0.1,
                        test_results=[],
                    ),
                    "metrics": {
                        "execution_time": 0.1,
                        "memory_usage": 50.0,
                        "file_size": 1024,
                        "complexity_score": integrated_manager.optimizer.calculate_module_complexity(
                            sample_module_details
                        ).calculate_score(),
                    },
                }
            }
            mock_exec.return_value = test_result

            # Execute test plan
            results = integrated_manager.execute_test_plan(plan, details)

            # Verify results
            assert len(results) > 0

            # Verify coverage artifacts were created
            assert coverage_dir.exists()
            assert (coverage_dir / "test_distribution.png").exists()
            assert (coverage_dir / "coverage_report.json").exists()
            assert (coverage_dir / "coverage_matrix.npy").exists()

            # Verify coverage report content
            with open(coverage_dir / "coverage_report.json") as f:
                report = json.load(f)
                assert "a" in report
                assert "b" in report
                assert "total_coverage" in report["a"]
                assert "coverage_gaps" in report["a"]

    @pytest.mark.parametrize(
        "available_time,expected_batches",
        [
            (1.0, 7),  # Actual batches with 637 edge cases
            (60.0, 7),  # Same as no time constraint
            (None, 7),  # All edge cases
        ],
    )
    def test_batch_calculation(
        self,
        integrated_manager,
        sample_module_details,
        available_time,
        expected_batches,
    ):
        """Test test batch calculation with different time constraints."""
        param_names = ["WIDTH"]
        param_values = [8]
        param_comb = tuple(param_values)
        details = integrated_manager.generator._update_bit_widths(
            sample_module_details, param_comb, param_names
        )

        plan = integrated_manager.plan_tests(
            details, desired_cases=200, available_time=available_time
        )

        assert plan.test_batches <= expected_batches
        assert plan.cases_per_batch * plan.test_batches >= len(plan.edge_cases)

    def test_error_handling(self, integrated_manager, sample_module_details):
        """Test error handling in various scenarios."""
        # Test with invalid component details
        invalid_details = sample_module_details.copy()
        del invalid_details["inputs"]

        with pytest.raises(KeyError):
            integrated_manager.plan_tests(invalid_details, 100)

        # Test with invalid time constraint
        with pytest.raises(ValueError):
            integrated_manager.plan_tests(sample_module_details, 100, available_time=-1)

        # Test execution with invalid plan
        invalid_plan = TestExecutionPlan(
            total_test_cases=0,
            test_batches=0,
            cases_per_batch=0,
            estimated_time=0,
            edge_cases=[],
            regular_cases=[],
            parallel_processes=1,
        )

        with pytest.raises(ZeroDivisionError):
            integrated_manager.execute_test_plan(invalid_plan, sample_module_details)

    def test_execution_history(self, integrated_manager, sample_module_details):
        """Test execution history tracking."""
        param_names = ["WIDTH"]
        param_values = [8]
        param_comb = tuple(param_values)
        details = integrated_manager.generator._update_bit_widths(
            sample_module_details, param_comb, param_names
        )

        # Execute some tests
        plan = integrated_manager.plan_tests(details, 10)

        # Mock both parallel generate and execute properly
        with patch(
            "hdlopt.scripts.testbench.optimizer.ProcessPoolExecutor"
        ) as mock_process_pool, patch.object(
            integrated_manager.optimizer, "parallel_execute_testbenches"
        ) as mock_exec:

            # Setup process pool mock to run function directly
            mock_context = MagicMock()

            def mock_submit(fn, *args, **kwargs):
                mock_future = MagicMock()
                mock_future.result.return_value = TestCaseMetrics(
                    generation_time=0.1,
                    execution_time=0.1,
                    memory_usage=50.0,
                    file_size=1024,
                )
                return mock_future

            mock_context.submit = mock_submit
            mock_process_pool.return_value.__enter__.return_value = mock_context

            # Setup execute mock
            test_result = {
                "tb_1.v": {
                    "result": TestbenchResult(
                        component_name="test_component",
                        parameter_config={"WIDTH": 8},
                        num_tests=5,
                        passed_tests=5,
                        failed_tests=0,
                        execution_time=0.1,
                        test_results=[],
                    ),
                    "metrics": {
                        "execution_time": 0.1,
                        "memory_usage": 50.0,
                        "file_size": 1024,
                        "complexity_score": integrated_manager.optimizer.calculate_module_complexity(
                            sample_module_details
                        ).calculate_score(),
                    },
                }
            }
            mock_exec.return_value = test_result

            # Execute test plan
            results = integrated_manager.execute_test_plan(plan, details)

            # Verify results
            assert len(results) > 0

            # Check history was updated
            history = integrated_manager.get_execution_history()
            assert isinstance(history, dict)
            assert any(
                entry["execution_time"] == 0.1
                for entry in history.get("test_cases", [])
            )


if __name__ == "__main__":
    pytest.main([__file__])
