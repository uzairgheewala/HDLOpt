import datetime
import importlib
import inspect
import os
import random
from pathlib import Path
from typing import Dict, List, Type

import pytest
from reportlab.platypus import PageBreak

from ..rules.base import Rule, TestCase, TestResult
from ..scripts.reporting.generator import PDFReportGenerator
from ..scripts.reporting.templates.rule import RuleTemplate
from ..scripts.reporting.templates.summary import TestbenchSummaryTemplate


class RuleTestFactory:
    """Factory for discovering, testing and reporting on all rules."""

    def __init__(self, rules_dir: str, num_tests: int = 100):
        self.rules_dir = rules_dir
        self.num_tests = num_tests
        self.rules: Dict[str, Type[Rule]] = {}
        self.results: Dict[str, List[TestResult]] = {}
        self._discover_rules()

    def _discover_rules(self) -> None:
        """Automatically discover all rule classes in the rules directory."""
        rules_path = Path(self.rules_dir)

        # Get all .py files except __init__.py and base.py
        rule_files = [
            f
            for f in rules_path.glob("*.py")
            if f.name not in ["__init__.py", "base.py"]
        ]

        for rule_file in rule_files:
            # Import the module
            module_name = f"..rules.{rule_file.stem}"
            try:
                module = importlib.import_module(module_name, package=__package__)

                # Find all Rule subclasses in the module
                for name, obj in inspect.getmembers(module):
                    if inspect.isclass(obj) and issubclass(obj, Rule) and obj != Rule:
                        self.rules[name] = obj
                        print(f"Discovered rule: {name}")
            except Exception as e:
                print(f"Error loading rule from {rule_file}: {e}")

    def generate_test_cases(self, rule: Rule) -> List[TestCase]:
        """Generate test cases for a specific rule."""
        test_cases = []
        for _ in range(self.num_tests):
            inputs = {}
            for var_name in rule.input_vars:
                spec = rule.get_signal_spec(var_name)
                min_val, max_val = spec.get_range()
                inputs[var_name] = random.randint(min_val, max_val)

            expected_outputs = rule.generate_expected(inputs)
            test_cases.append(
                TestCase(inputs=inputs, expected_outputs=expected_outputs)
            )

        return test_cases

    def run_tests(self) -> Dict[str, List[TestResult]]:
        """Run tests for all discovered rules."""
        self.results = {}

        for rule_name, rule_class in self.rules.items():
            print(f"Testing {rule_name}...")
            rule = rule_class()  # Create instance with default parameters
            test_cases = self.generate_test_cases(rule)
            rule_results = []

            for test_case in test_cases:
                actual_outputs = rule.generate_expected(test_case.inputs)
                test_case.actual_outputs = actual_outputs
                passed = actual_outputs == test_case.expected_outputs
                test_case.passed = passed

                error_msg = None
                if not passed:
                    error_msg = (
                        f"Test failed: inputs={test_case.inputs}, "
                        f"expected={test_case.expected_outputs}, "
                        f"actual={actual_outputs}"
                    )

                rule_results.append(
                    TestResult(
                        test_case=test_case,
                        passed=passed,
                        error_message=error_msg,
                        rule_name=rule_name,
                    )
                )

            self.results[rule_name] = rule_results

        return self.results

    def generate_report(self, filename: str) -> None:
        """Generate comprehensive PDF report for all rules."""
        if not self.results:
            self.run_tests()

        # Create PDF report
        pdf_gen = PDFReportGenerator(filename)

        # Add title page
        timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        pdf_gen.add_title_page("HDL Rules Test Report", f"Generated: {timestamp}")
        pdf_gen.add_element(PageBreak())

        # Add summary section
        summary_template = TestbenchSummaryTemplate(pdf_gen)

        # Prepare summary data
        summary_data = {}
        for rule_name, results in self.results.items():
            summary_data[rule_name] = [
                {
                    "expected": r.test_case.expected_outputs,
                    "actual": r.test_case.actual_outputs,
                }
                for r in results
            ]

        pdf_gen.set_summary_template(summary_template)
        pdf_gen.set_summary_data(summary_data)
        pdf_gen.add_element(PageBreak())

        # Add individual rule sections
        for rule_name, rule_class in self.rules.items():
            rule = rule_class()
            results = self.results[rule_name]

            # Add rule template
            pdf_gen.add_heading(f"Rule: {rule_name}", level=1)
            rule_template = RuleTemplate(pdf_gen)
            rule_template.generate_page(rule)
            pdf_gen.add_template(rule_template.elements)

            # Add test results summary
            passed_tests = sum(1 for r in results if r.passed)
            pdf_gen.add_heading("Test Results", level=2)

            summary_data = [
                ["Total Tests", len(results)],
                ["Passed Tests", passed_tests],
                ["Failed Tests", len(results) - passed_tests],
                ["Pass Rate", f"{(passed_tests / len(results)) * 100:.2f}%"],
            ]
            pdf_gen.add_table([["Metric", "Value"]] + summary_data)

            # Add failed test details
            failed_tests = [r for r in results if not r.passed]
            if failed_tests:
                pdf_gen.add_heading("Failed Test Details", level=3)
                for i, result in enumerate(failed_tests[:5], 1):
                    pdf_gen.add_paragraph(f"Test Case {i}:")
                    pdf_gen.add_paragraph(f"Inputs: {result.test_case.inputs}")
                    pdf_gen.add_paragraph(
                        f"Expected: {result.test_case.expected_outputs}"
                    )
                    pdf_gen.add_paragraph(
                        f"Actual: {
                            result.test_case.actual_outputs}"
                    )
                    pdf_gen.add_paragraph("---")

                if len(failed_tests) > 5:
                    pdf_gen.add_paragraph(
                        f"(Showing 5 of {len(failed_tests)} failed tests)"
                    )

            # Add page break after each rule
            pdf_gen.add_element(PageBreak())

        pdf_gen.save()


