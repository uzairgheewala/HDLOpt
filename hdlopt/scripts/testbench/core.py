import copy
import itertools
import json
import math
import os
import random
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Dict, List, Optional, Union

import jinja2

from ...rules.base import MockRule, Rule
from ..logger import logger
from .utils import to_binary_string


@dataclass
class ConstraintConfig:
    """Configuration for parameter and input constraints"""

    param_constraints: Optional[Dict[str, Callable]] = None
    input_constraints: Optional[Dict[str, Dict[str, Callable]]] = None


@dataclass
class TimingConfig:
    """Configuration for timing-related parameters"""

    clk_period: Union[int, Dict[str, List[int]]] = 10
    operation_delay: Union[int, Dict[str, int]] = 10
    rule_delay: Optional[Dict[str, str]] = None


@dataclass
class SignalConfig:
    """Configuration for special signal handling"""

    clk_names: Optional[Dict[str, List[str]]] = None
    rst_names: Optional[Dict[str, List[str]]] = None
    start_names: Optional[Dict[str, List[str]]] = None
    valid_names: Optional[Dict[str, List[str]]] = None


class TestbenchGenerator:
    """Main class for generating HDL testbenches"""

    def __init__(
        self,
        component_name: str,
        rules: List[Rule],
        constraints: Optional[ConstraintConfig] = None,
        timing: Optional[TimingConfig] = None,
        signals: Optional[SignalConfig] = None,
        base_dir: str = "generated",
        min_params: Optional[Dict[str, Dict[str, int]]] = None,
    ):
        self.component_name = component_name
        self.rules = rules
        self.constraints = constraints or ConstraintConfig()
        self.timing = timing or TimingConfig()
        self.signals = signals or SignalConfig()
        self.base_dir = base_dir
        self.min_params = min_params or {}

        # Load testbench template
        self.template = jinja2.Template(self._get_template())

    def _get_template(self) -> str:
        """Get the Verilog testbench template"""
        # Template moved to separate file for clarity
        template_path = Path(__file__).parent / "templates" / "testbench.v.jinja2"
        with open(template_path) as f:
            return f.read()

    def _determine_input_ranges(self, bit_width: str, sign_type: str) -> range:
        """Calculate valid input ranges based on bit width and sign type"""
        if bit_width is None or bit_width == "1":
            width = 1
        elif ":" in bit_width:
            high, low = map(int, bit_width.split(":"))
            width = high - low + 1
        else:
            width = int(bit_width)

        if sign_type == "signed":
            return range(-(2 ** (width - 1)), 2 ** (width - 1))
        else:
            if width > 16:
                width = 16  # Limit width for practical testing
            return range(0, 2**width)

    def _calculate_input_ranges(self, component_details: Dict) -> Dict[str, List[int]]:
        """Calculate valid ranges for each input signal.

        Args:
            component_details: Component specification dictionary

        Returns:
            Dictionary mapping signal names to [min, max] range lists
        """
        input_ranges = {}
        for inp in component_details["inputs"]:
            try:
                signal_name, conn_type, sign_type, bit_width = inp
            except ValueError:
                signal_name, conn_type, sign_type, bit_width, comment, default_val = (
                    inp[key] for key in inp.keys()
                )
            input_range = list(self._determine_input_ranges(bit_width, sign_type))
            input_ranges[signal_name] = [input_range[0], input_range[-1]]

        return input_ranges

    def _process_parameters(self, component_details: Dict) -> List[tuple]:
        """Process component parameters and generate parameter ranges"""
        parameters = component_details.get("parameters", [])
        param_ranges = []

        for param in parameters:
            name = param["name"]
            value = int(param["value"])
            if value <= 0:
                raise ValueError(
                    f"Parameter {name} value must be positive, got {value}"
                )

            min_val = self.min_params.get(self.component_name, {}).get(name, 1)
            max_val = min(int(param["value"]) * 8, 8)
            param_ranges.append((name, (min_val, max_val)))

        return param_ranges

    def _validate_inputs(
        self, input_ranges: Dict[str, List[int]], component_details: Dict
    ) -> Dict[str, List[int]]:
        """Apply input constraints and validation"""
        if not self.constraints.input_constraints:
            return input_ranges

        component_constraints = self.constraints.input_constraints.get(
            self.component_name, {}
        )

        for signal_name, constraint_func in component_constraints.items():
            if signal_name in input_ranges:
                input_ranges[signal_name] = constraint_func(input_ranges[signal_name])

        return input_ranges

    def _get_special_signals(self) -> List[str]:
        """Get list of all special signal names (clk, rst, etc)."""
        special_signals = []

        if self.signals.clk_names and self.component_name in self.signals.clk_names:
            special_signals.extend(self.signals.clk_names[self.component_name])
        if self.signals.rst_names and self.component_name in self.signals.rst_names:
            special_signals.extend(self.signals.rst_names[self.component_name])
        if self.signals.start_names and self.component_name in self.signals.start_names:
            special_signals.extend(self.signals.start_names[self.component_name])

        return special_signals

    def _setup_special_signals(self, component_details: Dict) -> Dict:
        """Setup special signal flags and blocks."""
        # Setup start signal handling
        start_list = []
        if self.signals.start_names and self.component_name in self.signals.start_names:
            start_list = [
                inp[0]
                for inp in component_details["inputs"]
                if inp[0] in self.signals.start_names[self.component_name]
            ]
        if not start_list:
            start_list = [
                inp[0] for inp in component_details["inputs"] if inp[0] == "start"
            ]
        component_details["start_present"] = (
            bool(start_list),
            len(start_list),
            start_list,
        )

        # Setup valid signal handling
        valid_list = []
        if self.signals.valid_names and self.component_name in self.signals.valid_names:
            valid_list = [
                out[0]
                for out in component_details["outputs"]
                if out[0] in self.signals.valid_names[self.component_name]
            ]
        if not valid_list:
            valid_list = [
                out[0] for out in component_details["outputs"] if out[0] == "valid"
            ]
        component_details["valid_present"] = (
            bool(valid_list),
            len(valid_list),
            valid_list,
        )

        # Setup clock handling
        clk_list = []
        if self.signals.clk_names and self.component_name in self.signals.clk_names:
            clk_list = [
                inp[0]
                for inp in component_details["inputs"]
                if inp[0] in self.signals.clk_names[self.component_name]
            ]
        if not clk_list:
            clk_list = [
                inp[0] for inp in component_details["inputs"] if inp[0] == "clk"
            ]

        if clk_list:
            clk_blocks = []
            if isinstance(self.timing.clk_period, dict):
                periods = self.timing.clk_period[self.component_name]
                # Ensure we have enough periods for all clocks
                periods = periods * (len(clk_list) // len(periods) + 1)
                periods = periods[: len(clk_list)]
            else:
                periods = [self.timing.clk_period] * len(clk_list)

            for i, period in enumerate(periods):
                clk_block = f"""
                always begin
                    #{int(period / 2)} {clk_list[i]} = ~{clk_list[i]};
                end"""
                clk_blocks.append(clk_block)
            component_details["clock_blocks"] = "\n".join(clk_blocks)
        component_details["clk_present"] = (bool(clk_list), len(clk_list), clk_list)

        # Setup reset handling
        rst_list = []
        if self.signals.rst_names and self.component_name in self.signals.rst_names:
            rst_list = [
                inp[0]
                for inp in component_details["inputs"]
                if inp[0] in self.signals.rst_names[self.component_name]
            ]
        if not rst_list:
            rst_list = [
                inp[0] for inp in component_details["inputs"] if inp[0] == "rst"
            ]

        if rst_list:
            rst_blocks = []
            for rst in rst_list:
                rst_block = f"""
                always begin
                    #99 {rst} = 1'b1;
                end"""
                rst_blocks.append(rst_block)
            component_details["reset_blocks"] = "\n".join(rst_blocks)
        component_details["rst_present"] = (bool(rst_list), len(rst_list), rst_list)

        return component_details

    def _calculate_num_tests(self, input_ranges: Dict[str, List[int]]) -> int:
        """Calculate total number of possible tests.

        Args:
            input_ranges: Dictionary of input ranges

        Returns:
            Total number of possible test combinations
        """
        num_possible_tests = 1
        for port, input_range in input_ranges.items():
            if port not in self._get_special_signals():
                num_possible_tests *= input_range[1] - input_range[0] + 1

        return num_possible_tests

    def _generate_test_cases(
        self, input_ranges: Dict[str, List[int]], num_tests: int
    ) -> List[Dict[str, int]]:
        """Generate random test cases within valid input ranges"""
        test_cases = []

        while len(test_cases) < num_tests:
            test_case = {}
            for signal_name, signal_range in input_ranges.items():
                test_case[signal_name] = random.randint(
                    signal_range[0], signal_range[1]
                )

            if test_case not in test_cases:
                test_cases.append(test_case)

        return test_cases

    def _assign_rules(
        self, test_cases: List[Dict[str, int]], component_details: Dict
    ) -> List[Dict[str, int]]:
        """Assign rules to test cases and generate expected outputs"""
        logger.debug(
            f"Starting rule assignment for {
                len(test_cases)} test cases"
        )
        # logger.debug(f"Available rules: {[r.name for r in self.rules]}")
        logger.debug(f"Component name: {component_details['component_name']}")

        expected_values = []
        rules_used = []

        # Extract bit widths from ports
        input_widths = []
        output_widths = []

        for signal_name, data_type, sign_type, bit_width in component_details["inputs"]:
            # Skip control signals like clk, rst, enable etc
            if signal_name not in self._get_special_signals():
                if ":" in bit_width:
                    msb, lsb = map(int, bit_width.split(":"))
                    width = msb - lsb + 1
                else:
                    width = int(bit_width)
                input_widths.append(width)

        for signal_name, data_type, sign_type, bit_width in component_details[
            "outputs"
        ]:
            if ":" in bit_width:
                msb, lsb = map(int, bit_width.split(":"))
                width = msb - lsb + 1
            else:
                width = int(bit_width)
            output_widths.append(width)

        # logger.debug(f"input_widths: {input_widths}")
        # logger.debug(f"output_widths: {output_widths}")

        # Set bit width for matching rules
        for rule in self.rules:
            if rule.matches(component_details["component_name"]):
                rule.set_bit_width(min(input_widths))
                # logger.debug(f"rule.bit_width:{rule.bit_width}\nrule.default_bit_width:{rule._default_bit_width}")

        for i, test_case in enumerate(test_cases):
            # logger.debug(f"Processing test case {i}: {test_case}")

            for rule in self.rules:
                # logger.debug(f"Checking rule {rule.name} against {component_details['component_name']}")
                if rule.matches(component_details["component_name"]):
                    # logger.debug(f"Rule {rule.name} matches")

                    try:
                        if isinstance(rule, MockRule):
                            # logger.debug("Processing MockRule")
                            inputs = {}
                            non_special_inputs = [
                                k
                                for k in test_case.keys()
                                if k not in self._get_special_signals()
                            ]
                            # logger.debug(f"Non-special inputs: {non_special_inputs}")

                            if len(non_special_inputs) >= 2:
                                inputs["a"] = test_case[non_special_inputs[0]]
                                inputs["b"] = test_case[non_special_inputs[1]]
                            else:
                                inputs["a"] = 0
                                inputs["b"] = 0

                            # logger.debug(f"Mapped inputs: {inputs}")
                            expected_value = rule.generate_expected(inputs)
                        else:
                            # logger.debug(f"Processing regular rule for case: {test_case}")
                            expected_value = rule.generate_expected(test_case)

                        # logger.debug(f"Generated expected value: {expected_value}")
                        expected_values.append(expected_value)
                        rules_used.append(rule.name)
                        break
                    except Exception as e:
                        logger.error(
                            f"Error generating expected value: {
                                str(e)}",
                            exc_info=True,
                        )
                        raise

        # logger.debug(f"Rule assignment complete. Rules used: {list(set(rules_used))}")
        logger.debug(f"Generated {len(expected_values)} expected values")
        component_details["rules"] = list(set(rules_used))
        return expected_values

    def generate(
        self, recursive: bool = False, test_cases: Optional[List[Dict[str, int]]] = None
    ) -> None:
        """Generate testbench(es) for component(s).

        Args:
            recursive: Whether to generate for submodules
            test_cases: Optional pre-generated test cases to use
        """
        component_dir = self._find_component_dir()
        component_details = self._load_component_details(component_dir)

        # Process parameters and generate combinations
        param_ranges = self._process_parameters(component_details)
        param_names, param_combinations, _ = self._get_param_combinations(
            param_ranges, self.constraints.param_constraints
        )

        for param_comb in param_combinations:
            if test_cases is not None:
                # Use provided test cases
                self._generate_single_testbench_with_cases(
                    param_comb, param_names, component_details, test_cases
                )
            else:
                # Generate test cases normally
                self._generate_single_testbench(
                    param_comb, param_names, component_details
                )

        if recursive and "submodules" in component_details:
            self._generate_recursive_testbenches(
                list(set(component_details["submodules"]))
            )

    def _generate_single_testbench_with_cases(
        self,
        param_comb: tuple,
        param_names: List[str],
        component_details: Dict,
        test_cases: List[Dict[str, int]],
    ) -> None:
        """Generate testbench using pre-generated test cases."""
        logger.debug("Starting testbench generation with pre-generated cases")

        component_details = copy.deepcopy(component_details)

        # Build parameter combination string
        param_comb_str = "_".join(
            [f"{param_names[i]}{param_comb[i]}" for i in range(len(param_comb))]
        )

        # Update bit widths based on parameters
        component_details = self._update_bit_widths(
            component_details, param_comb, param_names
        )

        # Generate expected values using rules
        expected_values = self._assign_rules(test_cases, component_details)

        # Update component details
        component_details = self._setup_special_signals(component_details)

        # Set parameter combination
        param_comb_list = list(zip(param_names, param_comb))
        component_details["param_comb"] = param_comb_list

        # Update component details with test cases
        self._update_component_details(
            component_details, param_comb_str, test_cases, expected_values
        )

        # Generate and save testbench
        tb_code = self.template.render(component_details)
        self._save_testbench(tb_code, param_comb_str)

    def _generate_single_testbench(
        self, param_comb: tuple, param_names: List[str], component_details: Dict
    ) -> None:
        """Generate testbench for a single parameter combination"""
        logger.debug(
            f"Starting testbench generation for parameters: {dict(zip(param_names, param_comb))}"
        )

        import copy

        component_details = copy.deepcopy(component_details)

        # Build parameter combination string
        param_comb_str = "_".join(
            [f"{param_names[i]}{param_comb[i]}" for i in range(len(param_comb))]
        )
        logger.debug(f"Parameter combination string: {param_comb_str}")

        # Update bit widths based on parameters
        logger.debug("Updating bit widths")
        component_details = self._update_bit_widths(
            component_details, param_comb, param_names
        )
        logger.debug(f"Updated inputs: {component_details['inputs']}")
        logger.debug(f"Updated outputs: {component_details['outputs']}")

        # Generate input ranges and test cases
        logger.debug("Calculating input ranges")
        input_ranges = self._calculate_input_ranges(component_details)
        logger.debug(f"Input ranges: {input_ranges}")

        input_ranges = self._validate_inputs(input_ranges, component_details)
        logger.debug(f"Validated input ranges: {input_ranges}")

        num_tests = self._calculate_num_tests(input_ranges)
        logger.debug(f"Generating {num_tests} test cases")
        test_cases = self._generate_test_cases(input_ranges, num_tests)
        # logger.debug(f"Generated test cases: {test_cases}")

        # Generate expected values using rules
        logger.debug("Generating expected values")
        expected_values = self._assign_rules(test_cases, component_details)
        # logger.debug(f"Generated expected values: {expected_values}")

        # Update component details
        logger.debug("Setting up special signals")
        component_details = self._setup_special_signals(component_details)
        logger.debug(
            f"Special signals setup: start={
                component_details.get('start_present')}, valid={
                component_details.get('valid_present')}"
        )

        # Turn param_comb (a tuple like (1,1)) into [('WIDTH',1),('DEPTH',1)]
        # or similar
        param_comb_list = list(zip(param_names, param_comb))
        component_details["param_comb"] = param_comb_list

        logger.debug("Updating component details")
        self._update_component_details(
            component_details, param_comb_str, test_cases, expected_values
        )
        # logger.debug(f"Final component details: {component_details}")

        # Generate and save testbench
        logger.debug("Rendering template")
        tb_code = self.template.render(component_details)
        logger.debug("Saving testbench")
        self._save_testbench(tb_code, param_comb_str)

    def _generate_recursive_testbenches(self, submodules: List) -> None:
        """
        Recursively generate testbenches for each submodule.
        submodules is expected to be a dict of {submodule_name: submodule_details}.
        """
        parent_dir = self._find_component_dir()

        for submodule_name in submodules:
            # Create a new generator for the submodule
            submodule_gen = TestbenchGenerator(
                component_name=submodule_name,
                rules=self.rules,
                constraints=self.constraints,
                timing=self.timing,
                signals=self.signals,
                base_dir=parent_dir,
                min_params=self.min_params,
            )
            # Recursively generate for that submodule
            submodule_gen.generate(recursive=True)

    def _save_testbench(self, tb_code: str, param_comb_str: str) -> None:
        """Save generated testbench to file"""
        component_dir = self._find_component_dir()
        tb_filename = os.path.join(
            component_dir, f"tb_{param_comb_str}_{self.component_name}.v"
        )

        with open(tb_filename, "w") as f:
            f.write(tb_code)

        print(f"Generated testbench saved to {tb_filename}")

    def _find_component_dir(self) -> str:
        """Find the directory containing component files"""
        try:
            base_path = Path(self.base_dir)
            component_dir = base_path / self.component_name
            if not component_dir.exists():
                raise FileNotFoundError(
                    f"Component directory not found: {component_dir}"
                )
            return str(component_dir)
        except Exception as e:
            raise FileNotFoundError(
                f"Error finding component directory: {
                    str(e)}"
            )

    def _load_component_details(self, component_dir: str) -> Dict:
        """Load component details from JSON file"""
        details_file = Path(component_dir) / f"{self.component_name}_details.json"

        if not details_file.exists():
            raise FileNotFoundError(f"Component details file not found: {details_file}")

        with open(details_file) as f:
            return json.load(f)

    def _get_param_combinations(self, parameter_ranges, constraints=None):
        param_names = [param[0] for param in parameter_ranges]
        param_values = [
            range(param[1][0], param[1][1] + 1) for param in parameter_ranges
        ]

        param_combinations = list(itertools.product(*param_values))

        if constraints and self.component_name in constraints:
            constraint_func = constraints[self.component_name]
            param_combinations = [
                comb for comb in param_combinations if constraint_func(*comb)
            ]

        total_combinations = len(param_combinations)

        return param_names, param_combinations, total_combinations

    def _update_bit_widths(self, component_details, param_comb, param_names):
        # Create deep copy of component details to avoid modifying original
        component_details = json.loads(json.dumps(component_details))

        # Create parameter dictionary for substitutions
        param_dict = {param_names[i]: param_comb[i] for i in range(len(param_names))}

        lines = component_details["inputs"] + component_details["outputs"]

        for z in range(len(lines)):
            inp = lines[z]
            # logger.debug(f"inp={inp},\n len(inp)={len(inp)}")
            if type(inp) is list:
                # For test
                signal_name, conn_type, sign_type, bit_width = inp
            else:
                signal_name, conn_type, sign_type, bit_width, comment, default_val = (
                    inp[key] for key in inp.keys()
                )
            # logger.debug(f"{signal_name, conn_type, sign_type, bit_width}")

            # Function to replace parameters in the bit width string
            def replace_param(match):
                param = match.group(0)
                return str(param_dict.get(param, param))

            # Use regex to replace parameter names in bit width string
            param_pattern = re.compile(
                r"\b(" + "|".join(re.escape(param) for param in param_names) + r")\b"
            )
            bit_width = param_pattern.sub(replace_param, bit_width)

            if ":" in bit_width:
                start_expr, end_expr = bit_width.rsplit(":", 1)
            else:
                start_expr = bit_width
                end_expr = None

            # Process clog2 expressions
            def process_clog2(expr):
                pattern = r"\$clog2\((\d+)\)"

                def replace_clog2(match):
                    arg = int(match.group(1))
                    return str(math.ceil(math.log2(arg)))

                return re.sub(pattern, replace_clog2, expr)

            # Evaluate expressions
            def evaluate_exp(expr):
                bit_width = ""
                if "$clog2" in expr:
                    expr = process_clog2(expr)
                if "(" in expr and ")" in expr:
                    expr = expr.strip("()")
                if "?" in expr:
                    condition, true_expr, false_expr = re.split(r"\?|:", expr)
                    condition_value = eval(condition)
                    bit_width = eval(true_expr if condition_value else false_expr)
                else:
                    bit_width = eval(expr)
                return bit_width

            start = evaluate_exp(start_expr)
            end = evaluate_exp(end_expr) if end_expr else start

            bit_width = f"{start}:{end}"

            if bit_width != "1":
                parts = bit_width.split(":")
                if parts[0] == parts[1]:
                    bit_width = "1"

            # Update bit width in appropriate list
            if z < len(component_details["inputs"]):
                component_details["inputs"][z] = (
                    signal_name,
                    conn_type,
                    sign_type,
                    bit_width,
                )
            else:
                component_details["outputs"][z - len(component_details["inputs"])] = (
                    signal_name,
                    conn_type,
                    sign_type,
                    bit_width,
                )

        return component_details

    def _update_component_details(
        self,
        component_details: Dict,
        param_comb_str: str,
        test_cases: List[Dict],
        expected_values: List[Dict],
    ) -> None:
        """Update component details with test information.

        Args:
            component_details: Component specification dictionary
            param_comb_str: Parameter combination string
            test_cases: List of test case dictionaries
            expected_values: List of expected output dictionaries
        """
        # Create stimuli and expected lists if they don't exist
        if "stimuli" not in component_details:
            component_details["stimuli"] = []
        if "expected" not in component_details:
            component_details["expected"] = []

        # Clear existing stimuli/expected
        component_details["stimuli"].clear()
        component_details["expected"].clear()

        invalid_inputs = self._get_special_signals()

        # Generate stimuli strings
        for test_case in test_cases:
            stimulus = []
            for input, value in test_case.items():
                if input not in invalid_inputs:
                    value_str = self._get_signal_value_str(
                        input, value, component_details
                    )
                    stimulus.append(f"{input} = {value_str};")
            component_details["stimuli"].append(" ".join(stimulus))

        component_details.update(
            {
                "expected": expected_values,
                "operation_delay": self._get_operation_delay(),
                "rule_delay": self._get_rule_delay(),
                "component_name": self.component_name,
                "param_component_name": f"{param_comb_str}_{
                    self.component_name}",
            }
        )

        # logger.debug("Updated component details: %s", component_details)

    def _get_signal_value_str(
        self, signal_name: str, value: int, component_details: Dict
    ) -> str:
        """Get Verilog-formatted value string for a signal."""
        signal_info = next(
            (inp for inp in component_details["inputs"] if inp[0] == signal_name), None
        )
        if signal_info:
            signal_name, conn_type, sign_type, bit_width = signal_info

            if bit_width == "1":
                bit_width_value = 1
            else:
                parts = bit_width.split(":")
                start = int(parts[0])
                end = int(parts[1])
                bit_width_value = abs(start - end) + 1

            bin_str = to_binary_string(value, bit_width_value, sign_type)
            return f"{bit_width_value}'b{bin_str}"
        return str(value)

    def _get_operation_delay(self) -> int:
        """Get operation delay for current component."""
        if isinstance(self.timing.operation_delay, dict):
            return self.timing.operation_delay.get(self.component_name, 10)
        return self.timing.operation_delay

    def _get_rule_delay(self) -> Optional[str]:
        """Get rule delay for current component."""
        if isinstance(self.timing.rule_delay, dict):
            return self.timing.rule_delay.get(self.component_name)
        return self.timing.rule_delay
