# only to check if the tb compiles ok.
gcc -o tb_compile_test_only  -I $AHIR_RELEASE/include testbench.c -I ./ -L $AHIR_RELEASE/lib -lPipeHandler -lBitVectors -lpthread -DAA2C
