// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Apr 27 23:20:17 2023
// Host        : ajit2-System-Product-Name running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/harshad/Project/git/new_eth/verilog-ethernet/example/VCU128/fpga_1g/fpga/fpga_top_vcu128.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_stub.v
// Design      : gig_ethernet_pcs_pma_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module gig_ethernet_pcs_pma_0(dummy_port_in, txp_0, txn_0, rxp_0, rxn_0, 
  signal_detect_0, gmii_txd_0, gmii_tx_en_0, gmii_tx_er_0, gmii_rxd_0, gmii_rx_dv_0, 
  gmii_rx_er_0, gmii_isolate_0, sgmii_clk_r_0, sgmii_clk_f_0, sgmii_clk_en_0, 
  speed_is_10_100_0, speed_is_100_0, an_interrupt_0, an_adv_config_vector_0, 
  an_restart_config_0, status_vector_0, configuration_vector_0, refclk625_p, refclk625_n, 
  clk125_out, clk312_out, rst_125_out, tx_logic_reset, rx_logic_reset, rx_locked, tx_locked, 
  tx_bsc_rst_out, rx_bsc_rst_out, tx_bs_rst_out, rx_bs_rst_out, tx_rst_dly_out, 
  rx_rst_dly_out, tx_bsc_en_vtc_out, rx_bsc_en_vtc_out, tx_bs_en_vtc_out, rx_bs_en_vtc_out, 
  riu_clk_out, riu_addr_out, riu_wr_data_out, riu_wr_en_out, riu_nibble_sel_out, 
  riu_rddata_3, riu_valid_3, riu_prsnt_3, riu_rddata_2, riu_valid_2, riu_prsnt_2, riu_rddata_1, 
  riu_valid_1, riu_prsnt_1, rx_btval_3, rx_btval_2, rx_btval_1, tx_dly_rdy_1, rx_dly_rdy_1, 
  rx_vtc_rdy_1, tx_vtc_rdy_1, tx_dly_rdy_2, rx_dly_rdy_2, rx_vtc_rdy_2, tx_vtc_rdy_2, 
  tx_dly_rdy_3, rx_dly_rdy_3, rx_vtc_rdy_3, tx_vtc_rdy_3, tx_pll_clk_out, rx_pll_clk_out, 
  tx_rdclk_out, reset)
/* synthesis syn_black_box black_box_pad_pin="dummy_port_in,txp_0,txn_0,rxp_0,rxn_0,signal_detect_0,gmii_txd_0[7:0],gmii_tx_en_0,gmii_tx_er_0,gmii_rxd_0[7:0],gmii_rx_dv_0,gmii_rx_er_0,gmii_isolate_0,sgmii_clk_r_0,sgmii_clk_f_0,sgmii_clk_en_0,speed_is_10_100_0,speed_is_100_0,an_interrupt_0,an_adv_config_vector_0[15:0],an_restart_config_0,status_vector_0[15:0],configuration_vector_0[4:0],refclk625_p,refclk625_n,clk125_out,clk312_out,rst_125_out,tx_logic_reset,rx_logic_reset,rx_locked,tx_locked,tx_bsc_rst_out,rx_bsc_rst_out,tx_bs_rst_out,rx_bs_rst_out,tx_rst_dly_out,rx_rst_dly_out,tx_bsc_en_vtc_out,rx_bsc_en_vtc_out,tx_bs_en_vtc_out,rx_bs_en_vtc_out,riu_clk_out,riu_addr_out[5:0],riu_wr_data_out[15:0],riu_wr_en_out,riu_nibble_sel_out[1:0],riu_rddata_3[15:0],riu_valid_3,riu_prsnt_3,riu_rddata_2[15:0],riu_valid_2,riu_prsnt_2,riu_rddata_1[15:0],riu_valid_1,riu_prsnt_1,rx_btval_3[8:0],rx_btval_2[8:0],rx_btval_1[8:0],tx_dly_rdy_1,rx_dly_rdy_1,rx_vtc_rdy_1,tx_vtc_rdy_1,tx_dly_rdy_2,rx_dly_rdy_2,rx_vtc_rdy_2,tx_vtc_rdy_2,tx_dly_rdy_3,rx_dly_rdy_3,rx_vtc_rdy_3,tx_vtc_rdy_3,tx_pll_clk_out,rx_pll_clk_out,tx_rdclk_out,reset" */;
  input dummy_port_in;
  output txp_0;
  output txn_0;
  input rxp_0;
  input rxn_0;
  input signal_detect_0;
  input [7:0]gmii_txd_0;
  input gmii_tx_en_0;
  input gmii_tx_er_0;
  output [7:0]gmii_rxd_0;
  output gmii_rx_dv_0;
  output gmii_rx_er_0;
  output gmii_isolate_0;
  output sgmii_clk_r_0;
  output sgmii_clk_f_0;
  output sgmii_clk_en_0;
  input speed_is_10_100_0;
  input speed_is_100_0;
  output an_interrupt_0;
  input [15:0]an_adv_config_vector_0;
  input an_restart_config_0;
  output [15:0]status_vector_0;
  input [4:0]configuration_vector_0;
  input refclk625_p;
  input refclk625_n;
  output clk125_out;
  output clk312_out;
  output rst_125_out;
  output tx_logic_reset;
  output rx_logic_reset;
  output rx_locked;
  output tx_locked;
  output tx_bsc_rst_out;
  output rx_bsc_rst_out;
  output tx_bs_rst_out;
  output rx_bs_rst_out;
  output tx_rst_dly_out;
  output rx_rst_dly_out;
  output tx_bsc_en_vtc_out;
  output rx_bsc_en_vtc_out;
  output tx_bs_en_vtc_out;
  output rx_bs_en_vtc_out;
  output riu_clk_out;
  output [5:0]riu_addr_out;
  output [15:0]riu_wr_data_out;
  output riu_wr_en_out;
  output [1:0]riu_nibble_sel_out;
  input [15:0]riu_rddata_3;
  input riu_valid_3;
  input riu_prsnt_3;
  input [15:0]riu_rddata_2;
  input riu_valid_2;
  input riu_prsnt_2;
  input [15:0]riu_rddata_1;
  input riu_valid_1;
  input riu_prsnt_1;
  output [8:0]rx_btval_3;
  output [8:0]rx_btval_2;
  output [8:0]rx_btval_1;
  input tx_dly_rdy_1;
  input rx_dly_rdy_1;
  input rx_vtc_rdy_1;
  input tx_vtc_rdy_1;
  input tx_dly_rdy_2;
  input rx_dly_rdy_2;
  input rx_vtc_rdy_2;
  input tx_vtc_rdy_2;
  input tx_dly_rdy_3;
  input rx_dly_rdy_3;
  input rx_vtc_rdy_3;
  input tx_vtc_rdy_3;
  output tx_pll_clk_out;
  output rx_pll_clk_out;
  output tx_rdclk_out;
  input reset;
endmodule
