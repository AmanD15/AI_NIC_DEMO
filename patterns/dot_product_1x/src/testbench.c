#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <pipeHandler.h>
#ifndef SW
#include "vhdlCStubs.h"
#endif

#define ORDER 16

void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}



int main(int argc, char* argv[])
{

	signal(SIGINT,  Exit);
  	signal(SIGTERM, Exit);


	int8_t I;

	for(I = 0; I < ORDER; I++)
	{
		setAValue (I,I);
		setBValue (I,1);
	}
	
	int8_t result = compute_dot_product ();		

	fprintf(stdout,"Result = 0x%x.\n", result);
	return(0);
}
