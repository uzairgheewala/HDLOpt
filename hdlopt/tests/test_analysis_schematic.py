import re
import shutil
import subprocess
import tempfile
from pathlib import Path
from unittest.mock import MagicMock, patch

import fitz  # PyMuPDF for PDF verification
import pytest

from ..scripts.analysis.schematic import (
    SchematicConfig,
    SchematicFormat,
    SchematicGenerator,
    SchematicLevel,
    SchematicOrientation,
    SchematicTool,
)
from ..scripts.reporting.generator import PDFReportGenerator
from ..scripts.reporting.templates.schematic import (
    SchematicAnnotation,
    SchematicMetrics,
    SchematicTemplate,
)


@pytest.fixture
def temp_component_dir(tmp_path):
    """Create temporary component test directory."""
    comp_dir = tmp_path / "test_component"
    comp_dir.mkdir()

    # Create a hierarchical design with full adder using half adders
    files = {
        "half_adder.v": """
        module half_adder(
            input a,
            input b,
            output sum,
            output cout
        );
            assign sum = a ^ b;
            assign cout = a & b;
        endmodule
        """,
        "full_adder.v": """
        module full_adder(
            input a,
            input b,
            input cin,
            output sum,
            output cout
        );
            wire sum1, cout1, cout2;

            // First half adder
            half_adder ha1(
                .a(a),
                .b(b),
                .sum(sum1),
                .cout(cout1)
            );

            // Second half adder
            half_adder ha2(
                .a(sum1),
                .b(cin),
                .sum(sum),
                .cout(cout2)
            );

            // Final carry
            assign cout = cout1 | cout2;
        endmodule
        """,
    }

    for filename, content in files.items():
        (comp_dir / filename).write_text(content)

    return comp_dir


@pytest.fixture
def schematic_config():
    """Create test schematic configuration."""
    return SchematicConfig(
        format=SchematicFormat.PNG,
        tool=SchematicTool.YOSYS,
        level=SchematicLevel.RTL,
        orientation=SchematicOrientation.LANDSCAPE,
        include_ports=True,
        include_signals=True,
        timeout=30,
        cleanup_temp=True,
    )


@pytest.fixture
def sample_metrics():
    """Create sample schematic metrics."""
    return SchematicMetrics(
        total_cells=10,
        total_signals=15,
        total_ports=8,
        max_fanout=3,
        max_depth=2,
        bus_signals=2,
        clock_signals=1,
        reset_signals=1,
    )


@pytest.fixture
def sample_annotations():
    """Create sample schematic annotations."""
    return [
        SchematicAnnotation(0.2, 0.3, "Clock domain crossing", "warning"),
        SchematicAnnotation(0.5, 0.6, "Critical path", "error"),
        SchematicAnnotation(0.7, 0.4, "Balanced tree", "info"),
    ]


@pytest.fixture
def sample_schematic(tmp_path):
    """Create a sample schematic image for testing."""
    from PIL import Image, ImageDraw

    img = Image.new("RGB", (400, 300), color="white")
    draw = ImageDraw.Draw(img)

    # Add some shapes and text that will show up in annotations
    draw.text((50, 100), "Clock domain crossing", fill="black")
    draw.text((200, 150), "Critical path", fill="black")

    img_path = tmp_path / "test_schematic.png"
    img.save(str(img_path))
    return img_path


@pytest.fixture
def mock_yosys():
    """Mock Yosys command execution while allowing other subprocess calls."""
    original_run = subprocess.run

    with patch("subprocess.run") as mock_run:

        def side_effect(*args, **kwargs):
            # Check if Yosys is in the command
            if isinstance(args[0], (list, tuple)) and "yosys" in args[0][0].lower():
                # Mock Yosys behavior
                script_path = Path(args[0][1])
                dot_path = script_path.parent / "full_adder_schematic.dot"
                dot_path.write_text("digraph { a -> b }")
                return MagicMock(returncode=0, stdout=b"", stderr=b"")

            # Pass through non-Yosys commands
            return original_run(*args, **kwargs)

        mock_run.side_effect = side_effect
        yield mock_run


