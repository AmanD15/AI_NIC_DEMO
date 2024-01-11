# VHDL libs.
read_vhdl -library AhbApbLib ../vhdl_libs/AhbApbLib.vhdl
read_vhdl -library ahir_ieee_proposed ../vhdl_libs/aHiR_ieee_proposed.vhdl
read_vhdl -library ahir ../vhdl_libs/ahir.vhdl
read_vhdl -library AxiBridgeLib ../vhdl_libs/AxiBridgeLib.vhdl
read_vhdl -library DualClockedQueuelib ../vhdl_libs/DualClockedQueuelib.vhdl
read_vhdl -library GenericCoreAddOnLib ../vhdl_libs/GenericCoreAddOnLib.vhdl
read_vhdl -library GenericGlueStuff ../vhdl_libs/GenericGlueStuff.vhdl
read_vhdl -library GlueModules ../vhdl_libs/GlueModules.vhdl
read_vhdl -library simpleI2CLib  ../vhdl_libs/simpleI2CLib.vhdl
read_vhdl -library simpleUartLib ../vhdl_libs/simpleUartLib.vhdl
read_vhdl -library SpiMasterLib  ../vhdl_libs/SpiMasterLib.vhdl
read_vhdl -library AjitCustom  ../vhdl_libs/AjitCustom.vhdl
# the SBC core vhdl files.
read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system_global_package.vhdl
read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system.vhdl
read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system.vhdl
read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system_global_package.vhdl

#read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/vhdl/nic_mac_bridge_lib/nic_mac_bridge.vhdl
read_vhdl -library nic_mac_bridge_lib ../toplevel/nic_mac_bridge_edited.vhdl

read_vhdl -library nic_lib ../hsys/nic_subsystem/nic/vhdl/nic_lib/nic.vhdl
read_vhdl -library nic_lib ../hsys/nic_subsystem/nic/vhdl/nic_lib/nic_global_package.vhdl
read_vhdl -library nic_subsystem_lib ../hsys/nic_subsystem/vhdl/nic_subsystem_lib/nic_subsystem.vhdl
read_vhdl -library acb_afb_complex_lib ../hsys/acb_afb_complex/vhdl/acb_afb_complex_lib/acb_afb_complex.vhdl
read_vhdl -library ajit_processor_lib ../hsys/processor_subsystem/vhdl/ajit_processor_lib/processor_1x1x32.vhdl
read_vhdl -library acb_dram_controller_bridge_lib ../hsys/acb_dram_controller_bridge/vhdl/acb_dram_controller_bridge_lib/acb_dram_controller_bridge.vhdl
read_vhdl -library spi_flash_controller_lib ../hsys/spi_flash_controller/vhdl/spi_flash_controller_lib/spi_flash_controller.vhdl

#read_vhdl -library sbc_kc705_core_lib ../hsys/vhdl/sbc_kc705_core_lib/sbc_kc705_core.vhdl
read_vhdl -library sbc_kc705_core_lib ../toplevel/sbc_kc705_core_new.vhdl
read_vhdl ../vhdl/DualClockedQueue.vhd
read_vhdl ../../../Networking/vcu128/NicMac/vhdl/ai_ml_engine_global_package.vhdl
read_vhdl ../../../Networking/vcu128/NicMac/vhdl/ai_ml_engine.vhdl
############ ADDING TOP LEVEL VHDL #########################
read_vhdl ../toplevel/sbc_kc705.vhdl

###########################################################
# verilog files..
#read_verilog ../verilog/axi_lite_controller.v
#read_verilog ../verilog/nic_mac_pipe_reset.v
#read_verilog ../verilog/ETH_KC.v
#read_verilog ../verilog/queueMac.v
#read_verilog ../verilog/reset_gen.v
#read_verilog ../verilog/tri_mode_ethernet_mac_0_clk_wiz.v
#read_verilog ../verilog/tri_mode_ethernet_mac_0_reset_sync.v
#read_verilog ../verilog/tri_mode_ethernet_mac_0_sync_block.v
#read_verilog ../hsys/acb_dram_controller_bridge/verilog/ACB_to_UI_EA.v

