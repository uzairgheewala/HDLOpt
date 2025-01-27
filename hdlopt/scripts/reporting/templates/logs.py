from .base import PageTemplate
from reportlab.platypus import Paragraph


class LogsTemplate(PageTemplate):
    """Template for displaying log information."""

    def generate_page(self, logs):
        """Generate a page displaying log entries."""
        self.add_element(Paragraph("Logs", self.styles["Heading2"]))
        for log in logs:
            self.add_element(Paragraph(log, self.styles["BodyText"]))
