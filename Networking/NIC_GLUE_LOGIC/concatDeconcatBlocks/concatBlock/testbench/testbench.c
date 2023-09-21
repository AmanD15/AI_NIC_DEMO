
#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
//
// AHIR release utilities
//
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>

// These will wait.
#ifndef COMPILE_TEST_ONLY
#ifndef AA2C
	#include "vhdlCStubs.h"
#else
	#include "aa_c_model.h"
#endif
#endif

uint8_t packet[24] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
 
char __err_flag__ = 0;

void sender()
{
	int pkt_size = 22;
	int pkt_cnt = 0;
	while(pkt_cnt < 11)	
	{
		int i;
		for(i = 0; i < pkt_size; i++)
		{
			uint16_t datatosend;
			//datatosend = (i == pkt_size - 1) ? (((uint16_t)packet[i] << 1) | (1 << 9)) : ((uint16_t)packet[i] << 1);
			datatosend = (i == pkt_size - 1) ? (((uint16_t)(i+1) << 1) | (1 << 9)) : ((uint16_t)(i+1) << 1);
			write_uint16("inpipe",datatosend);
		}
			pkt_cnt++;
			pkt_size++;
	}
}
DEFINE_THREAD(sender);

void receiver()
{
	int pkt_cnt = 0;
	uint64_t data0, data1;
	while(pkt_cnt < 10)
	{
		data0 = read_uint64("outpipe0");
		data1 = read_uint64("outpipe1");
		fprintf(stderr,"data0 = 0x%lx\t data1 = 0x%lx\n", data0,data1);

	}
}
DEFINE_THREAD(receiver);

int main(int argc, char* argv[])
{

	if(argc < 2)
	{
		fprintf(stderr,"Usage: %s [trace-file] \n trace-file=null for no trace, stdout for stdout\n", 
				argv[0]);
		return(1);
	}

	FILE* fp = NULL;
	if(strcmp(argv[1],"stdout") == 0)
	{
		fp = stdout;
	}
	else if(strcmp(argv[1], "null") != 0)
	{
		fp = fopen(argv[1],"w");
		if(fp == NULL)
		{
			fprintf(stderr,"Error: could not open trace file %s\n", argv[1]);
			return(1);
		}
	}

#ifndef COMPILE_TEST_ONLY
#ifdef AA2C
	init_pipe_handler();
	start_daemons (fp,0);
#endif
#endif
	
	PTHREAD_DECL(sender);
	PTHREAD_CREATE(sender);

	PTHREAD_DECL(receiver);
	PTHREAD_CREATE(receiver);

	PTHREAD_JOIN(receiver);

	if(__err_flag__)
	{
		fprintf(stderr,"\nFAILURE.. there were errors\n");
	}
	return(0);
}
