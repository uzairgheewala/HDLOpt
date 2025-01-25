from pathlib import Path
import importlib
import importlib.util
import inspect
import json
import os
import argparse
import logging
from typing import List, Dict, Optional
from dataclasses import dataclass
from enum import Enum, auto
from datetime import datetime

from .scripts.experiment_manager import ExperimentManager, ExperimentConfig
from .scripts.directory_structure import create_directory_structure, print_directory_structure
from .scripts.parsing.factory import VerilogParser
from .scripts.parsing.base import ParserMode
from hdlopt.scripts.testbench.core import TestbenchGenerator
from hdlopt.scripts.testbench.runner import TestbenchRunner
from hdlopt.scripts.analysis.netlist import NetlistAnalyzer
from hdlopt.scripts.analysis.timing import TimingAnalyzer
from hdlopt.scripts.analysis.power import PowerAnalyzer
from hdlopt.scripts.analysis.waveform import WaveformAnalyzer
from hdlopt.scripts.analysis.schematic import SchematicGenerator
from hdlopt.scripts.reporting.generator import PDFReportGenerator
from hdlopt.scripts.logger import logger
from hdlopt.rules.base import Rule

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

    def __post_init__(self):
        if self.analyses is None or (len(self.analyses) == 1 and self.analyses[0] == AnalysisType.ALL):
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
            simulator=config.simulator,
            work_dir=Path(config.output_dir),
            timeout=300
        )
        
        # Initialize ExperimentManager with configuration
        experiment_config = ExperimentConfig(
            name=config.experiment_name,
            version=config.experiment_version,
            description=config.experiment_desc,
            tags=config.experiment_tags,
            base_path=self.output_dir
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
                '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
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
                modules = [
                    self.src_dir / f"{name}.v"
                    for name in module_names
                ]
                for module in modules:
                    if not module.exists():
                        raise FileNotFoundError(f"Module {module} not found")
            else:
                # Get all .v files in src directory
                modules = list(self.src_dir.glob("*.v"))

            logger.info(f"Analyzing {len(modules)} modules: {[m.stem for m in modules]}")

            # Start experiment run
            run_id = self.experiment_manager.start_run(
                components=modules,
                config=self.config.__dict__
            )

            try:
                for module in modules:
                    self._analyze_module(module, run_id)
            except Exception as e:
                logger.error(f"Analysis failed: {str(e)}")
                raise(e)
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
        module_name = module_path.stem
        logger.info(f"Analyzing module: {module_name}")
        logger.debug(f"Module path: {module_path}")
        #print(self.output_dir, module_name, self.src_dir)

        # Step 1: Create directory structure
        module_dir = self.output_dir / module_name
        module_dir.mkdir(parents=True, exist_ok=True)
        
        hierarchy = {}
        hierarchy = create_directory_structure(
            str(os.path.basename(module_path)),
            str(self.src_dir),
            str(module_dir.parent),
            hierarchy
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
        if self.config.parser == 'native':
            parser_mode = ParserMode.NATIVE
        elif self.config.parser == 'pyverilog':
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
            logger.debug(f"Found submodules for {module_name}: {hierarchy[module_name]}")
            for submodule in hierarchy[module_name]:
                submodule_path = self.src_dir / f"{submodule}.v"
                if submodule_path.exists():
                    logger.debug(f"Parsing submodule {submodule}")
                    with open(submodule_path) as f:
                        submodule_details = parser.parse_file(str(submodule_path))[0].to_dict()
                    
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
            logger.warning(f"No matching rules found for module {module_path.stem}")

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
            logger.info(f"Generating testbench with {len(rules)} matching rules for {module_name}")
            try:
                tb_gen = TestbenchGenerator(
                    module_name,
                    rules=rules,
                    base_dir=str(module_dir.parent)
                )
                tb_gen.generate(self.config.recursive)
                logger.debug(f"Successfully generated testbench for {module_name}")
            except Exception as e:
                logger.error(f"Failed to generate testbench: {str(e)}")
                raise(e)
            
            try:
                tb_runner = TestbenchRunner(
                    simulator=self.config.simulator,
                    work_dir=str(module_dir.parent)
                )
                results = tb_runner.run_recursive(
                    module_name,
                    base_dir=str(module_dir.parent),
                    force_recompile=True
                )

                # Save results
                results_dict = [r.to_dict() for r in results]
                with open(module_dir / "testbench_results.json", "w") as f:
                    json.dump(results_dict, f, indent=4)

                logger.info("Completed testbench generation and execution")
            except Exception as e:
                logger.error(f"Failed to run testbench: {str(e)}")
                raise(e)
            
        logger.debug(f"Analyses: {self.config.analyses}")

        # Step 4: Run requested analyses
        for analysis in self.config.analyses:
            logger.debug(f"Running analysis {analysis}")
            try:
                report = self._run_analysis(
                    analysis,
                    module_name,
                    module_dir,
                    module_details
                )
                if report:
                    logger.debug(f"Report generated. {report}")
                    reports.append(report)
            except Exception as e:
                logger.error(f"Failed to run {analysis.name} analysis: {str(e)}")

        # Track metrics for this module's analysis
        metrics = {
            f"{module_name}_hierarchy_depth": len(hierarchy),
            f"{module_name}_submodule_count": len(hierarchy.get(module_name, [])),
            f"{module_name}_file_count": len(reports),
            f"{module_name}_analyses_run": [a.name for a in self.config.analyses if a != AnalysisType.ALL]
        }

        # Add test metrics if available
        if AnalysisType.TESTBENCH in self.config.analyses:
            test_results_path = module_dir / "testbench_results.json"
            if test_results_path.exists():
                with open(test_results_path) as f:
                    results = json.load(f)
                    test_metrics = {
                        f"{module_name}_total_tests": len(results),
                        f"{module_name}_passed_tests": sum(1 for r in results if r.get("passed", False)),
                        f"{module_name}_failed_tests": sum(1 for r in results if not r.get("passed", False))
                    }
                    metrics.update(test_metrics)

        # Update experiment metrics
        self.experiment_manager.update_metrics(run_id, metrics)

        # Step 5: Combine reports if requested
        if self.config.combine_pdfs and reports:
            try:
                # Filter out None values and check paths exist
                valid_reports = [r for r in reports if r and Path(r).exists()]
                
                if valid_reports:
                    combined_report = PDFReportGenerator(
                        str(module_dir / f"{module_name}_analysis.pdf")
                    )
                    combined_report.merge_pdfs(valid_reports, str(module_dir / f"{module_name}_analysis.pdf"))
                    logger.info(f"Generated combined analysis report")
                else:
                    logger.warning("No valid reports to combine")
            except Exception as e:
                logger.error(f"Failed to combine PDFs: {str(e)}")

            # Track reports as artifacts
            for report in valid_reports:
                self.experiment_manager.add_artifact(
                    run_id,
                    f"{module_name}_{Path(report).stem}",
                    Path(report)
                )

    def _find_rules_for_module(self, module_path: Path) -> List[Rule]:
        """Find all rules that apply to a given module.
        
        Args:
            module_path: Path to module .v file
            
        Returns:
            List of applicable Rule instances
        """
        logger.debug(f"Finding rules for module: {module_path.stem}")
        rules = []
        rules_dir = Path(__file__).parent / "rules"
        
        for rule_file in rules_dir.glob("*.py"):
            if rule_file.name in ["__init__.py", "base.py"]:
                continue
                
            try:
                module_name = f"hdlopt.rules.{rule_file.stem}"
                rule_module = importlib.import_module(module_name)
                
                for name, obj in inspect.getmembers(rule_module):
                    if (inspect.isclass(obj) and 
                        issubclass(obj, Rule) and 
                        obj != Rule):
                        rule = obj()
                        if rule.matches(module_path.stem):
                            logger.debug(f"Rule {name} matches {module_path.stem}")
                            rules.append(rule)
                            
            except Exception as e:
                logger.error(f"Error checking rule {rule_file.name}: {str(e)}")
                
        return rules

    def _run_analysis(
        self,
        analysis: AnalysisType,
        module_name: str,
        module_dir: Path,
        module_details: Dict
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
            analyzer = NetlistAnalyzer()
            netlist = analyzer.analyze(module_name, base_dir=str(module_dir))
            
            with open(module_dir / f"{module_name}_netlist.json", "w") as f:
                json.dump(netlist, f, indent=4)
                
            return None

        elif analysis == AnalysisType.TIMING:
            analyzer = TimingAnalyzer(module_name, base_dir=str(module_dir))
            timing_data, report_path = analyzer.analyze()
            
            # Save timing data
            with open(module_dir / f"{module_name}_timing.json", "w") as f:
                json.dump(timing_data, f, indent=4)
                
            #report_path = module_dir / f"{module_name}_timing_report.pdf"
            #analyzer.generate_report(timing_data)
            return report_path

        elif analysis == AnalysisType.POWER:
            analyzer = PowerAnalyzer(module_name, base_dir=str(module_dir))
            power_data, report_path = analyzer.analyze()
            
            with open(module_dir / f"{module_name}_power.json", "w") as f:
                json.dump(power_data, f, indent=4)
                
            #report_path = module_dir / f"{module_name}_power_report.pdf"
            #analyzer.generate_report(power_data)
            return report_path

        elif analysis == AnalysisType.WAVEFORM:
            if self.config.generate_waves:
                analyzer = WaveformAnalyzer(module_name, base_dir=str(module_dir))
                wave_data = analyzer.analyze(module_dir / "wave.vcd")
                
                report_path = module_dir / f"{module_name}_waveform_report.pdf"
                analyzer.generate_report(wave_data)
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
            cursor = conn.execute("""
                SELECT run_id, timestamp, components, config
                FROM runs ORDER BY timestamp DESC
            """)
            print("\nExperiment Runs:")
            rows = cursor.fetchall()
            print(f"Found {len(rows)} runs")  # Debug line
            
            for run_id, timestamp, components, config in rows:
                components = json.loads(components)
                config = json.loads(config)
                experiment_name = config.get('experiment_name', 'Unnamed')
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
            print(f"Experiment: {run.config.get('experiment_name', 'Unnamed')}")
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
                if entry['metrics']:
                    print("Metrics:")
                    for metric, value in entry['metrics'].items():
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
        
        if comparison['component_changes']:
            print("\nChanged Components:")
            for change in comparison['component_changes']:
                print(f"\n{change.component_name}:")
                print(f"  Changed files: {', '.join(change.changed_files)}")
                if change.diff_summary:
                    print("\nChanges:")
                    print(change.diff_summary)
        
        if comparison['metric_changes']:
            print("\nMetric Changes:")
            for metric, change in comparison['metric_changes'].items():
                print(f"\n{metric}:")
                print(f"  From: {change['from']}")
                print(f"  To:   {change['to']}")
                if change['delta'] is not None:
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
  python -m hdlopt.runner analyze

  # Run specific analyses on one module with experiment tracking
  python -m hdlopt.runner analyze full_adder -a testbench timing -n "FullAdder_Opt1" -v "2.0"

  # View experiment history
  python -m hdlopt.runner list-runs
  python -m hdlopt.runner show-run run_20240124_123456
  python -m hdlopt.runner compare run_1 run_2
  python -m hdlopt.runner history full_adder
""",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    subparsers = parser.add_subparsers(dest='command', help='Command to execute')

    # Analyze command
    analyze_parser = subparsers.add_parser('analyze', help='Run analysis on modules')
    analyze_parser.add_argument(
        "modules",
        nargs="*",
        help="Module names to analyze (default: all modules in src/)"
    )
    analyze_parser.add_argument(
        "-o", "--output-dir",
        default="generated",
        help="Output directory for generated files"
    )
    analyze_parser.add_argument(
        "-src", "--src-dir",
        default="src",
        help="Source directory containing Verilog modules"
    )
    analyze_parser.add_argument(
        "-a", "--analyses",
        nargs="+",
        choices=["all"] + [a.name.lower() for a in AnalysisType],
        default=["all"],
        help="Analyses to run"
    )
    analyze_parser.add_argument(
        "--no-combine-pdfs",
        action="store_true",
        help="Don't combine analysis PDFs"
    )
    analyze_parser.add_argument(
        "-s", "--simulator",
        choices=["modelsim", "iverilog"],
        default="modelsim",
        help="Simulator to use"
    )
    analyze_parser.add_argument(
        "--no-waves",
        action="store_true",
        help="Don't generate waveforms"
    )
    analyze_parser.add_argument(
        "--no-recursive",
        action="store_true",
        help="Don't analyze submodules"
    )
    analyze_parser.add_argument(
        "-v", "--verbose",
        action="store_false",
        help="Enable verbose logging"
    )
    # Experiment tracking options
    analyze_parser.add_argument(
        "-n", "--experiment-name",
        help="Name for this experiment run"
    )
    analyze_parser.add_argument(
        "--version",
        default="1.0",
        help="Version string for this run"
    )
    analyze_parser.add_argument(
        "-d", "--description",
        help="Description of this experiment run"
    )
    analyze_parser.add_argument(
        "-t", "--tags",
        nargs="+",
        help="Tags in key=value format"
    )

    # List runs command
    list_runs_parser = subparsers.add_parser('list-runs', help='List all experiment runs')

    # Show run command
    show_run_parser = subparsers.add_parser('show-run', help='Show run details')
    show_run_parser.add_argument('run_id', help='Run ID to show')

    # Compare runs command
    compare_parser = subparsers.add_parser('compare', help='Compare two runs')
    compare_parser.add_argument('run1', help='First run ID')
    compare_parser.add_argument('run2', help='Second run ID')

    # Component history command
    history_parser = subparsers.add_parser('history', help='Show component history')
    history_parser.add_argument('module', help='Module name')

    args = parser.parse_args()

    if args.command == 'analyze':
        # Convert analyses strings to enum values
        analyses = None
        if args.analyses:
            analyses = [
                AnalysisType[a.upper()]
                for a in args.analyses
            ]

        # Parse tags if provided
        tags = {}
        if args.tags:
            for tag in args.tags:
                key, value = tag.split('=')
                tags[key.strip()] = value.strip()

        config = RunnerConfig(
            analyses=analyses,
            src_dir=args.src_dir,
            output_dir=args.output_dir,
            combine_pdfs=not args.no_combine_pdfs,
            simulator=args.simulator,
            generate_waves=not args.no_waves,
            recursive=not args.no_recursive,
            verbose=args.verbose,
            experiment_name=args.experiment_name,
            experiment_version=args.version,
            experiment_desc=args.description,
            experiment_tags=tags
        )

        runner = HDLAnalysisRunner(config)
        run_id = runner.run(args.modules)
        print(f"\nAnalysis complete. Run ID: {run_id}")

    elif args.command == 'list-runs':
        # Use default config for experiment manager
        config = RunnerConfig(
            output_dir=args.output_dir if hasattr(args, 'output_dir') else "generated",
            experiment_name=args.experiment_name if hasattr(args, 'experiment_name') else None
        )
        runner = HDLAnalysisRunner(config)
        runner.list_runs()

    elif args.command == 'show-run':
        config = RunnerConfig()
        runner = HDLAnalysisRunner(config)
        runner.show_run_details(args.run_id)

    elif args.command == 'compare':
        config = RunnerConfig()
        runner = HDLAnalysisRunner(config)
        comparison = runner.experiment_manager.compare_runs(args.run1, args.run2)
        
        print("\nRun Comparison:")
        print(f"From: {comparison['timestamp1']}")
        print(f"To:   {comparison['timestamp2']}")
        
        if comparison['component_changes']:
            print("\nChanged Components:")
            for change in comparison['component_changes']:
                print(f"\n{change.component_name}:")
                print(f"  Changed files: {', '.join(change.changed_files)}")
                if change.diff_summary:
                    print("\nChanges:")
                    print(change.diff_summary)
        
        if comparison['metric_changes']:
            print("\nMetric Changes:")
            for metric, change in comparison['metric_changes'].items():
                print(f"\n{metric}:")
                print(f"  From: {change['from']}")
                print(f"  To:   {change['to']}")
                if change['delta'] is not None:
                    print(f"  Delta: {change['delta']}")

    elif args.command == 'history':
        config = RunnerConfig()
        runner = HDLAnalysisRunner(config)
        runner.show_component_history(args.module)

    else:
        parser.print_help()

    for command_parser in [list_runs_parser, show_run_parser, history_parser]:
        command_parser.add_argument(
            "-n", "--experiment-name",
            help="Experiment name for filtering/tracking"
        )
        command_parser.add_argument(
            "-o", "--output-dir",
            default="generated",
            help="Output directory for files"
        )

    # Specific arguments for each command
    show_run_parser.add_argument('run_id', help='Run ID to show')
    history_parser.add_argument('module', help='Module name')

def run():
    """Entry point for the hdlopt command."""
    main()

if __name__ == "__main__":
    run()