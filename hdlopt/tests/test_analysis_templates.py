import shutil
from datetime import datetime
from pathlib import Path

import fitz
import pytest
from reportlab.lib import colors
from reportlab.lib.units import inch
from reportlab.platypus import Paragraph, Table

from ..scripts.analysis.netlist import ModuleMetrics
from ..scripts.analysis.power import ComponentPower, PowerSummary, PowerSupply
from ..scripts.analysis.timing import ClockSummary, TimingSummary
from ..scripts.reporting.generator import PDFReportGenerator
from ..scripts.reporting.templates.power import PowerTemplate
from ..scripts.reporting.templates.resource import YosysResourceTemplate
from ..scripts.reporting.templates.timing import TimingTemplate


class TestYosysResourceTemplate:
    """Test suite for Yosys resource analysis template"""

    @pytest.fixture
    def pdf_report(self):
        """Create PDF report fixture"""
        return PDFReportGenerator("test_report.pdf")

    @pytest.fixture
    def template(self, pdf_report):
        """Create template fixture"""
        return YosysResourceTemplate(pdf_report)

    @pytest.fixture
    def sample_analysis(self):
        """Create sample analysis results"""
        return {
            "4": {  # WIDTH=4 configuration
                "test_module": ModuleMetrics(
                    wire_count=10,
                    wire_bits=32,
                    port_count=5,
                    port_bits=16,
                    cell_count=3,
                    hierarchy_depth=2,
                    cells={"full_adder": 2, "half_adder": 1},
                    raw_gates={"$_AND_": 4, "$_XOR_": 2},
                    sub_modules={"half_adder": 1},
                ),
                "half_adder": ModuleMetrics(
                    wire_count=4,
                    wire_bits=4,
                    port_count=4,
                    port_bits=4,
                    cell_count=2,
                    hierarchy_depth=0,
                    cells={},
                    raw_gates={"$_AND_": 1, "$_XOR_": 1},
                    sub_modules={},
                ),
            },
            "8": {  # WIDTH=8 configuration
                "test_module": ModuleMetrics(
                    wire_count=20,
                    wire_bits=64,
                    port_count=5,
                    port_bits=32,
                    cell_count=6,
                    hierarchy_depth=2,
                    cells={"full_adder": 4, "half_adder": 2},
                    raw_gates={"$_AND_": 8, "$_XOR_": 4},
                    sub_modules={"half_adder": 2},
                )
            },
        }

    def test_template_initialization(self, template):
        """Test template initialization"""
        assert template.doc is not None
        assert template.styles is not None
        assert len(template.elements) == 0
        assert len(template.toc) == 0

    def test_generate_page(self, template, sample_analysis):
        """Test complete page generation"""
        template.generate_page("test_component", sample_analysis)

        # Verify elements were generated
        assert len(template.elements) > 0

        # Should have headings and tables
        headings = [e for e in template.elements if isinstance(e, Paragraph)]
        tables = [e for e in template.elements if isinstance(e, Table)]

        assert len(headings) > 0
        assert len(tables) > 0

        # Verify table of contents entries
        assert len(template.toc) > 0
        assert any("Resource Usage Analysis" in entry[0] for entry in template.toc)

    def test_general_metrics_table(self, template, sample_analysis):
        """Test general metrics table generation"""
        template._add_general_metrics_table(sample_analysis["4"])

        # Get the generated table
        table = next(e for e in template.elements if isinstance(e, Table))

        # Verify headers
        headers = table._cellvalues[0]
        assert "Module" in headers
        assert "Wire Count" in headers
        assert "Port Count" in headers

        # Verify data
        test_module_row = table._cellvalues[1]
        assert test_module_row[0] == "test_module"
        assert test_module_row[1] == 10  # wire_count
        assert test_module_row[5] == 3  # cell_count

    def test_cell_usage_table(self, template, sample_analysis):
        """Test cell usage table generation"""
        template._add_cell_usage_table(sample_analysis["4"])
        table = next(e for e in template.elements if isinstance(e, Table))

        # Verify all cell types are included
        headers = table._cellvalues[0]
        assert "full_adder" in headers
        assert "half_adder" in headers

        # Verify counts
        test_module_row = table._cellvalues[1]
        assert test_module_row[headers.index("full_adder")] == 2
        assert test_module_row[headers.index("half_adder")] == 1

    def test_raw_gates_table(self, template, sample_analysis):
        """Test raw gates table generation"""
        template._add_raw_gates_table(sample_analysis["4"])
        table = next(e for e in template.elements if isinstance(e, Table))

        headers = table._cellvalues[0]
        assert "$_AND_" in headers
        assert "$_XOR_" in headers

        test_module_row = table._cellvalues[1]
        assert test_module_row[headers.index("$_AND_")] == 4
        assert test_module_row[headers.index("$_XOR_")] == 2

    def test_hierarchy_table(self, template, sample_analysis):
        """Test hierarchy table generation"""
        template._add_hierarchy_table(sample_analysis["4"])
        table = next(e for e in template.elements if isinstance(e, Table))

        # Verify structure
        headers = table._cellvalues[0]
        assert "Module" in headers
        assert "Submodule" in headers
        assert "Instance Count" in headers

        # Verify hierarchy data
        data_row = table._cellvalues[1]
        assert data_row[0] == "test_module"
        assert data_row[1] == "half_adder"
        assert data_row[2] == 1

    def test_table_styling(self, template, sample_analysis):
        """Test table styling"""
        template._add_styled_table([["Header"], ["Data"]], "Test Table")
        table = next(e for e in template.elements if isinstance(e, Table))
        print(table)
        style = template._last_table_style

        # Verify styling attributes
        assert ("BACKGROUND", (0, 0), (-1, 0), colors.grey) in style._cmds
        assert ("TEXTCOLOR", (0, 0), (-1, 0), colors.whitesmoke) in style._cmds
        assert ("GRID", (0, 0), (-1, -1), 1, colors.black) in style._cmds

    def test_multiple_configurations(self, template, sample_analysis):
        """Test handling multiple parameter configurations"""
        template.generate_page("test_component", sample_analysis)

        # Should have sections for each configuration
        headings = [e for e in template.elements if isinstance(e, Paragraph)]
        assert any("Parameter Configuration: 4" in str(h) for h in headings)
        assert any("Parameter Configuration: 8" in str(h) for h in headings)

        # Tables should show scaling with parameter
        tables = [e for e in template.elements if isinstance(e, Table)]

        # Find cell usage tables
        cell_tables = [t for t in tables if "full_adder" in str(t._cellvalues[0])]
        assert len(cell_tables) >= 2

        # Verify cell counts scale with parameter
        # e.g. ["test_module", 2, 1]
        width4_row = cell_tables[0]._cellvalues[1]
        # e.g. ["test_module", 4, 2]
        width8_row = cell_tables[1]._cellvalues[1]

        assert width4_row[1] == 2
        assert width8_row[1] == 4
        assert width4_row[1] < width8_row[1]


