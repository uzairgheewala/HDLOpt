import os

YOSYS_PATH = r"C:\oss-cad-suite\bin\yosys.exe"


def find_component_directory(
    component_name, hierarchy="hierarchy.json", base_dir="generated"
):
    for root, dirs, files in os.walk(base_dir):
        if component_name in dirs:  # f"{component_name}.v" in files:
            d = dirs[dirs.index(component_name)]
            return os.path.join(base_dir, d)
    return None
