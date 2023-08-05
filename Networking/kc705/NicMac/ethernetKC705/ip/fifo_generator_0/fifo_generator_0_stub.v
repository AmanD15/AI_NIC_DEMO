// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Fri Feb 17 22:49:39 2023
// Host        : ajit-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/harshad/Project/Eth_on_KC705/hw/MAC/Project/TEMAC_IP_with_Bridge/TEMAC_IP_with_Bridge.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_stub.v
// Design      : fifo_generator_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_4,Vivado 2017.1" *)
module fifo_generator_0(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  wr_ack, empty, valid)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[9:0],wr_en,rd_en,dout[9:0],full,wr_ack,empty,valid" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [9:0]din;
  input wr_en;
  input rd_en;
  output [9:0]dout;
  output full;
  output wr_ack;
  output empty;
  output valid;
endmodule
