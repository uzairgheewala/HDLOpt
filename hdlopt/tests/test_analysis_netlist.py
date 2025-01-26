import pytest
from ..scripts.analysis.netlist import NetlistAnalyzer, ModuleMetrics
from ..scripts.analysis.resource import ResourceAnalysisConfig
from .test_analysis_fixtures import *

class TestNetlistAnalyzer:
    """Test suite for netlist analysis functionality"""

    def test_module_metrics_initialization(self):
        """Test ModuleMetrics dataclass initialization"""
        metrics = ModuleMetrics()
        assert metrics.wire_count == 0
        assert metrics.wire_bits == 0
        assert metrics.port_count == 0
        assert metrics.port_bits == 0
        assert metrics.cell_count == 0
        assert metrics.hierarchy_depth == 0
        assert metrics.cells == {}
        assert metrics.raw_gates == {}
        assert metrics.sub_modules == {}

        # Test with values 
        metrics = ModuleMetrics(
            wire_count=10,
            wire_bits=32,
            port_count=5,
            port_bits=16,
            cell_count=3,
            hierarchy_depth=2,
            cells={"full_adder": 2},
            raw_gates={"$_AND_": 4},
            sub_modules={"half_adder": 1}
        )
        assert metrics.wire_count == 10
        assert metrics.cells["full_adder"] == 2
        assert metrics.raw_gates["$_AND_"] == 4

    def test_basic_analysis(self, sample_netlist):
        """Test basic netlist analysis functionality"""
        analyzer = NetlistAnalyzer()
        config = ResourceAnalysisConfig()
        param_config = {"WIDTH": 4}

        analysis = analyzer.analyze(
            sample_netlist,
            "test_module",
            param_config,
            config
        )

        # Verify test_module metrics
        test_module = analysis["test_module"]
        assert test_module.wire_count == 2  # net1, net2
        assert test_module.wire_bits == 4   # 1 + 3 bits
        assert test_module.port_count == 3  # clk, rst, out
        assert test_module.port_bits == 6   # 1 + 1 + 4 bits
        assert test_module.cell_count == 2  # add1, $and1
        assert test_module.hierarchy_depth == 1
        assert test_module.cells["full_adder"] == 1
        assert test_module.raw_gates["$_AND_"] == 2

        # Verify full_adder metrics
        full_adder = analysis["full_adder"]
        assert full_adder.wire_count == 2
        assert full_adder.port_count == 5
        assert full_adder.cell_count == 2
        assert full_adder.hierarchy_depth == 0
        assert full_adder.raw_gates["$_XOR_"] == 1
        assert full_adder.raw_gates["$_AND_"] == 1

    def test_hierarchical_analysis(self, sample_netlist):
        """Test hierarchical depth calculation"""
        analyzer = NetlistAnalyzer()
        
        depth = analyzer._calculate_depth("test_module", sample_netlist)
        assert depth == 1  # test_module -> full_adder

        # Add deeper hierarchy
        sample_netlist["modules"]["full_adder"]["cells"]["half_add"] = {
            "type": "half_adder"
        }
        sample_netlist["modules"]["half_adder"] = {
            "cells": {
                "$xor": {"type": "$_XOR_"}
            }
        }

        depth = analyzer._calculate_depth("test_module", sample_netlist)
        assert depth == 2  # test_module -> full_adder -> half_adder

    def test_cell_analysis(self, sample_netlist):
        """Test cell and gate analysis"""
        analyzer = NetlistAnalyzer()
        metrics = ModuleMetrics()

        analyzer._analyze_cells(
            metrics,
            sample_netlist["modules"]["test_module"],
            sample_netlist
        )

        # Verify cell counts
        assert metrics.cells["full_adder"] == 1
        assert metrics.cells["$_AND_"] == 1

        # Verify raw gates (including from submodules)
        assert metrics.raw_gates["$_AND_"] == 2  # One local, one from full_adder
        assert metrics.raw_gates["$_XOR_"] == 1  # From full_adder

        # Verify submodule tracking
        assert metrics.sub_modules["full_adder"] == 1

    def test_increment_rules(self, sample_netlist):
        """Test parameter increment rule application"""
        analyzer = NetlistAnalyzer()
        config = ResourceAnalysisConfig(
            increment_rules={
                "test_component": {
                    "param_name": "WIDTH",
                    "cell_type": "full_adder",
                    "increment_per_param": 1,
                    'base_value': 4
                }
            }
        )
        param_config = {"WIDTH": 8}  # Base value was 4

        analysis = analyzer.analyze(
            sample_netlist,
            "test_module",
            param_config,
            config
        )

        test_module = analysis["test_module"]
        assert test_module.cells["full_adder"] == 5  # Original + 4 increments
        # Raw gates should scale accordingly
        assert test_module.raw_gates["$_XOR_"] == 5  # One per full_adder
        assert test_module.raw_gates["$_AND_"] == 6  # Original + 5 from full_adders

    def test_error_handling(self, sample_netlist):
        """Test error handling in analysis"""
        analyzer = NetlistAnalyzer()

        # Test missing module
        with pytest.raises(KeyError):
            analyzer._analyze_module(
                {"name": "missing"},
                sample_netlist,
                {},
                ResourceAnalysisConfig()
            )

        # Test invalid cell reference
        sample_netlist["modules"]["test_module"]["cells"]["invalid"] = {
            "type": "nonexistent_module"
        }
        metrics = analyzer.analyze(
            sample_netlist,
            "test_module",
            {},
            ResourceAnalysisConfig()
        )
        # Should skip invalid cell but complete analysis
        assert "test_module" in metrics

    def test_multiple_configurations(self, sample_netlist):
        """Test analysis with multiple parameter configurations"""
        analyzer = NetlistAnalyzer()
        configs = [
            {"WIDTH": 4},
            {"WIDTH": 8},
            {"WIDTH": 16}
        ]

        all_analyses = {}
        for cfg in configs:
            analysis = analyzer.analyze(
                sample_netlist,
                "test_module",
                cfg,
                ResourceAnalysisConfig(
                    increment_rules={
                        # Provide an increment rule for full_adder
                        "test_rule": {
                            "param_name": "WIDTH",
                            "cell_type": "full_adder",
                            "increment_per_param": 1,
                            "base_value": 4
                        }
                    }
                )
            )
            all_analyses[str(cfg)] = analysis
        
        # Verify distinct results for each configuration
        assert len(all_analyses) == 3
        
        width4 = all_analyses[str({"WIDTH": 4})]["test_module"]
        width8 = all_analyses[str({"WIDTH": 8})]["test_module"]
        width16 = all_analyses[str({"WIDTH": 16})]["test_module"]

        # Now we should get strictly increasing cell_count for 4 vs 8 vs 16
        # Because each time we pass the netlist a bigger param, the 'full_adder' count increments
        # e.g., param=4 => increments=0 => 2 total cells
        #       param=8 => increments=4 => 6 total cells
        #       param=16 => increments=12 => 14 total cells
        assert width4.cell_count < width8.cell_count < width16.cell_count