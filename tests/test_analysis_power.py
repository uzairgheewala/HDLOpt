import pytest
from unittest.mock import patch, MagicMock
import os
import json
import subprocess
from pathlib import Path

from ..scripts.analysis.power import PowerAnalyzer, PowerSummary, ComponentPower, PowerSupply
from .test_analysis_fixtures import *

class TestPowerAnalyzer:
    """Test suite for power analysis."""
    
    def test_initialization(self, temp_component_dir):
        """Test basic initialization."""
        analyzer = PowerAnalyzer("test_component", base_dir=str(temp_component_dir))
        assert analyzer.component_name == "test_component"
        
    @patch('subprocess.run')
    def test_vivado_execution(self, mock_run, temp_component_dir):
        """Test Vivado execution for power analysis."""
        analyzer = PowerAnalyzer("test_component", base_dir=str(temp_component_dir))
        
        # Mock successful execution
        mock_run.return_value = MagicMock(returncode=0)
        analyzer._run_vivado()
        
        # Verify Vivado was called correctly
        assert mock_run.called
        args = mock_run.call_args[0][0]
        assert "vivado" in args

        script_path = analyzer._get_script_path()
        tcl_contents = Path(script_path).read_text()
        assert "report_power" in tcl_contents
        
        # Test failure case
        mock_run.return_value = MagicMock(returncode=1, stderr=b"Error")
        with pytest.raises(subprocess.CalledProcessError):
            analyzer._run_vivado()

    def test_power_report_parsing(self, temp_component_dir):
        """Test parsing of power report."""
        analyzer = PowerAnalyzer("test_component", base_dir=str(temp_component_dir))
        
        # Create sample power report
        report_content = """
        Total On-Chip Power (W) | 1.5
        Dynamic (W)            | 0.8
        Device Static (W)      | 0.7
        --------------------------------
        1.1 On-Chip Components
        | Component | Power (W) | Used | Available | Utilization (%) |
        | LUT      | 0.2       | 100  | 1000      | 10.0           |
        | FF       | 0.1       | 50   | 500       | 10.0           |
        --------------------------------
        1.2 Power Supply Summary
        | Source | Voltage | Total Current | Dynamic | Static |
        | Vccint | 1.0    | 0.5           | 0.3     | 0.2    |
        """
        
        report_path = temp_component_dir / "test_component_power_summary.rpt"
        report_path.write_text(report_content)
        
        # Parse report
        power_data = analyzer._parse_power_report()
        
        # Verify parsed data
        assert "summary" in power_data
        assert "on_chip_components" in power_data
        assert "power_supply" in power_data
        
        # Verify power summary
        summary = power_data["summary"]
        assert summary.total_on_chip == 1.5
        assert summary.dynamic == 0.8
        assert summary.device_static == 0.7
        
        # Verify component breakdown
        components = power_data["on_chip_components"]
        assert len(components) == 2
        assert components[0].name == "LUT"
        assert components[0].power == 0.2
        assert components[0].used == 100
        
        # Verify power supplies
        supplies = power_data["power_supply"]
        assert len(supplies) == 1
        assert supplies[0].source == "Vccint"
        assert supplies[0].voltage == 1.0

    def test_tcl_script_generation(self, temp_component_dir):
        """Test generation of Vivado TCL script."""
        analyzer = PowerAnalyzer("test_component", base_dir=str(temp_component_dir))
        
        # Create test files
        (temp_component_dir / "test_component.v").touch()
        (temp_component_dir / "submodule.v").touch()
        
        script = analyzer._generate_tcl_script()
        
        # Verify script content 
        assert "create_project" in script
        assert "add_files" in script
        assert "synth_design" in script
        assert "report_power" in script

    def test_report_generation(self, temp_component_dir):
        """Test generation of power analysis report."""
        analyzer = PowerAnalyzer("test_component", base_dir=str(temp_component_dir))
        
        # Create sample power data
        power_data = {
            'summary': PowerSummary(
                total_on_chip=1.5,
                dynamic=0.8,
                static=0.7,
                device_static=0.7,
                effective_thetaja=30.0,
                max_ambient=85.0,
                junction_temp=45.0
            ),
            'on_chip_components': [
                ComponentPower(
                    name="LUT",
                    power=0.2,
                    used=100,
                    available=1000,
                    utilization=10.0
                )
            ],
            'power_supply': [
                PowerSupply(
                    source="Vccint",
                    voltage=1.0,
                    total_current=0.5,
                    dynamic_current=0.3,
                    static_current=0.2,
                    powerup_current=0.1,
                    budget=1.0,
                    margin=0.5
                )
            ],
            'confidence': {'Settings': {'level': 'Medium'}},
            'environment': {'Temperature': 25.0},
            'hierarchy': {'test_component': 1.5}
        }
        
        # Generate report
        analyzer._generate_report(power_data)
        
        # Verify report was created
        report_path = temp_component_dir / "test_component_power_report.pdf"
        assert report_path.exists()
        assert report_path.stat().st_size > 0