# build software version of testbench (to check the "desired behaviour")
AHIR_INCLUDE=$(AHIR_RELEASE)/include
AHIR_LIB=$(AHIR_RELEASE)/lib
VHDL_LIB=$(AHIR_RELEASE)/vhdl
VHDL_VHPI_LIB=$(AHIR_RELEASE)/CtestBench/vhdl
FUNCTIONLIB=$(AHIR_RELEASE)/functionLibrary/
SRC=../../src
TESTBENCH=$(SRC)/../testbench
all: HW SW 
TOVC:aalink aa2vc 
VC2VHDL: vc2vhdl  vhdlsim
AA2VHDLSIM: aa2vc  vc2vhdl  vhdlsim
TOVHDL:TOVC vc2vhdl

TOPMODULES=-T ReceiveEngineDaemon -T nicRxFromMacDaemon -T TransmitEngineDaemon -T controlDaemon -T free_queue_daemon -T receive_queue_daemon -T transmit_queue_daemon  -T queueTestDaemon



# five steps from C to vhdl simulator.
HW: aalink aa2vc  vc2vhdl  
SW: aalink aa2c aa2vc 
AA2VHDL: aa2vc vc2vhdl 

# Aa to vC
aalink: $(SRC)/*.aa 
	AaLinkExtMem $(SRC)/parameters.aa $(SRC)/decls.aa $(SRC)/pipes.aa $(SRC)/signals.aa $(SRC)/control.aa $(SRC)/general_utils.aa $(SRC)/memory_utils.aa $(SRC)/queue_utils.aa $(SRC)/register_utils.aa $(SRC)/rx_from_mac.aa $(SRC)/receive_engine.aa $(SRC)/transmit_engine.aa $(SRC)/free_queue.aa $(SRC)/receive_queue.aa $(SRC)/transmit_queue.aa | vcFormat > nic.linked.aa
	AaOpt -B nic.linked.aa | vcFormat > nic.linked.opt.aa

aa2c : nic.linked.opt.aa
	Aa2C $(TOPMODULES) nic.linked.opt.aa -o ./

aa2vc: nic.linked.opt.aa
	Aa2VC -O -C nic.linked.opt.aa | vcFormat > nic.vc

# vC to VHDL
vc2vhdl: nic.vc
	rm -rf vhdl
	mkdir vhdl
	mkdir vhdl/nic_lib
	#-D -O -S 4 -I 2 -v -a -C -e
	vc2vhdl -H -U  -O -a -C -e nic -W nic_lib -w -s ghdl $(TOPMODULES) -f nic.vc -L $(FUNCTIONLIB)/fpu.list
	vhdlFormat < nic_global_package.unformatted_vhdl > vhdl/nic_lib/nic_global_package.vhdl
	vhdlFormat < nic.unformatted_vhdl > vhdl/nic_lib/nic.vhdl
	vhdlFormat < nic_test_bench.unformatted_vhdl > vhdl/nic_lib/nic_test_bench.vhdl

# make clean and then make ahir_system
ahir_system: 
	AaLinkExtMem $(SRC)/decls.aa $(SRC)/pipes.aa $(SRC)/signals.aa $(SRC)/control.aa $(SRC)/general_utils.aa $(SRC)/memory_utils.aa $(SRC)/queue_utils.aa $(SRC)/register_utils.aa $(SRC)/rx_from_mac.aa $(SRC)/receive_engine.aa $(SRC)/transmit_engine.aa $(SRC)/free_queue.aa $(SRC)/receive_queue.aa $(SRC)/transmit_queue.aa | vcFormat > nic.linked.ahir.system.aa
	AaOpt -B nic.linked.ahir.system.aa | vcFormat > nic.linked.ahir.system.opt.aa
	Aa2C $(TOPMODULES) nic.linked.ahir.system.aa -o ./
	Aa2VC -O -C nic.linked.ahir.system.opt.aa | vcFormat > nic.ahir.system.vc
	vc2vhdl -U  -O -v -a -C -e ahir_system -w -s ghdl $(TOPMODULES) -f nic.ahir.system.vc -L $(FUNCTIONLIB)/fpu.list
	vhdlFormat < ahir_system_global_package.unformatted_vhdl > ahir_system_global_package.vhdl
	vhdlFormat < ahir_system.unformatted_vhdl > nic.vhdl

clean:
	rm -rf *.o* *.cf *.*vhdl vhdlCStubs.* *.vcd in_data* out_data* testbench_sw testbench_hw ahir_system_test_bench vhpi.log *.aa *.vc *.lso xst *.ngc *_xmsgs *.xrpt pipeHandler.log *.srp *.ghw *.dot ahir_system.s *.log aa_c_model.c  aa_c_model.h  aa_c_model_internal.h PREFIX *.trace .gsi.aa *.hsys vhdl

PHONY: all clean	
