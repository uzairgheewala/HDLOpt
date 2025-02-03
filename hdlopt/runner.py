import argparse
import importlib
import importlib.util
import inspect
import json
import logging
import os
import sys
import shutil
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum, auto
from pathlib import Path
from typing import Dict, List, Optional
import subprocess

from hdlopt.rules.base import Rule
from hdlopt.scripts.analysis.netlist import NetlistAnalyzer, parse_netlist
from hdlopt.scripts.analysis.power import PowerAnalyzer
from hdlopt.scripts.analysis.schematic import SchematicGenerator
from hdlopt.scripts.analysis.timing import TimingAnalyzer
from hdlopt.scripts.analysis.waveform import WaveformAnalyzer
from hdlopt.scripts.directory_structure import (
    create_directory_structure,
    print_directory_structure,
)
from hdlopt.scripts.experiment_manager import ExperimentConfig, ExperimentManager
from hdlopt.scripts.logger import logger
from hdlopt.scripts.parsing.base import ParserMode
from hdlopt.scripts.parsing.factory import VerilogParser
from hdlopt.scripts.reporting.generator import PDFReportGenerator
from hdlopt.scripts.testbench.manager import IntegratedTestManager
from hdlopt.scripts.testbench.runner import TestbenchRunner
from hdlopt.config_manager import ConfigManager


class AnalysisType(Enum):
    TESTBENCH = auto()
    NETLIST = auto()
    TIMING = auto()
    POWER = auto()
    WAVEFORM = auto()
    SCHEMATIC = auto()
    ALL = auto()

    def __str__(self):
        return self.name  # Ensure name is used in serialization


@dataclass
class RunnerConfig:
    """Configuration for analysis runner.

    Attributes:
        analyses: List of analyses to run
        output_dir: Output directory for generated files
        combine_pdfs: Whether to combine all PDFs into one
        simulator: Simulator to use (modelsim/iverilog)
        generate_waves: Whether to generate waveforms
        recursive: Whether to analyze submodules
        verbose: Logging verbosity level
        experiment_name: Optional name for experiment tracking
        experiment_version: Version string for experiment tracking
        experiment_desc: Optional description for experiment tracking
        experiment_tags: Optional tags for experiment tracking
    """

    analyses: List[AnalysisType] = None
    output_dir: str = "generated"
    src_dir: str = "src"
    combine_pdfs: bool = True
    simulator: str = "modelsim"
    parser: str = "native"
    generate_waves: bool = True
    recursive: bool = True
    verbose: bool = False
    experiment_name: Optional[str] = None
    experiment_version: str = "1.0"
    experiment_desc: Optional[str] = None
    experiment_tags: Optional[Dict[str, str]] = None
    last_updated: str = field(default_factory=lambda: datetime.now().isoformat())
    timeout: int = float('inf')

    def __post_init__(self):
        if self.analyses is None or (
            len(self.analyses) == 1 and self.analyses[0] == AnalysisType.ALL
        ):
            self.analyses = list(AnalysisType)

        # Set default experiment name if not provided
        if self.experiment_name is None:
            self.experiment_name = f"hdl_analysis_{datetime.now().strftime('%Y%m%d')}"


