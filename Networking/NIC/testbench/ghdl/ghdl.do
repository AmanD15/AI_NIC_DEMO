VHDL_LIBS=../../../../SOURCE/VHDL_LIBS
echo $VHDL_LIBS
ghdl --clean
ghdl --remove
ghdl -i --work=GhdlLink $VHDL_LIBS/GhdlLink.vhdl
ghdl -i --work=aHiR_ieee_proposed $VHDL_LIBS/aHiR_ieee_proposed.vhdl
ghdl -i --work=ahir $VHDL_LIBS/ahir.vhdl
ghdl -i --work=simpleUartLib $VHDL_LIBS/simpleUartLib.vhdl
ghdl -i --work=AjitCustom $VHDL_LIBS/AjitCustom.vhdl
ghdl -i --work=GenericGlueStuff $VHDL_LIBS/GenericGlueStuff.vhdl
ghdl -i --work=GlueModules $VHDL_LIBS/GlueModules.vhdl
ghdl -i --work=nic_mac_bridge_lib /home/madhav/SuitcaseRepo/AI_NIC_DEMO/Networking/NIC/testbench/nic_mac_bridge/vhdl/nic_mac_bridge_lib/nic_mac_bridge_global_package.vhdl
ghdl -i --work=nic_mac_bridge_lib /home/madhav/SuitcaseRepo/AI_NIC_DEMO/Networking/NIC/testbench/nic_mac_bridge/vhdl/nic_mac_bridge_lib/nic_mac_bridge.vhdl
ghdl -i --work=nic_lib /home/madhav/SuitcaseRepo/AI_NIC_DEMO/Networking/NIC/testbench/nic/vhdl/nic_lib/nic.vhdl
ghdl -i --work=nic_lib /home/madhav/SuitcaseRepo/AI_NIC_DEMO/Networking/NIC/testbench/nic/vhdl/nic_lib/nic_global_package.vhdl
ghdl -i --work=tester_lib /home/madhav/SuitcaseRepo/AI_NIC_DEMO/Networking/NIC/testbench/tester/vhdl/tester_lib/tester.vhdl
ghdl -i --work=tester_lib /home/madhav/SuitcaseRepo/AI_NIC_DEMO/Networking/NIC/testbench/tester/vhdl/tester_lib/tester_global_package.vhdl
ghdl -i --work=test_lib /home/madhav/SuitcaseRepo/AI_NIC_DEMO/Networking/NIC/testbench/vhdl/test_lib/test_system.vhdl
ghdl -i --work=work /home/madhav/SuitcaseRepo/AI_NIC_DEMO/Networking/NIC/testbench/vhdl/testbench/test_system_test_bench.vhdl
ghdl -m --work=work -Wl,-L/home/madhav/AHIR/gitHub/ahir/release/lib -Wl,-lVhpi test_system_test_bench
