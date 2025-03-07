import json
import math
import multiprocessing
import os
import random
import shutil
import time
from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor
from dataclasses import asdict, dataclass
from enum import Enum
from math import log1p  # Natural logarithm of (1 + x)
import itertools
from pathlib import Path
from typing import Dict, List, Optional, Set

import matplotlib
import numpy as np
from matplotlib import pyplot as plt

from ..logger import logger
from .core import TestbenchGenerator
from .runner import TestbenchRunner as Runner

matplotlib.use("Agg")  # Set non-interactive backend


class TestCasePriority(Enum):
    EDGE_CASE = 1
    BOUNDARY = 2
    CORNER = 3
    RANDOM = 4


@dataclass
class TestCaseMetrics:
    """Metrics about test case execution."""

    generation_time: float = 0.0
    execution_time: float = 0.0
    memory_usage: float = 0.0
    file_size: int = 0
    complexity_score: float = 0.0


@dataclass
class ModuleComplexity:
    """Metrics for calculating module complexity."""

    param_count: int = 0
    input_width_total: int = 0
    output_width_total: int = 0
    state_bits: int = 0
    submodule_count: int = 0
    sequential: bool = False

    def to_dict(self):
        """Convert instance to JSON-serializable dictionary"""
        return asdict(self)

    def __dict__(self):
        """Convert instance to JSON-serializable dictionary"""
        return asdict(self)

    def normalized_score(self):
        """Theoretical maximum analysis for normalization."""
        # Maximum realistic values (based on industry-scale hardware)
        max_params = 50  # Parameters in a large module
        max_input_width = 4096  # 4K-bit input bus
        max_output_width = 4096  # 4K-bit output bus
        max_state = 4096  # 4K flip-flops/registers
        max_submodules = 100  # Submodules in complex IP
        seq_penalty = 0.5  # Sequential always adds 0.5

        # Max component scores
        max_scores = {
            "params": 0.02 * max_params,  # 1.0
            "inputs": 0.25 * log1p(max_input_width),  # 0.25*8.32 ≈ 2.08
            "outputs": 0.25 * log1p(max_output_width),  # 2.08
            "state": 0.4 * log1p(max_state),  # 0.4*8.32 ≈ 3.33
            "submodules": 0.05 * max_submodules,  # 5.0
            "sequential": seq_penalty,  # 0.5
        }

        theoretical_max = sum(max_scores.values())  # ≈13.99
        # logger.debug("Theoretical max complexity score: %.2f", theoretical_max)
        return min(self.calculate_score() / theoretical_max, 1.0)

    def calculate_score(self) -> float:
        """Calculate unbounded complexity score (no 0-1 cap)."""
        scores = {
            "params": 0.02 * self.param_count,  # ~0.1 for 5 params
            # ~1.7 for 1000-bit input
            "inputs": 0.25 * log1p(self.input_width_total),
            "outputs": 0.25
            * log1p(self.output_width_total),  # ~1.7 for 1000-bit output
            "state": 0.4 * log1p(self.state_bits),  # ~3.3 for 1000 flip-flops
            "submodules": 0.05 * self.submodule_count,  # ~0.5 for 10 submodules
            "sequential": 0.5 if self.sequential else 0,
        }
        logger.debug(
            "Complexity breakdown: %s, Score: %s", scores, sum(scores.values())
        )
        return sum(scores.values())