read_verilog ../verilog/nic_mac_pipe_reset.v
#read_verilog ../verilog/clocks_and_reset_gen.v
#read_verilog ../verilog/reset_sync.v
read_verilog ../verilog/axis_gmii_rx.v
read_verilog ../verilog/axis_gmii_tx.v
read_verilog ../verilog/debounce_switch.v
read_verilog ../verilog/ethernet_axis_vcu.v
read_verilog ../verilog/eth_mac_1g_fifo.v
read_verilog ../verilog/eth_mac_1g.v
read_verilog ../verilog/ETH_VCU.v
read_verilog ../verilog/fpga_core.v
read_verilog ../verilog/lfsr.v
read_verilog ../verilog/mdio_master.v
read_verilog ../verilog/sync_reset.v
read_verilog ../verilog/queueMac.v
read_verilog ../verilog/axis_async_fifo.v
read_verilog ../verilog/axis_async_fifo_adapter.v
read_verilog ../verilog/ACB_to_UI_EA.v
############# CONSTRAINT FILE ###########
read_xdc ../constraints/kc705.xdc

############# IP CORE FILES #############
#set_property part xc7k325tffg900-2 [current_project]
#set_property board_part xilinx.com:kc705:part0:1.1 [current_project]
set_property part xcvu37p-fsvh2892-2L-e [current_project]
set_property board_part xilinx.com:vcu128:part0:1.2 [current_project]

################### DRAM IPs ##################################################33
#read_ip ../ip_consolidated/kc705_dram_ip/fifo_generator_1/fifo_generator_1.xci
#read_ip ../ip_consolidated/kc705_dram_ip/fifo_generator_2/fifo_generator_2.xci
#read_ip ../ip_consolidated/kc705_dram_ip/mig_7series_0/mig_7series_0.xci
#read_ip ../ip_consolidated/kc705_dram_ip/fifo_generator_4/fifo_generator_4.xci
#read_ip ../ip_consolidated/kc705_dram_ip/fifo_generator_3/fifo_generator_3.xci

read_ip ../ip_consolidated/kc705_networking_ip/ddr4_0/ddr4_0.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_0/fifo_generator_0.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_1/fifo_generator_1.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_2/fifo_generator_2.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_3/fifo_generator_3.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_4/fifo_generator_4.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_5/fifo_generator_5.xci

################### Networking IPs ##################################################33
#read_ip ../ip_consolidated/kc705_networking_ip/tri_mode_ethernet_mac_0/tri_mode_ethernet_mac_0.xci
#read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_acb_resp/fifo_generator_acb_resp.xci
#read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_acb_req/fifo_generator_acb_req.xci
#
## afb dual-clocked fifos are not used.
##read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_afb_resp/fifo_generator_afb_resp.xci
##read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_afb_req/fifo_generator_afb_req.xci
##
#read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_0/fifo_generator_0.xci
#TODO: Add VIO Files
#read_ip ../ip_consolidated/kc705_networking_ip/vio_80/vio_80.xci
#read_ip ../ip_consolidated/kc705_networking_ip/vio_125/vio_125.xci
#read_ip ../ip_consolidated/kc705_networking_ip/vio_200/vio_200.xci
#read_ip ../ip_consolidated/kc705_networking_ip/clk_wiz_0/clk_wiz_0.xci
read_ip ../ip_consolidated/kc705_networking_ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_acb_resp/fifo_generator_acb_resp.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_acb_req/fifo_generator_acb_req.xci
#read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_afb_req/fifo_generator_afb_req.xci
#read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_afb_resp/fifo_generator_afb_resp.xci
read_ip ../ip_consolidated/kc705_networking_ip/ila_0/ila_0.xci
read_ip ../ip_consolidated/kc705_networking_ip/ila_2/ila_2.xci


## core edif file ####################################################################
read_edif ../../../SOURCE/EDIF/processor_1x1x32.vanilla.with_sgi_fix.edn
#########################################
#write_checkpoint -force fread_done.dcp
############### SYNTHESIZE ##############
synth_design -fsm_extraction off  -top sbc_kc705 -part xcvu37p-fsvh2892-2L-e
write_checkpoint -force PostSynthCheckpoint.dcp
report_timing_summary -file timing.postsynth.rpt -nworst 4

report_utilization -file utilization_post_synth.rpt
report_utilization -hierarchical -file utilization_post_synth.hierarchical.rpt
opt_design
place_design -directive Explore
route_design -directive Explore
phys_opt_design
phys_opt_design
phys_opt_design
phys_opt_design
phys_opt_design
phys_opt_design
phys_opt_design
phys_opt_design
phys_opt_design
phys_opt_design
phys_opt_design
phys_opt_design
write_checkpoint -force PostPlaceRouteCheckpoint.dcp
report_timing_summary -file timing.rpt -nworst 10 -verbose
report_utilization -file utilization_post_place_and_route.rpt
report_utilization -hierarchical -file utilization_post_place_and_route.hierarchical.rpt
write_bitstream -force processor_1x1x32.sbc.kc705.bit
write_debug_probes -force processor_1x1x32.sbc.kc705.ltx 
