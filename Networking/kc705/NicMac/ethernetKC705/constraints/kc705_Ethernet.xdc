## xdc.

## clock signal
set_property PACKAGE_PIN AD12 [get_ports clk_in_p]
set_property PACKAGE_PIN AD11 [get_ports clk_in_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_in_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_in_p]

##create_clock -period 5.000 -name clk_p [get_ports clk_p]
## set false paths
#set_false_path -from [get_clocks -include_generated_clocks clk_out1*] -to [get_clocks -include_generated_clocks clk_out2*]
#set_false_path -from [get_clocks -include_generated_clocks clk_out2*] -to [get_clocks -include_generated_clocks clk_out1*]

## set false paths
set_false_path -from [get_clocks -include_generated_clocks clock] -to [get_clocks -include_generated_clocks clock_mac]
set_false_path -from [get_clocks -include_generated_clocks clock_mac] -to [get_clocks -include_generated_clocks clock]

## set false paths
#set_false_path -from [get_clocks -include_generated_clocks clk_out1*] -to [get_clocks -include_generated_clocks clk_out4*]
#set_false_path -from [get_clocks -include_generated_clocks clk_out4*] -to [get_clocks -include_generated_clocks clk_out1*]


## set false paths
#set_false_path -from [get_clocks -include_generated_clocks clk_out2*] -to [get_clocks -include_generated_clocks clk_out3*]
#set_false_path -from [get_clocks -include_generated_clocks clk_out3*] -to [get_clocks -include_generated_clocks clk_out2*]

## set false paths
#set_false_path -from [get_clocks -include_generated_clocks clk_out2*] -to [get_clocks -include_generated_clocks clk_out4*]
#set_false_path -from [get_clocks -include_generated_clocks clk_out4*] -to [get_clocks -include_generated_clocks clk_out2*]

## set false paths
#set_false_path -from [get_clocks -include_generated_clocks clk_out3*] -to [get_clocks -include_generated_clocks clk_out4*]
#set_false_path -from [get_clocks -include_generated_clocks clk_out4*] -to [get_clocks -include_generated_clocks clk_out3*]




