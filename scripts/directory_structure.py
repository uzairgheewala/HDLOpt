import os
import shutil
import numpy as np
import json
from .logger import logger

def identify_submodules(verilog_file):
    submodule_names = []
    with open(verilog_file, 'r') as f:
        lines = f.readlines()

    for i, line in enumerate(lines):
        if "// Module" in line:
            for j in range(i, 0, -1):
                if (('(' in lines[j]) and ((not ')' in lines[j]) or ((lines[j].count('(') > 1) and ('#' in lines[j])))) or ('(' in lines[j] and ')' in lines[j] and ';' in lines[j]):
                    submodule_name = lines[j].strip().split()[0]
                    submodule_names.append(str(submodule_name))
                    logger.debug(f"Identified submodule: {submodule_name}")
                    break

    return submodule_names

def filter_filenames(source_dir, patterns=None, filenames=None, subs=False):
    if filenames is None:
        all_files = os.listdir(source_dir)
    else:
        all_files = filenames

    if patterns:
        filtered_files = []
        for file in all_files:
            for pattern in patterns:
                if pattern.matches(file):
                    filtered_files.append(file)
                    logger.debug(f"File '{file}' matches pattern '{pattern.pattern}'")
                    break
    else:
        filtered_files = all_files

    if subs:
        final_files = []
        for file in filtered_files:
            file_path = os.path.join(source_dir, file)
            final_files.append(file_path)
            logger.debug(f"Adding file '{file_path}' to final_files")
            submodules = identify_submodules(file_path)
            logger.debug(f"Identified submodules for '{file}': {submodules}")
            for submodule in submodules:
                submodule_file = os.path.join(source_dir, f"{submodule}.v")
                if os.path.exists(submodule_file):
                    final_files.append(submodule_file)
                    logger.debug(f"Adding submodule file '{submodule_file}' to final_files")
        logger.debug(f"Final filtered files with subs=True: {final_files}")
    else:
        final_files = [os.path.join(source_dir, f) for f in filtered_files if not 'for' in f and f in all_files]
        final_files = [f + '.v' if not f.endswith('.v') else f for f in final_files]
        logger.debug(f"Final filtered files with subs=False: {final_files}")

    return list(set(final_files))
"""
def filter_filenames(source_dir, patterns=None, filenames=None, subs=False):
    if filenames is None:
        all_files = os.listdir(source_dir)
    else:
        all_files = filenames

    if patterns:
        filtered_files = []
        for file in all_files:
            for pattern in patterns:
                if pattern.matches(file):
                    filtered_files.append(file)
                    break
    else:
        filtered_files = all_files

    if subs:
        final_files = []
        for file in filtered_files:
            final_files.append(file)
            submodules = identify_submodules(os.path.join(source_dir, file))
            final_files.extend(submodules)
    else:
        final_files = filtered_files

    final_files = [os.path.join(source_dir, f) for f in final_files if not 'for' in f and f in all_files]
    final_files = [f + '.v' if not '.v' in f else f for f in final_files]

    return list(set(final_files))
"""
def create_directory_structure(component_names, src_folder, dest_folder, hierarchy):
    for verilog_file in component_names:
        print("Creating directory structure for:", verilog_file)
        module_name = os.path.splitext(os.path.basename(verilog_file))[0]
        component_dir = os.path.join(dest_folder, module_name)
        os.makedirs(component_dir, exist_ok=True)
        shutil.copy(verilog_file, component_dir)
    
        submodules = list(np.unique(identify_submodules(verilog_file)))
        hierarchy[module_name] = submodules
    
        for submodule in submodules:
            submodule_file = os.path.join(src_folder, f"{submodule}.v")
            if os.path.exists(submodule_file):
                create_directory_structure([submodule_file], src_folder, component_dir, hierarchy)

    return hierarchy

"""
def print_directory_structure(path, indent=0):
    hierarchy = {}
    
    def build_hierarchy(path, hierarchy):
        for root, dirs, files in os.walk(path):
            level = root.replace(path, '').count(os.sep)
            indent = ' ' * 4 * level
            print(f"{indent}{os.path.basename(root)}/")
            subindent = ' ' * 4 * (level + 1)
            for f in files:
                print(f"{subindent}{f}")
            current_level = hierarchy
            parts = root.replace(path, '').split(os.sep)
            for part in parts:
                if part:
                    current_level = current_level.setdefault(part, {})
            for d in dirs:
                current_level[d] = {}
            for f in files:
                current_level[f] = None

    build_hierarchy(path, hierarchy)
    return hierarchy
"""
def print_directory_structure(path):
    hierarchy = {}
    for item in os.listdir(path):
        item_path = os.path.join(path, item)
        if os.path.isdir(item_path):
            hierarchy[item] = print_directory_structure(item_path)
        else:
            hierarchy[item] = None
    return hierarchy