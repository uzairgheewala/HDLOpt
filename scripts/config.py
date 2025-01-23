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
            if "CONDA_PREFIX" in os.environ:
                conda_path = Path(os.environ["CONDA_PREFIX"])
                if (conda_path / "bin" / "yosys").exists():
                    return True
                    
        elif system in ["Linux", "Darwin"]:
            # Check system installation
            if self._check_system_yosys():
                return True
                
            # Check conda/virtual env
            if "VIRTUAL_ENV" in os.environ:
                venv_path = Path(os.environ["VIRTUAL_ENV"])
                if (venv_path / "bin" / "yosys").exists():
                    return True
                    
        raise EnvironmentError("Yosys not found. Please install Yosys or OSS CAD Suite")

    def _setup_oss_cad_suite(self, oss_cad_path):
        """Setup OSS CAD Suite environment variables"""
        env_script = oss_cad_path / "environment.bat"
        if env_script.exists():
            result = subprocess.run([str(env_script)], capture_output=True, text=True)
            if result.returncode != 0:
                logger.error(f"Failed to setup OSS CAD Suite: {result.stderr}")
                raise EnvironmentError(f"Failed to setup OSS CAD Suite: {result.stderr}")
                
    def _check_system_yosys(self):
        """Check if Yosys is available in system path"""
        try:
            subprocess.run(["yosys", "--version"], capture_output=True)
            return True
        except FileNotFoundError:
            return False
            
    def teardown(self):
        """Restore original environment"""
        os.environ.clear()
        os.environ.update(self.original_env)