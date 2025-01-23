import shutil
import subprocess

def install_dependencies():
    # Install required Python packages
    subprocess.run(["pip", "install", "pyvips", "fusesoc", "jinja2", "ply", "pyverilog", "numpy", "pandas", "matplotlib", "deap", "cocotb", "simpy", "vunit-hdl", "networkx", "pyreadline3", "ipython-genutils", "reportlab", "pymupdf", "pyverilog", "pyvcd"])
    subprocess.run(["pip", "install", "git+https://github.com/ics-jku/wal.git", "--user"])
    subprocess.run(["pip", "install", "pyreadline3"])
    subprocess.run(["pip", "install", "--upgrade", "ipykernel", "notebook"])

def verify_vivado():
    # Verify Vivado in PATH
    vivado_path = shutil.which('vivado')
    if vivado_path:
        vivado_path = vivado_path[:-3] + "bat"
        print(f"Vivado found at: {vivado_path}")
    else:
        print("Vivado not found in PATH.")

if __name__ == "__main__":
    install_dependencies()
    verify_vivado()