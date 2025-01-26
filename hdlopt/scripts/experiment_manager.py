import sqlite3
from datetime import datetime
import hashlib
from typing import Dict, List, Optional, Set
from pathlib import Path
import json
import shutil
import difflib
from enum import Enum
from dataclasses import dataclass, is_dataclass, asdict

from .logger import logger

class EnhancedJSONEncoder(json.JSONEncoder):
    """Custom JSON encoder for dataclasses and Enums."""
    def default(self, obj):
        if is_dataclass(obj):
            return asdict(obj)
        if isinstance(obj, Enum):
            return obj.name
        return super().default(obj)

@dataclass
class ExperimentConfig:
    """Configuration for experiment tracking.
    
    Attributes:
        name: Name of the experiment
        version: Version string
        description: Optional experiment description
        tags: Optional dictionary of tag key-value pairs
        base_path: Base directory for experiment data
    """
    name: str
    version: str
    description: Optional[str] = None
    tags: Optional[Dict[str, str]] = None
    base_path: str = "experiments"

@dataclass
class ComponentChange:
    """Represents changes to a component between runs"""
    component_name: str
    old_hash: Optional[str]
    new_hash: str
    changed_files: List[str]
    diff_summary: str

@dataclass
class ExperimentRun:
    """Records details about a single analysis run"""
    run_id: str
    timestamp: datetime
    components: List[str]
    component_hashes: Dict[str, str]
    config: Dict
    metrics: Dict
    artifacts: Dict[str, str]

