from reportlab.lib import colors
from reportlab.platypus import Table, TableStyle, Spacer, Image, Paragraph
from reportlab.lib.units import inch
import matplotlib.pyplot as plt
import io
import numpy as np

from ...reporting.templates.base import PageTemplate
from ...logger import logger

class PowerTemplate(PageTemplate):
    """Template for displaying power analysis results."""
    
    def generate_page(self, component_name: str, power_data: dict) -> None:
        """Generate power analysis report pages.
        
        Args:
            component_name: Name of analyzed component
            power_data: Dict containing power analysis results
        """
        # Add overview section
        self.add_heading("Power Analysis Results", level=1)
        
        # Add power summary
        self._add_power_summary(power_data['summary'])
        
        # Add component breakdown
        if power_data['on_chip_components']:
            self._add_component_breakdown(power_data['on_chip_components'])
            
        # Add power supply analysis
        if power_data['power_supply']:
            self._add_power_supply_analysis(power_data['power_supply'])
            
        # Add confidence levels
        if power_data['confidence']:
            self._add_confidence_analysis(power_data['confidence'])
            
        # Add environment settings
        if power_data['environment']:
            self._add_environment_settings(power_data['environment'])
            
        # Add hierarchy analysis
        if power_data['hierarchy']:
            self._add_hierarchy_analysis(power_data['hierarchy'])
            
        # Add power visualizations
        self._add_power_visualizations(power_data)

    def _add_power_summary(self, summary):
        """Add power summary section."""
        self.add_heading("Power Summary", level=2)
        
        data = [
            ["Metric", "Value"],
            ["Total On-Chip Power", f"{summary.total_on_chip:.3f} W"],
            ["Dynamic Power", f"{summary.dynamic:.3f} W"],
            ["Static Power", f"{summary.static:.3f} W"],
            ["Device Static Power", f"{summary.device_static:.3f} W"],
            ["Effective θJA", f"{summary.effective_thetaja:.1f} °C/W"],
            ["Max Ambient", f"{summary.max_ambient:.1f} °C"],
            ["Junction Temperature", f"{summary.junction_temp:.1f} °C"]
        ]
        
        self._add_styled_table(data, "Power Summary Metrics")

    def _add_component_breakdown(self, components):
        """Add component power breakdown section."""
        self.add_heading("Component Power Breakdown", level=2)
        
        data = [["Component", "Power (W)", "Used", "Available", "Utilization (%)"]]
        for comp in components:
            data.append([
                comp.name,
                f"{comp.power:.3f}",
                str(comp.used),
                str(comp.available),
                f"{comp.utilization:.1f}"
            ])
            
        self._add_styled_table(data, "Component Power Usage")

    def _add_power_supply_analysis(self, supplies):
        """Add power supply analysis section."""
        self.add_heading("Power Supply Analysis", level=2)
        
        data = [["Source", "Voltage (V)", "Total Current (A)", "Dynamic (A)", 
                "Static (A)", "Powerup (A)", "Budget (A)", "Margin (A)"]]
                
        for supply in supplies:
            data.append([
                supply.source,
                f"{supply.voltage:.3f}",
                f"{supply.total_current:.3f}",
                f"{supply.dynamic_current:.3f}",
                f"{supply.static_current:.3f}",
                f"{supply.powerup_current:.3f}",
                f"{supply.budget:.3f}",
                f"{supply.margin:.3f}"
            ])
            
        self._add_styled_table(data, "Power Supply Characteristics")

    def _add_confidence_analysis(self, confidence):
        """Add confidence level analysis section."""
        self.add_heading("Analysis Confidence", level=2)
        
        data = [["Category", "Confidence", "Details", "Recommended Action"]]
        for category, info in confidence.items():
            details = info.get('details', 'N/A')
            action = info.get('action', 'N/A')
            data.append([
                category,
                info.get('level', 'N/A'),
                details,
                action
            ])
            
        self._add_styled_table(data, "Confidence Analysis")

    def _add_environment_settings(self, environment):
        """Add environment settings section."""
        self.add_heading("Environment Settings", level=2)
        
        data = [["Setting", "Value"]]
        for setting, value in environment.items():
            # Format the setting name for display
            display_name = setting.replace('_', ' ').title()
            data.append([display_name, str(value)])
            
        self._add_styled_table(data, "Environmental Parameters")

    def _add_hierarchy_analysis(self, hierarchy):
        """Add power by hierarchy section."""
        self.add_heading("Power by Hierarchy", level=2)
        
        data = [["Module", "Power (W)"]]
        for module, power in hierarchy.items():
            data.append([module, f"{power:.3f}"])
            
        self._add_styled_table(data, "Hierarchical Power Distribution")

    def _add_power_visualizations(self, power_data):
        """Add visualizations of power data."""
        self.add_heading("Power Analysis Visualizations", level=2)
        
        try:
            # Create power breakdown pie chart
            if power_data['summary']:
                plt.figure(figsize=(8, 8))
                
                values = [
                    power_data['summary'].dynamic,
                    power_data['summary'].static,
                    power_data['summary'].device_static
                ]
                labels = ['Dynamic', 'Static', 'Device Static']
                
                plt.pie(values, labels=labels, autopct='%1.1f%%')
                plt.title('Power Distribution Breakdown')
                plt.tight_layout()
                
                # Save to bytes buffer
                img_data = io.BytesIO()
                plt.savefig(img_data, format='png', dpi=300, bbox_inches='tight')
                img_data.seek(0)
                plt.close()
                
                # Add to report
                img = Image(img_data)
                img.drawHeight = 4*inch
                img.drawWidth = 4*inch
                self.add_element(img)
                self.add_element(Spacer(1, 0.2*inch))

            # Create component power bar chart
            if power_data['on_chip_components']:
                plt.figure(figsize=(10, 6))
                
                components = power_data['on_chip_components']
                names = [c.name for c in components]
                powers = [c.power for c in components]
                
                plt.barh(names, powers)
                plt.xlabel('Power (W)')
                plt.title('Component Power Usage')
                plt.tight_layout()
                
                # Save to bytes buffer
                img_data = io.BytesIO()
                plt.savefig(img_data, format='png', dpi=300, bbox_inches='tight')
                img_data.seek(0)
                plt.close()
                
                # Add to report
                img = Image(img_data)
                img.drawHeight = 4*inch
                img.drawWidth = 6*inch
                self.add_element(img)
                self.add_element(Spacer(1, 0.2*inch))

        except Exception as e:
            logger.error(f"Failed to generate power visualizations: {str(e)}")
            self.add_element(Paragraph(f"Error generating visualizations: {str(e)}", 
                                    self.styles['BodyText']))

    def _add_power_breakdown_plot(self, summary):
        """Create and add power breakdown plot."""
        plt.figure(figsize=(8, 8))
        
        # Data for pie chart
        values = [
            summary.dynamic,
            summary.static,
            summary.device_static
        ]
        labels = ['Dynamic', 'Static', 'Device Static']
        
        plt.pie(values, labels=labels, autopct='%1.1f%%')
        plt.title('Power Distribution Breakdown')
        
        # Save plot to bytes buffer
        buf = io.BytesIO()
        plt.savefig(buf, format='png', bbox_inches='tight')
        plt.close()
        
        # Add image to report
        img = Image(buf)
        img.drawHeight = 4*inch
        img.drawWidth = 4*inch
        self.add_element(img)
        self.add_element(Spacer(1, 0.2*inch))
        
        buf.close()

    def _add_component_power_plot(self, components):
        """Create and add component power comparison plot."""
        plt.figure(figsize=(10, 6))
        
        names = [c.name for c in components]
        powers = [c.power for c in components]
        
        plt.barh(names, powers)
        plt.xlabel('Power (W)')
        plt.title('Component Power Usage')
        
        # Save plot to bytes buffer
        buf = io.BytesIO()
        plt.savefig(buf, format='png', bbox_inches='tight')
        plt.close()
        
        # Add image to report
        img = Image(buf)
        img.drawHeight = 4*inch
        img.drawWidth = 6*inch
        self.add_element(img)
        self.add_element(Spacer(1, 0.2*inch))
        
        buf.close()

    def _add_hierarchy_power_plot(self, hierarchy):
        """Create and add hierarchical power distribution plot."""
        plt.figure(figsize=(10, 6))
        
        modules = list(hierarchy.keys())
        powers = list(hierarchy.values())
        
        plt.barh(modules, powers)
        plt.xlabel('Power (W)')
        plt.title('Power Distribution by Module')
        
        # Save plot to bytes buffer
        buf = io.BytesIO()
        plt.savefig(buf, format='png', bbox_inches='tight')
        plt.close()
        
        # Add image to report
        img = Image(buf)
        img.drawHeight = 4*inch
        img.drawWidth = 6*inch
        self.add_element(img)
        self.add_element(Spacer(1, 0.2*inch))
        
        buf.close()

    def _add_styled_table(self, data, title):
        """Add a styled table to the report."""
        self.add_heading(title, level=3)
        
        table = Table(data)
        style = TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
            ('GRID', (0, 0), (-1, -1), 1, colors.black)
        ])
        table.setStyle(style)
        
        self.add_element(table)
        self.add_element(Spacer(1, 0.2*inch))