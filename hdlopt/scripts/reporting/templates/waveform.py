import io
import matplotlib.pyplot as plt
from reportlab.platypus import Table, TableStyle, Spacer, Image, Paragraph
from reportlab.lib import colors
from reportlab.lib.units import inch
from reportlab.lib.styles import ParagraphStyle

from ...reporting.templates.base import PageTemplate
from ...logger import logger


class WaveformTemplate(PageTemplate):
    """Template for displaying waveform analysis results."""

    def __init__(self, pdf_report):
        """Initialize template with custom styles.

        Args:
            pdf_report: PDFReportGenerator instance
        """
        super().__init__(pdf_report)

        # Update or add custom styles
        self._setup_styles()

    def _setup_styles(self):
        """Setup custom styles for waveform report."""
        # Update existing heading style
        if "Heading4" in self.styles:
            heading4 = self.styles["Heading4"]
            heading4.fontSize = 12
            heading4.spaceBefore = 7
            heading4.spaceAfter = 3
        else:
            # Add if doesn't exist
            self.styles.add(
                ParagraphStyle(
                    "Heading4",
                    parent=self.styles["Normal"],
                    fontSize=12,
                    spaceBefore=7,
                    spaceAfter=3,
                )
            )

        # Add or update caption style
        caption_style = ParagraphStyle(
            "WaveformCaption",  # Use unique name
            parent=self.styles["Normal"],
            fontSize=10,
            spaceBefore=3,
            spaceAfter=3,
            alignment=1,  # Center
        )
        if "WaveformCaption" in self.styles:
            # Update existing style
            old_style = self.styles["WaveformCaption"]
            for attr, value in caption_style.__dict__.items():
                if attr != "name":  # Don't change the name
                    setattr(old_style, attr, value)
        else:
            # Add new style
            self.styles.add(caption_style)

    def generate_page(
        self, component_name: str, analysis_results: dict, plots: dict
    ) -> None:
        """Generate waveform analysis report.

        Args:
            component_name: Name of analyzed component
            analysis_results: Dict with keys 'signals', 'metrics', 'time_range'
            plots: Dict mapping plot names to BytesIO image buffers
        """
        # Title
        self.add_heading("Waveform Analysis Results", level=1)
        self.add_element(Spacer(1, 0.2 * inch))

        # Add simulation overview
        self.add_heading("Simulation Overview", level=2)
        self._add_time_range(analysis_results.get("time_range", (0, 0)))

        # Add signal metrics
        self.add_heading("Signal Metrics", level=2)
        metrics = analysis_results.get("metrics", {})
        self._add_metrics_summary(metrics)

        # Add plots
        self.add_heading("Waveform Visualizations", level=2)
        self._add_waveform_plots(plots)

    def _add_time_range(self, time_range):
        """Add time range information."""
        data = [["Start Time", str(time_range[0])], ["End Time", str(time_range[1])]]
        table = Table(data)
        table.setStyle(
            TableStyle(
                [
                    ("ALIGN", (0, 0), (-1, -1), "CENTER"),
                    ("GRID", (0, 0), (-1, -1), 1, colors.black),
                    ("BACKGROUND", (0, 0), (0, -1), colors.lightgrey),
                    ("TEXTCOLOR", (0, 0), (-1, 0), colors.black),
                    ("FONTSIZE", (0, 0), (-1, -1), 10),
                    ("BOTTOMPADDING", (0, 0), (-1, -1), 12),
                    ("TOPPADDING", (0, 0), (-1, -1), 12),
                ]
            )
        )
        self.add_element(table)
        self.add_element(Spacer(1, 0.2 * inch))

    def _add_metrics_summary(self, metrics):
        """Add waveform metrics summary tables.

        Args:
            metrics: Dictionary containing:
                - transitions: Dict[str, int] - Signal transition counts
                - toggle_rates: Dict[str, float] - Signal toggle rates
                - min_pulse_widths: Dict[str, float] - Minimum pulse widths
                - glitches: List[dict] - Glitch events
                - violations: List[dict] - Timing violations
        """
        # Signal activity table
        transitions = metrics.get("transitions", {})
        toggle_rates = metrics.get("toggle_rates", {})
        min_pulse_widths = metrics.get("min_pulse_widths", {})

        data = [["Signal", "Transitions", "Toggle Rate", "Min Pulse Width"]]
        for sig in sorted(transitions.keys()):
            data.append(
                [
                    sig,
                    str(transitions.get(sig, 0)),
                    f"{toggle_rates.get(sig, 0):.3f}",
                    str(min_pulse_widths.get(sig, "N/A")),
                ]
            )

        table = Table(data)
        style = TableStyle(
            [
                ("BACKGROUND", (0, 0), (-1, 0), colors.grey),
                ("TEXTCOLOR", (0, 0), (-1, 0), colors.whitesmoke),
                ("ALIGN", (0, 0), (-1, -1), "CENTER"),
                ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
                ("FONTSIZE", (0, 0), (-1, 0), 12),
                ("BOTTOMPADDING", (0, 0), (-1, 0), 12),
                ("BACKGROUND", (0, 1), (-1, -1), colors.beige),
                ("GRID", (0, 0), (-1, -1), 1, colors.black),
                ("FONTSIZE", (0, 1), (-1, -1), 10),
                ("TOPPADDING", (0, 0), (-1, -1), 6),
                ("LEFTPADDING", (0, 0), (-1, -1), 6),
                ("RIGHTPADDING", (0, 0), (-1, -1), 6),
            ]
        )
        table.setStyle(style)
        self.add_element(table)
        self.add_element(
            Paragraph("Signal activity analysis", self.styles["WaveformCaption"])
        )
        self.add_element(Spacer(1, 0.3 * inch))

        # Event summary table
        glitches = metrics.get("glitches", [])
        violations = metrics.get("violations", [])

        data = [["Event Type", "Count", "Details"]]
        data.extend(
            [
                [
                    "Glitches",
                    len(glitches),
                    (
                        f"Min Width: {min([g['width'] for g in glitches] or [0]):.2f} ns"
                        if glitches
                        else "No glitches"
                    ),
                ],
                [
                    "Timing Violations",
                    len(violations),
                    self._format_violation_details(violations),
                ],
            ]
        )

        table = Table(data)
        style = TableStyle(
            [
                ("BACKGROUND", (0, 0), (-1, 0), colors.grey),
                ("TEXTCOLOR", (0, 0), (-1, 0), colors.whitesmoke),
                ("ALIGN", (0, 0), (-1, -1), "CENTER"),
                ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
                ("FONTSIZE", (0, 0), (-1, 0), 12),
                ("BOTTOMPADDING", (0, 0), (-1, 0), 12),
                ("BACKGROUND", (0, 1), (-1, -1), colors.beige),
                ("GRID", (0, 0), (-1, -1), 1, colors.black),
                ("FONTSIZE", (0, 1), (-1, -1), 10),
                ("TOPPADDING", (0, 0), (-1, -1), 6),
                ("LEFTPADDING", (0, 0), (-1, -1), 6),
                ("RIGHTPADDING", (0, 0), (-1, -1), 6),
            ]
        )
        table.setStyle(style)
        self.add_element(table)
        self.add_element(
            Paragraph("Timing event summary", self.styles["WaveformCaption"])
        )
        self.add_element(Spacer(1, 0.3 * inch))

    def _format_violation_details(self, violations):
        """Helper to format timing violation details."""
        if not violations:
            return "No violations"

        # Group violations by type
        by_type = {}
        for v in violations:
            v_type = v.get("type", "Unknown")
            by_type[v_type] = by_type.get(v_type, 0) + 1

        # Format as comma-separated list
        details = []
        for v_type, count in by_type.items():
            details.append(f"{count} {v_type}")
        return ", ".join(details)

    def _add_waveform_plots(self, plots):
        """Add waveform visualization plots."""
        if not plots:
            self.add_element(
                Paragraph("No waveform plots available.", self.styles["BodyText"])
            )
            return

        # Digital waveforms
        if "singles" in plots:
            self.add_heading("Digital Signals", level=3)
            img = Image(plots["singles"])
            img.drawHeight = 4 * inch
            img.drawWidth = 6 * inch
            self.add_element(img)
            self.add_element(Spacer(1, 0.2 * inch))
            self.add_element(
                Paragraph(
                    "Digital signal waveforms over time", self.styles["WaveformCaption"]
                )
            )
            self.add_element(Spacer(1, 0.3 * inch))

        # Bus signals
        bus_plots = {k: v for k, v in plots.items() if k not in ["singles", "events"]}
        if bus_plots:
            self.add_heading("Bus Signals", level=3)
            for bus_name, plot_data in bus_plots.items():
                img = Image(plot_data)
                img.drawHeight = 3 * inch
                img.drawWidth = 6 * inch
                self.add_element(img)
                self.add_element(Spacer(1, 0.2 * inch))
                self.add_element(
                    Paragraph(f"Bus: {bus_name}", self.styles["WaveformCaption"])
                )
                self.add_element(Spacer(1, 0.3 * inch))

        # Timing events (glitches, violations)
        if "events" in plots:
            self.add_heading("Timing Events", level=3)
            img = Image(plots["events"])
            img.drawHeight = 3 * inch
            img.drawWidth = 7 * inch
            self.add_element(img)
            self.add_element(Spacer(1, 0.2 * inch))
            self.add_element(
                Paragraph("Timeline of timing events", self.styles["WaveformCaption"])
            )
            self.add_element(Spacer(1, 0.3 * inch))

    def _add_styled_table(self, data, caption):
        """Add a consistently styled table with caption."""
        if not data:
            return

        table = Table(data)
        style_obj = TableStyle(
            [
                ("BACKGROUND", (0, 0), (-1, 0), colors.grey),
                ("TEXTCOLOR", (0, 0), (-1, 0), colors.whitesmoke),
                ("ALIGN", (0, 0), (-1, -1), "CENTER"),
                ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
                ("FONTSIZE", (0, 0), (-1, 0), 12),
                ("BOTTOMPADDING", (0, 0), (-1, 0), 12),
                ("BACKGROUND", (0, 1), (-1, -1), colors.beige),
                ("GRID", (0, 0), (-1, -1), 1, colors.black),
                ("FONTSIZE", (0, 1), (-1, -1), 10),
                ("TOPPADDING", (0, 0), (-1, -1), 6),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
                ("LEFTPADDING", (0, 0), (-1, -1), 6),
                ("RIGHTPADDING", (0, 0), (-1, -1), 6),
            ]
        )
        table.setStyle(style_obj)

        self.add_element(table)
        if caption:
            self.add_element(Spacer(1, 0.1 * inch))
            self.add_element(Paragraph(caption, self.styles["WaveformCaption"]))
        self.add_element(Spacer(1, 0.2 * inch))

        # Optionally store it in an attribute for your test
        # so your test can verify the style outside the table object:
        self._last_table_style = style_obj
