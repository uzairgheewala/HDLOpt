import os, json, subprocess, re, time, math
import numpy as np

def find_component_directory(component_name, hierarchy='hierarchy.json', base_dir="generated"):
    for root, dirs, files in os.walk(base_dir):
        if component_name in dirs:#f"{component_name}.v" in files:
            d = dirs[dirs.index(component_name)]
            return os.path.join(base_dir, d)
    return None

def collect_source_files(component_dir, comp_file='', param_comb=[], hierarchy=None, base_dir="generated"):
    source_files = []
    #print(param_comb)
    #component_dir = find_component_directory(component_name, hierarchy, base_dir)
    
    if component_dir:
        for root, dirs, files in os.walk(component_dir):
            #print(root, dirs, files)
            
            for file in files:
                if file.endswith(".v") and ((not 'tb' in file) or (('tb' in file) and ('tb' in comp_file))):# and f"{component_name}.v" not in file:
                    valid = True
                    for n, v in param_comb:
                        if n in file and not str(v) in file:
                            valid = False
                            break

                    if valid:
                        source_files.append(os.path.join(root, file))
                    
        #print("SRC files:", source_files)
        #time.sleep(5)

        """
        if component_name in hierarchy:
            for submodule_name, submodule_hierarchy in hierarchy[component_name].items():
                if isinstance(submodule_hierarchy, dict):
                    source_files.extend(collect_source_files(submodule_name, submodule_hierarchy, base_dir))
        """
                    
    return list(np.unique(source_files))

def run_yosys(component_name, hierarchy="hierarchy.json"):
    component_dir = find_component_directory(component_name, hierarchy)
    if not component_dir:
        raise FileNotFoundError(f"Component directory for {component_name} not found.")

    src_files = collect_source_files(component_dir)
    print(src_files)

    netlist_file = os.path.join(component_dir, f"{component_name}_netlist.json")
            
    read = ""
    for file in src_files:
        read += "read_verilog " + file + "\n"
    yosys_script = f"""
    {read}
    synth -top {component_name}
    write_json {netlist_file}
    stat
    """

    script_filename = os.path.join(component_dir, f"{component_name}_script.ys")

    with open(script_filename, "w") as f:
        f.write(yosys_script)

    result = subprocess.run(['yosys', "-s", script_filename], capture_output=True, text=True)
    print(result.stdout)
    print(result.stderr)

    if result.returncode != 0:
        raise RuntimeError("Yosys execution failed")

    if not os.path.exists(netlist_file):
        raise FileNotFoundError(f"{netlist_file} not found")

    with open(netlist_file, "r") as f:
        netlist = f.read()

    return netlist

def modify_verilog_file(component_name, new_param_value):
    component_dir = find_component_directory(component_name)
    verilog_file = os.path.join(component_dir, f"{component_name}.v")

    with open(verilog_file, "r") as f:
        verilog_code = f.readlines()

    # Modify the parameter N in the module declaration
    modified_code = []
    for line in verilog_code:
        if "module" in line and "parameter N" in line:
            # Find the index where "parameter N = " starts
            start_idx = line.find("parameter N =") + len("parameter N =")
            end_idx = line.find(")", start_idx)  # Find the closing parenthesis
            # Replace the old value of N with the new one
            new_line = line[:start_idx] + f" {new_param_value} " + line[end_idx:]
            #print(new_line)
            #time.sleep(5)
            modified_code.append(new_line)
        else:
            modified_code.append(line)

    # Write the modified code back to the Verilog file
    with open(verilog_file, "w") as f:
        f.writelines(modified_code)

def revert_verilog_file(component_name, original_param_value):
    modify_verilog_file(component_name, original_param_value)

def run_modified_yosys(component_name, param_value, increment_step):
    # Temporarily modify Verilog file to increment N
    if increment_step:
        modify_verilog_file(component_name, param_value + increment_step)
    else:
        modify_verilog_file(component_name, param_value)
    #time.sleep(5)
    
    # Run Yosys to generate a new netlist
    netlist = run_yosys(component_name)
    
    # Revert the Verilog file back to its original state
    revert_verilog_file(component_name, param_value)

    component_dir = find_component_directory(component_name)
    if not component_dir:
        raise FileNotFoundError(f"Component directory for {component_name} not found.")

    netlist_file = os.path.join(component_dir, f"{component_name}_netlist.json")
    netlist = json.load(open(netlist_file))
    
    return netlist

def calculate_hierarchy_depth(module_name, netlist, depth=0):
    module_info = netlist["modules"][module_name]
    max_depth = depth
    for cell_name, cell_info in module_info["cells"].items():
        cell_type = cell_info["type"]
        if cell_type in netlist["modules"]:
            cell_depth = calculate_hierarchy_depth(cell_type, netlist, depth + 1)
            max_depth = max(max_depth, cell_depth)
    return max_depth

def list_tb_files(component_dir):
    tb_files = [f for f in os.listdir(component_dir) if f.startswith("tb") and f.endswith(".v")]
    return tb_files

