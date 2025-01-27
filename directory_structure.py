import os
import sys
from typing import List, Set


def generate_directory_tree(
    root_dir: str,
    output_file: str,
    exclude_extensions: Set[str] = None,
    exclude_folders: Set[str] = None
):
    """
    Generates a directory tree starting from root_dir and writes it to output_file.

    Args:
        root_dir: The root directory from which to start the tree.
        output_file: The file where the tree structure will be saved.
        exclude_extensions: Set of file extensions to exclude (e.g. {'.pyc', '.pyo'})
        exclude_folders: Set of folder names to exclude (e.g. {'__pycache__', '.git'})

    Returns:
        Tuple of (skipped_files, skipped_folders) lists
    """
    # Initialize tracking of skipped items
    skipped_files = []
    skipped_folders = []

    # Ensure the root directory is absolute
    root_dir = os.path.abspath(root_dir)
    if not os.path.exists(root_dir):
        print(f"Error: The directory '{root_dir}' does not exist.")
        return [], []

    tree_lines = []

    for dirpath, dirnames, filenames in os.walk(root_dir):
        # Remove excluded folders from dirnames to prevent recursion into them
        if exclude_folders:
            orig_dirnames = dirnames.copy()
            dirnames[:] = [d for d in dirnames if d not in exclude_folders]
            skipped = set(orig_dirnames) - set(dirnames)
            for d in skipped:
                full_path = os.path.join(dirpath, d)
                skipped_folders.append(full_path)

        # Calculate the level of depth
        level = dirpath.replace(root_dir, '').count(os.sep)
        indent = '    ' * level
        os.path.basename(dirpath) if os.path.basename(dirpath) else dirpath
        tree_lines.append(f"{indent}{os.path.basename(dirpath)}/")

        # Add non-excluded files in the current directory
        sub_indent = '    ' * (level + 1)
        for file in sorted(filenames):
            _, ext = os.path.splitext(file)
            if exclude_extensions and ext in exclude_extensions:
                full_path = os.path.join(dirpath, file)
                skipped_files.append(full_path)
                continue
            tree_lines.append(f"{sub_indent}{file}")

    # Write the tree structure to the output file
    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            for line in tree_lines:
                f.write(line + '\n')

            # Add summary of skipped items
            if skipped_files or skipped_folders:
                f.write("\nSkipped Items:\n")
                f.write("=" * 20 + "\n")

                if skipped_files:
                    f.write("\nSkipped Files:\n")
                    for file in skipped_files:
                        f.write(f"  {file}\n")

                if skipped_folders:
                    f.write("\nSkipped Folders:\n")
                    for folder in skipped_folders:
                        f.write(f"  {folder}\n")

        print(f"Directory tree has been saved to '{output_file}'")

    except Exception as e:
        print(f"An error occurred while writing to the file: {e}")

    return skipped_files, skipped_folders


def main():
    """
    Main function to parse arguments and initiate the directory tree generation.
    """
    # Check if a root directory was provided as a command-line argument
    if len(sys.argv) > 1:
        root_dir = sys.argv[1]
    else:
        # Default to the current working directory
        root_dir = os.getcwd()

    print("Root Directory:", root_dir)

    # Define exclusions
    exclude_extensions = {
        '.pyc', '.pyo', '.pyd',  # Python compiled files
        '.git', '.svn',          # Version control
        '.DS_Store'  # ,             # Mac OS files
        # '.env', '.venv'          # Environment files
    }

    exclude_folders = {
        '__pycache__',
        '.pytest_cache',
        '.git',
        '.svn',
        'node_modules',
        'venv',
        '.env',
        '.idea',
        '.vscode',
        'main_generated'
    }

    # Define the output file name
    output_file = "directory_structure.txt"

    # Generate tree and get skipped items
    skipped_files, skipped_folders = generate_directory_tree(
        root_dir,
        output_file,
        exclude_extensions,
        exclude_folders
    )

    # Print summary to console
    if skipped_files:
        print(f"\nSkipped {len(skipped_files)} files with excluded extensions")
    if skipped_folders:
        print(f"Skipped {len(skipped_folders)} excluded folders")


if __name__ == "__main__":
    main()
