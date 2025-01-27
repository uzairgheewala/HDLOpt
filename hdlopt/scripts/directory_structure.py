import os
import shutil

import numpy as np

from .logger import logger


def identify_submodules(verilog_file):
    """
    Identify submodule instantiations in a Verilog file.

    Args:
        verilog_file: Path to Verilog file

    Returns:
        List[str]: List of unique submodule names
    """
    logger.debug(f"Analyzing {verilog_file} for submodules")
    submodule_names = set()

    try:
        with open(verilog_file) as f:
            content = f.read()
        logger.debug(f"File content:\n{content}")

        # Skip Verilog keywords
        verilog_keywords = {
            # Module level
            'module', 'endmodule', 'input', 'output', 'inout', 'wire', 'reg',
            # Assignments and parameters
            'assign', 'parameter', 'localparam', 'defparam',
            # Procedural blocks
            'initial', 'always', 'always_comb', 'always_ff', 'always_latch',
            # Control structures
            'begin', 'end', 'if', 'else', 'case', 'endcase', 'default',
            'for', 'while', 'repeat', 'forever',
            # Generate constructs
            'generate', 'endgenerate', 'genvar',
            # Primitives
            'and', 'or', 'xor', 'not', 'nand', 'nor', 'buf', 'bufif0', 'bufif1',
            # Task/Function
            'task', 'endtask', 'function', 'endfunction',
            # Miscellaneous
            'fork', 'join', 'wait', 'disable', 'casex', 'casez'
        }

        # Join lines and split on semicolons to get statements
        statements = content.split(';')

        for stmt in statements:
            # Skip empty statements and comments
            stmt = stmt.strip()
            if not stmt or stmt.startswith('//') or stmt.startswith('/*'):
                continue

            # Look for lines with opening parenthesis that aren't module
            # declarations
            if '(' in stmt and not stmt.lstrip().startswith('module'):
                # Get the first word of the statement (module type)
                words = stmt.split()
                module_type = words[0].strip()

                # If it's not a keyword, it's probably a module instantiation
                if module_type.lower() not in verilog_keywords:
                    logger.debug(f"Found instance of {module_type}")
                    submodule_names.add(module_type)

    except Exception as e:
        logger.error(f"Error parsing {verilog_file}: {str(e)}")
        return []

    unique_submodules = sorted(list(submodule_names))
    logger.debug(f"Identified submodules: {unique_submodules}")
    return unique_submodules


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
                    logger.debug(
                        f"Adding submodule file '{submodule_file}' to final_files")
        logger.debug(f"Final filtered files with subs=True: {final_files}")
    else:
        final_files = [
            os.path.join(
                source_dir,
                f) for f in filtered_files if 'for' not in f and f in all_files]
        final_files = [
            f + '.v' if not f.endswith('.v') else f for f in final_files]
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


def create_directory_structure(
        component_name,
        src_folder,
        dest_folder,
        hierarchy):
    """
    Creates directory structure for a single component and its submodules.

    Args:
        component_name: Name of the component file (e.g. 'full_adder.v')
        src_folder: Source directory containing Verilog files
        dest_folder: Destination directory for the hierarchy
        hierarchy: Dictionary to track module relationships
    """
    # Construct full path to component file
    verilog_file = os.path.join(src_folder, component_name)

    # Get module name without extension
    module_name = os.path.splitext(os.path.basename(component_name))[0]
    logger.info(f"Creating directory structure for: {module_name}")
    logger.debug(
        f"src_folder:{src_folder}\ncomponent_name:{component_name}\ndest_folder:{dest_folder}")

    # Create component directory
    component_dir = os.path.join(dest_folder, module_name)
    os.makedirs(component_dir, exist_ok=True)
    logger.debug(f"component_dir:{component_dir}")

    # Copy the Verilog file
    if os.path.exists(verilog_file):
        shutil.copy(verilog_file, component_dir)

        # Identify and process submodules
        submodules = list(np.unique(identify_submodules(verilog_file)))
        logger.debug(f"Identified submodules: {submodules}")
        hierarchy[module_name] = submodules

        # Recursively process submodules
        for submodule in submodules:
            submodule_file = f"{submodule}.v"
            submodule_path = os.path.join(src_folder, submodule_file)
            if os.path.exists(submodule_path):
                create_directory_structure(
                    submodule_file, src_folder, component_dir, hierarchy)
    else:
        logger.error(f"Verilog file not found: {verilog_file}")
        hierarchy[module_name] = []

    return hierarchy


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
