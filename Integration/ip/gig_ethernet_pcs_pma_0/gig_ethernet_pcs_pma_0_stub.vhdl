-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Thu Apr 27 23:20:17 2023
-- Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/harshad/Project/git/new_eth/verilog-ethernet/example/VCU128/fpga_1g/fpga/fpga_top_vcu128.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_stub.vhdl
-- Design      : gig_ethernet_pcs_pma_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu37p-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gig_ethernet_pcs_pma_0 is
  Port ( 
    dummy_port_in : in STD_LOGIC;
    txp_0 : out STD_LOGIC;
    txn_0 : out STD_LOGIC;
    rxp_0 : in STD_LOGIC;
    rxn_0 : in STD_LOGIC;
    signal_detect_0 : in STD_LOGIC;
    gmii_txd_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en_0 : in STD_LOGIC;
    gmii_tx_er_0 : in STD_LOGIC;
    gmii_rxd_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv_0 : out STD_LOGIC;
    gmii_rx_er_0 : out STD_LOGIC;
    gmii_isolate_0 : out STD_LOGIC;
    sgmii_clk_r_0 : out STD_LOGIC;
    sgmii_clk_f_0 : out STD_LOGIC;
    sgmii_clk_en_0 : out STD_LOGIC;
    speed_is_10_100_0 : in STD_LOGIC;
    speed_is_100_0 : in STD_LOGIC;
    an_interrupt_0 : out STD_LOGIC;
    an_adv_config_vector_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    an_restart_config_0 : in STD_LOGIC;
    status_vector_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    configuration_vector_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    refclk625_p : in STD_LOGIC;
    refclk625_n : in STD_LOGIC;
    clk125_out : out STD_LOGIC;
    clk312_out : out STD_LOGIC;
    rst_125_out : out STD_LOGIC;
    tx_logic_reset : out STD_LOGIC;
    rx_logic_reset : out STD_LOGIC;
    rx_locked : out STD_LOGIC;
    tx_locked : out STD_LOGIC;
    tx_bsc_rst_out : out STD_LOGIC;
    rx_bsc_rst_out : out STD_LOGIC;
    tx_bs_rst_out : out STD_LOGIC;
    rx_bs_rst_out : out STD_LOGIC;
    tx_rst_dly_out : out STD_LOGIC;
    rx_rst_dly_out : out STD_LOGIC;
    tx_bsc_en_vtc_out : out STD_LOGIC;
    rx_bsc_en_vtc_out : out STD_LOGIC;
    tx_bs_en_vtc_out : out STD_LOGIC;
    rx_bs_en_vtc_out : out STD_LOGIC;
    riu_clk_out : out STD_LOGIC;
    riu_addr_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    riu_wr_data_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_wr_en_out : out STD_LOGIC;
    riu_nibble_sel_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    riu_rddata_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_3 : in STD_LOGIC;
    riu_prsnt_3 : in STD_LOGIC;
    riu_rddata_2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_2 : in STD_LOGIC;
    riu_prsnt_2 : in STD_LOGIC;
    riu_rddata_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_1 : in STD_LOGIC;
    riu_prsnt_1 : in STD_LOGIC;
    rx_btval_3 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_2 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    tx_dly_rdy_1 : in STD_LOGIC;
    rx_dly_rdy_1 : in STD_LOGIC;
    rx_vtc_rdy_1 : in STD_LOGIC;
    tx_vtc_rdy_1 : in STD_LOGIC;
    tx_dly_rdy_2 : in STD_LOGIC;
    rx_dly_rdy_2 : in STD_LOGIC;
    rx_vtc_rdy_2 : in STD_LOGIC;
    tx_vtc_rdy_2 : in STD_LOGIC;
    tx_dly_rdy_3 : in STD_LOGIC;
    rx_dly_rdy_3 : in STD_LOGIC;
    rx_vtc_rdy_3 : in STD_LOGIC;
    tx_vtc_rdy_3 : in STD_LOGIC;
    tx_pll_clk_out : out STD_LOGIC;
    rx_pll_clk_out : out STD_LOGIC;
    tx_rdclk_out : out STD_LOGIC;
    reset : in STD_LOGIC
  );

end gig_ethernet_pcs_pma_0;

architecture stub of gig_ethernet_pcs_pma_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "dummy_port_in,txp_0,txn_0,rxp_0,rxn_0,signal_detect_0,gmii_txd_0[7:0],gmii_tx_en_0,gmii_tx_er_0,gmii_rxd_0[7:0],gmii_rx_dv_0,gmii_rx_er_0,gmii_isolate_0,sgmii_clk_r_0,sgmii_clk_f_0,sgmii_clk_en_0,speed_is_10_100_0,speed_is_100_0,an_interrupt_0,an_adv_config_vector_0[15:0],an_restart_config_0,status_vector_0[15:0],configuration_vector_0[4:0],refclk625_p,refclk625_n,clk125_out,clk312_out,rst_125_out,tx_logic_reset,rx_logic_reset,rx_locked,tx_locked,tx_bsc_rst_out,rx_bsc_rst_out,tx_bs_rst_out,rx_bs_rst_out,tx_rst_dly_out,rx_rst_dly_out,tx_bsc_en_vtc_out,rx_bsc_en_vtc_out,tx_bs_en_vtc_out,rx_bs_en_vtc_out,riu_clk_out,riu_addr_out[5:0],riu_wr_data_out[15:0],riu_wr_en_out,riu_nibble_sel_out[1:0],riu_rddata_3[15:0],riu_valid_3,riu_prsnt_3,riu_rddata_2[15:0],riu_valid_2,riu_prsnt_2,riu_rddata_1[15:0],riu_valid_1,riu_prsnt_1,rx_btval_3[8:0],rx_btval_2[8:0],rx_btval_1[8:0],tx_dly_rdy_1,rx_dly_rdy_1,rx_vtc_rdy_1,tx_vtc_rdy_1,tx_dly_rdy_2,rx_dly_rdy_2,rx_vtc_rdy_2,tx_vtc_rdy_2,tx_dly_rdy_3,rx_dly_rdy_3,rx_vtc_rdy_3,tx_vtc_rdy_3,tx_pll_clk_out,rx_pll_clk_out,tx_rdclk_out,reset";
begin
end;
