import os
import json
from pathlib import Path

MODULES = {
    # 1) Adders
    "adders": {
        "basic": [
            "half_adder",
            "full_adder",
            "ripple_carry_adder"
        ],
        "carry_save": [
            "carry_save_adder"
        ],
        "brent_kung": [
            "brent_kung_adder"
        ],
        "sklansky": [
            "sklansky_adder"
        ],
        "kogge_stone": [
            "kogge_stone_adder"
        ],
        "carry_select": [
            "carry_select_adder"
        ],
        "carry_bypass": [
            "carry_bypass_adder"
        ],
        "carry_lookahead": [
            "carry_lookahead_adder"
        ]
    },

    # 2) Subtractors
    "subtractors": {
        "basic": [
            "half_subtractor",
            "full_subtractor"
        ],
        "sklansky": [
            "sklansky_subtractor"
        ],
        "borrow_lookahead": [
            "borrow_lookahead_subtractor"
        ]
    },

    # 3) Multipliers
    "multipliers": {
        "basic": [
            "array_multiplier",
            "shift_and_add_multiplier"
        ],
        "booth": [
            "booth_multiplier"
        ],
        "dadda": [
            "dadda_multiplier"
        ],
        "wallace_tree": [
            "wallace_tree_multiplier"
        ],
        "karatsuba": [
            "karatsuba_multiplier"
        ],
        "toom_cook": [
            "toom_cook_multiplier"
        ]
    },

    # 4) Dividers
    "dividers": {
        "basic": [
            "restoring_divider",
            "non_restoring_divider"
        ],
        "srt": [
            "srt_divider"  # Sweeney-Robertson-Tocher
        ],
        "newton_raphson": [
            "newton_raphson_divider"
        ],
        "goldschmidt": [
            "goldschmidt_divider"
        ],
        "parallel_prefix": [
            "parallel_prefix_divider"
        ],
        "digit_recurrence": [
            "digit_recurrence_divider"
        ]
    },

    # 5) Adder-Subtractors
    "adder_subtractors": {
        "basic": [
            "adder_subtractor"
        ],
        "carry_lookahead": [
            "carry_lookahead_adder_subtractor"
        ],
        "sklansky": [
            "sklansky_adder_subtractor"
        ],
        "brent_kung": [
            "brent_kung_adder_subtractor"
        ],
        "kogge_stone": [
            "kogge_stone_adder_subtractor"
        ],
        "carry_select": [
            "carry_select_adder_subtractor"
        ],
        "carry_bypass": [
            "carry_bypass_adder_subtractor"
        ]
    },

    # 6) Complex Number Modules
    "complex_numbers": {
        "adders": [
            "complex_adder",
            "complex_carry_select_adder",
            "complex_brent_kung_adder",
            "complex_kogge_stone_adder"
        ],
        "subtractors": [
            "complex_subtractor",
            "complex_borrow_lookahead_subtractor"
        ],
        "adder_subtractors": [
            "complex_adder_subtractor",
            "complex_carry_lookahead_adder_subtractor"
        ],
        "multipliers": [
            "complex_multiplier",
            "complex_booth_multiplier",
            "complex_fft_based_multiplier"
        ],
        "dividers": [
            "complex_divider",
            "complex_goldschmidt_divider"
        ]
    },

    # 7) ALUs
    "alu": {
        "fixed_point": [
            "fixed_point_alu",
            "fixed_point_vector_alu",
            "fixed_point_custom_instruction_alu"
        ],
        "floating_point": [
            "floating_point_alu",
            "floating_point_vector_alu",
            "floating_point_custom_instruction_alu"
        ],
        "vector": [
            "vector_alu",
            "simd_alu",
            "packed_alu"
        ]
    },

    # 8) UART
    "uart": {
        "basic": [
            "uart_tx",
            "uart_rx",
            "uart_top"
        ],
        "advanced": [
            "uart_flow_control",
            "uart_dma_interface",
            "uart_fifo_interface"
        ],
        "error_handling": [
            "uart_error_detector",
            "uart_error_corrector"
        ]
    },

    # 9) FIR Filter
    "fir_filter": {
        "basic": [
            "fir_filter",
            "fir_filter_direct_form",
            "fir_filter_transpose_form"
        ],
        "systolic": [
            "fir_filter_systolic",
            "fir_filter_pipelined"
        ],
        "parallel": [
            "fir_filter_parallel",
            "fir_filter_pipeline_parallel"
        ]
    },

    # 10) Registers and Counters
    "registers": {
        "basic": [
            "parallel_register",
            "serial_register",
            "loadable_register",
            "resettable_register",
            "bidirectional_register",
            "transparent_register"
        ],
        "shift_registers": [
            "siso_shift_register",
            "sipo_shift_register",
            "piso_shift_register",
            "pipo_shift_register",
            "universal_shift_register",
            "bidirectional_shift_register",
            "delay_line_shift_register",
            "asynchronous_shift_register",
            "synchronous_shift_register"
        ],
        "counters": [
            "ring_counter",
            "johnson_counter",
            "lfsr",
            "up_down_counter",
            "modulo_n_counter",
            "gray_code_counter",
            "binary_counter",
            "synchronous_counter",
            "asynchronous_counter"
        ],
        "specialized": [
            "uptime_counter",
            "event_counter",
            "saturation_counter"
        ]
    },

    # 11) Memories (RAM, SRAM, BRAM, DRAM, ROM, IROM)
    "ram": {
        "basic": [
            "ram",
            "synchronous_ram",
            "asynchronous_ram"
        ],
        "dual_port": [
            "dual_port_ram",
            "dual_port_synchronous_ram",
            "dual_port_asynchronous_ram"
        ],
        "multi_port": [
            "multi_port_ram",
            "multi_bank_ram"
        ],
        "error_correcting": [
            "ecc_ram"
        ]
    },
    "sram": {
        "basic": [
            "sram",
            "synchronous_sram",
            "asynchronous_sram"
        ],
        "dual_port": [
            "dual_port_sram",
            "dual_port_synchronous_sram",
            "dual_port_asynchronous_sram"
        ],
        "multi_port": [
            "multi_port_sram",
            "multi_bank_sram"
        ],
        "error_correcting": [
            "ecc_sram"
        ]
    },
    "bram": {
        "basic": [
            "bram",
            "synchronous_bram",
            "asynchronous_bram"
        ],
        "dual_port": [
            "dual_port_bram"
        ],
        "multi_port": [
            "multi_port_bram"
        ],
        "error_correcting": [
            "ecc_bram"
        ]
    },
    "dram": {
        "basic": [
            "dram",
            "synchronous_dram",
            "asynchronous_dram"
        ],
        "multi_bank": [
            "multi_bank_dram"
        ],
        "refresh_logic": [
            "dram_refresh_controller"
        ],
        "error_correcting": [
            "ecc_dram"
        ]
    },
    "rom": {
        "basic": [
            "rom",
            "synchronous_rom",
            "asynchronous_rom"
        ],
        "programmable": [
            "eprom_rom",
            "eprom_rom",
            "flash_rom"
        ],
        "error_correcting": [
            "ecc_rom"
        ]
    },
    "irom": {
        "basic": [
            "irom",
            "synchronous_irom",
            "asynchronous_irom"
        ],
        "programmable": [
            "eprom_irom",
            "flash_irom"
        ],
        "error_correcting": [
            "ecc_irom"
        ]
    },

    # 12) Clock Domain Crossing
    "cdc": {
        "basic": [
            "cdc_synchronizer"
        ],
        "async_fifo": [
            "async_fifo",
            "async_fifo_depth_16",
            "async_fifo_depth_32",
            "async_fifo_depth_64"
        ],
        "handshake_logic": [
            "cdc_handshake",
            "cdc_three_stage_handshake"
        ],
        "dual_clock_fifo": [
            "dual_clock_fifo",
            "dual_clock_fifo_depth_16",
            "dual_clock_fifo_depth_32"
        ],
        "metastability_protection": [
            "metastability_protection_unit"
        ],
        "clock_domain_bridge": [
            "clock_domain_bridge"
        ]
    },

    "apb": {
        "basic": [
            "apb_master",
            "apb_slave",
            "apb_top"
        ],
        "advanced": [
            "apb_arbiter",
            "apb_decoder",
            "apb_bridge"
        ],
        "error_handling": [
            "apb_error_handler"
        ]
    },
    "spi": {
        "basic": [
            "spi_master",
            "spi_slave",
            "spi_top"
        ],
        "advanced": [
            "spi_dma_interface",
            "spi_fifo_interface"
        ],
        "error_handling": [
            "spi_error_detector",
            "spi_error_corrector"
        ]
    },
    "i2c": {
        "basic": [
            "i2c_master",
            "i2c_slave",
            "i2c_top"
        ],
        "advanced": [
            "i2c_multi_master",
            "i2c_multi_slave",
            "i2c_flex_master"
        ],
        "error_handling": [
            "i2c_error_handler"
        ]
    },
    "pcie": {
        "basic": [
            "pcie_endpoint",
            "pcie_root_complex",
            "pcie_top"
        ],
        "advanced": [
            "pcie_switch",
            "pcie_bridge",
            "pcie_dma_interface"
        ],
        "error_handling": [
            "pcie_error_handler"
        ]
    },
    "axi": {
        "basic": [
            "axi_master",
            "axi_slave",
            "axi_interconnect",
            "axi_top"
        ],
        "advanced": [
            "axi_arbiter",
            "axi_decoder",
            "axi_bridge",
            "axi_fabric"
        ],
        "axi_lite": [
            "axi_lite_master",
            "axi_lite_slave"
        ]
    },
    "ethernet": {
        "basic": [
            "ethernet_mac",
            "ethernet_phy",
            "ethernet_top"
        ],
        "advanced": [
            "ethernet_fifo",
            "ethernet_udp_stack",
            "ethernet_tcp_stack"
        ],
        "error_handling": [
            "ethernet_error_detector",
            "ethernet_error_corrector"
        ]
    },

    # 14) DSPs
    "dsps": {
        "basic": [
            "dsp_block",
            "dsp_top"
        ],
        "mac_unit": [
            "mac_unit",
            "mac_unit_pipelined",
            "mac_unit_floating_point"
        ],
        "iir_filter": [
            "iir_filter",
            "iir_filter_direct_form",
            "iir_filter_canonical_form"
        ],
        "fft_block": [
            "fft_block",
            "fft_block_radix2",
            "fft_block_radix4"
        ],
        "cordic_block": [
            "cordic_block",
            "cordic_sine_cosine",
            "cordic_arctan"
        ],
        "fixed_point": [
            "dsp_fixed_point",
            "dsp_fixed_point_mac"
        ],
        "floating_point": [
            "dsp_floating_point",
            "dsp_floating_point_mac"
        ]
    },

    # 15) Caches
    "l1_cache": {
        "basic": [
            "l1_cache_direct_mapped",
            "l1_cache_set_associative",
            "l1_cache_fully_associative"
        ],
        "advanced": [
            "l1_cache_write_through",
            "l1_cache_write_back",
            "l1_cache_prefetcher"
        ],
        "error_correcting": [
            "l1_cache_ecc",
            "l1_cache_parity"
        ]
    },
    "l2_cache": {
        "basic": [
            "l2_cache_direct_mapped",
            "l2_cache_set_associative",
            "l2_cache_fully_associative"
        ],
        "advanced": [
            "l2_cache_write_through",
            "l2_cache_write_back",
            "l2_cache_prefetcher"
        ],
        "error_correcting": [
            "l2_cache_ecc",
            "l2_cache_parity"
        ]
    },
    "l3_cache": {
        "basic": [
            "l3_cache_direct_mapped",
            "l3_cache_set_associative",
            "l3_cache_fully_associative"
        ],
        "advanced": [
            "l3_cache_write_through",
            "l3_cache_write_back",
            "l3_cache_prefetcher"
        ],
        "error_correcting": [
            "l3_cache_ecc",
            "l3_cache_parity"
        ],
        "cache_controller": [
            "l3_cache_controller",
            "l3_cache_replacement_policy",
            "l3_cache_prefetcher"
        ]
    },

    # 16) Interrupt Controller
    "interrupt_controller": {
        "basic": [
            "interrupt_controller"
        ],
        "vectored": [
            "vectored_interrupt_controller",
            "vectored_interrupt_handler"
        ],
        "nested": [
            "nested_interrupt_controller",
            "nested_interrupt_handler"
        ],
        "priority_based": [
            "priority_based_interrupt_controller",
            "priority_encoder"
        ],
        "maskable": [
            "maskable_interrupt_controller",
            "non_maskable_interrupt_controller"
        ],
        "synchronous": [
            "synchronous_interrupt_controller",
            "asynchronous_interrupt_controller"
        ],
        "advanced_features": [
            "interrupt_vectoring",
            "interrupt_delegation",
            "interrupt_logging"
        ]
    },

    # 17) CPUs and Related Units
    "pipelined_cpu": {
        "basic": [
            "pipelined_cpu",
            "pipelined_cpu_simple",
            "pipelined_cpu_complex"
        ],
        "advanced": [
            "pipelined_cpu_with_forwarding",
            "pipelined_cpu_with_branch_prediction",
            "pipelined_cpu_with_out_of_order_execution"
        ]
    },
    "hazard_detection_unit": {
        "basic": [
            "hazard_detection_unit"
        ],
        "advanced": [
            "advanced_hazard_detection_unit",
            "dynamic_hazard_detection"
        ]
    },
    "multi_core_processor_with_cache_coherence": {
        "basic": [
            "multi_core_processor_cache_coherence"
        ],
        "advanced": [
            "multi_core_processor_cache_coherence_mesic",
            "multi_core_processor_cache_coherence_moesic"
        ],
        "synchronization": [
            "multi_core_synchronization_unit",
            "multi_core_coherence_protocol"
        ]
    },
    "cpu_extensions": {
        "branch_prediction": [
            "branch_predictor",
            "dynamic_branch_predictor",
            "static_branch_predictor"
        ],
        "out_of_order_execution": [
            "out_of_order_execution_unit",
            "reorder_buffer",
            "reservation_station"
        ],
        "speculative_execution": [
            "speculative_execution_unit",
            "speculative_load_store"
        ],
        "prefetchers": [
            "cpu_prefetcher",
            "instruction_prefetcher",
            "data_prefetcher"
        ],
        "cache_management": [
            "cpu_cache_manager",
            "cache_replacement_policy",
            "cache_prefetcher"
        ]
    },

    # 18) GPU
    "gpu_components": {
        "basic": [
            "shader_core",
            "texture_unit",
            "rasterizer",
            "gpu_memory_controller",
            "gpu_scheduler"
        ],
        "advanced": [
            "geometry_processor",
            "tessellation_unit",
            "ray_tracing_accelerator",
            "compute_shader_unit",
            "pixel_shader_unit"
        ],
        "memory_management": [
            "gpu_memory_manager",
            "gpu_virtual_memory_unit"
        ],
        "multi_shader": [
            "multi_shader_core",
            "multi_shader_scheduler"
        ],
        "parallel_processing": [
            "gpu_parallel_processor",
            "gpu_parallel_scheduler"
        ]
    },
    "gpu": {
        "basic": [
            "gpu_top",
            "gpu_core_top",
            "gpu_memory_top"
        ],
        "advanced": [
            "gpu_top_with_ray_tracing",
            "gpu_top_with_tensor_cores"
        ],
        "integrated": [
            "integrated_gpu",
            "discrete_gpu_interface"
        ],
        "multi_gpu": [
            "multi_gpu_top",
            "gpu_crossbar"
        ],
        "gpu_control": [
            "gpu_control_unit",
            "gpu_command_processor"
        ]
    }
}

