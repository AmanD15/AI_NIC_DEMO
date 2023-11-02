#set AHIR_RELEASE $::env(AHIR_RELEASE)
#set AJIT_PROJECT_HOME $::env(AJIT_PROJECT_HOME)

read_vhdl -library ahir ../vhdl_libs/ahir.vhdl
read_vhdl -library ahir_ieee_proposed ../vhdl_libs/aHiR_ieee_proposed.vhdl
read_vhdl -library simpleUartLib ../vhdl_libs/simpleUartLib.vhdl
read_vhdl -library GenericCoreAddonLib ../vhdl_libs/GenericCoreAddOnLib.vhdl
read_vhdl -library GenericGlueStuff ../vhdl_libs/GenericGlueStuff.vhdl
read_vhdl -library GlueModules ../vhdl_libs/GlueModules.vhdl
read_vhdl -library rx_concat_system_global_package ../vhdl_libs/rx_concat_system_global_package.vhdl
read_vhdl -library tx_deconcat_system_global_package ../vhdl_libs/tx_deconcat_system_global_package.vhdl
read_vhdl -library DualClockedQueuelib ../vhdl_libs/DualClockedQueuelib.vhdl

read_vhdl ../vhdl/DualClockedQueue.vhd
#read_vhdl ../vhdl/ahir_system_global_package.vhdl
read_vhdl ../vhdl/ai_ml_engine_global_package.vhdl
read_vhdl ../vhdl/nic_system_global_package.vhdl
read_vhdl ../vhdl/ethernet_boot_global_package.vhdl
#read_vhdl ../vhdl/ahir_system.vhdl
read_vhdl ../vhdl/ai_ml_engine.vhdl
read_vhdl ../vhdl/nic_system.vhdl
read_vhdl ../vhdl/ethernet_boot.vhdl

read_vhdl ../vhdl/top_level.vhdl
read_vhdl ../vhdl/rx_concat_system.vhdl
read_vhdl ../vhdl/tx_deconcat_system.vhdl

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
read_xdc ../constraints/vcu128_Ethernet.xdc

############# IP CORE FILES #############
set_property part xcvu37p-fsvh2892-2L-e [current_project]
set_property board_part xilinx.com:vcu128:part0:1.2 [current_project]

################### standlone proto core ################
read_ip ../ip/SBC_IP/vio_125/vio_125.xci
read_ip ../ip/SBC_IP/vio_80/vio_80.xci
read_ip ../ip/SBC_IP/vio_200/vio_200.xci
read_ip ../ip/SBC_IP/clk_wiz_0/clk_wiz_0.xci

#read_ip ../ip/clocking_wizard_100Mhz/clocking_wizard_100Mhz.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
read_ip ../ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0.xci
read_ip ../ip/fifo_generator_acb_resp/fifo_generator_acb_resp.xci
read_ip ../ip/fifo_generator_acb_req/fifo_generator_acb_req.xci
read_ip ../ip/fifo_generator_afb_req/fifo_generator_afb_req.xci
read_ip ../ip/fifo_generator_afb_resp/fifo_generator_afb_resp.xci
read_ip ../ip/fifo_generator_0/fifo_generator_0.xci
read_ip ../ip/fifo_generator_1/fifo_generator_1.xci
read_ip ../ip/fifo_generator_2/fifo_generator_2.xci
read_ip ../ip/fifo_generator_3/fifo_generator_3.xci
read_ip ../ip/fifo_generator_4/fifo_generator_4.xci
read_ip ../ip/fifo_generator_5/fifo_generator_5.xci
read_ip ../ip/ddr4_0/ddr4_0.xci

## core edif file
read_edif ./processor_1x1x32.edn

############### SYNTHESIZE ##############
synth_design -fsm_extraction off  -top top_level -part xcvu37p-fsvh2892-2L-e
write_checkpoint -force PostSynthCheckpoint.dcp
report_timing_summary -file timing.postsynth.rpt -nworst 4
report_utilization -file utilization_post_synth.rpt
report_utilization -hierarchical -file utilization_post_synth.hierarchical.rpt
opt_design
place_design -directive Explore
route_design -directive Explore
write_checkpoint -force PostPlaceRouteCheckpoint.dcp
phys_opt_design
phys_opt_design
write_checkpoint -force PostPlaceRouteCheckpoint.dcp
phys_opt_design -directive Explore
phys_opt_design
write_checkpoint -force PostPlaceRouteCheckpoint.dcp
report_timing_summary -file timing.rpt -nworst 10 -verbose
report_utilization -file utilization_post_place_and_route.rpt
report_utilization -hierarchical -file utilization_post_place_and_route.hierarchical.rpt
write_bitstream -force ./system.bit
write_debug_probes -force ./system.ltx
