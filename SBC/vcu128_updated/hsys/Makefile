#
## This makefile is for building processor subsystem
#
#
PIPES=./pipes.aa  ./signals.aa ./nic_subsystem/pipes.aa ./nic_subsystem/signals.aa 

all: sbc_vcu128.hsys  $(PIPES)
	buildHierarchicalModel.py  -s ghdl -a sbc_vcu128_core_sbc_vcu128_core_lib -H -J ./GlueModules/GlueModules.hsys $(PIPES)


clean:
	rm -rf lib/*.a objsw/*.o vhdl/  aa2c/*.* *.c *.h *.txt *.log


PHONY: all clean tests
