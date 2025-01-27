from typing import Dict, List

from reportlab.lib import colors
from reportlab.lib.units import inch
from reportlab.platypus import Spacer, Table, TableStyle

from ...reporting.templates.base import PageTemplate


class YosysResourceTemplate(PageTemplate):
    """Template for displaying Yosys resource analysis results"""

    def generate_page(self, component_name: str, analyses: Dict) -> None:
        """Generate resource analysis report pages

        Args:
            component_name: Name of analyzed component
            analyses: Dict mapping parameter values to analysis results
        """
        # Add overview section
        self.add_heading("Resource Usage Analysis", level=1)

        for param_value, analysis in analyses.items():
            # Add parameter section
            self.add_heading(f"Parameter Configuration: {param_value}", level=2)

            # Create analysis tables
            self._add_general_metrics_table(analysis)
            self._add_cell_usage_table(analysis)
            self._add_raw_gates_table(analysis)
            self._add_hierarchy_table(analysis)

    def _add_general_metrics_table(self, analysis: Dict) -> None:
        """Add table showing general metrics for each module"""
        headers = [
            "Module",
            "Wire Count",
            "Wire Bits",
            "Port Count",
            "Port Bits",
            "Cell Count",
            "Hierarchy Depth",
        ]

        data = [headers]
        for module_name, metrics in analysis.items():
            data.append(
                [
                    module_name,
                    metrics.wire_count,
                    metrics.wire_bits,
                    metrics.port_count,
                    metrics.port_bits,
                    metrics.cell_count,
                    metrics.hierarchy_depth,
                ]
            )

        self._add_styled_table(data, "General Module Metrics")

    def _add_cell_usage_table(self, analysis: Dict) -> None:
        """Add table showing cell usage"""
        # Collect all cell types
        cell_types = set()
        for metrics in analysis.values():
            cell_types.update(metrics.cells.keys())

        headers = ["Module"] + sorted(cell_types)
        data = [headers]

        for module_name, metrics in analysis.items():
            row = [module_name]
            for cell_type in headers[1:]:
                row.append(metrics.cells.get(cell_type, 0))
            data.append(row)

        self._add_styled_table(data, "Cell Usage")

    def _add_raw_gates_table(self, analysis: Dict) -> None:
        """Add table showing raw gate usage"""
        # Collect all gate types
        gate_types = set()
        for metrics in analysis.values():
            gate_types.update(metrics.raw_gates.keys())

        headers = ["Module"] + sorted(gate_types)
        data = [headers]

        for module_name, metrics in analysis.items():
            row = [module_name]
            for gate_type in headers[1:]:
                row.append(metrics.raw_gates.get(gate_type, 0))
            data.append(row)

        self._add_styled_table(data, "Raw Gate Usage")

    def _add_hierarchy_table(self, analysis: Dict) -> None:
        """Add table showing module hierarchy"""
        headers = ["Module", "Submodule", "Instance Count"]
        data = [headers]

        for module_name, metrics in analysis.items():
            for submodule, count in metrics.sub_modules.items():
                data.append([module_name, submodule, count])

        self._add_styled_table(data, "Module Hierarchy")

    def _add_styled_table(self, data: List[List], title: str) -> None:
        self.add_heading(title, level=3)

        table = Table(data)
        # Make a named style object
        styled_cmds = [
            ("BACKGROUND", (0, 0), (-1, 0), colors.grey),
            ("TEXTCOLOR", (0, 0), (-1, 0), colors.whitesmoke),
            ("ALIGN", (0, 0), (-1, -1), "CENTER"),
            ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
            ("BOTTOMPADDING", (0, 0), (-1, 0), 12),
            ("BACKGROUND", (0, 1), (-1, -1), colors.beige),
            ("GRID", (0, 0), (-1, -1), 1, colors.black),
        ]
        style_obj = TableStyle(styled_cmds)
        table.setStyle(style_obj)

        self.add_element(table)
        self.add_element(Spacer(1, 0.2 * inch))

        # Optionally store it in an attribute for your test
        # so your test can verify the style outside the table object:
        self._last_table_style = style_obj
