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


#define NSERVERS 4		// number of servers enabled (max = 4);	from server_id 0 to (max-1) 
#define NBUFFERS 64  		// number of buffer pointers in each queue (max 64 for current hardware)

const uint32_t NIC_ID = 0;
const uint32_t FQ_SERVER_ID = 0;
const uint32_t INITIAL_STATUS = 0;


uint32_t accessNicReg (uint8_t rwbar, uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	// command format
	// unused nic-id  unused  rwbar  index   value
	//   8      8        7      1       8     32
	uint64_t cmd = (((uint64_t) nic_id) << 48) | (((uint64_t) rwbar) << 40) | (((uint64_t) reg_index) << 32) | reg_value;
	write_uint64 ("tb_to_nic_slave_request", cmd);
	uint32_t retval = read_uint32 ("nic_slave_response_to_tb");

	fprintf(stderr,"Info: accessNicReg rwbar=%d, nic_id = %d, reg_index=%d, write_reg_value=0x%x, read_reg_value=0x%x\n",
					rwbar, nic_id, reg_index, reg_value, retval);
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


void     setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers_enabled)
{
	writeToNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX, number_of_servers_enabled);
}

uint32_t getNumberOfServersInNic (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX));
}


void     setNumberOfBuffersInQueue (uint32_t nic_id, uint32_t number_of_buffers)
{
	writeToNicReg (nic_id, P_N_BUFFERS_REGISTER_INDEX, number_of_buffers);
}

uint32_t getNumberOfBuffersInQueue (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_N_BUFFERS_REGISTER_INDEX));
}


void     setStatusOfQueuesInNic (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t status_value)
{
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_STATUS_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;	
	}
	fprintf(stderr,"Info: setStatusOfQueuesInNic reg_index=%d \n", reg_index);
	writeToNicReg (nic_id, reg_index, status_value);
}

uint32_t getStatusOfQueuesInNic (uint32_t nic_id, uint32_t server_id, uint32_t queue_type)
{
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_STATUS_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;		
	}
	fprintf(stderr,"Info: getStatusOfQueuesInNic reg_index=%d \n", reg_index);
	return(readFromNicReg (nic_id, reg_index));
}

// return 0 on successful acquire
int acquireLock(uint32_t nic_id)
{
	fprintf(stderr,"Info: entered acquireLock\n");
	// get the lock value and 
	uint32_t val = readFromNicReg (nic_id, P_FREE_QUEUE_LOCK_INDEX);
	fprintf(stderr,"Info: acquireLock lock-value = 0x%x\n", val);
	if(val == 0x0)
	{
		fprintf(stderr,"Info: acquireLock success.\n");
	}
	else 
	{
		fprintf(stderr,"Info: acquireLock failure.\n");
		return(1);
	}
	return(0);
}

int releaseLock(uint32_t nic_id)
{
	fprintf(stderr,"Info: entered releaseLock\n");
	// write the lock value and unlock the memory.
	writeToNicReg (nic_id, P_FREE_QUEUE_LOCK_INDEX, 0);
	fprintf(stderr,"Info: leaving releaseLock \n");
	return(0);
}

