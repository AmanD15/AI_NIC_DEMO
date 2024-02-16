CWD=$(pwd)
cd tester
make
cd $CWD
cd nic
make
cd $CWD
rm -rf vhdl
mkdir vhdl
hierSys2Vhdl -s ghdl -o vhdl pipes.aa GlueModules/GlueModules.hsys nic/nic.hsys tester/tester.hsys  ./test_system.hsys
formatVhdlFiles.py vhdl
