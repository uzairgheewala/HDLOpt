from reportlab.platypus import Paragraph, Preformatted

from .base import PageTemplate


class RuleTemplate(PageTemplate):
    """Template for displaying HDL rule information."""

    def generate_page(self, rule):
        """Generate a page displaying rule details."""
        self.add_element(
            Paragraph(
                f"Rule: {
                    rule.name}",
                self.styles["Heading2"],
            )
        )
        self.add_element(
            Paragraph(
                "Input Variables: " + ", ".join(rule.input_vars),
                self.styles["BodyText"],
            )
        )
        self.add_element(
            Paragraph(
                "Output Variables: " + ", ".join(rule.output_vars),
                self.styles["BodyText"],
            )
        )
        self.add_element(
            Paragraph("Bit Width: " + str(rule.bit_width), self.styles["BodyText"])
        )
        self.add_element(
            Paragraph(
                "Pattern: " + rule.pattern.__class__.__name__, self.styles["BodyText"]
            )
        )
        self.add_element(Preformatted(str(rule.pattern), self.styles["Code"]))
        self.add_element(
            Paragraph("Generate expected values function:", self.styles["BodyText"])
        )
        self.add_element(Preformatted(str(rule), self.styles["Code"]))
