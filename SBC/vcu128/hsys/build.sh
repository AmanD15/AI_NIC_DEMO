#!/bin/bash
rm -rf aa2c lib vhdl

mkdir aa2c
mkdir lib
mkdir vhdl

PARAMETERS=""
PIPES="pipes.aa ./nic_subsystem/pipes.aa"
SIGNALS="signals.aa ./nic_subsystem/signals.aa"
# 
# -D means generate debug versions of the aa2c and vhdl
# -M execute all Makefiles in this directory and its subdirectories.
# -u uniquify all instances in the aa2c code (VHDL is always uniquified).
# -H hierarchically expand all the hsys files (go to the leaves!)
# -C generate aa2c model
# -s ghdl (simulator is ghdl)
#
# The final model uses shift_register_lib as a prefix..
#
buildHierarchicalModel.py -M -u -H -s ghdl  -a  sbc_vcu128_core_sbc_vcu128_core_lib -J ./GlueModules/GlueModules.hsys -I$AHIR_RELEASE/include $PARAMETERS $PIPES $SIGNALS



