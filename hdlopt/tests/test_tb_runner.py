import pytest
import os
import shutil
import json
import time
from pathlib import Path
import subprocess
from unittest.mock import patch, MagicMock
from textwrap import dedent

from ..scripts.testbench.runner import (
    TestbenchRunner,
    TestResult,
    TestbenchResult,
    timing_wrapper,
)


@pytest.fixture
def sample_testbench():
    """Create sample testbench content"""
    return dedent(
        """
        `timescale 1ns / 1ps
        module tb_N8_WIDTH4_test_component;
            // Parameters
            parameter N = 8;
            parameter WIDTH = 4;
            
            // Inputs
            reg [WIDTH-1:0] data_in;
            reg clk;
            reg rst;
            
            // Outputs
            wire [WIDTH-1:0] data_out;
            
            // Instantiate DUT
            test_component #(
                .N(N),
                .WIDTH(WIDTH)
            ) dut (
                .data_in(data_in),
                .clk(clk),
                .rst(rst),
                .data_out(data_out)
            );
                  
            initial begin
                clk = 0;
                forever #5 clk = ~clk;
            end
            
            initial begin
                // Test case 1
                data_in = 4'b0101;
                #10;
                $display("Test 1: Inputs: data_in=4'b0101 | Outputs: data_out=4'b%04b | Expected: data_out=4'b1010", data_out);
                
                // Test case 2  
                data_in = 4'b1100;
                #10;
                $display("Test 2: Inputs: data_in=4'b1100 | Outputs: data_out=4'b%04b | Expected: data_out=4'b0011", data_out);
                
                $finish;
            end
        endmodule
    """
    )


@pytest.fixture
def temp_testbench_dir(tmp_path, sample_testbench):
    """Create temporary directory with testbench files"""
    test_dir = tmp_path / "test_component"
    test_dir.mkdir()

    # Create testbench file
    tb_file = test_dir / "tb_N8_WIDTH4_test_component.v"
    tb_file.write_text(sample_testbench)

    # Create source file
    src_file = test_dir / "test_component.v"
    src_file.write_text(
        dedent(
            """
        module test_component #(
            parameter N = 8,
            parameter WIDTH = 4
        ) (
            input [WIDTH-1:0] data_in,
            input clk,
            input rst,
            output reg [WIDTH-1:0] data_out
        );
            always @(posedge clk) begin
                data_out <= ~data_in;
            end
        endmodule
    """
        )
    )

    # Create component details
    details = {
        "component_name": "test_component",
        "parameters": [{"name": "N", "value": "8"}, {"name": "WIDTH", "value": "4"}],
        "inputs": [
            ["input", "wire", "unsigned", "WIDTH-1:0", "data_in"],
            ["input", "wire", "unsigned", "1", "clk"],
            ["input", "wire", "unsigned", "1", "rst"],
        ],
        "outputs": [["output", "reg", "unsigned", "WIDTH-1:0", "data_out"]],
    }

    with open(test_dir / "test_component_details.json", "w") as f:
        json.dump(details, f)

    return test_dir


@pytest.fixture
def runner(temp_testbench_dir):
    """Create TestbenchRunner instance"""
    return TestbenchRunner(work_dir=str(temp_testbench_dir))