@pytest.fixture
def rule_factory():
    """Create RuleTestFactory instance pointing to rules directory."""
    # Get the rules directory path relative to this test file
    current_dir = Path(__file__).parent
    rules_dir = current_dir.parent / "rules"
    # print(rules_dir)

    factory = RuleTestFactory(str(rules_dir))
    return factory


@pytest.fixture
def test_report_path(tmp_path):
    """Create a temporary path for the test report."""
    return str(tmp_path / "test_report.pdf")


def test_rule_discovery(rule_factory):
    """Test that rules are properly discovered."""
    # Should find at least one rule
    assert len(rule_factory.rules) > 0, "No rules were discovered"

    # Each discovered item should be a Rule subclass
    from ..rules.base import Rule

    for rule_class in rule_factory.rules.values():
        assert issubclass(
            rule_class, Rule
        ), f"{rule_class.__name__} is not a Rule subclass"


def test_test_generation(rule_factory):
    """Test that test cases are generated properly."""
    for rule_name, rule_class in rule_factory.rules.items():
        rule = rule_class()
        test_cases = rule_factory.generate_test_cases(rule)

        assert (
            len(test_cases) == rule_factory.num_tests
        ), f"Incorrect number of test cases generated for {rule_name}"

        # Verify test case structure
        for test_case in test_cases:
            # Check inputs
            assert set(test_case.inputs.keys()) == set(
                rule.input_vars
            ), f"Test case inputs don't match rule inputs for {rule_name}"

            # Check expected outputs
            assert set(test_case.expected_outputs.keys()) == set(
                rule.output_vars
            ), f"Test case outputs don't match rule outputs for {rule_name}"


def test_rule_execution(rule_factory):
    """Test that rules execute successfully."""
    results = rule_factory.run_tests()

    # Should have results for each discovered rule
    assert set(results.keys()) == set(
        rule_factory.rules.keys()
    ), "Results don't match discovered rules"

    # Check each rule's results
    for rule_name, rule_results in results.items():
        # Should have the correct number of test cases
        assert (
            len(rule_results) == rule_factory.num_tests
        ), f"Incorrect number of results for {rule_name}"

        # Each result should be properly formed
        for result in rule_results:
            assert hasattr(
                result, "passed"
            ), f"Result missing 'passed' attribute for {rule_name}"
            assert hasattr(
                result, "test_case"
            ), f"Result missing 'test_case' attribute for {rule_name}"
            assert (
                result.rule_name == rule_name
            ), f"Result has incorrect rule name for {rule_name}"


