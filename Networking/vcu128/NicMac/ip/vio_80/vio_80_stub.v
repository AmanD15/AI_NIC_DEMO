// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Jan 11 11:56:22 2024
// Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/harshad/indrahas_work/project_1/project_1.srcs/sources_1/ip/vio_80/vio_80_stub.v
// Design      : vio_80
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2019.1" *)
module vio_80(clk, probe_in0, probe_out0, probe_out1, 
  probe_out2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[1:0],probe_out0[0:0],probe_out1[0:0],probe_out2[0:0]" */;
  input clk;
  input [1:0]probe_in0;
  output [0:0]probe_out0;
  output [0:0]probe_out1;
  output [0:0]probe_out2;
endmodule
