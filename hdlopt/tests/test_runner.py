from hdlopt.runner import AnalysisType, HDLAnalysisRunner, RunnerConfig
from hdlopt.runner import main as runner_main

import argparse
import json
import os
import shutil
import sqlite3
import subprocess
import sys
from io import StringIO
from pathlib import Path
from unittest.mock import MagicMock, patch

import pytest

@pytest.fixture
def temp_workspace(tmp_path):
    """Create a temporary workspace with sample Verilog files."""
    # Create directory structure
    src_dir = tmp_path / "src"
    src_dir.mkdir()

    # Create sample Verilog files
    files = {
        "half_adder.v": """
        module half_adder(
            input a,
            input b,
            output sum,
            output cout
        );
            assign sum = a ^ b;
            assign cout = a & b;
        endmodule
        """,
        "full_adder.v": """
        module full_adder(
            input a,
            input b,
            input cin,
            output sum,
            output cout
        );
            wire sum1, cout1, cout2;

            half_adder ha1(
                .a(a),
                .b(b),
                .sum(sum1),
                .cout(cout1)
            );

            half_adder ha2(
                .a(sum1),
                .b(cin),
                .sum(sum),
                .cout(cout2)
            );

            assign cout = cout1 | cout2;
        endmodule
        """,
        "counter.v": """
        module counter #(
            parameter WIDTH = 4
        ) (
            input clk,
            input rst,
            output reg [WIDTH-1:0] count
        );
            always @(posedge clk or posedge rst) begin
                if (rst)
                    count <= 0;
                else
                    count <= count + 1;
            end
        endmodule
        """,
    }

    for filename, content in files.items():
        (src_dir / filename).write_text(content)

    return tmp_path


@pytest.fixture
def mock_simulators():
    """Mock simulator execution."""

    def create_mock_testbench(base_dir, filename):
        tb_path = Path(base_dir) / filename
        tb_path.write_text(
            """
        module tb_test;
        // Mock testbench content
        endmodule
        """
        )
        return tb_path

    # Save the original subprocess.run before mocking
    original_run = subprocess.run
    with patch("subprocess.run") as mock_run, patch("shutil.copy2") as mock_copy, patch(
        "shutil.move"
    ) as mock_move:

        def side_effect(*args, **kwargs):
            # Check if the command is a simulator command
            if args and any(
                x in args[0][0].lower()
                for x in ["modelsim", "vsim", "iverilog", "vvp", "vivado"]
            ):
                # Create mock testbench file
                if args[0]:
                    test_name = "tb_test.v"
                    create_mock_testbench(Path(args[0][-1]).parent, test_name)

                # Return a successful mock result for simulator commands
                return MagicMock(returncode=0, stdout=b"", stderr=b"")
            else:
                # Delegate to the original subprocess.run for other commands
                return original_run(*args, **kwargs)

        mock_run.side_effect = side_effect
        mock_copy.side_effect = shutil.copy2
        mock_move.side_effect = shutil.move
        yield mock_run


@pytest.fixture
def mock_analysis():
    """Fixture providing mock analysis implementation with valid PDFs."""

    def _mock_analysis(analysis_type, module_name, module_dir, module_details):
        # Valid minimal PDF content
        pdf_content = b"""%PDF-1.4
1 0 obj
<</Type/Catalog/Pages 2 0 R>>
endobj
2 0 obj
<</Type/Pages/Kids[3 0 R]/Count 1>>
endobj
3 0 obj
<</Type/Page/MediaBox[0 0 612 792]/Parent 2 0 R>>
endobj
xref
0 4
0000000000 65535 f
0000000018 00000 n
0000000069 00000 n
0000000122 00000 n
trailer
<</Size 4/Root 1 0 R>>
startxref
175
%%EOF"""

        report_path = None
        if analysis_type == AnalysisType.TIMING:
            report_path = module_dir / f"{module_name}_timing_report.pdf"
            with open(report_path, "wb") as f:
                f.write(pdf_content)
        elif analysis_type == AnalysisType.POWER:
            report_path = module_dir / f"{module_name}_power_report.pdf"
            with open(report_path, "wb") as f:
                f.write(pdf_content)
        elif analysis_type == AnalysisType.WAVEFORM:
            report_path = module_dir / f"{module_name}_waveform_report.pdf"
            with open(report_path, "wb") as f:
                f.write(pdf_content)
        elif analysis_type == AnalysisType.SCHEMATIC:
            report_path = module_dir / f"{module_name}_schematic.pdf"
            with open(report_path, "wb") as f:
                f.write(pdf_content)

        return report_path if report_path and report_path.exists() else None

    return _mock_analysis


