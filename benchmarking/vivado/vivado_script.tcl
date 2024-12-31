
create_project full_adder_project -part xc7a35tcsg324-1
add_files src/half_adder.v
add_files src/full_adder.v
set_property top full_adder [current_fileset]
synth_design -top full_adder
launch_runs synth_1
wait_on_run synth_1
open_run synth_1
write_schematic -format pdf -file full_adder_schematic.pdf
report_timing_summary -file timing_summary.rpt
report_power -file power_summary.rpt
close_project
