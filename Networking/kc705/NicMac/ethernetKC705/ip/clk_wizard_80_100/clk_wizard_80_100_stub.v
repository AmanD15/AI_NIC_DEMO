// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Fri Jan 12 10:44:49 2024
// Host        : ajit-System-Product-Name running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/harshad/IP_generate/IP_create/IP_create.srcs/sources_1/ip/clk_wizard_80_100/clk_wizard_80_100_stub.v
// Design      : clk_wizard_80_100
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wizard_80_100(clk_80, clk_100, reset, locked, clk_in1_p, 
  clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_80,clk_100,reset,locked,clk_in1_p,clk_in1_n" */;
  output clk_80;
  output clk_100;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