class TestWaveformTemplate:
    """Test suite for waveform analysis template"""

    @pytest.fixture
    def pdf_report(self):
        """Create PDF report fixture"""
        return PDFReportGenerator("test_report.pdf")

    @pytest.fixture
    def template(self, pdf_report):
        """Create template fixture"""
        from ..scripts.reporting.templates.waveform import WaveformTemplate

        return WaveformTemplate(pdf_report)

    @pytest.fixture
    def sample_analysis(self):
        """Create sample waveform analysis results"""
        return {
            "signals": {
                "1": {
                    "name": "clk",
                    "times": [0, 10, 20, 30, 40, 50],
                    "values": ["0", "1", "0", "1", "0", "1"],
                    "width": 1,
                    "is_bus": False,
                },
                "2": {
                    "name": "data[3:0]",
                    "times": [0, 15, 35],
                    "values": ["0000", "0101", "1010"],
                    "width": 4,
                    "is_bus": True,
                },
            },
            "metrics": {
                "transitions": {"clk": 5, "data[3:0]": 2},
                "toggle_rates": {"clk": 0.1, "data[3:0]": 0.04},
                "min_pulse_widths": {"clk": 10, "data[3:0]": 20},
                "glitches": [],
                "violations": [],
            },
            "time_range": (0, 50),
        }

    def test_template_initialization(self, template):
        """Test template initialization"""
        assert template.doc is not None
        assert template.styles is not None
        assert len(template.elements) == 0
        assert len(template.toc) == 0
        assert "WaveformCaption" in template.styles

    def test_generate_page(self, template, sample_analysis, tmp_path):
        """Test complete page generation"""
        # Create dummy plot data
        import io

        import matplotlib.pyplot as plt

        # Create digital plot
        plt.figure()
        plt.plot([0, 1, 0, 1])
        buf = io.BytesIO()
        plt.savefig(buf, format="png")
        plt.close()
        buf.seek(0)

        # Reuse same buffer for bus plot
        plots = {"singles": buf, "data[3:0]": buf}

        # Generate page
        template.generate_page("test_component", sample_analysis, plots)

        # Verify elements were generated
        assert len(template.elements) > 0

        # Should have headings and tables
        headings = [e for e in template.elements if isinstance(e, Paragraph)]
        tables = [e for e in template.elements if isinstance(e, Table)]

        assert len(headings) > 0
        assert len(tables) > 0

        # Verify TOC entries
        assert len(template.toc) > 0
        assert any("Waveform Analysis Results" in entry[0] for entry in template.toc)

    def test_time_range_table(self, template, sample_analysis):
        """Test time range table generation"""
        template._add_time_range(sample_analysis["time_range"])
        table = next(e for e in template.elements if isinstance(e, Table))

        assert table._cellvalues[0][0] == "Start Time"
        assert table._cellvalues[0][1] == "0"
        assert table._cellvalues[1][0] == "End Time"
        assert table._cellvalues[1][1] == "50"

    def test_metrics_summary(self, template, sample_analysis):
        """Test metrics summary table generation"""
        template._add_metrics_summary(sample_analysis["metrics"])

        # Should generate two tables
        tables = [e for e in template.elements if isinstance(e, Table)]
        assert len(tables) == 2

        # Check signal activity table
        activity_table = tables[0]
        headers = activity_table._cellvalues[0]
        assert "Signal" in headers
        assert "Transitions" in headers
        assert "Toggle Rate" in headers

        # Check data
        clk_row = next(row for row in activity_table._cellvalues if row[0] == "clk")
        assert clk_row[1] == "5"  # transitions
        assert float(clk_row[2]) == 0.1  # toggle rate

        # Check events summary table
        events_table = tables[1]
        assert events_table._cellvalues[1][0] == "Glitches"
        assert events_table._cellvalues[1][1] == 0

    def test_plot_generation(self, template):
        """Test waveform plot addition"""
        import io

        import matplotlib

        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        from reportlab.platypus import Image

        # Create test plot
        plt.figure()
        plt.plot([0, 1, 0, 1])
        buf = io.BytesIO()
        plt.savefig(buf, format="png")
        plt.close()
        buf.seek(0)

        plots = {"singles": buf}
        template._add_waveform_plots(plots)

        # Should have heading, image, spacer, caption
        elements = template.elements
        print("Elements:", elements, "len(elements):", len(elements))
        assert len(elements) >= 4
        assert isinstance(elements[2], Image)

        # Verify image dimensions
        img = elements[2]
        assert img.drawHeight == 4 * inch
        assert img.drawWidth == 6 * inch

    def test_table_styling(self, template):
        """Test table style consistency"""
        data = [["Header"], ["Data"]]
        template._add_styled_table(data, "Test Table")

        style = template._last_table_style

        # Verify essential style commands
        style_cmds = style._cmds
        assert ("BACKGROUND", (0, 0), (-1, 0), colors.grey) in style_cmds
        assert ("TEXTCOLOR", (0, 0), (-1, 0), colors.whitesmoke) in style_cmds
        assert ("GRID", (0, 0), (-1, -1), 1, colors.black) in style_cmds
        assert ("ALIGN", (0, 0), (-1, -1), "CENTER") in style_cmds

