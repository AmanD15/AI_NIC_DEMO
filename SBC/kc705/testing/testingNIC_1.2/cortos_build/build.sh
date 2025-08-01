
# This is a bash script to build the cortos project.
# It generates a mmap file which is used in the `run_cmodel.sh`,
# to run the program on the C simulator.

_MAIN="main";
_CORTOS_SRC_DIR="cortos_src";

_CORTOS_VMAP="$_CORTOS_SRC_DIR/vmap.txt";
_LINKER_SCRIPT="$_CORTOS_SRC_DIR/LinkerScript.txt";

_PT="$AJIT_MINIMAL_PRINTF_TIMER";
_AAR_MT="$AJIT_ACCESS_ROUTINES_MT";
_AAR="$AJIT_ACCESS_ROUTINES";
# False
compileToSparcUclibc.py \
  -o 2 \
  -V ${_CORTOS_VMAP} \
  -I ${AJIT_UCLIBC_HEADERS_DIR} \
  -I ${AJIT_LIBGCC_INSTALL_DIR}/include \
  -I . \
  -I .. \
  -I ${_CORTOS_SRC_DIR} \
  -I ${_AAR_MT}/include \
  -I ${_PT}/include \
  -S .. \
  -S ${_CORTOS_SRC_DIR} \
  -s ${_AAR_MT}/asm/clear_stack_pointers.s \
  -s ${_AAR_MT}/asm/generic_isr_mt.s \
  -s ${_AAR_MT}/asm/generic_sw_trap_mt.s \
  -s ${_AAR_MT}/asm/generic_sys_calls.s \
  -C .. \
  -C ${_CORTOS_SRC_DIR} \
  -C ${_AAR_MT}/src \
  -N ${_MAIN} \
  -L ${_LINKER_SCRIPT} \
  -D AJIT \
  -U \
  -D USE_VMAP -D USE_CORTOS -c $AJIT_HOME/AI_NIC_DEMO/SBC/kc705/testing/testingNIC_1.2/main.c -I $AJIT_HOME/AI_NIC_DEMO/Networking/NIC_1.2/driver/include -C $AJIT_HOME/AI_NIC_DEMO/Networking/NIC_1.2/driver/src;

#  -s ${_AAR_MT}/asm/clear_stack_pointers.s \
#  -s ${_AAR_MT}/asm/trap_handlers_for_rtos.s \
#  -s ${_AAR_MT}/asm/generic_isr_mt.s \
#  -s ${_AAR_MT}/asm/generic_sw_trap_mt.s \
#  -C ${_AAR}/src \
#  -S ${_AAR_MT}/asm \
