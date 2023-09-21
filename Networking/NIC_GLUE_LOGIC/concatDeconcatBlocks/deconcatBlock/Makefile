# build software version of testbench (to check the "desired behaviour")
AHIR_INCLUDE=$(AHIR_RELEASE)/include
AHIR_LIB=$(AHIR_RELEASE)/lib
VHDL_LIB=$(AHIR_RELEASE)/vhdl
VHDL_VHPI_LIB=$(AHIR_RELEASE)/CtestBench/vhdl
FUNCTIONLIB=$(AHIR_RELEASE)/functionLibrary/
SRC=./src
TESTBENCH=./testbench

all: HW SW 
TOVC:aalink aa2vc 
VC2VHDL: vc2vhdl  vhdlsim
AA2VHDLSIM: aa2vc  vc2vhdl  vhdlsim
TOVHDL:TOVC vc2vhdl

TOPMODULES= -T tx_deconcat

# five steps from C to vhdl simulator.
HW: aalink aa2vc  vc2vhdl  vhdlsim
SW: aalink aa2c aa2vc swtb
AA2VHDL: aalink aa2c aa2vc vc2vhdl

# Aa to vC
aalink: $(SRC)/*.aa 
	#AaLinkExtMem $(SRC)/pipes.aa $(SRC)/CtoAAbridgetx.aa $(SRC)/tx_deconcat.aa | vcFormat > tx_deconcat.linked.aa
	AaLinkExtMem $(SRC)/pipes.aa $(SRC)/tx_deconcat.aa | vcFormat > tx_deconcat.linked.aa
	AaOpt -B tx_deconcat.linked.aa | vcFormat > tx_deconcat.linked.opt.aa

aa2c :tx_deconcat.linked.opt.aa 
	Aa2C $(TOPMODULES) tx_deconcat.linked.opt.aa -o ./

aa2vc: tx_deconcat.linked.opt.aa
	Aa2VC -O -C tx_deconcat.linked.aa | vcFormat > tx_deconcat.vc

# vC to VHDL
vc2vhdl: tx_deconcat.vc
	#-D -O -S 4 -I 2 -v -a -C -e
	vc2vhdl -U  -O -v -a -C -e tx_deconcat_system -w -s ghdl $(TOPMODULES) -f tx_deconcat.vc -L $(FUNCTIONLIB)/fpu.list
	vhdlFormat < tx_deconcat_system.unformatted_vhdl > ./hw/tx_deconcat_system.vhdl
	vhdlFormat < tx_deconcat_system_global_package.unformatted_vhdl > ./hw/tx_deconcat_system_global_package.vhdl
	vhdlFormat < tx_deconcat_system_test_bench.unformatted_vhdl > tx_deconcat_system_test_bench.vhdl

# build testbench and ghdl executable
# note the use of libVhpi in building the testbench.
vhdlsim: ./hw/tx_deconcat_system.vhdl tx_deconcat_system_test_bench.vhdl $(TESTBENCH)/testbench.c vhdlCStubs.h vhdlCStubs.c
	gcc -c vhdlCStubs.c  -I$(SRC) -I./ -I$(AHIR_INCLUDE)
	gcc -c $(TESTBENCH)/testbench.c -I$(AHIR_INCLUDE) -I$(SRC) -I./
	gcc -o testbench_hw testbench.o vhdlCStubs.o  -L$(AHIR_LIB) -lSocketLibPipeHandler -lpthread
	ghdl --clean
	ghdl --remove
	ghdl -i --work=GhdlLink  $(VHDL_LIB)/GhdlLink.vhdl
	ghdl -i --work=aHiR_ieee_proposed  $(VHDL_LIB)/aHiR_ieee_proposed.vhdl
	ghdl -i --work=ahir  $(VHDL_LIB)/ahir.vhdl
	ghdl -i --work=work ./hw/tx_deconcat_system_global_package.vhdl
	ghdl -i --work=work ./hw/tx_deconcat_system.vhdl
	ghdl -i --work=work tx_deconcat_system_test_bench.vhdl
	ghdl -m --work=work -Wl,-L$(AHIR_LIB) -Wl,-lVhpi tx_deconcat_system_test_bench 
swtb:  $(TESTBENCH)/*.c 
	gcc -c $(TESTBENCH)/testbench.c -DAA2C -I ./ -I $(AHIR_INCLUDE) -o testbench.o
	gcc -c aa_c_model.c -DAA2C -I ./ -I $(AHIR_INCLUDE)
	gcc -o testbench_sw testbench.o aa_c_model.o -L$(AHIR_LIB) -lBitVectors -lSockPipes -lPipeHandlerDebugPthreads -lpthread

clean:
	rm -rf *.o* *.cf *.*vhdl vhdlCStubs.* *.vcd in_data* out_data* testbench_sw testbench_hw nic_test_bench vhpi.log *.aa *.vc *.lso xst *.ngc *_xmsgs *.xrpt pipeHandler.log *.srp *.ghw *.dot ahir_system.s *.log aa_c_model.c  aa_c_model.h  aa_c_model_internal.h PREFIX *.trace .gsi.aa

PHONY: all clean	
