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


void setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers_enabled)
{
	writeToNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX, number_of_servers_enabled);
}

uint32_t getNumberOfServersInNic (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX));
}

void setNumberOfBuffersInQueue (uint32_t nic_id, uint32_t number_of_buffers)
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
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: setStatusOfQueuesInNic reg_index=%d \n", reg_index);
#endif
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
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: getStatusOfQueuesInNic reg_index=%d \n", reg_index);
#endif
	return(readFromNicReg (nic_id, reg_index));
}

// return 0 on successful acquire
int acquireLock(uint32_t nic_id)
{
	int ret_val = 1;
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered acquireLock\n");
#endif
	// get the lock value and 
	uint32_t val = readFromNicReg (nic_id, P_FREE_QUEUE_LOCK_INDEX);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: acquireLock lock-value = 0x%x\n", val);
#endif
	if(val == 0x0)
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: acquireLock success.\n");
#endif
		ret_val = 0;
	}
	else 
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: acquireLock failure.\n");
#endif
	}
	return(ret_val);
}

int releaseLock(uint32_t nic_id)
{
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered releaseLock\n");
#endif
	// write the lock value and unlock the memory.
	writeToNicReg (nic_id, P_FREE_QUEUE_LOCK_INDEX, 0);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: leaving releaseLock \n");
#endif
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
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered pushIntoQueue: push_value=0x%x reg_index=%d \n", push_value, reg_index);
#endif
	uint32_t init_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t init_nentries = (init_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t init_push_status = (init_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t init_pop_status = init_status & 0xFF;             // Extract the least significant 8 bits
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: pushIntoQueue: before push: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					init_nentries, init_push_status, init_pop_status);
#endif
	writeToNicReg (nic_id, reg_index, push_value);

	uint32_t final_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t final_nentries = (final_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t final_push_status = (final_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t final_pop_status = final_status & 0xFF;             // Extract the least significant 8 bits
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: pushIntoQueue: after push: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					final_nentries, final_push_status, final_pop_status);
#endif
	if((init_nentries < final_nentries) && (final_push_status == 0))
	{
		ret_val = 0;
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: pushIntoQueue: Push Successful\n");
#endif
	}
	else
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: pushIntoQueue: Push Failed\n");
#endif
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: leaving pushIntoQueue : returns %d \n", ret_val);
#endif
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
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered popFromQueue reg_index=%d \n", reg_index);
#endif
	uint32_t init_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t init_nentries = (init_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t init_push_status = (init_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t init_pop_status = init_status & 0xFF;             // Extract the least significant 8 bits
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: popFromQueue: before pop: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					init_nentries, init_push_status, init_pop_status);
#endif
	*popped_value = readFromNicReg (nic_id, reg_index);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: popFromQueue: after pop: popped_value=0x%x.\n", *popped_value);
#endif
	uint32_t final_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t final_nentries = (final_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t final_push_status = (final_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t final_pop_status = final_status & 0xFF;             // Extract the least significant 8 bits
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: popFromQueue: after pop: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					final_nentries, final_push_status, final_pop_status);
#endif
	if((init_nentries > final_nentries) && (final_pop_status == 0))
	{
		ret_val = 0;
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: popFromQueue: Pop Successful\n");
#endif
	}
	else
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: popFromQueue: Pop Failed\n");
#endif
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: leaving popFromQueue : returns %d \n", ret_val);
#endif
	return(ret_val);
}

#ifdef CHECK_QUEUES
// Checks freeQ through lock-push/pop-unlock and all other Rx/Tx queues through push/pop
// return 0 on success
int checkQueues (uint32_t queue_type, uint32_t server_id)
{
	int err_flag =0;
	uint32_t I;
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: checking queue %d server %d.\n", queue_type, server_id);
#endif
	for(I = 0; I < NBUFFERS; I++)
	{
		if (queue_type == FREEQUEUE)
		{
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Acquiring lock for free queue.\n");
#endif
			while(acquireLock(NIC_ID)) 
			{
				fprintf(stderr,"Warning: lock not acquired, retrying again.\n");
			};
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock acquired.\n");
#endif
		}
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Pushing into queue %d server %d.\n", queue_type, server_id);
#endif
		int push_not_ok = pushIntoQueue (NIC_ID, server_id, queue_type, I);
		if (queue_type == FREEQUEUE)
		{
			releaseLock (NIC_ID);
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock released.\n");
#endif
		}
		if(push_not_ok)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d: push not ok.\n", queue_type, server_id);
			err_flag = 1;
		}
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: checkQueues queue %d server %d: pushes done.\n", queue_type, server_id);
#endif
	
	for(I = 0; I < NBUFFERS; I++)
	{
		uint32_t J;
		if (queue_type == FREEQUEUE)
		{
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Acquiring lock for free queue.\n");
#endif
			while(acquireLock(NIC_ID)) 
			{
				fprintf(stderr,"Warning: lock not acquired, retrying again.\n");
			};
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock acquired.\n");
#endif
		}
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Popping from queue %d server %d.\n", queue_type, server_id);
#endif
		int pop_not_ok  = popFromQueue (NIC_ID, server_id, queue_type, &J);
		if (queue_type == FREEQUEUE)
		{
			releaseLock (NIC_ID);
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock released.\n");
#endif
		}
		if(pop_not_ok)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d: pop not ok.\n", queue_type, server_id);
			err_flag = 1;
		}

		if (J != I)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d: expected 0x%x, received 0x%x\n",queue_type, server_id, I, J);
			err_flag = 1;
		}
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: checkQueues queue %d server %d: pops done.\n", queue_type, server_id);
#endif
	return(err_flag);
}
#endif


// return 0 on success
int debugPushIntoQueue (uint32_t queue_type, uint32_t server_id, uint32_t val)
{
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: debugPushIntoQueue : value = 0x%x.\n", val);
#endif
	uint64_t cmd = (((uint64_t) queue_type) << 36) | (((uint64_t) server_id) << 32) | val;
	write_uint64 ("debug_queue_command",  cmd);
	uint64_t ign = read_uint64 ("debug_queue_response");
	int ret_val = (ign != 0);
}

// return 0 on success
int debugPopFromQueue (uint32_t queue_type, uint32_t server_id, uint64_t* rval)
{
	uint64_t cmd = (((uint64_t) 1) << 63) |	(((uint64_t) queue_type) << 36) | (((uint64_t) server_id) << 32);
	write_uint64 ("debug_queue_command",  cmd);
	*rval = read_uint64 ("debug_queue_response");
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: debugPopFromQueue : value = 0x%x.\n", (uint32_t)(*rval));
#endif
	return((*rval >> 63) != 0);
}

#ifdef DEBUG_QUEUES
// To check push from NIC side using debug queue pipes
// return 0 on success
int debugQueues (uint32_t queue_type, uint32_t server_id)
{
	int err_flag =0;
	uint32_t I;
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: checking queue %d server %d through debug.\n", queue_type, server_id);

	fprintf(stderr,"Info: Pushing into queue %d server %d through debug.\n", queue_type, server_id);
#endif
	for(I = 0; I < NBUFFERS; I++)
	{	
		int push_not_ok = debugPushIntoQueue (queue_type, server_id, I);
		if(push_not_ok)
		{
			fprintf(stderr,"Error: debugCheckQueues queue %d server %d: debug push not ok.\n", queue_type, server_id);
			err_flag = 1;
		}
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: debugCheckQueues queue %d server %d: debug pushes done.\n", queue_type, server_id);

	fprintf(stderr,"Info: Popping from queue %d server %d.\n", queue_type, server_id);
#endif
	for(I = 0; I < NBUFFERS; I++)
	{
		uint32_t J;
		int pop_not_ok  = popFromQueue (NIC_ID, server_id, queue_type, &J);
		if(pop_not_ok)
		{
			fprintf(stderr,"Error: debugCheckQueues queue %d server %d: pop not ok.\n", queue_type, server_id);
			err_flag = 1;
		}
		
		if (J != I)
		{
			fprintf(stderr,"Error: debugCheckQueues queue %d server %d: expected 0x%x, received 0x%x\n",
							 queue_type, server_id, I, J);
			err_flag = 1;
		}
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: debugCheckQueues queue %d server %d: pops done.\n", queue_type, server_id);
#endif
	return(err_flag);
}

// To check pop from NIC side using debug queue pipes
// return 0 on success
int debugQueuesInReverse (uint32_t queue_type, uint32_t server_id)
{
	int err_flag =0;
	uint32_t I;
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: checking queue %d server %d in reverse through debug .\n", queue_type, server_id);
	
	fprintf(stderr,"Info: Pushing into queue %d server %d.\n", queue_type, server_id);
#endif
	for(I = 0; I < NBUFFERS; I++)
	{	
		int push_not_ok = pushIntoQueue (NIC_ID, server_id, queue_type, I);
		if(push_not_ok)
		{
			fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d: push not ok.\n", queue_type, server_id);
			err_flag = 1;
		}
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: debugCheckQueuesInReverse queue %d server %d: pushes done.\n", queue_type, server_id);

	fprintf(stderr,"Info: Popping from queue %d server %d through debug.\n", queue_type, server_id);
#endif
	for(I = 0; I < NBUFFERS; I++)
	{
		uint64_t J;
		int pop_not_ok  = debugPopFromQueue (queue_type, server_id, &J);
		if(pop_not_ok)
		{
			fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d: debug pop not ok.\n", queue_type, server_id);
			err_flag = 1;
		}

		if ((uint32_t) J != I)
		{
			fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d: expected 0x%x, received 0x%x\n",
							 queue_type, server_id, I, (uint32_t) J);
			err_flag = 1;
		}
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: debugCheckQueuesInReverse queue %d server %d: debug pops done.\n", queue_type, server_id);
#endif
	return(err_flag);
}
#endif

#ifdef CHECK_QUEUE_SEQUENCE
int checkQueueSequence ()
{
	int err_flag =0;
	uint32_t I;
    	uint32_t buffer[NBUFFERS];
    	uint32_t *buffer_ptr[NBUFFERS];
    	
    	for (I = 0; I < NBUFFERS; I++) 
    	{
        	buffer[I] = I + 1;         	// Assigning values to buffers
        	buffer_ptr[I] = &buffer[I];  	// Assigning addresses of buffers to pointers
    	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: started checkQueueSequence.\n");
	
	fprintf(stderr,"Info: Pushing buffers to free queue.\n");
#endif
	for(I = 0; I < NBUFFERS; I++)
	{
		int push_not_ok;
		do {
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Acquiring lock for free queue.\n");
#endif
			while(acquireLock(NIC_ID)) 
			{
				fprintf(stderr,"Warning: lock not acquired, retrying again.\n");
			};
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock acquired.\n");
			fprintf(stderr,"Info: Pushing into free queue.\n");
#endif
			push_not_ok = pushIntoQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, buffer_ptr[I]);
			releaseLock (NIC_ID);
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock released.\n");
#endif
			if(push_not_ok)
			{
				fprintf(stderr,"Warning: checkQueueSequence : push to free queue not ok, retrying again.\n");
			}
		} while (push_not_ok);
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: checkQueueSequence : pushes done to free queue.\n");

	fprintf(stderr,"Info: Popping buffers from freeQ and pushing it sequentially to different servers of RxQ's.\n");
#endif
	int server_id = 0;
	for(I = 0; I < NBUFFERS; I++)
	{
		uint32_t J;
		int pop_not_ok, push_not_ok;
		do {
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Acquiring lock for free queue.\n");
#endif
			while(acquireLock(NIC_ID)) 
			{
				fprintf(stderr,"Warning: lock not acquired, retrying again.\n");
			};
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock acquired.\n");
			fprintf(stderr,"Info: Popping from free queue.\n");
#endif
			pop_not_ok = popFromQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, &J);
			releaseLock (NIC_ID);
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock released.\n");
#endif
			if(pop_not_ok)
			{
				fprintf(stderr,"Warning: checkQueueSequence : pop from free queue not ok, retrying again.\n");
			}
		} while (pop_not_ok);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Popped buffer address = 0x%x from free queue.\n", J);
#endif
		if (J != (uint32_t) buffer_ptr[I])
		{
			fprintf(stderr,"Error: checkQueueSequence, pop from free queue: expected 0x%x, received 0x%x\n",
							 (uint32_t) buffer_ptr[I], J);
			err_flag = 1;
		}

		server_id = server_id % NSERVERS;
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Pushing buffer address = 0x%x to Rx queue server %d.\n", J, server_id);
#endif
		do {
			push_not_ok = pushIntoQueue (NIC_ID, server_id, RXQUEUE, J);
			if(push_not_ok)
			{
				fprintf(stderr,"Warning: checkQueueSequence : push to RxQ server %d not ok, retrying again.\n", server_id);
			}
		} while (push_not_ok);
		server_id++;
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: Popped buffers from freeQ and pushed it sequentially to different servers of RxQ's.\n");

	fprintf(stderr,"Info: Popping buffers from RxQ's and pushing it to that same servers TxQ's.\n");
#endif
	server_id = 0;
	for(I = 0; I < NBUFFERS; I++)
	{
		uint32_t J;
		int pop_not_ok, push_not_ok;
		server_id = server_id % NSERVERS;
		do {
			pop_not_ok = popFromQueue (NIC_ID, server_id, RXQUEUE, &J);
			if(pop_not_ok)
			{
				fprintf(stderr,"Warning: checkQueueSequence : pop from RxQ server %d not ok, retrying again.\n", server_id);
			}
		} while (pop_not_ok);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Popped buffer address = 0x%x from Rx queue server %d.\n", J, server_id);
#endif
		if (J != (uint32_t) buffer_ptr[I])
		{
			fprintf(stderr,"Error: checkQueueSequence, pop from RxQ server %d: expected 0x%x, received 0x%x\n", 
								server_id, (uint32_t) buffer_ptr[I], J);
			err_flag = 1;
		}
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Pushing buffer address = 0x%x to Tx queue server %d.\n", J, server_id);
#endif
		do {
			push_not_ok = pushIntoQueue (NIC_ID, server_id, TXQUEUE, J);
			if(push_not_ok)
			{
				fprintf(stderr,"Warning: checkQueueSequence : push to TxQ server %d not ok, retrying again.\n", server_id);
			}
		} while (push_not_ok);
		server_id++;
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: Popped buffers from RxQ's and pushed it to that same servers TxQ's.\n");

	fprintf(stderr,"Info: Popping buffers sequentialy from different servers of TxQ's and pushing it to freeQ.\n");
#endif
	server_id = 0;
	for(I = 0; I < NBUFFERS; I++)
	{
		uint32_t J;
		int pop_not_ok, push_not_ok;
		server_id = server_id % NSERVERS;
		do {
			pop_not_ok = popFromQueue (NIC_ID, server_id, TXQUEUE, &J);
			if(pop_not_ok)
			{
				fprintf(stderr,"Warning: checkQueueSequence : pop from TxQ server %d not ok, retrying again.\n", server_id);
			}
		} while (pop_not_ok);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Popped buffer address = 0x%x from Tx queue server %d.\n", J, server_id);
#endif
		if (J != (uint32_t) buffer_ptr[I])
		{
			fprintf(stderr,"Error: checkQueueSequence, pop from TxQ server %d: expected 0x%x, received 0x%x\n", 
								server_id, (uint32_t) buffer_ptr[I], J);
			err_flag = 1;
		}
		server_id++;
		
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Pushing buffer address = 0x%x to free queue.\n", J);
#endif
		do {
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Acquiring lock for free queue.\n");
#endif
			while(acquireLock(NIC_ID)) 
			{
				fprintf(stderr,"Warning: lock not acquired, retrying again.\n");
			};
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock acquired.\n");
			fprintf(stderr,"Info: Pushing into free queue.\n");
#endif
			push_not_ok = pushIntoQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, J);
			releaseLock (NIC_ID);
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock released.\n");
#endif
			if(push_not_ok)
			{
				fprintf(stderr,"Warning: checkQueueSequence : push to free queue not ok, retrying again.\n");
			}
		} while (push_not_ok);
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: Popped buffers sequentialy from different servers of TxQ's and pushed it to freeQ.\n");
	
	fprintf(stderr,"Info: popping buffers from free queue.\n");
#endif
	for(I = 0; I < NBUFFERS; I++)
	{
		uint32_t J;
		int pop_not_ok;
		do {
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Acquiring lock for free queue.\n");
#endif
			while(acquireLock(NIC_ID)) 
			{
				fprintf(stderr,"Warning: lock not acquired, retrying again.\n");
			};
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock acquired.\n");
			fprintf(stderr,"Info: Popping from free queue.\n");
#endif
			pop_not_ok = popFromQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, &J);
			releaseLock (NIC_ID);
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock released.\n");
#endif
			if(pop_not_ok)
			{
				fprintf(stderr,"Warning: checkQueueSequence : pop from free queue not ok, retrying again.\n");
			}
		} while (pop_not_ok);
		if (J != (uint32_t) buffer_ptr[I])
		{
			fprintf(stderr,"Error: checkQueueSequence, pop from free queue: expected 0x%x, received 0x%x\n",
							 (uint32_t) buffer_ptr[I], J);
			err_flag = 1;
		}
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: checkQueueSequence : pops done from free queue.\n");
#endif
	return(err_flag);
}
#endif

#ifdef DEBUG_QUEUE_SEQUENCE
int debugQueueSequence ()
{
	int err_flag =0;
	uint32_t I;
    	uint32_t buffer[NBUFFERS];
    	uint32_t *buffer_ptr[NBUFFERS];
    	
    	for (I = 0; I < NBUFFERS; I++) 
    	{
        	buffer[I] = I + 1;         	// Assigning values to buffers
        	buffer_ptr[I] = &buffer[I];  	// Assigning addresses of buffers to pointers
    	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: started debugQueueSequence.\n");
	
	fprintf(stderr,"Info: Pushing buffers to free queue.\n");
#endif
	for(I = 0; I < NBUFFERS; I++)
	{
		int push_not_ok;
		do {
			push_not_ok = debugPushIntoQueue (FREEQUEUE, FQ_SERVER_ID, buffer_ptr[I]);
			if(push_not_ok)
			{
				fprintf(stderr,"Warning: debugQueueSequence : push to free queue not ok, retrying again.\n");
			}
		} while (push_not_ok);
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: debugQueueSequence : pushes done to free queue.\n");

	fprintf(stderr,"Info: Popping buffers from freeQ and pushing it sequentially to different servers of RxQ's.\n");
#endif
	int server_id = 0;
	for(I = 0; I < NBUFFERS; I++)
	{
		uint64_t J;
		int pop_not_ok, push_not_ok;
		do {
			pop_not_ok = debugPopFromQueue (FREEQUEUE, FQ_SERVER_ID, &J);
			if(pop_not_ok)
			{
				fprintf(stderr,"Warning: debugQueueSequence : pop from free queue not ok, retrying again.\n");
			}
		} while (pop_not_ok);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Popped buffer address = 0x%x from free queue.\n", (uint32_t) J);
#endif
		if ((uint32_t) J != (uint32_t) buffer_ptr[I])
		{
			fprintf(stderr,"Error: debugQueueSequence, pop from free queue: expected 0x%x, received 0x%x\n",
							 (uint32_t) buffer_ptr[I], (uint32_t) J);
			err_flag = 1;
		}

		server_id = server_id % NSERVERS;
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Pushing buffer address = 0x%x to Rx queue server %d.\n", (uint32_t) J, server_id);
#endif
		do {
			push_not_ok = debugPushIntoQueue (RXQUEUE, server_id, (uint32_t) J);
			if(push_not_ok)
			{
				fprintf(stderr,"Warning: debugQueueSequence : push to RxQ server %d not ok, retrying again.\n", server_id);
			}
		} while (push_not_ok);
		server_id++;
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: Popped buffers from freeQ and pushed it sequentially to different servers of RxQ's.\n");

	fprintf(stderr,"Info: Popping buffers from RxQ's and pushing it to that same servers TxQ's.\n");
#endif
	server_id = 0;
	for(I = 0; I < NBUFFERS; I++)
	{
		uint64_t J;
		int pop_not_ok, push_not_ok;
		server_id = server_id % NSERVERS;
		do {
			pop_not_ok = debugPopFromQueue (RXQUEUE, server_id, &J);
			if(pop_not_ok)
			{
				fprintf(stderr,"Warning: debugQueueSequence : pop from RxQ server %d not ok, retrying again.\n", server_id);
			}
		} while (pop_not_ok);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Popped buffer address = 0x%x from Rx queue server %d.\n", (uint32_t) J, server_id);
#endif
		if ((uint32_t) J != (uint32_t) buffer_ptr[I])
		{
			fprintf(stderr,"Error: debugQueueSequence, pop from RxQ server %d: expected 0x%x, received 0x%x\n", 
								server_id, (uint32_t) buffer_ptr[I], (uint32_t) J);
			err_flag = 1;
		}
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Pushing buffer address = 0x%x to Tx queue server %d.\n", (uint32_t) J, server_id);
#endif
		do {
			push_not_ok = debugPushIntoQueue (TXQUEUE, server_id, (uint32_t) J);
			if(push_not_ok)
			{
				fprintf(stderr,"Warning: debugQueueSequence : push to TxQ server %d not ok, retrying again.\n", server_id);
			}
		} while (push_not_ok);
		server_id++;
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: Popped buffers from RxQ's and pushed it to that same servers TxQ's.\n");

	fprintf(stderr,"Info: Popping buffers sequentialy from different servers of TxQ's and pushing it to freeQ.\n");
#endif
	server_id = 0;
	for(I = 0; I < NBUFFERS; I++)
	{
		uint64_t J;
		int pop_not_ok, push_not_ok;
		server_id = server_id % NSERVERS;
		do {
			pop_not_ok = debugPopFromQueue (TXQUEUE, server_id, &J);
			if(pop_not_ok)
			{
				fprintf(stderr,"Warning: debugQueueSequence : pop from TxQ server %d not ok, retrying again.\n", server_id);
			}
		} while (pop_not_ok);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Popped buffer address = 0x%x from Tx queue server %d.\n", (uint32_t) J, server_id);
#endif
		if ((uint32_t) J != (uint32_t) buffer_ptr[I])
		{
			fprintf(stderr,"Error: debugQueueSequence, pop from TxQ server %d: expected 0x%x, received 0x%x\n", 
								server_id, (uint32_t) buffer_ptr[I], (uint32_t) J);
			err_flag = 1;
		}
		server_id++;
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: Pushing buffer address = 0x%x to free queue.\n", (uint32_t) J);
#endif
		do {
			push_not_ok = debugPushIntoQueue (FREEQUEUE, FQ_SERVER_ID, (uint32_t) J);
			if(push_not_ok)
			{
				fprintf(stderr,"Warning: debugQueueSequence : push to free queue not ok, retrying again.\n");
			}
		} while (push_not_ok);
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: Popped buffers sequentialy from different servers of TxQ's and pushed it to freeQ.\n");
	
	fprintf(stderr,"Info: popping buffers from free queue.\n");
#endif
	for(I = 0; I < NBUFFERS; I++)
	{
		uint64_t J;
		int pop_not_ok;
		do {
			pop_not_ok = debugPopFromQueue (FREEQUEUE, FQ_SERVER_ID, &J);
			if(pop_not_ok)
			{
				fprintf(stderr,"Warning: debugQueueSequence : pop from free queue not ok, retrying again.\n");
			}
		} while (pop_not_ok);
		if ((uint32_t) J != (uint32_t) buffer_ptr[I])
		{
			fprintf(stderr,"Error: debugQueueSequence, pop from free queue: expected 0x%x, received 0x%x\n",
							 (uint32_t) buffer_ptr[I], (uint32_t) J);
			err_flag = 1;
		}
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: debugQueueSequence : pops done from free queue.\n");
#endif
	return(err_flag);
}
#endif

