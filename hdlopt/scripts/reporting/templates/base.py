from reportlab.lib.units import inch
from reportlab.platypus import Frame, Paragraph, Spacer, PageBreak


class PageTemplate:
    """Base class for PDF report page templates."""

    def __init__(self, pdf_report):
        self.pdf_report = pdf_report
        self.doc = pdf_report.doc
        self.styles = pdf_report.styles
        self.page_size = self.doc.pagesize
        self.current_page_height = pdf_report.current_page_height
        self.elements = []
        self.entry_counter = {}
        self.toc = []

    def add_heading(self, text, level=1):
        """Add a heading with specified level to the template."""
        style = self.styles[f"Heading{level}"]
        self.add_element(Paragraph(text, style))
        self.add_element(Spacer(1, 0.2 * inch))

        entry_id = f"{text}_{self.entry_counter.get(text, 0)}"
        self.toc.append((text, level, None, entry_id, len(self.elements)))
        self.entry_counter[text] = self.entry_counter.get(text, 0) + 1

    def add_element(self, element):
        """Add an element to the template with page break handling."""
        frame = Frame(
            self.doc.leftMargin,
            self.doc.bottomMargin,
            self.page_size[0] - 2 * self.doc.leftMargin,
            self.current_page_height,
        )
        element_height = element.wrap(frame._width, frame._height)[1]

        if self.current_page_height - element_height < 0 and not "PageBreak" in str(
            element
        ):
            self.elements.append(PageBreak())
            self.current_page_height = (
                self.doc.height - self.doc.topMargin - self.doc.bottomMargin
            )
            element_height = element.wrap(frame._width, self.current_page_height)[1]
        elif "PageBreak" in str(element):
            self.current_page_height = (
                self.doc.height - self.doc.topMargin - self.doc.bottomMargin
            )
            self.current_page_height += element_height

        self.elements.append(element)
        self.current_page_height -= element_height

    def generate_page(self, data):
        """Generate page content from provided data."""
        raise NotImplementedError("Subclasses must implement generate_page")