class TestHDLAnalysisRunner:
    """Test suite for HDL analysis runner."""

    def test_basic_initialization(self, temp_workspace):
        """Test basic runner initialization."""
        config = RunnerConfig(
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
        )
        runner = HDLAnalysisRunner(config)

        assert runner.src_dir == Path(str(temp_workspace / "src"))
        assert runner.output_dir == Path(temp_workspace) / "generated"
        assert runner.config.analyses == list(AnalysisType)

    #@pytest.mark.skipif(shutil.which('vlib') is None, reason="ModelSim not available")
    def test_directory_creation(self, temp_workspace, mock_simulators, mock_analysis):
        """Test directory structure creation."""
        config = RunnerConfig(
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
            simulator="iverilog"
        )
        runner = HDLAnalysisRunner(config)

        def mock_analysis(analysis_type, module_name, module_dir, module_details):
            # Valid minimal PDF content
            pdf_content = b"""%PDF-1.4
        1 0 obj
        <</Type/Catalog/Pages 2 0 R>>
        endobj
        2 0 obj
        <</Type/Pages/Kids[3 0 R]/Count 1>>
        endobj
        3 0 obj
        <</Type/Page/MediaBox[0 0 612 792]/Parent 2 0 R>>
        endobj
        xref
        0 4
        0000000000 65535 f
        0000000018 00000 n
        0000000069 00000 n
        0000000122 00000 n
        trailer
        <</Size 4/Root 1 0 R>>
        startxref
        175
        %%EOF"""

            report_path = None
            if analysis_type == AnalysisType.TIMING:
                report_path = module_dir / f"{module_name}_timing_report.pdf"
                with open(report_path, "wb") as f:
                    f.write(pdf_content)
            elif analysis_type == AnalysisType.POWER:
                report_path = module_dir / f"{module_name}_power_report.pdf"
                with open(report_path, "wb") as f:
                    f.write(pdf_content)
            elif analysis_type == AnalysisType.WAVEFORM:
                report_path = module_dir / f"{module_name}_waveform_report.pdf"
                with open(report_path, "wb") as f:
                    f.write(pdf_content)
            elif analysis_type == AnalysisType.SCHEMATIC:
                report_path = module_dir / f"{module_name}_schematic.pdf"
                with open(report_path, "wb") as f:
                    f.write(pdf_content)

            return report_path if report_path and report_path.exists() else None

        # Use the mock with side effect
        with patch.object(runner, "_run_analysis", side_effect=mock_analysis):
            runner.run(["full_adder"])

        # Check directory structure
        assert (temp_workspace / "generated" / "full_adder").exists()
        assert (temp_workspace / "generated" / "full_adder" / "half_adder").exists()
        assert (temp_workspace / "generated" / "full_adder" / "hierarchy.json").exists()

        # Verify hierarchy JSON
        with open(temp_workspace / "generated" / "full_adder" / "hierarchy.json") as f:
            hierarchy = json.load(f)
            assert "full_adder" in hierarchy
            assert "half_adder" in hierarchy["full_adder"]

        # Check for generated PDFs
        assert (
            temp_workspace / "generated" / "full_adder" / "full_adder_timing_report.pdf"
        ).exists()
        assert (
            temp_workspace / "generated" / "full_adder" / "full_adder_power_report.pdf"
        ).exists()
        assert (
            temp_workspace
            / "generated"
            / "full_adder"
            / "full_adder_waveform_report.pdf"
        ).exists()
        assert (
            temp_workspace / "generated" / "full_adder" / "full_adder_schematic.pdf"
        ).exists()
        assert (
            temp_workspace / "generated" / "full_adder" / "full_adder_analysis.pdf"
        ).exists()

    #@pytest.mark.skipif(shutil.which('vlib') is None, reason="ModelSim not available")
    def test_module_parsing(self, temp_workspace, mock_simulators, mock_analysis):
        """Test Verilog module parsing."""
        config = RunnerConfig(
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
            simulator="iverilog"
        )
        runner = HDLAnalysisRunner(config)

        with patch.object(runner, "_run_analysis", side_effect=mock_analysis):
            runner.run(["counter"])

        # Check module details JSON
        details_file = temp_workspace / "generated" / "counter" / "counter_details.json"
        assert details_file.exists()

        with open(details_file) as f:
            details = json.load(f)
            assert details["component_name"] == "counter"
            assert any(p["name"] == "WIDTH" for p in details["parameters"])
            assert details["submodules"] == []

    def test_analysis_selection(self, temp_workspace, mock_simulators, mock_analysis):
        """Test running specific analyses."""
        # Test running only timing and power analysis
        config = RunnerConfig(
            analyses=[AnalysisType.TIMING, AnalysisType.POWER],
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
        )
        runner = HDLAnalysisRunner(config)

        with patch.object(runner, "_run_analysis") as mock_analysis:
            runner.run(["full_adder"])

            # Verify only requested analyses were run
            analysis_types = [call[0][0] for call in mock_analysis.call_args_list]
            assert set(analysis_types) == {AnalysisType.TIMING, AnalysisType.POWER}

    #@pytest.mark.skipif(shutil.which('vlib') is None, reason="ModelSim not available")
    def test_testbench_generation(self, temp_workspace, mock_simulators, mock_analysis):
        """Test testbench generation and simulation."""
        config = RunnerConfig(
            analyses=[AnalysisType.TESTBENCH],
            output_dir=str(temp_workspace / "generated"),
            simulator="iverilog",
            src_dir=str(temp_workspace / "src"),
        )
        runner = HDLAnalysisRunner(config)

        with patch.object(runner, "_run_analysis", side_effect=mock_analysis):
            runner.run(["half_adder"])

        # Check testbench generation by searching recursively
        generated_dir = temp_workspace / "generated" / "half_adder"
        # Ensure the directory exists before globbing
        generated_dir.mkdir(parents=True, exist_ok=True)
        # Search for the testbench file in any subdirectory
        testbench_files = list(generated_dir.rglob("tb_0_0_half_adder.v"))
        assert (
            len(testbench_files) > 0
        ), "Testbench file not found in generated directory"

    def test_report_generation(self, temp_workspace, mock_analysis):
        """Test PDF report generation."""
        config = RunnerConfig(
            analyses=[AnalysisType.TIMING, AnalysisType.POWER],
            output_dir=str(temp_workspace / "generated"),
            combine_pdfs=True,
            src_dir=str(temp_workspace / "src"),
            simulator="iverilog"
        )
        runner = HDLAnalysisRunner(config)

        # Valid minimal PDF content
        pdf_content = b"""%PDF-1.4
    1 0 obj
    <</Type/Catalog/Pages 2 0 R>>
    endobj
    2 0 obj
    <</Type/Pages/Kids[3 0 R]/Count 1>>
    endobj
    3 0 obj
    <</Type/Page/MediaBox[0 0 612 792]/Parent 2 0 R>>
    endobj
    xref
    0 4
    0000000000 65535 f
    0000000018 00000 n
    0000000069 00000 n
    0000000122 00000 n
    trailer
    <</Size 4/Root 1 0 R>>
    startxref
    175
    %%EOF"""

        def mock_timing_analysis(self):
            module_name = "counter"
            output_dir = temp_workspace / "generated" / module_name
            output_dir.mkdir(parents=True, exist_ok=True)
            report_path = output_dir / f"{module_name}_timing_report.pdf"
            with open(report_path, "wb") as f:
                f.write(pdf_content)
            return {"wns": 1.0, "tns": -2.0}, report_path

        def mock_power_analysis(self):
            module_name = "counter"
            output_dir = temp_workspace / "generated" / module_name
            output_dir.mkdir(parents=True, exist_ok=True)
            report_path = output_dir / f"{module_name}_power_report.pdf"
            with open(report_path, "wb") as f:
                f.write(pdf_content)
            return {"total": 1.5, "dynamic": 0.8}, report_path

        with patch("subprocess.run"), patch(
            "hdlopt.scripts.analysis.timing.TimingAnalyzer.analyze",
            mock_timing_analysis,
        ), patch(
            "hdlopt.scripts.analysis.power.PowerAnalyzer.analyze", mock_power_analysis
        ):
            runner.run(["counter"])

        # Verify PDF generation
        timing_report = (
            temp_workspace / "generated" / "counter" / "counter_timing_report.pdf"
        )
        power_report = (
            temp_workspace / "generated" / "counter" / "counter_power_report.pdf"
        )
        combined_report = (
            temp_workspace / "generated" / "counter" / "counter_analysis.pdf"
        )

        assert timing_report.exists(), "Timing report not generated"
        assert power_report.exists(), "Power report not generated"
        assert combined_report.exists(), "Combined report not generated"

    def test_error_handling(self, temp_workspace):
        """Test error handling for various scenarios."""
        config = RunnerConfig(
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
        )
        runner = HDLAnalysisRunner(config)

        # Test nonexistent module
        with pytest.raises(FileNotFoundError):
            runner.run(["nonexistent"])

        # Test syntax error in Verilog
        bad_verilog = temp_workspace / "src" / "bad.v"
        bad_verilog.write_text("module bad(); endmodule")  # Missing semicolon

        with pytest.raises(Exception):
            runner.run(["bad"])


