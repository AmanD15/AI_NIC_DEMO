CWD=$(pwd)
cd tester
make
cd $CWD
cd nic
make
cd $CWD
cd nic_mac_bridge
make
cd $CWD
rm -rf vhdl
mkdir vhdl
hierSys2Vhdl -s ghdl -o vhdl ../src/signals.aa pipes.aa GlueModules/GlueModules.hsys nic/nic.hsys tester/tester.hsys nic_mac_bridge/nic_mac_bridge.hsys  ./test_system.hsys 
formatVhdlFiles.py vhdl
cd $CWD
cd tb
./compile.sh
cd $CWD
cd ghdl
. ghdl.do
cd $CWD
