#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>

#include <string.h>
#include "Pipes.h"
#include "pipeHandler.h"
#include "pthreadUtils.h"
#include "nic_driver.h"
#include "tb_queue.h"



uint32_t accessNicReg (uint8_t rwbar, uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	// command format
	// unused nic-id  unused  rwbar  index   value
	//   8      8        7      1       8     32
	uint64_t cmd = (((uint64_t) nic_id) << 48) | (((uint64_t) rwbar) << 40) | (((uint64_t) reg_index) << 32) | reg_value;
	write_uint64 ("tb_to_nic_slave_request", cmd);
	uint32_t retval = read_uint32 ("nic_slave_response_to_tb");
	
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: accessNicReg rwbar=%d, nic_id = %d, reg_index=%d, write_reg_value=0x%x, read_reg_value=0x%x\n",
					rwbar, nic_id, reg_index, reg_value, retval);
#endif
	return(retval);
}

void writeToNicReg (uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	accessNicReg (0, nic_id, reg_index, reg_value);	
}

uint32_t readFromNicReg (uint32_t nic_id, uint32_t reg_index)
{
	uint32_t retval = accessNicReg (1, nic_id, reg_index, 0);	
	return(retval);
}



int main(int argc, char* argv[])
{
	int err_flag = 0;
	
	fprintf (stderr,"Info: setting number of servers enabled to %d \n", NSERVERS);
	// set the number of servers in the nic
	setNumberOfServersInNic(NIC_ID, NSERVERS);
#ifdef DEBUGPRINT
	fprintf (stderr,"Info: set number of servers enabled\n");
	// get the number of servers in the nic
	uint32_t servers_enabled = getNumberOfServersInNic(NIC_ID);
	fprintf (stderr,"Info: reading from register, number of servers enabled = %d \n", servers_enabled);
#endif

	fprintf (stderr,"Info: setting number of buffers in each queue to %d \n", NBUFFERS);
	// set the number of buffers in the queue
	setNumberOfBuffersInQueue(NIC_ID, NBUFFERS);
#ifdef DEBUGPRINT
	fprintf (stderr,"Info: set number of buffers in each queue\n");
	// get the number of buffers in the queue
	uint32_t buffers_in_queue = getNumberOfBuffersInQueue(NIC_ID);
	fprintf (stderr,"Info: reading from register, number of buffers in each queue = %d \n", buffers_in_queue);
#endif
	
	fprintf (stderr,"Info: resetting status registers\n");
	// reset the free queue status registers
	setStatusOfQueuesInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE, INITIAL_STATUS);
#ifdef DEBUGPRINT
	fprintf (stderr,"Info: reset free queue status register\n");
	uint32_t freeQ_status_value = getStatusOfQueuesInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE);
	fprintf (stderr,"Info: reading from register, free queue status register value = %d \n", freeQ_status_value);
#endif
	
	int s_id;
	for(s_id = 0; s_id < NSERVERS; s_id++)
	{
		// reset the RX queue status registers for all 4 servers
		setStatusOfQueuesInNic (NIC_ID, s_id, RXQUEUE, INITIAL_STATUS);
#ifdef DEBUGPRINT
		fprintf (stderr,"Info: reset Rx queue status register for server %d \n", s_id);
		uint32_t RxQ_status_value = getStatusOfQueuesInNic (NIC_ID, s_id, RXQUEUE);
		fprintf (stderr,"Info: reading from register, Rx queue status register value for server %d = %d \n", s_id, RxQ_status_value);
#endif
		
		// reset the TX queue status registers for all 4 servers
		setStatusOfQueuesInNic (NIC_ID, s_id, TXQUEUE, INITIAL_STATUS);
#ifdef DEBUGPRINT
		fprintf (stderr,"Info: reset Tx queue status register for server %d \n", s_id);
		uint32_t TxQ_status_value = getStatusOfQueuesInNic (NIC_ID, s_id, TXQUEUE);
		fprintf (stderr,"Info: reading from register, Tx queue status register value for server %d = %d \n", s_id, TxQ_status_value);
#endif
	}
	
	
