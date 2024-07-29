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


	int8_t I,J;

	for(I = 0; I < ORDER; I++)
	{
		for(J = 0; J < ORDER; J++)
		{
			setAValue (I, J, 1);
			fprintf(stderr,"set A[%d][%d] = 1\n", I, J);
		}
		setBValue (I,1);
		fprintf(stderr,"set B[%d] = 1\n", I);
	}

	compute_matrix_vector_product ();		
	fprintf(stderr,"Finished product.\n");

	for(I = 0; I < ORDER; I++)
	{
		fprintf(stdout,"Result[%d] = 0x%x.\n", I, getResult(I));
	}
	return(0);
}