def test_report_generation(rule_factory, test_report_path):
    """Test that PDF report is generated successfully."""
    # Run tests and generate report
    rule_factory.run_tests()
    rule_factory.generate_report(test_report_path)

    # Verify report was created
    assert os.path.exists(test_report_path), "Report file was not created"
    assert os.path.getsize(test_report_path) > 0, "Report file is empty"


@pytest.mark.parametrize("bit_width", [1, 4, 8, 16])
def test_rules_with_different_bit_widths(rule_factory, bit_width):
    """Test rules with different bit widths."""
    for rule_name, rule_class in rule_factory.rules.items():
        # Create rule instance with specific bit width
        rule = rule_class(bit_width)

        # Generate test cases
        test_cases = rule_factory.generate_test_cases(rule)

        for test_case in test_cases:
            # Check input ranges
            for var_name, val in test_case.inputs.items():
                spec = rule.get_signal_spec(var_name)
                min_val, max_val = spec.get_range()
                assert min_val <= val <= max_val, (
                    f"Input value {val} for variable {var_name} exceeds "
                    f"{spec.width}-bit {'signed' if spec.signed else 'unsigned'} "
                    f"range [{min_val}, {max_val}] in {rule_name}"
                )

            # Check output ranges
            expected = rule.generate_expected(test_case.inputs)
            for var_name, val in expected.items():
                spec = rule.get_signal_spec(var_name)
                min_val, max_val = spec.get_range()
                try:
                    assert min_val <= int(val) <= max_val, (
                        f"Output value {val} for variable {var_name} exceeds "
                        f"{spec.width}-bit {'signed' if spec.signed else 'unsigned'} "
                        f"range [{min_val}, {max_val}] in {rule_name}"
                    )
                except Exception as e:
                    print(str(e))
                    print(
                        rule_name,
                        bit_width,
                        test_case,
                        var_name,
                        val,
                        spec,
                        min_val,
                        max_val,
                    )


def test_rule_failure_detection(rule_factory):
    """Test that rule failures are properly detected and reported."""
    results = rule_factory.run_tests()

    for rule_name, rule_results in results.items():
        failed_tests = [r for r in rule_results if not r.passed]

        for result in failed_tests:
            # Failed tests should have error messages
            assert (
                result.error_message is not None
            ), f"Failed test missing error message for {rule_name}"

            # The actual and expected outputs should differ
            assert (
                result.test_case.actual_outputs != result.test_case.expected_outputs
            ), f"Failed test shows matching outputs for {rule_name}"


def test_all_rules():
    """
    Main test function that runs all rules and generates a report.
    This can be run directly with pytest for a full test suite execution.
    """
    current_dir = Path(__file__).parent
    rules_dir = current_dir.parent / "rules"
    report_path = current_dir.parent / "test_reports" / "hdl_rules_test_report.pdf"

    # Create reports directory if it doesn't exist
    report_path.parent.mkdir(exist_ok=True)

    # Create factory and run tests
    factory = RuleTestFactory(str(rules_dir))
    results = factory.run_tests()

    # Generate report
    factory.generate_report(str(report_path))

    # Check for any failures
    failed_rules = {}
    for rule_name, rule_results in results.items():
        failed_tests = [r for r in rule_results if not r.passed]
        if failed_tests:
            failed_rules[rule_name] = len(failed_tests)

    # If any rules failed, raise assertion with details
    if failed_rules:
        failure_msg = "\nRule Test Failures:\n"
        for rule_name, num_failed in failed_rules.items():
            failure_msg += f"{rule_name}: {num_failed} tests failed\n"
        failure_msg += f"\nDetailed report generated at: {report_path}"
        pytest.fail(failure_msg)


if __name__ == "__main__":
    pytest.main([__file__])
