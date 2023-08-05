set_property SRC_FILE_INFO {cfile:/home/harshad/Project/git/AJIT_Ethernet/boards/ethernetVCU128/ip/clocking_wizard_100Mhz/clocking_wizard_100Mhz.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../../../clocking_wizard_100Mhz.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.1