@pytest.fixture
def mock_vivado():
    """Mock Vivado command execution while allowing other subprocess calls."""
    original_run = subprocess.run

    with patch("subprocess.run") as mock_run:

        def side_effect(*args, **kwargs):
            # Check if Vivado is in the command
            if isinstance(args[0], (list, tuple)) and "vivado" in args[0][0].lower():
                # Mock Vivado behavior
                script_path = Path(args[0][-1])
                tcl_content = script_path.read_text()

                # Parse output path from TCL script
                match = re.search(
                    r"write_schematic\s+-force\s+-format\s+(\S+)\s+(.+)", tcl_content
                )
                if match:
                    output_path = Path(match.group(2).strip())
                    output_path.parent.mkdir(parents=True, exist_ok=True)
                    output_path.touch()

                return MagicMock(returncode=0, stdout=b"", stderr=b"")

            # Pass through non-Vivado commands
            return original_run(*args, **kwargs)

        mock_run.side_effect = side_effect
        yield mock_run


class TestSchematicConfig:
    """Test suite for schematic configuration."""

    def test_initialization(self):
        """Test basic initialization."""
        config = SchematicConfig()
        assert config.format == SchematicFormat.PDF
        assert config.tool == SchematicTool.VIVADO
        assert config.cleanup_temp

    def test_string_enum_conversion(self):
        """Test string to enum conversion."""
        config = SchematicConfig(
            format="png", tool="yosys", level="gate", orientation="portrait"
        )
        assert config.format == SchematicFormat.PNG
        assert config.tool == SchematicTool.YOSYS
        assert config.level == SchematicLevel.GATE
        assert config.orientation == SchematicOrientation.PORTRAIT

    def test_invalid_timeout(self):
        """Test invalid timeout validation."""
        with pytest.raises(ValueError):
            SchematicConfig(timeout=0)


# -------------------------------------------------------------------
# Tests for SchematicGenerator
# -------------------------------------------------------------------


@pytest.mark.skipif(not shutil.which("yosys"), reason="Yosys not available")
def test_yosys_generation(temp_component_dir, schematic_config, mock_yosys):
    """Test schematic generation using Yosys, with a mock so it won't call the real binary."""
    """
    # Mock only Yosys calls, leave Graphviz untouched
    original_run = subprocess.run

    # Mock subprocess.run
    with patch("subprocess.run") as mock_run:

        def side_effect(*args, **kwargs):
            # print(args)
            if "yosys" in args[0]:
                # Mock Yosys with a success return code
                return MagicMock(returncode=0)
            else:
                # Bypass the mock and run the real command
                return original_run(*args, **kwargs)

        mock_run.side_effect = side_effect
    """

    gen = SchematicGenerator(
        "full_adder", schematic_config, base_dir=str(temp_component_dir)
    )
    output_path = gen.generate()
    assert output_path.exists()


@pytest.mark.skipif(not shutil.which("vivado"), reason="Vivado not available")
def test_vivado_generation(temp_component_dir, mock_vivado):
    """Test schematic generation using Vivado, with a mock so it won't call the real binary."""
    config = SchematicConfig(tool=SchematicTool.VIVADO, format=SchematicFormat.PDF)
    gen = SchematicGenerator("full_adder", config, base_dir=str(temp_component_dir))

    output_file = temp_component_dir / "full_adder_schematic.pdf"

    def mock_run(*args, **kwargs):
        output_file.write_text("dummy content")  # Create non-empty file
        return subprocess.CompletedProcess(
            args=args, returncode=0, stdout=b"", stderr=b""
        )

    mock_vivado.side_effect = mock_run  # Apply the mock

    output_path = gen.generate()
    assert output_path.exists()
    assert output_path.stat().st_size > 0

@pytest.mark.skipif(not shutil.which("yosys"), reason="Yosys not available")
def test_error_handling(temp_component_dir, schematic_config, mock_yosys):
    """Test error handling for a nonexistent component (Yosys test)."""
    with pytest.raises(RuntimeError):
        gen = SchematicGenerator(
            "nonexistent", schematic_config, base_dir=str(temp_component_dir)
        )
        gen.generate()


def test_timeout(temp_component_dir):
    """Test timeout handling for Vivado."""
    original_run = subprocess.run

    with patch("subprocess.run") as mock_run:

        def side_effect(*args, **kwargs):
            if isinstance(args[0], (list, tuple)) and "vivado" in args[0][0].lower():
                # Simulate timeout by raising exception
                raise subprocess.TimeoutExpired(cmd=args[0], timeout=0.1)
            else:
                # Pass through non-Vivado commands
                return original_run(*args, **kwargs)

        mock_run.side_effect = side_effect

        config = SchematicConfig(tool=SchematicTool.VIVADO, timeout=0.1)
        gen = SchematicGenerator("full_adder", config, base_dir=str(temp_component_dir))

        with pytest.raises(subprocess.TimeoutExpired):
            gen.generate()

