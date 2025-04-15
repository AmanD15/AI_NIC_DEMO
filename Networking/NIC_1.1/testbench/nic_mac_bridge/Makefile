# build software version of testbench (to check the "desired behaviour")
AHIR_INCLUDE=$(AHIR_RELEASE)/include
AHIR_LIB=$(AHIR_RELEASE)/lib
VHDL_LIB=$(AHIR_RELEASE)/vhdl
VHDL_VHPI_LIB=$(AHIR_RELEASE)/CtestBench/vhdl
FUNCTIONLIB=$(AHIR_RELEASE)/functionLibrary/
SRCS=../../../NIC_GLUE_LOGIC/deconcatBlock/src/tx_deconcat.aa  ../../../NIC_GLUE_LOGIC/concatBlock/src/rx_concat.aa  ../pipes.aa 
TESTBENCH=./testbench

all: HW SW 
TOVC:aalink aa2vc 
VC2VHDL: vc2vhdl  
AA2VHDLSIM: aa2vc  vc2vhdl  
TOVHDL:TOVC vc2vhdl

TOPMODULES=-T rx_concat -T tx_deconcat

# five steps from C to vhdl simulator.
HW: aalink aa2vc  vc2vhdl  
SW: aalink aa2c aa2vc 
AA2VHDL: aalink aa2c aa2vc vc2vhdl

# Aa to vC
aalink: $(SRCS)
	rm -rf .Aa
	mkdir .Aa
	AaLinkExtMem $(SRCS) | vcFormat > .Aa/nic_mac_bridge.linked.aa
	#AaLinkExtMem $(SRC)/pipes.aa $(SRC)/rx_concat.aa | vcFormat > rx_concat.linked.aa
	AaOpt -B .Aa/nic_mac_bridge.linked.aa | vcFormat > .Aa/nic_mac_bridge.linked.opt.aa

aa2c :.Aa/nic_mac_bridge.linked.opt.aa 
	rm -rf aa2c
	mkdir aa2c
	Aa2C $(TOPMODULES) .Aa/nic_mac_bridge.linked.opt.aa -o aa2c/

aa2vc: .Aa/nic_mac_bridge.linked.opt.aa
	rm -rf .vC
	mkdir .vC
	Aa2VC -O -C .Aa/nic_mac_bridge.linked.opt.aa | vcFormat > .vC/nic_mac_bridge.vc

# vC to VHDL
vc2vhdl: .vC/nic_mac_bridge.vc
	rm -rf vhdl
	mkdir vhdl
	mkdir vhdl/nic_mac_bridge_lib
	mkdir vhdl/testbench
	#-D -O -S 4 -I 2 -v -a -C -e
	vc2vhdl -H -U  -O -a -C -e nic_mac_bridge -w -s ghdl -W nic_mac_bridge_lib  $(TOPMODULES) -f .vC/nic_mac_bridge.vc -L $(FUNCTIONLIB)/fpu.list
	vhdlFormat < nic_mac_bridge.unformatted_vhdl > vhdl/nic_mac_bridge_lib/nic_mac_bridge.vhdl
	vhdlFormat < nic_mac_bridge_global_package.unformatted_vhdl > vhdl/nic_mac_bridge_lib/nic_mac_bridge_global_package.vhdl
	vhdlFormat < nic_mac_bridge_test_bench.unformatted_vhdl > nic_mac_bridge_test_bench.vhdl
	rm -rf *unformatted_vhdl


clean:
	rm -rf vhdl aa2c* .Aa .gsi.aa .vC  *.vhdl *.dot *.hsys vhdlCStub*

PHONY: all clean	
