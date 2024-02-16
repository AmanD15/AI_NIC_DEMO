# build software version of testbench (to check the "desired behaviour")
AHIR_INCLUDE=$(AHIR_RELEASE)/include
AHIR_LIB=$(AHIR_RELEASE)/lib
VHDL_LIB=$(AHIR_RELEASE)/vhdl
VHDL_VHPI_LIB=$(AHIR_RELEASE)/CtestBench/vhdl
FUNCTIONLIB=$(AHIR_RELEASE)/functionLibrary/
SRC=./
all: HW SW 
TOVC:aalink aa2vc 
VC2VHDL: vc2vhdl  vhdlsim
AA2VHDLSIM: aa2vc  vc2vhdl  vhdlsim
TOVHDL:TOVC vc2vhdl

TOPMODULES=-T tbMacRxDaemon -T tbMacTxDaemon -T tbAfbDaemon -T tbFinalMemDaemon -T tbEnableMacDaemon  -T tbMemDaemon -T tbProcessorMemDaemon


# five steps from C to vhdl simulator.
HW: aalink aa2vc  vc2vhdl  
SW: aalink aa2c aa2vc 
AA2VHDL: aa2vc vc2vhdl 

# Aa to vC
aalink: ../pipes.aa ./tester.aa 
	rm -rf .Aa
	mkdir .Aa
	AaLinkExtMem ../pipes.aa ./tester.aa  | vcFormat > .Aa/tester.linked.aa
	AaOpt -B .Aa/tester.linked.aa | vcFormat > .Aa/tester.linked.opt.aa

aa2c : .Aa/tester.linked.opt.aa
	Aa2C $(TOPMODULES) .Aa/tester.linked.opt.aa -o ./

aa2vc: .Aa/tester.linked.opt.aa
	rm -rf .vC
	mkdir .vC
	Aa2VC -O -C .Aa/tester.linked.opt.aa | vcFormat > .vC/tester.vc

# vC to VHDL
vc2vhdl: .vC/tester.vc
	rm -rf vhdl
	mkdir vhdl
	mkdir vhdl/tester_lib
	mkdir vhdl/testbench
	#-D -O -S 4 -I 2 -v -a -C -e
	vc2vhdl -H -U  -O -a -C -e tester -W tester_lib -w -s ghdl $(TOPMODULES) -f .vC/tester.vc -L $(FUNCTIONLIB)/fpu.list
	vhdlFormat < tester_global_package.unformatted_vhdl > vhdl/tester_lib/tester_global_package.vhdl
	vhdlFormat < tester.unformatted_vhdl > vhdl/tester_lib/tester.vhdl
	vhdlFormat < tester_test_bench.unformatted_vhdl > vhdl/testbench/tester_test_bench.vhdl
	rm -f *.unformatted_*

clean:
	rm -rf *.o* *.cf *.*vhdl vhdlCStubs.* *.vcd in_data* out_data* testbench_sw testbench_hw ahir_system_test_bench vhpi.log *.lso xst *.ngc *_xmsgs *.xrpt pipeHandler.log *.srp *.ghw *.dot ahir_system.s *.log aa_c_model.c  aa_c_model.h  aa_c_model_internal.h PREFIX *.trace .gsi.aa *.hsys vhdl .Aa .vC

PHONY: all clean	
