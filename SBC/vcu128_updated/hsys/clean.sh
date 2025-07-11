#!/bin/bash
# clean up
buildHierarchicalModel.py -R -a sbc_vcu128_core_sbc_vcu128_core_lib
rm -rf objsw/*
rm -rf lib/*
rm -f __UFQ.TXT
rm -f *.log
rm -f aa2c/*
rm -f executed_command*
rm -rf ./objsw
rm -rf ./aa2c
rm -rf ./lib