class TestTestbenchRunner:
    """Test suite for TestbenchRunner class"""

    def test_initialization(self, runner):
        """Test basic initialization"""
        assert runner.simulator == "modelsim"
        assert Path(runner.work_dir).exists()
        assert runner.timeout == 300

    @patch("subprocess.run")
    def test_simulator_setup(self, mock_run, runner):
        """Test simulator environment setup"""
        runner._setup_simulator()
        mock_run.assert_called_once_with(
            ["vlib", "work"], cwd=runner.work_dir, check=True
        )

    def test_parse_value(self, runner):
        """Test parsing of various value formats"""
        assert runner._parse_value("42") == 42
        assert runner._parse_value("8'b00101010") == 42
        assert runner._parse_value("8'h2A") == 42
        assert runner._parse_value("3.14") == 3.14

    def test_extract_params(self, runner):
        """Test parameter extraction from filenames"""
        params = runner._extract_params_from_filename("tb_N8_WIDTH4_test_component.v")
        assert params == {"N": 8, "WIDTH": 4}

    def test_extract_component_name(self, runner):
        """Test component name extraction from filenames"""
        name = runner._extract_component_name("tb_N8_WIDTH4_test_component.v")
        assert name == "test_component"

    @patch("subprocess.run")
    def test_compilation(self, mock_run, runner, temp_testbench_dir):
        """Test source compilation"""
        source_files = list(temp_testbench_dir.glob("*.v"))

        # Mock successful compilation
        mock_run.return_value = MagicMock(
            returncode=0, stdout="Compilation successful", stderr=""
        )

        runner._compile_source(source_files)
        assert mock_run.call_count == len(source_files)

        # Mock compilation failure
        mock_run.return_value = MagicMock(
            returncode=1, stdout="", stderr="Error: syntax error"
        )

        with pytest.raises(RuntimeError):
            runner._compile_source(source_files, force_recompile=True)

    def test_parse_simulation_output(self, runner):
        """Test parsing of simulation output"""
        output = dedent(
            """
            Test 1: Inputs: data_in=4'b0101 | Outputs: data_out=4'b1010 | Expected: data_out=4'b1010
            Test 2: Inputs: data_in=4'b1100 | Outputs: data_out=4'b0011 | Expected: data_out=4'b0011
        """
        )

        results = runner._parse_simulation_output(output)

        assert len(results) == 2
        assert all(isinstance(r, TestResult) for r in results)
        assert all(r.passed for r in results)

        # Verify first test case
        assert results[0].test_case == {"data_in": 5}  # 0101 binary
        assert results[0].actual == {"data_out": 10}  # 1010 binary
        assert results[0].expected == {"data_out": 10}

    @pytest.mark.skipif(
        not shutil.which("vlog") or not shutil.which("vsim"),
        reason="ModelSim not available",
    )
    def test_full_testbench_run(self, runner, temp_testbench_dir):
        """Test complete testbench execution"""
        tb_file = str(temp_testbench_dir / "tb_N8_WIDTH4_test_component.v")
        src_files = [str(temp_testbench_dir / "test_component.v")]

        result = runner.run_testbench(tb_file, src_files)

        assert isinstance(result, TestbenchResult)
        assert result.component_name == "test_component"
        assert result.parameter_config == {"N": 8, "WIDTH": 4}
        assert result.num_tests > 0
        assert result.execution_time > 0

        # Verify all tests passed
        assert result.failed_tests == 0
        assert result.passed_tests == result.num_tests
        assert all(tr.passed for tr in result.test_results)

    @patch("subprocess.run")
    def test_timing_wrapper(self, mock_run):
        """Test timing wrapper functionality"""

        @timing_wrapper
        def dummy_function(*args, **kwargs):
            time.sleep(0.001)
            return TestbenchResult(
                component_name="test",
                parameter_config={},
                num_tests=10,
                passed_tests=10,
                failed_tests=0,
                execution_time=1.0,
                test_results=[],
            )

        result = dummy_function(1, test=True)
        assert result.execution_time > 0

        # Verify timing log was created
        log_file = Path("dummy_function_timing_logs.json")
        assert log_file.exists()

        with open(log_file) as f:
            log_entry = json.loads(f.readline())
            assert "function" in log_entry
            assert "elapsed_time" in log_entry
            assert "num_tests" in log_entry
            assert log_entry["num_tests"] == 10

    def test_recursive_run(self, runner, temp_testbench_dir):
        """Test recursive testbench execution"""
        # Create submodule
        sub_dir = temp_testbench_dir / "submodule"
        sub_dir.mkdir()

        # Create submodule files
        sub_tb = sub_dir / "tb_N4_submodule.v"
        sub_tb.write_text(
            dedent(
                """
            module tb_N4_submodule;
                parameter N = 4;
                reg [N-1:0] in;
                wire [N-1:0] out;
                
                submodule #(N) dut (in, out);
                
                initial begin
                    in = 4'b0101;
                    #10;
                    $display("Test 1: Inputs: in=4'b0101 | Outputs: out=4'b%04b | Expected: out=4'b1010", out);
                    $finish;
                end
            endmodule
        """
            )
        )

        sub_src = sub_dir / "submodule.v"
        sub_src.write_text(
            dedent(
                """
            module submodule #(parameter N = 4) (
                input [N-1:0] in,
                output [N-1:0] out
            );
                assign out = ~in;
            endmodule
        """
            )
        )

        # Create submodule details
        sub_details = {
            "component_name": "submodule",
            "parameters": [{"name": "N", "value": "4"}],
            "inputs": [["input", "wire", "unsigned", "N-1:0", "in"]],
            "outputs": [["output", "wire", "unsigned", "N-1:0", "out"]],
        }

        with open(sub_dir / "submodule_details.json", "w") as f:
            json.dump(sub_details, f)

        # Update main component details to include submodule
        with open(temp_testbench_dir / "test_component_details.json", "r") as f:
            main_details = json.load(f)

        main_details["submodules"] = {"submodule": sub_details}

        with open(temp_testbench_dir / "test_component_details.json", "w") as f:
            json.dump(main_details, f)

        # Run recursive tests
        results = runner.run_recursive(
            "test_component", base_dir=str(temp_testbench_dir.parent)
        )

        # Verify results
        assert (
            len(results) >= 2
        )  # At least one result each for main component and submodule

        main_results = [r for r in results if r.component_name == "test_component"]
        sub_results = [r for r in results if r.component_name == "submodule"]

        assert len(main_results) > 0
        assert len(sub_results) > 0

        # Check main component results
        for result in main_results:
            assert isinstance(result, TestbenchResult)
            assert result.parameter_config.get("N") == 8
            assert result.parameter_config.get("WIDTH") == 4

        # Check submodule results
        for result in sub_results:
            assert isinstance(result, TestbenchResult)
            assert result.parameter_config.get("N") == 4

    def test_error_handling(self, runner, temp_testbench_dir):
        """Test error handling in various scenarios"""

        # Test nonexistent file
        with pytest.raises(FileNotFoundError):
            runner.run_testbench("nonexistent.v", ["test_component.v"])

        # Test compilation timeout
        with patch("subprocess.run") as mock_run:
            mock_run.side_effect = subprocess.TimeoutExpired("vlog", 300)

            with pytest.raises(subprocess.TimeoutExpired):
                runner.run_testbench(
                    str(temp_testbench_dir / "tb_N8_WIDTH4_test_component.v"),
                    [str(temp_testbench_dir / "test_component.v")],
                )

        # Test simulation timeout
        with patch("subprocess.run") as mock_run:

            def mock_run_impl(*args, **kwargs):
                if "vlog" in args[0]:
                    return MagicMock(returncode=0)
                raise subprocess.TimeoutExpired("vsim", 300)

            mock_run.side_effect = mock_run_impl

            with pytest.raises(subprocess.TimeoutExpired):
                runner.run_testbench(
                    str(temp_testbench_dir / "tb_N8_WIDTH4_test_component.v"),
                    [str(temp_testbench_dir / "test_component.v")],
                )

        # Test invalid simulator
        invalid_runner = TestbenchRunner(simulator="invalid")
        with pytest.raises(ValueError):
            invalid_runner.run_testbench(
                str(temp_testbench_dir / "tb_N8_WIDTH4_test_component.v"),
                [str(temp_testbench_dir / "test_component.v")],
            )

    @patch("subprocess.run")
    def test_force_recompile(self, mock_run, runner, temp_testbench_dir):
        """Test force recompile functionality"""
        src_file = str(temp_testbench_dir / "test_component.v")

        # Create mock compilation log
        log_file = Path(src_file).with_suffix(".log")
        log_file.write_text("Previous compilation log")

        mock_run.return_value = MagicMock(returncode=0, stdout="", stderr="")

        # Without force recompile
        runner._compile_source([src_file], force_recompile=False)
        assert mock_run.call_count == 0  # Should skip compilation

        # With force recompile
        runner._compile_source([src_file], force_recompile=True)
        assert mock_run.call_count == 1  # Should recompile

    def test_collect_source_files(self, runner, temp_testbench_dir):
        """Test source file collection"""
        source_files = runner._collect_source_files(temp_testbench_dir)

        # Should find test_component.v but not tb_* files
        assert len(source_files) == 1
        assert os.path.basename(source_files[0]) == "test_component.v"

        # Create some additional files
        (temp_testbench_dir / "helper.v").touch()
        (temp_testbench_dir / "tb_helper.v").touch()
        (temp_testbench_dir / "not_verilog.txt").touch()

        source_files = runner._collect_source_files(temp_testbench_dir)
        assert len(source_files) == 2  # Should find test_component.v and helper.v
        assert not any("tb_" in f for f in source_files)


if __name__ == "__main__":
    pytest.main([__file__])
