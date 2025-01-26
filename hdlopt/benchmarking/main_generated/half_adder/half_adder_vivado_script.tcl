
create_project half_adder_project -part xc7a35tcsg324-1
add_files generated\half_adder/half_adder.v

set_property top half_adder [current_fileset]
synth_design -top half_adder
launch_runs synth_1
wait_on_run synth_1
open_run synth_1

write_schematic -format pdf -file half_adder_schematic.pdf
report_timing_summary -file half_adder_timing_summary.rpt
report_power -file half_adder_power_summary.rpt
close_project
