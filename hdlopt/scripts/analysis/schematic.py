import os
import shutil
import subprocess
import tempfile
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Set

from ..config import EnvironmentSetup
from ..logger import logger

graphviz_bin = r"C:\Program Files\Graphviz\bin"
env = os.environ.copy()
env["PATH"] = f"{graphviz_bin};{env['PATH']}"


class SchematicFormat(Enum):
    """Supported schematic output formats."""

    PDF = "pdf"
    PNG = "png"
    SVG = "svg"
    BMP = "bmp"


class SchematicTool(Enum):
    """Supported schematic generation tools."""

    VIVADO = "vivado"
    YOSYS = "yosys"


class SchematicLevel(Enum):
    """Schematic abstraction levels."""

    RTL = "rtl"
    GATE = "gate"


class SchematicOrientation(Enum):
    """Schematic layout orientations."""

    LANDSCAPE = "landscape"
    PORTRAIT = "portrait"


@dataclass
class SchematicConfig:
    """Configuration for schematic generation.

    Attributes:
        format: Output file format (pdf, png, svg)
        tool: Generation tool (vivado, yosys)
        level: Abstraction level (rtl, gate)
        orientation: Page orientation (landscape, portrait)
        include_ports: Whether to show ports
        include_signals: Whether to show internal signals
        timeout: Subprocess timeout in seconds
        graph_attrs: Custom Graphviz graph attributes
        node_attrs: Custom Graphviz node attributes
        edge_attrs: Custom Graphviz edge attributes
        cleanup_temp: Whether to clean temporary files
    """

    format: SchematicFormat = SchematicFormat.PDF
    tool: SchematicTool = SchematicTool.VIVADO
    level: SchematicLevel = SchematicLevel.RTL
    orientation: SchematicOrientation = SchematicOrientation.LANDSCAPE
    include_ports: bool = True
    include_signals: bool = True
    timeout: int = 300
    graph_attrs: Dict[str, str] = field(
        default_factory=lambda: {
            "rankdir": "LR",
            "splines": "ortho",
            "concentrate": "true",
        }
    )
    node_attrs: Dict[str, str] = field(
        default_factory=lambda: {"shape": "box", "style": "rounded"}
    )
    edge_attrs: Dict[str, str] = field(default_factory=lambda: {"arrowhead": "normal"})
    cleanup_temp: bool = True

    def __post_init__(self):
        """Validate configuration after initialization."""
        # Convert string enum values
        if isinstance(self.format, str):
            self.format = SchematicFormat(self.format.lower())
        if isinstance(self.tool, str):
            self.tool = SchematicTool(self.tool.lower())
        if isinstance(self.level, str):
            self.level = SchematicLevel(self.level.lower())
        if isinstance(self.orientation, str):
            self.orientation = SchematicOrientation(self.orientation.lower())

        # Validate timeout
        if self.timeout <= 0:
            raise ValueError("Timeout must be positive")


