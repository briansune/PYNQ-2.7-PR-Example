############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pynq_pr_ip
set_top pr_add
add_files pr_add.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z100ffg900-2}
create_clock -period 10 -name default
#source "./pynq_pr_ip/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl verilog -format ip_catalog
