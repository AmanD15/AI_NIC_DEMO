// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Wed Apr 13 14:55:09 2022
// Host        : ajit7 running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/kamran/MTP_PRO/new_acb_to_ui_comp/ip/fifo_generator_2/fifo_generator_2_stub.v
// Design      : fifo_generator_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_4,Vivado 2017.1" *)
module fifo_generator_2(clk, srst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[74:0],wr_en,rd_en,dout[74:0],full,empty" */;
  input clk;
  input srst;
  input [74:0]din;
  input wr_en;
  input rd_en;
  output [74:0]dout;
  output full;
  output empty;
endmodule