class HDLAnalysisRunner:
    """Main class for running HDL analysis pipeline."""

    def __init__(self, config: RunnerConfig):
        """Initialize HDLAnalysisRunner with configuration.

        Args:
            config: Configuration object
        """
        self.config = config
        self.output_dir = Path(config.output_dir)
        self.src_dir = Path(config.src_dir)

        # Setup logging
        self.setup_logging()

        # Initialize TestbenchRunner
        self.tb_runner = TestbenchRunner(
            simulator=config.simulator, work_dir=Path(config.output_dir), timeout=self.config.timeout
        )

        # Initialize ExperimentManager with configuration
        experiment_config = ExperimentConfig(
            name=config.experiment_name,
            version=config.experiment_version,
            description=config.experiment_desc,
            tags=config.experiment_tags,
            base_path=self.output_dir,
        )
        self.experiment_manager = ExperimentManager(experiment_config)

    def setup_logging(self):
        """Setup logging configuration."""
        level = logging.DEBUG if self.config.verbose else logging.INFO
        logger.setLevel(level)

        # Add console handler if not already present
        if not logger.handlers:
            console = logging.StreamHandler()
            console.setLevel(level)
            formatter = logging.Formatter(
                "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
            )
            console.setFormatter(formatter)
            logger.addHandler(console)

    def run(self, module_names: Optional[List[str]] = None) -> str:
        """Run analysis on specified modules or all modules in src directory.

        Args:
            module_names: Optional list of module names to analyze

        Returns:
            Run ID string for experiment tracking
        """
        try:
            # Get list of modules to analyze
            if module_names:
                modules = [self.src_dir / f"{name}.v" for name in module_names]
                for module in modules:
                    if not module.exists():
                        raise FileNotFoundError(f"Module {module} not found")
            else:
                # Get all .v files in src directory
                modules = list(self.src_dir.glob("*.v"))

            logger.info(
                f"Analyzing {len(modules)} modules: {[m.stem for m in modules]} with {self.config.simulator}"
            )

            # Start experiment run
            run_id = self.experiment_manager.start_run(
                components=modules, config=self.config.__dict__
            )

            try:
                # Run analyses for each module
                for module in modules:
                    metrics = self._analyze_module(module, run_id)
                    
                    # Update experiment metrics
                    if metrics:
                        self.experiment_manager.update_metrics(run_id, {
                            module.stem: metrics
                        })
            except Exception as e:
                logger.error(f"Analysis failed: {str(e)}")
                raise (e)
                # Still return run_id even if analysis failed
                return run_id

            return run_id

        except Exception as e:
            logger.error(f"Analysis failed: {str(e)}")
            raise

    def _analyze_module(self, module_path: Path, run_id: str) -> None:
        """Run analysis pipeline on a single module.

        Args:
            module_path: Path to module .v file
            run_id: Current experiment run ID
        """
        metrics = {}
        module_name = module_path.stem
        logger.info(f"Analyzing module: {module_name}")
        logger.debug(f"Module path: {module_path}")
        # print(self.output_dir, module_name, self.src_dir)

        # Step 1: Create directory structure
        module_dir = self.output_dir / module_name
        module_dir.mkdir(parents=True, exist_ok=True)

        hierarchy = {}
        hierarchy = create_directory_structure(
            str(os.path.basename(module_path)),
            str(self.src_dir),
            str(module_dir.parent),
            hierarchy,
        )

        # Save hierarchy
        hierarchy_path = module_dir / "hierarchy.json"
        with open(hierarchy_path, "w") as f:
            json.dump(hierarchy, f, indent=4)
        logger.info(f"Created directory structure at {module_dir}")
        logger.debug(f"Saved hierarchy to {hierarchy_path}")

        if self.config.verbose:
            print_directory_structure(str(module_dir.parent))

        # Step 2: Parse module details
        if self.config.parser == "native":
            parser_mode = ParserMode.NATIVE
        elif self.config.parser == "pyverilog":
            parser_mode = ParserMode.PYVERILOG
        else:
            parser_mode = ParserMode.NATIVE  # Default

        parser = VerilogParser.create(mode=parser_mode)
        logger.debug(f"Parsing module {module_name}")

        # Parse current module
        with open(module_path) as f:
            module_details = parser.parse_file(str(module_path))[0].to_dict()

        # Save current module details
        details_path = module_dir / f"{module_name}_details.json"
        with open(details_path, "w") as f:
            json.dump(module_details, f, indent=4)
        logger.info(f"Parsed details for module {module_name}")

        # Recursively parse submodules identified in hierarchy
        if module_name in hierarchy and hierarchy[module_name]:
            logger.debug(
                f"Found submodules for {module_name}: {hierarchy[module_name]}"
            )
            for submodule in hierarchy[module_name]:
                submodule_path = self.src_dir / f"{submodule}.v"
                if submodule_path.exists():
                    logger.debug(f"Parsing submodule {submodule}")
                    with open(submodule_path) as f:
                        submodule_details = parser.parse_file(str(submodule_path))[
                            0
                        ].to_dict()

                    # Save submodule details in submodule directory
                    submodule_dir = module_dir / submodule
                    submodule_dir.mkdir(exist_ok=True)

                    submodule_details_path = submodule_dir / f"{submodule}_details.json"
                    with open(submodule_details_path, "w") as f:
                        json.dump(submodule_details, f, indent=4)
                    logger.info(f"Parsed details for submodule {submodule}")
                else:
                    logger.warning(f"Submodule file not found: {submodule_path}")

        rules = self._find_rules_for_module(module_path)
        if not rules:
            logger.warning(
                f"No matching rules found for module {module_path.stem}"
            )

        # Add submodule rules
        if module_name in hierarchy:
            for submodule in hierarchy[module_name]:
                logger.debug(f"Checking rules for submodule: {submodule}")
                submodule_path = self.src_dir / f"{submodule}.v"
                if submodule_path.exists():
                    sub_rules = self._find_rules_for_module(submodule_path)
                    rules.extend(sub_rules)

        rules = list(set(rules))
        logger.debug(f"Found rules: {rules}")

        reports = []  # Track generated reports

        # Step 3: Generate and run testbench if requested
        if AnalysisType.TESTBENCH in self.config.analyses:
            logger.info(
                f"Generating testbench with {len(rules)} matching rules for {module_name}"
            )
            try:
                # Initialize IntegratedTestManager
                test_manager = IntegratedTestManager(
                    component_name=module_name,
                    rules=rules,
                    base_dir=str(module_dir),
                    max_parallel=4,
                    target_cases_per_file=1000,
                    simulator=self.config.simulator
                )

                # Load module details
                with open(module_dir / f"{module_name}_details.json") as f:
                    module_details = json.load(f)

                # Plan tests
                test_plan = test_manager.plan_tests(
                    module_details=module_details,
                    desired_cases=1000,
                    available_time=self.config.timeout
                )

                # Execute test plan
                results = test_manager.execute_test_plan(
                    plan=test_plan,
                    module_details=module_details,
                    recursive=self.config.recursive,
                )

                # Save results
                results_dict = [r.to_dict() for r in results]
                with open(module_dir / "testbench_results.json", "w") as f:
                    json.dump(results_dict, f, indent=4)

                # Save coverage artifacts
                coverage_dir = module_dir / "coverage_reports" / module_name
                if coverage_dir.exists():
                    self.experiment_manager.add_artifact(
                        run_id, f"{module_name}_coverage", coverage_dir
                    )

                logger.info("Completed integrated testbench execution")

            except Exception as e:
                logger.error(f"Test management failed: {str(e)}")
                raise e

        logger.debug(f"Analyses: {self.config.analyses}")

        # Step 4: Run requested analyses
        for analysis in self.config.analyses:
            logger.debug(f"Running analysis {analysis}")
            try:
                report = self._run_analysis(
                    analysis, module_name, module_dir, module_details
                )
                if report:
                    logger.debug(f"Report generated. {report}")
                    reports.append(report)
            except Exception as e:
                logger.error(
                    f"Failed to run {analysis.name} analysis: {str(e)}"
                )
                raise(e)

        # Track metrics for this module's analysis
        metrics = {
            f"{module_name}_hierarchy_depth": len(hierarchy),
            f"{module_name}_submodule_count": len(hierarchy.get(module_name, [])),
            f"{module_name}_file_count": len(reports),
            f"{module_name}_analyses_run": [
                a.name for a in self.config.analyses if a != AnalysisType.ALL
            ],
        }

        # Add netlist analysis metrics
        if AnalysisType.NETLIST in self.config.analyses:
            netlist_path = module_dir / f"{module_name}_netlist_analysis.json"
            if netlist_path.exists():
                with open(netlist_path) as f:
                    netlist_data = json.load(f)
                    metrics.update({
                        f"{module_name}_wire_count": netlist_data[module_name]['wire_count'],
                        f"{module_name}_wire_bits": netlist_data[module_name]['wire_bits'],
                        f"{module_name}_port_count": netlist_data[module_name]['port_count'],
                        f"{module_name}_port_bits": netlist_data[module_name]['port_bits'],
                        f"{module_name}_cell_count": netlist_data[module_name]['cell_count'],
                        f"{module_name}_hierarchy_depth": netlist_data[module_name]['hierarchy_depth'],
                        f"{module_name}_raw_gate_types": len(netlist_data[module_name]['raw_gates']),
                        f"{module_name}_total_raw_gates": sum(netlist_data[module_name]['raw_gates'].values()),
                        f"{module_name}_submodule_instances": sum(netlist_data[module_name]['sub_modules'].values() if netlist_data[module_name]['sub_modules'] else [0])
                    })

        # Add timing analysis metrics
        if AnalysisType.TIMING in self.config.analyses:
            timing_path = module_dir / f"{module_name}_timing.json"
            if timing_path.exists():
                with open(timing_path) as f:
                    timing_data = json.load(f)
                    # Basic timing metrics
                    timing_summary = timing_data.get('timing_summary', {})
                    metrics.update({
                        f"{module_name}_wns": timing_summary.get('wns', 0.0),
                        f"{module_name}_tns": timing_summary.get('tns', 0.0),
                        f"{module_name}_whs": timing_summary.get('whs', 0.0),
                        f"{module_name}_ths": timing_summary.get('ths', 0.0),
                        f"{module_name}_failing_endpoints": timing_summary.get('failing_endpoints', 0),
                        f"{module_name}_total_endpoints": timing_summary.get('total_endpoints', 0)
                    })
                    # Clock domain metrics
                    clock_summary = timing_data.get('clock_summary', [])
                    if clock_summary:
                        metrics[f"{module_name}_clock_domains"] = len(clock_summary)
                        metrics[f"{module_name}_max_clock_period"] = max(
                            c.get('period', 0.0) for c in clock_summary
                        )

        # Add power analysis metrics
        if AnalysisType.POWER in self.config.analyses:
            power_path = module_dir / f"{module_name}_power.json"
            if power_path.exists():
                with open(power_path) as f:
                    power_data = json.load(f)
                    power_summary = power_data.get('summary', {})
                    metrics.update({
                        f"{module_name}_total_power": power_summary.get('total_on_chip', 0.0),
                        f"{module_name}_dynamic_power": power_summary.get('dynamic', 0.0),
                        f"{module_name}_static_power": power_summary.get('static', 0.0),
                        f"{module_name}_junction_temp": power_summary.get('junction_temp', 0.0)
                    })
                    # Component power breakdown
                    components = power_data.get('on_chip_components', [])
                    if components:
                        metrics[f"{module_name}_power_components"] = len(components)
                        metrics[f"{module_name}_max_component_power"] = max(
                            c.get('power', 0.0) for c in components
                        )

        # Add testbench metrics
        if AnalysisType.TESTBENCH in self.config.analyses:
            test_results_path = module_dir / "testbench_results.json"
            if test_results_path.exists():
                with open(test_results_path) as f:
                    results = json.load(f)
                    test_metrics = {
                        f"{module_name}_total_tests": len(results),
                        f"{module_name}_passed_tests": sum(
                            1 for r in results if r.get("passed", False)
                        ),
                        f"{module_name}_failed_tests": sum(
                            1 for r in results if not r.get("passed", False)
                        ),
                        f"{module_name}_test_coverage": sum(
                            1 for r in results if r.get("passed", False)
                        ) / len(results) if results else 0
                    }
                    metrics.update(test_metrics)

        # Add schematic metrics
        if AnalysisType.SCHEMATIC in self.config.analyses:
            schematic_path = module_dir / f"{module_name}_schematic.pdf"
            if schematic_path.exists():
                metrics[f"{module_name}_has_schematic"] = True
                # Could add more metrics like schematic complexity, node count, etc.


        # Update experiment metrics
        self.experiment_manager.update_metrics(run_id, metrics)

        # Step 5: Combine reports if requested
        if self.config.combine_pdfs and reports:
            try:
                # Filter out None values and check paths exist
                valid_reports = [r for r in reports if r and Path(r).exists() and str(r).endswith('.pdf')]

                if valid_reports:
                    combined_report = PDFReportGenerator(
                        str(module_dir / f"{module_name}_analysis.pdf")
                    )
                    combined_report.merge_pdfs(
                        valid_reports, str(module_dir / f"{module_name}_analysis.pdf")
                    )
                    logger.info("Generated combined analysis report")
                else:
                    logger.warning("No valid reports to combine")
            except Exception as e:
                logger.error(f"Failed to combine PDFs: {str(e)}")

            # Track reports as artifacts
            if valid_reports:
                for report in valid_reports:
                    self.experiment_manager.add_artifact(
                        run_id, f"{module_name}_{Path(report).stem}", Path(report)
                    )

    def _find_rules_for_module(self, module_path: Path) -> List[Rule]:
        """Find all rules that apply to a given module.
        
        Checks both package rules and local working directory rules.

        Args:
            module_path: Path to module .v file
            
        Returns:
            List of applicable Rule instances
        """
        logger.debug(f"Finding rules for module: {module_path.stem}")
        rules = []

        # Define and create local rules directory if it doesn't exist
        local_rules_dir = Path.cwd() / "rules"
        if not local_rules_dir.exists():
            local_rules_dir.mkdir(parents=True)
            # Copy default rules to local directory
            self._setup_default_rules(local_rules_dir)
        
        # Search in package rules directory
        package_rules_dir = Path(__file__).parent / "rules"
        
        # Search both locations for rules
        for rules_dir in [package_rules_dir, local_rules_dir]:
            logger.debug(f"Searching for rules in: {rules_dir}")
            
            for rule_file in rules_dir.glob("*.py"):
                if rule_file.name in ["__init__.py", "base.py", "__pycache__"]:
                    continue

                try:
                    if rules_dir == package_rules_dir:
                        module_name = f"hdlopt.rules.{rule_file.stem}"
                    else:
                        # Add local directory to Python path temporarily
                        sys.path.insert(0, str(local_rules_dir.parent))
                        module_name = f"rules.{rule_file.stem}"
                    
                    try:
                        rule_module = importlib.import_module(module_name)
                        
                        for name, obj in inspect.getmembers(rule_module):
                            if inspect.isclass(obj) and issubclass(obj, Rule) and obj != Rule:
                                rule = obj()
                                if rule.matches(module_path.stem):
                                    logger.debug(f"Rule {name} matches {module_path.stem}")
                                    rules.append(rule)
                    finally:
                        if rules_dir != package_rules_dir:
                            sys.path.pop(0)  # Remove local dir from path

                except Exception as e:
                    logger.error(f"Error checking rule {rule_file.name}: {str(e)}")

        return rules
    
    def _setup_default_rules(self, local_rules_dir: Path) -> None:
        """Set up default rules in local directory.
        
        Args:
            local_rules_dir: Path to local rules directory
        """
        # Create __init__.py
        (local_rules_dir / "__init__.py").touch()
        
        # Copy base.py
        shutil.copy(Path(__file__).parent / "rules" / "base.py", 
                    local_rules_dir / "base.py")
        
        # Create example_rule.py
        example_rule = """from .base import Rule
    from ..patterns.string_match import StringMatchPattern

    class ExampleModuleRule(Rule):
        def __init__(self, default_bit_width=8):
            super().__init__(
                input_vars=["clk", "rst_n", "data_in"],
                output_vars=["data_out"],
                name="ExampleModuleRule",
                pattern=StringMatchPattern("example_module"),
                default_bit_width=default_bit_width
            )

        def generate_expected(self, test_case):
            \"\"\"Generate expected outputs for given inputs.\"\"\"
            # Simple register behavior: data_out follows data_in
            # Reset puts zeros on output
            if test_case["rst_n"] == 0:
                return {
                    "data_out": 0
                }
            else:
                return {
                    "data_out": test_case["data_in"]
                }
    """
        with open(local_rules_dir / "example_rule.py", 'w') as f:
            f.write(example_rule)

    def _run_analysis(
        self,
        analysis: AnalysisType,
        module_name: str,
        module_dir: Path,
        module_details: Dict,
    ) -> Optional[Path]:
        """Run a specific analysis type.

        Args:
            analysis: Type of analysis to run
            module_name: Name of module being analyzed
            module_dir: Output directory for module
            module_details: Parsed module details

        Returns:
            Path to generated report if any
        """
        logger.info(f"Running {analysis.name} analysis")

        if analysis == AnalysisType.NETLIST:
            try:
                analyzer = NetlistAnalyzer()

                # Step 1: Generate netlist using Yosys
                netlist_path = module_dir / f"{module_name}_netlist.json"
                
                # Create Yosys script
                script = [
                    f"read_verilog {module_dir / f'{module_name}.v'}",
                    f"hierarchy -top {module_name}",
                    "proc",
                    "opt",
                    "fsm",
                    "opt",
                    "memory",
                    "opt",
                    f"write_json {netlist_path}"
                ]
                
                script_path = module_dir / "netlist.ys"
                with open(script_path, 'w') as f:
                    f.write('\n'.join(script))

                # Run Yosys
                subprocess.run(["yosys", "-q", str(script_path)], check=True)
                
                if not netlist_path.exists():
                    raise FileNotFoundError(f"Yosys failed to generate netlist at {netlist_path}")

                # Step 2: Parse and analyze netlist
                netlist = parse_netlist(str(netlist_path))

                logger.debug(f"netlist: {netlist}")
                
                # Get parameter config from module details
                param_config = {
                    param["name"]: int(param["value"]) 
                    for param in module_details.get("parameters", [])
                }
                
                # Create basic config object with increment rules
                class Config:
                    def __init__(self):
                        self.increment_rules = {}
                        
                config = Config()

                # Run analysis
                analysis_results = analyzer.analyze(
                    netlist=netlist,
                    module_name=module_name,
                    param_config=param_config,
                    config=config
                )

                analysis_dict = {
                    module: metrics.to_dict() 
                    for module, metrics in analysis_results.items()
                }

                # Save analysis results
                with open(module_dir / f"{module_name}_netlist_analysis.json", "w") as f:
                    json.dump(analysis_dict, f, indent=4)

                return netlist_path

            except subprocess.CalledProcessError as e:
                logger.error(f"Yosys execution failed: {e.stderr}")
                raise
            except Exception as e:
                logger.error(f"Netlist analysis failed: {str(e)}")
                raise

        elif analysis == AnalysisType.TIMING:
            analyzer = TimingAnalyzer(module_name, base_dir=str(module_dir))
            timing_data, report_path = analyzer.analyze()

           # print(timing_data, report_path)

            # Save timing data
            with open(module_dir / f"{module_name}_timing.json", "w") as f:
                json.dump(timing_data, f, indent=4)

            # report_path = module_dir / f"{module_name}_timing_report.pdf"
            # analyzer.generate_report(timing_data)
            return report_path

        elif analysis == AnalysisType.POWER:
            analyzer = PowerAnalyzer(module_name, base_dir=str(module_dir))
            power_data, report_path = analyzer.analyze()

            #print(power_data, report_path)

            with open(module_dir / f"{module_name}_power.json", "w") as f:
                json.dump(power_data, f, indent=4)

            # report_path = module_dir / f"{module_name}_power_report.pdf"
            # analyzer.generate_report(power_data)
            return report_path
        
        elif analysis == AnalysisType.WAVEFORM:
            if self.config.generate_waves:
                analyzer = WaveformAnalyzer(module_name, base_dir=str(module_dir))
                wave_data = {}
                
                # Look for all VCD files matching our naming pattern
                vcd_files = list(module_dir.glob("*__wave.vcd"))
                if not vcd_files:
                    logger.warning(f"No VCD files found in {module_dir}")
                    return None
                    
                logger.debug(f"Found {len(vcd_files)} VCD files: {vcd_files}")
                for vcd_file in vcd_files:
                    # Each VCD file name indicates parameter combination
                    param_str = vcd_file.stem.split('__')[0]  # Get part before __wave
                    try:
                        file_data = analyzer.analyze(vcd_file)
                        wave_data[param_str] = file_data
                        logger.debug(f"Analyzed waveform for {param_str}")
                    except Exception as e:
                        logger.error(f"Failed to analyze VCD file {vcd_file}: {str(e)}")

                # Generate report with all waveform data
                report_path = module_dir / f"{module_name}_waveform_report.pdf"
                analyzer.generate_report(wave_data)
                logger.debug(f"Generated waveform report at {report_path}")
                return report_path

            return None

        elif analysis == AnalysisType.SCHEMATIC:
            generator = SchematicGenerator(module_name, base_dir=str(module_dir))
            schematic_path = generator.generate()
            return schematic_path

        return None

    def list_runs(self) -> None:
        """List all experiment runs."""
        print("\nListing Experiment Runs...")  # Debug line
        with self.experiment_manager._get_connection() as conn:
            cursor = conn.execute(
                """
                SELECT run_id, timestamp, components, config
                FROM runs ORDER BY timestamp DESC
            """
            )
            print("\nExperiment Runs:")
            rows = cursor.fetchall()
            print(f"Found {len(rows)} runs")  # Debug line

            for run_id, timestamp, components, config in rows:
                components = json.loads(components)
                config = json.loads(config)
                experiment_name = config.get("experiment_name", "Unnamed")
                print(f"\nRun ID: {run_id}")
                print(f"Timestamp: {timestamp}")
                print(f"Experiment: {experiment_name}")
                print(f"Components: {', '.join(components)}")

    def show_run_details(self, run_id: str) -> None:
        """Show details about a specific experiment run."""
        run = self.experiment_manager._load_run(run_id)
        if run:
            print(f"\nRun Details: {run_id}")
            print(f"Timestamp: {run.timestamp}")
            print(
                f"Experiment: {run.config.get('experiment_name', 'Unnamed')}"
            )
            print(f"\nComponents Analyzed: {', '.join(run.components)}")
            print("\nMetrics:")
            for name, value in run.metrics.items():
                print(f"  {name}: {value}")
            print("\nArtifacts:")
            for name, path in run.artifacts.items():
                print(f"  {name}: {path}")
        else:
            print(f"Run {run_id} not found")

    def show_component_history(self, component_name: str) -> None:
        """Show version history for a component."""
        history = self.experiment_manager.get_component_history(component_name)
        if history:
            print(f"\nHistory for {component_name}:")
            for entry in history:
                print(f"\nRun: {entry['run_id']}")
                print(f"Timestamp: {entry['timestamp']}")
                print(f"Experiment: {entry.get('experiment_name', 'Unnamed')}")
                if entry["metrics"]:
                    print("Metrics:")
                    for metric, value in entry["metrics"].items():
                        if component_name in metric:
                            print(f"  {metric}: {value}")
        else:
            print(f"No history found for {component_name}")

    def compare_runs(self, run_id1: str, run_id2: str) -> None:
        """Compare two experiment runs."""
        comparison = self.experiment_manager.compare_runs(run_id1, run_id2)

        print("\nRun Comparison:")
        print(f"From: {comparison['timestamp1']}")
        print(f"To:   {comparison['timestamp2']}")

        if comparison["component_changes"]:
            print("\nChanged Components:")
            for change in comparison["component_changes"]:
                print(f"\n{change.component_name}:")
                print(f"  Changed files: {', '.join(change.changed_files)}")
                if change.diff_summary:
                    print("\nChanges:")
                    print(change.diff_summary)

        if comparison["metric_changes"]:
            print("\nMetric Changes:")
            for metric, change in comparison["metric_changes"].items():
                print(f"\n{metric}:")
                print(f"  From: {change['from']}")
                print(f"  To:   {change['to']}")
                if change["delta"] is not None:
                    print(f"  Delta: {change['delta']}")


