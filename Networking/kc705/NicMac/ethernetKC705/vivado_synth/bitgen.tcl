#set AHIR_RELEASE $::env(AHIR_RELEASE)
#set AJIT_PROJECT_HOME $::env(AJIT_PROJECT_HOME)

read_vhdl -library ahir ../vhdl_libs/ahir.vhdl
read_vhdl -library ahir_ieee_proposed ../vhdl_libs/aHiR_ieee_proposed.vhdl
read_vhdl -library simpleUartLib ../vhdl_libs/simpleUartLib.vhdl
read_vhdl -library GenericCoreAddonLib ../vhdl_libs/GenericCoreAddOnLib.vhdl
read_vhdl -library GenericGlueStuff ../vhdl_libs/GenericGlueStuff.vhdl
read_vhdl -library GlueModules ../vhdl_libs/GlueModules.vhdl
read_vhdl -library ahir_system_global_packagelib ../vhdl_libs/ahir_system_global_packagelib.vhdl
read_vhdl -library rx_concat_system_global_package ../vhdl_libs/rx_concat_system_global_package.vhdl
read_vhdl -library tx_deconcat_system_global_package ../vhdl_libs/tx_deconcat_system_global_package.vhdl
read_vhdl -library DualClockedQueuelib ../vhdl_libs/DualClockedQueuelib.vhdl

read_vhdl ../vhdl/DualClockedQueue.vhd
read_vhdl ../vhdl/nic.vhdl
read_vhdl ../vhdl/rx_concat_system.vhdl
read_vhdl ../vhdl/top_level.vhdl
read_vhdl ../vhdl/tx_deconcat_system.vhdl



read_verilog ../verilog/axi_lite_controller.v
read_verilog ../verilog/nic_mac_pipe_reset.v
read_verilog ../verilog/clocks_gen.v
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

################### standlone proto core ################
read_ip ../ip/fifo_generator_acb_resp/fifo_generator_acb_resp.xci
read_ip ../ip/fifo_generator_acb_req/fifo_generator_acb_req.xci
read_ip ../ip/fifo_generator_afb_req/fifo_generator_afb_req.xci
read_ip ../ip/fifo_generator_afb_resp/fifo_generator_afb_resp.xci
read_ip ../ip/tri_mode_ethernet_mac_0/tri_mode_ethernet_mac_0.xci
read_ip ../ip/vio_0/vio_0.xci
read_ip ../ip/vio_1/vio_1.xci
read_ip ../ip/fifo_generator_0/fifo_generator_0.xci
read_ip ../ip/fifo_generator_1/fifo_generator_1.xci

## core edif file
read_edif ./processor_1x1x32.edn 

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
write_bitstream -force processor_1x1x32.Ethernet.kc705.bit
