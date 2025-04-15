#
## This makefile only builds the VHDL for shift_reg_2!
#
#
PIPES=../pipes.aa  ../signals.aa 

all: nic_mac_bridge.hsys  $(PIPES)
	buildHierarchicalModel.py  -s ghdl -a nic_mac_bridge_nic_mac_bridge_lib -H $(PIPES)


clean:
	rm -rf lib/*.a objsw/*.o vhdl/  aa2c/*.* *.c *.h *.txt *.log


PHONY: all clean tests
