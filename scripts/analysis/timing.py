from dataclasses import dataclass
from typing import Dict, List, Optional
import os
import json
from pathlib import Path
import subprocess

from ..logger import logger
from ..config import EnvironmentSetup
from ..reporting.generator import PDFReportGenerator
from ..reporting.templates.timing import TimingTemplate

@dataclass 
class TimingSummary:
    """Container for timing analysis summary data"""
    wns: float  # Worst Negative Slack
    tns: float  # Total Negative Slack
    whs: float  # Worst Hold Slack
    ths: float  # Total Hold Slack
    wpws: float # Worst Pulse Width Slack
    tpws: float # Total Pulse Width Slack
    failing_endpoints: int
    total_endpoints: int

@dataclass
class ClockSummary:
    """Summary of clock domain timing"""
    name: str
    period: float
    wns: float
    tns: float
    failing_endpoints: int
    total_endpoints: int

class TimingAnalyzer:
    """Analyzes HDL component timing using Vivado"""
    
    def __init__(self, component_name: str, base_dir: Optional[str] = None):
        self.component_name = component_name
        self.base_dir = base_dir
        self.env = EnvironmentSetup()

    def analyze(self) -> Dict:
        """Run timing analysis and generate report
        
        Returns:
            Dict containing analysis results
        """
        logger.info(f"Starting timing analysis for {self.component_name}")
        
        try:
            # Setup environment
            #self.env.setup_vivado()
            
            # Generate and run Vivado script
            self._run_vivado()
            
            # Parse timing report
            timing_data = self._parse_timing_report()
            
            # Generate report
            report_path = self._generate_report(timing_data)
            
            return timing_data, report_path
            
        except Exception as e:
            logger.error(f"Timing analysis failed: {str(e)}")
            raise
        finally:
            self.env.teardown()

    def _run_vivado(self) -> None:
        """Run Vivado synthesis and timing analysis"""
        tcl_script = self._generate_tcl_script()
        script_path = self._get_script_path()

        with open(script_path, "w") as f:
            f.write(tcl_script)

        try:
            result = subprocess.run(
                ["vivado", "-mode", "batch", "-source", script_path],
                check=False,  # Don't raise error immediately 
                capture_output=True
            )
            if result.returncode != 0:
                raise subprocess.CalledProcessError(
                    result.returncode,
                    result.args,
                    output=result.stdout,
                    stderr=result.stderr
                )
        except Exception as e:
            logger.error(f"Vivado execution failed: {str(e)}")
            raise

    def _generate_tcl_script(self) -> str:
        """Generate Vivado TCL script for timing analysis"""
        component_files = self._collect_source_files()
        project_name = f"{self.component_name}_timing"

        script = [
            f"create_project {project_name} -part xc7a35tcsg324-1",
        ]

        # Add source files
        for file in component_files:
            script.append(f"add_files {file}")

        script.extend([
            f"set_property top {self.component_name} [current_fileset]",
            "synth_design -top $component_name",
            "launch_runs synth_1",
            "wait_on_run synth_1",
            "open_run synth_1",
            f"report_timing_summary -file {self._get_report_path()}",
            "close_project"
        ])

        return "\n".join(script)

    def _parse_timing_report(self) -> Dict:
        """Parse Vivado timing report"""
        report_path = self._get_report_path()
        
        with open(report_path) as f:
            lines = f.readlines()

        data = {
            'timer_settings': self._parse_timer_settings(lines),
            'timing_summary': self._parse_timing_summary(lines),
            'clock_summary': self._parse_clock_summary(lines),
            'inter_clock': self._parse_inter_clock_table(lines),
            'path_groups': self._parse_path_groups_table(lines)
        }

        return data

    def _parse_timer_settings(self, lines: List[str]) -> Dict:
        """Parse timer settings section"""
        settings = {}
        capture = False
        
        for line in lines:
            if '| Timer Settings' in line:
                capture = True
            elif '--------------------------------' in line and capture:
                break
            elif capture and ':' in line:
                key, value = line.split(':', 1)
                settings[key.strip()] = value.strip()
                
        return settings

    def _parse_timing_summary(self, lines: List[str]) -> TimingSummary:
        """Parse timing summary section"""
        for i, line in enumerate(lines):
            if '| Design Timing Summary' in line:
                # Next line should contain the values
                if i + 1 < len(lines):
                    values = lines[i + 1].strip().split()
                    if len(values) >= 12:
                        try:
                            return TimingSummary(
                                wns=float(values[0]),
                                tns=float(values[1]),
                                failing_endpoints=int(values[2]),
                                total_endpoints=int(values[3]),
                                whs=float(values[4]),
                                ths=float(values[5]),
                                wpws=float(values[8]),
                                tpws=float(values[9])
                            )
                        except (ValueError, IndexError) as e:
                            logger.error(f"Failed to parse timing values: {str(e)}")
        
        logger.error("No timing summary found in report")
        return TimingSummary(
            wns=0.0, tns=0.0, whs=0.0, ths=0.0,
            wpws=0.0, tpws=0.0, failing_endpoints=0,
            total_endpoints=0
        )

    def _parse_clock_summary(self, lines: List[str]) -> List[ClockSummary]:
        """Parse clock summary section"""
        clocks = []
        in_clock_section = False
        
        for line in lines:
            if '| Intra Clock Table' in line:
                in_clock_section = True
                continue
            elif '| Inter Clock Table' in line:
                break
                
            if in_clock_section and line.strip() and '|' not in line:
                # Extract values from line
                parts = line.strip().split()
                if len(parts) >= 7:  # Ensure enough values present
                    try:
                        clocks.append(ClockSummary(
                            name=parts[0],
                            period=float(parts[1]), 
                            wns=float(parts[2]),
                            tns=float(parts[3]),
                            failing_endpoints=int(parts[4]),
                            total_endpoints=int(parts[5])
                        ))
                    except (ValueError, IndexError) as e:
                        logger.error(f"Failed to parse clock data from line '{line}': {str(e)}")
        
        return clocks

    def _parse_inter_clock_table(self, lines: List[str]) -> List[Dict]:
        """Parse inter-clock timing table"""
        table = []
        capture = False
        
        for line in lines:
            if '| Inter Clock Table' in line:
                capture = True
            elif '| Other Path Groups Table' in line:
                break
            elif capture and '|' in line:
                parts = line.split('|')
                if len(parts) >= 10:
                    table.append({
                        'from_clock': parts[1].strip(),
                        'to_clock': parts[2].strip(),
                        'wns': float(parts[3].strip()),
                        'tns': float(parts[4].strip()),
                        'failing_endpoints': int(parts[5].strip()),
                        'total_endpoints': int(parts[6].strip())
                    })
                    
        return table

    def _parse_path_groups_table(self, lines: List[str]) -> List[Dict]:
        """Parse path groups timing table"""
        groups = []
        capture = False
        
        for line in lines:
            if '| Other Path Groups Table' in line:
                capture = True
            elif '| Timing Details' in line:
                break
            elif capture and '|' in line:
                parts = line.split('|')
                if len(parts) >= 11:
                    groups.append({
                        'group': parts[1].strip(),
                        'from_clock': parts[2].strip(),
                        'to_clock': parts[3].strip(),
                        'wns': float(parts[4].strip()),
                        'tns': float(parts[5].strip()),
                        'failing_endpoints': int(parts[6].strip()),
                        'total_endpoints': int(parts[7].strip())
                    })
                    
        return groups

    def _generate_report(self, timing_data: Dict) -> None:
        """Generate PDF report of timing analysis results"""
        report_path = self._get_pdf_path()
        
        # Create report generator
        report = PDFReportGenerator(str(report_path))
        
        # Add title page
        report.add_title_page(f"Timing Analysis Report - {self.component_name}")
        
        # Add timing analysis
        template = TimingTemplate(report)
        template.generate_page(self.component_name, timing_data)
        
        # Add template elements
        report.add_template(template.elements)
        
        # Save report
        report.save()

        return report_path

    def _get_component_dir(self) -> Path:
        """Get component directory path"""
        if self.base_dir:
            component_dir = Path(self.base_dir)
            if component_dir.exists():
                return component_dir
                
        from .utils import find_component_directory
        component_dir = find_component_directory(self.component_name)
        if not component_dir:
            raise FileNotFoundError(f"Component directory not found for {self.component_name}")
        return Path(component_dir)

    def _get_script_path(self) -> Path:
        """Get path for Vivado script"""
        return self._get_component_dir() / f"{self.component_name}_timing.tcl"

    def _get_report_path(self) -> Path:
        """Get path for timing report"""
        return self._get_component_dir() / f"{self.component_name}_timing_summary.rpt"

    def _get_pdf_path(self) -> Path:
        """Get path for PDF report"""
        return self._get_component_dir() / f"{self.component_name}_timing_report.pdf"

    def _collect_source_files(self) -> List[str]:
        """Collect Verilog source files"""
        component_dir = self._get_component_dir()
        return [str(f) for f in component_dir.rglob("*.v") 
                if not f.name.startswith("tb_")]