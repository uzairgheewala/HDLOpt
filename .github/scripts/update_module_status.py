import json
import os
from datetime import datetime
from pathlib import Path

from github import Github

MODULES_ROOT = Path("modules")


def calculate_implementation_status():
    total_modules = 0
    implemented_modules = 0

    for category in MODULES_ROOT.iterdir():
        if not category.is_dir():
            continue

        for subcategory in category.iterdir():
            if not subcategory.is_dir():
                continue

            for module in subcategory.iterdir():
                if not module.is_dir():
                    continue

                total_modules += 1
                config_file = module / "config.json"

                if config_file.exists():
                    with open(config_file) as f:
                        config = json.load(f)
                        if config.get("status") == "implemented":
                            implemented_modules += 1

    percent = round(
        (implemented_modules / total_modules * 100) if total_modules > 0 else 0, 1
    )

    return {
        "total_modules": total_modules,
        "implemented_modules": implemented_modules,
        "percent_implemented": percent,
        "last_updated": datetime.utcnow().isoformat(),
    }


def main():
    # Calculate status
    status = calculate_implementation_status()

    # Save to file
    with open("status.json", "w") as f:
        json.dump(status, f, indent=2)

    # Update GitHub repo status
    gh = Github(os.environ["=WIKI_ACCESS_TOKEN"])
    repo = gh.get_repo(os.environ["GITHUB_REPOSITORY"])

    # Create/update status page in wiki
    try:
        wiki = repo.get_wiki()
        page = wiki.get_page("Module-Implementation-Status")
        content = f"""# Module Implementation Status
Last updated: {status['last_updated']}

- Total Modules: {status['total_modules']}
- Implemented: {status['implemented_modules']}
- Progress: {status['percent_implemented']}%

[View detailed status](../blob/main/status.json)
"""
        if page:
            page.edit("Module Implementation Status", content)
        else:
            wiki.create_page("Module-Implementation-Status", content)
    except Exception as e:
        print(str(e))


if __name__ == "__main__":
    main()
