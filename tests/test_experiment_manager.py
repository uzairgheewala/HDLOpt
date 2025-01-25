import pytest
import tempfile
from pathlib import Path
import json
import sqlite3
import gc
import os
from datetime import datetime, timedelta
import shutil
import platform

from hdlopt.scripts.experiment_manager import (
    ExperimentManager, 
    ExperimentConfig,
    ExperimentRun,
    ComponentChange
)

from functools import wraps
from tenacity import retry, stop_after_attempt, wait_fixed
import time
import errno

def windows_file_retry(max_attempts=3, delay=0.1):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            for _ in range(max_attempts):
                try:
                    return func(*args, **kwargs)
                except PermissionError as e:
                    if e.winerror != errno.EACCES:
                        raise
                    time.sleep(delay)
            return func(*args, **kwargs)
        return wrapper
    return decorator

# Apply to test cleanup
@pytest.fixture
def temp_dir():
    """Create temporary directory with retry-enhanced cleanup"""
    td = tempfile.TemporaryDirectory()
    yield Path(td.name)
    
    # Windows-specific retry for directory cleanup
    @retry(stop=stop_after_attempt(10), wait=wait_fixed(0.5))
    def cleanup():
        try:
            shutil.rmtree(td.name, ignore_errors=True)
        except PermissionError:
            pass
    
    cleanup()
    # Final attempt using system tools
    if platform.system() == "Windows":
        os.system(f'rmdir /s /q "{td.name}"')

@pytest.fixture
def sample_verilog(temp_dir):
    """Create sample Verilog files for testing."""
    files = {
        'adder.v': """
            module adder(
                input [7:0] a, b,
                output [8:0] sum
            );
                assign sum = a + b;
            endmodule
        """,
        'counter.v': """
            module counter(
                input clk, rst,
                output reg [3:0] count
            );
                always @(posedge clk)
                    if (rst) count <= 0;
                    else count <= count + 1;
            endmodule
        """
    }
    
    created_files = []
    for name, content in files.items():
        file_path = temp_dir / name
        file_path.write_text(content)
        created_files.append(file_path)
        
    return created_files

@pytest.fixture
def experiment_manager(temp_dir):
    """Create ExperimentManager instance with test config."""
    config = ExperimentConfig(
        name="test_experiment",
        version="1.0",
        description="Test experiment",
        tags={"type": "test"},
        base_path=temp_dir
    )
    with ExperimentManager(config) as manager:
        yield manager

    if platform.system() == "Windows":
        # On Windows, we need to be more aggressive with cleanup
        for attempt in range(5):
            try:
                if manager.db_path.exists():
                    os.close(os.open(str(manager.db_path), os.O_RDONLY))  # Force handle close
                    manager.db_path.unlink()
                break
            except PermissionError:
                import time
                time.sleep(0.2 * (attempt + 1))  # Increasing delay
                continue

def test_manager_initialization(experiment_manager, temp_dir):
    """Test manager initialization and database creation."""
    assert experiment_manager.db_path.exists()
    
    # Verify database schema
    with sqlite3.connect(experiment_manager.db_path) as conn:
        cursor = conn.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = {row[0] for row in cursor.fetchall()}
        assert "runs" in tables
        assert "component_history" in tables

def test_start_run(experiment_manager, sample_verilog):
    """Test starting a new experiment run."""
    run_id = experiment_manager.start_run(
        components=sample_verilog,
        config={"test_param": True}
    )
    
    assert run_id is not None
    
    # Verify run record
    run = experiment_manager._load_run(run_id)
    assert run is not None
    assert len(run.components) == len(sample_verilog)
    assert all(comp in run.components for comp in ["adder", "counter"])
    
    # Verify component tracking
    with sqlite3.connect(experiment_manager.db_path) as conn:
        cursor = conn.execute(
            "SELECT component_name FROM component_history WHERE run_id = ?",
            (run_id,)
        )
        components = {row[0] for row in cursor.fetchall()}
        assert components == {"adder", "counter"}

def test_update_metrics(experiment_manager, sample_verilog):
    """Test updating run metrics."""
    run_id = experiment_manager.start_run(
        components=sample_verilog,
        config={}
    )
    
    test_metrics = {
        "passed_tests": 42,
        "failed_tests": 3,
        "execution_time": 1.23
    }
    
    experiment_manager.update_metrics(run_id, test_metrics)
    
    run = experiment_manager._load_run(run_id)
    assert run.metrics == test_metrics

def test_add_artifact(experiment_manager, sample_verilog, temp_dir):
    """Test adding artifacts to a run."""
    run_id = experiment_manager.start_run(
        components=sample_verilog,
        config={}
    )
    
    # Create test artifact
    artifact = temp_dir / "test_results.json"
    artifact.write_text(json.dumps({"result": "pass"}))
    
    experiment_manager.add_artifact(run_id, "test_results", artifact)
    
    run = experiment_manager._load_run(run_id)
    assert "test_results" in run.artifacts
    assert Path(run.artifacts["test_results"]).exists()

def test_component_history(experiment_manager, temp_dir):
    """Test tracking component version history."""
    # Create initial version
    v1_file = temp_dir / "module.v"
    v1_file.write_text("module test; assign x = 1; endmodule")
    
    run1_id = experiment_manager.start_run(
        components=[v1_file],
        config={}
    )
    
    # Create modified version
    v1_file.write_text("module test; assign x = 2; endmodule")
    
    run2_id = experiment_manager.start_run(
        components=[v1_file],
        config={}
    )
    
    history = experiment_manager.get_component_history("module")
    assert len(history) == 2
    assert history[0]["run_id"] == run2_id
    assert history[1]["run_id"] == run1_id

