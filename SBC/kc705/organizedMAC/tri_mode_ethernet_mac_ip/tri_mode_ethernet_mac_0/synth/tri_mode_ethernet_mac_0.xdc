
# PART is xc7k325tffg900-1

############################################################
# Clock Period Constraints                                 #
############################################################

############################################################
# RX Clock period Constraints (per instance)               #
############################################################
# Receiver clock period constraints: please do not relax
create_clock -period 8 [get_ports rgmii_rxc]

#
####
#######
##########
#############
#################
#BLOCK CONSTRAINTS

############################################################
# Physical Interface Constraints
############################################################

############################################################
# The following are required to maximise setup/hold        #
############################################################

set_property SLEW FAST [get_ports {rgmii_txd[3] rgmii_txd[2] rgmii_txd[1] rgmii_txd[0] rgmii_tx_ctl rgmii_txc}]


############################################################
# RGMII: IODELAY Constraints
############################################################
# Please modify the value of the IDELAY_VALUE/ODELAY_VALUE
# according to your design.
# For more information on IDELAYCTRL and IODELAY, please
# refer to the Series-7 User Guide.
#
# Apply the same IDELAY_VALUE to all RGMII RX inputs.
# This is to provide a similiar Clock Path and Data Path delay.
set_property IDELAY_VALUE 12 [get_cells {rgmii_interface/delay_rgmii_rx* rgmii_interface/rxdata_bus[*].delay_rgmii_rx*}]


# Group IODELAY components
set_property IODELAY_GROUP tri_mode_ethernet_mac_iodelay_grp [get_cells {rgmii_interface/delay_rgmii_rx* rgmii_interface/rxdata_bus[*].delay_rgmii_rx*}]


#
####
#######
##########
#############
#################
#CORE CONSTRAINTS



############################################################
# Crossing of Clock Domain Constraints: please do not edit #
############################################################

# control signal is synced separately so we want a max delay to ensure the signal has settled by the time the control signal has passed through the synch
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/flow/rx_pause/pause*to_tx_reg[*]}] -to [get_cells {tri_mode_ethernet_mac_0_core/flow/tx_pause/count_set*reg}] 32 -datapath_only
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/flow/rx_pause/pause*to_tx_reg[*]}] -to [get_cells {tri_mode_ethernet_mac_0_core/flow/tx_pause/pause_count*reg[*]}] 32 -datapath_only
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/flow/rx_pause/pause_req_to_tx_int_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/flow/tx_pause/sync_good_rx/data_sync_reg0}] 6 -datapath_only



# ignore paths from the speed control
set_false_path -from [get_cells {tri_mode_ethernet_mac_0_core/speed*speed_is*100_reg}] -to [get_cells {enable_gen/txspeedis*100gen/data_sync_reg0}]
set_false_path -from [get_cells {tri_mode_ethernet_mac_0_core/speed*speed_is*100_reg}] -to [get_cells {rxspeedis10100gen/data_sync_reg0}]
set_false_path -from [get_cells {tri_mode_ethernet_mac_0_core/speed*speed_is*100_reg}] -to [get_cells -filter {IS_SEQUENTIAL} {rgmii_interface/*}]
set_false_path -from [get_cells {tri_mode_ethernet_mac_0_core/speed*speed_is*100_reg}] -to [get_cells -filter {IS_SEQUENTIAL} {enable_gen/*}]




############################################################
# Ignore paths to resync flops
############################################################
set_false_path -to [get_pins -hier -filter {NAME =~ */async_rst*/PRE}]
set_false_path -to [get_pins -hier -filter {NAME =~ */async_rst*/CLR}]
set_false_path -from [get_cells {tri_mode_ethernet_mac_0_core/sync_*tx_clk/sync_rst1_reg}] -to [get_cells {*/data_sync_reg0}]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/addr_filter_top/addr_regs.promiscuous_mode_reg_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync_reg0}] 6 -datapath_only
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/*managen/conf/update_pause_ad_int_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/addr_filter_top/address_filter_inst/sync_update/data_sync_reg0}] 6 -datapath_only


# the mdio interface is clocked from the axi clock but the clock is so slow is can be considered to be data
# the data related outputs are output on the falling edge of the MDC output so both can simply be considered to be multicycle paths
set_multicycle_path 10 -setup -from [get_cells {tri_mode_ethernet_mac_0_core/*managen/mdio_enabled.miim_clk_int_reg}  ] -throu [get_ports mdc]
set_multicycle_path 9 -hold -from   [get_cells {tri_mode_ethernet_mac_0_core/*managen/mdio_enabled.miim_clk_int_reg}  ] -throu [get_ports mdc]
set_multicycle_path 10 -setup -from [get_cells {tri_mode_ethernet_mac_0_core/*managen/mdio_enabled.phy/enable_reg_reg}] -throu [get_ports mdc]
set_multicycle_path 9 -hold -from   [get_cells {tri_mode_ethernet_mac_0_core/*managen/mdio_enabled.phy/enable_reg_reg}] -throu [get_ports mdc]
set_multicycle_path 10 -setup -from [get_cells {tri_mode_ethernet_mac_0_core/*managen/mdio_enabled.phy/mdio*reg}      ] -throu [get_ports mdio]
set_multicycle_path 9 -hold -from   [get_cells {tri_mode_ethernet_mac_0_core/*managen/mdio_enabled.phy/mdio*reg}      ] -throu [get_ports mdio]
# mdio has timing implications but slow interface so relaxed
set_false_path  -to [get_cells -hier -filter {NAME =~ *managen/mdio_enabled.phy/mdio_in_reg1_reg}]

set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/sync_int_tx_rst_mgmt_tx_clk/sync_rst1_reg}] -to [get_cells {enable_gen/reset90gen/data_sync_reg0}] 6 -datapath_only