def main():
    """Command line entry point."""
    parser = argparse.ArgumentParser(
        description="""
HDL Analysis Runner - Comprehensive HDL Design Analysis Tool

This tool performs various analyses on Verilog HDL modules including:
- testbench: Testbench generation and simulation
- netlist: Netlist analysis
- timing: Timing analysis
- power: Power analysis
- waveform: Waveform generation and analysis
- schematic: Schematic generation
- all: Run all available analyses

Each analysis run is tracked as an experiment for version control and comparison.

Commands:
  analyze [modules]     Run analysis on specified modules
  list-runs            List all experiment runs
  show-run RUN_ID      Show details of a specific run
  compare RUN1 RUN2    Compare two runs
  history MODULE       Show version history for a module

Examples:
  # Run all analyses on all modules in src/
  hdlopt analyze

  # Run specific analyses on one module with experiment tracking
  python -m hdlopt analyze full_adder -a testbench timing -n "FullAdder_Opt1" -v "2.0"

  # View experiment history
  python -m hdlopt list-runs
  python -m hdlopt show-run run_20240124_123456
  python -m hdlopt compare run_1 run_2
  python -m hdlopt history full_adder
""",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    subparsers = parser.add_subparsers(dest="command", help="Command to execute")

    # Analyze command
    analyze_parser = subparsers.add_parser("analyze", help="Run analysis on modules")
    analyze_parser.add_argument(
        "modules",
        nargs="*",
        help="Module names to analyze (default: all modules in src/)",
    )
    analyze_parser.add_argument(
        "-o",
        "--output-dir",
        default="generated",
        help="Output directory for generated files",
    )
    analyze_parser.add_argument(
        "-src",
        "--src-dir",
        default="src",
        help="Source directory containing Verilog modules",
    )
    analyze_parser.add_argument(
        "-a",
        "--analyses",
        nargs="+",
        choices=["all"] + [a.name.lower() for a in AnalysisType],
        default=["all"],
        help="Analyses to run",
    )
    analyze_parser.add_argument(
        "--no-combine-pdfs", action="store_true", help="Don't combine analysis PDFs"
    )
    analyze_parser.add_argument(
        "-s",
        "--simulator",
        choices=["modelsim", "iverilog"],
        default="modelsim",
        help="Simulator to use",
    )
    analyze_parser.add_argument(
        "--timeout", help="Maximum time to run testbench"
    )
    analyze_parser.add_argument(
        "--no-waves", action="store_true", help="Don't generate waveforms"
    )
    analyze_parser.add_argument(
        "--no-recursive", action="store_true", help="Don't analyze submodules"
    )
    analyze_parser.add_argument(
        "-v", "--verbose", action="store_false", help="Enable verbose logging"
    )
    # Experiment tracking options
    analyze_parser.add_argument(
        "-n", "--experiment-name", help="Name for this experiment run"
    )
    analyze_parser.add_argument(
        "--version", default="1.0", help="Version string for this run"
    )
    analyze_parser.add_argument(
        "-d", "--description", help="Description of this experiment run"
    )
    analyze_parser.add_argument(
        "-t", "--tags", nargs="+", help="Tags in key=value format"
    )

    # List runs command
    list_runs_parser = subparsers.add_parser(
        "list-runs", help="List all experiment runs"
    )

    # Show run command
    show_run_parser = subparsers.add_parser("show-run", help="Show run details")
    show_run_parser.add_argument("run_id", help="Run ID to show")

    # Compare runs command
    compare_parser = subparsers.add_parser("compare", help="Compare two runs")
    compare_parser.add_argument("run1", help="First run ID")
    compare_parser.add_argument("run2", help="Second run ID")

    # Component history command
    history_parser = subparsers.add_parser("history", help="Show component history")
    history_parser.add_argument("module", help="Module name")

    args = parser.parse_args()

    if args.command == "analyze":
        config_manager = ConfigManager()

        # Parse tags if provided
        tags = {}
        if args.tags:
            for tag in args.tags:
                key, value = tag.split("=")
                tags[key.strip()] = value.strip()
        
        overrides = {
            'src_dir': args.src_dir if args.src_dir != "src" else None,
            'output_dir': args.output_dir if args.output_dir != "generated" else None,
            'simulator': args.simulator if args.simulator != "modelsim" else None,
            'combine_pdfs': not args.no_combine_pdfs,
            'generate_waves': not args.no_waves,
            'recursive': not args.no_recursive,
            'verbose': args.verbose,
            'timeout': int(args.timeout) if args.timeout else None,
            'experiment_name': args.experiment_name,
            'experiment_version': args.version,
            'experiment_desc': args.description,
            'experiment_tags': tags
        }
        overrides = {k: v for k, v in overrides.items() if v is not None}
        
        # Update stored configuration if overrides provided
        if overrides:
            config_manager.update_config(**overrides)
        
        # Ensure directories exist
        src_dir, output_dir = config_manager.ensure_directories()

        # Convert analyses strings to enum values
        analyses = None
        if args.analyses:
            analyses = [AnalysisType[a.upper()] for a in args.analyses]

        runner_config = config_manager.get_runner_config({
            'analyses': analyses,
            'experiment_name': args.experiment_name,
            'experiment_version': args.version,
            'experiment_desc': args.description,
            'experiment_tags': tags
        })
        
        config = RunnerConfig(**runner_config)
        runner = HDLAnalysisRunner(config)
        run_id = runner.run(args.modules)
        print(f"\nAnalysis complete. Run ID: {run_id}")

    elif args.command == "list-runs":
        # Use default config for experiment manager
        config = RunnerConfig(
            output_dir=args.output_dir if hasattr(args, "output_dir") else "generated",
            experiment_name=(
                args.experiment_name if hasattr(args, "experiment_name") else None
            ),
        )
        runner = HDLAnalysisRunner(config)
        runner.list_runs()

    elif args.command == "show-run":
        config = RunnerConfig()
        runner = HDLAnalysisRunner(config)
        runner.show_run_details(args.run_id)

    elif args.command == "compare":
        config = RunnerConfig()
        runner = HDLAnalysisRunner(config)
        comparison = runner.experiment_manager.compare_runs(args.run1, args.run2)

        print("\nRun Comparison:")
        print(f"From: {comparison['timestamp1']}")
        print(f"To:   {comparison['timestamp2']}")

        if comparison["component_changes"]:
            print("\nChanged Components:")
            for change in comparison["component_changes"]:
                print(f"\n{change.component_name}:")
                print(f"  Changed files: {', '.join(change.changed_files)}")
                if change.diff_summary:
                    print("\nChanges:")
                    print(change.diff_summary)

        if comparison["metric_changes"]:
            print("\nMetric Changes:")
            for metric, change in comparison["metric_changes"].items():
                print(f"\n{metric}:")
                print(f"  From: {change['from']}")
                print(f"  To:   {change['to']}")
                if change["delta"] is not None:
                    print(f"  Delta: {change['delta']}")

    elif args.command == "history":
        config = RunnerConfig()
        runner = HDLAnalysisRunner(config)
        runner.show_component_history(args.module)

    else:
        parser.print_help()

    for command_parser in [list_runs_parser, show_run_parser, history_parser]:
        command_parser.add_argument(
            "-n", "--experiment-name", help="Experiment name for filtering/tracking"
        )
        command_parser.add_argument(
            "-o", "--output-dir", default="generated", help="Output directory for files"
        )

    # Specific arguments for each command
    show_run_parser.add_argument("run_id", help="Run ID to show")
    history_parser.add_argument("module", help="Module name")


def run():
    """Entry point for the hdlopt command."""
    main()


if __name__ == "__main__":
    run()
