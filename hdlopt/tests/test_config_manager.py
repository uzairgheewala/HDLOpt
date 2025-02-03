import json
import os
from pathlib import Path
import pytest
from unittest.mock import patch, MagicMock

from hdlopt.config_manager import ConfigManager, UserConfig

@pytest.fixture
def temp_config_file(tmp_path):
    """Create a temporary config file."""
    config_file = tmp_path / ".hdlopt.json"
    return config_file

@pytest.fixture
def temp_workspace(tmp_path):
    """Create a temporary workspace."""
    workspace = tmp_path / "workspace"
    workspace.mkdir()
    return workspace

def test_default_initialization(temp_config_file):
    """Test ConfigManager initialization with defaults."""
    with patch('pathlib.Path.home', return_value=temp_config_file.parent):
        manager = ConfigManager()
        assert manager.config_path == Path(os.getcwd()) / ".hdlopt.json"
        assert isinstance(manager.config, UserConfig)
        assert manager.config.simulator == "iverilog"
        assert manager.config.parser == "native"

def test_custom_config_path(temp_config_file):
    """Test ConfigManager with custom config path."""
    manager = ConfigManager(config_path=str(temp_config_file))
    assert manager.config_path == temp_config_file
    assert isinstance(manager.config, UserConfig)

def test_save_and_load_config(temp_config_file):
    """Test saving and loading configuration."""
    manager = ConfigManager(config_path=str(temp_config_file))
    manager.config.simulator = "iverilog"
    manager.save_config()

    # Create new manager to load saved config
    new_manager = ConfigManager(config_path=str(temp_config_file))
    assert new_manager.config.simulator == "iverilog"

def test_update_config(temp_config_file):
    """Test updating configuration values."""
    manager = ConfigManager(config_path=str(temp_config_file))
    manager.update_config(simulator="iverilog", recursive=False)

    assert manager.config.simulator == "iverilog"
    assert not manager.config.recursive

    # Verify changes were persisted
    with open(temp_config_file) as f:
        config_data = json.load(f)
        assert config_data["simulator"] == "iverilog"
        assert not config_data["recursive"]

def test_invalid_config_file(temp_config_file):
    """Test handling of invalid config file."""
    # Create invalid JSON
    temp_config_file.write_text("{invalid json")

    # Should use defaults when config file is invalid
    manager = ConfigManager(config_path=str(temp_config_file))
    assert manager.config.simulator == "modelsim"
    assert manager.config.parser == "native"

def test_ensure_directories(temp_workspace):
    """Test directory creation and example files."""
    manager = ConfigManager(config_path=str(temp_workspace / ".hdlopt.json"))
    
    # Override default directories to use temp workspace
    manager.config.src_dir = str(temp_workspace / "src")
    manager.config.output_dir = str(temp_workspace / "generated")

    src_dir, output_dir = manager.ensure_directories()

    # Check directories were created
    assert src_dir.exists()
    assert output_dir.exists()

    # Check example files were created
    example_file = src_dir / "example_module.v"
    readme_file = src_dir / "README.md"
    assert example_file.exists()
    assert readme_file.exists()

    # Verify example module content
    module_content = example_file.read_text()
    assert "module example_module" in module_content
    assert "parameter WIDTH = 8" in module_content

def test_get_runner_config(temp_config_file):
    """Test getting configuration for HDLAnalysisRunner."""
    manager = ConfigManager(config_path=str(temp_config_file))
    manager.config.simulator = "iverilog"

    # Get config without overrides
    config = manager.get_runner_config()
    assert config["simulator"] == "iverilog"

    # Get config with overrides
    config = manager.get_runner_config({"simulator": "modelsim", "verbose": True})
    assert config["simulator"] == "modelsim"
    assert config["verbose"] is True

def test_unicode_handling(temp_workspace):
    """Test handling of Unicode characters in paths and content."""
    unicode_path = temp_workspace / "测试"
    unicode_path.mkdir()

    manager = ConfigManager(config_path=str(unicode_path / ".hdlopt.json"))
    manager.config.src_dir = str(unicode_path / "src")
    manager.config.output_dir = str(unicode_path / "generated")

    src_dir, output_dir = manager.ensure_directories()
    
    # Verify directories were created with Unicode names
    assert src_dir.exists()
    assert output_dir.exists()

    # Verify files can be read/written with Unicode content
    readme = src_dir / "README.md"
    content = readme.read_text(encoding='utf-8')
    assert "HDL Source Directory" in content

def test_config_persistence_across_sessions(temp_config_file, temp_workspace):
    """Test configuration persistence across multiple sessions."""
    # First session
    manager1 = ConfigManager(config_path=str(temp_config_file))
    manager1.config.src_dir = str(temp_workspace / "custom_src")
    manager1.config.simulator = "iverilog"
    manager1.save_config()

    # Simulate new session
    manager2 = ConfigManager(config_path=str(temp_config_file))
    assert manager2.config.src_dir == str(temp_workspace / "custom_src")
    assert manager2.config.simulator == "iverilog"

def test_multiple_instances(temp_config_file):
    """Test handling of multiple ConfigManager instances."""
    manager1 = ConfigManager(config_path=str(temp_config_file))
    manager2 = ConfigManager(config_path=str(temp_config_file))

    # Update through first manager
    manager1.update_config(simulator="iverilog")

    # Second manager should see changes after loading
    manager2 = ConfigManager(config_path=str(temp_config_file))
    assert manager2.config.simulator == "iverilog"

def test_nonexistent_config_directory(temp_workspace):
    """Test handling of nonexistent config directory."""
    deep_path = temp_workspace / "a" / "b" / "c" / ".hdlopt.json"
    manager = ConfigManager(config_path=str(deep_path))
    manager.save_config()

    assert deep_path.exists()
    assert deep_path.parent.exists()

def test_directory_permissions(temp_workspace):
    """Test handling of directory permission issues."""
    with patch('pathlib.Path.mkdir', side_effect=PermissionError):
        manager = ConfigManager(config_path=str(temp_workspace / ".hdlopt.json"))
        with pytest.raises(PermissionError):
            manager.ensure_directories()

def test_config_file_permissions(temp_config_file):
    """Test handling of config file permission issues."""
    manager = ConfigManager(config_path=str(temp_config_file))
    
    with patch('builtins.open', side_effect=PermissionError):
        # Should not raise error, should use defaults
        config = manager._load_or_create_config()
        assert isinstance(config, UserConfig)
        assert config.simulator == "modelsim"