## uart0
set_property PACKAGE_PIN M19     [get_ports "DEBUG_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property IOSTANDARD  LVCMOS25 [get_ports "DEBUG_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property PACKAGE_PIN K24     [get_ports "DEBUG_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67
set_property IOSTANDARD  LVCMOS25 [get_ports "DEBUG_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67

## uart1
set_property PACKAGE_PIN AA25     [get_ports "SERIAL_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9N_T1L_N5_AD12N_67
set_property IOSTANDARD  LVCMOS25 [get_ports "SERIAL_UART_RX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9N_T1L_N5_AD12N_67
set_property PACKAGE_PIN AB25     [get_ports "SERIAL_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9P_T1L_N4_AD12P_67
set_property IOSTANDARD  LVCMOS25 [get_ports "SERIAL_UART_TX"] ;# Bank  67 VCCO - VCC1V8   - IO_L9P_T1L_N4_AD12P_67


# Rev B board
#set_property PACKAGE_PIN AK4      [get_ports glbl_rst]
# Rev C or later
set_property PACKAGE_PIN AB7 [get_ports glbl_rst]
set_property IOSTANDARD LVCMOS15 [get_ports glbl_rst]
set_false_path -from [get_ports glbl_rst]

#### Module LEDs_8Bit constraints
set_property PACKAGE_PIN AB8 [get_ports frame_error]
set_property PACKAGE_PIN AA8 [get_ports frame_errorn]
set_property IOSTANDARD LVCMOS15 [get_ports frame_error]
set_property IOSTANDARD LVCMOS15 [get_ports frame_errorn]
set_property PACKAGE_PIN AC9 [get_ports activity_flash]
set_property PACKAGE_PIN AB9 [get_ports activity_flashn]
set_property IOSTANDARD LVCMOS15 [get_ports activity_flash]
set_property IOSTANDARD LVCMOS15 [get_ports activity_flashn]

#### Module Push_Buttons_4Bit constraints
set_property PACKAGE_PIN G12 [get_ports update_speed]
# Rev B board
#set_property PACKAGE_PIN AD7      [get_ports config_board]
# Rev C or later
set_property PACKAGE_PIN AC6 [get_ports config_board]
set_property PACKAGE_PIN AB12 [get_ports pause_req_s]
set_property PACKAGE_PIN AA12 [get_ports reset_error]
set_property IOSTANDARD LVCMOS15 [get_ports update_speed]
set_property IOSTANDARD LVCMOS15 [get_ports config_board]
set_property IOSTANDARD LVCMOS15 [get_ports pause_req_s]
set_property IOSTANDARD LVCMOS15 [get_ports reset_error]

#### Module DIP_Switches_4Bit constraints
set_property PACKAGE_PIN Y28 [get_ports {mac_speed[0]}]
set_property PACKAGE_PIN AA28 [get_ports {mac_speed[1]}]
set_property PACKAGE_PIN W29 [get_ports gen_tx_data]
set_property PACKAGE_PIN Y29 [get_ports chk_tx_data]
set_property IOSTANDARD LVCMOS25 [get_ports {mac_speed[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {mac_speed[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports gen_tx_data]
set_property IOSTANDARD LVCMOS25 [get_ports chk_tx_data]

set_property PACKAGE_PIN L20 [get_ports phy_resetn]
set_property IOSTANDARD LVCMOS25 [get_ports phy_resetn]

# lock to unused header - ensure this is unused
set_property PACKAGE_PIN AJ24 [get_ports serial_response]
set_property PACKAGE_PIN AK25 [get_ports tx_statistics_s]
set_property PACKAGE_PIN AE25 [get_ports rx_statistics_s]
set_property IOSTANDARD LVCMOS25 [get_ports serial_response]
set_property IOSTANDARD LVCMOS25 [get_ports tx_statistics_s]
set_property IOSTANDARD LVCMOS25 [get_ports rx_statistics_s]

set_property PACKAGE_PIN R23 [get_ports mdc]
set_property PACKAGE_PIN J21 [get_ports mdio]
set_property IOSTANDARD LVCMOS25 [get_ports mdc]
set_property IOSTANDARD LVCMOS25 [get_ports mdio]

########## RGMII SPECIFIC IO CONSTRAINTS FOR the KC705 BOARD ##########
### These PIN constraints use the on-board PHY which requires 2.5V ###
### the Clock duty cycle is out of spec at this voltage ###

set_property PACKAGE_PIN U28 [get_ports {rgmii_rxd[3]}]
set_property PACKAGE_PIN T25 [get_ports {rgmii_rxd[2]}]
set_property PACKAGE_PIN U25 [get_ports {rgmii_rxd[1]}]
set_property PACKAGE_PIN U30 [get_ports {rgmii_rxd[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {rgmii_rxd[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {rgmii_rxd[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {rgmii_rxd[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {rgmii_rxd[0]}]

set_property PACKAGE_PIN L28 [get_ports {rgmii_txd[3]}]
set_property PACKAGE_PIN M29 [get_ports {rgmii_txd[2]}]
set_property PACKAGE_PIN N25 [get_ports {rgmii_txd[1]}]
set_property PACKAGE_PIN N27 [get_ports {rgmii_txd[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {rgmii_txd[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {rgmii_txd[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {rgmii_txd[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {rgmii_txd[0]}]

set_property PACKAGE_PIN M27 [get_ports rgmii_tx_ctl]
set_property PACKAGE_PIN K30 [get_ports rgmii_txc]
set_property IOSTANDARD LVCMOS25 [get_ports rgmii_tx_ctl]
set_property IOSTANDARD LVCMOS25 [get_ports rgmii_txc]

set_property PACKAGE_PIN R28 [get_ports rgmii_rx_ctl]
set_property IOSTANDARD LVCMOS25 [get_ports rgmii_rx_ctl]

set_property PACKAGE_PIN U27 [get_ports rgmii_rxc]
set_property IOSTANDARD LVCMOS25 [get_ports rgmii_rxc]


# Map the TB clock pin gtx_clk_bufg_out to and un-used pin so that its not trimmed off
set_property PACKAGE_PIN AC17 [get_ports gtx_clk_bufg_out]
set_property IOSTANDARD SSTL15 [get_ports gtx_clk_bufg_out]



#
####
#######
##########
#############
#################
#EXAMPLE DESIGN CONSTRAINTS


############################################################
# Clock Period Constraints                                 #
############################################################

############################################################
# TX Clock period Constraints                              #
############################################################
# Transmitter clock period constraints: please do not relax
create_clock -period 5.000 -name clk_in_p [get_ports clk_in_p]
set_input_jitter clk_in_p 0.050

#set to use clock backbone - this uses a long route to allow the MMCM to be placed in the other half of the device
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets -of [get_pins example_clocks/clkin1_buf/O]]



############################################################
# Get auto-generated clock names                           #
############################################################

############################################################
# Input Delay constraints
############################################################
# these inputs are alll from either dip switchs or push buttons
# and therefore have no timing associated with them
set_false_path -from [get_ports config_board]
set_false_path -from [get_ports pause_req_s]
set_false_path -from [get_ports reset_error]
set_false_path -from [get_ports {mac_speed[0]}]
set_false_path -from [get_ports {mac_speed[1]}]
set_false_path -from [get_ports gen_tx_data]
set_false_path -from [get_ports chk_tx_data]

# no timing requirements but want the capture flops close to the IO
set_max_delay -datapath_only -from [get_ports update_speed] 4.000


# Ignore pause deserialiser as only present to prevent logic stripping
set_false_path -from [get_ports pause_req*]
set_false_path -from [get_cells ETH_KC_inst/pause_req* -filter IS_SEQUENTIAL]
set_false_path -from [get_cells ETH_KC_inst/pause_val* -filter IS_SEQUENTIAL]


############################################################
# Output Delay constraints
############################################################

set_false_path -to [get_ports frame_error]
set_false_path -to [get_ports frame_errorn]
set_false_path -to [get_ports serial_response]
set_false_path -to [get_ports tx_statistics_s]
set_false_path -to [get_ports rx_statistics_s]
#set_output_delay -clock [get_clocks -of [get_pins example_clocks/clock_generator/mmcm_adv_inst/CLKOUT1]] 1.000 [get_ports mdc]

# no timing associated with output
set_false_path -from [get_cells -hier -filter {name =~ *phy_resetn_int_reg}] -to [get_ports phy_resetn]

############################################################
# Example design Clock Crossing Constraints                          #
############################################################
set_false_path -from [get_cells -hier -filter {name =~ *phy_resetn_int_reg}] -to [get_cells -hier -filter {name =~ *axi_lite_reset_gen/reset_sync*}]


# control signal is synched over clock boundary separately
set_false_path -from [get_cells -hier -filter {name =~ ETH_KC_inst/tx_stats_reg[*]}] -to [get_cells -hier -filter {name =~ ETH_KC_inst/tx_stats_shift_reg[*]}]
set_false_path -from [get_cells -hier -filter {name =~ ETH_KC_inst/rx_stats_reg[*]}] -to [get_cells -hier -filter {name =~ ETH_KC_inst/rx_stats_shift_reg[*]}]



############################################################
# Ignore paths to resync flops
############################################################
set_false_path -to [get_pins -hier -filter {NAME =~ */reset_sync*/PRE}]
set_false_path -to [get_pins -hier -filter {NAME =~ */*_sync*/D}]
set_max_delay -datapath_only -from [get_cells ETH_KC_inst/tx_stats_toggle_reg] -to [get_cells ETH_KC_inst/tx_stats_sync/data_sync_reg0] 6.000
set_max_delay -datapath_only -from [get_cells ETH_KC_inst/rx_stats_toggle_reg] -to [get_cells ETH_KC_inst/rx_stats_sync/data_sync_reg0] 6.000



#
####
#######
##########
#############
#################
#FIFO BLOCK CONSTRAINTS

############################################################
# FIFO Clock Crossing Constraints                          #
############################################################

# control signal is synched separately so this is a false path
#set_max_delay -from [get_cells -hier -filter {name =~ *rx_fifo_i/rd_addr_reg[*]}] -to [get_cells -hier -filter {name =~ *fifo*wr_rd_addr_reg[*]}] 3.2 -datapath_only
#set_max_delay -from [get_cells -hier -filter {name =~ *rx_fifo_i/wr_store_frame_tog_reg}] -to [get_cells -hier -filter {name =~ *fifo_i/resync_wr_store_frame_tog/data_sync_reg0}] 3.2 -datapath_only
#set_max_delay -from [get_cells -hier -filter {name =~ *rx_fifo_i/update_addr_tog_reg}] -to [get_cells -hier -filter {name =~ *rx_fifo_i/sync_rd_addr_tog/data_sync_reg0}] 3.2 -datapath_only
#set_max_delay -from [get_cells -hier -filter {name =~ *tx_fifo_i/rd_addr_txfer_reg[*]}] -to [get_cells -hier -filter {name =~ *fifo*wr_rd_addr_reg[*]}] 3.2 -datapath_only
#set_max_delay -from [get_cells -hier -filter {name =~ *tx_fifo_i/wr_frame_in_fifo_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_wr_frame_in_fifo/data_sync_reg0}] 3.2 -datapath_only
#set_max_delay -from [get_cells -hier -filter {name =~ *tx_fifo_i/wr_frames_in_fifo_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_wr_frames_in_fifo/data_sync_reg0}] 3.2 -datapath_only
#set_max_delay -from [get_cells -hier -filter {name =~ *tx_fifo_i/frame_in_fifo_valid_tog_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_fif_valid_tog/data_sync_reg0}] 3.2 -datapath_only
#set_max_delay -from [get_cells -hier -filter {name =~ *tx_fifo_i/rd_txfer_tog_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_rd_txfer_tog/data_sync_reg0}] 3.2 -datapath_only
#set_max_delay -from [get_cells -hier -filter {name =~ *tx_fifo_i/rd_tran_frame_tog_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_rd_tran_frame_tog/data_sync_reg0}] 3.2 -datapath_only







#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[4]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[8]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[7]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[2]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[6]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[5]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[1]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[3]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[9]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_rx_loopback/read_data_out[0]}]
#set_property MARK_DEBUG true [get_nets DualClockedQueue_rx_loopback/read_req_in]
#set_property MARK_DEBUG true [get_nets DualClockedQueue_rx_loopback/read_ack_out]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[5]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[2]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[4]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[1]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[0]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[8]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[7]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[6]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[3]}]
#set_property MARK_DEBUG true [get_nets {DualClockedQueue_tx_loopback/write_data_in[9]}]
#set_property MARK_DEBUG true [get_nets DualClockedQueue_tx_loopback/write_ack_in]
#set_property MARK_DEBUG true [get_nets DualClockedQueue_tx_loopback/write_req_out]


