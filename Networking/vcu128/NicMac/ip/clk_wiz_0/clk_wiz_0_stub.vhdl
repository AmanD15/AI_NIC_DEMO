-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Thu Jan 11 11:50:53 2024
-- Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/harshad/indrahas_work/project_1/project_1.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu37p-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    clk_125 : out STD_LOGIC;
    clk_80 : out STD_LOGIC;
    clk_200 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_125,clk_80,clk_200,reset,locked,clk_in1_p,clk_in1_n";
begin
end;
