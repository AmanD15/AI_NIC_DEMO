# VHDL libs.
read_vhdl -library AhbApbLib ../vhdl_libs/AhbApbLib.vhdl
read_vhdl -library ahir_ieee_proposed ../vhdl_libs/aHiR_ieee_proposed.vhdl
read_vhdl -library ahir ../vhdl_libs/ahir.vhdl
read_vhdl -library AxiBridgeLib ../vhdl_libs/AxiBridgeLib.vhdl
read_vhdl -library DualClockedQueuelib ../vhdl/DualClockedQueuelib.vhdl
read_vhdl -library GenericCoreAddOnLib ../vhdl/GenericCoreAddOnLib.vhdl
read_vhdl -library GenericGlueStuff ../vhdl_libs/GenericGlueStuff.vhdl
read_vhdl -library GlueModules ../vhdl_libs/GlueModules.vhdl
read_vhdl -library simpleI2CLib  ../vhdl_libs/simpleI2CLib.vhdl
read_vhdl -library simpleUartLib ../vhdl_libs/simpleUartLib.vhdl
read_vhdl -library SpiMasterLib  ../vhdl_libs/SpiMasterLib.vhdl
read_vhdl -library AjitCustom  ../vhdl_libs/AjitCustom.vhdl
read_vhdl ../vhdl/DualClockedQueue.vhd
read_vhdl -library nic_mac_bridge_lib ../toplevel/nic_mac_bridge_edited.vhdl


# the SBC core vhdl files for hsys (original SBC)

#read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system_global_package.vhdl
#read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system.vhdl
#read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system.vhdl
#read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system_global_package.vhdl
#read_vhdl -library nic_lib ../hsys/nic_subsystem/nic/vhdl/nic_lib/nic.vhdl
#read_vhdl -library nic_lib ../hsys/nic_subsystem/nic/vhdl/nic_lib/nic_global_package.vhdl
#read_vhdl -library nic_subsystem_lib ../hsys/nic_subsystem/vhdl/nic_subsystem_lib/nic_subsystem.vhdl
#read_vhdl -library acb_afb_complex_lib ../hsys/acb_afb_complex/vhdl/acb_afb_complex_lib/acb_afb_complex.vhdl
#read_vhdl -library ajit_processor_lib ../hsys/processor_subsystem/vhdl/ajit_processor_lib/processor_1x1x32.vhdl
#read_vhdl -library acb_dram_controller_bridge_lib ../hsys/acb_dram_controller_bridge/vhdl/acb_dram_controller_bridge_lib/acb_dram_controller_bridge.vhdl
#read_vhdl -library spi_flash_controller_lib ../hsys/spi_flash_controller/vhdl/spi_flash_controller_lib/spi_flash_controller.vhdl
#read_vhdl -library sbc_kc705_core_lib ../hsys/vhdl/sbc_kc705_core_lib/sbc_kc705_core.vhdl


# the SBC core vhdl files for hsys_1.1 (SBC with ACB SRAM)

 read_vhdl -library nic_mac_bridge_lib ../hsys_1.1/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system_global_package.vhdl
 read_vhdl -library nic_mac_bridge_lib ../hsys_1.1/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system.vhdl
 read_vhdl -library nic_mac_bridge_lib ../hsys_1.1/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system.vhdl
 read_vhdl -library nic_mac_bridge_lib ../hsys_1.1/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system_global_package.vhdl
 read_vhdl -library nic_lib ../hsys_1.1/nic_subsystem/nic/vhdl/nic_lib/nic.vhdl
 read_vhdl -library nic_lib ../hsys_1.1/nic_subsystem/nic/vhdl/nic_lib/nic_global_package.vhdl
 read_vhdl -library nic_subsystem_lib ../hsys_1.1/nic_subsystem/vhdl/nic_subsystem_lib/nic_subsystem.vhdl
 read_vhdl -library acb_afb_complex_lib ../hsys_1.1/acb_afb_complex/vhdl/acb_afb_complex_lib/acb_afb_complex.vhdl
 read_vhdl -library ajit_processor_lib ../hsys_1.1/processor_subsystem/vhdl/ajit_processor_lib/processor_1x1x32.vhdl
 read_vhdl -library acb_dram_controller_bridge_lib ../hsys_1.1/acb_dram_controller_bridge/vhdl/acb_dram_controller_bridge_lib/acb_dram_controller_bridge.vhdl
 read_vhdl -library spi_flash_controller_lib ../hsys_1.1/spi_flash_controller/vhdl/spi_flash_controller_lib/spi_flash_controller.vhdl
 read_vhdl -library sbc_kc705_core_lib ../hsys_1.1/vhdl/sbc_kc705_core_lib/sbc_kc705_core.vhdl

