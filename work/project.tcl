set projDir "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/vivado"
set projName "Group 13 ALU Design"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/au_top_0.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/reset_conditioner_1.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/edge_detector_2.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/button_conditioner_3.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/alu_4.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/inputSM_5.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/counter_6.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/autoTester_7.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/pipeline_8.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/adder_9.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/shifter_10.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/boolean_11.v" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/verilog/compare_12.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/constraint/alchitry.xdc" "D:/Alchitry\ Projects/Group\ 13\ ALU\ Design/work/constraint/io.xdc" "D:/Alchitry/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
