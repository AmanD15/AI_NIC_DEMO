CWD=$(pwd)
cd tester
make clean
cd $CWD
cd nic
make clean
cd $CWD
cd nic_mac_bridge
make clean
cd $CWD
rm -rf vhdl
cd ghdl
rm -f *.o *.cf
cd $CWD
