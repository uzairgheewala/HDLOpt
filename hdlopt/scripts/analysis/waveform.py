from dataclasses import dataclass, field
from typing import Dict, List, Optional
import io
import subprocess
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt
from vcd.reader import TokenKind, tokenize

from ..logger import logger
from ..reporting.generator import PDFReportGenerator
from ..reporting.templates.waveform import WaveformTemplate

@dataclass
class SignalData:
    """Container for signal waveform data"""
    name: str
    times: List[int]
    values: List[str]
    width: int = 1
    is_bus: bool = False

@dataclass 
class WaveformConfig:
    """Configuration for waveform analysis"""
    signals: List[str] = field(default_factory=lambda: ["*"])# Signals to analyze
    start_time: int = 0
    end_time: Optional[int] = None
    include_value_changes: bool = True
    include_timing_violations: bool = True
    format: str = "vcd"  # vcd, fst, wlf

class WaveformAnalyzer:
    """Analyzes digital waveforms from simulation"""
    
    def __init__(self, 
                 component_name: str,
                 config: Optional[WaveformConfig] = None,
                 base_dir: Optional[str] = None):
        self.component_name = component_name
        self.config = config or WaveformConfig(signals=["*"])
        self.base_dir = base_dir

    def analyze(self, waveform_file: Path) -> Dict:
        """
        Analyze waveform data and return a dictionary of results:
            {
              "signals": Dict[str, SignalData],
              "metrics": { "transitions": {...}, "glitches": [...], ... },
              "time_range": (start, end)
            }
        """
        logger.info(f"Starting waveform analysis on {waveform_file}")
        if not waveform_file.exists():
            raise FileNotFoundError(f"Waveform file not found: {waveform_file}")
        
        if self.config.format.lower() == "vcd":
            results = self._analyze_vcd(waveform_file)
        else:
            raise ValueError(f"Unsupported waveform format: {self.config.format}")
        
        logger.info("Waveform analysis completed.")
        return results
    
    def _analyze_vcd(self, vcd_file: Path) -> Dict:
        try:
            with open(vcd_file, "rb") as f:
                signals = {}  # Key: id_code -> {name, width, values: [(time, val), ...]}
                times_encountered = set()
                current_time = 0

                for token in tokenize(f):
                    if token.kind == TokenKind.CHANGE_TIME:
                        # pyvcd: token.data is the integer time (#<time>)
                        current_time = token.data
                        times_encountered.add(current_time)

                    elif token.kind == TokenKind.VAR:
                        # This defines a new variable
                        id_code = token.data.id_code
                        signals[id_code] = {
                            'name': token.data.reference,
                            'width': token.data.size,
                            'values': []
                        }

                    elif token.kind in [TokenKind.CHANGE_SCALAR, TokenKind.CHANGE_VECTOR]:
                        id_code = token.data.id_code
                        if id_code in signals:
                            # Use the last known current_time
                            signals[id_code]['values'].append(
                                (current_time, token.data.value)
                            )

                # Build signal_data, etc. (unchanged below)
                if not times_encountered:
                    return {'signals': {}, 'metrics': {}, 'time_range': (0, 0)}

                # Now build SignalData objects
                signal_data = {}
                all_times = sorted(times_encountered)

                for id_code, info in signals.items():
                    if not info['values']:
                        continue
                    # Unzip the times/values
                    times_list = [tv[0] for tv in info['values']]
                    values_list = [tv[1] for tv in info['values']]
                    w = info['width']
                    is_bus = (w > 1)

                    signal_data[id_code] = SignalData(
                        name=info['name'],  # e.g. "mybus[3:0]"
                        times=times_list,
                        values=values_list,
                        width=w,
                        is_bus=is_bus
                    )

                # Calculate timing metrics
                time_range_raw = (all_times[0], all_times[-1])
                metrics = self._calculate_metrics(signal_data, all_times)

                # Optionally filter time range
                start_t = max(all_times[0], self.config.start_time)
                end_t   = min(all_times[-1], self.config.end_time) if self.config.end_time else all_times[-1]
                time_range = (start_t, end_t)

                return {
                    'signals': signal_data,
                    'metrics': metrics,
                    'time_range': time_range
                }

        except Exception as e:
            logger.error(f"Failed to parse VCD file: {e}")
            raise

    def _calculate_metrics(self, signal_data: Dict[str, SignalData], all_times: List[int]) -> Dict:
        """
        Returns a dictionary of metrics with keys like 'transitions', 'toggle_rates',
        'min_pulse_widths', 'glitches', 'violations', etc.
        """
        metrics = {
            'transitions': {},
            'toggle_rates': {},
            'min_pulse_widths': {},
            'violations': [],
            'glitches': []
        }

        if not all_times:
            return metrics

        total_time = all_times[-1] - all_times[0]
        if total_time <= 0:
            return metrics
        
        glitch_threshold = 0.01 * total_time  # 1% of total time as glitch threshold

        # For each signal, count transitions, note pulse widths, detect small pulses
        for id_code, sig in signal_data.items():
            transitions = 0
            last_value = sig.values[0]
            last_edge_time = sig.times[0]
            pulse_widths = []

            for t, v in zip(sig.times[1:], sig.values[1:]):
                if v != last_value:
                    transitions += 1
                    pw = t - last_edge_time
                    pulse_widths.append(pw)

                    # check glitch
                    if pw < glitch_threshold:
                        metrics['glitches'].append({
                            'signal': sig.name,
                            'time': t,
                            'width': pw,
                            'old_value': last_value,
                            'new_value': v
                        })

                    last_edge_time = t
                last_value = v
            
            metrics['transitions'][sig.name] = transitions
            metrics['toggle_rates'][sig.name] = transitions / total_time if total_time > 0 else 0
            
            if pulse_widths:
                metrics['min_pulse_widths'][sig.name] = min(pulse_widths)

        return metrics

    def generate_report(self, waveform_file: Path, analysis_results: Dict) -> None:
        """Generate PDF report of waveform analysis."""
        # Get the output path in same directory as waveform file
        report_path = waveform_file.parent / f"{waveform_file.stem}_analysis.pdf"
        print(f"Generating report at: {report_path}")
        
        report = PDFReportGenerator(str(report_path))
        logger.info(f"Created PDFReportGenerator for {report_path}")
        
        # Generate plots first and verify they exist
        plots = self._generate_plots(analysis_results)
        for name, buf in plots.items():
            size = len(buf.getvalue())
            print(f"Plot {name} size: {size} bytes")

        report.add_title_page(f"Waveform Analysis Report - {self.component_name}")
        print("Added title page")
        
        # Add waveform analysis
        template = WaveformTemplate(report)
        template.generate_page(self.component_name, analysis_results, plots)
        print("Generated template page")
        
        report.add_template(template.elements)
        print("Added template elements")
        
        # Build the document
        report.save()
        print("Saved report")
        
        # Verify file size after save
        if report_path.exists():
            size = report_path.stat().st_size
            print(f"Final PDF size: {size} bytes")
            
            # Read the first few bytes to verify it's a valid PDF
            with open(report_path, 'rb') as f:
                header = f.read(10)
                print(f"PDF header: {header}")
                
            if size < 1000:
                logger.error(f"PDF file suspiciously small ({size} bytes)")
            if not header.startswith(b'%PDF'):
                logger.error("File does not appear to be a valid PDF")
                
        else:
            logger.error(f"PDF file was not created at {report_path}")
        
        logger.debug(f"Saved waveform analysis report to {report_path}")

    def _generate_plots(self, analysis_results: Dict) -> Dict[str, io.BytesIO]:
        """Return a dictionary of plot buffers.
        
        Args:
            analysis_results: Dict containing:
                - signals: Dict[str, SignalData]
                - metrics: Dict with timing metrics
                
        Returns:
            Dict mapping plot names to BytesIO buffers containing PNG images
        """
        plots = {}
        signal_data: Dict[str, SignalData] = analysis_results['signals']
        metrics = analysis_results['metrics']

        # Set high quality plotting defaults
        plt.rcParams['figure.dpi'] = 300
        plt.rcParams['savefig.dpi'] = 300
        plt.rcParams['figure.figsize'] = [12, 8]
        plt.rcParams['figure.autolayout'] = True
        plt.rcParams['lines.linewidth'] = 2
        plt.rcParams['axes.grid'] = True
        plt.rcParams['font.size'] = 10

        # Separate single-bit signals vs multi-bit buses
        singles = {}
        buses = {}

        for id_code, sig in signal_data.items():
            if sig.is_bus:
                base_name = sig.name.split('[')[0]  
                if base_name not in buses:
                    buses[base_name] = []
                buses[base_name].append(sig)
            else:
                singles[sig.name] = sig

        # Plot single-bit signals
        if singles:
            total_height = max(2 * len(singles), 6)  # Minimum height of 6 inches
            fig, axes = plt.subplots(len(singles), 1, 
                                    figsize=(12, total_height), 
                                    gridspec_kw={'hspace': 0.4},
                                    sharex=True)
            if len(singles) == 1:
                axes = [axes]

            for ax, (name, sig) in zip(axes, singles.items()):
                numeric_vals = []
                for v in sig.values:
                    if isinstance(v, str):
                        if v in ('0', '1'):
                            numeric_vals.append(int(v))
                        else:
                            numeric_vals.append(0)
                    else:
                        numeric_vals.append(int(bool(v)))
                        
                ax.step(sig.times, numeric_vals, where='post', label=name, 
                    color='darkblue', linewidth=2)
                ax.set_ylabel(name, fontsize=10)
                ax.set_ylim(-0.2, 1.2)  # Add padding around 0/1 values
                ax.set_yticks([0, 1])
                ax.grid(True, which='both', alpha=0.3)
                ax.legend(loc="upper right", fontsize=10)

            axes[-1].set_xlabel('Time', fontsize=10)
            plt.suptitle('Digital Signal Waveforms', fontsize=12)
            plt.tight_layout()

            buf = io.BytesIO()
            plt.savefig(buf, format='png', dpi=300, bbox_inches='tight', 
                    pad_inches=0.2, facecolor='white')
            buf.seek(0)
            plt.close()
            plots["singles"] = buf

        # Plot bus signals
        for bus_name, sig_list in buses.items():
            fig, ax = plt.subplots(figsize=(12, 4))
            
            all_bus_times = sorted(set(t for sig in sig_list for t in sig.times))
            if not all_bus_times:
                continue

            data_matrix = np.zeros((len(sig_list), len(all_bus_times)), dtype=int)
            sig_list_sorted = sorted(sig_list, key=lambda s: s.name)

            time_index = {t: i for i, t in enumerate(all_bus_times)}
            for row_i, bit_sig in enumerate(sig_list_sorted):
                for t, v in zip(bit_sig.times, bit_sig.values):
                    col_i = time_index[t]
                    try:
                        if isinstance(v, str):
                            if set(v).issubset({'0', '1'}):
                                val_int = int(v, 2)
                            else:
                                val_int = 0
                        else:
                            val_int = int(v)
                    except (ValueError, TypeError):
                        logger.warning(f"Could not convert value {v} to int, using 0")
                        val_int = 0
                    data_matrix[row_i, col_i] = val_int

            im = ax.imshow(data_matrix, aspect='auto', interpolation='none',
                        cmap='viridis')
            plt.colorbar(im, ax=ax, label='Value')
            ax.set_title(f"Bus: {bus_name}", fontsize=12)
            ax.set_xlabel("Time index", fontsize=10)
            ax.set_ylabel("Bit index", fontsize=10)
            plt.tight_layout()

            buf = io.BytesIO()
            plt.savefig(buf, format='png', dpi=300, bbox_inches='tight',
                    pad_inches=0.2, facecolor='white')
            buf.seek(0)
            plt.close()
            plots[bus_name] = buf

        # Plot timing events if any exist
        events = []
        for g in metrics.get('glitches', []):
            events.append({
                'time': g['time'],
                'description': f"Glitch on {g['signal']}",
                'type': 'glitch'
            })
            
        for v in metrics.get('violations', []):
            events.append({
                'time': v.get('time', 0),
                'description': f"{v.get('type','Unknown')} violation on {v.get('signal','?')}",
                'type': 'violation'
            })

        if events:
            fig, ax = plt.subplots(figsize=(12, 3))
            events.sort(key=lambda e: e['time'])
            times = [e['time'] for e in events]
            labels = [e['description'] for e in events]
            colors = ["#FF4444" if e['type']=="violation" else "#FFA500" 
                    for e in events]
            
            ax.scatter(times, [1]*len(times), c=colors, s=100)
            ax.set_yticks([])
            
            for x, label, c in zip(times, labels, colors):
                ax.axvline(x=x, color=c, linestyle='--', alpha=0.3)
                ax.text(x, 1.05, label, rotation=45, ha='right', 
                    va='bottom', color=c, fontsize=10)

            ax.set_title("Timing Events (Glitches/Violations)", fontsize=12)
            ax.set_xlabel("Time", fontsize=10)
            plt.tight_layout()

            buf = io.BytesIO()
            plt.savefig(buf, format='png', dpi=300, bbox_inches='tight',
                    pad_inches=0.2, facecolor='white')
            buf.seek(0)
            plt.close()
            plots["events"] = buf

        return plots
    """
    def _generate_plots(self, analysis_results: Dict) -> Dict[str, io.BytesIO]:
        
        Return a dictionary of plot buffers, e.g. {"singles": <BytesIO>, "events": <BytesIO>, ...}
        
        plots = {}
        signal_data: Dict[str, SignalData] = analysis_results['signals']
        metrics = analysis_results['metrics']

        # Separate single-bit signals vs multi-bit buses
        singles = {}
        buses = {}

        for id_code, sig in signal_data.items():
            if sig.is_bus:
                # Try to get base_name from e.g. "mybus[3:0]"
                base_name = sig.name.split('[')[0]
                if base_name not in buses:
                    buses[base_name] = []
                buses[base_name].append(sig)
            else:
                singles[sig.name] = sig

        # Plot single-bit signals
        if singles:
            fig, axes = plt.subplots(len(singles), 1, figsize=(10, 2*len(singles)), sharex=True)
            if len(singles) == 1:
                axes = [axes]  # Make it indexable

            for ax, (name, sig) in zip(axes, singles.items()):
                numeric_vals = []
                for v in sig.values:
                    if isinstance(v, str):
                        # String values like '0', '1'
                        if v in ('0', '1'):
                            numeric_vals.append(int(v))
                        else:
                            # Unknown/high-impedance values
                            numeric_vals.append(0)
                    else:
                        # Already numeric value
                        numeric_vals.append(int(bool(v)))  # Convert to 0/1
                        
                ax.step(sig.times, numeric_vals, where='post', label=name)
                ax.set_ylabel(name)
                ax.grid(True)
                ax.legend(loc="upper right")

            plt.xlabel('Time')
            plt.tight_layout()

            buf = io.BytesIO()
            plt.savefig(buf, format='png', dpi=300, bbox_inches='tight')
            buf.seek(0)
            plt.close()
            plots["singles"] = buf

        # Plot bus signals (basic approach)
        for bus_name, sig_list in buses.items():
            fig, ax = plt.subplots(figsize=(10, 4))
            
            # Flatten out all times from each bus bit
            all_bus_times = sorted(set(t for sig in sig_list for t in sig.times))
            if not all_bus_times:
                continue

            # Create an array rows=bits, cols=timepoints
            data_matrix = np.zeros((len(sig_list), len(all_bus_times)), dtype=int)
            # Sort signals so bit[0] ends at row0, etc., if that’s how you want it
            sig_list_sorted = sorted(sig_list, key=lambda s: s.name)

            time_index = {t: i for i, t in enumerate(all_bus_times)}
            for row_i, bit_sig in enumerate(sig_list_sorted):
                for t, v in zip(bit_sig.times, bit_sig.values):
                    col_i = time_index[t]
                    try:
                        if isinstance(v, str):
                            # Binary string
                            if set(v).issubset({'0', '1'}):
                                val_int = int(v, 2)
                            else:
                                val_int = 0  # Unknown/high-impedance
                        else:
                            # Numeric value
                            val_int = int(v)
                    except (ValueError, TypeError):
                        logger.warning(f"Could not convert value {v} to int, using 0")
                        val_int = 0
                    data_matrix[row_i, col_i] = val_int

            im = ax.imshow(data_matrix, aspect='auto', interpolation='nearest')
            plt.colorbar(im, ax=ax)
            ax.set_title(f"Bus: {bus_name}")
            ax.set_xlabel("Time index")
            ax.set_ylabel("Bit index")
            plt.tight_layout()

            buf = io.BytesIO()
            plt.savefig(buf, format='png', dpi=300)
            buf.seek(0)
            plt.close()
            plots[bus_name] = buf

        # Plot glitch/violation events as a timeline
        glitches = metrics.get('glitches', [])
        violations = metrics.get('violations', [])
        
        if glitches or violations:
            fig, ax = plt.subplots(figsize=(12, 3))
            events = []
            
            for g in glitches:
                events.append({
                    'time': g['time'],
                    'description': f"Glitch on {g['signal']}",
                    'type': 'glitch'
                })
                
            for v in violations:
                events.append({
                    'time': v.get('time', 0),
                    'description': f"{v.get('type','Unknown')} violation on {v.get('signal','?')}",
                    'type': 'violation'
                })

            if events:
                events.sort(key=lambda e: e['time'])
                times = [e['time'] for e in events]
                labels = [e['description'] for e in events]
                colors = ["red" if e['type']=="violation" else "orange" for e in events]
                
                ax.scatter(times, [1]*len(times), c=colors)
                ax.set_yticks([])

                for x, label, c in zip(times, labels, colors):
                    ax.axvline(x=x, color=c, linestyle='--', alpha=0.3)
                    ax.text(x, 1.05, label, rotation=45, ha='right', va='bottom', color=c)

                ax.set_title("Timing Events (Glitches/Violations)")
                ax.set_xlabel("Time")
                plt.tight_layout()

                buf = io.BytesIO()
                plt.savefig(buf, format='png', dpi=300)
                buf.seek(0)
                plt.close()
                plots["events"] = buf

        return plots
    """