class TestTimingTemplate:
    """Test suite for timing analysis template."""

    @pytest.fixture
    def pdf_report(self, tmp_path):
        """Create PDF report fixture."""
        return PDFReportGenerator(str(tmp_path / "timing_test.pdf"))

    @pytest.fixture
    def timing_data(self):
        """Create sample timing analysis data."""
        return {
            "timing_summary": TimingSummary(
                wns=1.5,  # Worst Negative Slack
                tns=-2.3,  # Total Negative Slack
                whs=0.8,  # Worst Hold Slack
                ths=-0.5,  # Total Hold Slack
                wpws=2.0,  # Worst Pulse Width Slack
                tpws=-0.2,  # Total Pulse Width Slack
                failing_endpoints=3,
                total_endpoints=100,
            ),
            "clock_summary": [
                ClockSummary(
                    name="clk_100MHz",
                    period=10.0,
                    wns=1.5,
                    tns=-2.3,
                    failing_endpoints=2,
                    total_endpoints=50,
                ),
                ClockSummary(
                    name="clk_50MHz",
                    period=20.0,
                    wns=2.0,
                    tns=-1.1,
                    failing_endpoints=1,
                    total_endpoints=50,
                ),
            ],
            "inter_clock": [
                {
                    "from_clock": "clk_100MHz",
                    "to_clock": "clk_50MHz",
                    "wns": 1.2,
                    "tns": -0.8,
                    "failing_endpoints": 1,
                    "total_endpoints": 10,
                }
            ],
            "path_groups": [
                {
                    "group": "reg2reg",
                    "from_clock": "clk_100MHz",
                    "to_clock": "clk_100MHz",
                    "wns": 1.5,
                    "tns": -1.2,
                    "failing_endpoints": 2,
                    "total_endpoints": 80,
                }
            ],
        }

    def test_timing_template_generation(self, pdf_report, timing_data):
        """Test generating timing analysis report."""
        # Create real output directory
        output_dir = Path("./timing_reports")
        output_dir.mkdir(parents=True, exist_ok=True)

        # Generate the report
        template = TimingTemplate(pdf_report)
        template.generate_page("test_component", timing_data)
        pdf_report.add_template(template.elements)
        pdf_report.save()

        # Copy to real directory
        real_pdf = (
            output_dir
            / f"timing_analysis_{datetime.now().strftime('%Y%m%d_%H%M%S')}.pdf"
        )
        shutil.copy2(pdf_report.filename, real_pdf)

        # Verify PDF contents
        doc = fitz.open(str(real_pdf))
        text = "".join(page.get_text() for page in doc)
        doc.close()

        # Check key sections and values
        assert "Timing Analysis Results" in text
        assert "Timing Summary" in text
        assert "Clock Domains" in text
        assert "Inter-Clock Timing" in text
        assert "Path Groups" in text

        # Check specific timing values
        assert "1.5" in text  # WNS value
        assert "-2.3" in text  # TNS value
        assert "clk_100MHz" in text
        assert "clk_50MHz" in text

        print(f"Generated timing analysis PDF at: {real_pdf}")


