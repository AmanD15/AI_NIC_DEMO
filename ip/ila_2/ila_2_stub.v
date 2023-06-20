// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Mon May  1 16:47:25 2023
// Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/harshad/vivadoRunDir/project_12/project_12.srcs/sources_1/ip/ila_2/ila_2_stub.v
// Design      : ila_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2019.1" *)
module ila_2(clk, probe0, probe1, probe2, probe3, probe4, probe5)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[9:0],probe1[0:0],probe2[0:0],probe3[9:0],probe4[0:0],probe5[0:0]" */;
  input clk;
  input [9:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [9:0]probe3;
  input [0:0]probe4;
  input [0:0]probe5;
endmodule