def test_compare_runs(experiment_manager, temp_dir):
    """Test comparing two experiment runs."""
    # Create initial versions
    module_a = temp_dir / "a.v"
    module_b = temp_dir / "b.v"
    module_a.write_text("module a; assign x = 1; endmodule")
    module_b.write_text("module b; assign y = 1; endmodule")
    
    run1_id = experiment_manager.start_run(
        components=[module_a, module_b],
        config={}
    )
    experiment_manager.update_metrics(run1_id, {"metric1": 100})
    
    # Modify one module and add metrics
    module_a.write_text("module a; assign x = 2; endmodule")
    
    run2_id = experiment_manager.start_run(
        components=[module_a, module_b],
        config={}
    )
    experiment_manager.update_metrics(run2_id, {"metric1": 150})
    
    comparison = experiment_manager.compare_runs(run1_id, run2_id)
    
    assert len(comparison["component_changes"]) == 1
    assert comparison["component_changes"][0].component_name == "a"
    assert comparison["metric_changes"]["metric1"]["delta"] == 50

def test_get_latest_version(experiment_manager, temp_dir):
    """Test retrieving latest version of a component."""
    module = temp_dir / "test.v"
    
    # Create multiple versions
    for i in range(3):
        module.write_text(f"module test; assign x = {i}; endmodule")
        run_id = experiment_manager.start_run(
            components=[module],
            config={}
        )
    
    latest_run = experiment_manager.get_latest_version("test")
    assert latest_run == run_id

def test_error_handling(experiment_manager):
    """Test error handling for various operations."""
    # Test invalid run ID
    with pytest.raises(ValueError):
        experiment_manager.update_metrics("invalid_run", {})
    
    # Test missing component
    history = experiment_manager.get_component_history("nonexistent")
    assert not history
    
    # Test invalid run comparison
    comparison = experiment_manager.compare_runs("run1", "run2")
    assert not comparison

def test_concurrent_runs(temp_dir):
    """Test handling multiple experiment runs concurrently."""
    runs = []
    
    # Create multiple managers with same base path
    for i in range(3):
        subdir = temp_dir / f"subdir_{i}"
        subdir.mkdir(parents=True, exist_ok=True)
        
        config = ExperimentConfig(
            name=f"test_{i}",
            version="1.0",
            base_path=subdir
        )
        
        # Use context manager for each manager
        with ExperimentManager(config) as manager:
            test_file = subdir / f"test_{i}.v"
            test_file.write_text(f"module test_{i}; endmodule")
            
            run_id = manager.start_run(components=[test_file], config={})
            runs.append(run_id)
            
            # Verify database has exactly 1 run
            with sqlite3.connect(manager.db_path) as conn:
                cursor = conn.execute("SELECT COUNT(*) FROM runs")
                assert cursor.fetchone()[0] == 1  # Each DB should have 1 run
                
def test_file_cleanup(temp_dir):
    """Test proper cleanup of temporary files."""
    config = ExperimentConfig(
        name="cleanup_test",
        version="1.0",
        base_path=temp_dir
    )
    
    # Create temporary files
    artifact_dir = temp_dir / "artifacts"
    artifact_dir.mkdir()
    test_files = []
    
    for i in range(3):
        file = artifact_dir / f"test_{i}.txt"
        file.write_text(f"Test {i}")
        test_files.append(file)
    
    # Create and delete manager
    manager = ExperimentManager(config)
    run_id = manager.start_run(
        components=test_files,
        config={}
    )
    
    # Add artifacts
    for file in test_files:
        manager.add_artifact(run_id, file.stem, file)
    
    # Delete files and verify cleanup
    for file in test_files:
        file.unlink()
    
    # Artifacts should still exist
    run = manager._load_run(run_id)
    for name, path in run.artifacts.items():
        assert Path(path).exists()

def test_large_experiment(experiment_manager, temp_dir):
    """Test handling large number of components and metrics."""
    # Create many test files
    test_files = []
    for i in range(100):
        file = temp_dir / f"test_{i}.v"
        file.write_text(f"module test_{i}; endmodule")
        test_files.append(file)
    
    run_id = experiment_manager.start_run(
        components=test_files,
        config={}
    )
    
    # Add many metrics
    metrics = {f"metric_{i}": i for i in range(1000)}
    experiment_manager.update_metrics(run_id, metrics)
    
    # Verify data integrity
    run = experiment_manager._load_run(run_id)
    assert len(run.components) == len(test_files)
    assert len(run.metrics) == len(metrics)

def test_database_consistency(experiment_manager, sample_verilog):
    """Test database consistency across operations."""
    def count_records():
        with sqlite3.connect(experiment_manager.db_path) as conn:
            runs = conn.execute("SELECT COUNT(*) FROM runs").fetchone()[0]
            history = conn.execute(
                "SELECT COUNT(*) FROM component_history"
            ).fetchone()[0]
            return runs, history
    
    # Initial state
    initial_runs, initial_history = count_records()
    
    # Add run
    run_id = experiment_manager.start_run(
        components=sample_verilog,
        config={}
    )
    
    # Verify record counts
    runs, history = count_records()
    assert runs == initial_runs + 1
    assert history == initial_history + len(sample_verilog)
    
    # Update run
    experiment_manager.update_metrics(run_id, {"test": 1})
    runs, history = count_records()
    assert runs == initial_runs + 1  # Should not change
    assert history == initial_history + len(sample_verilog)  # Should not change