// return 0 on success
int pushIntoQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t push_value)
{
	int ret_val = 1;
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_INDEX + (2*server_id)); break;	
	}
	fprintf(stderr,"Info: entered pushIntoQueue: push_value=0x%x reg_index=%d \n", push_value, reg_index);
	
	uint32_t init_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t init_nentries = (init_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t init_push_status = (init_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t init_pop_status = init_status & 0xFF;             // Extract the least significant 8 bits
	fprintf(stderr,"Info: pushIntoQueue: before push: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					init_nentries, init_push_status, init_pop_status);

	writeToNicReg (nic_id, reg_index, push_value);

	uint32_t final_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t final_nentries = (final_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t final_push_status = (final_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t final_pop_status = final_status & 0xFF;             // Extract the least significant 8 bits
	fprintf(stderr,"Info: pushIntoQueue: after push: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					final_nentries, final_push_status, final_pop_status);

	if((init_nentries < final_nentries) && (final_push_status == 0))
	{
		ret_val = 0;
		fprintf(stderr,"Info: pushIntoQueue: Push Successful\n");
	}
	else
	{
		fprintf(stderr,"Info: pushIntoQueue: Push Failed\n");
	}
	fprintf(stderr,"Info: left pushIntoQueue returns %d \n", ret_val);
	return(ret_val);
}

// return 0 on success
int popFromQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t* popped_value)
{
	int ret_val = 1;
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_INDEX + (2*server_id)); break;	
	}
	fprintf(stderr,"Info: entered popFromQueue reg_index=%d \n", reg_index);
	
	uint32_t init_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t init_nentries = (init_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t init_push_status = (init_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t init_pop_status = init_status & 0xFF;             // Extract the least significant 8 bits
	fprintf(stderr,"Info: popFromQueue: before pop: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					init_nentries, init_push_status, init_pop_status);

	*popped_value = readFromNicReg (nic_id, reg_index);
	fprintf(stderr,"Info: popFromQueue: after pop: popped_value=0x%x.\n", *popped_value);

	uint32_t final_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t final_nentries = (final_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t final_push_status = (final_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t final_pop_status = final_status & 0xFF;             // Extract the least significant 8 bits
	fprintf(stderr,"Info: popFromQueue: after pop: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					final_nentries, final_push_status, final_pop_status);

	if((init_nentries > final_nentries) && (final_pop_status == 0))
	{
		ret_val = 0;
		fprintf(stderr,"Info: popFromQueue: Pop Successful\n");
	}
	else
	{
		fprintf(stderr,"Info: popFromQueue: Pop Failed\n");
	}
	fprintf(stderr,"Info: left popFromQueue returns %d \n", ret_val);
	return(ret_val);
}

// return 0 on success
int checkQueues (uint32_t queue_type, uint32_t server_id)
{
	int err_flag =0;
	uint32_t I;
	fprintf(stderr,"Info: checking queue %d server %d.\n", queue_type, server_id);
	
	fprintf(stderr,"Info: Pushing into queue %d server %d.\n", queue_type, server_id);
	for(I = 0; I < NBUFFERS; I++)
	{
		int push_not_ok = pushIntoQueue (NIC_ID, server_id, queue_type, I);
		if(push_not_ok)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d: push not ok.\n", queue_type, server_id);
			err_flag = 1;
		}
	}
	fprintf(stderr,"Info: checkQueues queue %d server %d: pushes done.\n", queue_type, server_id);

	fprintf(stderr,"Info: Popping from queue %d server %d.\n", queue_type, server_id);
	for(I = 0; I < NBUFFERS; I++)
	{
		uint32_t J;
		int pop_not_ok  = popFromQueue (NIC_ID, server_id, queue_type, &J);
		if(pop_not_ok)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d: pop not ok.\n", queue_type, server_id);
			err_flag = 1;
		}

		if (J != I)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d: expected 0x%lx, received 0x%lx\n",queue_type, server_id, I, J);
			err_flag = 1;
		}
	}
	fprintf(stderr,"Info: checkQueues queue %d server %d: pops done.\n", queue_type, server_id);

	return(err_flag);
}

// return 0 on success
int checkFreeQueue ()
{
	int err_flag =0;
	uint32_t I;
	fprintf(stderr,"Info: checking free queue.\n");
	for(I = 0; I < NBUFFERS; I++)
	{
		fprintf(stderr,"Info: Acquiring lock for free queue.\n");
		int lock_not_ok = acquireLock (NIC_ID);
		if(lock_not_ok)
		{
			fprintf(stderr,"Error: checkFreeQueue : lock not acquired.\n");
			return(1);
		}
		fprintf(stderr,"Info: Lock acquired, Pushing into free queue.\n");
		int push_not_ok = pushIntoQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, I);
		releaseLock (NIC_ID);
		fprintf(stderr,"Info: Lock released.\n");
		if(push_not_ok)
		{
			fprintf(stderr,"Error: checkFreeQueue : push not ok.\n");
			err_flag = 1;
		}
	}
	fprintf(stderr,"Info: checkFreeQueue : pushes done.\n");

	for(I = 0; I < NBUFFERS; I++)
	{
		uint32_t J;
		fprintf(stderr,"Info: Acquiring lock for free queue.\n");
		int lock_not_ok = acquireLock (NIC_ID);
		if(lock_not_ok)
		{
			fprintf(stderr,"Error: checkFreeQueue : lock not acquired.\n");
			return(1);
		}
		fprintf(stderr,"Info: Lock acquired, Popping from free queue.\n");
		int pop_not_ok  = popFromQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, &J);
		releaseLock (NIC_ID);
		fprintf(stderr,"Info: Lock released.\n");
		if(pop_not_ok)
		{
			fprintf(stderr,"Error: checkFreeQueue : pop not ok.\n");
			err_flag = 1;
		}

		if (J != I)
		{
			fprintf(stderr,"Error: checkFreeQueue : expected 0x%lx, received 0x%lx\n", I, J);
			err_flag = 1;
		}
	}
	fprintf(stderr,"Info: checkFreeQueue : pops done.\n");

	return(err_flag);
}


int main(int argc, char* argv[])
{
	int err_flag = 0;
	
	fprintf (stderr,"Info: setting number of servers enabled to %d \n", NSERVERS);
	// set the number of servers in the nic
	setNumberOfServersInNic(NIC_ID, NSERVERS);
	fprintf (stderr,"Info: set number of servers enabled\n");
	// get the number of servers in the nic
	uint32_t servers_enabled = getNumberOfServersInNic(NIC_ID);
	fprintf (stderr,"Info: reading from register, number of servers enabled = %d \n", servers_enabled);

	fprintf (stderr,"Info: setting number of buffers in each queue to %d \n", NBUFFERS);
	// set the number of buffers in the queue
	setNumberOfBuffersInQueue(NIC_ID, NBUFFERS);
	fprintf (stderr,"Info: set number of buffers in each queue\n");
	// get the number of buffers in the queue
	uint32_t buffers_in_queue = getNumberOfBuffersInQueue(NIC_ID);
	fprintf (stderr,"Info: reading from register, number of buffers in each queue = %d \n", buffers_in_queue);
	
	
	fprintf (stderr,"Info: resetting status registers\n");
	// reset the free queue status registers
	setStatusOfQueuesInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE, INITIAL_STATUS);
	fprintf (stderr,"Info: reset free queue status register\n");
	uint32_t freeQ_status_value = getStatusOfQueuesInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE);
	fprintf (stderr,"Info: reading from register, free queue status register value = %d \n", freeQ_status_value);
	
	int s_id;
	for(s_id = 0; s_id < NSERVERS; s_id++)
	{
		// reset the RX queue status registers for all 4 servers
		setStatusOfQueuesInNic (NIC_ID, s_id, RXQUEUE, INITIAL_STATUS);
		fprintf (stderr,"Info: reset Rx queue status register for server %d \n", s_id);
		uint32_t RxQ_status_value = getStatusOfQueuesInNic (NIC_ID, s_id, RXQUEUE);
		fprintf (stderr,"Info: reading from register, Rx queue status register value for server %d = %d \n", s_id, RxQ_status_value);
		
		// reset the TX queue status registers for all 4 servers
		setStatusOfQueuesInNic (NIC_ID, s_id, TXQUEUE, INITIAL_STATUS);
		fprintf (stderr,"Info: reset Tx queue status register for server %d \n", s_id);
		uint32_t TxQ_status_value = getStatusOfQueuesInNic (NIC_ID, s_id, TXQUEUE);
		fprintf (stderr,"Info: reading from register, Tx queue status register value for server %d = %d \n", s_id, TxQ_status_value);
	}
	
	
	int cq_err = 0;
	/*
	// checking free queue using push/pop operations
	cq_err = checkQueues(FREEQUEUE, FQ_SERVER_ID);
	if(cq_err)
	{
		fprintf(stderr,"Error: checkQueues queue %d server %d failed.\n", FREEQUEUE, FQ_SERVER_ID);
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueues queue %d server %d done (ret=%d)!\n", FREEQUEUE, FQ_SERVER_ID, cq_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	*/
	
	// checking free queue using lock-push/pop-unlock operations
	cq_err = checkFreeQueue();
	if(cq_err)
	{
		fprintf(stderr,"Error: checkFreeQueue failed.\n");
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkFreeQueue done (ret=%d)!\n", cq_err);
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
	
	return(err_flag);
}

