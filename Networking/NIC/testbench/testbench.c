// Testbench for testing design of NIC.
//--------------------------------------
//	This testbench aims for travel of a single packet(say ping)
//		through designed NIC.
//
// General Includes
#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<pthread.h>

#include<pthreadUtils.h>
#include<Pipes.h>
#include<pipeHandler.h>

// comment this while compiling only c code.	
#ifndef COMPILE_TEST_ONLY
#ifndef AA2C
	#include "vhdlCStubs.h"
#else
	#include "aa_c_model.h"
#endif
#endif

// Algorithm :
//	step1:	Initialise all queues and write data to peripheral bus(algortihm) 
//	step2:	MAC_to_NIC thread generates packet and starts sending it to tester.aa(pipes)
//	step2:	Memory thread reads req_pipes and generate appropriate resp.
//	step2:	Processor thread reads rx_queue's data and writes it to tx_queue
//	step3:	NIC_to_MAC thread reads pipe/s and checks if the received data is same as
//			sent data.
//
//  The MAC -> NIC connection should operate at full speed during the test.

// Local includes
#include "header.h"
#include "MAC.c"
#include "Memory_8.c"
#include "Processor.c"
#include "register_config.c"
//#include "InterfaceDataStructures_Utils.h"

// cpu thread
void cpu_thread(){
	cpu_model();
}DEFINE_THREAD(cpu_thread);


// mac threads
// tx thread
void mac_tx_thread(){
	macToNicData();
}DEFINE_THREAD(mac_tx_thread);

// rc thread
void mac_rx_thread(){
	nicToMacData();
}DEFINE_THREAD(mac_rx_thread);

int __err_flg_ = 0;

int main(int argc, char *argv[])
{	
	if(argc < 2)
	{
		fprintf(stderr,"Usage: %s [trace-file]\n trace-file=null,"
			" for no trace, stdout for stdout\n",argv[0]);
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
			fprintf(stderr,"Error: could not open trace file %s \n",argv[1]);
			return(1);
		}
	}
// comment this while compiling only c code.	
#ifndef COMPILE_TEST_ONLY
#ifdef AA2C
	init_pipe_handler();
	start_daemons(fp,0);
#endif
#endif

	// register tb pipes.
	// comment this while compiling only c code.	
	//register_pipes();
	// declare threads
	PTHREAD_DECL(mac_enable_checker);
	PTHREAD_DECL(cpu_thread);
	PTHREAD_DECL(nicMemoryServiceDaemon);
	PTHREAD_DECL(cpuMemoryServiceDaemon);
	PTHREAD_DECL(mac_tx_thread);
	PTHREAD_DECL(mac_rx_thread);
	
	// create threads
	PTHREAD_CREATE(mac_enable_checker);
	PTHREAD_CREATE(cpu_thread);
	PTHREAD_CREATE(nicMemoryServiceDaemon);
	PTHREAD_CREATE(cpuMemoryServiceDaemon);
	PTHREAD_CREATE(mac_tx_thread);
	PTHREAD_CREATE(mac_rx_thread);
	
	// wait 
	PTHREAD_JOIN(mac_rx_thread);
	fprintf(stderr,"mac_rx breaked\n");
	return;
	PTHREAD_JOIN(nicMemoryServiceDaemon);
	PTHREAD_JOIN(cpuMemoryServiceDaemon);
	PTHREAD_JOIN(cpu_thread);
	PTHREAD_JOIN(mac_tx_thread);

	if(!__err_flg_){
		fprintf(stderr,"\n\nSUCCESS...!!!\n\n");
	}
}
