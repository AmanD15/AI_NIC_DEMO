#
## This makefile only builds the VHDL for shift_reg_2!
#
#
PIPES=./pipes.aa  ./signals.aa 

all: nic_subsystem.hsys  $(PIPES)
	buildHierarchicalModel.py  -s ghdl -a nic_subsystem_nic_subsystem_lib -H $(PIPES)


clean:
	rm -rf lib/*.a objsw/*.o vhdl/*  aa2c/*.* *.c *.h *.txt *.log


PHONY: all clean tests