def extract_parameter_from_filename(filename, prefix="tb_N", suffix=".v"):
    match = re.search(f"{prefix}(\\d+)", filename)
    if match:
        return int(match.group(1))
    return None

def apply_increment_rules(module_analysis, param_value, rules, netlist):
    for rule in rules.values():
        cell_type = rule["cell_type"]
        increment_per_param = rule["increment_per_param"]
        
        if cell_type in module_analysis["cells"]:
            initial_count = module_analysis["cells"][cell_type]
            
            for i in range(1, param_value):
                module_analysis["cells"][cell_type] += increment_per_param
                sub_module_info = netlist["modules"].get(cell_type)
                
                if sub_module_info:
                    recursively_add_raw_gates(sub_module_info, module_analysis, netlist)
        else:
            module_analysis["cells"][cell_type] = increment_per_param
            
            sub_module_info = netlist["modules"].get(cell_type)
            if sub_module_info:
                recursively_add_raw_gates(sub_module_info, module_analysis, netlist)

        if cell_type in module_analysis["sub_modules"]:
            module_analysis["sub_modules"][cell_type] += ((param_value - 1) * increment_per_param)

def recursively_add_raw_gates(module_info, module_analysis, netlist):
    for cell_name, cell_info in module_info["cells"].items():
        cell_type = cell_info["type"]
        if cell_type in netlist["modules"]:
            sub_module_info = netlist["modules"][cell_type]
            recursively_add_raw_gates(sub_module_info, module_analysis, netlist)
        else:
            if cell_type not in module_analysis["raw_gates"]:
                module_analysis["raw_gates"][cell_type] = 0
            module_analysis["raw_gates"][cell_type] += 1

def apply_default_scaling(module_analysis, param_value, init_param, increment_step, scaling_rules):
    delta_N = (param_value - init_param) // increment_step

    # Apply scaling to the internals
    module_analysis["wire_count"] += scaling_rules["wire_count_per_N"] * delta_N
    module_analysis["wire_bits"] += scaling_rules["wire_bits_per_N"] * delta_N
    module_analysis["port_count"] += scaling_rules["port_count_per_N"] * delta_N
    module_analysis["port_bits"] += scaling_rules["port_bits_per_N"] * delta_N
    module_analysis["cell_count"] += scaling_rules["cell_count_per_N"] * delta_N

    for gate_type, increment_per_N in scaling_rules["raw_gates_per_N"].items():
        if not gate_type in module_analysis["raw_gates"]:
            module_analysis["raw_gates"][gate_type] = 0
        module_analysis["raw_gates"][gate_type] += increment_per_N * delta_N

def analyze_module(module_name, netlist, param_value=None, min_param_value=0, increment_step=0, scaling_rules=None, increment_rules=None):
    module_info = netlist["modules"][module_name]
    module_analysis = {
        "wire_count": len(module_info["netnames"]),
        "wire_bits": sum(len(netname_info["bits"]) for netname_info in module_info["netnames"].values()),
        "port_count": len(module_info["ports"]),
        "port_bits": sum(len(port_info["bits"]) for port_info in module_info["ports"].values()),
        "cell_count": len(module_info["cells"]),
        "hierarchy_depth": calculate_hierarchy_depth(module_name, netlist),
        "cells": {},
        "raw_gates": {},
        "sub_modules": {}
    }
    
    for cell_name, cell_info in module_info["cells"].items():
        cell_type = cell_info["type"]
        if cell_type in netlist["modules"]:
            if cell_type not in module_analysis["cells"]:
                module_analysis["cells"][cell_type] = 0
            module_analysis["cells"][cell_type] += 1

            if cell_type not in module_analysis["sub_modules"]:
                module_analysis["sub_modules"][cell_type] = 0
            module_analysis["sub_modules"][cell_type] += 1
            
            sub_module_info = netlist["modules"][cell_type]
            recursively_add_raw_gates(sub_module_info, module_analysis, netlist)
        else:
            if cell_type not in module_analysis["cells"]:
                module_analysis["cells"][cell_type] = 0
            module_analysis["cells"][cell_type] += 1
            if cell_type not in module_analysis["raw_gates"]:
                module_analysis["raw_gates"][cell_type] = 0
            module_analysis["raw_gates"][cell_type] += 1
    
    if param_value and module_name == component_name and increment_rules:
        apply_increment_rules(module_analysis, param_value, increment_rules, netlist)
    
    if param_value and scaling_rules and min_param_value and increment_step:
        apply_default_scaling(module_analysis, param_value, min_param_value, increment_step, scaling_rules)
    
    return module_analysis

