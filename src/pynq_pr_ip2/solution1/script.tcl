############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pynq_pr_ip2
set_top pr_sub
add_files pr_sub.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z100-ffg900-2}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./pynq_pr_ip2/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl verilog -format ip_catalog
