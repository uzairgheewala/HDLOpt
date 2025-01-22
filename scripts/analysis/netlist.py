from typing import Dict
from dataclasses import dataclass

from ..logger import logger

def parse_netlist(netlist_path: str) -> Dict:
    """Parse Yosys JSON netlist file
    
    Args:
        netlist_path: Path to netlist JSON file
        
    Returns:
        Parsed netlist dictionary
        
    Raises:
        FileNotFoundError: If netlist file not found
        ValueError: If netlist parsing fails
    """
    try:
        import json
        with open(netlist_path) as f:
            return json.load(f)
    except FileNotFoundError:
        raise FileNotFoundError(f"Netlist file not found: {netlist_path}")
    except json.JSONDecodeError as e:
        raise ValueError(f"Failed to parse netlist: {str(e)}")

@dataclass
class ModuleMetrics:
    """Metrics for a single module"""
    wire_count: int = 0
    wire_bits: int = 0  
    port_count: int = 0
    port_bits: int = 0
    cell_count: int = 0
    hierarchy_depth: int = 0
    cells: Dict[str, int] = None
    raw_gates: Dict[str, int] = None
    sub_modules: Dict[str, int] = None

    def __post_init__(self):
        """Initialize empty dictionaries"""
        if self.cells is None:
            self.cells = {}
        if self.raw_gates is None:
            self.raw_gates = {}
        if self.sub_modules is None:
            self.sub_modules = {}

class NetlistAnalyzer:
    """Analyzes Yosys JSON netlist structure"""
    
    def analyze(self, netlist: Dict, module_name: str, 
                param_config: Dict, config) -> Dict[str, ModuleMetrics]:
        """Analyze netlist structure and metrics
        
        Args:
            netlist: Yosys JSON netlist
            module_name: Top module name
            param_config: Parameter configuration
            config: Analysis configuration
            
        Returns:
            Dict mapping module names to metrics
        """
        analysis = {}
        
        # Analyze each module
        for module_name, module_data in netlist["modules"].items():
            metrics = self._analyze_module(
                module_data, 
                netlist,
                param_config,
                config
            )
            analysis[module_name] = metrics
            
        return analysis

    def _analyze_module(self, module_data: Dict, netlist: Dict,
                       param_config: Dict, config) -> ModuleMetrics:
        """Analyze a single module
        
        Args:
            module_data: Module section from netlist
            netlist: Complete netlist
            param_config: Parameter configuration 
            config: Analysis configuration
            
        Returns:
            ModuleMetrics object
        """
        metrics = ModuleMetrics(
            wire_count=len(module_data["netnames"]),
            wire_bits=sum(len(net["bits"]) for net in module_data["netnames"].values()),
            port_count=len(module_data["ports"]),
            port_bits=sum(len(port["bits"]) for port in module_data["ports"].values()),
            cell_count=len(module_data["cells"]),
            hierarchy_depth=self._calculate_depth(module_data["name"], netlist),
            cells={},
            raw_gates={},
            sub_modules={}
        )
        
        # Analyze cells
        self._analyze_cells(metrics, module_data, netlist)
        
        # Apply scaling rules
        if config.increment_rules:
            self._apply_increment_rules(metrics, param_config, config.increment_rules, netlist)
            
        return metrics

    def _calculate_depth(self, module_name: str, netlist: Dict, depth: int = 0) -> int:
        """Calculate hierarchy depth recursively"""
        module = netlist["modules"][module_name]
        max_depth = depth
        
        for cell in module["cells"].values():
            if cell["type"] in netlist["modules"]:
                cell_depth = self._calculate_depth(cell["type"], netlist, depth + 1)
                max_depth = max(max_depth, cell_depth)
                
        return max_depth

    def _analyze_cells(self, metrics: ModuleMetrics, module_data: Dict, netlist: Dict):
        """Analyze module cells and gates"""
        for cell_name, cell_data in module_data["cells"].items():
            cell_type = cell_data["type"]
            
            # Track cell count
            if cell_type not in metrics.cells:
                metrics.cells[cell_type] = 0
            metrics.cells[cell_type] += 1
            
            # Handle submodules vs raw gates
            if cell_type in netlist["modules"]:
                if cell_type not in metrics.sub_modules:
                    metrics.sub_modules[cell_type] = 0
                metrics.sub_modules[cell_type] += 1
                
                # Recursively add raw gates from submodule
                self._add_raw_gates(metrics, cell_type, netlist)
            else:
                if cell_type not in metrics.raw_gates:
                    metrics.raw_gates[cell_type] = 0
                metrics.raw_gates[cell_type] += 1

    def _add_raw_gates(self, metrics: ModuleMetrics, module_name: str, netlist: Dict):
        """Add raw gates from submodule recursively"""
        module = netlist["modules"][module_name]
        
        for cell in module["cells"].values():
            cell_type = cell["type"]
            
            if cell_type in netlist["modules"]:
                self._add_raw_gates(metrics, cell_type, netlist)
            else:
                if cell_type not in metrics.raw_gates:
                    metrics.raw_gates[cell_type] = 0
                metrics.raw_gates[cell_type] += 1

    def _apply_increment_rules(
        self,
        metrics: ModuleMetrics,
        param_config: Dict,
        increment_rules: Dict,
        netlist: Dict
    ):
        """
        Apply parameter increment rules *and* add
        the raw gates from newly added submodule instances.
        """
        for rule in increment_rules.values():
            cell_type = rule["cell_type"]
            if cell_type not in metrics.cells:
                # If the top module didn't originally have this cell,
                # there's nothing to increment. Skip.
                continue

            param_val = param_config[rule["param_name"]]
            base_value = rule.get("base_value", 4)  # default or per-rule base
            increment_per_param = rule["increment_per_param"]

            # Number of additional copies to add
            increments = max(0, param_val - base_value) * increment_per_param
            if increments <= 0:
                continue

            old_count = metrics.cells[cell_type]  # original # of that cell
            new_count = old_count + increments
            metrics.cells[cell_type] = new_count

            # Also update the total cell_count to reflect extra submodule instances
            metrics.cell_count += increments

            # If this cell_type is itself a submodule, then each instance
            # contributes its own raw gates. We need to add gate counts for
            # each new instance. We already have old_count worth of gates
            # added from _analyze_cells(...). So we only add the difference.
            if cell_type in netlist["modules"]:
                # Step 1: analyze a single instance of that submodule
                sub_metrics = ModuleMetrics()
                submodule_data = netlist["modules"][cell_type]
                self._analyze_cells(sub_metrics, submodule_data, netlist)
                # sub_metrics.raw_gates now has the raw gates from 1 instance

                # Step 2: add "increments" more copies of these gates
                for gate_type, count_per_submodule in sub_metrics.raw_gates.items():
                    metrics.raw_gates[gate_type] = (
                        metrics.raw_gates.get(gate_type, 0) 
                        + increments * count_per_submodule
                    )

                # Also track sub_modules, if you want that to reflect all instances
                if cell_type not in metrics.sub_modules:
                    # The original _analyze_cells call already added
                    # sub_modules[cell_type] = old_count if it was recognized
                    metrics.sub_modules[cell_type] = old_count
                metrics.sub_modules[cell_type] += increments