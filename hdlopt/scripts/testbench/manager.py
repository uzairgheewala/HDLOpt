import json
import math
import numpy as np
import multiprocessing
import itertools
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
    parallel_processes: int
    edge_cases: Optional[List[Dict[str, int]]] = None
    regular_cases: Optional[List[Dict[str, int]]] = None
    test_plans: Optional[List] = None


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
        timeout: Optional[float] = float('inf')
    ):

        self.component_name = component_name
        self.rules = rules
        self.base_dir = Path(base_dir)
        self.max_parallel = max_parallel or multiprocessing.cpu_count()
        self.constraints = constraints
        self.timing = timing
        self.signals = signals
        self.simulator = simulator
        self.timeout = timeout

        # Initialize subsystems
        self.optimizer = TestOptimizer(
            base_path=self.base_dir,
            max_parallel=self.max_parallel,
            target_cases_per_file=target_cases_per_file,
            rules=rules,
            constraints=constraints,
            timing=timing,
            signals=signals,
            timeout=timeout
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
            simulator=simulator, work_dir=self.base_dir, timeout=timeout
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
        logger.info(f"Planning tests for {self.component_name}: {desired_cases} cases, available_time={available_time}")

        # Calculate module complexity
        complexity = self.optimizer.calculate_module_complexity(module_details)
        logger.debug(
            f"Module complexity score: {complexity.calculate_score()}"
        )

        logger.debug("Processing parameters")
        param_ranges = self.generator._process_parameters(module_details)
        if self.constraints is not None:
            constraints = self.constraints.param_constraints
        else:
            constraints = self.constraints
        param_names, param_combinations, _ = self.generator._get_param_combinations(
            param_ranges, constraints
        )
        logger.debug("Found parameter combinations: %s", param_combinations)

        test_plans = []
        total_cases = 0

        # Create plan for each parameter combination
        for param_comb in param_combinations:
            logger.debug("Planning for parameter combination: %s", param_comb)

            # Update module details for this parameter combination
            updated_details = self.generator._update_bit_widths(
                module_details.copy(), 
                param_comb, 
                param_names
            )

            # Calculate input ranges for this combination
            logger.debug("Calculating input ranges")
            input_ranges = self.generator._calculate_input_ranges(updated_details)
            input_ranges = self.generator._validate_inputs(input_ranges, updated_details)
            logger.debug(f"Valid input ranges for {param_comb}: {input_ranges}")

            # Generate test cases for this combination
            special_signals = set(self.generator._get_special_signals())
            logger.debug("Special signals identified: %s", special_signals)
           
            edge_cases = self.optimizer.identify_edge_cases(input_ranges, special_signals)
            logger.debug("Generated %d edge cases", len(edge_cases))

            regular_cases_needed = max(0, desired_cases - len(edge_cases))
            regular_cases = self.optimizer.generate_test_distribution(
                input_ranges, regular_cases_needed, granularity=0.1
            )
            logger.debug("Generated %d regular cases", len(regular_cases))

            param_total = len(edge_cases) + len(regular_cases)
            total_cases += param_total

            test_plans.append({
                "param_comb": param_comb,
                "param_names": param_names,
                "edge_cases": edge_cases,
                "regular_cases": regular_cases,
                "total_cases": param_total
            })
            logger.debug("Added test plan for %s: %d total cases", param_comb, param_total)

        # Check time constraints
        if available_time:
            est_time = self.optimizer.estimate_execution_time(complexity, total_cases)
            logger.info(f"Estimated execution time: {est_time}s, available: {available_time}s")

            if available_time < est_time:
                logger.warning("Time constraint exceeded")
                #raise ValueError(f"Estimated time ({est_time}s) exceeds available time ({available_time}s)")

        # Calculate overall batching
        batches_per_param = math.ceil(total_cases / (len(param_combinations) * self.optimizer.target_cases))
        batches_per_param = max(batches_per_param, 1)
        logger.info(f"Using {batches_per_param} batches per parameter combination")

        plan = TestExecutionPlan(
            total_test_cases=total_cases,
            test_batches=batches_per_param * len(param_combinations),
            cases_per_batch=self.optimizer.target_cases,
            estimated_time=self.optimizer.estimate_execution_time(complexity, total_cases),
            test_plans=test_plans,
            parallel_processes=self.max_parallel
        )
        
        logger.info("Test plan created: %d total cases, %d batches", plan.total_test_cases, plan.test_batches)
        return plan

        """
        
        # Get input ranges
        input_ranges = self.generator._calculate_input_ranges(module_details)
        input_ranges = self.generator._validate_inputs(input_ranges, module_details)
        logger.debug(f"Valid input ranges: {input_ranges}")

        # Identify edge cases first
        special_signals = set(self.generator._get_special_signals())
        logger.debug(f"Special signals: {special_signals}")
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

            if available_time < est_time:
                logger.warning(
                    f"Estimated time exceeds available time: {est_time}s > {available_time}s"
                )
                raise ValueError("Time constraint exceeded")

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
        """

    # @timing_wrapper
    """
    def execute_test_plan(
        self, plan: TestExecutionPlan, module_details: Dict, recursive: bool = False
    ) -> List[TestbenchResult]:
        Execute planned tests.

        Args:
            plan: Test execution plan
            module_details: Component specification
            recursive: Whether to test submodules

        Returns:
            List of TestbenchResult objects
    
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
                    timeout=self.timeout
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
    """
    def execute_test_plan(
        self, 
        plan: TestExecutionPlan,
        module_details: Dict,
        recursive: bool = False
    ) -> List[TestbenchResult]:
        """Execute planned tests."""
        logger.info(f"Executing test plan for {self.component_name} with {self.simulator}")
        logger.debug("Plan details: %d total cases, %d batches", plan.total_test_cases, plan.test_batches)
        combined_results = []

        # Process each parameter combination plan
        for test_plan in plan.test_plans:
            param_comb = test_plan["param_comb"]
            param_names = test_plan["param_names"]
            logger.info("Processing parameter combination: %s", param_comb)

            # Update details for this parameter combination
            updated_details = self.generator._update_bit_widths(
                module_details.copy(),
                param_comb,
                param_names
            )

            # Split test cases into batches
            logger.debug("Splitting test cases into batches")
            test_batches = self.optimizer.split_test_cases(
                test_plan["regular_cases"],
                test_plan["edge_cases"],
                self.optimizer.calculate_module_complexity(updated_details),
            )
            logger.debug(f"Split into {len(test_batches)} test batches for {param_comb}")

            try:
                # Generate testbenches for this parameter combination
                logger.info("Generating testbenches for parameter combination %s", param_comb)
                self.optimizer.parallel_generate_testbenches(
                    test_batches, 
                    updated_details,
                    self.base_dir,
                    param_comb=param_comb,
                    param_names=param_names
                )
            
                # Get testbench files for this combination
                param_str = "_".join(f"{name}{val}" for name, val in zip(param_names, param_comb))
                testbench_files = list(self.base_dir.glob(f"tb_{param_str}*{self.component_name}.v"))
                logger.debug(f"Found {len(testbench_files)} testbench files for {param_comb}")

                # Run testbenches
                logger.info("Running testbenches for parameter combination %s", param_comb)
                results = self.optimizer.parallel_execute_testbenches(
                    testbench_files, 
                    self.simulator
                )

                # Process results and generate coverage
                logger.debug("Processing results and generating coverage artifacts")
                param_results = []
                for tb_file, result in results.items():
                    tb_result = result["result"]
                    metrics = result["metrics"]
                    self._update_metrics_db(metrics)
                    param_results.append(tb_result)
                    logger.debug("Processed results for testbench: %s", tb_file)

                # Generate coverage artifacts for this parameter combination
                logger.info("Generating coverage artifacts for %s", param_comb)
                self._generate_coverage_artifacts(
                    plan,
                    updated_details,
                    param_str=param_str,
                    test_results=param_results
                )
                
                combined_results.extend(param_results)
                logger.info("Completed testing for parameter combination %s", param_comb)

            except Exception as e:
                logger.error("Error processing parameter combination %s: %s", param_comb, str(e))
                raise

        # Handle recursive execution
        if recursive and "submodules" in module_details:
            logger.info("Starting recursive test execution")
            recursive_results = self._execute_recursive_tests(plan, module_details)
            combined_results.extend(recursive_results)
            logger.info("Completed recursive test execution")

        logger.info("Test plan execution complete: %d total results", len(combined_results))
        return combined_results
    
    def _execute_recursive_tests(
        self, 
        plan: TestExecutionPlan,
        module_details: Dict
    ) -> List[TestbenchResult]:
        """Execute tests recursively on submodules.
        
        Args:
            plan: Parent module's test execution plan
            module_details: Parent module's details
            
        Returns:
            List of test results from submodules
        """
        logger.debug("Starting recursive test execution for module: %s", self.component_name)
        recursive_results = []
        
        for submodule in set(module_details["submodules"]):
            logger.debug("Processing submodule: %s", submodule)
            
            # Create submodule manager
            submodule_mgr = IntegratedTestManager(
                component_name=submodule,
                rules=self.rules,
                base_dir=self.base_dir,
                max_parallel=self.max_parallel,
                simulator=self.simulator,
                timeout=self.timeout
            )
            
            # Load submodule details
            submodule_dir = self.base_dir / submodule
            logger.debug("Loading submodule details from: %s", submodule_dir)
            with open(submodule_dir / f"{submodule}_details.json") as f:
                submodule_details = json.load(f)

            # Create and execute plan for submodule
            logger.info("Planning tests for submodule %s", submodule)
            submodule_plan = submodule_mgr.plan_tests(
                submodule_details,
                desired_cases=plan.total_test_cases // 2  # Use fewer cases for submodules
            )
            
            logger.info("Executing test plan for submodule %s", submodule)
            submodule_results = submodule_mgr.execute_test_plan(
                submodule_plan, 
                submodule_details, 
                recursive=True
            )
            recursive_results.extend(submodule_results)
            
            logger.debug("Completed testing of submodule %s: %d results", 
                        submodule, len(submodule_results))

        return recursive_results

    def _generate_coverage_artifacts(
        self, plan: TestExecutionPlan, module_details: Dict,
        param_str: str = "",
        test_results: Optional[List[TestbenchResult]] = None
    ) -> None:
        """Generate coverage visualizations and reports."""
        logger.debug("Generating coverage artifacts")

        # Create output directory
        output_dir = self.base_dir / "coverage_reports" / self.component_name
        if param_str:
            output_dir = output_dir / param_str
        output_dir.mkdir(parents=True, exist_ok=True)
        logger.debug("Created coverage output directory: %s", output_dir)


        try:
            # Generate distribution plots
            logger.debug("Generating coverage distribution plots")
            param_ranges = self.generator._process_parameters(module_details)
            input_ranges = self.generator._calculate_input_ranges(module_details)
            test_cases = []
            if test_results:
                #print(test_results)
                test_cases = [[test.test_case for test in result.test_results] for result in test_results]
                test_cases = list(itertools.chain(*test_cases))

            self.optimizer.visualize_coverage(
                test_cases,
                input_ranges,
                output_dir / f"test_distribution{param_str}.png"
            )

            # Generate coverage report
            logger.debug("Generating coverage report")
            coverage_report = self.optimizer.generate_coverage_report(
                test_cases,
                input_ranges
            )
            with open(output_dir / f"coverage_report{param_str}.json", "w") as f:
                json.dump(coverage_report, f, indent=2)

            # Generate coverage matrix visualization
            logger.debug("Generating coverage matrix")
            coverage_matrix = self.optimizer.generate_coverage_matrix(
                test_cases,
                input_ranges
            )
            np.save(str(output_dir / f"coverage_matrix{param_str}.npy"), coverage_matrix)

            logger.info("Successfully generated coverage artifacts in %s", output_dir)

        except Exception as e:
            logger.error("Error generating coverage artifacts: %s", str(e))
            raise

    def get_execution_history(self) -> Dict:
        """Get historical execution metrics."""
        return self.optimizer._metrics_db.get(self.component_name, {})

    def _update_metrics_db(self, metrics):
        """Update metrics database with execution results."""
        logger.debug("Updating metrics database with results")

        # Convert metrics to dict if it's an object
        try:
            metrics_dict = {
                "execution_time": metrics.execution_time,
                "memory_usage": metrics.memory_usage,
                "file_size": metrics.file_size,
                "complexity_score": metrics.complexity_score,
            }
        except AttributeError:
            metrics_dict = metrics  # Assume it's already a dict

        # Initialize component entry if needed
        if not hasattr(self.optimizer, '_metrics_db'):
            self.optimizer._metrics_db = {}
        
        self.optimizer._metrics_db.setdefault(self.component_name, {})
        component_metrics = self.optimizer._metrics_db[self.component_name]
        
        # Add to test cases list
        component_metrics.setdefault("test_cases", []).append(metrics_dict)

        # Update summary stats
        all_times = [case["execution_time"] for case in component_metrics["test_cases"]]
        
        component_metrics.update({
            "avg_execution_time": sum(all_times) / len(all_times),
            "max_execution_time": max(all_times),
            "min_execution_time": min(all_times),
            "total_cases": len(component_metrics["test_cases"])
        })

        # Save updated metrics
        self.optimizer._save_metrics_db()
        logger.debug(f"Updated metrics for {self.component_name}")