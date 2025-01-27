import os
import platform
import subprocess
from pathlib import Path
from .logger import logger

YOSYS_PATH = r"C:\oss-cad-suite\bin\yosys.exe"

class EnvironmentSetup:
    """Handles environment setup for external tools like Yosys"""
    
    def __init__(self):
        self.original_env = os.environ.copy()
        
    def setup_yosys(self):
        """Setup Yosys environment based on platform and installation"""
        system = platform.system()

        if system == "Windows":
            # Check for OSS CAD Suite
            oss_cad_path = Path("C:/oss-cad-suite")
            if oss_cad_path.exists():
                self._setup_oss_cad_suite(oss_cad_path)
                if self._check_system_yosys():
                    return True  

            # Check conda installation
            """
            if "CONDA_PREFIX" in os.environ:
                conda_path = Path(os.environ["CONDA_PREFIX"])
                yosys_exe = conda_path / "bin" / "yosys.exe"
                if yosys_exe.exists():
                    os.environ["PATH"] += f";{yosys_exe.parent}"
                    return True
            """

        elif system in ["Linux", "Darwin"]:
            # Check system installation
            if self._check_system_yosys():
                return True

            # Check conda/virtual env
            if "VIRTUAL_ENV" in os.environ:
                venv_path = Path(os.environ["VIRTUAL_ENV"])
                yosys_bin = venv_path / "bin" / "yosys"
                if yosys_bin.exists():
                    os.environ["PATH"] += f":{yosys_bin.parent}"
                    return True

        raise EnvironmentError("Yosys not found. Please install Yosys or OSS CAD Suite")

    def setup_graphviz(self):
        """Ensure Graphviz 'dot' is available in the PATH"""
        try:
            subprocess.run(["dot", "-V"], capture_output=True, text=True, check=True)
            return True
        except FileNotFoundError:
            raise EnvironmentError("Graphviz 'dot' not found. Please install Graphviz and add it to PATH.")
        except subprocess.CalledProcessError as e:
            logger.error(f"Graphviz 'dot' encountered an error: {e.stderr}")
            raise EnvironmentError(f"Graphviz 'dot' encountered an error: {e.stderr}")

    def _setup_oss_cad_suite(self, oss_cad_path):
        """Setup OSS CAD Suite environment variables by running the batch script and capturing its environment"""
        env_script = oss_cad_path / "environment.bat"
        if env_script.exists():
            # Run the batch file and capture the environment variables it sets
            # This approach uses the `set` command to output all environment variables after running the script
            command = f'cmd.exe /c "call {env_script} && set"'
            process = subprocess.run(command, capture_output=True, text=True, shell=True)
            if process.returncode != 0:
                logger.error(f"Failed to setup OSS CAD Suite: {process.stderr}")
                raise EnvironmentError(f"Failed to setup OSS CAD Suite: {process.stderr}")

            # Parse the environment variables from the output and update os.environ
            for line in process.stdout.splitlines():
                key, sep, value = line.partition("=")
                if sep:  # Ensure that '=' was found
                    os.environ[key] = value

    def _check_system_yosys(self):
        """Check if Yosys is available in system path"""
        try:
            subprocess.run(["yosys", "--version"], capture_output=True, text=True, check=True)
            return True
        except FileNotFoundError:
            return False
        except subprocess.CalledProcessError as e:
            logger.error(f"Yosys encountered an error: {e.stderr}")
            return False

    def teardown(self):
        """Restore original environment"""
        os.environ.clear()
        os.environ.update(self.original_env)