import io

import matplotlib.pyplot as plt
import numpy as np
from reportlab.lib import colors
from reportlab.lib.units import inch
from reportlab.platypus import Image, Paragraph, Spacer, Table, TableStyle

from ...logger import logger
from ...reporting.templates.base import PageTemplate, ClockSummary, TimingSummary

class TimingTemplate(PageTemplate):
    """Template for displaying timing analysis results."""

    def generate_page(self, component_name: str, timing_data: dict) -> None:
        """Generate timing analysis report pages.

        Args:
            component_name: Name of analyzed component
            timing_data: Dict containing timing analysis results
        """
        # Add overview section
        self.add_heading("Timing Analysis Results", level=1)

        # Add timing summary
        self._add_timing_summary(timing_data["timing_summary"])

        # Add clock summary
        if timing_data["clock_summary"]:
            self._add_clock_summary(timing_data["clock_summary"])

        # Add inter-clock analysis
        if timing_data["inter_clock"]:
            self._add_inter_clock_analysis(timing_data["inter_clock"])

        # Add path groups analysis
        if timing_data["path_groups"]:
            self._add_path_groups_analysis(timing_data["path_groups"])

        # Add timing visualizations
        self._add_timing_visualizations(timing_data)

    def _add_timing_summary(self, summary):
        """Add timing summary section."""
        self.add_heading("Timing Summary", level=2)

        if type(summary) is TimingSummary:
            data = [
                ["Metric", "Value"],
                ["Worst Negative Slack (WNS)", f"{summary.wns:.3f} ns"],
                ["Total Negative Slack (TNS)", f"{summary.tns:.3f} ns"],
                ["Worst Hold Slack (WHS)", f"{summary.whs:.3f} ns"],
                ["Total Hold Slack (THS)", f"{summary.ths:.3f} ns"],
                ["Worst Pulse Width Slack (WPWS)", f"{summary.wpws:.3f} ns"],
                ["Total Pulse Width Slack (TPWS)", f"{summary.tpws:.3f} ns"],
                ["Failing Endpoints", str(summary.failing_endpoints)],
                ["Total Endpoints", str(summary.total_endpoints)]
            ]
        else:
            data = [
                ["Metric", "Value"],
                ["Worst Negative Slack (WNS)", f"{summary['wns']:.3f} ns"],
                ["Total Negative Slack (TNS)", f"{summary['tns']:.3f} ns"],
                ["Worst Hold Slack (WHS)", f"{summary['whs']:.3f} ns"],
                ["Total Hold Slack (THS)", f"{summary['ths']:.3f} ns"],
                ["Worst Pulse Width Slack (WPWS)", f"{summary['wpws']:.3f} ns"],
                ["Total Pulse Width Slack (TPWS)", f"{summary['tpws']:.3f} ns"],
                ["Failing Endpoints", str(summary['failing_endpoints'])],
                ["Total Endpoints", str(summary['total_endpoints'])]
            ]

        self._add_styled_table(data, "Timing Summary Metrics")

    def _add_clock_summary(self, clock_summary):
        """Add clock domains summary section."""
        self.add_heading("Clock Domains", level=2)

        data = [["Clock", "Period", "WNS", "TNS", "Failing", "Total"]]
        if type(clock_summary[0]) is ClockSummary:
            for clock in clock_summary:
                data.append(
                    [
                        clock.name,
                        f"{clock.period:.3f}",
                        f"{clock.wns:.3f}",
                        f"{clock.tns:.3f}",
                        str(clock.failing_endpoints),
                        str(clock.total_endpoints),
                    ]
                )
        else:
            for clock in clock_summary:
                data.append(
                    [
                        clock['name'],
                        f"{clock['period']:.3f}",
                        f"{clock['wns']:.3f}",
                        f"{clock['tns']:.3f}",
                        str(clock['failing_endpoints']),
                        str(clock['total_endpoints']),
                    ]
                )

        self._add_styled_table(data, "Clock Domain Timing")

    def _add_inter_clock_analysis(self, inter_clock_data):
        """Add inter-clock timing analysis section."""
        self.add_heading("Inter-Clock Timing", level=2)

        data = [["From Clock", "To Clock", "WNS", "TNS", "Failing", "Total"]]
        for path in inter_clock_data:
            data.append(
                [
                    path["from_clock"],
                    path["to_clock"],
                    f"{path['wns']:.3f}",
                    f"{path['tns']:.3f}",
                    str(path["failing_endpoints"]),
                    str(path["total_endpoints"]),
                ]
            )

        self._add_styled_table(data, "Inter-Clock Path Timing")

    def _add_path_groups_analysis(self, path_groups):
        """Add path groups timing analysis section."""
        self.add_heading("Path Groups", level=2)

        data = [["Group", "From Clock", "To Clock", "WNS", "TNS", "Failing", "Total"]]
        for group in path_groups:
            data.append(
                [
                    group["group"],
                    group["from_clock"],
                    group["to_clock"],
                    f"{group['wns']:.3f}",
                    f"{group['tns']:.3f}",
                    str(group["failing_endpoints"]),
                    str(group["total_endpoints"]),
                ]
            )

        self._add_styled_table(data, "Path Group Timing")

    def _add_timing_visualizations(self, timing_data):
        """Add visualizations of timing data."""
        self.add_heading("Timing Analysis Visualizations", level=2)

        # Slack distribution visualization
        if timing_data["timing_summary"]:
            try:
                plt.figure(figsize=(10, 6))

                # Plot different slack metrics
                if type(timing_data["timing_summary"]) is TimingSummary:
                    slacks = [
                        ("WNS", timing_data["timing_summary"].wns),
                        ("TNS", timing_data["timing_summary"].tns),
                        ("WHS", timing_data["timing_summary"].whs),
                        ("THS", timing_data["timing_summary"].ths),
                        ("WPWS", timing_data["timing_summary"].wpws),
                        ("TPWS", timing_data["timing_summary"].tpws),
                    ]
                else:
                    slacks = [
                        ("WNS", timing_data["timing_summary"]["wns"]),
                        ("TNS", timing_data["timing_summary"]["tns"]),
                        ("WHS", timing_data["timing_summary"]["whs"]),
                        ("THS", timing_data["timing_summary"]["ths"]),
                        ("WPWS", timing_data["timing_summary"]["wpws"]),
                        ("TPWS", timing_data["timing_summary"]["tpws"]),
                    ]
                

                x = np.arange(len(slacks))
                values = [slack[1] for slack in slacks]
                labels = [slack[0] for slack in slacks]

                plt.bar(x, values)
                plt.xticks(x, labels, rotation=45)
                plt.ylabel("Slack (ns)")
                plt.title("Timing Slack Distribution")
                plt.tight_layout()

                # Convert plot to PNG bytes
                img_data = io.BytesIO()
                plt.savefig(img_data, format="png", dpi=300, bbox_inches="tight")
                img_data.seek(0)
                plt.close()

                # Create reportlab Image
                img = Image(img_data)
                img.drawHeight = 4 * inch
                img.drawWidth = 6 * inch
                self.add_element(img)
                self.add_element(Spacer(1, 0.2 * inch))

            except Exception as e:
                logger.error(
                    f"Failed to generate slack distribution plot: {str(e)}"
                )
                self.add_element(
                    Paragraph(
                        f"Error generating visualization: {str(e)}", self.styles["BodyText"]
                    )
                )

        # Clock domain comparison
        if timing_data["clock_summary"]:
            try:
                plt.figure(figsize=(10, 6))

                if type(timing_data["clock_summary"][0]) is ClockSummary:
                    clocks = [c.name for c in timing_data["clock_summary"]]
                    wns_values = [c.wns for c in timing_data["clock_summary"]]
                    tns_values = [c.tns for c in timing_data["clock_summary"]]
                else:
                    clocks = [c['name'] for c in timing_data["clock_summary"]]
                    wns_values = [c['wns'] for c in timing_data["clock_summary"]]
                    tns_values = [c['tns'] for c in timing_data["clock_summary"]]

                x = np.arange(len(clocks))
                width = 0.35

                plt.bar(x - width / 2, wns_values, width, label="WNS")
                plt.bar(x + width / 2, tns_values, width, label="TNS")

                plt.xlabel("Clock Domain")
                plt.ylabel("Slack (ns)")
                plt.title("Clock Domain Timing Comparison")
                plt.xticks(x, clocks, rotation=45)
                plt.legend()
                plt.tight_layout()

                # Convert plot to PNG bytes
                img_data = io.BytesIO()
                plt.savefig(img_data, format="png", dpi=300, bbox_inches="tight")
                img_data.seek(0)
                plt.close()

                # Create reportlab Image
                img = Image(img_data)
                img.drawHeight = 4 * inch
                img.drawWidth = 6 * inch
                self.add_element(img)
                self.add_element(Spacer(1, 0.2 * inch))

            except Exception as e:
                logger.error(
                    f"Failed to generate clock comparison plot: {str(e)}"
                )
                self.add_element(
                    Paragraph(
                        f"Error generating visualization: {str(e)}",
                        self.styles["BodyText"],
                    )
                )

    def _add_styled_table(self, data, title):
        """Add a styled table to the report."""
        self.add_heading(title, level=3)

        table = Table(data)
        style = TableStyle(
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
        table.setStyle(style)

        self.add_element(table)
        self.add_element(Spacer(1, 0.2 * inch))

    def _add_clock_comparison_plot(self, clock_summary):
        """Create and add clock domain comparison plot."""
        try:
            plt.figure(figsize=(10, 6))

            # Extract data
            if type(clock_summary[0]) is ClockSummary:
                clocks = [c.name for c in clock_summary]
                wns_values = [c.wns for c in clock_summary]
                tns_values = [c.tns for c in clock_summary]
            else:
                clocks = [c['name'] for c in clock_summary]
                wns_values = [c['wns'] for c in clock_summary]
                tns_values = [c['tns'] for c in clock_summary]

            x = np.arange(len(clocks))
            width = 0.35

            # Plot grouped bars
            plt.bar(x - width / 2, wns_values, width, label="WNS")
            plt.bar(x + width / 2, tns_values, width, label="TNS")

            plt.xlabel("Clock Domain")
            plt.ylabel("Slack (ns)")
            plt.title("Clock Domain Timing Comparison")
            plt.xticks(x, clocks, rotation=45)
            plt.legend()

            # Save plot to bytes buffer
            buf = io.BytesIO()
            plt.savefig(buf, format="png", bbox_inches="tight")
            plt.close()

            # Add image to report
            img = Image(buf)
            img.drawHeight = 4 * inch
            img.drawWidth = 6 * inch
            self.add_element(img)
            self.add_element(Spacer(1, 0.2 * inch))

            buf.close()

        except Exception as e:
            logger.error(f"Failed to generate clock comparison plot: {str(e)}")
            # Add error message to report instead of plot
            self.add_element(
                Paragraph(
                    f"Error generating clock comparison visualization: {str(e)}",
                    self.styles["BodyText"],
                )
            )

    def _add_slack_distribution_plot(self, summary):
        """Create and add slack distribution plot."""
        try:
            plt.figure(figsize=(10, 6))

            # Plot different slack metrics
            if type(summary) is TimingSummary:
                slacks = [
                    ("WNS", summary.wns),
                    ("TNS", summary.tns),
                    ("WHS", summary.whs),
                    ("THS", summary.ths),
                    ("WPWS", summary.wpws),
                    ("TPWS", summary.tpws),
                ]
            else:
                slacks = [
                    ("WNS", summary["wns"]),
                    ("TNS", summary["tns"]),
                    ("WHS", summary["whs"]),
                    ("THS", summary["ths"]),
                    ("WPWS", summary["wpws"]),
                    ("TPWS", summary["tpws"]),
                ]

            x = np.arange(len(slacks))
            values = [slack[1] for slack in slacks]
            labels = [slack[0] for slack in slacks]

            plt.bar(x, values)
            plt.xticks(x, labels, rotation=45)
            plt.ylabel("Slack (ns)")
            plt.title("Timing Slack Distribution")

            # Add value labels on top of bars
            for i, v in enumerate(values):
                plt.text(i, v, f"{v:.2f}", ha="center", va="bottom")

            # Save plot to bytes buffer
            buf = io.BytesIO()
            plt.savefig(buf, format="png", bbox_inches="tight")
            plt.close()

            # Add image to report
            img = Image(buf)
            img.drawHeight = 4 * inch
            img.drawWidth = 6 * inch
            self.add_element(img)
            self.add_element(Spacer(1, 0.2 * inch))

            buf.close()

        except Exception as e:
            logger.error(
                f"Failed to generate slack distribution plot: {str(e)}"
            )
            # Add error message to report instead of plot
            self.add_element(
                Paragraph(
                    f"Error generating slack distribution visualization: {str(e)}",
                    self.styles["BodyText"],
                )
            )
