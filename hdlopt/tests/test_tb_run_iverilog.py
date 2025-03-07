import shutil
from textwrap import dedent
import os
import pytest

from ..scripts.testbench.runner import TestbenchResult, TestbenchRunner

def get_all_files(root_dir):
    all_files = []
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for filename in filenames:
            all_files.append(filename)
    return all_files

@pytest.mark.skipif(not shutil.which("iverilog"), reason="Icarus Verilog not available")
class TestIVerilogRunner:
    """Test suite for IVerilog-specific functionality"""

    @pytest.fixture
    def iverilog_setup(self, tmp_path):
        """Setup test environment for IVerilog"""
        test_dir = tmp_path / "iverilog_test"
        test_dir.mkdir()

        # Create simple testbench
        tb_content = dedent(
            """
            module tb_adder;
                reg [3:0] a, b;
                wire [4:0] sum;

                adder dut(a, b, sum);

                initial begin
                    a = 4'b0011; b = 4'b0101;
                    #10;
                    $display("Test 1: Inputs: a=4'b0011; b=4'b0101 | Outputs: sum=%b | Expected: sum=5'b01000", sum);

                    a = 4'b1111; b = 4'b0001;
                    #10;
                    $display("Test 2: Inputs: a=4'b1111; b=4'b0001 | Outputs: sum=%b | Expected: sum=5'b10000", sum);

                    $finish;
                end
            endmodule
        """
        )

        # Create DUT
        dut_content = dedent(
            """
            module adder(
                input [3:0] a, b,
                output [4:0] sum
            );
                assign sum = a + b;
            endmodule
        """
        )

        (test_dir / "tb_adder.v").write_text(tb_content)
        (test_dir / "adder.v").write_text(dut_content)

        return test_dir

    def test_iverilog_compilation(self, iverilog_setup):
        """Test compilation with IVerilog"""
        runner = TestbenchRunner(simulator="iverilog", work_dir=str(iverilog_setup))

        # Test compilation without testbench
        src_file = str(iverilog_setup / "adder.v")
        runner._compile_source([src_file])

        # Verify output file was created
        assert "adder.log" in get_all_files(iverilog_setup)

    def test_iverilog_simulation(self, iverilog_setup):
        """Test simulation execution with IVerilog"""
        runner = TestbenchRunner(simulator="iverilog", work_dir=str(iverilog_setup))

        tb_file = str(iverilog_setup / "tb_adder.v")
        src_file = str(iverilog_setup / "adder.v")

        print(tb_file, src_file)

        result = runner.run_testbench(tb_file, [src_file])

        assert isinstance(result, TestbenchResult)
        assert result.num_tests == 2
        assert result.passed_tests == 2
        assert result.failed_tests == 0

        # Verify test results
        assert len(result.test_results) == 2

        # Test 1: 3 + 5 = 8
        assert result.test_results[0].test_case == {"a": 3, "b": 5}
        assert result.test_results[0].actual == {"sum": 8}
        assert result.test_results[0].expected == {"sum": 8}
        assert result.test_results[0].passed

        # Test 2: 15 + 1 = 16
        assert result.test_results[1].test_case == {"a": 15, "b": 1}
        assert result.test_results[1].actual == {"sum": 16}
        assert result.test_results[1].expected == {"sum": 16}
        assert result.test_results[1].passed

    def test_iverilog_error_handling(self, iverilog_setup):
        """Test error handling specific to IVerilog"""
        runner = TestbenchRunner(simulator="iverilog", work_dir=str(iverilog_setup))

        # Create file with syntax error
        invalid_file = iverilog_setup / "invalid.v"
        invalid_file.write_text("module invalid() endmodule")  # Missing semicolon

        # Test compilation error
        with pytest.raises(RuntimeError) as exc_info:
            runner._compile_source([str(invalid_file)])
        assert "syntax error" in str(exc_info.value).lower()

        # Test simulation error (try to simulate non-compiled file)
        with pytest.raises(RuntimeError):
            runner._run_simulation(str(invalid_file))

    def test_iverilog_output_parsing(self, iverilog_setup):
        """Test parsing of IVerilog-specific output formats"""
        runner = TestbenchRunner(simulator="iverilog")

        # IVerilog can format numbers differently - test parsing
        iverilog_output = dedent(
            """
            Test 1: Inputs: a=b0011; b=b0101 | Outputs: sum=b01000 | Expected: sum=b01000
            Test 2: Inputs: a=b1111; b=h1 | Outputs: sum=h10 | Expected: sum=h10
        """
        )

        results = runner._parse_simulation_output(iverilog_output)

        assert len(results) == 2
        assert results[0].test_case == {"a": 3, "b": 5}
        assert results[0].actual == {"sum": 8}
        assert results[1].test_case == {"a": 15, "b": 1}
        assert results[1].actual == {"sum": 16}


if __name__ == "__main__":
    pytest.main([__file__])
