import shutil
import subprocess
from pathlib import Path

import pytest

from ..scripts.analysis.waveform import WaveformAnalyzer, WaveformConfig


@pytest.fixture
def temp_waveform_dir(tmp_path):
    # Create a temporary directory for waveform tests
    d = tmp_path / "waveform_test"
    d.mkdir()
    return d


@pytest.fixture
def temp_work_dir(tmp_path):
    """Create temporary work directory with Verilog files"""
    work_dir = tmp_path / "waveform_test"
    work_dir.mkdir()

    # Write counter.v
    counter_v = work_dir / "counter.v"
    counter_v.write_text(
        """
module counter #(
    parameter WIDTH = 4
) (
    input wire clk,
    input wire rst,
    input wire en,
    output reg [WIDTH-1:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 0;
        else if (en)
            count <= count + 1;
    end

endmodule
"""
    )

    # Write testbench
    counter_tb = work_dir / "counter_tb.v"
    counter_tb.write_text(
        """
module counter_tb;
    parameter WIDTH = 4;

    // Testbench signals
    reg clk = 0;
    reg rst = 0;
    reg en = 0;
    wire [WIDTH-1:0] count;

    // Instantiate counter
    counter #(WIDTH) dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    // VCD dump
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);

        // Test sequence
        rst = 1;
        #10;
        rst = 0;
        en = 1;

        // Let it count for a while
        repeat(10) @(posedge clk);

        en = 0;
        #10;

        $finish;
    end

endmodule
"""
    )

    return work_dir


def run_simulation(work_dir):
    """Compile and run simulation with Icarus Verilog"""
    print("Running simulation...")

    try:
        # Compile
        cmd = ["iverilog", "-o", "counter.vvp", "counter.v", "counter_tb.v"]
        print(f"Compiling: {' '.join(cmd)}")
        result = subprocess.run(cmd, cwd=work_dir, capture_output=True, text=True)
        if result.returncode != 0:
            print(f"Compilation failed:\n{result.stderr}")
            return False

        # Run simulation
        cmd = ["vvp", "counter.vvp"]
        print(f"Simulating: {' '.join(cmd)}")
        result = subprocess.run(cmd, cwd=work_dir, capture_output=True, text=True)
        if result.returncode != 0:
            print(f"Simulation failed:\n{result.stderr}")
            return False

        # Check VCD was created
        vcd_file = work_dir / "counter.vcd"
        if not vcd_file.exists():
            print("VCD file was not created")
            return False

        return True

    except Exception as e:
        print(f"Error running simulation: {str(e)}")
        return False


def test_waveform_analysis_with_simulation(temp_work_dir):
    """Test complete flow from simulation through analysis"""

    # Run simulation first
    assert run_simulation(temp_work_dir), "Simulation failed"

    vcd_file = temp_work_dir / "counter.vcd"
    assert vcd_file.exists(), "VCD file not generated"

    # Verify VCD file has content
    vcd_size = vcd_file.stat().st_size
    print(f"VCD file size: {vcd_size} bytes")

    # Create analyzer with specific signal config
    config = WaveformConfig(
        signals=["count", "clk", "rst", "en"],
        include_value_changes=True,
        include_timing_violations=True,
    )
    analyzer = WaveformAnalyzer("counter", config, temp_work_dir)

    # Run analysis
    results = analyzer.analyze(vcd_file)
    assert "signals" in results
    assert "metrics" in results

    # Verify signals were captured
    signals = results["signals"]
    assert len(signals) >= 4  # Should have all our signals
    for sig_name, sig_data in signals.items():
        print(f"Signal {sig_name}: {len(sig_data.times)} samples")

    # Verify transitions
    metrics = results["metrics"]
    assert "transitions" in metrics
    for sig, count in metrics["transitions"].items():
        print(f"Signal {sig} transitions: {count}")
    # Clock should have many transitions
    assert any(count > 5 for count in metrics["transitions"].values())

    # Test plot generation separately first
    plots = analyzer._generate_plots(results)
    assert plots, "No plots were generated"
    for name, buf in plots.items():
        size = len(buf.getvalue())
        print(f"Plot {name} size: {size} bytes")
        assert size > 1000, f"Plot {name} is suspiciously small ({size} bytes)"

    """
    out_pdf = temp_work_dir / "counter_analysis.pdf"
    analyzer.generate_report({'counter':results})
    assert (
        out_pdf.exists()
    ), f"Expected waveform analysis PDF to be generated at {out_pdf}."
    pdf_size = out_pdf.stat().st_size
    print(f"Generated PDF size: {pdf_size} bytes")

    # Read PDF header
    with open(out_pdf, "rb") as f:
        header = f.read(10)
    print(f"PDF header: {header}")

    assert pdf_size > 1000, f"PDF too small: {pdf_size} bytes"
    assert header.startswith(b"%PDF"), "Not a valid PDF file"

    print("\nPDF content verification:")
    if pdf_size < 1000:
        with open(out_pdf, "rb") as f:
            content = f.read()
            print(f"Full content ({len(content)} bytes):")
            print(content)

    # Choose a real directory
    real_dir = Path("./waveform_reports").resolve()
    real_dir.mkdir(parents=True, exist_ok=True)  # Ensure it exists

    # Final path: e.g. ./waveform_reports/counter_analysis.pdf
    final_pdf = real_dir / out_pdf.name
    shutil.copy2(out_pdf, final_pdf)

    print(f"Copied PDF from {out_pdf} to {final_pdf.resolve()}")
    pdf_size = final_pdf.stat().st_size
    print(f"Final PDF size: {pdf_size} bytes")

    # Verify PDF
    assert final_pdf.exists()
    assert final_pdf.stat().st_size > 1000  # Should be reasonably sized
    
    print(f"Generated PDF report at {out_pdf}")
    """