class SchematicGenerator:
    """Generates circuit schematics from HDL netlists"""

    def __init__(
        self,
        component_name: str,
        config: Optional[SchematicConfig] = None,
        base_dir: Optional[str] = None,
    ):
        self.component_name = component_name
        self.config = config or SchematicConfig()
        self.base_dir = base_dir
        self.env = EnvironmentSetup()
        self.temp_files: Set[Path] = set()

    def __enter__(self):
        """Context manager entry."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit with cleanup."""
        if self.config.cleanup_temp:
            self._cleanup()

    def generate(self) -> Path:
        """Generate schematic diagram.

        Returns:
            Path to generated schematic file

        Raises:
            FileNotFoundError: If component files not found
            subprocess.CalledProcessError: If tool execution fails
            subprocess.TimeoutExpired: If execution times out
        """
        logger.info(
            f"Generating {self.config.level.value} schematic for {self.component_name}"
        )

        try:
            # Setup environment
            # self._setup_environment()

            # Generate using selected tool
            if self.config.tool == SchematicTool.VIVADO:
                output_path = self._generate_vivado_schematic()
            else:
                output_path = self._generate_yosys_schematic()

            logger.info(f"Generated schematic at {output_path}")
            return output_path

        except Exception as e:
            logger.error(f"Schematic generation failed: {str(e)}")
            raise
        finally:
            if self.config.cleanup_temp:
                self._cleanup()

    def _setup_environment(self) -> None:
        """Setup required tool environment."""
        if self.config.tool == SchematicTool.VIVADO:
            self.env.setup_vivado()
        else:
            self.env.setup_yosys()
            # Check graphviz installation
            if not shutil.which("dot"):
                raise RuntimeError("Graphviz dot command not found")

    def _generate_vivado_schematic(self) -> Path:
        """Generate schematic using Vivado.

        Returns:
            Path to generated schematic

        Raises:
            subprocess.CalledProcessError: If Vivado execution fails
            subprocess.TimeoutExpired: If execution times out
        """
        # Create Vivado script
        tcl_script = self._generate_vivado_script()
        script_path = self._get_temp_path("tcl")
        self.temp_files.add(script_path)

        with open(script_path, "w") as f:
            f.write(tcl_script)

        try:
            # Run Vivado
            logger.debug(f"Running Vivado with script: {script_path}")
            result = subprocess.run(
                ["vivado", "-mode", "batch", "-source", str(script_path)],
                check=True,
                capture_output=True,
                timeout=self.config.timeout,
                shell=True,
                text=True,
            )
            logger.debug("Vivado stdout:\n%s", result.stdout)
            logger.debug("Vivado stderr:\n%s", result.stderr)

            # Check output path exists
            output_path = self._get_schematic_path()
            if not output_path.exists():
                raise RuntimeError(
                    f"Vivado completed but output not found at {output_path}"
                )

            return output_path

        except subprocess.TimeoutExpired:
            logger.error(f"Vivado timed out after {self.config.timeout}s")
            raise
        except subprocess.CalledProcessError as e:
            logger.error(f"Vivado failed: {e.stderr}")
            raise

    def _generate_yosys_schematic(self) -> Path:
        """Generate schematic using Yosys + Graphviz.

        Returns:
            Path to generated schematic

        Raises:
            subprocess.CalledProcessError: If tool execution fails
            subprocess.TimeoutExpired: If execution times out
        """
        # Create Yosys script
        script_path = self._get_temp_path("ys")
        ys_script, dot_path = self._generate_yosys_script(script_path)
        self.temp_files.add(script_path)
        # print("Script path:", script_path)
        # print("Yosys script:", ys_script)

        with open(script_path, "w") as f:
            f.write(ys_script)

        try:
            # Run Yosys to generate DOT
            logger.debug(f"Running Yosys with script: {script_path}")
            result = subprocess.run(
                ["yosys", str(script_path)],
                check=True,
                capture_output=True,
                timeout=self.config.timeout,
                shell=True,
                text=True,
            )
            # Log Yosys output
            # logger.debug("Yosys stdout:\n%s", result.stdout)
            # logger.debug("Yosys stderr:\n%s", result.stderr)

            # Get DOT file path
            # print("Files in dot path:", os.listdir(dot_path.parent))
            # dot_path = script_path.parent / f"{self.component_name}_schematic.dot"
            if not dot_path.exists():
                raise RuntimeError(f"Yosys completed but DOT not found at {dot_path}")

            # Convert DOT to desired format
            logger.debug(f"Converting DOT to {self.config.format.value}")
            # output_path = script_path.parent /
            # Path(f"{self.component_name}_schematic.png")
            # #self._get_schematic_path()
            output_path = self._get_schematic_path()
            output_path.parent.mkdir(parents=True, exist_ok=True)
            print("output_path", output_path)
            print("output_path.parent", output_path.parent)
            print("output_path.stem", output_path.stem)

            # Create Digraph and set attributes
            # dot_content = dot_path.read_text()
            # graph = graphviz.Source(dot_content)
            # graph.graph_attr.update(self.config.graph_attrs)
            # graph.node_attr.update(self.config.node_attrs)
            # graph.edge_attr.update(self.config.edge_attrs)

            dot_cmd = [
                "dot",
                "-T" + self.config.format.value,
                "-o",
                str(output_path),
                str(dot_path),
            ]
            env = os.environ.copy()
            env["PATH"] = (
                r"C:\Program Files\Graphviz\bin;" + env["PATH"]
            )  # Add your Graphviz path
            result = subprocess.run(
                ["dot", "-V"], shell=True, check=True
            )  # Should print the version
            # print(result, result.stdout, result.stderr)
            result = subprocess.run(
                dot_cmd,
                env=env,  # Pass the modified environment
                capture_output=True,
                text=True,
                check=True,
            )
            logger.debug("Graphviz stdout: %s", result.stdout)
            logger.debug("Graphviz stderr: %s", result.stderr)

            # print(output_path.exists())

            if result.returncode != 0:
                raise RuntimeError(f"Graphviz dot failed:\n{result.stderr}")

            if not output_path.exists():
                raise RuntimeError(
                    f"Graphviz claimed success but no file at {output_path}"
                )

            return output_path

            """
            # Render to output file
            try:
                rendered_file = graph.render(
                    filename=output_path.stem,
                    format=self.config.format.value,
                    cleanup=self.config.cleanup_temp,
                    directory=str(output_path.parent)
                )
                print(rendered_file)
            except ExecutableNotFound as e:
                logger.error("Graphviz 'dot' not found. Install it and add to PATH.")
                raise
            except CalledProcessError as e:
                logger.error(f"Graphviz failed: {e.stderr}")
                raise

            print("Graphviz actually wrote to:", rendered_file)
            """

        except subprocess.TimeoutExpired:
            logger.error(
                f"Tool execution timed out after {self.config.timeout}s"
            )
            raise
        except FileNotFoundError:
            raise FileNotFoundError("Yosys executable not found")
        except subprocess.CalledProcessError as e:
            logger.error(f"Tool execution failed: {str(e)}")
            if "Module not found" in str(e.stderr):
                raise FileNotFoundError(
                    f"Component {self.component_name} not found"
                )
            raise

    def _generate_vivado_script(self) -> str:
        """Generate Vivado TCL script for schematic generation."""
        output_path = self._get_schematic_path()
        output_path.parent.mkdir(parents=True, exist_ok=True)

        script = [
            "# Generated by SchematicGenerator",
            f"# {datetime.now()}",
            "",
            f"create_project -force {self.component_name}_schematic tmp -part xc7a35tcsg324-1",
            f"cd {output_path.parent}",  # Change to output directory
        ]

        # Add source files with absolute paths
        source_files = self._collect_source_files()
        for src_file in source_files:
            script.append(f"add_files {os.path.abspath(src_file)}")

        script.extend(
            [
                f"set_property top {self.component_name} [current_fileset]",
                "synth_design -top $component_name -mode out_of_context",
                f"write_schematic -force -format {self.config.format.value} {str(output_path)}",
                "close_project",
            ]
        )

        return "\n".join(script)

    def _generate_yosys_script(self, script_path):
        """Generate Yosys script for schematic generation."""
        script = [
            "# Generated by SchematicGenerator",
            f"# {datetime.now()}",
            "",
        ]

        # Read source files
        source_files = self._collect_source_files()
        for src_file in source_files:
            script.append(f"read_verilog {src_file}")

        script.extend([f"hierarchy -top {self.component_name}", "proc", "opt"])

        # Add gate-level mapping if requested
        if self.config.level == SchematicLevel.GATE:
            script.extend(["techmap", "opt"])

        # Add port/signal filtering if needed
        if not self.config.include_ports:
            script.append("clean -ports")
        if not self.config.include_signals:
            script.append("clean -signals")

        # Generate dot file with explicit path
        dot_path = script_path.parent / Path(
            f"{self.component_name}_schematic.dot"
        )  # self._get_temp_path("dot").with_suffix("")
        script.append(f"show -format dot -prefix {dot_path}")
        script.append(f"write_dot {dot_path}")

        print("Dot path to generate DOT file at for yosys:", dot_path)

        return "\n".join(script), dot_path

    def _get_component_dir(self) -> Path:
        """Get component directory path."""
        if self.base_dir:
            component_dir = Path(self.base_dir)
            # print("component_dir", component_dir, component_dir.exists(), os.listdir(component_dir))
            if component_dir.exists():
                return component_dir

        from .utils import find_component_directory

        component_dir = find_component_directory(self.component_name)
        if not component_dir:
            raise FileNotFoundError(
                f"Component directory not found for {self.component_name}"
            )
        return Path(component_dir)

    def _get_temp_path(self, ext: str) -> Path:
        """Get path for temporary file."""
        temp_dir = Path(tempfile.gettempdir())
        return (
            temp_dir / f"{self.component_name}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.{ext}"
        )

    def _get_schematic_path(self) -> Path:
        """Get path for schematic output (under base_dir)."""
        return (
            Path(self.base_dir)
            / f"{self.component_name}_schematic.{self.config.format.value}"
        )

    def _collect_source_files(self) -> List[str]:
        """Collect Verilog source files."""
        component_dir = self._get_component_dir()
        return [
            str(f) for f in component_dir.rglob("*.v") if not f.name.startswith("tb_")
        ]

    def _cleanup(self) -> None:
        """Clean up temporary files."""
        for temp_file in self.temp_files:
            try:
                if temp_file.exists():
                    temp_file.unlink()
            except Exception as e:
                logger.warning(f"Failed to remove temp file {temp_file}: {str(e)}")
        
        # Also cleanup known temp files by pattern
        import glob
        for pattern in [f"{self.component_name}_*.dot", f"{self.component_name}_*.ys"]:
            for f in glob.glob(os.path.join("/tmp", pattern)):
                try:
                    os.remove(f)
                except Exception as e:
                    logger.warning(f"Failed to remove temp file {f}: {str(e)}")