# the SBC core vhdl files for hsys_1.2 (SBC with L2CACHE)

#read_vhdl -library nic_mac_bridge_lib ../hsys_1.2/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system_global_package.vhdl
#read_vhdl -library nic_mac_bridge_lib ../hsys_1.2/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system.vhdl
#read_vhdl -library nic_mac_bridge_lib ../hsys_1.2/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system.vhdl
#read_vhdl -library nic_mac_bridge_lib ../hsys_1.2/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system_global_package.vhdl
#read_vhdl -library nic_lib ../hsys_1.2/nic_subsystem/nic/vhdl/nic_lib/nic.vhdl
#read_vhdl -library nic_lib ../hsys_1.2/nic_subsystem/nic/vhdl/nic_lib/nic_global_package.vhdl
#read_vhdl -library nic_subsystem_lib ../hsys_1.2/nic_subsystem/vhdl/nic_subsystem_lib/nic_subsystem.vhdl
#read_vhdl -library acb_afb_complex_lib ../hsys_1.2/acb_afb_complex/vhdl/acb_afb_complex_lib/acb_afb_complex.vhdl
#read_vhdl -library ajit_processor_lib ../hsys_1.2/processor_subsystem/vhdl/ajit_processor_lib/processor_1x1x32.vhdl
#read_vhdl -library acb_dram_controller_bridge_lib ../hsys_1.2/acb_dram_controller_bridge/vhdl/acb_dram_controller_bridge_lib/acb_dram_controller_bridge.vhdl
#read_vhdl -library spi_flash_controller_lib ../hsys_1.2/spi_flash_controller/vhdl/spi_flash_controller_lib/spi_flash_controller.vhdl
#read_vhdl -library sbc_kc705_core_lib ../hsys_1.2/vhdl/sbc_kc705_core_lib/sbc_kc705_core.vhdl


############ ADDING TOP LEVEL VHDL #########################
# toplevel file for hsys (original SBC)

# read_vhdl ../toplevel/orignal_SBC/sbc_kc705.vhdl

# toplevel file for hsys_1.1 (SBC with ACB SRAM)

 read_vhdl ../toplevel/SBC_FASTMEM/sbc_kc705.vhdl
 read_vhdl ../hsys_1.1/acb_sram/vhdl/acb_sram_lib/acb_sram.vhdl

# toplevel file for hsys_1.2 (SBC with L2CACHE)
#read_vhdl -library l2_cache_lib ../../../SOURCE/L2CACHE/vhdl/l2_cache_lib/l2_cache.vhdl
#read_vhdl -library l2_cache_lib ../../../SOURCE/L2CACHE/vhdl/l2_cache_lib/l2_cache_global_package.vhdl
#read_vhdl ../toplevel/SBC_L2CACHE/sbc_kc705.vhdl


###########################################################
# verilog files for old MAC
#read_verilog ../verilog/axi_lite_controller.v
#read_verilog ../verilog/ETH_KC.v
#read_verilog ../verilog/reset_gen.v
#read_verilog ../verilog/tri_mode_ethernet_mac_0_clk_wiz.v
#read_verilog ../verilog/tri_mode_ethernet_mac_0_reset_sync.v
#read_verilog ../verilog/tri_mode_ethernet_mac_0_sync_block.v

