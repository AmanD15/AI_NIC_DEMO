# VHDL libs.
read_vhdl -library AhbApbLib ../vhdl_libs/AhbApbLib.vhdl
read_vhdl -library ahir_ieee_proposed ../vhdl_libs/aHiR_ieee_proposed.vhdl
read_vhdl -library ahir ../vhdl_libs/ahir.vhdl
read_vhdl -library AxiBridgeLib ../vhdl_libs/AxiBridgeLib.vhdl
read_vhdl -library DualClockedQueueLib ../vhdl_libs/DualClockedQueuelib.vhdl
read_vhdl -library GenericCoreAddOnLib ../vhdl_libs/GenericCoreAddOnLib.vhdl
read_vhdl -library GenericGlueStuff ../vhdl_libs/GenericGlueStuff.vhdl
read_vhdl -library GlueModules ../vhdl_libs/GlueModules.vhdl
read_vhdl -library simpleI2CLib  ../vhdl_libs/simpleI2CLib.vhdl
read_vhdl -library simpleUartLib ../vhdl_libs/simpleUartLib.vhdl
read_vhdl -library SpiMasterLib  ../vhdl_libs/SpiMasterLib.vhdl

# the SBC core vhdl files.
read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system_global_package.vhdl
read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/tx_deconcat_system/vhdl/nic_mac_bridge_lib/tx_deconcat_system.vhdl
read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system.vhdl
read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/rx_concat_system/vhdl/nic_mac_bridge_lib/rx_concat_system_global_package.vhdl
read_vhdl -library nic_mac_bridge_lib ../hsys/nic_subsystem/nic_mac_bridge/vhdl/nic_mac_bridge_lib/nic_mac_bridge.vhdl
read_vhdl -library nic_lib ../hsys/nic_subsystem/nic/vhdl/nic_lib/nic.vhdl
read_vhdl -library nic_lib ../hsys/nic_subsystem/nic/vhdl/nic_lib/nic_global_package.vhdl
read_vhdl -library nic_subsystem_lib ../hsys/nic_subsystem/vhdl/nic_subsystem_lib/nic_subsystem.vhdl
read_vhdl -library acb_afb_complex_lib ../hsys/acb_afb_complex/vhdl/acb_afb_complex_lib/acb_afb_complex.vhdl
read_vhdl -library ajit_processor_lib ../hsys/processor_subsystem/vhdl/ajit_processor_lib/processor_1x1x32.vhdl
read_vhdl -library acb_dram_controller_bridge_lib ../hsys/acb_dram_controller_bridge/vhdl/acb_dram_controller_bridge_lib/acb_dram_controller_bridge.vhdl
read_vhdl -library spi_flash_controller_lib ../hsys/spi_flash_controller/vhdl/spi_flash_controller_lib/spi_flash_controller.vhdl
read_vhdl -library sbc_kc705_core_lib ../hsys/vhdl/sbc_kc705_core_lib/sbc_kc705_core.vhdl

# verilog files..
read_verilog ../verilog/axi_lite_controller.v
read_verilog ../verilog/nic_mac_pipe_reset.v
read_verilog ../verilog/ETH_KC.v
read_verilog ../verilog/queueMac.v
read_verilog ../verilog/reset_gen.v
read_verilog ../verilog/tri_mode_ethernet_mac_0_clk_wiz.v
read_verilog ../verilog/tri_mode_ethernet_mac_0_reset_sync.v
read_verilog ../verilog/tri_mode_ethernet_mac_0_sync_block.v

############# CONSTRAINT FILE ###########
read_xdc ../constraints/kc705_Ethernet.xdc

############# IP CORE FILES #############
set_property part xc7k325tffg900-2 [current_project]
set_property board_part xilinx.com:kc705:part0:1.1 [current_project]

################### DRAM IPs ##################################################33
read_ip ../ip_consolidated/kc705_dram_ip/fifo_generator_1/fifo_generator_1.xci
read_ip ../ip_consolidated/kc705_dram/fifo_generator_2/fifo_generator_2.xci
read_ip ../ip_consolidated/kc705_dram/mig_7series_0/mig_7series_0.xci
read_ip ../ip_consolidated/kc705_dram/fifo_generator_4/fifo_generator_4.xci
read_ip ../ip_consolidated/kc705_dram/fifo_generator_0/fifo_generator_0.xci
read_ip ../ip_consolidated/kc705_dram/fifo_generator_3/fifo_generator_3.xci

################### Networking IPs ##################################################33
read_ip ../ip_consolidated/kc705_networking_ip/tri_mode_ethernet_mac_0/tri_mode_ethernet_mac_0.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_afb_resp/fifo_generator_afb_resp.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_acb_resp/fifo_generator_acb_resp.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_afb_req/fifo_generator_afb_req.xci
read_ip ../ip_consolidated/kc705_networking_ip/fifo_generator_acb_req/fifo_generator_acb_req.xci

## core edif file ####################################################################
read_edif ../../../SOURCE/EDIF/processor_1x1x32.edn

############### SYNTHESIZE ##############
synth_design -fsm_extraction off  -top top_level -part xc7k325tffg900-2
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