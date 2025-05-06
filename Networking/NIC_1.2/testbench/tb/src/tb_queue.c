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

uint32_t getStatusOfQueueInNic (uint32_t nic_id, uint32_t server_id, uint32_t queue_type)
{
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_STATUS_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;	
	}
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
	int status = writeToNicReg (nic_id, reg_index, push_value);

    	uint8_t push_status = (status >> 1) & 0x1;      // Extract the second least significant bit
    	uint8_t pop_status = status & 0x1;             // Extract the least significant bit
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: pushIntoQueue: after push: push_status=0x%x, pop_status=0x%x.\n", push_status, pop_status);
#endif
	if(push_status == 0)
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
int popFromQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t* popped_val_status)
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
	*popped_val_status = readFromNicReg (nic_id, reg_index);

    	uint8_t push_status = (*popped_val_status >> 1) & 0x1;      // Extract the second least significant bit
    	uint8_t pop_status = *popped_val_status & 0x1;             // Extract the least significant bit
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: popFromQueue: after pop: push_status=0x%x, pop_status=0x%x.\n", push_status, pop_status);
#endif
	if(pop_status == 0)
	{
		ret_val = 0;
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: popFromQueue: Pop Successful\n");
		fprintf(stderr,"Info: popFromQueue: after pop: popped_value=0x%x.\n", *popped_val_status);
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
		uint32_t push_val = 8 * (I + 1);  // Starting from 8 and increasing by 8
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
		int push_not_ok = pushIntoQueue (NIC_ID, server_id, queue_type, push_val);
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
		uint32_t popped_val;
		uint32_t expected_val = 8 * (I + 1);  // Starting from 8 and increasing by 8
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
		int pop_not_ok  = popFromQueue (NIC_ID, server_id, queue_type, &popped_val);
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

		if (popped_val != expected_val)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d: expected 0x%x, received 0x%x\n", 
							queue_type, server_id, expected_val, popped_val);
			err_flag = 1;
		}
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: checkQueues queue %d server %d: pops done.\n", queue_type, server_id);
#endif
	return(err_flag);
}
#endif

