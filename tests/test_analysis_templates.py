import pytest
from unittest.mock import MagicMock
from reportlab.platypus import Table, Paragraph
from reportlab.lib import colors
from reportlab.lib.units import inch

from ..scripts.reporting.templates.resource import YosysResourceTemplate
from ..scripts.analysis.netlist import ModuleMetrics
from ..scripts.reporting.generator import PDFReportGenerator

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
                    sub_modules={"half_adder": 1}
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
                    sub_modules={}
                )
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
                    sub_modules={"half_adder": 2}
                )
            }
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
        assert test_module_row[5] == 3   # cell_count

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
        assert ('BACKGROUND', (0, 0), (-1, 0), colors.grey) in style._cmds
        assert ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke) in style._cmds
        assert ('GRID', (0, 0), (-1, -1), 1, colors.black) in style._cmds

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
        width4_row = cell_tables[0]._cellvalues[1]  # e.g. ["test_module", 2, 1]
        width8_row = cell_tables[1]._cellvalues[1]  # e.g. ["test_module", 4, 2]

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
                    "is_bus": False
                },
                "2": {
                    "name": "data[3:0]",
                    "times": [0, 15, 35],
                    "values": ["0000", "0101", "1010"],
                    "width": 4,
                    "is_bus": True
                }
            },
            "metrics": {
                "transitions": {
                    "clk": 5,
                    "data[3:0]": 2
                },
                "toggle_rates": {
                    "clk": 0.1,
                    "data[3:0]": 0.04
                },
                "min_pulse_widths": {
                    "clk": 10,
                    "data[3:0]": 20
                },
                "glitches": [],
                "violations": []
            },
            "time_range": (0, 50)
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
        plt.savefig(buf, format='png')
        plt.close()
        buf.seek(0)
        
        plots = {
            "singles": buf,
            "data[3:0]": buf  # Reuse same buffer for bus plot
        }

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
        clk_row = next(row for row in activity_table._cellvalues 
                      if row[0] == "clk")
        assert clk_row[1] == "5"  # transitions
        assert float(clk_row[2]) == 0.1  # toggle rate

        # Check events summary table
        events_table = tables[1]
        assert events_table._cellvalues[1][0] == "Glitches"
        assert events_table._cellvalues[1][1] == 0

    def test_plot_generation(self, template):
        """Test waveform plot addition"""
        import io
        import matplotlib.pyplot as plt
        from reportlab.platypus import Image
        
        # Create test plot
        plt.figure()
        plt.plot([0, 1, 0, 1])
        buf = io.BytesIO()
        plt.savefig(buf, format='png')
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
        assert img.drawHeight == 4*inch
        assert img.drawWidth == 6*inch

    def test_table_styling(self, template):
        """Test table style consistency"""
        data = [["Header"], ["Data"]]
        template._add_styled_table(data, "Test Table")
        
        table = next(e for e in template.elements if isinstance(e, Table))
        style = template._last_table_style
        
        # Verify essential style commands
        style_cmds = style._cmds
        assert ('BACKGROUND', (0,0), (-1,0), colors.grey) in style_cmds
        assert ('TEXTCOLOR', (0,0), (-1,0), colors.whitesmoke) in style_cmds
        assert ('GRID', (0,0), (-1,-1), 1, colors.black) in style_cmds
        assert ('ALIGN', (0,0), (-1,-1), 'CENTER') in style_cmds
        
        # Verify caption
        caption = next(e for e in template.elements 
                      if isinstance(e, Paragraph) and "Test Table" in str(e))