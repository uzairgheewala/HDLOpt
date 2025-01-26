import pytest
from unittest.mock import patch, MagicMock
import os
import json
import subprocess
from pathlib import Path

from ..scripts.analysis.timing import TimingAnalyzer, TimingSummary, ClockSummary
from ..scripts.analysis.power import PowerAnalyzer, PowerSummary, ComponentPower, PowerSupply
from .test_analysis_fixtures import *

class TestTimingAnalyzer:
    """Test suite for timing analysis."""
    
    def test_initialization(self, temp_component_dir):
        """Test basic initialization."""
        analyzer = TimingAnalyzer("test_component", base_dir=str(temp_component_dir))
        assert analyzer.component_name == "test_component"
        
    @patch('subprocess.run')
    def test_vivado_execution(self, mock_run, temp_component_dir):
        """Test Vivado execution for timing analysis."""
        analyzer = TimingAnalyzer("test_component", base_dir=str(temp_component_dir))
        
        # Mock successful execution
        mock_run.return_value = MagicMock(returncode=0)
        analyzer._run_vivado()
        
        # Verify Vivado was called correctly
        assert mock_run.called
        args = mock_run.call_args[0][0]
        assert "vivado" in args
        assert "-mode" in args
        assert "batch" in args
        
        # Test failure case
        mock_run.return_value = MagicMock(returncode=1, stderr=b"Error")
        with pytest.raises(subprocess.CalledProcessError):
            analyzer._run_vivado()

    def test_timing_report_parsing(self, temp_component_dir):
        """Test parsing of timing report."""
        analyzer = TimingAnalyzer("test_component", base_dir=str(temp_component_dir))
        
        # Create sample timing report
        report_content = """
        | Timer Settings
        | Setting A: Value A
        | Setting B: Value B
        --------------------------------
        | Design Timing Summary
        10.0  -2.5  3  100  5.0  -1.0  2  50  8.0  -3.0  4  75
        --------------------------------
        | Intra Clock Table
        clk1  100  -2.0  -5.0  2  50  3.0  -1.0  1  25
        clk2  200  -1.5  -3.0  1  40  4.0  -0.5  0  20
        """
        
        report_path = temp_component_dir / "test_component_timing_summary.rpt"
        report_path.write_text(report_content)
        
        # Parse report
        timing_data = analyzer._parse_timing_report()
        
        # Verify parsed data
        assert "timer_settings" in timing_data
        assert "timing_summary" in timing_data
        assert "clock_summary" in timing_data
        
        # Verify timing summary
        summary = timing_data["timing_summary"]
        assert summary.wns == 10.0
        assert summary.tns == -2.5
        assert summary.failing_endpoints == 3
        assert summary.total_endpoints == 100
        
        # Verify clock summary
        clocks = timing_data["clock_summary"]
        assert len(clocks) == 2
        assert clocks[0].name == "clk1"
        assert clocks[0].period == 100.0
        assert clocks[1].name == "clk2"
        assert clocks[1].period == 200.0

    def test_tcl_script_generation(self, temp_component_dir):
        """Test generation of Vivado TCL script."""
        analyzer = TimingAnalyzer("test_component", base_dir=str(temp_component_dir))
        
        # Create test files
        (temp_component_dir / "test_component.v").touch()
        (temp_component_dir / "submodule.v").touch()
        
        script = analyzer._generate_tcl_script()
        
        # Verify script content
        assert "create_project" in script
        assert "add_files" in script
        assert "synth_design" in script
        assert "report_timing_summary" in script

    def test_report_generation(self, temp_component_dir):
        """Test generation of timing analysis report."""
        analyzer = TimingAnalyzer("test_component", base_dir=str(temp_component_dir))
        
        # Create sample timing data
        timing_data = {
            'timer_settings': {'Setting': 'Value'},
            'timing_summary': TimingSummary(
                wns=1.0, tns=-2.0, whs=3.0, ths=-1.0,
                wpws=2.0, tpws=-0.5, failing_endpoints=2,
                total_endpoints=100
            ),
            'clock_summary': [
                ClockSummary(
                    name='clk1', period=100.0, wns=-1.0,
                    tns=-2.0, failing_endpoints=1,
                    total_endpoints=50
                )
            ],
            'inter_clock': [],
            'path_groups': []
        }
        
        # Generate report
        analyzer._generate_report(timing_data)
        
        # Verify report was created
        report_path = temp_component_dir / "test_component_timing_report.pdf"
        assert report_path.exists()
        assert report_path.stat().st_size > 0