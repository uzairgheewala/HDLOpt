import json
import os
from pathlib import Path
from typing import Dict, Optional, Any
from dataclasses import asdict, dataclass, field
from datetime import datetime

from .scripts.logger import logger

DEFAULT_CONFIG_NAME = ".hdlopt.json"

@dataclass
class UserConfig:
    """User-specific configuration."""
    src_dir: str = field(default_factory=lambda: str(Path.cwd() / "src"))
    output_dir: str = field(default_factory=lambda: str(Path.cwd() / "generated"))
    simulator: str = "modelsim"
    combine_pdfs: bool = True
    parser: str = "native"
    generate_waves: bool = True
    recursive: bool = True
    verbose: bool = False
    last_updated: str = field(default_factory=lambda: datetime.now().isoformat())
    timeout: float = float('inf')

    experiment_name: Optional[str] = None
    experiment_version: str = "1.0"
    experiment_desc: Optional[str] = None
    experiment_tags: Optional[Dict[str, str]] = None

    def to_dict(self) -> Dict:
        """Convert to dictionary."""
        return {k: v for k, v in asdict(self).items() if not k.startswith('_')}

    @classmethod
    def from_dict(cls, data: Dict) -> 'UserConfig':
        """Create from dictionary."""
        return cls(**{k: v for k, v in data.items() if not k.startswith('_')})

class ConfigManager:
    """Manages HDLOpt configuration persistence."""
    
    def __init__(self, config_path: Optional[str] = None):
        """Initialize configuration manager.
        
        Args:
            config_path: Optional path to configuration file.
                        If None, uses .hdlopt.json in user's home directory.
        """
        #logger.debug(f"Path.home: {Path.home()}")

        if config_path is None:
            self.config_path = Path(os.getcwd()) / DEFAULT_CONFIG_NAME
        else:
            self.config_path = Path(config_path)
        
        logger.debug(f"Config path: {self.config_path}")
            
        self.config = self._load_or_create_config()
        
    def _load_or_create_config(self) -> UserConfig:
        """Load existing config or create default."""
        if self.config_path.exists():
            try:
                with open(self.config_path) as f:
                    return UserConfig.from_dict(json.load(f))
            except Exception as e:
                print(f"Error loading config: {e}. Using defaults.")
                return UserConfig()
        else:
            os.makedirs(self.config_path.parent, exist_ok=True)
            return UserConfig()

    def save_config(self):
        """Save current configuration."""
        self.config.last_updated = datetime.now().isoformat()
        with open(self.config_path, 'w') as f:
            json.dump(self.config.to_dict(), f, indent=2)

    def update_config(self, **kwargs):
        """Update configuration with new values."""
        cli_to_config = {
            'n': 'experiment_name',
            'version': 'experiment_version', 
            'd': 'experiment_desc',
            't': 'experiment_tags',
            's': 'simulator'
            # Add other mappings as needed
        }

        for key, value in kwargs.items():
            config_key = cli_to_config.get(key, key)
            if hasattr(self.config, config_key):
                setattr(self.config, config_key, value)
                
        self.save_config()

    def ensure_directories(self):
        """Ensure required directories exist."""
        src_dir = Path(self.config.src_dir)
        output_dir = Path(self.config.output_dir)
        
        # Create output directory
        output_dir.mkdir(parents=True, exist_ok=True)
        
        # Create src directory if it doesn't exist and add example
        if not src_dir.exists():
            src_dir.mkdir(parents=True)
            self._create_example_module(src_dir)
        
        return src_dir, output_dir
            
    def _create_example_module(self, src_dir: Path):
        """Create example module in src directory.
        
        Args:
            src_dir: Source directory path
        """
        example = """// example_module.v
    // This is an example HDL module
    module example_module #(
        parameter WIDTH = 8
    )(
        input wire clk,
        input wire rst_n,
        input wire [WIDTH-1:0] data_in,
        output reg [WIDTH-1:0] data_out
    );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data_out <= {WIDTH{1'b0}};
        else
            data_out <= data_in;
    end

    endmodule
    """
        readme = """# HDL Source Directory

    This directory contains your HDL source files.

    ## Directory Structure
    ```
    src/
    ├── example_module.v  # Example module
    └── your_modules.v    # Add your modules here
    ```

    ## Adding Modules
    1. Create your Verilog files in this directory
    2. Name them according to your module names (e.g., `full_adder.v` for a full adder)
    3. Run HDLOpt analysis using:
    ```bash
    hdlopt analyze [module_names]
    ```
    """
        # Write files using UTF-8 encoding
        with open(src_dir / "example_module.v", 'w', encoding='utf-8') as f:
            f.write(example)

        with open(src_dir / "README.md", 'w', encoding='utf-8') as f:
            f.write(readme)

    def get_runner_config(self, override_args: Optional[Dict] = None) -> Dict:
        """Get configuration for HDLAnalysisRunner.
        
        Args:
            override_args: Optional arguments to override stored config
            
        Returns:
            Dictionary of configuration values
        """
        config_dict = self.config.to_dict()
        if override_args:
            config_dict.update(override_args)
        return config_dict