# build software version of testbench (to check the "desired behaviour")
AHIR_INCLUDE=$(AHIR_RELEASE)/include
AHIR_LIB=$(AHIR_RELEASE)/lib
VHDL_LIB=$(AHIR_RELEASE)/vhdl
VHDL_VHPI_LIB=$(AHIR_RELEASE)/CtestBench/vhdl
FUNCTIONLIB=$(AHIR_RELEASE)/functionLibrary/
SRC=../../../SOURCE/NIC_GLUE_LOGIC/deconcatBlock
TESTBENCH=./testbench
TOPMODULES= -T tx_deconcat
NAME=tx_deconcat_system
all: HW 


# five steps from C to vhdl simulator.
HW: aalink aa2vc  vc2vhdl


# Aa to vC
aalink: $(SRC)/*.aa 
	rm -rf .Aa
	mkdir .Aa
	AaLinkExtMem $(SRC)/pipes.aa $(SRC)/tx_deconcat.aa | vcFormat > .Aa/tx_deconcat.linked.aa
	AaOpt -B .Aa/tx_deconcat.linked.aa | vcFormat > .Aa/tx_deconcat.linked.opt.aa

aa2vc: .Aa/tx_deconcat.linked.opt.aa
	rm -rf .vC
	mkdir .vC
	Aa2VC -O -C .Aa/tx_deconcat.linked.aa | vcFormat > .vC/tx_deconcat.vc

# vC to VHDL
vc2vhdl: .vC/tx_deconcat.vc
	vc2vhdl -H -U  -O -a -C -e $(NAME) -w -s ghdl $(TOPMODULES) -f .vC/tx_deconcat.vc -W nic_mac_bridge_lib
	rm -rf vhdl/
	mkdir vhdl
	mkdir vhdl/testbench
	mkdir vhdl/nic_mac_bridge_lib
	vhdlFormat < $(NAME)_global_package.unformatted_vhdl > vhdl/nic_mac_bridge_lib/$(NAME)_global_package.vhdl
	vhdlFormat < $(NAME).unformatted_vhdl > vhdl/nic_mac_bridge_lib/$(NAME).vhdl
	vhdlFormat < $(NAME)_test_bench.unformatted_vhdl > vhdl/testbench/$(NAME)_test_bench.vhdl

clean:
	rm -rf *.o* *.cf *.*vhdl vhdlCStubs.* *.vcd in_data* out_data* testbench_sw testbench_hw nic_test_bench vhpi.log *.aa *.vc *.lso xst *.ngc *_xmsgs *.xrpt pipeHandler.log *.srp *.ghw *.dot ahir_system.s *.log aa_c_model.c  aa_c_model.h  aa_c_model_internal.h PREFIX *.trace .gsi.aa *.hsys .Aa .vC vhdl

PHONY: all clean	