#if defined(DEBUG_QUEUES) || defined(DEBUG_QUEUE_SEQUENCE)
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
#endif

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
		uint32_t push_val = 8 * (I + 1);  // Starting from 8 and increasing by 8
		int push_not_ok = debugPushIntoQueue (queue_type, server_id, push_val);
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
		uint32_t popped_val;
		uint32_t expected_val = 8 * (I + 1);  // Starting from 8 and increasing by 8
		int pop_not_ok  = popFromQueue (NIC_ID, server_id, queue_type, &popped_val);
		if(pop_not_ok)
		{
			fprintf(stderr,"Error: debugCheckQueues queue %d server %d: pop not ok.\n", queue_type, server_id);
			err_flag = 1;
		}
		
		if (popped_val != expected_val)
		{
			fprintf(stderr,"Error: debugCheckQueues queue %d server %d: expected 0x%x, received 0x%x\n",
							queue_type, server_id, expected_val, popped_val);
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
		uint32_t push_val = 8 * (I + 1);  // Starting from 8 and increasing by 8
		int push_not_ok = pushIntoQueue (NIC_ID, server_id, queue_type, push_val);
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
		uint64_t popped_val;
		uint32_t expected_val = 8 * (I + 1);  // Starting from 8 and increasing by 8
		int pop_not_ok  = debugPopFromQueue (queue_type, server_id, &popped_val);
		if(pop_not_ok)
		{
			fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d: debug pop not ok.\n", queue_type, server_id);
			err_flag = 1;
		}

		if ((uint32_t) popped_val != expected_val)
		{
			fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d: expected 0x%x, received 0x%x\n",
							 queue_type, server_id, expected_val, (uint32_t) popped_val);
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
// Mimics and checks queue sequencing operations from processor side
// return 0 on success
int checkQueueSequence ()
{
	int err_flag =0;
	uint32_t I;
    	uint32_t buffer[NBUFFERS];
    	uint32_t *buffer_ptr[NBUFFERS];
    	
    	for (I = 0; I < NBUFFERS; I++) 
    	{
        	buffer[I] = 8 * (I + 1);         	// Assigning values to buffers
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
// Mimics and checks queue sequencing operations from NIC side
// return 0 on success
int debugQueueSequence ()
{
	int err_flag =0;
	uint32_t I;
    	uint32_t buffer[NBUFFERS];
    	uint32_t *buffer_ptr[NBUFFERS];
    	
    	for (I = 0; I < NBUFFERS; I++) 
    	{
        	buffer[I] = 8 * (I + 1);         	// Assigning values to buffers
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


#ifdef CHECK_MEMORY_ACCESS
// Check the memory access from the processor side.
// return 0 0n success
int checkMemoryAccess ()
{
	int err_flag =0;
	int I;
	uint32_t address;
	for (I = 0; I < NBUFFERS; I++) 
	{
        	address = 8 * (I + 1);  // Starting from 8 and increasing by 8
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: checkMemoryAccess : Writing value = 0x%llx to address = 0x%lx.\n", I, address);
#endif
		processorAccessMemory (0, 0, 0xff, address, I); 
		
		uint64_t J = processorAccessMemory (0, 1, 0xff, address, 0); 
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: checkMemoryAccess : Read value = 0x%llx from address = 0x%lx.\n", J, address);
#endif
		if (J != I)
		{
			fprintf(stderr,"Error: checkMemoryAccess, from address = 0x%lx: expected 0x%llx, received 0x%llx\n", address, I, J);
			err_flag = 1;
		}
    	}	
    	return(err_flag);
}
#endif


#ifdef DEBUG_MEMORY_ACCESS
uint64_t nicAccessMemory (uint8_t lock,  uint8_t rwbar, uint8_t bmask, uint32_t addr, uint64_t wdata)
{
	uint64_t ctrl_word = (((uint64_t) lock) << 45) | (((uint64_t) rwbar) << 44) | (((uint64_t) bmask) << 36) | addr ;
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: nicAccessMemory: lock=%d, rwbar=%d, bmask=0x%x, addr=0x%lx, wdata=0x%llx, ctrl-word=0x%llx\n",
				lock, rwbar, bmask, addr, wdata, ctrl_word);
#endif
	write_uint64 ("debug_memory_command", ctrl_word);
	write_uint64 ("debug_memory_command", wdata);
	
	uint64_t rdata = read_uint64 ("debug_memory_response");
	return(rdata);
}

// To check the write access to memory from the NIC side using debug pipes
// return 0 0n success
int debugMemoryAccess ()
{
	int err_flag =0;
	int I;
	uint32_t address;
	for (I = 0; I < NBUFFERS; I++) 
	{
        	address = 8 * (I + 1);  // Starting from 8 and increasing by 8
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: debugMemoryAccess : Writing value = 0x%llx to address = 0x%lx from NIC side.\n", I, address);
#endif
		nicAccessMemory (0, 0, 0xff, address, I); 
		
		uint64_t J = processorAccessMemory (0, 1, 0xff, address, 0); 
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: debugMemoryAccess : Read value = 0x%llx from address = 0x%lx from processor side.\n", J, address);
#endif
		if (J != I)
		{
			fprintf(stderr,"Error: debugMemoryAccess, at address = 0x%lx: expected 0x%llx, received 0x%llx\n", address, I, J);
			err_flag = 1;
		}
    	}	
	return(err_flag);
}

// To check the read access to memory from the NIC side using debug pipes
// return 0 0n success
int debugMemoryAccessInReverse ()
{
	int err_flag =0;
	int I;
	uint32_t address;
	for (I = 0; I < NBUFFERS; I++) 
	{
        	address = 8 * (I + 1);  // Starting from 8 and increasing by 8
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: debugMemoryAccessInReverse : Writing value = 0x%llx to address = 0x%lx from processor side.\n", I, address);
#endif
		processorAccessMemory (0, 0, 0xff, address, I); 
		
		uint64_t J = nicAccessMemory (0, 1, 0xff, address, 0); 
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: debugMemoryAccessInReverse : Read value = 0x%llx from address = 0x%lx from NIC side.\n", J, address);
#endif
		if (J != I)
		{
			fprintf(stderr,"Error: debugMemoryAccessInReverse, at address = 0x%lx: expected 0x%llx, received 0x%llx\n", address, I, J);
			err_flag = 1;
		}
    	}	
	return(err_flag);
}
#endif
