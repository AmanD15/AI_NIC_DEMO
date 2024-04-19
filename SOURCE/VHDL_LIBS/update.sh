#!/bin/bash
rm *.vhd* *_VERSION
CWD=$(pwd)
cd $AHIR_RELEASE 
git log -n 1 >> $CWD/AHIR_VERSION
cp $AHIR_RELEASE/vhdl/*.vhd* $CWD/
cd $CWD
cd $AJIT_PROJECT_HOME/processor/vhdl/lib
git log -n 1 >> $CWD/AJIT_VERSION
cp *.vhd* $CWD/
cd $AJIT_PROJECT_HOME/processor/Aa_v3/modules/lib
cp *.vhd* $CWD/
cd $CWD
