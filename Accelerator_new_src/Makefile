
# build software version of testbench (to check the "desired behaviour")
AHIR_INCLUDE=$(AHIR_RELEASE)/include
AHIR_LIB=$(AHIR_RELEASE)/lib

SOCKETLIB_INCLUDE=$(AHIR_INCLUDE)
SOCKETLIB_LIB=$(AHIR_LIB)

PIPEHANDLER_INCLUDE=$(AHIR_INCLUDE)
PIPEHANDLER_LIB=$(AHIR_LIB)
PTHREADUTILS_INCLUDE=$(AHIR_INCLUDE)
VHDL_LIB=$(AHIR_RELEASE)/vhdl

#SIZED_TENSOR=../../../C/primitives/include
SRC=./src

all: AA2VHDL 
LLVM2AAOPTS=-extract_do_while=true --storageinit=true -pipedepths=pipedepths.txt
#LLVM2AAOPTS=--storageinit=true

MODULES=./src/acc_proc_test/pipes.aa ./src/accelerator_processor_interface_test3.aa ./src/readWriteModules.aa ./src/fp_enhanced.aa ./src/gen_latest.aa
# src/concat/concat.aa src/convTranspose/ct_core.aa
INCLUDES=-Isrc/ConvAll 
# -Isrc/concat -Isrc/convTranspose

#PROGDEFS=-DUNROLLED
PROGDEFS=
# -T timerDaemon
TOPMODULES_ACC= -T accelerator_control_daemon -T accelerator_worker_daemon -T accelerator_interrupt_daemon  -T timerDaemon
# TOPMODULES_NIC= -T ReceiveEngineDaemon -T nicRxFromMacDaemon -T transmitEngineDaemon -T SoftwareRegisterAccessDaemon -T NicRegisterAccessDaemon
# TOPMODULES_P= -T ethernet_programmer
#TOPMODULES=  -T ReceiveEngineDaemon -T nicRxFromMacDaemon -T transmitEngineDaemon -T SoftwareRegisterAccessDaemon -T NicRegisterAccessDaemon -T ethernet_programmer

# five steps from C to vhdl simulator.
HW: c2llvmbc llvmbc2aa  aalink aa2vc  vc2vhdl
AA2VHDL: aalink aa2vc vc2vhdl
AA2C : c2llvmbc llvmbc2aa aalink aa2c aa2cbuild

# C to llvm byte-code.. use clang.
c2llvmbc: src/prog.c
	clang -O3 -m32 -std=gnu89 $(PROGDEFS)  -I$(SOCKETLIB_INCLUDE) -emit-llvm -c src/prog.c  $(INCLUDES)
	opt --indvars --loopsimplify prog.o -o prog.opt.o
	llvm-dis prog.opt.o

# llvm byte-code to Aa..
llvmbc2aa:  prog.opt.o 
	llvm2aa $(LLVM2AAOPTS)  prog.opt.o | vcFormat >  prog.aa

# link and optimize
# AaPreprocess -I src/ConvAll src/ConvAll/conv_macro.aa -o src/ConvAll/conv_compiled.aa
# aalink: src/timer.aa prog.aa $(MODULES)
# 	AaPreprocess -I src/ConvAll src/ConvAll/conv_macro.aa -o src/ConvAll/conv_compiled.aa
# 	AaLinkExtMem prog.aa src/timer.aa src/decl.aa $(MODULES) | vcFormat > prog.linked.aa
# 	AaOpt -C prog.linked.aa | vcFormat > prog.linked.C.opt.aa
# 	AaOpt -B prog.linked.C.opt.aa | vcFormat > prog.linked.opt.aa
aalink: src/timer.aa  $(MODULES)
	AaLinkExtMem src/timer.aa src/decl.aa $(MODULES) | vcFormat > prog.linked.aa
	AaOpt -C prog.linked.aa | vcFormat > prog.linked.C.opt.aa
	AaOpt -B prog.linked.C.opt.aa | vcFormat > prog.linked.opt.aa

# Aa to vC
aa2vc: prog.linked.opt.aa
	Aa2VC -O -C prog.linked.opt.aa | vcFormat > prog.vc

# vC to VHDL
vc2vhdl: prog.vc
	vc2vhdl -S 4 -O -I 8 -a -C -e ai_ml_engine -w -s ghdl $(TOPMODULES_ACC) -f prog.vc # -L src/lib/AiMlAddons.list
	vhdlFormat < ai_ml_engine_global_package.unformatted_vhdl > ai_ml_engine_global_package.vhdl
	vhdlFormat < ai_ml_engine.unformatted_vhdl > ai_ml_engine.vhdl
	rm -f *unformatted_vhdl
# vc2vhdl -S 4 -O -I 8 -a -C -e nic_system -w -s ghdl $(TOPMODULES_NIC) -f prog.vc # -L src/lib/AiMlAddons.list
# vhdlFormat < nic_system.unformatted_vhdl > nic_system.vhdl
# vhdlFormat < nic_system_global_package.unformatted_vhdl > nic_system_global_package.vhdl
# vc2vhdl -S 4 -O -I 8 -a -C -e ethernet_boot -w -s ghdl $(TOPMODULES_P) -f prog.vc # -L src/lib/AiMlAddons.list
# vhdlFormat < ethernet_boot.unformatted_vhdl > ethernet_boot.vhdl
# vhdlFormat < ethernet_boot_global_package.unformatted_vhdl > ethernet_boot_global_package.vhdl
	

clean:
	rm -rf *.o* *.cf *.*vhdl vhdlCStubs.* *.vcd in_data* out_data* testbench_sw testbench_hw ahir_system_test_bench vhpi.log *.vc *.lso xst *.dot *.aa

PHONY: all clean
