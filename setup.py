import os
import sys
import shutil
import subprocess
from setuptools import setup, find_packages
from setuptools.command.develop import develop
from setuptools.command.install import install
from setuptools.command.egg_info import egg_info


def install_dependencies():
    """Install additional dependencies that aren't handled by pip."""
    print("Installing additional dependencies...")

    requirements = [
        "pyvips",
        "fusesoc",
        "jinja2",
        "ply",
        "pyverilog",
        "numpy",
        "pandas",
        "matplotlib",
        "deap",
        "cocotb",
        "simpy",
        "vunit-hdl",
        "networkx",
        "pyreadline3",
        "ipython-genutils",
        "reportlab",
        "pymupdf",
        "pyverilog",
        "pyvcd",
        "graphviz",
        "vcd",
    ]

    for req in requirements:
        print(f"Installing {req}...")
        subprocess.run([sys.executable, "-m", "pip", "install", req], check=True)

    # Install packages from git
    subprocess.run(
        [
            sys.executable,
            "-m",
            "pip",
            "install",
            "git+https://github.com/ics-jku/wal.git",
            "--user",
        ],
        check=True,
    )

    # Upgrade IPython packages
    subprocess.run(
        [sys.executable, "-m", "pip", "install", "--upgrade", "ipykernel", "notebook"],
        check=True,
    )


def verify_vivado():
    """Verify Vivado installation."""
    vivado_path = shutil.which("vivado")
    if vivado_path:
        if sys.platform == "win32":
            vivado_path = vivado_path[:-3] + "bat"
        print(f"Vivado found at: {vivado_path}")
    else:
        print("WARNING: Vivado not found in PATH. Some features may be limited.")


class PostDevelopCommand(develop):
    """Post-installation for development mode."""

    def run(self):
        develop.run(self)
        install_dependencies()
        verify_vivado()


class PostInstallCommand(install):
    """Post-installation for installation mode."""

    def run(self):
        install.run(self)
        install_dependencies()
        verify_vivado()


class PostEggInfoCommand(egg_info):
    """Post-installation for egg_info mode."""

    def run(self):
        egg_info.run(self)
        install_dependencies()
        verify_vivado()


setup(
    name="hdlopt",
    version="0.1.0",
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        "jinja2",
        "graphviz",
        "matplotlib",
        "numpy",
        "reportlab",
        "pymupdf",
        "pyverilog",
        "vcd",
        "pandas",
        "networkx",
        "pyreadline3",
        "ipython-genutils",
        "deap",
        "cocotb",
        "simpy",
        "vunit-hdl",
        "tenacity",
        "black",
        "pylint",
        "flake8",
    ],
    entry_points={
        "console_scripts": [
            "hdlopt=hdlopt.runner:run",
        ],
    },
    cmdclass={
        "develop": PostDevelopCommand,
        "install": PostInstallCommand,
        "egg_info": PostEggInfoCommand,
    },
    python_requires=">=3.7",
    description="Comprehensive HDL Design Analysis Tool",
    author="Uzair Gheewala",
    author_email="uzairgheewala474@gmail.com",
    url="https://github.com/uzairgheewala/HDLOptpt",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Build Tools",
        "License :: OSI Approved :: Apache License",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
    ],
    keywords="hdl verilog systemverilog uvm automation yosys vivado rtl analysis optimization verification testbenching",
)
