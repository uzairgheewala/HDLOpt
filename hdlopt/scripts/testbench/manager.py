import json
import math
import multiprocessing
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional

from ..logger import logger
from .core import ConstraintConfig, SignalConfig, TestbenchGenerator, TimingConfig
from .optimizer import TestOptimizer
from .runner import TestbenchResult, TestbenchRunner


@dataclass
class TestExecutionPlan:
    """Plan for testbench generation and execution."""

    total_test_cases: int
    test_batches: int
    cases_per_batch: int
    estimated_time: float
    edge_cases: List[Dict[str, int]]
    regular_cases: List[Dict[str, int]]
    parallel_processes: int


class IntegratedTestManager:
    """Coordinates test optimization, generation and execution."""

    def __init__(
        self,
        component_name: str,
        rules: List,
        base_dir: str = "generated",
        max_parallel: Optional[int] = None,
        target_cases_per_file: int = 3000,
        simulator: str = "modelsim",
        constraints: Optional[ConstraintConfig] = None,
        timing: Optional[TimingConfig] = None,
        signals: Optional[SignalConfig] = None,
    ):

        self.component_name = component_name
        self.rules = rules
        self.base_dir = Path(base_dir)
        self.max_parallel = max_parallel or multiprocessing.cpu_count()
        self.constraints = constraints
        self.timing = timing
        self.signals = signals
        self.simulator = simulator

        # Initialize subsystems
        self.optimizer = TestOptimizer(
            base_path=self.base_dir,
            max_parallel=self.max_parallel,
            target_cases_per_file=target_cases_per_file,
            rules=rules,
            constraints=constraints,
            timing=timing,
            signals=signals,
        )

        self.generator = TestbenchGenerator(
            component_name=component_name,
            rules=rules,
            constraints=constraints,
            timing=timing,
            signals=signals,
            base_dir=base_dir,
        )

        self.runner = TestbenchRunner(
            simulator=simulator, work_dir=self.base_dir, timeout=300
        )

        logger.debug(f"Initialized IntegratedTestManager for {component_name}")

    def plan_tests(
        self,
        module_details: Dict,
        desired_cases: int,
        available_time: Optional[float] = None,
    ) -> TestExecutionPlan:
        """Plan test execution based on constraints.

        Args:
            module_details: Component specification
            desired_cases: Number of test cases wanted
            available_time: Optional time constraint in seconds

        Returns:
            TestExecutionPlan
        """
        logger.debug(
            f"Planning tests for {self.component_name}: {desired_cases} cases"
        )

        # Calculate module complexity
        complexity = self.optimizer.calculate_module_complexity(module_details)
        logger.debug(
            f"Module complexity score: {complexity.calculate_score()}"
        )

        # Get input ranges
        input_ranges = self.generator._calculate_input_ranges(module_details)
        input_ranges = self.generator._validate_inputs(input_ranges, module_details)
        logger.debug(f"Valid input ranges: {input_ranges}")

        # Identify edge cases first
        special_signals = set(self.generator._get_special_signals())
        edge_cases = self.optimizer.identify_edge_cases(input_ranges, special_signals)
        logger.debug(f"Identified {len(edge_cases)} edge cases")

        # Calculate remaining regular test cases needed
        regular_cases_needed = max(0, desired_cases - len(edge_cases))

        # Generate distribution-based test cases
        regular_cases = self.optimizer.generate_test_distribution(
            input_ranges, regular_cases_needed, granularity=0.1
        )
        logger.debug(f"Generated {len(regular_cases)} regular test cases")

        # Estimate execution time
        if available_time:
            est_time = self.optimizer.estimate_execution_time(complexity, desired_cases)
            logger.debug(f"Estimated execution time: {est_time}s")

            if est_time > available_time:
                # Need to reduce test cases
                scaling_factor = available_time / est_time
                regular_cases = self.optimizer.optimize_test_selection(
                    regular_cases,
                    input_ranges,
                    int(regular_cases_needed * scaling_factor),
                )
                logger.debug(
                    f"Reduced to {len(regular_cases)} cases to meet time constraint"
                )
                est_time = available_time
        else:
            est_time = self.optimizer.estimate_execution_time(
                complexity, len(edge_cases) + len(regular_cases)
            )

        # Calculate batching
        total_cases = len(edge_cases) + len(regular_cases)
        batches = math.ceil(total_cases / self.optimizer.target_cases)
        # Ensure at least 1 batch if no cases
        batches = max(batches, 1)
        cases_per_batch = total_cases // batches if batches else 0

        logger.info(f"Test plan: {batches} batches of {cases_per_batch} cases each")

        return TestExecutionPlan(
            total_test_cases=total_cases,
            test_batches=batches,
            cases_per_batch=cases_per_batch,
            estimated_time=est_time,
            edge_cases=edge_cases,
            regular_cases=regular_cases,
            parallel_processes=self.max_parallel,
        )

    # @timing_wrapper
    def execute_test_plan(
        self, plan: TestExecutionPlan, module_details: Dict, recursive: bool = False
    ) -> List[TestbenchResult]:
        """Execute planned tests.

        Args:
            plan: Test execution plan
            module_details: Component specification
            recursive: Whether to test submodules

        Returns:
            List of TestbenchResult objects
        """
        logger.debug(f"Executing test plan for {self.component_name} with {self.simulator}")

        # Split test cases into batches
        test_batches = self.optimizer.split_test_cases(
            plan.regular_cases,
            plan.edge_cases,
            self.optimizer.calculate_module_complexity(module_details),
        )
        logger.debug(f"Split into {len(test_batches)} test batches")

        # Generate testbenches in parallel
        try:
            self.optimizer.parallel_generate_testbenches(
                test_batches, module_details, self.base_dir
            )
        except Exception as e:
            logger.error(f"Error generating testbenches: {str(e)}")
            raise

        # Get testbench files
        testbench_files = list(self.base_dir.glob(f"tb_*{self.component_name}.v"))
        logger.debug(f"Found {len(testbench_files)} testbench files")

        # Run testbenches
        results = self.optimizer.parallel_execute_testbenches(
            testbench_files, self.simulator
        )

        # Collect and process results
        combined_results = []
        for tb_file, result in results.items():
            tb_result = result["result"]  # The actual TestbenchResult
            metrics = result["metrics"]
            logger.debug(f"Testbench {tb_file} executed with metrics {metrics}")

            # Update metrics database
            self.optimizer._metrics_db.setdefault(self.component_name, {})
            try:
                self.optimizer._metrics_db[self.component_name][
                    "test_cases"
                ] = self.optimizer._metrics_db[self.component_name].get(
                    "test_cases", []
                ) + [
                    {
                        "execution_time": metrics.execution_time,
                        "memory_usage": metrics.memory_usage,
                        "file_size": metrics.file_size,
                        "complexity_score": metrics.complexity_score,
                    }
                ]
            except AttributeError:
                self.optimizer._metrics_db[self.component_name][
                    "test_cases"
                ] = self.optimizer._metrics_db[self.component_name].get(
                    "test_cases", []
                ) + [
                    {
                        "execution_time": metrics["execution_time"],
                        "memory_usage": metrics["memory_usage"],
                        "file_size": metrics["file_size"],
                        "complexity_score": metrics["complexity_score"],
                    }
                ]

            combined_results.append(tb_result)

        # Save updated metrics
        self.optimizer._save_metrics_db()

        # Generate coverage visualizations
        self._generate_coverage_artifacts(plan, module_details)

        if recursive and "submodules" in module_details:
            logger.debug("Starting recursive test execution for submodules")
            for submodule in set(module_details["submodules"]):
                submodule_mgr = IntegratedTestManager(
                    component_name=submodule,
                    rules=self.rules,
                    base_dir=self.base_dir,
                    max_parallel=self.max_parallel,
                    simulator=self.simulator,
                )
                # Load submodule details
                submodule_dir = self.base_dir / submodule
                with open(submodule_dir / f"{submodule}_details.json") as f:
                    submodule_details = json.load(f)

                # Create and execute plan for submodule
                submodule_plan = submodule_mgr.plan_tests(
                    submodule_details,
                    desired_cases=plan.total_test_cases
                    // 2,  # Use fewer cases for submodules
                )
                submodule_results = submodule_mgr.execute_test_plan(
                    submodule_plan, submodule_details, recursive=True
                )
                combined_results.extend(submodule_results)

        return combined_results

    def _generate_coverage_artifacts(
        self, plan: TestExecutionPlan, module_details: Dict
    ) -> None:
        """Generate coverage visualizations and reports."""
        logger.debug("Generating coverage artifacts")

        # Create output directory
        output_dir = self.base_dir / "coverage_reports" / self.component_name
        output_dir.mkdir(parents=True, exist_ok=True)

        # Generate distribution plot
        input_ranges = self.generator._calculate_input_ranges(module_details)
        all_cases = plan.edge_cases + plan.regular_cases

        self.optimizer.visualize_coverage(
            all_cases, input_ranges, output_dir / "test_distribution.png"
        )

        # Generate coverage report
        coverage_report = self.optimizer.generate_coverage_report(
            all_cases, input_ranges
        )

        with open(output_dir / "coverage_report.json", "w") as f:
            json.dump(coverage_report, f, indent=2)

        # Generate coverage matrix visualization
        coverage_matrix = self.optimizer.generate_coverage_matrix(
            all_cases, input_ranges
        )

        import numpy as np

        np.save(str(output_dir / "coverage_matrix.npy"), coverage_matrix)

        logger.debug(f"Generated coverage artifacts in {output_dir}")

    def get_execution_history(self) -> Dict:
        """Get historical execution metrics."""
        return self.optimizer._metrics_db.get(self.component_name, {})
