import json
import os
import shutil
from pathlib import Path

from .setup_modules import MODULES

# Load module structure
with open(".github/scripts/setup_modules.py") as f:
    exec(f.read())

def find_module_location(module_name):
    """Find where a module should be placed in the directory structure."""
    for category, subcategories in MODULES.items():
        for subcategory, modules in subcategories.items():
            if module_name in modules:
                return category, subcategory
    return None, None

def verify_module(module_path):
    """Verify a module based on HDLOpt analysis results."""
    module_name = module_path.stem
    generated_dir = Path("generated") / module_name
    
    # Check if analysis was successful
    if not generated_dir.exists():
        print(f"No analysis results found for {module_name}")
        return False
        
    details_file = generated_dir / f"{module_name}_details.json"
    results_file = generated_dir / "testbench_results.json"
    
    if not (details_file.exists() and results_file.exists()):
        print(f"Missing analysis files for {module_name}")
        return False
        
    # Check test results
    with open(results_file) as f:
        results = json.load(f)
        
    total_tests = len(results)
    if total_tests == 0:
        print(f"No tests found for {module_name}")
        return False
        
    passed_tests = sum(1 for r in results if r.get("passed", False))
    pass_rate = passed_tests / total_tests
    
    if pass_rate < 0.95:
        print(f"Insufficient pass rate for {module_name}: {pass_rate:.2%}")
        return False
        
    return True

def move_to_modules(module_path):
    """Move verified module to the correct location in modules/."""
    module_name = module_path.stem
    category, subcategory = find_module_location(module_name)
    
    if not category or not subcategory:
        print(f"Could not find target location for {module_name}")
        return False
        
    target_dir = Path("modules") / category / subcategory / module_name
    target_dir.mkdir(parents=True, exist_ok=True)
    
    # Create directory structure
    rtl_dir = target_dir / "rtl"
    tb_dir = target_dir / "tb"
    rules_dir = target_dir / "rules"
    
    for dir in [rtl_dir, tb_dir, rules_dir]:
        dir.mkdir(exist_ok=True)
        
    # Copy files
    # RTL implementation
    shutil.copy2(module_path, rtl_dir / module_path.name)
    
    # Generated files
    generated_dir = Path("generated") / module_name
    if generated_dir.exists():
        for file in generated_dir.glob("*"):
            if file.suffix == ".v" and "tb_" in file.name:
                shutil.copy2(file, tb_dir / file.name)
            elif file.suffix == ".json":
                shutil.copy2(file, target_dir / file.name)
                
    # Update config
    config = {
        "name": module_name,
        "status": "implemented",
        "implementation_date": None,
        "verification_status": "verified",
        "last_verified": None,
        "complexity_score": None
    }
    
    with open(target_dir / "config.json", "w") as f:
        json.dump(config, f, indent=2)
        
    return True

def main():
    src_dir = Path("src")
    if not src_dir.exists():
        print("src directory not found")
        return
        
    for verilog_file in src_dir.glob("*.v"):
        print(f"\nProcessing {verilog_file.name}...")
        
        if verify_module(verilog_file):
            print(f"Module {verilog_file.stem} verified successfully")
            if move_to_modules(verilog_file):
                print(f"Module {verilog_file.stem} moved to modules directory")
            else:
                print(f"Failed to move {verilog_file.stem}")
        else:
            print(f"Module {verilog_file.stem} verification failed")

if __name__ == "__main__":
    main()