from reportlab.lib.units import inch
from reportlab.platypus import Frame, PageBreak, Paragraph, Spacer
from dataclasses import dataclass
from typing import Dict

@dataclass
class TimingSummary:
    """Container for timing analysis summary data"""

    wns: float  # Worst Negative Slack
    tns: float  # Total Negative Slack
    whs: float  # Worst Hold Slack
    ths: float  # Total Hold Slack
    wpws: float  # Worst Pulse Width Slack
    tpws: float  # Total Pulse Width Slack
    failing_endpoints: int
    total_endpoints: int

    def to_dict(self) -> dict:
        """Convert to JSON-serializable dictionary."""
        return {
            'wns': self.wns,
            'tns': self.tns,
            'whs': self.whs,
            'ths': self.ths,
            'wpws': self.wpws,
            'tpws': self.tpws,
            'failing_endpoints': self.failing_endpoints,
            'total_endpoints': self.total_endpoints
        }


@dataclass
class ClockSummary:
    """Summary of clock domain timing"""

    name: str
    period: float
    wns: float
    tns: float
    failing_endpoints: int
    total_endpoints: int

    def to_dict(self) -> dict:
        """Convert to JSON-serializable dictionary."""
        return {
            'name': self.name,
            'period': self.period,
            'wns': self.wns,
            'tns': self.tns,
            'failing_endpoints': self.failing_endpoints,
            'total_endpoints': self.total_endpoints
        }
    
@dataclass
class PowerSummary:
    """Summary of power consumption"""

    total_on_chip: float
    dynamic: float
    static: float
    device_static: float
    effective_thetaja: float
    max_ambient: float
    junction_temp: float

    def to_dict(self) -> Dict:
        return {
            "total_on_chip": self.total_on_chip,
            "dynamic": self.dynamic,
            "static": self.static,
            "device_static": self.device_static,
            "effective_thetaja": self.effective_thetaja,
            "max_ambient": self.max_ambient,
            "junction_temp": self.junction_temp,
        }


@dataclass
class ComponentPower:
    """Power consumption for a component"""

    name: str
    power: float
    used: int
    available: int
    utilization: float

    def to_dict(self) -> Dict:
        return {
            "name": self.name,
            "power": self.power,
            "used": self.used,
            "available": self.available,
            "utilization": self.utilization,
        }


@dataclass
class PowerSupply:
    """Power supply characteristics"""

    source: str
    voltage: float
    total_current: float
    dynamic_current: float
    static_current: float
    powerup_current: float
    budget: float
    margin: float

    def to_dict(self) -> Dict:
        return {
            "source": self.source,
            "voltage": self.voltage,
            "total_current": self.total_current,
            "dynamic_current": self.dynamic_current,
            "static_current": self.static_current,
            "powerup_current": self.powerup_current,
            "budget": self.budget,
            "margin": self.margin,
        }

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

        if self.current_page_height - element_height < 0 and "PageBreak" not in str(
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