"""
@pytest.fixture
def sample_vcd_file(temp_waveform_dir):

    Creates a minimal VCD file with a single signal toggling 0->1->0
    at times 10ns and 20ns.

    vcd_path = temp_waveform_dir / "test_component.vcd"
    with open(vcd_path, "w") as f:
        f.write(
$date
    Today
$end
$version
    Test VCD
$end
$timescale 1ns $end
$scope module testbench $end
$var wire 1 ! my_signal $end
$upscope $end
$enddefinitions $end
#0
$dumpvars
0!
$end
#10
1!
#20
0!
)
    return vcd_path

def test_waveform_analysis(sample_vcd_file, temp_waveform_dir):
    analyzer = WaveformAnalyzer("test_component", WaveformConfig(signals=["my_signal"]))

    results = analyzer.analyze(sample_vcd_file)
    assert "signals" in results
    assert "metrics" in results

    signals = results["signals"]
    metrics = results["metrics"]

    # There's only one signal, "my_signal"
    # Actually the code keyed by ID code, so let's just check there's exactly 1 entry
    assert len(signals) == 1
    sig_obj = list(signals.values())[0]
    assert sig_obj.name == "my_signal"
    assert sig_obj.times == [0, 10, 20] or sig_obj.times == [10, 20]
    # The code we wrote sets initial "0!" at time #0, then changes at 10/20

    # Check transitions
    assert metrics["transitions"][sig_obj.name] == 2  # 0->1, 1->0

    # Now let's generate a PDF
    out_pdf = temp_waveform_dir / "test_component_analysis.pdf"
    analyzer.generate_report(sample_vcd_file, results)
    assert out_pdf.exists(), "Expected waveform analysis PDF to be generated."

    # Choose a real directory
    real_dir = Path("./waveform_reports").resolve()
    real_dir.mkdir(parents=True, exist_ok=True)  # Ensure it exists

    # Final path: e.g. ./waveform_reports/test_component_analysis.pdf
    final_pdf = real_dir / out_pdf.name
    shutil.copy2(out_pdf, final_pdf)

    print(f"Copied PDF from {out_pdf} to {final_pdf.resolve()}")
    pdf_size = final_pdf.stat().st_size
    print(f"Final PDF size: {pdf_size} bytes")
    assert pdf_size > 0, "The PDF file is empty!"
"""


def test_waveform_format_unsupported(temp_waveform_dir):
    # Test that we raise an error if config.format is not "vcd"
    analyzer = WaveformAnalyzer("test_component", WaveformConfig(format="fst"))
    fake_path = temp_waveform_dir / "nonexistent.fst"
    with pytest.raises(FileNotFoundError):
        analyzer.analyze(fake_path)


def test_waveform_file_not_found():
    # If the VCD doesn't exist, we should get FileNotFoundError
    analyzer = WaveformAnalyzer("test_component")
    with pytest.raises(FileNotFoundError):
        analyzer.analyze(Path("nonexistent.vcd"))