#ifdef CHECK_QUEUES
	int cq_err = 0;
	// checking free queue using lock-push/pop-unlock operations
	cq_err = checkQueues(FREEQUEUE, FQ_SERVER_ID);
		if(cq_err)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d failed.\n", FREEQUEUE, FQ_SERVER_ID);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueues queue %d server %d done (ret=%d)!\n", FREEQUEUE, FQ_SERVER_ID, cq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	
	for(s_id = 0; s_id < NSERVERS; s_id++)
	{
		// checking Rx queue using push/pop operations for all 4 servers
		cq_err = checkQueues(RXQUEUE, s_id);
		if(cq_err)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d failed.\n", RXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueues queue %d server %d done (ret=%d)!\n", RXQUEUE, s_id, cq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");

		// checking Tx queue using push/pop operations for all 4 servers
		cq_err = checkQueues(TXQUEUE, s_id);
		if(cq_err)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d failed.\n", TXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueues queue %d server %d done (ret=%d)!\n", TXQUEUE, s_id, cq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	}
#endif
	
	
#ifdef DEBUG_QUEUES
	int dq_err = 0;
	// checking freeQ using push (w/o lock-unlock) from NIC side through debug queue pipes
	dq_err = debugQueues(FREEQUEUE, FQ_SERVER_ID);
	if(dq_err)
	{
		fprintf(stderr,"Error: debugCheckQueues queue %d server %d failed.\n", FREEQUEUE, FQ_SERVER_ID);
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: debugCheckQueues queue %d server %d done (ret=%d)!\n", FREEQUEUE, FQ_SERVER_ID, dq_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	// checking free using pop (w/o lock-unlock) from NIC side through debug queue pipes
	dq_err = debugQueuesInReverse(FREEQUEUE, FQ_SERVER_ID);
	if(dq_err)
	{
		fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d failed.\n", FREEQUEUE, FQ_SERVER_ID);
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: debugCheckQueuesInReverse queue %d server %d done (ret=%d)!\n", FREEQUEUE, FQ_SERVER_ID, dq_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	for(s_id = 0; s_id < NSERVERS; s_id++)
	{
		// checking Rx queue using push from NIC side through debug queue pipes for all 4 servers
		dq_err = debugQueues(RXQUEUE, s_id);
		if(dq_err)
		{
			fprintf(stderr,"Error: debugCheckQueues queue %d server %d failed.\n", RXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: debugCheckQueues queue %d server %d done (ret=%d)!\n", RXQUEUE, s_id, dq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");

		// checking Rx queue using pop from NIC side through debug queue pipes for all 4 servers
		dq_err = debugQueuesInReverse(RXQUEUE, s_id);
		if(dq_err)
		{
			fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d failed.\n", RXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: debugCheckQueuesInReverse queue %d server %d done (ret=%d)!\n", RXQUEUE, s_id, dq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		
		// checking Tx queue using push from NIC side through debug queue pipes for all 4 servers
		dq_err = debugQueues(TXQUEUE, s_id);
		if(dq_err)
		{
			fprintf(stderr,"Error: debugCheckQueues queue %d server %d failed.\n", TXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: debugCheckQueues queue %d server %d done (ret=%d)!\n", TXQUEUE, s_id, dq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");

		// checking Tx queue using pop from NIC side through debug queue pipes for all 4 servers
		dq_err = debugQueuesInReverse(TXQUEUE, s_id);
		if(dq_err)
		{
			fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d failed.\n", TXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: debugCheckQueuesInReverse queue %d server %d done (ret=%d)!\n", TXQUEUE, s_id, dq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	}
#endif
	
	
#ifdef CHECK_QUEUE_SEQUENCE
	int cqs_err = 0;
	// Mimics and checks queue sequencing operations from processor side
	cqs_err = checkQueueSequence ();
	if(cqs_err)
	{
		fprintf(stderr,"Error: checkQueueSequence failed.\n");
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueueSequence done (ret=%d)!\n", cqs_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
#endif
	
	
#ifdef DEBUG_QUEUE_SEQUENCE
	int dqs_err = 0;
	// Mimics and checks queue sequencing operations from NIC side
	dqs_err = debugQueueSequence ();
	if(dqs_err)
	{
		fprintf(stderr,"Error: debugQueueSequence failed.\n");
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: debugQueueSequence done (ret=%d)!\n", dqs_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
#endif
	
	return(err_flag);
}

