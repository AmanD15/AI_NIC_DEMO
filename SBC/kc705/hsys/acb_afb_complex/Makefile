#
## This makefile only builds the VHDL for shift_reg_2!
#
#
PIPES=../pipes.aa  ../signals.aa 

all: acb_afb_complex.hsys  $(PIPES)
	buildHierarchicalModel.py  -s ghdl -a acb_afb_complex_acb_afb_complex_lib -H -J ../GlueModules/GlueModules.hsys $(PIPES)


clean:
	rm -rf lib/*.a objsw/*.o vhdl/*  aa2c/*.* *.c *.h *.txt *.log


PHONY: all clean tests
