from reportlab.lib.units import inch
from reportlab.platypus import Spacer, Table, PageBreak
from reportlab.lib import colors

from .base import PageTemplate


class TestbenchSummaryTemplate(PageTemplate):
    """Template for displaying testbench summary information."""

    def generate_page(self, data):
        """Generate testbench summary page with results table."""
        self.add_heading("Testbench Summary", level=2)
        self.add_element(Spacer(1, 0.5 * inch))

        table_data = [["Component", "Total Tests", "Passed", "Failed"]]

        for component, results in data.items():
            total_tests = len(results)
            passed = sum(
                1 for result in results if result["expected"] == result["actual"]
            )
            failed = total_tests - passed
            table_data.append([component, total_tests, passed, failed])

        table = Table(table_data)
        table.setStyle(
            [
                ("BACKGROUND", (0, 0), (-1, 0), colors.grey),
                ("TEXTCOLOR", (0, 0), (-1, 0), colors.whitesmoke),
                ("ALIGN", (0, 0), (-1, -1), "CENTER"),
                ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
                ("BOTTOMPADDING", (0, 0), (-1, 0), 12),
                ("BACKGROUND", (0, 1), (-1, -1), colors.beige),
                ("GRID", (0, 0), (-1, -1), 1, colors.black),
            ]
        )

        self.add_element(table)
        self.add_element(Spacer(1, 0.5 * inch))
        self.add_element(PageBreak())
        self.pdf_report.toc += self.toc
        return self.elements
