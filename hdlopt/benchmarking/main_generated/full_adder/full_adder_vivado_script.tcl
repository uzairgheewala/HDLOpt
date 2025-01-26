
create_project full_adder_project -part xc7a35tcsg324-1
add_files generated\full_adder/full_adder.v
add_files generated\full_adder/half_adder.v

set_property top full_adder [current_fileset]
synth_design -top full_adder
launch_runs synth_1
wait_on_run synth_1
open_run synth_1

write_schematic -format pdf -file full_adder_schematic.pdf
report_timing_summary -file full_adder_timing_summary.rpt
report_power -file full_adder_power_summary.rpt
close_project
