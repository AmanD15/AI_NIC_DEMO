# build software version of testbench (to check the "desired behaviour")
AHIR_INCLUDE=$(AHIR_RELEASE)/include
AHIR_LIB=$(AHIR_RELEASE)/lib
VHDL_LIB=$(AHIR_RELEASE)/vhdl
VHDL_VHPI_LIB=$(AHIR_RELEASE)/CtestBench/vhdl
FUNCTIONLIB=$(AHIR_RELEASE)/functionLibrary/
SRC=../../SOURCE/NIC/
all: HW 

TOPMODULES=-T ReceiveEngineDaemon -T nicRxFromMacDaemon -T transmitEngineDaemon -T controlDaemon


# five steps from C to vhdl simulator.
HW: aalink aa2vc  vc2vhdl  

# Aa to vC
aalink: $(SRC)/*.aa 
	rm -rf .Aa
	mkdir .Aa
	AaLinkExtMem $(SRC)/decls.aa $(SRC)/parameters.aa $(SRC)/pipes.aa $(SRC)/signals.aa $(SRC)/control.aa $(SRC)/general_utils.aa $(SRC)/memory_utils.aa $(SRC)/queue_utils.aa $(SRC)/register_utils.aa $(SRC)/rx_from_mac.aa $(SRC)/receive_engine.aa $(SRC)/transmit_engine.aa | vcFormat > .Aa/nic.linked.aa
	AaOpt -B .Aa/nic.linked.aa | vcFormat > .Aa/nic.linked.opt.aa

aa2vc: .Aa/nic.linked.opt.aa
	rm -rf .vC
	mkdir .vC
	Aa2VC -O -C .Aa/nic.linked.opt.aa | vcFormat > .vC/nic.vc

# vC to VHDL
vc2vhdl: .vC/nic.vc
	vc2vhdl -H -U  -O -a -C -e nic -w -s ghdl $(TOPMODULES) -f .vC/nic.vc  -W nic_lib
	rm -rf vhdl/
	mkdir vhdl
	mkdir vhdl/testbench
	mkdir vhdl/nic_lib
	vhdlFormat < nic_global_package.unformatted_vhdl > vhdl/nic_lib/nic_global_package.vhdl
	vhdlFormat < nic.unformatted_vhdl > vhdl/nic_lib/nic.vhdl
	vhdlFormat < nic_test_bench.unformatted_vhdl > vhdl/testbench/nic_test_bench.vhdl
	rm -f *.unformatted_vhdl

clean:
	rm -rf *.o* *.cf vhdl/ .Aa .vC  vhdlCStubs.* *.vcd in_data* out_data* testbench_sw testbench_hw ahir_system_test_bench vhpi.log *.aa *.vc *.lso xst *.ngc *_xmsgs *.xrpt pipeHandler.log *.srp *.ghw *.dot ahir_system.s *.log aa_c_model.c  aa_c_model.h  aa_c_model_internal.h PREFIX *.trace .gsi.aa *.hsys

PHONY: all clean	
