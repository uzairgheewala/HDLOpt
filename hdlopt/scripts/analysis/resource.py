import os
import json
import math
import subprocess
from pathlib import Path
from typing import Dict, List, Optional, Union
from dataclasses import dataclass

from ..logger import logger
from ..config import EnvironmentSetup
from .netlist import parse_netlist, NetlistAnalyzer
from ..reporting.generator import PDFReportGenerator
from ..reporting.templates.resource import YosysResourceTemplate

@dataclass
class ResourceAnalysisConfig:
    """Configuration for resource analysis"""
    increment_rules: Optional[Dict] = None
    param_ranges: Optional[Dict] = None
    recursive: bool = False
    analysis_depth: int = 1

class ResourceAnalyzer:
    """Analyzes HDL component resource usage using Yosys"""
    
    def __init__(self, component_name: str, 
                 config: Optional[ResourceAnalysisConfig] = None,
                 base_dir: Optional[str] = None):
        self.component_name = component_name
        self.config = config or ResourceAnalysisConfig()
        self.base_dir = base_dir
        self.env = EnvironmentSetup()
        self.netlist_analyzer = NetlistAnalyzer()

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

    def analyze(self) -> Dict:
        """Run resource analysis and generate report
        
        Returns:
            Dict containing analysis results
        """
        logger.info(f"Starting resource analysis for {self.component_name}")
        
        try:
            # Setup environment
            self.env.setup_yosys()
            
            # Generate netlist
            netlist = self._run_yosys()
            
            # Analyze netlist
            analyses = self._analyze_netlist(netlist)
            
            # Generate report
            self._generate_report(analyses)
            
            return analyses
            
        except Exception as e:
            logger.error(f"Resource analysis failed: {str(e)}")
            raise
        finally:
            self.env.teardown()

    def _run_yosys(self) -> Dict:
        """Run Yosys to generate netlist"""
        logger.debug(f"Running Yosys for {self.component_name}")
        
        cmd = ["yosys", "-p"]
        
        # Create synthesis commands
        synth_commands = [
            f"read_verilog {' '.join(self._collect_source_files())}",
            f"synth -top {self.component_name}",
            f"write_json {self._get_netlist_path()}",
            "stat"
        ]
        
        cmd.append("; ".join(synth_commands))
        
        try:
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            if result.returncode != 0:
                raise subprocess.CalledProcessError(
                    result.returncode, cmd, result.stdout, result.stderr
                )
            logger.debug(f"Yosys output:\n{result.stdout}")
            
            return parse_netlist(self._get_netlist_path())
        except subprocess.CalledProcessError as e:
            logger.error(f"Yosys execution failed:\n{e.stderr}")
            raise
            
    def _generate_yosys_script(self) -> str:
        """Generate Yosys synthesis script"""
        src_files = self._collect_source_files()
        
        script = []
        for src_file in src_files:
            script.append(f"read_verilog {src_file}")
            
        script.extend([
            f"synth -top {self.component_name}",
            f"write_json {self._get_netlist_path()}",
            "stat"
        ])
        
        return "\n".join(script)

    def _collect_source_files(self) -> List[str]:
        """Collect Verilog source files"""
        src_dir = self._get_component_dir() 
        return [str(f) for f in src_dir.rglob("*.v") 
                if not f.name.startswith("tb_")]

    def _analyze_netlist(self, netlist: Dict) -> Dict:
        """Analyze netlist structure and metrics"""
        analyses = {}
        
        # Get parameter configurations
        param_configs = self._get_parameter_configs()
        
        for param_config in param_configs:
            # Update parameters if needed
            if param_config != param_configs[0]:
                self._update_parameters(param_config)
                netlist = self._run_yosys()
                
            # Analyze with current parameters  
            analysis = self.netlist_analyzer.analyze(
                netlist,
                self.component_name,
                param_config,
                self.config
            )
            
            # Use consistent key format
            key = self._get_param_key(param_config)
            analyses[key] = analysis
            
        return analyses
    
    def _get_param_key(self, param_config: Dict) -> str:
        """Get consistent string key for parameter configuration"""
        # For simple single-parameter configs, use just the value
        if len(param_config) == 1 and "WIDTH" in param_config:
            return str(param_config["WIDTH"])
        # Otherwise use full dict representation
        return str(param_config)

    def _generate_report(self, analyses: Dict):
        """Generate PDF report of analysis results"""
        report_path = self._get_report_path()
        
        # Create report generator
        report = PDFReportGenerator(str(report_path))
        
        # Add title page
        report.add_title_page(f"Resource Usage Report - {self.component_name}")
        
        # Add resource analysis
        template = YosysResourceTemplate(report)
        template.generate_page(self.component_name, analyses)
        
        # Add template elements
        report.add_template(template.elements)
        
        # Save report
        report.save()

    def _get_netlist_path(self) -> Path:
        """Get netlist output path"""
        return self._get_component_dir() / f"{self.component_name}_netlist.json"

    def _get_report_path(self) -> Path:
        """Get report output path"""
        return self._get_component_dir() / f"{self.component_name}_resusage_report.pdf"

    def _write_yosys_script(self, script_content: str) -> Path:
        """Write Yosys synthesis script to file
        
        Args:
            script_content: Yosys script content
            
        Returns:
            Path to script file
        """
        script_path = self._get_component_dir() / f"{self.component_name}_script.ys"
        script_path.write_text(script_content)
        return script_path

    def _get_parameter_configs(self) -> List[Dict]:
        """Get parameter configurations to analyze
        
        Extracts parameter configurations from testbench files or uses config
        if provided.
        
        Returns:
            List of parameter value dictionaries
        """
        if self.config.param_ranges:
            return self._generate_param_configs()
            
        # Extract from testbenches
        configs = []
        component_dir = self._get_component_dir()
        
        for tb_file in component_dir.glob("tb_*.v"):
            params = self._extract_params_from_testbench(tb_file)
            if params and params not in configs:
                configs.append(params)
                
        if not configs:
            # Fall back to parameters in component details
            details_file = component_dir / f"{self.component_name}_details.json"
            if details_file.exists():
                with open(details_file) as f:
                    details = json.load(f)
                    if "parameters" in details:
                        configs.append({
                            p["name"]: int(p["value"]) 
                            for p in details["parameters"]
                        })
                        
        return sorted(configs, key=lambda x: str(x))

    def _generate_param_configs(self) -> List[Dict]:
        """Generate parameter configurations from ranges
        
        Returns:
            List of parameter value dictionaries
        """
        from itertools import product
        
        param_names = list(self.config.param_ranges.keys())
        param_values = [range(*r) for r in self.config.param_ranges.values()]
        
        return [
            dict(zip(param_names, values))
            for values in product(*param_values)
        ]

    def _extract_params_from_testbench(self, tb_path: Path) -> Optional[Dict]:
        """Extract parameter values from testbench filename
        
        Args:
            tb_path: Path to testbench file
            
        Returns:
            Dictionary of parameter values if found
        """
        # Parse filename like tb_WIDTH4_N8_test_component.v
        params = {}
        parts = tb_path.stem.split('_')[1:-1]  # Skip tb_ and component name
        
        for part in parts:
            # Find where digits start
            for i, c in enumerate(part):
                if c.isdigit():
                    name = part[:i]
                    try:
                        value = int(part[i:])
                        params[name] = value
                    except ValueError:
                        continue
                    break
                    
        return params if params else None

    def _update_parameters(self, param_config: Dict):
        """Update parameters in source files
        
        Args:
            param_config: New parameter values
        """
        verilog_file = self._get_component_dir() / f"{self.component_name}.v"
        
        with open(verilog_file) as f:
            content = f.read()
    
        # Check each parameter exists in file
        for param_name in param_config:
            if f"parameter {param_name}" not in content:
                raise ValueError(f"Invalid parameter: {param_name}")
        
        # Extract parameter block
        param_start = content.find("parameter")
        if param_start == -1:
            raise ValueError("No parameters found in file")
            
        param_end = content.find(")", param_start)
        param_block = content[param_start:param_end]
        
        # Update each parameter
        new_params = []
        for line in param_block.split("\n"):
            if "parameter" in line:
                for param_name, new_value in param_config.items():
                    if f"parameter {param_name}" in line:
                        line = f"parameter {param_name} = {new_value}"
                        break
            new_params.append(line)
        
        # Replace parameter block
        new_content = content[:param_start] + "\n".join(new_params) + content[param_end:]
        
        with open(verilog_file, "w") as f:
            f.write(new_content)
            
    def _calculate_increment_step(self, start_value: int) -> int:
        """Calculate parameter increment step for $clog2 change
        
        Args:
            start_value: Starting parameter value
            
        Returns:
            Increment needed for $clog2 to change
        """
        def clog2(n):
            return math.ceil(math.log2(n)) if n > 0 else 0
            
        current = clog2(start_value)
       # Find next power of 2 after start_value
        next_power = 2 ** (current + 1)
        
        # Return difference needed to reach next power of 2
        return next_power - start_value
    
    def _collect_raw_gates(self, module_info: Dict, 
                        netlist: Dict, raw_gates: Dict) -> None:
        """Recursively collect raw gate counts
        
        Args:
            module_info: Module data from netlist
            netlist: Complete netlist
            raw_gates: Dictionary to update with counts
        """
        for cell in module_info["cells"].values():
            cell_type = cell["type"] 
            
            if cell_type in netlist["modules"]:
                # Recurse into submodule
                self._collect_raw_gates(
                    netlist["modules"][cell_type],
                    netlist,
                    raw_gates
                )
            else:
                # Update raw gate count
                if cell_type not in raw_gates:
                    raw_gates[cell_type] = 0
                raw_gates[cell_type] += 1