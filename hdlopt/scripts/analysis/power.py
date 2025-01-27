from dataclasses import dataclass
from typing import Dict, List, Optional
import os
import json
from pathlib import Path
import subprocess

from ..logger import logger
from ..config import EnvironmentSetup
from ..reporting.generator import PDFReportGenerator
from ..reporting.templates.power import PowerTemplate


@dataclass
class PowerSummary:
    """Summary of power consumption"""

    total_on_chip: float
    dynamic: float
    static: float
    device_static: float
    effective_thetaja: float
    max_ambient: float
    junction_temp: float


@dataclass
class ComponentPower:
    """Power consumption for a component"""

    name: str
    power: float
    used: int
    available: int
    utilization: float


@dataclass
class PowerSupply:
    """Power supply characteristics"""

    source: str
    voltage: float
    total_current: float
    dynamic_current: float
    static_current: float
    powerup_current: float
    budget: float
    margin: float


class PowerAnalyzer:
    """Analyzes HDL component power consumption using Vivado"""

    def __init__(self, component_name: str, base_dir: Optional[str] = None):
        self.component_name = component_name
        self.base_dir = base_dir
        self.env = EnvironmentSetup()

    def analyze(self) -> Dict:
        """Run power analysis and generate report

        Returns:
            Dict containing analysis results
        """
        logger.info(f"Starting power analysis for {self.component_name}")

        try:
            # Setup environment
            # self.env.setup_vivado()

            # Generate and run Vivado script
            self._run_vivado()

            # Parse power report
            power_data = self._parse_power_report()

            # Generate report
            report_path = self._generate_report(power_data)

            return power_data, report_path

        except Exception as e:
            logger.error(f"Power analysis failed: {str(e)}")
            raise
        finally:
            self.env.teardown()

    def _run_vivado(self) -> None:
        """Run Vivado synthesis and power analysis"""
        tcl_script = self._generate_tcl_script()
        script_path = self._get_script_path()

        # Write TCL script directly with commands to ensure they appear in output
        script_content = f"""
    create_project {self.component_name}_power -part xc7a35tcsg324-1
    add_files {{ {' '.join(str(f) for f in self._collect_source_files())} }}
    set_property top {self.component_name} [current_fileset]
    synth_design -top {self.component_name}
    launch_runs synth_1
    wait_on_run synth_1
    open_run synth_1
    report_power -file {str(self._get_report_path())}
    close_project
    """

        with open(script_path, "w") as f:
            f.write(script_content)

        try:
            result = subprocess.run(
                [
                    "vivado",
                    "-mode",
                    "batch",
                    "-nolog",
                    "-nojournal",
                    "-source",
                    str(script_path),
                ],
                check=False,
                capture_output=True,
                text=True,
            )
            if result.returncode != 0:
                raise subprocess.CalledProcessError(
                    result.returncode,
                    result.args,
                    output=result.stdout,
                    stderr=result.stderr,
                )
        except Exception as e:
            logger.error(f"Vivado execution failed: {str(e)}")
            raise

    def _generate_tcl_script(self) -> str:
        """Generate Vivado TCL script for power analysis"""
        source_files = [
            str(f) for f in self._collect_source_files()
        ]  # Convert paths to strings
        script = [
            f"create_project {self.component_name}_power -part xc7a35tcsg324-1",
            *[f"add_files {f}" for f in source_files],
            f"set_property top {self.component_name} [current_fileset]",
            "synth_design -top $component_name",
            "launch_runs synth_1",
            "wait_on_run synth_1",
            "open_run synth_1",
            f"report_power -file {str(self._get_report_path())}",  # Convert path to string
            "close_project",
        ]

        return "\n".join(script)

    def _parse_power_report(self) -> Dict:
        """Parse Vivado power report"""
        try:
            with open(self._get_report_path()) as f:
                lines = f.readlines()

            return {
                "summary": self._parse_summary(lines),
                "on_chip_components": self._parse_on_chip_components(lines),
                "power_supply": self._parse_power_supply(lines),
                "confidence": self._parse_confidence(lines),
                "environment": self._parse_environment(lines),
                "hierarchy": self._parse_hierarchy(lines),
            }
        except Exception as e:
            logger.error(f"Failed to parse power report: {str(e)}")
            raise

    def _parse_power_supply(self, lines: List[str]) -> List[PowerSupply]:
        """Parse power supply section"""
        supplies = []
        in_section = False
        header_found = False

        for line in lines:
            line = line.strip()

            if "1.2 Power Supply Summary" in line:
                in_section = True
                continue
            elif in_section and "| Source" in line:
                header_found = True
                continue
            elif "1.3" in line:  # Next section
                break

            if in_section and header_found and "|" in line:
                parts = [p.strip() for p in line.split("|") if p.strip()]
                if len(parts) >= 5:
                    try:
                        supplies.append(
                            PowerSupply(
                                source=parts[0],
                                voltage=float(parts[1].split()[0]),
                                total_current=float(parts[2]),
                                dynamic_current=float(parts[3]),
                                static_current=float(parts[4]),
                                powerup_current=0.0,  # Default values for optional fields
                                budget=1.0,
                                margin=0.0,
                            )
                        )
                    except (ValueError, IndexError) as e:
                        logger.error(
                            f"Failed to parse power supply line '{line}': {str(e)}"
                        )

        return supplies

    def _parse_summary(self, lines: List[str]) -> PowerSummary:
        """Parse power summary section"""
        summary = {
            "total_on_chip": 0.0,
            "dynamic": 0.0,
            "static": 0.0,
            "device_static": 0.0,
            "effective_thetaja": 0.0,
            "max_ambient": 0.0,
            "junction_temp": 0.0,
        }

        for line in lines:
            if "|" in line:
                parts = [p.strip() for p in line.split("|")]
                if len(parts) >= 2:
                    value_str = parts[1].split()[0] if parts[1].split() else "0.0"

                    try:
                        if "Total On-Chip Power" in parts[0]:
                            summary["total_on_chip"] = float(value_str)
                        elif "Dynamic" in parts[0]:
                            summary["dynamic"] = float(value_str)
                        elif "Device Static" in parts[0]:
                            summary["device_static"] = float(value_str)
                            summary["static"] = float(value_str)
                    except ValueError:
                        logger.error(f"Failed to parse power value: {value_str}")

        return PowerSummary(**summary)

    def _parse_on_chip_components(self, lines: List[str]) -> List[ComponentPower]:
        """Parse on-chip components section"""
        components = []
        capture = False

        for line in lines:
            if "1.1 On-Chip Components" in line:
                capture = True
            elif "1.2 Power Supply Summary" in line:
                capture = False
            elif capture and "|" in line:
                parts = [p.strip() for p in line.split("|") if p.strip()]
                if len(parts) == 5:
                    try:
                        power = float(parts[1].split()[0])
                        used = int(parts[2]) if parts[2] != "N/A" else 0
                        available = int(parts[3]) if parts[3] != "N/A" else 0
                        util = float(parts[4].rstrip("%")) if parts[4] != "N/A" else 0.0

                        components.append(
                            ComponentPower(
                                name=parts[0],
                                power=power,
                                used=used,
                                available=available,
                                utilization=util,
                            )
                        )
                    except (ValueError, IndexError):
                        continue

        return components

    def _parse_confidence(self, lines: List[str]) -> Dict:
        """Parse confidence level section"""
        confidence = {}
        capture = False

        for line in lines:
            if "1.3 Confidence Level" in line:
                capture = True
            elif "2. Settings" in line:
                capture = False
            elif capture and "|" in line:
                parts = [p.strip() for p in line.split("|") if p.strip()]
                if len(parts) == 4:
                    confidence[parts[0]] = {
                        "level": parts[1],
                        "details": parts[2],
                        "action": parts[3],
                    }

        return confidence

    def _parse_environment(self, lines: List[str]) -> Dict:
        """Parse environment settings section"""
        environment = {}
        capture = False

        for line in lines:
            if "2.1 Environment" in line:
                capture = True
            elif "2.2 Clock Constraints" in line:
                capture = False
            elif capture and "|" in line:
                parts = [p.strip() for p in line.split("|") if p.strip()]
                if len(parts) == 2:
                    try:
                        key = parts[0].lower().replace(" ", "_")
                        value = float(parts[1].split()[0])
                        environment[key] = value
                    except (ValueError, IndexError):
                        environment[key] = parts[1]

        return environment

    def _parse_hierarchy(self, lines: List[str]) -> Dict:
        """Parse power by hierarchy section"""
        hierarchy = {}
        capture = False

        for line in lines:
            if "3.1 By Hierarchy" in line:
                capture = True
                continue
            elif capture and "|" in line:
                parts = [p.strip() for p in line.split("|") if p.strip()]
                if len(parts) == 2:
                    try:
                        hierarchy[parts[0]] = float(parts[1].split()[0])
                    except (ValueError, IndexError):
                        continue

        return hierarchy

    def _generate_report(self, power_data: Dict) -> None:
        """Generate PDF report of power analysis results"""
        report_path = self._get_pdf_path()

        # Create report generator
        report = PDFReportGenerator(str(report_path))

        # Add title page
        report.add_title_page(f"Power Analysis Report - {self.component_name}")

        # Add power analysis
        template = PowerTemplate(report)
        template.generate_page(self.component_name, power_data)

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
            raise FileNotFoundError(
                f"Component directory not found for {self.component_name}"
            )
        return Path(component_dir)

    def _get_script_path(self) -> Path:
        """Get path for Vivado script"""
        return self._get_component_dir() / f"{self.component_name}_power.tcl"

    def _get_report_path(self) -> Path:
        """Get path for power report"""
        return self._get_component_dir() / f"{self.component_name}_power_summary.rpt"

    def _get_pdf_path(self) -> Path:
        """Get path for PDF report"""
        return self._get_component_dir() / f"{self.component_name}_power_report.pdf"

    def _collect_source_files(self) -> List[str]:
        """Collect Verilog source files"""
        component_dir = self._get_component_dir()
        return [
            str(f) for f in component_dir.rglob("*.v") if not f.name.startswith("tb_")
        ]
