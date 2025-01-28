from ..scripts.analysis.netlist import ModuleMetrics
from ..scripts.analysis.resource import ResourceAnalysisConfig, ResourceAnalyzer
from .test_analysis_fixtures import temp_component_dir, sample_netlist

import json
import os
import subprocess
from unittest.mock import MagicMock, patch
import pytest

class TestResourceAnalyzer:
    """Test suite for resource analyzer"""

    def test_initialization(self, temp_component_dir):
        """Test analyzer initialization"""
        analyzer = ResourceAnalyzer("test_component")
        assert analyzer.component_name == "test_component"
        assert isinstance(analyzer.config, ResourceAnalysisConfig)

    @patch("subprocess.run")
    def test_yosys_execution(self, mock_run, temp_component_dir, sample_netlist):
        """Test Yosys execution and netlist generation"""
        mock_run.return_value = MagicMock(
            returncode=0, stdout="Synthesis successful", stderr=""
        )

        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))

        # Mock netlist file creation
        netlist_path = temp_component_dir / "test_component_netlist.json"
        with open(netlist_path, "w") as f:
            json.dump(sample_netlist, f)

        netlist = analyzer._run_yosys()

        assert mock_run.called
        assert "synth -top test_component" in mock_run.call_args[0][0][2]
        assert netlist == sample_netlist

    def test_netlist_analysis(self, temp_component_dir, sample_netlist):
        """Test netlist analysis"""
        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))

        analyses = analyzer._analyze_netlist(sample_netlist)
        print(analyses)

        assert len(analyses) > 0
        # assert all(isinstance(analysis["test_module"], ModuleMetrics) for analysis in analyses.values())

        # Verify metrics for test_module
        metrics = analyses["4"]["test_module"]  # Parameter WIDTH=4
        assert metrics.wire_count == 2
        assert metrics.port_count == 3
        assert metrics.cell_count == 2
        assert metrics.hierarchy_depth == 1
        assert "full_adder" in metrics.cells
        assert "$_AND_" in metrics.raw_gates

    def test_report_generation(self, temp_component_dir, sample_netlist):
        """Test report generation"""
        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))

        # Create sample analysis results
        analyses = {
            "4": {  # WIDTH=4
                "test_module": ModuleMetrics(
                    wire_count=10,
                    port_count=5,
                    cell_count=3,
                    cells={"full_adder": 2},
                    raw_gates={"$_AND_": 4},
                )
            }
        }

        analyzer._generate_report(analyses)

        report_path = temp_component_dir / "test_component_resusage_report.pdf"
        assert report_path.exists()
        assert report_path.stat().st_size > 0

    def test_parameter_handling(self, temp_component_dir):
        """Test parameter configuration handling"""
        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))

        configs = analyzer._get_parameter_configs()
        assert len(configs) > 0
        assert all("WIDTH" in config for config in configs)

        # Test parameter update
        analyzer._update_parameters({"WIDTH": 8})

        # Verify Verilog file was updated
        with open(temp_component_dir / "test_component.v") as f:
            content = f.read()
            assert "parameter WIDTH = 8" in content

    @patch("subprocess.run")
    def test_error_handling(self, mock_run, temp_component_dir):
        """Test error handling"""
        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))

        # Create dummy netlist file
        netlist_path = temp_component_dir / "test_component_netlist.json"
        netlist_path.write_text("{}")

        # Test Yosys failure
        mock_run.return_value = MagicMock(returncode=1, stderr="Synthesis failed")

        with pytest.raises(subprocess.CalledProcessError):
            analyzer._run_yosys()

        # Test missing netlist
        netlist_path.unlink()
        mock_run.return_value = MagicMock(returncode=0)
        with pytest.raises(FileNotFoundError):
            analyzer._run_yosys()

        # Test invalid parameter update
        with pytest.raises(ValueError):
            analyzer._update_parameters({"INVALID": 8})

    def test_recursive_analysis(self, temp_component_dir, sample_netlist):
        """Test recursive submodule analysis"""
        config = ResourceAnalysisConfig(recursive=True)
        analyzer = ResourceAnalyzer(
            "test_component", config, base_dir=str(temp_component_dir)
        )

        analyses = analyzer._analyze_netlist(sample_netlist)

        # Verify full_adder was analyzed
        assert "full_adder" in analyses["4"]
        metrics = analyses["4"]["full_adder"]
        assert metrics.wire_count == 2
        assert metrics.cell_count == 2
        assert "$_XOR_" in metrics.raw_gates

    def test_parameter_extraction(self, temp_component_dir):
        """Test parameter extraction from testbenches"""
        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))

        # Test standard testbench
        tb_path = temp_component_dir / "tb_WIDTH4_test_component.v"
        params = analyzer._extract_params_from_testbench(tb_path)
        assert params == {"WIDTH": 4}

        # Test multiple parameters
        tb_text = """
        module tb_WIDTH8_N4_test_component;
            parameter WIDTH = 8;
            parameter N = 4;
        """
        tb_path = temp_component_dir / "tb_WIDTH8_N4_test_component.v"
        tb_path.write_text(tb_text)

        params = analyzer._extract_params_from_testbench(tb_path)
        assert params == {"WIDTH": 8, "N": 4}

        # Test invalid format
        tb_path = temp_component_dir / "tb_invalid_test_component.v"
        tb_path.touch()
        assert analyzer._extract_params_from_testbench(tb_path) is None

    def test_parameter_config_generation(self, temp_component_dir):
        """Test parameter configuration generation"""
        config = ResourceAnalysisConfig(
            param_ranges={"WIDTH": (4, 9), "N": (2, 5)}  # 4 to 8  # 2 to 4
        )
        analyzer = ResourceAnalyzer(
            "test_component", config, base_dir=str(temp_component_dir)
        )

        configs = analyzer._generate_param_configs()
        assert len(configs) == 15  # 5 WIDTH values * 3 N values
        assert {"WIDTH": 4, "N": 2} in configs
        assert {"WIDTH": 8, "N": 4} in configs

    def test_parameter_update(self, temp_component_dir):
        """Test parameter value updates"""
        # Create test file with both parameters
        verilog_content = """
        module test_component #(
            parameter WIDTH = 4,
            parameter N = 2
        ) (
            input clk,
            input rst
        );
        endmodule
        """
        (temp_component_dir / "test_component.v").write_text(verilog_content)

        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))

        # Test single parameter update
        analyzer._update_parameters({"WIDTH": 8})
        with open(temp_component_dir / "test_component.v") as f:
            content = f.read()
            assert "parameter WIDTH = 8" in content

        # Test multiple parameter update
        analyzer._update_parameters({"WIDTH": 16, "N": 4})
        with open(temp_component_dir / "test_component.v") as f:
            content = f.read()
            assert "parameter WIDTH = 16" in content
            assert "parameter N = 4" in content

        # Test invalid parameter
        with pytest.raises(ValueError):
            analyzer._update_parameters({"INVALID": 8})

    def test_increment_step_calculation(self, temp_component_dir):
        """Test clog2 increment step calculation"""
        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))

        # Test various start values
        assert analyzer._calculate_increment_step(1) == 1  # 1->2 changes clog2
        assert analyzer._calculate_increment_step(2) == 2  # 2->4 changes clog2
        assert analyzer._calculate_increment_step(4) == 4  # 4->8 changes clog2
        assert analyzer._calculate_increment_step(8) == 8  # 8->16 changes clog2

    def test_raw_gate_collection(self, sample_netlist, temp_component_dir):
        """Test raw gate counting"""
        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))
        raw_gates = {}

        analyzer._collect_raw_gates(
            sample_netlist["modules"]["test_module"], sample_netlist, raw_gates
        )

        # One in test_module, one in full_adder
        assert raw_gates["$_AND_"] == 2
        assert raw_gates["$_XOR_"] == 1  # One in full_adder

    def test_yosys_script_generation(self, temp_component_dir):
        """Test Yosys script generation"""
        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))
        script = analyzer._generate_yosys_script()

        assert "read_verilog" in script
        assert "synth -top test_component" in script
        assert "write_json" in script
        assert "stat" in script

        # Verify script file
        script_path = analyzer._write_yosys_script(script)
        assert script_path.exists()
        assert script_path.name == "test_component_script.ys"

    def test_environment_setup(self, temp_component_dir):
        """Test environment setup and teardown"""
        analyzer = ResourceAnalyzer("test_component", base_dir=str(temp_component_dir))
        original_env = os.environ.copy()

        with patch("subprocess.run") as mock_run:
            # Mock OSS CAD Suite setup
            mock_run.side_effect = [
                # First call: environment.bat
                MagicMock(returncode=0),
                # Second call: yosys --version
                MagicMock(returncode=0, stdout="Yosys 0.9"),
            ]

            # Setup environment
            analyzer.env.setup_yosys()

            # Verify calls
            assert mock_run.call_count >= 1
            calls = mock_run.call_args_list
            if "environment.bat" in calls[0][0][0]:
                assert "--version" in calls[1][0][0] 
            else:
                assert "--version" in calls[0][0][0]
                
        # Teardown
        analyzer.env.teardown()
        assert os.environ == original_env
