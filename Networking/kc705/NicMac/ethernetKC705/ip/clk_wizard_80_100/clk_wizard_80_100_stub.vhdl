-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
-- Date        : Fri Jan 12 10:44:49 2024
-- Host        : ajit-System-Product-Name running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/harshad/IP_generate/IP_create/IP_create.srcs/sources_1/ip/clk_wizard_80_100/clk_wizard_80_100_stub.vhdl
-- Design      : clk_wizard_80_100
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wizard_80_100 is
  Port ( 
    clk_80 : out STD_LOGIC;
    clk_100 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end clk_wizard_80_100;

architecture stub of clk_wizard_80_100 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_80,clk_100,reset,locked,clk_in1_p,clk_in1_n";
begin
end;
