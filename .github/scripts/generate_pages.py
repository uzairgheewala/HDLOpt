import json
import os
from pathlib import Path
from datetime import datetime
import markdown
import jinja2

class ModulePageGenerator:
    def __init__(self, modules_dir: Path, output_dir: Path):
        self.modules_dir = modules_dir
        self.output_dir = output_dir
        self.template_env = jinja2.Environment(
            loader=jinja2.FileSystemLoader('docs/templates')
        )
        
    def generate_module_page(self, module_path: Path) -> str:
        """Generate documentation page for a single module."""
        # Load module config
        config_file = module_path / "config.json"
        if not config_file.exists():
            return ""
            
        with open(config_file) as f:
            config = json.load(f)
            
        # Load module documentation if exists
        doc_file = module_path / "rtl" / f"{config['name']}.md"
        if doc_file.exists():
            with open(doc_file) as f:
                documentation = markdown.markdown(f.read())
        else:
            documentation = "Documentation not available"
            
        # Get test results if available
        test_results = {}
        results_file = module_path / "testbench_results.json"
        if results_file.exists():
            with open(results_file) as f:
                test_results = json.load(f)
                
        # Get implementation details
        impl_file = module_path / "rtl" / f"{config['name']}.v"
        implementation = ""
        if impl_file.exists():
            with open(impl_file) as f:
                implementation = f.read()
                
        # Generate page from template
        template = self.template_env.get_template('module.html.j2')
        return template.render(
            config=config,
            documentation=documentation,
            test_results=test_results,
            implementation=implementation,
            last_updated=datetime.now().isoformat()
        )
        
    def generate_index_page(self, modules: list) -> str:
        """Generate main index page."""
        template = self.template_env.get_template('index.html.j2')
        return template.render(
            modules=modules,
            last_updated=datetime.now().isoformat()
        )
        
    def generate_status_page(self) -> str:
        """Generate status dashboard page."""
        status_file = self.modules_dir.parent / "status.json"
        if not status_file.exists():
            return ""
            
        with open(status_file) as f:
            status = json.load(f)
            
        template = self.template_env.get_template('status.html.j2')
        return template.render(
            status=status,
            last_updated=datetime.now().isoformat()
        )
        
    def run(self):
        """Generate all pages."""
        # Create output directory
        self.output_dir.mkdir(parents=True, exist_ok=True)
        
        # Track all modules
        modules = []
        
        # Generate individual module pages
        for category in self.modules_dir.iterdir():
            if not category.is_dir():
                continue
                
            for subcategory in category.iterdir():
                if not subcategory.is_dir():
                    continue
                    
                for module in subcategory.iterdir():
                    if not module.is_dir():
                        continue
                        
                    # Generate module page
                    page_content = self.generate_module_page(module)
                    if page_content:
                        output_file = self.output_dir / f"{module.name}.html"
                        with open(output_file, 'w') as f:
                            f.write(page_content)
                            
                        # Track module
                        modules.append({
                            'name': module.name,
                            'category': category.name,
                            'subcategory': subcategory.name,
                            'status': self._get_module_status(module)
                        })
                        
        # Generate index page
        index_content = self.generate_index_page(modules)
        with open(self.output_dir / "index.html", 'w') as f:
            f.write(index_content)
            
        # Generate status page
        status_content = self.generate_status_page()
        with open(self.output_dir / "status.html", 'w') as f:
            f.write(status_content)
            
    def _get_module_status(self, module_path: Path) -> dict:
        """Get current status of a module."""
        config_file = module_path / "config.json"
        if not config_file.exists():
            return {
                'implemented': False,
                'verified': False,
                'last_updated': None
            }
            
        with open(config_file) as f:
            config = json.load(f)
            
        return {
            'implemented': config['status'] == 'implemented',
            'verified': config['verification_status'] == 'verified',
            'last_updated': config.get('implementation_date')
        }

if __name__ == '__main__':
    generator = ModulePageGenerator(
        modules_dir=Path('modules'),
        output_dir=Path('docs/_build/html')
    )
    generator.run()