import io
import re
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import List, Optional

import graphviz
from PIL import Image as PILImage
from PIL import ImageDraw, ImageFont
from reportlab.lib import colors
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.units import inch
from reportlab.platypus import Image, PageBreak, Paragraph, Spacer, Table, TableStyle

from ...logger import logger
from ...reporting.templates.base import PageTemplate


@dataclass
class SchematicMetrics:
    """Metrics about schematic complexity."""

    total_cells: int = 0
    total_signals: int = 0
    total_ports: int = 0
    max_fanout: int = 0
    max_depth: int = 0
    bus_signals: int = 0
    clock_signals: int = 0
    reset_signals: int = 0


@dataclass
class SchematicAnnotation:
    """Annotation for a schematic region."""

    x: float  # Normalized coordinates (0-1)
    y: float
    text: str
    type: str = "info"  # info, warning, error


def to_rgb_tuple(reportlab_color):
    """Convert a reportlab.lib.colors color to (R, G, B) int tuple."""
    return (
        int(reportlab_color.red * 255),
        int(reportlab_color.green * 255),
        int(reportlab_color.blue * 255),
    )


class SchematicTemplate(PageTemplate):
    """Template for displaying schematic analysis results."""

    def __init__(self, pdf_report):
        """Initialize template with custom styles."""
        super().__init__(pdf_report)
        self._setup_styles()
        self.max_image_width = 6.5 * inch  # Leave margins
        self.max_image_height = 9 * inch

    def _setup_styles(self):
        """Setup custom paragraph styles."""
        self.styles.add(
            ParagraphStyle(
                "SchematicCaption",
                parent=self.styles["Normal"],
                fontSize=10,
                leading=12,
                spaceBefore=6,
                spaceAfter=12,
                alignment=1,  # Center
            )
        )

        self.styles.add(
            ParagraphStyle(
                "SchematicNote",
                parent=self.styles["Normal"],
                fontSize=9,
                leading=11,
                leftIndent=20,
                textColor=colors.darkblue,
            )
        )

    def generate_page(
        self,
        component_name: str,
        schematic_path: Path,
        tool_name: str,
        metrics: Optional[SchematicMetrics] = None,
        annotations: Optional[List[SchematicAnnotation]] = None,
    ) -> None:
        """Generate schematic report page.

        Args:
            component_name: Name of analyzed component
            schematic_path: Path to schematic image file
            tool_name: Name of tool that generated schematic
            metrics: Optional schematic complexity metrics
            annotations: Optional list of annotations
        """
        # Add title
        self.add_heading("Circuit Schematic", level=1)
        self.add_element(Spacer(1, 0.2 * inch))

        # Add tool info and metrics
        self._add_info_section(tool_name, metrics)
        self.add_element(Spacer(1, 0.3 * inch))

        # Add main schematic
        self._add_schematic_image(
            schematic_path,
            annotations=annotations,
            caption=f"{component_name} Circuit Schematic (Generated by {tool_name})",
        )

        # Add any available sub-diagrams (hierarchy, etc)
        if metrics and metrics.max_depth > 1:
            self.add_element(PageBreak())
            self._add_hierarchy_view(schematic_path, component_name)

    def _add_info_section(
        self, tool_name: str, metrics: Optional[SchematicMetrics]
    ) -> None:
        """Add schematic info and metrics section."""
        # Tool info
        self.add_heading("Schematic Information", level=2)

        tool_info = [["Generation Tool", tool_name]]

        table = Table(tool_info)
        table.setStyle(
            TableStyle(
                [
                    ("ALIGN", (0, 0), (-1, -1), "LEFT"),
                    ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
                    ("FONTSIZE", (0, 0), (-1, -1), 10),
                    ("BOTTOMPADDING", (0, 0), (-1, -1), 12),
                    ("TOPPADDING", (0, 0), (-1, -1), 12),
                    ("GRID", (0, 0), (-1, -1), 1, colors.black),
                ]
            )
        )
        self.add_element(table)
        self.add_element(Spacer(1, 0.2 * inch))

        # Metrics if available
        if metrics:
            self.add_heading("Complexity Metrics", level=2)

            data = [
                ["Metric", "Value"],
                ["Total Cells", str(metrics.total_cells)],
                ["Total Signals", str(metrics.total_signals)],
                ["Total Ports", str(metrics.total_ports)],
                ["Maximum Fanout", str(metrics.max_fanout)],
                ["Hierarchy Depth", str(metrics.max_depth)],
                ["Bus Signals", str(metrics.bus_signals)],
                ["Clock Signals", str(metrics.clock_signals)],
                ["Reset Signals", str(metrics.reset_signals)],
            ]

            table = Table(data)
            table.setStyle(
                TableStyle(
                    [
                        ("BACKGROUND", (0, 0), (-1, 0), colors.grey),
                        ("TEXTCOLOR", (0, 0), (-1, 0), colors.whitesmoke),
                        ("ALIGN", (0, 0), (-1, -1), "LEFT"),
                        ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
                        ("FONTSIZE", (0, 0), (-1, -1), 10),
                        ("BOTTOMPADDING", (0, 0), (-1, -1), 12),
                        ("BACKGROUND", (0, 1), (-1, -1), colors.beige),
                        ("GRID", (0, 0), (-1, -1), 1, colors.black),
                    ]
                )
            )
            self.add_element(table)
            self.add_element(Spacer(1, 0.2 * inch))

    def _add_schematic_image(
        self,
        schematic_path: Path,
        annotations: Optional[List[SchematicAnnotation]] = None,
        caption: Optional[str] = None,
    ) -> None:
        """Add schematic image with optional annotations."""
        try:
            # Open and resize image if needed
            img = PILImage.open(schematic_path)
            width, height = img.size

            """
            # Calculate scaling to fit page while maintaining aspect ratio
            scale = min(
                self.max_image_width / width,
                self.max_image_height / height
            )

            new_width = width * scale
            new_height = height * scale

            img = img.resize(
                (int(new_width), int(new_height)),
                PILImage.LANCZOS
            )
            """

            # Add annotations if provided
            if annotations:
                draw = ImageDraw.Draw(img)
                for ann in annotations:
                    # Convert normalized coordinates to pixels
                    x = int(ann.x * width)
                    y = int(ann.y * height)

                    # Draw colored circle based on type
                    rl_color = {
                        "info": colors.HexColor("#007bff"),
                        "warning": colors.orange,
                        "error": colors.red,
                    }.get(ann.type, colors.blue)

                    pil_outline = to_rgb_tuple(rl_color)

                    radius = 10
                    draw.ellipse(
                        [(x - radius, y - radius), (x + radius, y + radius)],
                        outline=pil_outline,
                        fill=None,
                        width=2,
                    )

                    # Add text slightly offset
                    draw.text(
                        (x + 15, y - 5),
                        ann.text,
                        fill=pil_outline,
                        font=ImageFont.load_default(),
                    )

            # Convert to reportlab Image
            img_data = io.BytesIO()
            img.save(img_data, format="PNG")
            img_data.seek(0)

            img = Image(
                img_data,
                width=self.max_image_width,
                height=self.max_image_height,
                kind="proportional",  # Maintain aspect ratio
                maxWidth=self.max_image_width,
                maxHeight=self.max_image_height,
            )

            self.add_element(img)

            if caption:
                self.add_element(Paragraph(caption, self.styles["SchematicCaption"]))

            if annotations:
                self.add_element(
                    Paragraph("Annotation Details:", self.styles["BodyText"])
                )
                for ann in annotations:
                    msg = f"{ann.type.title()} annotation: {ann.text}"
                    self.add_element(Paragraph(msg, self.styles["SchematicNote"]))

                # Add annotation legend
                self.add_element(Spacer(1, 0.2 * inch))
                legend = []
                for ann_type in ["info", "warning", "error"]:
                    if any(a.type == ann_type for a in annotations):
                        color = {
                            "info": colors.HexColor("#007bff"),
                            "warning": colors.orange,
                            "error": colors.red,
                        }[ann_type]
                        legend.append(
                            Paragraph(
                                f"<font color='{color.hexval()}'>\u2022</font> {ann_type.title()} Annotations",
                                self.styles["SchematicNote"],
                            )
                        )
                for note in legend:
                    self.add_element(note)

        except Exception as e:
            logger.error(f"Failed to add schematic image: {str(e)}")
            self.add_element(
                Paragraph(
                    f"Error displaying schematic: {str(e)}",
                    self.styles["BodyText"],
                )
            )

    def _add_hierarchy_view(self, schematic_path: Path, component_name: str) -> None:
        """Add hierarchical view for multi-level designs."""
        self.add_heading("Module Hierarchy", level=2)
        self.add_element(Spacer(1, 0.2 * inch))

        # Create simplified hierarchy graph
        dot = graphviz.Digraph(comment="Module Hierarchy")
        dot.attr(rankdir="TB")

        try:
            # Add nodes and edges based on hierarchy
            dot.node(component_name, component_name)

            source_v = schematic_path.parent / f"{component_name}.v"
            if not source_v.exists():
                raise FileNotFoundError(
                    f"{source_v} not found, cannot generate hierarchy."
                )

            # Read source file to extract submodules
            with open(source_v) as f:
                content = f.read()

            # Very basic module instance detection
            instances = re.finditer(r"(\w+)\s+(\w+)\s*\(", content)
            seen = set()

            for match in instances:
                module_type = match.group(1)
                # instance_name = match.group(2)

                if module_type != component_name and module_type not in seen:
                    seen.add(module_type)
                    dot.node(module_type, module_type)
                    dot.edge(component_name, module_type)

            # Save to temporary file then convert to PNG
            temp_dot = tempfile.NamedTemporaryFile(delete=False, suffix=".dot")
            temp_png = tempfile.NamedTemporaryFile(delete=False, suffix=".png")
            self.temp_files.update([Path(temp_dot.name), Path(temp_png.name)])

            dot.save(temp_dot.name)
            dot.render(temp_dot.name, format="png", cleanup=True)

            # Create reportlab Image
            img = Image(temp_png.name)
            img.drawWidth = 6 * inch
            img.drawHeight = 4 * inch

            self.add_element(img)
            self.add_element(
                Paragraph("Module Hierarchy Overview", self.styles["SchematicCaption"])
            )

        except Exception as e:
            logger.error(f"Failed to generate hierarchy view: {str(e)}")
            self.add_element(
                Paragraph(
                    f"Error generating hierarchy view: {str(e)}", self.styles["BodyText"],
                )
            )
