import os
import json
from pathlib import Path
from datetime import datetime
from github import Github
import numpy as np
import re

class StatusUpdater:
    """Updates and maintains module implementation status."""

    def __init__(self):
        self.gh = Github(os.environ["GITHUB_TOKEN"])
        self.repo = self.gh.get_repo(os.environ["GITHUB_REPOSITORY"])

    def collect_module_status(self) -> dict:
        """Collect status information for all modules."""
        modules_dir = Path("modules")
        status = {"categories": {}, "summary": {}}

        # Track overall statistics
        total_modules = 0
        implemented_modules = 0
        verified_modules = 0

        for category in modules_dir.iterdir():
            if category.is_dir():
                category_stats = {
                    "total": 0,
                    "implemented": 0,
                    "verified": 0,
                    "modules": {},
                }

                # Process all modules in this category
                for subcategory in category.iterdir():
                    if subcategory.is_dir():
                        for module in subcategory.iterdir():
                            if module.is_dir():
                                config_file = module / "config.json"
                                if config_file.exists():
                                    with open(config_file) as f:
                                        config = json.load(f)

                                    category_stats["total"] += 1
                                    if config["status"] == "implemented":
                                        category_stats["implemented"] += 1
                                    if config["verification_status"] == "verified":
                                        category_stats["verified"] += 1

                                    category_stats["modules"][module.name] = {
                                        "status": config["status"],
                                        "verification": config["verification_status"],
                                        "last_updated": config.get(
                                            "implementation_date"
                                        ),
                                        "implemented_by": config.get("implemented_by"),
                                    }

                # Update overall statistics
                total_modules += category_stats["total"]
                implemented_modules += category_stats["implemented"]
                verified_modules += category_stats["verified"]

                status["categories"][category.name] = category_stats

        # Calculate overall progress
        status["summary"] = {
            "total_modules": total_modules,
            "implemented_modules": implemented_modules,
            "verified_modules": verified_modules,
            "implementation_progress": f"{(implemented_modules/total_modules)*100:.1f}%",
            "verification_progress": f"{(verified_modules/total_modules)*100:.1f}%",
            "last_updated": datetime.now().isoformat(),
        }

        return status

    def generate_status_badge(self, status: dict):
        """Generate status badge for repository."""
        implementation_pct = int(
            float(status["summary"]["implementation_progress"][:-1])
        )

        # Define color based on progress
        if implementation_pct < 30:
            color = "red"
        elif implementation_pct < 70:
            color = "yellow"
        else:
            color = "green"

        badge_url = (
            f"https://img.shields.io/badge/Modules%20Implemented-"
            f"{implementation_pct}%25-{color}"
        )

        return badge_url

    def update_readme(self, status: dict, badge_url: str):
        """Update repository README with current status."""
        readme_path = Path("README.md")
        if not readme_path.exists():
            return

        content = readme_path.read_text()

        # Update status badge if it exists
        badge_pattern = r"!\[Module Status\]\(https://img\.shields\.io/badge/.*\)"
        if re.search(badge_pattern, content):
            content = re.sub(badge_pattern, f"![Module Status]({badge_url})", content)

        # Update status table if it exists
        status_table = "\n### Module Implementation Status\n\n"
        status_table += "| Category | Total | Implemented | Verified |\n"
        status_table += "|----------|--------|--------------|----------|\n"

        for category, stats in status["categories"].items():
            status_table += (
                f"| {category} | {stats['total']} | {stats['implemented']} | "
                f"{stats['verified']} |\n"
            )

        # Find and replace existing table or add at the end
        table_pattern = r"### Module Implementation Status\n\n\|.*?\n\|.*?\n(\|.*?\n)*"
        if re.search(table_pattern, content, re.MULTILINE | re.DOTALL):
            content = re.sub(
                table_pattern, status_table, content, flags=re.MULTILINE | re.DOTALL
            )
        else:
            content += "\n" + status_table

        readme_path.write_text(content)

    def create_status_issue(self, status: dict):
        """Create or update status tracking issue."""
        # Look for existing status issue
        for issue in self.repo.get_issues(labels=["status-tracker"]):
            if issue.title == "Module Implementation Status":
                status_issue = issue
                break
        else:
            # Create new status issue
            status_issue = self.repo.create_issue(
                title="Module Implementation Status", labels=["status-tracker"]
            )

        # Generate status report
        report = f"# Module Implementation Status\n\n"
        report += f"Last updated: {status['summary']['last_updated']}\n\n"
        report += f"Overall progress:\n"
        report += f"- {status['summary']['implementation_progress']} implemented\n"
        report += f"- {status['summary']['verification_progress']} verified\n\n"

        for category, stats in status["categories"].items():
            report += f"## {category}\n\n"
            report += f"Progress: {stats['implemented']}/{stats['total']} modules\n\n"

            # Add table of modules
            report += "| Module | Status | Last Updated | Implemented By |\n"
            report += "|--------|--------|--------------|----------------|\n"

            for name, info in stats["modules"].items():
                report += (
                    f"| {name} | {info['status']} | {info['last_updated'] or 'N/A'} | "
                    f"{info['implemented_by'] or 'N/A'} |\n"
                )

            report += "\n"

        # Update issue
        status_issue.edit(body=report)

    def run(self):
        """Run the status update process."""
        # Collect current status
        status = self.collect_module_status()

        # Generate status badge
        badge_url = self.generate_status_badge(status)

        # Update README
        self.update_readme(status, badge_url)

        # Update status issue
        self.create_status_issue(status)

        # Save status to file
        with open("module_status.json", "w") as f:
            json.dump(status, f, indent=2)


if __name__ == "__main__":
    updater = StatusUpdater()
    updater.run()
