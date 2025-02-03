import functools
import json
import os
import shutil
import re
import subprocess
import time
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Union

from ..logger import logger
from .utils import find_component_directory


@dataclass
class TestResult:
    """Results from a single test case"""

    test_case: Dict
    expected: Dict
    actual: Dict
    passed: bool
    error_message: Optional[str] = None

    def to_dict(self) -> Dict:
        """Convert TestResult to dictionary for JSON serialization."""
        return {
            "test_case": self.test_case,
            "expected": self.expected,
            "actual": self.actual,
            "passed": self.passed,
            "error_message": self.error_message,
        }

    @classmethod
    def from_dict(cls, data: Dict) -> "TestResult":
        """Create TestResult from dictionary."""
        return cls(
            test_case=data["test_case"],
            expected=data["expected"],
            actual=data["actual"],
            passed=data["passed"],
            error_message=data["error_message"],
        )


@dataclass
class TestbenchResult:
    """Results from running a complete testbench"""

    component_name: str
    parameter_config: Dict[str, int]
    num_tests: int
    passed_tests: int
    failed_tests: int
    execution_time: float
    test_results: List[TestResult]

    def to_dict(self) -> Dict:
        """Convert TestbenchResult to dictionary for JSON serialization."""
        return {
            "component_name": self.component_name,
            "parameter_config": self.parameter_config,
            "num_tests": self.num_tests,
            "passed_tests": self.passed_tests,
            "failed_tests": self.failed_tests,
            "execution_time": self.execution_time,
            "test_results": [r.to_dict() for r in self.test_results],
        }

    @classmethod
    def from_dict(cls, data: Dict) -> "TestbenchResult":
        """Create TestbenchResult from dictionary."""
        return cls(
            component_name=data["component_name"],
            parameter_config=data["parameter_config"],
            num_tests=data["num_tests"],
            passed_tests=data["passed_tests"],
            failed_tests=data["failed_tests"],
            execution_time=data["execution_time"],
            test_results=[TestResult.from_dict(r) for r in data["test_results"]],
        )


