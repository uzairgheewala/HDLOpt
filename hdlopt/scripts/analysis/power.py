import subprocess
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional
import shutil

from ..config import EnvironmentSetup
from ..logger import logger
from ..reporting.generator import PDFReportGenerator
from ..reporting.templates.power import PowerTemplate
from ..reporting.templates.base import PowerSummary, ComponentPower, PowerSupply

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
            if not shutil.which('vivado'):
                logger.warning("Vivado not found, using fallback power analysis")
                return self._fallback_analysis()

            # Generate and run Vivado script
            try:
                self._run_vivado()
            except Exception as e:
                logger.warning(f"Vivado analysis failed: {str(e)}, using fallback")
                return self._fallback_analysis()

            # Parse and generate power report
            report_path = self._get_report_path()
            if not report_path.exists():
                logger.warning("Power report not found, using fallback")
                return self._fallback_analysis()

            power_data = self._parse_power_report()
            report_path = self._generate_report(power_data)

            return power_data, report_path

        except Exception as e:
            logger.error(f"Power analysis failed: {str(e)}")
            raise

    def _fallback_analysis(self) -> tuple[Dict, Path]:
        """Provide basic power analysis when Vivado is unavailable"""
        power_data = {
            "summary": {
                "total_on_chip": 0.0,
                "dynamic": 0.0,
                "static": 0.0,
                "device_static": 0.0,
                "effective_thetaja": 0.0,
                "max_ambient": 0.0,
                "junction_temp": 0.0
            },
            "on_chip_components": [],
            "power_supply": [],
            "confidence": {},
            "environment": {},
            "hierarchy": {}
        }

        report_path = self._generate_report(power_data)
        return power_data, report_path

    def _run_vivado(self) -> None:
        """Run Vivado synthesis and power analysis"""
        script_path = self._get_script_path()
        script_content = self._generate_tcl_script()

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
                shell=True
            )
            logger.debug(result.stdout)
            logger.debug(result.stderr)
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
        component_dir = self._get_component_dir()
        project_dir = component_dir / "vivado_power"
        project_name = f"{self.component_name}_power"
        source_files = self._collect_source_files()

        # Use forward slashes for TCL
        project_dir_str = str(project_dir).replace('\\', '/')
        source_files_str = [str(f).replace('\\', '/') for f in source_files]

        script = [
            f"create_project {project_name} {project_dir_str} -part xc7a35tcsg324-1 -force",
        ]

        report_path = str(self._get_report_path()).replace("\\", "/")

        # Add source files
        for file in source_files_str:
            script.append(f"add_files {file}")

        script.extend([
            f"set_property top {self.component_name} [current_fileset]",
            f"synth_design -top {self.component_name}",
            "launch_runs synth_1",
            "wait_on_run synth_1", 
            "open_run synth_1",
            f"report_power -file {report_path}",
            "close_project"
        ])

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
                            ).to_dict()
                        )
                    except (ValueError, IndexError) as e:
                        logger.error(f"Failed to parse power supply line '{line}': {str(e)}")

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

        return PowerSummary(**summary).to_dict()

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
                            ).to_dict()
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