def generate_scaling_rules(analysis_N, analysis_N_plus_1):
    scaling_rules = {
        "wire_count_per_N": analysis_N_plus_1["wire_count"] - analysis_N["wire_count"],
        "wire_bits_per_N": analysis_N_plus_1["wire_bits"] - analysis_N["wire_bits"],
        "port_count_per_N": analysis_N_plus_1["port_count"] - analysis_N["port_count"],
        "port_bits_per_N": analysis_N_plus_1["port_bits"] - analysis_N["port_bits"],
        "cell_count_per_N": analysis_N_plus_1["cell_count"] - analysis_N["cell_count"],
        "raw_gates_per_N": {},
    }

    # Compare the raw gates scaling
    for gate_type in analysis_N_plus_1["raw_gates"]:
        if gate_type in analysis_N:
            scaling_rules["raw_gates_per_N"][gate_type] = analysis_N_plus_1["raw_gates"][gate_type] - analysis_N["raw_gates"][gate_type]
        else:
            scaling_rules["raw_gates_per_N"][gate_type] = analysis_N_plus_1["raw_gates"][gate_type]

    return scaling_rules

def analyze_netlist(component_name, increment_rules, increment_step=1):
    component_dir = find_component_directory(component_name)
    if not component_dir:
        raise FileNotFoundError(f"Component directory for {component_name} not found.")

    netlist_file = os.path.join(component_dir, f"{component_name}_netlist.json")
    netlist = json.load(open(netlist_file))

    tb_files = list_tb_files(component_dir)
    param_values = [extract_parameter_from_filename(f) for f in tb_files]
    param_values = sorted(set(param_values))  # Ensure unique and sorted parameter values
    #print(param_values)

    min_param_value = param_values[0]

    analysis_min = {}
    for module_name in netlist["modules"]:
        analysis_min[module_name] = analyze_module(module_name, netlist, param_value=min_param_value)

    print_analysis(analysis_min)
    time.sleep(10)

    # Run Yosys once for min_param_value + 1
    netlist_min_plus_1 = run_modified_yosys(component_name, min_param_value, increment_step=increment_step)

    # Analyze modules without scaling for min_param_value + 1
    analysis_min_plus_1 = {}
    for module_name in netlist_min_plus_1["modules"]:
        if increment_step:
            analysis_min_plus_1[module_name] = analyze_module(module_name, netlist_min_plus_1, param_value=min_param_value + increment_step)
        else:
            analysis_min_plus_1[module_name] = analyze_module(module_name, netlist_min_plus_1, param_value=min_param_value)

    #print_analysis(analysis_min_plus_1)

    #print(analysis_min, analysis_min_plus_1)
    #time.sleep(1)

    # Generate scaling rules based on the difference between netlist_min and netlist_min_plus_1
    scaling_rules = generate_scaling_rules(analysis_min[component_name], analysis_min_plus_1[component_name])
    #print("Scaling rules:", scaling_rules)
    #time.sleep(3)

    analyses = {}
    
    for param_value in param_values:
        analysis = {}
        for module_name in netlist["modules"]:
            if not module_name in analysis:
                analysis[module_name] = analyze_module(module_name, netlist, param_value, min_param_value=min_param_value, increment_step=increment_step, scaling_rules=scaling_rules, increment_rules=increment_rules)
        analyses[param_value] = analysis
    
    return analyses

def print_analysis(analysis):
    #print(analysis)
    def print_module_analysis(module_name, module_analysis, indent_level=0):
        #print(module_analysis)
        indent = "  " * indent_level
        print(f"{indent}Module: {module_name}")
        print(f"{indent}  Number of wires: {module_analysis['wire_count']}")
        print(f"{indent}  Number of wire bits: {module_analysis['wire_bits']}")
        print(f"{indent}  Number of ports: {module_analysis['port_count']}")
        print(f"{indent}  Number of port bits: {module_analysis['port_bits']}")
        print(f"{indent}  Number of cells: {module_analysis['cell_count']}")
        print(f"{indent}  Hierarchy depth: {module_analysis['hierarchy_depth']}")
        print(f"{indent}  Raw Gates:")
        for gate_type, count in module_analysis["raw_gates"].items():
            print(f"{indent}    Gate Type: {gate_type}, Count: {count}")

        print(f"{indent}  Sub-Modules:")
        for cell_type, count in module_analysis["sub_modules"].items():
            print(f"{indent}    Cell Type: {cell_type}, Count: {count}")
        print()

    for module_name, module_analysis in analysis.items():
        print_module_analysis(module_name, module_analysis)

def clog2(N):
    """Returns the ceiling of log base 2 of N, equivalent to $clog2 in Verilog."""
    return math.ceil(math.log2(N))

def calculate_increment_step(start_value):
    """Finds the smallest increment step that causes $clog2(N) to increment by 1."""
    current_clog2 = clog2(start_value)
    next_value = start_value + 1

    #print(current_clog2, clog2(3))
    
    while clog2(next_value) == current_clog2:
        print(clog2(next_value))
        next_value += 1
    
    # Return the increment needed for clog2 to change by +1
    return next_value - start_value

if __name__ == "__main__":
    component_name = "logic_shifter"
    run_yosys(component_name)

    increment_step = calculate_increment_step(2)
    
    print(f"Calculated increment step: {increment_step} (to cause $clog2 to change by +1)")

    analyses = analyze_netlist(component_name, None, increment_step=increment_step)

    for param_value, analysis in analyses.items():
        print(f"Analysis for parameter value {param_value}:")
        #print(analysis)
        print_analysis(analysis)