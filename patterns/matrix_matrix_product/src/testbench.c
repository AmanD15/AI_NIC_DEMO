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

#define ORDER 32

void Exit(int sig)
{
	fprintf(stderr, "## Break! ##\n");
	exit(0);
}



int main(int argc, char* argv[])
{

	signal(SIGINT,  Exit);
  	signal(SIGTERM, Exit);


	int8_t I,J;

	for(I = 0; I < ORDER; I++)
	{
		for(J = 0; J < ORDER; J++)
		{
			setAValue (I, J, 1);
			fprintf(stderr,"set A[%d][%d] = 1\n", I, J);

			setBValue (I, J, 1);
			fprintf(stderr,"set B[%d][%d] = 1\n", I, J);
		}
	}

	compute_matrix_product ();		
	fprintf(stderr,"Finished product.\n");

	for(I = 0; I < ORDER; I++)
	{
		for(J = 0; J < ORDER; J++)
		{
			fprintf(stdout,"Result[%d][%d] = 0x%x.\n", I, J, getResult(I, J));
		}
	}
	return(0);
}
