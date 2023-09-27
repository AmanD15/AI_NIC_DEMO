#
## This makefile is for building dualClockFifos
#
#


all: dualClockFifo.hsys  $(PIPES)
	buildHierarchicalModel.py  -s ghdl -a DualClockedQueue_DualClockedQueue_lib -H 


clean:
	rm -rf lib/*.a objsw/*.o vhdl/*  aa2c/*.* *.c *.h *.txt *.log


PHONY: all clean tests