# verilog files for MAC
read_verilog ../organizedMAC/example_design_top_level/tri_mode_ethernet_mac_0_example_design.v
read_verilog ../organizedMAC/AXI_stateMachine/tri_mode_ethernet_mac_0_axi_lite_sm.v
read_verilog ../organizedMAC/reset_sync/tri_mode_ethernet_mac_0_example_design_resets.v
read_verilog ../organizedMAC/reset_sync/tri_mode_ethernet_mac_0_reset_sync.v
read_verilog ../organizedMAC/sync_block/tri_mode_ethernet_mac_0_sync_block.v
read_verilog ../organizedMAC/AXI_fifos/tri_mode_ethernet_mac_0_bram_tdp.v
read_verilog ../organizedMAC/AXI_fifos/tri_mode_ethernet_mac_0_fifo_block.v
read_verilog ../organizedMAC/AXI_fifos/tri_mode_ethernet_mac_0_rx_client_fifo.v
read_verilog ../organizedMAC/AXI_fifos/tri_mode_ethernet_mac_0_support.v
read_verilog ../organizedMAC/AXI_fifos/tri_mode_ethernet_mac_0_support_clocking.v
read_verilog ../organizedMAC/AXI_fifos/tri_mode_ethernet_mac_0_support_resets.v
read_verilog ../organizedMAC/AXI_fifos/tri_mode_ethernet_mac_0_ten_100_1g_eth_fifo.v
read_verilog ../organizedMAC/AXI_fifos/tri_mode_ethernet_mac_0_tx_client_fifo.v


read_verilog ../verilog/queueMac.v
read_verilog ../verilog/nic_mac_pipe_reset.v
read_verilog ../hsys/acb_dram_controller_bridge/verilog/ACB_to_UI_EA.v

############# CONSTRAINT FILE ###########
read_xdc ../constraints/kc705.xdc

############# IP CORE FILES #############
set_property part xc7k325tffg900-2 [current_project]
set_property board_part xilinx.com:kc705:part0:1.1 [current_project]

################### DRAM IPs ##################################################33
read_ip ../ip_consolidated/kc705_dram_ip/fifo_generator_1/fifo_generator_1.xci
read_ip ../ip_consolidated/kc705_dram_ip/fifo_generator_2/fifo_generator_2.xci
read_ip ../ip_consolidated/kc705_dram_ip/mig_7series_0/mig_7series_0.xci
read_ip ../ip_consolidated/kc705_dram_ip/fifo_generator_4/fifo_generator_4.xci
read_ip ../ip_consolidated/kc705_dram_ip/fifo_generator_3/fifo_generator_3.xci

################### Networking IPs ##################################################33
#read_ip ../ip_consolidated/kc705_networking_ip/tri_mode_ethernet_mac_0/tri_mode_ethernet_mac_0.xci
read_ip ../organizedMAC/tri_mode_ethernet_mac_ip/tri_mode_ethernet_mac_0/tri_mode_ethernet_mac_0.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_acb_resp/fifo_generator_acb_resp.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_acb_req/fifo_generator_acb_req.xci

# afb dual-clocked fifos are not used.
#read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_afb_resp/fifo_generator_afb_resp.xci
#read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_afb_req/fifo_generator_afb_req.xci

read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_0/fifo_generator_0.xci
read_ip ../ip_consolidated/kc705_networking_ip/vio_80/vio_80.xci
read_ip ../ip_consolidated/kc705_networking_ip/vio_125/vio_125.xci
read_ip ../ip_consolidated/kc705_networking_ip/ila_2/ila_2.xci
read_ip ../ip_consolidated/kc705_networking_ip/clk_wiz_0/clk_wiz_0.xci

## core edif file ####################################################################
read_edif ../../../SOURCE/EDIF/processor_1x1x32.edn
#########################################
#write_checkpoint -force fread_done.dcp
############### SYNTHESIZE ##############
synth_design -fsm_extraction off  -top sbc_kc705 -part xc7k325tffg900-2
write_checkpoint -force PostSynthCheckpoint.dcp
report_timing_summary -file timing.postsynth.rpt -nworst 4

report_utilization -file utilization_post_synth.rpt
report_utilization -hierarchical -file utilization_post_synth.hierarchical.rpt
opt_design
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