class TestCommandLine:
    """Test command line interface."""

    #@pytest.mark.skipif(shutil.which('vlib') is None, reason="ModelSim not available")
    def test_cli_all_modules(self, temp_workspace, mock_simulators):
        """Test running all modules from command line."""
        with patch(
            "sys.argv",
            [
                "runner.py",
                "analyze",
                "-o",
                str(temp_workspace / "generated"),
                "-src",
                str(temp_workspace / "src"),
                "-s", "iverilog",
                "-v",
            ],
        ):
            with patch.dict(
                os.environ, {"HDLOPT_OUTPUT_DIR": str(temp_workspace / "generated")}
            ):
                runner_main()

        # Should analyze all .v files in src/
        assert (temp_workspace / "generated" / "half_adder").exists()
        assert (temp_workspace / "generated" / "full_adder").exists()
        assert (temp_workspace / "generated" / "counter").exists()

    def test_cli_specific_analyses(
        self, temp_workspace, mock_simulators, mock_analysis
    ):
        """Test running specific analyses from command line."""
        with patch(
            "sys.argv",
            [
                "runner.py",
                "analyze",
                "counter",
                "-a",
                "timing",
                "power",
                "-o",
                str(temp_workspace / "generated"),
                "-src",
                str(temp_workspace / "src"),
                "-s", "iverilog",
                "-v",
            ],
        ), patch(
            "hdlopt.runner.HDLAnalysisRunner._run_analysis", side_effect=mock_analysis
        ):
            runner_main()

        # Check only requested analyses were run
        counter_dir = temp_workspace / "generated" / "counter"
        assert (counter_dir / "counter_timing_report.pdf").exists()
        assert (counter_dir / "counter_power_report.pdf").exists()
        assert not (counter_dir / "counter_netlist.json").exists()

    #@pytest.mark.skipif(shutil.which('vlib') is None, reason="ModelSim not available")
    def test_cli_simulator_selection(self, temp_workspace, mock_simulators):
        """Test simulator selection from command line."""
        with patch(
            "sys.argv",
            [
                "runner.py",
                "analyze",
                "half_adder",
                "--simulator",
                "iverilog",
                "-o",
                str(temp_workspace / "generated"),
                "-src",
                str(temp_workspace / "src"),
                "-v",
            ],
        ):
            runner_main()

        # Verify iverilog was used by checking command arguments
        iverilog_calls = [
            call_args
            for call_args, _ in mock_simulators.call_args_list
            if "iverilog" in call_args[0] or "vvp" in call_args[0]
        ]

        # for call_args in iverilog_calls:
        # print(call_args, len(call_args))

        assert len(iverilog_calls) > 0, "No iverilog commands detected"
        assert any(
            "vvp" in call_args[0] for call_args in iverilog_calls
        ), "Missing vvp simulation command"

    def test_cli_help(self, capsys):
        """Test help message display."""
        with pytest.raises(SystemExit):
            with patch("sys.argv", ["runner.py", "--help"]):
                runner_main()

        captured = capsys.readouterr()
        print(captured.out)
        assert "HDL Analysis Runner" in captured.out
        assert "Examples:" in captured.out
        assert all(a.name.lower() in captured.out for a in AnalysisType)