# Base directory for all modules
BASE_DIR = Path("modules")

def create_module_structure(module_path: Path, module_name: str):
    """Create the standard directory structure for a module."""
    # Create main module directories
    rtl_dir = module_path / "rtl"
    tb_dir = module_path / "tb"
    rules_dir = module_path / "rules"
    
    for dir in [rtl_dir, tb_dir, rules_dir]:
        dir.mkdir(parents=True, exist_ok=True)
    
    # Create template files if they don't exist
    verilog_file = rtl_dir / f"{module_name}.v"
    if not verilog_file.exists():
        verilog_file.write_text(f"""// {module_name}.v
// Template for {module_name}
// Status: Not Implemented
""")
    
    # Create config file
    config = {
        "name": module_name,
        "status": "not_implemented",
        "implementation_date": None,
        "verification_status": "not_started",
        "last_verified": None,
        "complexity_score": None
    }
    
    config_file = module_path / "config.json"
    if not config_file.exists():
        with open(config_file, 'w') as f:
            json.dump(config, f, indent=2)

def main():
    """Create the full module directory structure."""
    BASE_DIR.mkdir(exist_ok=True)
    
    # Create directories for each category and module
    for category, subcategories in MODULES.items():
        for subcategory, modules in subcategories.items():
            for module in modules:
                module_path = BASE_DIR / category / subcategory / module
                create_module_structure(module_path, module)
                print(f"Set up structure for {category}/{subcategory}/{module}")

if __name__ == "__main__":
    main()