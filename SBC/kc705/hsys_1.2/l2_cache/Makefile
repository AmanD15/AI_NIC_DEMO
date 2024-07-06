#
## This makefile is for building l2cache subsystem
#
#
PIPES=../pipes.aa  ../signals.aa 

all: l2_cache.hsys  $(PIPES)
	buildHierarchicalModel.py  -s ghdl -a ajit_processor_ajit_processor_lib -H $(PIPES)


clean:
	rm -rf lib/*.a objsw/*.o vhdl/*  aa2c/*.* *.c *.h *.txt *.log


PHONY: all clean tests