class TestPowerTemplate:
    """Test suite for power analysis template."""

    @pytest.fixture
    def pdf_report(self, tmp_path):
        """Create PDF report fixture."""
        return PDFReportGenerator(str(tmp_path / "power_test.pdf"))

    @pytest.fixture
    def power_data(self):
        """Create sample power analysis data."""
        return {
            "summary": PowerSummary(
                total_on_chip=1.5,
                dynamic=0.8,
                static=0.3,
                device_static=0.4,
                effective_thetaja=4.5,
                max_ambient=85.0,
                junction_temp=45.0,
            ),
            "on_chip_components": [
                ComponentPower(
                    name="LUT", power=0.4, used=1000, available=20000, utilization=5.0
                ),
                ComponentPower(
                    name="FF", power=0.3, used=800, available=40000, utilization=2.0
                ),
                ComponentPower(
                    name="BRAM", power=0.1, used=2, available=50, utilization=4.0
                ),
            ],
            "power_supply": [
                PowerSupply(
                    source="VCCINT",
                    voltage=1.0,
                    total_current=1.5,
                    dynamic_current=1.0,
                    static_current=0.5,
                    powerup_current=0.1,
                    budget=2.0,
                    margin=0.5,
                ),
                PowerSupply(
                    source="VCCAUX",
                    voltage=1.8,
                    total_current=0.8,
                    dynamic_current=0.5,
                    static_current=0.3,
                    powerup_current=0.05,
                    budget=1.5,
                    margin=0.7,
                ),
            ],
            "confidence": {
                "Settings": {"level": "Medium"},
                "Clock Activity": {"level": "High"},
                "Signal Activity": {"level": "Low"},
            },
            "environment": {
                "Temperature": 25.0,
                "Airflow": "250 LFM",
                "Heat Sink": "Medium Profile",
            },
            "hierarchy": {"top": 1.5, "sub_module1": 0.5, "sub_module2": 0.3},
        }

    def test_power_template_generation(self, pdf_report, power_data):
        """Test generating power analysis report."""
        # Create real output directory
        output_dir = Path("./power_reports")
        output_dir.mkdir(parents=True, exist_ok=True)

        # Generate the report
        template = PowerTemplate(pdf_report)
        template.generate_page("test_component", power_data)
        pdf_report.add_template(template.elements)
        pdf_report.save()

        # Copy to real directory
        real_pdf = (
            output_dir
            / f"power_analysis_{datetime.now().strftime('%Y%m%d_%H%M%S')}.pdf"
        )
        shutil.copy2(pdf_report.filename, real_pdf)

        # Verify PDF contents
        doc = fitz.open(str(real_pdf))
        text = "".join(page.get_text() for page in doc)
        doc.close()

        # Check key sections
        assert "Power Analysis Results" in text
        assert "Power Summary" in text
        assert "Component Power Breakdown" in text
        assert "Power Supply Analysis" in text
        assert "Analysis Confidence" in text
        assert "Environment Settings" in text
        assert "Power by Hierarchy" in text

        # Check specific values
        assert "1.5" in text  # Total on-chip power
        assert "0.8" in text  # Dynamic power
        assert "VCCINT" in text
        assert "LUT" in text
        assert "FF" in text
        assert "BRAM" in text

        print(f"Generated power analysis PDF at: {real_pdf}")


if __name__ == "__main__":
    pytest.main([__file__])
