# build software version of testbench (to check the "desired behaviour")
AHIR_INCLUDE=$(AHIR_RELEASE)/include
AHIR_LIB=$(AHIR_RELEASE)/lib
VHDL_LIB=$(AHIR_RELEASE)/vhdl
VHDL_VHPI_LIB=$(AHIR_RELEASE)/CtestBench/vhdl
FUNCTIONLIB=$(AHIR_RELEASE)/functionLibrary/
SRC=../src
#SRC=../../../code/NicWithMacIf/Nic/src
TESTBENCH=$(SRC)/../testbench
all: HW SW 
TOVC:aalink aa2vc 
VC2VHDL: vc2vhdl  vhdlsim
AA2VHDLSIM: aa2vc  vc2vhdl  vhdlsim
TOVHDL:TOVC vc2vhdl

TOPMODULES=-T ReceiveEngineDaemon -T nicRxFromMacDaemon -T transmitEngineDaemon -T macToNicInterface -T nicToMacInterface -T processorToNicInterface -T nicToProcessorInterface -T memoryToNicInterface -T nicToMemoryInterface -T SoftwareRegisterAccessDaemon -T NicRegisterAccessDaemon -T memoryToProcessorInterface -T processorToMemoryInterface -T mac_enable_tester



# five steps from C to vhdl simulator.
HW: aalink aa2vc  vc2vhdl  vhdlsim
SW: aalink aa2c aa2vc swtb
AA2VHDL: aa2vc vc2vhdl vhdlsim

# Aa to vC
aalink: $(SRC)/*.aa $(TESTBENCH)/tester.aa 
	AaLinkExtMem $(SRC)/decls.aa $(SRC)/pipes.aa $(SRC)/signals.aa $(SRC)/control.aa $(SRC)/general_utils.aa $(SRC)/memory_utils.aa $(SRC)/queue_utils.aa $(SRC)/register_utils.aa $(SRC)/rx_from_mac.aa $(SRC)/receive_engine.aa $(SRC)/transmit_engine.aa $(TESTBENCH)/tester.aa| vcFormat > nic.linked.aa
	AaOpt -B nic.linked.aa | vcFormat > nic.linked.opt.aa

aa2c : nic.linked.opt.aa
	Aa2C $(TOPMODULES) nic.linked.opt.aa -o ./

aa2vc: nic.linked.opt.aa
	Aa2VC -O -C nic.linked.opt.aa | vcFormat > nic.vc

# vC to VHDL
vc2vhdl: nic.vc
	#-D -O -S 4 -I 2 -v -a -C -e
	vc2vhdl -U  -O -v -a -C -e nic -w -s ghdl $(TOPMODULES) -f nic.vc -L $(FUNCTIONLIB)/fpu.list
	vhdlFormat < nic_global_package.unformatted_vhdl > nic_global_package.vhdl
	vhdlFormat < nic.unformatted_vhdl > nic.vhdl
	vhdlFormat < nic_test_bench.unformatted_vhdl > nic_test_bench.vhdl

# build testbench and ghdl executable
# note the use of libVhpi in building the testbench.
vhdlsim: nic.vhdl nic_test_bench.vhdl $(TESTBENCH)/testbench.c vhdlCStubs.h vhdlCStubs.c
	gcc -c vhdlCStubs.c  -I$(SRC) -I./ -I$(AHIR_INCLUDE)
	gcc -c $(TESTBENCH)/testbench.c -I$(AHIR_INCLUDE) -I$(SRC) -I./
	gcc -o testbench_hw testbench.o vhdlCStubs.o  -L$(AHIR_LIB) -lSocketLibPipeHandler -lpthread
	ghdl --clean
	ghdl --remove
	ghdl -i --work=GhdlLink  $(VHDL_LIB)/GhdlLink.vhdl
	ghdl -i --work=aHiR_ieee_proposed  $(VHDL_LIB)/aHiR_ieee_proposed.vhdl
	ghdl -i --work=ahir  $(VHDL_LIB)/ahir.vhdl
	ghdl -i --work=work nic_global_package.vhdl
	ghdl -i --work=work nic.vhdl
	ghdl -i --work=work nic_test_bench.vhdl
	ghdl -m --work=work -Wl,-L$(AHIR_LIB) -Wl,-lVhpi nic_test_bench
swtb:  $(TESTBENCH)/*.c 
	gcc -c $(TESTBENCH)/testbench.c -DAA2C -I ./ -I $(AHIR_INCLUDE) -o testbench.o
	gcc -c aa_c_model.c -DAA2C -I ./ -I $(AHIR_INCLUDE)
	gcc -o testbench_sw testbench.o aa_c_model.o -L$(AHIR_LIB) -lBitVectors -lSockPipes -lPipeHandlerDebugPthreads -lpthread

# make clean and then make ahir_system
ahir_system: 
	AaLinkExtMem $(SRC)/decls.aa $(SRC)/pipes.aa $(SRC)/signals.aa $(SRC)/control.aa $(SRC)/general_utils.aa $(SRC)/memory_utils.aa $(SRC)/queue_utils.aa $(SRC)/register_utils.aa $(SRC)/rx_from_mac.aa $(SRC)/receive_engine.aa $(SRC)/transmit_engine.aa | vcFormat > nic.linked.ahir.system.aa
	AaOpt -B nic.linked.ahir.system.aa | vcFormat > nic.linked.ahir.system.opt.aa
	Aa2C $(TOPMODULES) nic.linked.ahir.system.aa -o ./
	Aa2VC -O -C nic.linked.ahir.system.opt.aa | vcFormat > nic.ahir.system.vc
	vc2vhdl -U  -O -v -a -C -e ahir_system -w -s ghdl $(TOPMODULES) -f nic.ahir.system.vc -L $(FUNCTIONLIB)/fpu.list
	vhdlFormat < ahir_system_global_package.unformatted_vhdl > ahir_system_global_package.vhdl
	vhdlFormat < ahir_system.unformatted_vhdl > nic.vhdl

clean:
	rm -rf *.o* *.cf *.*vhdl vhdlCStubs.* *.vcd in_data* out_data* testbench_sw testbench_hw ahir_system_test_bench vhpi.log *.aa *.vc *.lso xst *.ngc *_xmsgs *.xrpt pipeHandler.log *.srp *.ghw *.dot ahir_system.s *.log aa_c_model.c  aa_c_model.h  aa_c_model_internal.h PREFIX *.trace .gsi.aa

PHONY: all clean	
