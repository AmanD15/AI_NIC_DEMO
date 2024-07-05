#
## This makefile only builds the VHDL for shift_reg_2!
#
#
PIPES=../pipes.aa  ../signals.aa 

all: spi_flash_controller.hsys  $(PIPES) 
	buildHierarchicalModel.py  -s ghdl -a spi_flash_controller_spi_flash_controller_lib -H -J ../GlueModules/GlueModules.hsys $(PIPES) 


clean:
	rm -rf lib/*.a objsw/*.o vhdl/*  aa2c/*.* *.c *.h *.txt *.log


PHONY: all clean tests