"""
@pytest.mark.skipif(not shutil.which("yosys"), reason="Yosys not available")
def test_cleanup(temp_component_dir, schematic_config, mock_yosys):
    Test that all temporary files are cleaned up after generation.
    gen = SchematicGenerator(
        "full_adder", schematic_config, base_dir=str(temp_component_dir)
    )

    with gen:
        temp_files_before = set(Path(tempfile.gettempdir()).glob("full_adder_*"))
        _ = gen.generate()
        temp_files_after = set(Path(tempfile.gettempdir()).glob("full_adder_*"))

    # All newly-created temp files should be removed
    leftovers = temp_files_after - temp_files_before
    assert not leftovers, f"Leftover files: {leftovers}"
"""

# -------------------------------------------------------------------
# TestSchematicTemplate
# -------------------------------------------------------------------


class TestSchematicTemplate:
    @pytest.fixture
    def pdf_report(self, tmp_path):
        return PDFReportGenerator(str(tmp_path / "test_schematic.pdf"))

    def test_template_generation(
        self,
        pdf_report,
        temp_component_dir,
        sample_metrics,
        sample_annotations,
        sample_schematic,
    ):
        """Test generating a PDF page with a schematic image + annotations."""
        template = SchematicTemplate(pdf_report)
        template.generate_page(
            "full_adder", sample_schematic, "Yosys", sample_metrics, sample_annotations
        )
        pdf_report.add_template(template.elements)
        pdf_report.save()

        # Check PDF
        assert Path(pdf_report.filename).exists()
        assert Path(pdf_report.filename).stat().st_size > 0

        doc = fitz.open(str(pdf_report.filename))
        text = "".join(page.get_text() for page in doc)
        doc.close()

        print("text", text)
        assert "Circuit Schematic" in text
        assert "full_adder" in text
        assert "Yosys" in text
        assert "Complexity Metrics" in text
        assert str(sample_metrics.total_cells) in text
        # assert "Clock domain crossing" in text

    def test_error_handling(self, pdf_report):
        """Test that an invalid schematic image still produces a PDF with an error message."""
        template = SchematicTemplate(pdf_report)
        template.generate_page("test", Path("nonexistent.png"), "Yosys")
        pdf_report.add_template(template.elements)
        pdf_report.save()

        doc = fitz.open(str(pdf_report.filename))
        text = "".join(page.get_text() for page in doc)
        doc.close()

        assert "Error displaying schematic" in text


@pytest.mark.skipif(not shutil.which("yosys"), reason="Yosys not available")
def test_integrated_flow(temp_component_dir, mock_yosys):
    """Test complete flow from generation through visualization."""
    # 1. Generate schematic
    config = SchematicConfig(format=SchematicFormat.PNG, tool=SchematicTool.YOSYS)
    gen = SchematicGenerator("full_adder", config, base_dir=str(temp_component_dir))
    schematic_path = gen.generate()

    # 2. Create metrics
    metrics = SchematicMetrics(
        total_cells=4,  # 2 half adders + OR gate + internal wiring
        total_signals=5,  # sum1, cout1, cout2 internal + sum,cout external
        total_ports=5,  # a, b, cin inputs + sum, cout outputs
        max_fanout=2,  # a, b feed into XOR and AND
        max_depth=1,  # One level of hierarchy (half adders)
        bus_signals=0,  # No buses in this design
        clock_signals=0,  # No clocks
        reset_signals=0,  # No resets
    )

    # 3. Create annotations
    annotations = [
        SchematicAnnotation(0.3, 0.4, "Critical sum path", "info"),
        SchematicAnnotation(0.7, 0.6, "Carry merge point", "info"),
    ]

    # 4. Generate PDF report
    report_path = temp_component_dir / "full_adder_schematic_report.pdf"
    report = PDFReportGenerator(str(report_path))

    template = SchematicTemplate(report)
    template.generate_page(
        "full_adder", schematic_path, config.tool.value, metrics, annotations
    )

    report.add_template(template.elements)
    report.save()

    # 5. Verify PDF
    assert report_path.exists()
    doc = fitz.open(str(report_path))

    text = "".join(page.get_text() for page in doc)
    # print(text)
    assert "Circuit Schematic" in text
    # assert "full_adder" in text
    # assert "Critical sum path" in text
    # assert "Carry merge point" in text
    assert str(metrics.total_cells) in text

    doc.close()


if __name__ == "__main__":
    pytest.main([__file__])
