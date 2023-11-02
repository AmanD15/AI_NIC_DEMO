source /home/aiml/digitalbashrc
source /home/aiml/my-xil-dir/Vivado/2017.1/settings64.sh
CWD=$(pwd)
# untar the edn file.
cd ../../../SOURCE/EDIF
tar -zxvf processor_1x1x32.vanilla.with_sgi_fix.edn.tgz
cd $CWD
# run the synthesis
vivado -mode batch -source bitgen.tcl