class ExperimentManager:
    """Manages HDL design experiments and analysis runs"""
    
    def __init__(self, config: ExperimentConfig):
        self.config = config
        self.db_path = self.config.base_path / "experiments.db"
        self.active_connections = set()
        self.setup_database()

    def setup_database(self):
        """Initialize SQLite database schema"""
        self.db_path.parent.mkdir(parents=True, exist_ok=True)  # Ensure directory exists
        with self._get_connection() as conn:
            conn.execute("PRAGMA journal_mode=DELETE;")  # Disable WAL
            conn.execute("""
                CREATE TABLE IF NOT EXISTS runs (
                    run_id TEXT PRIMARY KEY,
                    timestamp TEXT,
                    components TEXT,
                    component_hashes TEXT,
                    config TEXT,
                    metrics TEXT,
                    artifacts TEXT
                )
            """)
            
            conn.execute("""
                CREATE TABLE IF NOT EXISTS component_history (
                    run_id TEXT,
                    component_name TEXT,
                    file_hash TEXT,
                    file_path TEXT,
                    PRIMARY KEY (run_id, component_name)
                )
            """)
        self._close_connections()

    def _get_connection(self):
        """Create and track a new connection"""
        conn = sqlite3.connect(
            str(self.db_path),
            timeout=30,  # Increase timeout
            isolation_level='IMMEDIATE',  # Use immediate transaction mode
            detect_types=sqlite3.PARSE_DECLTYPES
        )
        conn.execute("PRAGMA journal_mode=DELETE")  # Disable WAL mode
        conn.execute("PRAGMA busy_timeout=30000")  # Set busy timeout to 30 seconds
        self.active_connections.add(conn)
        return conn

    def __enter__(self):
        """Context manager entry"""
        return self
        
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit - ensure proper cleanup"""
        self._close_connections()
        
    def _close_connections(self):
        """Explicitly close all tracked connections"""
        for conn in list(self.active_connections):  # Create copy of set to avoid modification during iteration
            try:
                conn.rollback()  # Rollback any pending transactions
                conn.execute("PRAGMA optimize")  # Optimize before closing
                conn.close()
                self.active_connections.remove(conn)
            except Exception as e:
                logger.warning(f"Error closing connection: {str(e)}")
        self.active_connections.clear()

    def start_run(self, components: List[Path], config: Dict) -> str:
        """Start a new experiment run.
        
        Args:
            components: List of component source files
            config: Run configuration dictionary
            
        Returns:
            Run ID string
        """
        # Generate unique run ID
        timestamp = datetime.now()
        run_id = f"run_{timestamp.strftime('%Y%m%d_%H%M%S%f')[:-3]}"

        # Ensure config is properly serializable
        config_copy = config.copy()
        for k, v in config_copy.items():
            if isinstance(v, Enum):
                config_copy[k] = v.name
            elif isinstance(v, Path):
                config_copy[k] = str(v)
        
        # Calculate file hashes
        component_hashes = {}
        for comp_path in components:
            component_hashes[comp_path.stem] = self._hash_file(comp_path)
            
        # Create run record
        run = ExperimentRun(
            run_id=run_id,
            timestamp=timestamp,
            components=[c.stem for c in components],
            component_hashes=component_hashes,
            config=config_copy,
            metrics={},
            artifacts={}
        )
        
        # Save initial run state
        self._save_run(run)
        
        # Track component versions
        for comp_path in components:
            self._track_component(run_id, comp_path)
            
        return run_id

    def update_metrics(self, run_id: str, metrics: Dict):
        """Update metrics for current run"""
        run = self._load_run(run_id)
        if not run:
            raise ValueError(f"Run {run_id} not found")
        run.metrics.update(metrics)
        self._save_run(run)

    def add_artifact(self, run_id: str, name: str, path: Path):
        """Add an artifact file to the run"""
        run = self._load_run(run_id)
        if run:
            # Copy artifact to experiment storage
            artifact_dir = self.config.base_path / "artifacts" / run_id
            artifact_dir.mkdir(parents=True, exist_ok=True)
            
            dest_path = artifact_dir / path.name

            if path.is_dir():
                # Copy directory recursively
                shutil.copytree(path, dest_path, dirs_exist_ok=True)
            else:
                # Copy file
                shutil.copy(path, dest_path)
            
            run.artifacts[name] = str(dest_path)
            self._save_run(run)

    def get_component_history(self, component_name: str) -> List[Dict]:
        """Get version history for a component"""
        with self._get_connection() as conn:
            cursor = conn.execute("""
                SELECT r.run_id, r.timestamp, r.metrics, ch.file_hash
                FROM runs r
                JOIN component_history ch ON r.run_id = ch.run_id
                WHERE ch.component_name = ?
                ORDER BY r.timestamp DESC
            """, (component_name,))
            
            history = []
            for run_id, timestamp, metrics, file_hash in cursor:
                history.append({
                    'run_id': run_id,
                    'timestamp': timestamp,
                    'metrics': json.loads(metrics),
                    'hash': file_hash
                })
            return history

    def compare_runs(self, run_id1: str, run_id2: str) -> Dict:
        """Compare two runs and identify differences"""
        run1 = self._load_run(run_id1)
        run2 = self._load_run(run_id2)
        
        if not (run1 and run2):
            return {}
            
        # Find changed components
        changes = []
        all_components = set(run1.components) | set(run2.components)
        
        for comp in all_components:
            old_hash = run1.component_hashes.get(comp)
            new_hash = run2.component_hashes.get(comp)
            
            if old_hash != new_hash:
                # Get detailed changes
                changed_files = self._get_changed_files(run_id1, run_id2, comp)
                diff = self._generate_diff(run_id1, run_id2, comp)
                
                changes.append(ComponentChange(
                    component_name=comp,
                    old_hash=old_hash,
                    new_hash=new_hash,
                    changed_files=changed_files,
                    diff_summary=diff
                ))
                
        return {
            'timestamp1': run1.timestamp,
            'timestamp2': run2.timestamp,
            'component_changes': changes,
            'metric_changes': self._compare_metrics(run1.metrics, run2.metrics)
        }

    def get_latest_version(self, component_name: str) -> Optional[str]:
        """Get run ID with latest version of a component"""
        with self._get_connection() as conn:
            cursor = conn.execute("""
                SELECT run_id FROM component_history
                WHERE component_name = ?
                ORDER BY run_id DESC LIMIT 1
            """, (component_name,))
            result = cursor.fetchone()
            return result[0] if result else None

    def _hash_file(self, path: Path) -> str:
        """Calculate hash of a file's contents"""
        return hashlib.sha256(path.read_bytes()).hexdigest()

    def _track_component(self, run_id: str, component_path: Path):
        """Record component version information"""
        with self._get_connection() as conn:
            conn.execute("""
                INSERT INTO component_history (run_id, component_name, file_hash, file_path)
                VALUES (?, ?, ?, ?)
            """, (
                run_id,
                component_path.stem,
                self._hash_file(component_path),
                str(component_path)
            ))

    def _save_run(self, run: ExperimentRun):
        """Save run record to database"""
        with self._get_connection() as conn:
            conn.execute("""
                INSERT OR REPLACE INTO runs
                (run_id, timestamp, components, component_hashes, config, metrics, artifacts)
                VALUES (?, ?, ?, ?, ?, ?, ?)
            """, (
                run.run_id,
                run.timestamp.isoformat(),
                json.dumps(run.components),
                json.dumps(run.component_hashes),
                json.dumps(run.config, cls=EnhancedJSONEncoder),
                json.dumps(run.metrics),
                json.dumps(run.artifacts)
            ))

    def _load_run(self, run_id: str) -> Optional[ExperimentRun]:
        """Load run record from database"""
        with self._get_connection() as conn:
            cursor = conn.execute("SELECT * FROM runs WHERE run_id = ?", (run_id,))
            row = cursor.fetchone()
            
            if row:
                return ExperimentRun(
                    run_id=row[0],
                    timestamp=datetime.fromisoformat(row[1]),
                    components=json.loads(row[2]),
                    component_hashes=json.loads(row[3]),
                    config=json.loads(row[4]),
                    metrics=json.loads(row[5]),
                    artifacts=json.loads(row[6])
                )
        return None

    def _get_changed_files(self, run_id1: str, run_id2: str, component: str) -> List[str]:
        """Get list of files that changed between runs for a component"""
        with self._get_connection() as conn:
            cursor = conn.execute("""
                SELECT ch1.file_path, ch1.file_hash, ch2.file_hash
                FROM component_history ch1
                LEFT JOIN component_history ch2 ON 
                    ch2.run_id = ? AND ch2.component_name = ch1.component_name
                WHERE ch1.run_id = ? AND ch1.component_name = ?
            """, (run_id2, run_id1, component))
            
            changed = []
            for path, hash1, hash2 in cursor:
                if hash1 != hash2:
                    changed.append(path)
            return changed

    def _generate_diff(self, run_id1: str, run_id2: str, component: str) -> str:
        """Generate readable diff of changes between component versions"""
        files1 = self._get_component_files(run_id1, component)
        files2 = self._get_component_files(run_id2, component)
        
        diff_lines = []
        for path in set(files1.keys()) | set(files2.keys()):
            old_content = files1.get(path, '')
            new_content = files2.get(path, '')
            
            diff = difflib.unified_diff(
                old_content.splitlines(),
                new_content.splitlines(),
                fromfile=f'a/{path}',
                tofile=f'b/{path}'
            )
            diff_lines.extend(diff)
            
        return '\n'.join(diff_lines)

    def _get_component_files(self, run_id: str, component: str) -> Dict[str, str]:
        """Get map of file paths to contents for a component version"""
        with self._get_connection() as conn:
            cursor = conn.execute("""
                SELECT file_path FROM component_history
                WHERE run_id = ? AND component_name = ?
            """, (run_id, component))
            
            files = {}
            for (path,) in cursor:
                if Path(path).exists():
                    files[path] = Path(path).read_text()
            return files

    def _compare_metrics(self, metrics1: Dict, metrics2: Dict) -> Dict:
        """Compare metrics between runs"""
        changes = {}
        all_metrics = set(metrics1.keys()) | set(metrics2.keys())
        
        for metric in all_metrics:
            val1 = metrics1.get(metric)
            val2 = metrics2.get(metric)
            
            if val1 != val2:
                changes[metric] = {
                    'from': val1,
                    'to': val2,
                    'delta': val2 - val1 if isinstance(val1, (int, float)) and 
                                         isinstance(val2, (int, float)) else None
                }
                
        return changes