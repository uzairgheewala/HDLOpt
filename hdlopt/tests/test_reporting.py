"""Test suite for PDF report generation system."""

import os
from unittest.mock import patch

import pytest
from reportlab.lib.pagesizes import landscape, letter
from reportlab.platypus import PageBreak, Table

from ..scripts.reporting.generator import PDFReportGenerator
from ..scripts.reporting.templates.base import PageTemplate
from ..scripts.reporting.templates.logs import LogsTemplate
from ..scripts.reporting.templates.rule import RuleTemplate
from ..scripts.reporting.templates.summary import TestbenchSummaryTemplate


@pytest.fixture
def sample_rule():
    """Create a mock rule for testing."""

    class MockRule:
        name = "TestRule"
        input_vars = ["a", "b", "cin"]
        output_vars = ["sum", "cout"]
        bit_width = 8
        pattern = type(
            "MockPattern",
            (),
            {
                "__str__": lambda x: "a & b | (a ^ b) & cin",
                "__class__": type("MockClass", (), {"__name__": "TestPattern"}),
            },
        )()

        def __str__(self):
            return "def generate_expected(a, b, cin):\n    return a + b + cin"

    return MockRule()


@pytest.fixture
def pdf_generator():
    """Create a PDF generator instance for testing."""
    filename = "test_report.pdf"
    generator = PDFReportGenerator(filename)
    yield generator
    # Cleanup after tests
    if os.path.exists(filename):
        os.remove(filename)
    for temp_file in generator.temp_files:
        if os.path.exists(temp_file):
            os.remove(temp_file)


class TestPageTemplate:
    """Test suite for base PageTemplate class."""

    def test_initialization(self, pdf_generator):
        """Test template initialization."""
        template = PageTemplate(pdf_generator)
        assert template.pdf_report == pdf_generator
        assert template.doc == pdf_generator.doc
        assert template.styles == pdf_generator.styles
        assert template.page_size == landscape(letter)
        assert len(template.elements) == 0
        assert len(template.toc) == 0

    def test_add_heading(self, pdf_generator):
        """Test heading addition with TOC entry."""
        template = PageTemplate(pdf_generator)

        # Test single heading
        template.add_heading("Test Heading", level=1)
        assert len(template.elements) == 2  # Heading + Spacer
        assert len(template.toc) == 1
        assert template.toc[0][0] == "Test Heading"
        assert template.toc[0][1] == 1

        # Test multiple headings
        template.add_heading("Subheading", level=2)
        assert len(template.elements) == 4  # 2 Headings + 2 Spacers
        assert len(template.toc) == 2
        assert template.toc[1][0] == "Subheading"
        assert template.toc[1][1] == 2

    """
    def test_page_break_handling(self, pdf_generator):
        Test automatic page break insertion.
        template = PageTemplate(pdf_generator)

        # Create a large element that should definitely trigger page break
        # Using a much larger text block to ensure it exceeds page height
        large_text = "X\n" * 1000  # Increased size dramatically
        large_paragraph = Paragraph(large_text, template.styles['Normal'])

        # Calculate available height vs required height
        frame = Frame(template.doc.leftMargin, template.doc.bottomMargin,
                     template.doc.width, template.current_page_height)
        element_height = large_paragraph.wrap(frame._width, frame._height)[1]

        template.add_element(large_paragraph)


        assert any(isinstance(elem, PageBreak) for elem in template.elements)
        assert template.current_page_height > 0
    """

    def test_duplicate_heading_handling(self, pdf_generator):
        """Test handling of duplicate heading text."""
        template = PageTemplate(pdf_generator)

        template.add_heading("Same Heading")
        template.add_heading("Same Heading")

        assert len(template.toc) == 2
        assert template.toc[0][3] != template.toc[1][3]  # Unique identifiers
        assert template.entry_counter["Same Heading"] == 2


class TestRuleTemplate:
    """Test suite for RuleTemplate class."""

    def test_rule_page_generation(self, pdf_generator, sample_rule):
        """Test complete rule page generation."""
        template = RuleTemplate(pdf_generator)
        template.generate_page(sample_rule)

        # Check all required elements are present
        assert any(sample_rule.name in str(elem) for elem in template.elements)
        assert any("Input Variables" in str(elem) for elem in template.elements)
        assert any("Output Variables" in str(elem) for elem in template.elements)
        assert any("Bit Width" in str(elem) for elem in template.elements)
        assert any("Pattern" in str(elem) for elem in template.elements)

        # Check specific values
        assert any("a, b, cin" in str(elem) for elem in template.elements)
        assert any("sum, cout" in str(elem) for elem in template.elements)
        assert any("8" in str(elem) for elem in template.elements)

    def test_rule_with_empty_values(self, pdf_generator):
        """Test rule template with empty or None values."""

        class EmptyRule:
            name = ""
            input_vars = []
            output_vars = []
            bit_width = None
            pattern = type(
                "EmptyPattern",
                (),
                {
                    "__str__": lambda x: "",
                    "__class__": type("MockClass", (), {"__name__": "EmptyPattern"}),
                },
            )()

            def __str__(self):
                return ""

        template = RuleTemplate(pdf_generator)
        template.generate_page(EmptyRule())

        # Should still generate a valid page without errors
        assert len(template.elements) > 0