class TestOptimizer:
    """Manages test case optimization and parallel execution."""

    @property
    def metrics_db(self):
        """Get metrics database."""
        return getattr(self, "_metrics_db", {})

    @metrics_db.setter
    def metrics_db(self, value):
        """Set metrics database."""
        self._metrics_db = value
        self._save_metrics_db()

    def __init__(
        self,
        base_path: Path,
        max_parallel: Optional[int] = None,
        target_cases_per_file: int = 1000,
        rules: Optional[int] = None,
        constraints: Optional[int] = None,
        timing: Optional[int] = None,
        signals: Optional[int] = None,
        timeout: Optional[float] = float('inf')
    ):
        self.base_path = Path(base_path)
        self.max_parallel = max_parallel or multiprocessing.cpu_count()
        self.target_cases = target_cases_per_file
        self.metrics_db = self._load_metrics_db()
        self.rules = rules
        self.constraints = constraints
        self.timing = timing
        self.signals = signals
        self.timeout = timeout

        logger.debug(
            "Initialized TestOptimizer with max_parallel=%d, target_cases=%d",
            self.max_parallel,
            self.target_cases,
        )

    def _load_metrics_db(self) -> Dict:
        """Load historical metrics database."""
        db_path = self.base_path / "test_metrics.json"
        if db_path.exists():
            with open(db_path) as f:
                return json.load(f)
        return {}

    def _save_metrics_db(self):
        """Save updated metrics database."""
        with open(self.base_path / "test_metrics.json", "w") as f:
            json.dump(self.metrics_db, f, indent=2)

    def calculate_module_complexity(self, module_details: Dict) -> ModuleComplexity:
        """Calculate complexity metrics for a module."""
        logger.debug(
            "Calculating complexity for module: %s", module_details["component_name"]
        )
        complexity = ModuleComplexity()
        self.current_module_name = module_details["component_name"]

        # Count parameters
        complexity.param_count = len(module_details.get("parameters", []))

        parameters = {
            param["name"]: int(param["value"])
            for param in module_details.get("parameters", [])
        }

        # Calculate I/O widths
        for inp in module_details["inputs"]:
            try:
                width = self._get_signal_width(
                    inp[3], parameters
                )  # Assuming bit_width at index 3
            except KeyError:
                width = self._get_signal_width(inp["bit_width"], parameters)
            complexity.input_width_total += width

        for out in module_details["outputs"]:
            try:
                width = self._get_signal_width(
                    out[3], parameters
                )  # Assuming bit_width at index 3
            except KeyError:
                width = self._get_signal_width(out["bit_width"], parameters)
            complexity.output_width_total += width

        # Estimate state bits from internal signals
        for internal in module_details.get("internals", []):
            try:
                wire_type = internal[1]  # Assuming type at index 1
            except KeyError:
                wire_type = internal["type"]
            if wire_type == "reg":
                try:
                    width = self._get_signal_width(
                        internal[3], parameters
                    )  # Assuming bit_width at index 3
                except KeyError:
                    width = self._get_signal_width(internal["bit_width"], parameters)

                complexity.state_bits += width

        # Count submodules
        complexity.submodule_count = len(module_details.get("submodules", []))

        # Check if sequential
        complexity.sequential = (
            module_details.get("mode", "combinational") == "sequential"
        )

        return complexity

    def _get_signal_width(self, bit_width: str, parameters: Dict[str, int]) -> int:
        """Calculate actual bit width with parameter substitution."""
        logger.debug(
            "Processing bit width: %s with parameters: %s", bit_width, parameters
        )

        # Substitute parameters in the bit_width string
        for param, value in parameters.items():
            bit_width = bit_width.replace(param, str(value))

        if bit_width == "1":
            return 1
        if ":" in bit_width:
            try:
                high_expr, low_expr = bit_width.split(":")
                high = eval(high_expr, {}, {})
                low = eval(low_expr, {}, {})
                return abs(high - low) + 1
            except Exception as e:
                raise ValueError(f"Error evaluating bit width '{bit_width}': {e}")
        try:
            return int(bit_width)
        except ValueError:
            raise ValueError(f"Invalid bit width format: {bit_width}")

    def estimate_execution_time(
        self, complexity: ModuleComplexity, num_cases: int
    ) -> float:
        current_score = complexity.calculate_score()
        logger.debug("Current complexity score: %.3f", current_score)

        similar_runs = []
        logger.debug(
            "Checking historical data for module: %s", self.current_module_name
        )
        logger.debug("Historical data: %s", self.metrics_db)

        if self.current_module_name in self.metrics_db:
            hist_metrics = self.metrics_db[self.current_module_name]
            # hist_score = hist_metrics["complexity_score"]
            # logger.debug("Found historical data for current module: %s (score: %.3f)", self.current_module_name, hist_score)
            similar_runs.extend(hist_metrics["test_cases"])

        # If no exact match, check for similar complexity
        if not similar_runs:
            for module, metrics in self.metrics_db.items():
                hist_score = metrics.get("complexity", 0)
                if abs(hist_score - current_score) < 0.5:
                    similar_runs.extend(metrics["test_cases"])

        if not similar_runs:
            logger.debug("No similar modules found. Using fallback.")
            return self.estimate_execution_time_fallback(complexity, num_cases)

        avg_time = sum(tc["execution_time"] for tc in similar_runs) / len(similar_runs)
        logger.debug("Using historical data. Avg time/case: %.3f", avg_time)
        return num_cases * avg_time

    def estimate_execution_time_fallback(
        self, complexity: ModuleComplexity, num_cases: int
    ) -> float:
        """Fallback estimation when no historical data available."""
        base_time = 0.05
        complexity_factor = complexity.calculate_score()

        # Weaker correlation with complexity
        time_per_case = base_time * (1 + complexity_factor * 0.3)  # Reduced multiplier

        # Remove param and I/O factors to simplify
        return num_cases * time_per_case

    """
    def identify_edge_cases(
        self, input_ranges: Dict[str, List[int]], special_signals: Set[str]
    ) -> List[Dict[str, int]]:
        Identify edge cases for testing.
        edge_cases = []

        for signal, range_vals in input_ranges.items():
            if signal in special_signals:
                continue

            min_val, max_val = range_vals
            mid_val = (min_val + max_val) // 2

            # Add min, max, mid values
            edge_cases.extend([{signal: val} for val in [min_val, max_val, mid_val]])

            # Add values around boundaries
            edge_cases.extend([{signal: val} for val in [min_val + 1, max_val - 1]])

            # Add potential special values
            # Build list of special values
            special_vals = [0]  # Start with zero

            # Add unit values
            special_vals.append(-1 if min_val < 0 else 1)

            # Add powers of 2 minus 1 (like 1, 3, 7, 15, etc)
            power_vals = [2**n - 1 for n in range(1, math.ceil(math.log2(max_val + 1)))]
            special_vals.extend(power_vals)

            edge_cases.extend(
                [{signal: val} for val in special_vals if min_val <= val <= max_val]
            )

        # Combine edge cases for multiple inputs
        full_edge_cases = []
        for i, case1 in enumerate(edge_cases):
            for case2 in edge_cases[i + 1 :]:
                if not any(k in case2 for k in case1.keys()):
                    combined = {**case1, **case2}
                    # Fill in remaining signals with mid values
                    for signal in input_ranges:
                        if signal not in combined and signal not in special_signals:
                            combined[signal] = sum(input_ranges[signal]) // 2
                    full_edge_cases.append(combined)

        return full_edge_cases
    """
    def identify_edge_cases(self, input_ranges: Dict[str, List[int]], special_signals: Set[str]) -> List[Dict[str, int]]:
        """Identify edge cases for testing."""
        edge_vals_per_signal = {}
        for signal, (min_val, max_val) in input_ranges.items():
            if signal in special_signals:
                continue

            values = set()
            # Always include min and max
            values.add(min_val)
            values.add(max_val)

            # For larger ranges, add midpoint and near-boundary values
            if max_val - min_val > 1:
                mid_val = (min_val + max_val) // 2
                values.add(mid_val)
                # Add values near boundaries if range permits
                if min_val + 1 <= max_val:
                    values.add(min_val + 1)
                if max_val - 1 >= min_val:
                    values.add(max_val - 1)

            # For control signals (like clk, rst_n), just use min/max
            if signal in {'clk', 'rst_n'}:
                values = {min_val, max_val}

            # For data signals, also add common special values if in range
            else:
                # Add 0 if in range
                if min_val <= 0 <= max_val:
                    values.add(0)
                # Add power-of-2 boundaries if in range
                pot = 1
                while pot <= max_val:
                    if min_val <= pot <= max_val:
                        values.add(pot)
                    if min_val <= pot-1 <= max_val:
                        values.add(pot-1)
                    pot *= 2

            edge_vals_per_signal[signal] = sorted(values)
            logger.debug(f"Edge values for {signal}: {edge_vals_per_signal[signal]}")

        # Generate combinations, but limit for wider signals
        signals = sorted(edge_vals_per_signal.keys())
        all_combinations = list(itertools.product(*[edge_vals_per_signal[s] for s in signals]))
        
        # Convert to list of dictionaries
        edge_cases = []
        for combo in all_combinations:
            case = {sig: val for sig, val in zip(signals, combo)}
            edge_cases.append(case)
            
        logger.debug(f"Generated {len(edge_cases)}")
        return edge_cases

    def generate_test_distribution(self, input_ranges: Dict[str, List[int]], num_cases: int, granularity: float = 0.1) -> List[Dict[str, int]]:
        """Generate regular test cases avoiding edge cases."""
        test_cases = []
        max_attempts = num_cases * 2

        # Calculate total possible combinations
        total_combinations = 1
        for _, (min_val, max_val) in input_ranges.items():
            total_combinations *= (max_val - min_val + 1)

        # Track already seen combinations (including edge cases)
        seen_combinations = set()
        
        # Generate cases
        attempts = 0
        while len(test_cases) < num_cases and attempts < max_attempts:
            case = {}
            for signal, (min_val, max_val) in input_ranges.items():
                case[signal] = random.randint(min_val, max_val)
                
            case_tuple = tuple(sorted(case.items()))
            if case_tuple not in seen_combinations:
                test_cases.append(case)
                seen_combinations.add(case_tuple)
                
            attempts += 1
            
        logger.debug(f"Generated {len(test_cases)} regular cases out of requested {num_cases}")
        return test_cases

    """
    def generate_test_distribution(
        self,
        input_ranges: Dict[str, List[int]],
        num_cases: int,
        granularity: float = 0.1,
    ) -> List[Dict[str, int]]:
        #Generate test cases with binary search distribution.
        test_cases = []
        interval_points = []
        max_attempts = num_cases * 2  # Prevent infinite loops

        # Calculate intervals and track possible combinations
        total_combinations = 1
        for signal, (min_val, max_val) in input_ranges.items():
            range_size = max_val - min_val
            interval = max(1, int(range_size * granularity))
            points = list(range(min_val, max_val + 1, interval))
            interval_points.append((signal, points))
            total_combinations *= len(points)

        # Short-circuit if requesting more cases than possible
        if num_cases > total_combinations:
            logger.warning(
                f"Requested {num_cases} cases but only {total_combinations} unique "
                "combinations exist. Generating all unique cases instead."
            )
            num_cases = total_combinations

        # Generate cases efficiently
        attempts = 0
        generated = set()  # Track cases as tuples for O(1) lookups

        while len(test_cases) < num_cases and attempts < max_attempts:
            case = {}
            for signal, points in interval_points:
                case[signal] = random.choice(points)

            # Convert case to hashable tuple
            case_tuple = tuple(sorted(case.items()))

            if case_tuple not in generated:
                test_cases.append(case)
                generated.add(case_tuple)

            attempts += 1

        # Fill remaining slots with duplicates if needed
        if len(test_cases) < num_cases:
            logger.warning(
                f"Could not generate {num_cases} unique cases. "
                f"Duplicating {len(test_cases)} existing cases."
            )
            while len(test_cases) < num_cases:
                test_cases.append(random.choice(test_cases))

        return test_cases
    """

    def split_test_cases(
        self,
        test_cases: List[Dict[str, int]],
        edge_cases: List[Dict[str, int]],
        complexity: ModuleComplexity,
    ) -> List[List[Dict[str, int]]]:
        """Split test cases into multiple files based on complexity."""
        logger.debug(
            "Splitting %d regular cases and %d edge cases",
            len(test_cases),
            len(edge_cases),
        )

        # Get normalized complexity score (0-1 scale)
        complexity_score = complexity.normalized_score()
        logger.debug(
            "Normalized complexity score: %.2f, Original target: %d",
            complexity_score,
            self.target_cases,
        )

        adjusted_target = int(
            self.target_cases / (0.1 + complexity_score)
        )  # Add 0.1 to prevent division by zero
        adjusted_target = max(100, adjusted_target)  # Minimum 100 cases/batch
        logger.debug("Adjusted target per batch: %d", adjusted_target)
        logger.debug("Processing %d edge cases", len(edge_cases))

        # Always keep edge cases in first file unless too many
        edge_case_files = []
        remaining_edge_cases = edge_cases

        while remaining_edge_cases:
            current_file = remaining_edge_cases[:adjusted_target]
            logger.debug("Created edge batch with %d cases", len(current_file))
            edge_case_files.append(current_file)
            remaining_edge_cases = remaining_edge_cases[adjusted_target:]

        # Split remaining test cases
        regular_files = []
        remaining_cases = test_cases

        logger.debug("Processing %d regular cases", len(test_cases))
        while remaining_cases:
            current_file = remaining_cases[:adjusted_target]
            logger.debug("Created regular batch with %d cases", len(current_file))
            regular_files.append(current_file)
            remaining_cases = remaining_cases[adjusted_target:]

        return edge_case_files + regular_files

    def parallel_generate_testbenches(
        self,
        test_case_files: List[List[Dict[str, int]]],
        module_details: Dict,
        base_path: Path,
        param_comb: Optional[tuple] = None,
        param_names: Optional[List[str]] = None
    ):
        logger.info("Generating testbenches for %d test case files", len(test_case_files))
        logger.debug("Received %d test case file batches", len(test_case_files))
        logger.debug("Module details: %s", module_details)
        logger.debug("Base path: %s", base_path)
        logger.debug("Parameter combination: %s", param_comb)
        logger.debug("Parameter names: %s", param_names)

        self.module_details = module_details
        self.complexity_score = self.calculate_module_complexity(
            module_details
        ).calculate_score()

        # Split test cases into chunks for each worker
        num_workers = min(self.max_parallel, len(test_case_files))
        logger.debug("Using %d workers", num_workers)
        chunk_size = math.ceil(len(test_case_files) / num_workers)
        logger.debug("Chunk size (number of batches per worker): %d", chunk_size)
        chunks = [
            test_case_files[i : i + chunk_size]
            for i in range(0, len(test_case_files), chunk_size)
        ]
        #logger.debug("Chunks created: %s", chunks)

        with ProcessPoolExecutor(max_workers=num_workers) as executor:
            futures = []

            for worker_id, chunk in enumerate(chunks):
                logger.debug("Submitting chunk for worker %d with %d batches", worker_id, len(chunk))
                future = executor.submit(
                    self._generate_testbench_chunk,
                    chunk,
                    module_details.copy(),
                    base_path,
                    worker_id,
                    param_comb,
                    param_names
                )
                futures.append(future)

            for idx, future in enumerate(futures):
                logger.debug("Waiting for worker %d to finish", idx)
                result = future.result()  # Propagate exceptions
                logger.debug("Worker %d finished with result: %s", idx, result)
        logger.info("Exiting parallel_generate_testbenches")

    def _generate_testbench_chunk(
        self,
        test_cases_chunk: List[List[Dict[str, int]]],
        module_details: Dict,
        base_path: Path,
        worker_id: int,
        param_comb: Optional[tuple] = None,
        param_names: Optional[List[str]] = None
    ) -> List[TestCaseMetrics]:
        logger.info("Entering _generate_testbench_chunk for worker %d", worker_id)
        logger.debug("Test cases chunk length: %d", len(test_cases_chunk))
        metrics = []
        component_name = module_details["component_name"]
        logger.debug("Component name: %s", component_name)

        # Create worker-specific directory
        process_dir = base_path / f"temp_worker_{worker_id}"
        logger.debug("Creating worker directory: %s", process_dir)
        process_dir.mkdir(parents=True, exist_ok=True)

        try:
            for i, test_cases in enumerate(test_cases_chunk):
                # Create parameter-aware filename
                if param_comb and param_names:
                    param_str = "_".join(f"{name}{val}" for name, val in zip(param_names, param_comb))
                    tb_filename = f"tb_{param_str}_{worker_id}_{i}_{component_name}.v"
                else:
                    tb_filename = f"tb_{worker_id}_{i}_{component_name}.v"
                result = self._generate_single_testbench(
                    test_cases, module_details, process_dir, tb_filename
                )
                
                logger.debug("Worker %d, batch %d: using filename %s", worker_id, i, tb_filename)

                result = self._generate_single_testbench(
                    test_cases, 
                    module_details, 
                    process_dir, 
                    tb_filename
                )

                src_file = process_dir / tb_filename
                if src_file.exists():
                    dest_path = base_path / tb_filename
                    logger.debug("Copying generated file from %s to %s", src_file, dest_path)
                    shutil.copy2(str(src_file), str(dest_path))
                    metrics.append(result)
                else:
                    logger.error("Expected source file %s does not exist!", src_file)

            logger.info("Worker %d: Exiting _generate_testbench_chunk", worker_id)
            return metrics

        finally:
            logger.debug("Worker %d: Cleaning up temporary directory %s", worker_id, process_dir)
            shutil.rmtree(process_dir, ignore_errors=True)

    def _generate_single_testbench(
        self,
        test_cases: List[Dict[str, int]],
        module_details: Dict,
        base_path: Path,
        output_filename: str,
    ) -> TestCaseMetrics:
        """Generate a single testbench file."""
        logger.info("Entering _generate_single_testbench with output filename: %s", output_filename)
        start_time = time.time()
        component_name = module_details["component_name"]
        logger.debug("Component name: %s", component_name)
        logger.debug("Test cases count: %d", len(test_cases))

        # Create unique working directory for this process
        process_dir = base_path / f"temp_{os.getpid()}"
        logger.debug("Creating process-specific directory: %s", process_dir)
        process_dir.mkdir(parents=True, exist_ok=True)

        try:
            # Create component directory structure within process dir
            component_dir = process_dir / component_name
            logger.debug("Creating component directory: %s", component_dir)
            component_dir.mkdir(exist_ok=True)

            # Write component details for reference
            details_file = component_dir / f"{component_name}_details.json"
            logger.debug("Writing component details to %s", details_file)
            with open(details_file, "w") as f:
                json.dump(module_details, f, indent=2)

            # Create generator with isolated directory
            generator = TestbenchGenerator(
                component_name=component_name,
                rules=self.rules,
                base_dir=str(process_dir),
                constraints=self.constraints,
                timing=self.timing,
                signals=self.signals,
                output_filename=output_filename
            )

            logger.info("Generating testbench file using generator.generate()")
            generator.generate(test_cases=test_cases)
            logger.debug("Testbench generation complete for %s", output_filename)

            # Move generated file to final location
            logger.debug("Looking for generated file in %s", component_dir)
            generated_path = next(component_dir.glob(f"tb_*{component_name}.v"))
            final_path = base_path / output_filename
            logger.debug("Moving generated file from %s to final destination %s", generated_path, final_path)
            shutil.move(str(generated_path), str(final_path))

            generation_time = time.time() - start_time
            file_size = final_path.stat().st_size
            logger.info("Generated testbench %s in %.3f seconds (file size: %d bytes)", output_filename, generation_time, file_size)

            return TestCaseMetrics(
                generation_time=time.time() - start_time,
                file_size=final_path.stat().st_size,
            )

        finally:
            logger.debug("Cleaning up process-specific directory: %s", process_dir)
            #shutil.rmtree(process_dir, ignore_errors=True)

    """
    def parallel_generate_testbenches(self,
                                    test_case_files: List[List[Dict[str, int]]],
                                    module_details: Dict,
                                    base_path: Path):
        Generate multiple testbench files in parallel.
        logger.info("Generating testbenches for %d test case files", len(test_case_files))
        self.module_details = module_details
        self.complexity_score = self.calculate_module_complexity(module_details).calculate_score()

        with ProcessPoolExecutor(max_workers=min(self.max_parallel, len(test_case_files))) as executor:
            futures = []

            for i, test_cases in enumerate(test_case_files):
                # Create unique output path for each executor
                tb_filename = f"tb_{i}_{module_details['component_name']}.v"
                future = executor.submit(
                    self._generate_single_testbench,
                    test_cases,
                    module_details.copy(),  # Pass copy to avoid shared state
                    base_path,
                    tb_filename
                )
                futures.append(future)

            # Wait for all generations to complete
            for future in futures:
                future.result()  # Propagate exceptions



    def parallel_execute_testbenches(self,
                                   testbench_files: List[Path],
                                   simulator: str = "modelsim") -> Dict:
        #Execute multiple testbenches in parallel.
        with ThreadPoolExecutor(max_workers=self.max_parallel) as executor:
            futures = []

            for tb_file in testbench_files:
                future = executor.submit(
                    self._execute_single_testbench,
                    tb_file,
                    simulator
                )
                futures.append(future)

            # Collect results
            results = {}
            for future, tb_file in zip(futures, testbench_files):
                results[tb_file] = future.result()

            return results

    def _execute_single_testbench(self,
                                testbench_file: Path,
                                simulator: str) -> Dict:
        #Execute a single testbench and collect metrics.
        start_time = time.time()

        # Execute testbench
        runner = Runner(simulator=simulator, work_dir=testbench_file.parent)
        result = runner.run_testbench(testbench_file, source_files=runner._collect_source_files(testbench_file.parent))

        execution_time = time.time() - start_time

        # Collect memory usage if available
        try:
            import psutil
            process = psutil.Process()
            memory_usage = process.memory_info().rss / 1024 / 1024  # MB
        except:
            memory_usage = 0

        try:
            metrics = TestCaseMetrics(
                execution_time=execution_time,
                memory_usage=memory_usage,
                complexity_score=self.complexity_score
            )
        except:
            metrics = TestCaseMetrics(
                execution_time=execution_time,
                memory_usage=memory_usage
            )

        return {
            "result": result,
            "metrics": metrics
        }
    """

    def parallel_execute_testbenches(
        self, testbench_files: List[Path], simulator: str = "modelsim"
    ) -> Dict:
        """Execute multiple testbenches in parallel."""

        if not testbench_files:
            return {}

        # Split testbenches into chunks for parallel execution
        num_workers = min(self.max_parallel, len(testbench_files))
        chunk_size = math.ceil(len(testbench_files) / num_workers)
        chunks = [
            testbench_files[i : i + chunk_size]
            for i in range(0, len(testbench_files), chunk_size)
        ]

        with ThreadPoolExecutor(max_workers=num_workers) as executor:
            futures = []

            for chunk in chunks:
                future = executor.submit(
                    self._execute_testbench_chunk, chunk, simulator
                )
                futures.append(future)

            # Collect and merge results
            results = {}
            for future in futures:
                chunk_results = future.result()
                results.update(chunk_results)

            return results

    def _execute_testbench_chunk(
        self, testbench_chunk: List[Path], simulator: str
    ) -> Dict:
        """Execute a chunk of testbenches in a single thread."""
        chunk_results = {}

        for tb_file in testbench_chunk:
            start_time = time.time()

            # Execute testbench
            runner = Runner(simulator=simulator, work_dir=tb_file.parent, timeout=self.timeout)
            result = runner.run_testbench(
                tb_file, source_files=runner._collect_source_files(tb_file.parent), force_recompile=True
            )

            execution_time = time.time() - start_time

            # Collect memory usage
            try:
                import psutil

                process = psutil.Process()
                memory_usage = process.memory_info().rss / 1024 / 1024  # MB
            except Exception as e:
                print(str(e))
                memory_usage = 0

            try:
                metrics = TestCaseMetrics(
                    execution_time=execution_time,
                    memory_usage=memory_usage,
                    complexity_score=self.complexity_score,
                )
            except Exception as e:
                print(str(e))
                metrics = TestCaseMetrics(
                    execution_time=execution_time, memory_usage=memory_usage
                )

            chunk_results[tb_file] = {"result": result, "metrics": metrics}

        return chunk_results

    def visualize_coverage(
        self,
        test_cases: List[Dict[str, int]],
        input_ranges: Dict[str, List[int]],
        output_path: Path,
    ):
        """Generate coverage visualization."""
        import seaborn as sns

        # Create figure
        fig, axs = plt.subplots(
            len(input_ranges), 1, figsize=(10, 3 * len(input_ranges))
        )
        if len(input_ranges) == 1:
            axs = [axs]  # Make iterable for single plot

        # Plot distribution for each input
        for (signal, (min_val, max_val)), ax in zip(input_ranges.items(), axs):
            # Extract values for this signal
            values = [case[signal] for case in test_cases if signal in case]

            # Create histogram
            sns.histplot(data=values, bins=30, ax=ax)

            # Add vertical lines for edge cases
            edge_vals = [min_val, max_val, (min_val + max_val) // 2]
            for val in edge_vals:
                ax.axvline(x=val, color="r", linestyle="--", alpha=0.5)

            ax.set_title(f"Test Distribution for {signal}")
            ax.set_xlabel("Value")
            ax.set_ylabel("Count")

        plt.tight_layout()
        plt.savefig(output_path)
        plt.close()

    def generate_coverage_report(
        self,
        test_cases: List[Dict[str, int]],
        input_ranges: Dict[str, List[int]],
        granularity: float = 0.1,
    ) -> Dict:
        """Generate detailed coverage analysis."""
        coverage_stats = {}

        for signal, (min_val, max_val) in input_ranges.items():
            # Calculate intervals based on granularity
            range_size = max_val - min_val
            interval = max(1, int(range_size * granularity))
            intervals = list(range(min_val, max_val + 1, interval))

            # Count values in each interval
            values = [case[signal] for case in test_cases if signal in case]
            histogram = np.histogram(values, bins=intervals)[0]

            # Calculate coverage metrics
            coverage = len(set(values)) / (max_val - min_val + 1)

            # Find gaps in coverage
            gaps = []
            prev_val = None
            sorted_vals = sorted(set(values))

            for val in sorted_vals:
                if prev_val is not None and val - prev_val > interval:
                    gaps.append((prev_val, val))
                prev_val = val

            coverage_stats[signal] = {
                "total_coverage": coverage,
                "unique_values": len(set(values)),
                "coverage_gaps": gaps,
                "distribution": histogram.tolist(),
            }

        return coverage_stats

    def generate_metric_graphs(
        self, metrics_history: List[TestCaseMetrics], output_dir: Path
    ):
        """Generate graphs showing metric trends."""
        import seaborn as sns

        # Create output directory
        output_dir.mkdir(parents=True, exist_ok=True)

        # Execution Time Trend
        plt.figure(figsize=(10, 6))
        times = [m.execution_time for m in metrics_history]
        plt.plot(times, marker="o")
        plt.title("Testbench Execution Time Trend")
        plt.xlabel("Test Run")
        plt.ylabel("Execution Time (s)")
        plt.grid(True)
        plt.savefig(output_dir / "execution_time_trend.png")
        plt.close()

        # Memory Usage vs File Size
        plt.figure(figsize=(8, 8))
        sizes = [m.file_size / 1024 for m in metrics_history]  # KB
        memory = [m.memory_usage for m in metrics_history]
        plt.scatter(sizes, memory)
        plt.title("Memory Usage vs File Size")
        plt.xlabel("File Size (KB)")
        plt.ylabel("Memory Usage (MB)")
        plt.grid(True)
        plt.savefig(output_dir / "memory_vs_size.png")
        plt.close()

        # Complexity Distribution
        plt.figure(figsize=(8, 6))
        complexity = [m.complexity_score for m in metrics_history]
        sns.histplot(data=complexity, bins=20)
        plt.title("Module Complexity Distribution")
        plt.xlabel("Complexity Score")
        plt.ylabel("Count")
        plt.savefig(output_dir / "complexity_dist.png")
        plt.close()

    def adaptive_test_planning(
        self, module_details: Dict, total_cases: int, available_time: float
    ) -> Dict:
        """Plan test case distribution based on constraints."""
        # Calculate module complexity
        complexity = self.calculate_module_complexity(module_details)

        # Estimate base execution time
        est_time_per_case = self.estimate_execution_time(complexity, 1)
        max_parallel_cases = int(available_time / est_time_per_case)

        # Adjust for parallel execution
        max_parallel_cases *= self.max_parallel

        if total_cases > max_parallel_cases:
            # Need to reduce test cases or split into multiple runs
            num_batches = math.ceil(total_cases / max_parallel_cases)
            cases_per_batch = total_cases // num_batches

            return {
                "feasible": False,
                "recommendation": {
                    "total_batches": num_batches,
                    "cases_per_batch": cases_per_batch,
                    "estimated_total_time": est_time_per_case
                    * total_cases
                    / self.max_parallel,
                    "parallel_processes": self.max_parallel,
                },
            }

        return {
            "feasible": True,
            "test_plan": {
                "total_cases": total_cases,
                "estimated_time": est_time_per_case * total_cases / self.max_parallel,
                "parallel_processes": self.max_parallel,
            },
        }

    def generate_coverage_matrix(
        self,
        test_cases: List[Dict[str, int]],
        input_ranges: Dict[str, List[int]],
        granularity: float = 0.1,
    ) -> np.ndarray:
        """Generate N-dimensional coverage matrix for input combinations."""
        # Get number of intervals for each input
        intervals = {}
        for signal, (min_val, max_val) in input_ranges.items():
            num_intervals = max(1, int(1 / granularity))
            intervals[signal] = np.linspace(min_val, max_val, num_intervals)

        # Create N-dimensional matrix
        matrix_shape = [len(intervals[signal]) for signal in input_ranges]
        coverage_matrix = np.zeros(matrix_shape)

        # Fill matrix based on test cases
        for case in test_cases:
            # Find index for each dimension
            indices = []
            for signal, signal_intervals in intervals.items():
                value = case[signal]
                idx = np.abs(signal_intervals - value).argmin()
                indices.append(idx)

            coverage_matrix[tuple(indices)] += 1

        return coverage_matrix

    def optimize_test_selection(
        self,
        test_cases: List[Dict[str, int]],
        input_ranges: Dict[str, List[int]],
        target_cases: int,
    ) -> List[Dict[str, int]]:
        """Select optimal subset of test cases for maximum coverage."""
        if len(test_cases) <= target_cases:
            return test_cases

        # Calculate coverage matrix
        coverage_matrix = self.generate_coverage_matrix(test_cases, input_ranges)

        # Initialize selection array
        selected = np.zeros(len(test_cases), dtype=bool)

        # Always include edge cases
        edge_cases = self.identify_edge_cases(input_ranges, set())
        edge_case_indices = []

        for edge_case in edge_cases:
            for i, case in enumerate(test_cases):
                if all(case.get(k) == v for k, v in edge_case.items()):
                    edge_case_indices.append(i)
                    selected[i] = True

        remaining_slots = target_cases - len(edge_case_indices)

        if remaining_slots <= 0:
            return [test_cases[i] for i in edge_case_indices[:target_cases]]

        # Select remaining cases to maximize coverage
        current_coverage = np.zeros_like(coverage_matrix)
        available_indices = list(set(range(len(test_cases))) - set(edge_case_indices))

        while sum(selected) < target_cases and available_indices:
            best_score = -1
            best_idx = None

            for idx in available_indices:
                # Calculate coverage improvement
                case = test_cases[idx]
                new_coverage = current_coverage.copy()

                # Update coverage for this case
                indices = self._get_matrix_indices(case, input_ranges)
                new_coverage[indices] += 1

                # Calculate coverage score
                score = np.sum(new_coverage > 0) / new_coverage.size

                if score > best_score:
                    best_score = score
                    best_idx = idx

            if best_idx is not None:
                selected[best_idx] = True
                available_indices.remove(best_idx)
                indices = self._get_matrix_indices(test_cases[best_idx], input_ranges)
                current_coverage[indices] += 1
            else:
                break

        return [test_cases[i] for i in range(len(test_cases)) if selected[i]]

    def _get_matrix_indices(
        self, test_case: Dict[str, int], input_ranges: Dict[str, List[int]]
    ) -> tuple:
        """Get indices for coverage matrix from test case values."""
        indices = []
        for signal, (min_val, max_val) in input_ranges.items():
            value = test_case[signal]
            # Normalize to 0-1 range
            norm_val = (value - min_val) / (max_val - min_val)
            # Convert to index
            idx = min(int(norm_val * 10), 9)  # 10 bins per dimension
            indices.append(idx)
        return tuple(indices)

    def _save_metrics_db(self):
        """Save metrics database to file."""
        db_path = self.base_path / "test_metrics.json"
        with open(db_path, "w") as f:
            json.dump(self.metrics_db, f)

    def _load_metrics_db(self):
        """Load metrics database from file."""
        db_path = self.base_path / "test_metrics.json"
        if db_path.exists():
            with open(db_path) as f:
                return json.load(f)
        return {}