class TestExperimentTracking:
    """Test suite for experiment tracking functionality."""

    def test_experiment_initialization(self, temp_workspace):
        """Test experiment tracking initialization."""
        config = RunnerConfig(
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
            experiment_name="test_experiment",
            experiment_version="1.0",
            experiment_desc="Test description",
            experiment_tags={"type": "test"},
        )
        runner = HDLAnalysisRunner(config)

        assert runner.experiment_manager is not None
        assert runner.experiment_manager.db_path.exists()

        # Verify experiment configuration was passed correctly
        exp_config = runner.experiment_manager.config
        assert exp_config.name == "test_experiment"
        assert exp_config.version == "1.0"
        assert exp_config.description == "Test description"
        assert exp_config.tags == {"type": "test"}

    def test_run_tracking(self, temp_workspace, mock_simulators, mock_analysis):
        """Test that analysis runs are properly tracked."""
        config = RunnerConfig(
            analyses=[AnalysisType.TIMING, AnalysisType.POWER],
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
            experiment_name="test_tracking",
        )
        runner = HDLAnalysisRunner(config)

        with patch.object(runner, "_run_analysis", side_effect=mock_analysis):
            run_id = runner.run(["counter"])

        # Verify run was recorded
        assert run_id is not None
        run = runner.experiment_manager._load_run(run_id)
        assert run is not None
        assert "counter" in run.components

        # Verify metrics were recorded
        assert run.metrics
        assert any("counter" in key for key in run.metrics.keys())

    #@pytest.mark.skipif(shutil.which('vlib') is None, reason="ModelSim not available")
    def test_multiple_runs(self, temp_workspace, mock_simulators, mock_analysis):
        """Test handling multiple analysis runs."""
        config = RunnerConfig(
            analyses=[AnalysisType.TESTBENCH],
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
            experiment_name="multi_test",
            simulator="iverilog"
        )
        runner = HDLAnalysisRunner(config)

        # First run with one module
        with patch.object(runner, "_run_analysis", side_effect=mock_analysis):
            run1_id = runner.run(["counter"])

        # Second run with multiple modules
        with patch.object(runner, "_run_analysis", side_effect=mock_analysis):
            run2_id = runner.run(["full_adder", "half_adder"])

        # Compare runs
        comparison = runner.experiment_manager.compare_runs(run1_id, run2_id)
        assert comparison is not None
        assert (
            len(comparison["component_changes"]) > 0
        )  # Should detect different modules

    #@pytest.mark.skipif(shutil.which('vlib') is None, reason="ModelSim not available")
    def test_module_history(self, temp_workspace, mock_simulators, mock_analysis):
        """Test tracking module version history."""
        config = RunnerConfig(
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
            experiment_name="history_test",
            simulator="iverilog",
            verbose=True
        )
        runner = HDLAnalysisRunner(config)

        # First version
        with patch.object(runner, "_run_analysis", side_effect=mock_analysis):
            run1_id = runner.run(["counter"])

        # Modify module
        counter_file = temp_workspace / "src" / "counter.v"
        original_content = counter_file.read_text()
        modified_content = original_content.replace("WIDTH = 4", "WIDTH = 8")
        counter_file.write_text(modified_content)

        # Second version
        with patch.object(runner, "_run_analysis", side_effect=mock_analysis):
            run2_id = runner.run(["counter"])

        # Check history
        history = runner.experiment_manager.get_component_history("counter")
        assert len(history) == 2
        assert history[0]["run_id"] == run2_id
        assert history[1]["run_id"] == run1_id

    #@pytest.mark.skipif(shutil.which('vlib') is None, reason="ModelSim not available")
    def test_cli_experiment_options(
        self, temp_workspace, mock_simulators, mock_analysis
    ):
        """Test experiment tracking CLI options."""
        # Test with experiment options
        with patch(
            "sys.argv",
            [
                "runner.py",
                "analyze",
                "counter",
                "-n",
                "cli_test",
                "--version",
                "2.0",
                "-d",
                "CLI test experiment",
                "-t",
                "type=cli",
                "testcase=basic",
                "-s", "iverilog",
                "-o",
                str(temp_workspace / "generated"),
                "-src",
                str(temp_workspace / "src"),
            ],
        ), patch(
            "hdlopt.runner.HDLAnalysisRunner._run_analysis", side_effect=mock_analysis
        ):
            runner_main()

        # Verify experiment was created
        db_path = temp_workspace / "generated" / "experiments.db"
        assert db_path.exists()

        with sqlite3.connect(db_path) as conn:
            cursor = conn.execute("SELECT * FROM runs")
            runs = cursor.fetchall()
            assert len(runs) == 1

            run_data = json.loads(runs[0][4])  # config column
            assert run_data.get("experiment_name") == "cli_test"
            assert run_data.get("experiment_version") == "2.0"

    #@pytest.mark.skipif(shutil.which('vlib') is None, reason="ModelSim not available")
    def test_experiment_commands(self, temp_workspace, mock_simulators, mock_analysis):
        """Test experiment management commands."""

        # First create some data
        config = RunnerConfig(
            output_dir=str(temp_workspace / "generated"),
            src_dir=str(temp_workspace / "src"),
            experiment_name="command_test",
            simulator="iverilog",
            verbose=True
        )
        runner = HDLAnalysisRunner(config)

        with patch.object(runner, "_run_analysis", side_effect=mock_analysis):
            run_id = runner.run(["counter"])

        print("Run id:", run_id)

        runner.experiment_manager._close_connections()

        # Helper function for command testing
        def run_command_and_capture(args, expected_text):
            output = StringIO()
            old_stdout = sys.stdout
            sys.stdout = output

            try:
                with patch("sys.argv", ["runner.py"] + args):
                    with patch(
                        "argparse.ArgumentParser.parse_args",
                        return_value=argparse.Namespace(
                            command=args[0],
                            output_dir=str(temp_workspace / "generated"),
                            experiment_name="command_test",
                            run_id=args[1] if args[0] == "show-run" else None,
                            module=args[1] if args[0] == "history" else None,
                        ),
                    ):
                        # Use the same runner instance to ensure same database
                        (
                            runner.list_runs()
                            if args[0] == "list-runs"
                            else (
                                runner.show_run_details(args[1])
                                if args[0] == "show-run"
                                else runner.show_component_history(args[1])
                            )
                        )

                output_str = output.getvalue()
                print(f"Captured output for {args[0]}:", output_str)
                assert expected_text in output_str

            finally:
                sys.stdout = old_stdout

        # Test list-runs command
        run_command_and_capture(["list-runs"], "command_test")

        # Test show-run command
        run_command_and_capture(["show-run", run_id], "counter")

        # Test history command
        run_command_and_capture(["history", "counter"], run_id)


if __name__ == "__main__":
    pytest.main([__file__])