class TestLogsTemplate:
    """Test suite for LogsTemplate class."""

    def test_log_page_generation(self, pdf_generator):
        """Test log page generation with various log entries."""
        template = LogsTemplate(pdf_generator)
        logs = [
            "INFO: Test started",
            "DEBUG: Processing input",
            "WARNING: Unexpected value",
            "ERROR: Operation failed",
            "INFO: Test completed",
        ]

        template.generate_page(logs)

        # Check header
        assert any("Logs" in str(elem) for elem in template.elements)

        # Check all log entries are present
        for log in logs:
            assert any(log in str(elem) for elem in template.elements)

    def test_empty_logs(self, pdf_generator):
        """Test log template with empty log list."""
        template = LogsTemplate(pdf_generator)
        template.generate_page([])

        # Should still generate a valid page with header
        assert len(template.elements) > 0
        assert any("Logs" in str(elem) for elem in template.elements)

    def test_large_log_set(self, pdf_generator):
        """Test handling of large number of log entries."""
        template = LogsTemplate(pdf_generator)
        logs = [f"Log entry {i}" for i in range(1000)]

        template.generate_page(logs)

        # Should handle pagination correctly
        assert any(isinstance(elem, PageBreak) for elem in template.elements)


class TestTestbenchSummaryTemplate:
    """Test suite for TestbenchSummaryTemplate class."""

    def test_summary_generation(self, pdf_generator):
        """Test generation of testbench summary."""
        template = TestbenchSummaryTemplate(pdf_generator)
        data = {
            "full_adder": [
                {"expected": {"sum": 1}, "actual": {"sum": 1}},
                {"expected": {"sum": 0}, "actual": {"sum": 0}},
            ],
            "half_adder": [
                {"expected": {"sum": 1}, "actual": {"sum": 0}},
                {"expected": {"sum": 0}, "actual": {"sum": 0}},
            ],
        }

        elements = template.generate_page(data)

        # Check table headers
        assert any("Component" in str(elem) for elem in elements)
        assert any("Total Tests" in str(elem) for elem in elements)
        assert any("Passed" in str(elem) for elem in elements)
        assert any("Failed" in str(elem) for elem in elements)

        # Check component data
        assert any("full_adder" in str(elem) for elem in elements)
        assert any("half_adder" in str(elem) for elem in elements)

    def test_empty_data(self, pdf_generator):
        """Test summary template with empty data."""
        template = TestbenchSummaryTemplate(pdf_generator)
        elements = template.generate_page({})

        # Should still generate a valid table with headers
        assert len(elements) > 0
        assert any(isinstance(elem, Table) for elem in elements)

    def test_all_tests_passed(self, pdf_generator):
        """Test summary with all passing tests."""
        template = TestbenchSummaryTemplate(pdf_generator)
        data = {
            "test_component": [
                {"expected": {"out": i}, "actual": {"out": i}} for i in range(10)
            ]
        }

        elements = template.generate_page(data)
        table_data = [elem for elem in elements if isinstance(elem, Table)][
            0
        ]._cellvalues

        # Find row with test data
        test_row = None
        for row in table_data:
            if "test_component" in str(row[0]):
                test_row = row
                break

        assert test_row is not None
        assert test_row[1] == 10  # Total tests
        assert test_row[2] == 10  # Passed tests
        assert test_row[3] == 0  # Failed tests


class TestPDFReportGenerator:
    """Test suite for PDFReportGenerator class."""

    def test_report_generation(self, pdf_generator, sample_rule):
        """Test complete report generation process."""
        # Add title page
        pdf_generator.add_title_page("Test Report", "Test Author")

        # Add rule template
        rule_template = RuleTemplate(pdf_generator)
        rule_template.generate_page(sample_rule)
        pdf_generator.elements.extend(rule_template.elements)

        # Add logs template
        logs_template = LogsTemplate(pdf_generator)
        logs_template.generate_page(["Test log 1", "Test log 2"])
        pdf_generator.elements.extend(logs_template.elements)

        # Add summary template
        summary_template = TestbenchSummaryTemplate(pdf_generator)
        data = {
            "test_component": [
                {"expected": {"out": 1}, "actual": {"out": 1}},
                {"expected": {"out": 0}, "actual": {"out": 1}},
            ]
        }
        pdf_generator.set_summary_template(summary_template)
        pdf_generator.set_summary_data(data)

        # Save report
        pdf_generator.save()

        # Verify file was created
        assert os.path.exists(pdf_generator.filename)
        assert os.path.getsize(pdf_generator.filename) > 0

    def test_table_sizing(self, pdf_generator):
        """Test table size calculations and page sizing."""
        # Create large table data
        headers = ["Col" + str(i) for i in range(20)]
        data = [headers]
        for i in range(100):
            row = [str(i) + "x" + str(j) for j in range(20)]
            data.append(row)

        generator = PDFReportGenerator("test_table.pdf", table_data=data)
        # Width increased for large table
        assert generator.page_size[0] > letter[0]

        if os.path.exists("test_table.pdf"):
            os.remove("test_table.pdf")

    @patch("webbrowser.open")
    def test_preview_generation(self, mock_open, pdf_generator):
        """Test preview file generation."""
        pdf_generator.add_title_page("Test Preview")
        preview_file = pdf_generator.preview("test_step")

        assert os.path.exists(preview_file)
        assert "preview" in preview_file
        assert os.path.getsize(preview_file) > 0

        os.remove(preview_file)

    def test_toc_generation(self, pdf_generator):
        """Test table of contents generation."""
        pdf_generator.add_title_page("Test Report")
        pdf_generator.add_heading("Section 1", level=1)
        pdf_generator.add_heading("Subsection 1.1", level=2)
        pdf_generator.add_heading("Section 2", level=1)

        pdf_generator.build_toc()

        # Check TOC entries
        toc_texts = [str(elem) for elem in pdf_generator.elements]
        assert any("Table of Contents" in text for text in toc_texts)
        assert any("Section 1" in text for text in toc_texts)
        assert any("Subsection 1.1" in text for text in toc_texts)
        assert any("Section 2" in text for text in toc_texts)


if __name__ == "__main__":
    pytest.main([__file__])