def timing_wrapper(func):
    """Decorator to track execution time of testbench runs"""

    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        start_time = time.time()
        # logger.debug(f"Entering {func.__name__} with args={args}, kwargs={kwargs}")
        result = func(*args, **kwargs)
        end_time = time.time()
        elapsed_time = end_time - start_time
        # Force a minimal positive time if needed:
        if elapsed_time == 0.0:
            elapsed_time = 1e-6

        # Log timing information
        log_entry = {
            "function": func.__name__,
            "args": str(args),
            "kwargs": str(kwargs),
            "elapsed_time": elapsed_time,
            "num_tests": getattr(result, "num_tests", None),
            "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        }

        """
        log_file = Path(f"{func.__name__}_timing_logs.json")
        mode = "a" if log_file.exists() else "w"
        with open(log_file, mode) as f:
            json.dump(log_entry, f)
            f.write("\n")
        """

        if hasattr(result, "execution_time"):
            logger.debug(
                f"Overwriting {func.__name__} result.execution_time with {elapsed_time}"
            )
            result.execution_time = elapsed_time

        logger.debug(f"Exiting {func.__name__}; elapsed_time={elapsed_time}")
        return result

    return wrapper


class TestbenchRunner:
    """Handles execution of generated testbenches and result collection"""

    def __init__(
        self,
        simulator: str = "modelsim",
        work_dir: Optional[str] = None,
        timeout: int = 300,
    ):
        self.simulator = simulator
        self.work_dir = work_dir or os.getcwd()
        self.timeout = timeout

        # Ensure work directory exists
        os.makedirs(self.work_dir, exist_ok=True)
        logger.debug(
            f"Initialized TestbenchRunner with simulator={self.simulator}, "
            f"work_dir={self.work_dir}, timeout={self.timeout}"
        )

    def _monitor_process(self, process):
        """Monitor a running process and log its resource usage."""
        import psutil
        p = psutil.Process(process.pid)
        while process.poll() is None:
            try:
                logger.debug(f"Process {process.pid} - CPU: {p.cpu_percent()}%, Memory: {p.memory_info().rss / 1024 / 1024:.1f}MB")
                time.sleep(1)
            except psutil.NoSuchProcess:
                break

    def _setup_simulator(self) -> None:
        """Setup simulator environment"""
        logger.debug(f"Setting up simulator environment for {self.simulator}")
        if self.simulator == "modelsim":
            work_lib = Path(self.work_dir) / "work"
            #if not work_lib.exists():
                #logger.debug("Creating ModelSim work library.")
                #subprocess.run(["vlib", "work"], cwd=self.work_dir, check=True)
        elif self.simulator == "iverilog":
            subprocess.run(["iverilog", "-V"], capture_output=True, text=True)

    def _compile_all_files(self, files: List[str], force_recompile: bool = False) -> None:
        """Compile all files sequentially to ensure proper library population."""
        for src_file in files:
            logger.debug(f"Compiling {src_file}")
            if not os.path.exists(src_file):
                raise FileNotFoundError(f"Source file not found: {src_file}")
                
            if not force_recompile and Path(src_file).with_suffix('.log').exists():
                logger.debug(f"Skipping compilation of {src_file} (already compiled)")
                continue
                
            try:
                if self.simulator == "modelsim":
                    cmd = ["vlog", "-work", "work", "-sv", src_file]
                elif self.simulator == "iverilog":
                    out_path = Path(src_file).with_suffix('.out')
                    cmd = ["iverilog", "-o", str(out_path), src_file]
                    
                result = subprocess.run(cmd, capture_output=True, text=True, cwd=self.work_dir)
                
                if result.returncode != 0:
                    raise RuntimeError(f"Compilation failed for {src_file}: {result.stderr}")
                    
            except subprocess.TimeoutExpired:
                raise TimeoutError(f"Compilation timed out for {src_file}")

    def _compile_source(
        self, source_files: List[str], force_recompile: bool = False
    ) -> None:
        """Compile Verilog source files"""
        logger.debug(f"Starting compilation of {len(source_files)} files: {source_files}")
    
        # Create unique work directory for this compilation using thread ID instead of PID
        import threading
        temp_work_dir = Path(self.work_dir) / f"work_{threading.get_ident()}_{time.time_ns()}"
        temp_work_dir.mkdir(parents=True, exist_ok=True)
        logger.debug(f"Created temporary work directory: {temp_work_dir}")

        try:
            # First copy all source files to temp directory to avoid parallel access issues
            temp_sources = []
            for src_file in source_files:
                logger.debug(f"Checking existence of {src_file}")
                if not os.path.exists(src_file):
                    logger.error(f"File not found: {src_file}")
                    raise FileNotFoundError(f"Source file not found: {src_file}")

                temp_src = temp_work_dir / Path(src_file).name
                shutil.copy2(src_file, temp_src)
                logger.debug(f"Copied {src_file} to {temp_src}")
                temp_sources.append(temp_src)

            # Create ModelSim work library
            if self.simulator == "modelsim":
                work_path = temp_work_dir / "work"
                result = subprocess.run(
                    ["vlib", str(work_path)],
                    capture_output=True,
                    text=True,
                    cwd=temp_work_dir
                )
                if result.returncode != 0:
                    raise RuntimeError(f"Failed to create work library: {result.stderr}")
                logger.debug(f"Created ModelSim work library at {work_path}")

                # Compile each file individually
                for temp_src in temp_sources:
                    output_file = temp_src.with_suffix(".log")
                    if not force_recompile and output_file.exists():
                        logger.debug(f"Skipping compilation of {temp_src} (already compiled)")
                        continue

                    logger.debug(f"Compiling {temp_src}")
                    cmd = ["vlog", "-work", "work", "-sv", str(temp_src)]
                    result = subprocess.run(
                        cmd,
                        capture_output=True,
                        text=True,
                        cwd=temp_work_dir,
                        timeout=60
                    )

                    # Save compilation output
                    with open(output_file, "w") as f:
                        f.write(result.stdout)
                        if result.stderr:
                            f.write("\nErrors:\n" + result.stderr)

                    if result.returncode != 0:
                        raise RuntimeError(f"Compilation failed for {temp_src}: {result.stderr}")

            elif self.simulator == "iverilog":
                # For iverilog, compile all files together
                tb_file = temp_sources[-1]  # Assume testbench is last file
                output_path = tb_file.with_suffix(".out")
                
                cmd = ["iverilog", "-o", str(output_path)]
                cmd.extend(str(src) for src in temp_sources)
                
                logger.debug(f"Running command: {cmd}")
                result = subprocess.run(
                    cmd,
                    capture_output=True,
                    text=True,
                    cwd=temp_work_dir,
                    timeout=60
                )

                # Save compilation output
                output_file = tb_file.with_suffix(".log")
                with open(output_file, "w") as f:
                    if type(result.stdout) == bytes:
                        f.write(result.stdout.decode('utf-8'))
                    elif type(result.stdout) == str:
                        f.write(result.stdout)
                    if result.stderr:
                        f.write("\nErrors:\n" + result.stderr)

                if result.returncode != 0:
                    raise RuntimeError(f"Compilation failed: {result.stderr}")

            else:
                raise ValueError(f"Unsupported simulator: {self.simulator}")

            # Copy successful compilation outputs back to original work directory
            if self.simulator == "modelsim":
                # Copy work library back
                work_dest = Path(self.work_dir) / "work"
                if work_dest.exists():
                    shutil.rmtree(work_dest)
                shutil.copytree(temp_work_dir / "work", work_dest)
                logger.debug(f"Copied work library to {work_dest}")
        finally:
            pass
            """
            # Clean up temp directory
            try:
                shutil.rmtree(temp_work_dir)
                logger.debug(f"Cleaned up temporary directory: {temp_work_dir}")
            except Exception as e:
                logger.warning(f"Failed to clean up temp directory: {str(e)}")
            """

    def _run_simulation(self, testbench_file: str) -> str:
        """Run simulation and return output"""
        module_name = Path(testbench_file).stem

        # Extract parameter combination from testbench name
        param_config = self._extract_params_from_filename(testbench_file)
        param_str = "_".join(f"{k}{v}" for k,v in param_config.items()) if param_config else "default"
        comp_name = self._extract_component_name(testbench_file)
        
        # Use the same VCD filename format as in template
        vcd_file = f"{module_name}__wave.vcd"
        
        logger.debug(f"Running simulation for testbench file={testbench_file}, module={module_name}")

        # Create unique temp work directory
        temp_work_dir = Path(self.work_dir) / f"work_{os.getpid()}_{time.time_ns()}"
        temp_work_dir.mkdir(parents=True, exist_ok=True)
        logger.debug(f"Created temporary work directory: {temp_work_dir}")

        try:
            if self.simulator == "modelsim":
                # Create new work library in temp directory
                logger.debug("Creating ModelSim work library in temp directory")
                subprocess.run(["vlib", "work"], cwd=temp_work_dir, check=True)
                
                # Copy and compile source files in temp directory
                logger.debug("Copying and compiling source files")
                source_files = self._collect_source_files(self.work_dir)
                for src_file in source_files:
                    temp_src = temp_work_dir / Path(src_file).name
                    shutil.copy2(src_file, temp_src)
                    compile_cmd = ["vlog", "-work", "work", "-sv", str(temp_src)]
                    result = subprocess.run(
                        compile_cmd,
                        capture_output=True,
                        text=True,
                        cwd=temp_work_dir
                    )
                    if result.returncode != 0:
                        raise RuntimeError(f"Failed to compile {temp_src}: {result.stderr}")

                # Copy and compile testbench
                temp_tb = temp_work_dir / Path(testbench_file).name
                shutil.copy2(testbench_file, temp_tb)
                compile_cmd = ["vlog", "-work", "work", "-sv", str(temp_tb)]
                result = subprocess.run(
                    compile_cmd,
                    capture_output=True,
                    text=True,
                    cwd=temp_work_dir
                )
                if result.returncode != 0:
                    raise RuntimeError(f"Failed to compile {temp_tb}: {result.stderr}")

                # Create do file in temp directory
                do_file = temp_work_dir / f"{module_name}.do"
                with open(do_file, 'w') as f:
                    f.write(f"""
                        vcd file {vcd_file}
                        vcd add -r /*
                        run -all
                        vcd flush
                        quit -f
                    """)

                # Run simulation
                cmd = [
                    "vsim",
                    "-c",
                    "-do", str(do_file),
                    f"work.{module_name}"
                ]

            elif self.simulator == "iverilog":
                # Find the compiled output file by searching parent directory recursively
                parent_dir = Path(self.work_dir)
                logger.debug(f"Searching for compiled output in {parent_dir}")
                
                # Search for a .out file matching the testbench name
                compiled_outputs = list(parent_dir.rglob(f"{Path(testbench_file).stem}.out"))
                
                if not compiled_outputs:
                    logger.debug("No existing compiled output found, compiling now...")
                    
                    # Copy source files to temp directory
                    source_files = self._collect_source_files(parent_dir)
                    logger.debug(f"Found source files: {source_files}")
                    
                    temp_sources = []
                    for src_file in source_files + [testbench_file]:
                        temp_src = temp_work_dir / Path(src_file).name
                        shutil.copy2(src_file, temp_src)
                        temp_sources.append(temp_src)
                        logger.debug(f"Copied {src_file} to {temp_src}")

                    # Compile all files together
                    output_file = temp_work_dir / f"{Path(testbench_file).stem}.out"
                    cmd = ["iverilog", "-o", str(output_file)]
                    cmd.extend(str(src) for src in temp_sources)
                    
                    logger.debug(f"Running compilation command: {cmd}")
                    result = subprocess.run(
                        cmd,
                        capture_output=True,
                        text=True,
                        cwd=temp_work_dir
                    )
                    
                    if result.returncode != 0:
                        raise RuntimeError(f"Compilation failed: {result.stderr}")
                        
                    logger.debug(f"Successfully compiled to {output_file}")
                else:
                    logger.debug(f"Using existing compiled output: {compiled_outputs[0]}")
                    output_file = compiled_outputs[0]

                # Run simulation
                cmd = ["vvp", str(output_file)]
            
            else:
                logger.error(f"Unsupported simulator: {self.simulator}")
                raise ValueError(f"Unsupported simulator: {self.simulator}")

            logger.debug(f"Simulation command: {cmd} in cwd={temp_work_dir}")
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                cwd=temp_work_dir
            )

            logger.debug(f"Simulation returncode={result.returncode}")
            #logger.debug(f"Simulation stdout={result.stdout!r}")
            logger.debug(f"Simulation stderr={result.stderr!r}")

            # Verify VCD file was created
            vcd_path = temp_work_dir / vcd_file
            if not vcd_path.exists():
                logger.warning(f"VCD file not generated at {vcd_path}")
            else:
                logger.debug(f"VCD file generated at {vcd_path}")
                # Copy VCD file to original work directory if needed
                dest_vcd = Path(self.work_dir) / vcd_file
                try:
                    shutil.copy2(vcd_path, dest_vcd)
                    logger.debug(f"Copied VCD file to {dest_vcd}")
                except Exception as e:
                    logger.warning(f"Failed to copy VCD file: {str(e)}")

            if result.returncode != 0:
                logger.error(
                    f"Simulation command returned code {result.returncode}"
                )
                raise RuntimeError(
                    f"Simulation failed with code {result.returncode}: {result.stderr}"
                )

            return result.stdout

        except subprocess.TimeoutExpired:
            logger.error(f"Simulation timeout for {testbench_file}")
            raise
        finally:
            # Clean up temp directory
            try:
                shutil.rmtree(temp_work_dir, ignore_errors=True)
                logger.debug(f"Cleaned up temporary directory: {temp_work_dir}")
            except Exception as e:
                logger.warning(f"Failed to clean up temp directory: {str(e)}")

    def _parse_simulation_output(self, output: str) -> List[TestResult]:
        """Parse simulation output and extract test results"""
        logger.debug("Parsing simulation output:")
        results = []
        for line in output.splitlines():
            line = line.lstrip("# ").strip()
            if not line.startswith("Test"):
                continue

            # Parse test case details
            parts = line.split("|")
            if len(parts) < 3:
                logger.debug(f"Skipping malformed line: {line}")
                continue

            # Extract inputs
            input_part = parts[0].split(":", 2)[2].strip()
            inputs = {}
            for kv in input_part.split(";"):
                if not kv.strip():
                    continue
                key, value = kv.strip().split("=")
                inputs[key.strip()] = self._parse_value(value.strip())

            # Extract outputs
            output_part = parts[1].split(":", 1)[1].strip()
            outputs = {}
            # Split by comma instead of space
            for kv in output_part.split(","):
                if not kv.strip():
                    continue
                key, value = kv.strip().split("=")
                outputs[key.strip()] = self._parse_value(value.strip())

            # Extract expected values
            expected_part = parts[2].split(":", 1)[1].strip()
            expected = {}
            # Split by comma instead of space
            for kv in expected_part.split(","):
                if not kv.strip():
                    continue
                key, value = kv.strip().split("=")
                expected[key.strip()] = self._parse_value(value.strip())

            # Compare results
            passed = all(
                outputs.get(key) == expected.get(key) for key in outputs.keys()
            )

            #logger.debug(
            #    f"Parsed values - Inputs: {inputs}, Outputs: {outputs}, Expected: {expected}"
            #)

            results.append(
                TestResult(
                    test_case=inputs,
                    expected=expected,
                    actual=outputs,
                    passed=passed,
                    error_message=None if passed else "Output mismatch",
                )
            )

        logger.debug(f"Parsed {len(results)} test results.")
        return results

    def _parse_value(self, value: str) -> Union[int, float]:
        """Parse string value to number, handling binary and hex formats"""
        value = value.strip()

        if re.fullmatch(r"[01]+", value):
            return int(value, 2)

        if value.startswith("b") and re.fullmatch(r"b[01]+", value):
            return int(value[1:], 2)  # interpret after 'b' as binary
        if value.startswith("h") and re.fullmatch(r"h[0-9A-Fa-f]+", value):
            return int(value[1:], 16)

        if "'" in value:  # Verilog format like 8'b00101010
            base = {"b": 2, "h": 16, "d": 10}[value.split("'")[1][0]]
            return int(value.split("'")[1][1:], base)

        try:
            return int(value)
        except ValueError:
            return float(value)
        
    def _cleanup(self):
        """Clean up temporary directories"""
        if hasattr(self, '_current_work_dir'):
            try:
                work_dir = self._current_work_dir
                if work_dir.exists():
                    shutil.rmtree(work_dir, ignore_errors=True)
                    logger.debug(f"Cleaned up temporary directory: {work_dir}")
                delattr(self, '_current_work_dir')
            except Exception as e:
                logger.warning(f"Failed to clean up temp directory: {str(e)}")


    @timing_wrapper
    def run_testbench(
        self,
        testbench_file: str,
        source_files: List[str],
        force_recompile: bool = False,
    ) -> TestbenchResult:
        """Run a single testbench and collect results"""
        logger.debug(
            f"Running testbench: {testbench_file}, "
            f"with sources={source_files}, force_recompile={force_recompile}"
        )
        try:
            # Setup simulator
            self._setup_simulator()

            # FIRST: Sequential compilation of all files
            #self._compile_all_files(source_files + [testbench_file], force_recompile)
            # Compile sources
            self._compile_source(source_files + [testbench_file], force_recompile)

            # THEN: Run simulation
            output = self._run_simulation(testbench_file)

            # Parse results
            results = self._parse_simulation_output(output)

            # Calculate statistics
            num_tests = len(results)
            passed_tests = sum(1 for r in results if r.passed)
            failed_tests = num_tests - passed_tests

            # Load parameter configuration from testbench name
            param_config = self._extract_params_from_filename(testbench_file)
            comp_name = self._extract_component_name(testbench_file)

            tb_result = TestbenchResult(
                component_name=comp_name,
                parameter_config=param_config,
                num_tests=num_tests,
                passed_tests=passed_tests,
                failed_tests=failed_tests,
                execution_time=0.0,  # overwritten by timing_wrapper
                test_results=results,
            )
            logger.debug(f"Testbench completed")
            return tb_result

        except Exception as e:
            logger.error(f"Error running testbench {testbench_file}: {str(e)}")
            raise
        
        finally:
            # Clean up temp files
            self._cleanup()

    def _extract_params_from_filename(self, filename: str) -> Dict[str, int]:
        """Extract parameter configuration from testbench filename"""
        basename = Path(filename).stem
        if basename.startswith("tb_"):
            try:
                param_part = basename[3 : basename.rindex("_")]
                params = {}
                for param in param_part.split("_"):
                    i = 0
                    while i < len(param) and not param[i].isdigit():
                        i += 1
                    if i < len(param):
                        name = param[:i]
                        value = int(param[i:])
                        params[name] = value
                return params
            except (ValueError, IndexError):
                logger.debug(f"Could not parse param combos from {basename}")
                return {}
        return {}

    def _extract_component_name(self, filename: str) -> str:
        basename = Path(filename).stem
        if not basename.startswith("tb_"):
            return basename  # e.g. "my_testbench"

        # Remove "tb_"
        content = basename[3:]  # e.g. "N8_WIDTH4_test_component"

        # We want to drop all param combos from the front (like "N8_" or "WIDTH4_")
        # until we can't parse them. Then the remainder is "test_component".
        pattern = re.compile(r"^([A-Za-z]\w*)(\d+)_?")
        idx = 0
        while True:
            match = pattern.match(content, idx)
            if not match:
                break
            idx += len(match.group(0))

        # Now, content[idx:] should be "test_component"
        return content[idx:] if idx < len(content) else ""

    def run_recursive(
        self,
        component_name: str,
        base_dir: str = "generated",
        force_recompile: bool = False,
    ) -> List[TestbenchResult]:
        """Run all testbenches for a component and its submodules recursively"""
        logger.debug(
            f"Running recursively for component={component_name}, base_dir={base_dir}"
        )
        results = []

        # print(os.listdir(base_dir))

        component_dir = find_component_directory(component_name, base_dir=base_dir)
        if not component_dir:
            logger.error(
                f"Component directory not found: {component_name} in {base_dir}"
            )
            raise FileNotFoundError(f"Component directory not found: {component_name}")

        details_file = Path(component_dir) / f"{component_name}_details.json"
        with open(details_file) as f:
            component_details = json.load(f)

        testbench_files = list(Path(component_dir).glob(f"tb_*{component_name}.v"))
        source_files = self._collect_source_files(component_dir)
        logger.debug(
            f"Found {len(testbench_files)} testbench(es) in {component_dir}"
        )

        for tb_file in testbench_files:
            logger.debug(f"Running testbench file={tb_file}")
            result = self.run_testbench(str(tb_file), source_files, force_recompile)
            results.append(result)

        if "submodules" in component_details:
            for submodule_name in list(set(component_details["submodules"])):
                logger.debug(f"Recursing into submodule={submodule_name}")
                sub_results = self.run_recursive(
                    submodule_name,
                    base_dir=component_dir,
                    # so submodule is found under
                    # "component_dir/submodule_name"
                    force_recompile=force_recompile,
                )
                results.extend(sub_results)

        return results

    def _collect_source_files(self, directory: Union[str, Path], skip_temp: bool = True) -> List[str]:
        """Collect all Verilog source files in directory (but skip testbenches and temp directories)"""
        directory = Path(directory)
        source_files = []
        logger.debug(f"Collecting source files in {directory}")
        
        # Only look at files directly in the directory, not recursively
        for file in directory.glob("*.v"):
            # Skip testbenches and temporary directories
            if not file.stem.startswith("tb_") and not "work_" in str(file):
                source_files.append(str(file))

        logger.debug(f"Collected {len(source_files)} source file(s): {source_files}")
        return source_files
