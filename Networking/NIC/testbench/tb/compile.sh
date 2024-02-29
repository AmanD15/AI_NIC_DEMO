gcc -g -o bin/tb -I $AHIR_RELEASE/include -I ../../driver/include -I include src/tb_queue.c src/tb.c  -L $AHIR_RELEASE/lib -lSocketLibPipeHandler -lpthread -l SockPipes 
