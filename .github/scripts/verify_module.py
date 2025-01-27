import os
import json
import sys
import shutil
from pathlib import Path
from github import Github
import re
from datetime import datetime
import subprocess


class ModuleVerifier:
    """Verifies new module implementations and manages their integration."""

    def __init__(self):
        self.gh = Github(os.environ["GITHUB_TOKEN"])
        self.repo = self.gh.get_repo(os.environ["GITHUB_REPOSITORY"])
        self.pr = self.repo.get_pull(int(os.environ["PR_NUMBER"]))

        # Load module structure definition
        self.module_structure = self._load_module_structure()

    def _load_module_structure(self) -> dict:
        """Load module structure from setup script."""
        structure_file = Path(".github/scripts/setup_modules.py")
        if not structure_file.exists():
            raise FileNotFoundError("Module structure definition not found")

        # Extract MODULES dictionary from setup script
        with open(structure_file) as f:
            content = f.read()
            # Find MODULES dictionary in content
            modules_match = re.search(r"MODULES\s*=\s*({[^}]+})", content, re.DOTALL)
            if not modules_match:
                raise ValueError("Could not find MODULES definition")

            # Safely evaluate the dictionary
            modules_dict = eval(modules_match.group(1))
            return modules_dict

    def get_module_info(self, verilog_file: Path) -> dict:
        """Extract module information from Verilog file name and contents."""
        # Extract module name from filename
        module_name = verilog_file.stem

        # Find matching category and subcategory
        for category, subcategories in self.module_structure.items():
            for subcategory, modules in subcategories.items():
                if module_name in modules:
                    return {
                        "name": module_name,
                        "category": category,
                        "subcategory": subcategory,
                        "file": verilog_file,
                    }

        raise ValueError(f"Module {module_name} not found in defined structure")

    def verify_implementation(self, module_info: dict) -> bool:
        """Verify that the implementation meets requirements."""
        print(f"Verifying implementation for {module_info['name']}...")

        # Check file exists in src/
        src_file = Path("src") / module_info["file"].name
        if not src_file.exists():
            raise ValueError(f"Implementation not found in src/: {src_file}")

        # Run HDLOpt analysis
        print("Running HDLOpt analysis...")
        try:
            result = subprocess.run(
                ["python", "-m", "hdlopt.runner", "analyze", module_info["name"]],
                capture_output=True,
                text=True,
                check=True,
            )
            print(f"Analysis output:\n{result.stdout}")
        except subprocess.CalledProcessError as e:
            print(f"Analysis error output:\n{e.stderr}")
            raise ValueError("HDLOpt analysis failed")

        # Check generated files exist
        generated_dir = Path("generated") / module_info["name"]
        if not generated_dir.exists():
            raise ValueError(f"No generated files found for {module_info['name']}")

        # Verify required files exist
        required_files = [
            generated_dir / f"{module_info['name']}_details.json",
            generated_dir / "testbench_results.json",
        ]

        for file in required_files:
            if not file.exists():
                raise ValueError(f"Missing required file: {file}")

        # Verify test results
        print("Verifying test results...")
        with open(generated_dir / "testbench_results.json") as f:
            results = json.load(f)

        if not results:
            raise ValueError("No test results found")

        # Calculate pass rate
        total_tests = len(results)
        passed_tests = sum(1 for r in results if r.get("passed", False))
        pass_rate = passed_tests / total_tests

        print(f"Test pass rate: {pass_rate:.2%}")
        # Minimum 95% pass rate required
        if pass_rate < 0.95:
            raise ValueError(f"Insufficient pass rate: {pass_rate:.2%}")

        # Verify module details
        print("Verifying module details...")
        with open(generated_dir / f"{module_info['name']}_details.json") as f:
            details = json.load(f)

        required_fields = ["component_name", "inputs", "outputs"]
        missing_fields = [f for f in required_fields if f not in details]
        if missing_fields:
            raise ValueError(f"Missing required fields in details: {missing_fields}")

        # Check for documentation
        doc_file = generated_dir / f"{module_info['name']}_documentation.md"
        if not doc_file.exists():
            print("Warning: Documentation file not found")

        return True

    def get_target_directory(self, module_info: dict) -> Path:
        """Get the target directory for the implementation."""
        return (
            Path("modules")
            / module_info["category"]
            / module_info["subcategory"]
            / module_info["name"]
        )

    def copy_implementation(self, module_info: dict):
        """Copy verified implementation to modules directory."""
        print(f"Copying implementation to modules directory...")
        target_dir = self.get_target_directory(module_info)

        # Create directory structure
        (target_dir / "rtl").mkdir(parents=True, exist_ok=True)
        (target_dir / "tb").mkdir(exist_ok=True)
        (target_dir / "rules").mkdir(exist_ok=True)

        # Copy RTL implementation
        src_file = Path("src") / module_info["file"].name
        shutil.copy2(src_file, target_dir / "rtl" / src_file.name)

        # Copy generated files
        generated_dir = Path("generated") / module_info["name"]
        for file in generated_dir.glob("*"):
            if file.suffix == ".v" and "tb_" in file.name:
                # Copy testbenches to tb directory
                shutil.copy2(file, target_dir / "tb" / file.name)
            elif file.suffix == ".json":
                # Copy JSON files to main directory
                shutil.copy2(file, target_dir / file.name)

    def update_config(self, module_info: dict):
        """Update module configuration after successful verification."""
        print("Updating module configuration...")
        config_file = self.get_target_directory(module_info) / "config.json"

        current_time = datetime.now().isoformat()
        config = {
            "name": module_info["name"],
            "category": module_info["category"],
            "subcategory": module_info["subcategory"],
            "status": "implemented",
            "implementation_date": current_time,
            "verification_status": "verified",
            "last_verified": current_time,
            "pr_number": self.pr.number,
            "implemented_by": self.pr.user.login,
            "complexity_score": None,  # To be added later
        }

        with open(config_file, "w") as f:
            json.dump(config, f, indent=2)

    def run(self):
        """Run the verification process."""
        try:
            # Get modified Verilog files from PR
            verilog_files = [
                f
                for f in self.pr.get_files()
                if f.filename.endswith(".v") and "src/" in f.filename
            ]

            if not verilog_files:
                print("No Verilog files found in src/ directory")
                return

            print(f"Found {len(verilog_files)} Verilog files to verify")

            for file in verilog_files:
                print(f"\nProcessing {file.filename}...")
                module_info = self.get_module_info(Path(file.filename))

                # Verify implementation
                if self.verify_implementation(module_info):
                    # Copy files to module directory
                    self.copy_implementation(module_info)
                    # Update configuration
                    self.update_config(module_info)

                    # Add success comment to PR
                    self.pr.create_issue_comment(
                        f"✅ Successfully verified and integrated {module_info['name']}\n\n"
                        f"- Implementation passed all tests\n"
                        f"- Files copied to modules/{module_info['category']}/{module_info['subcategory']}/{module_info['name']}\n"
                        f"- Configuration updated"
                    )

        except Exception as e:
            print(f"Error: {str(e)}")
            # Add failure comment to PR
            self.pr.create_issue_comment(
                f"❌ Verification failed:\n\n```\n{str(e)}\n```\n\n"
                "Please fix the issues and update the PR."
            )
            sys.exit(1)


if __name__ == "__main__":
    verifier = ModuleVerifier()
    verifier.run()
