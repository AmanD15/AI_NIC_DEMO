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

extern uint32_t  free_queue_base_address;
extern uint32_t  rx_queue_base_address;
extern uint32_t  tx_queue_base_address;

uint64_t processorAccessMemory (uint8_t lock, uint8_t rwbar, uint8_t bmask, uint32_t addr, uint64_t wdata);

//
// Queue manipulation routines, a royal pain in ....
// 

uint32_t getField (uint32_t q_base_addr, uint32_t field)
{
	uint32_t addr = (q_base_addr + (8*(field/2)));
	uint8_t bmask = (field & 0x1) ? 0xf : 0xf0;	

	uint64_t val = processorAccessMemory (0, 1, bmask, addr, 0);
	uint32_t val32 = (field & 0x1) ? (val & 0xffffffff) : (val >> 32);

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: getField returns val=0x%llx, val32 = 0x%x, field=%d, qbase=0x%x,  addr=0x%x\n", val, val32, field, q_base_addr, addr);
#endif
	return(val32);
}

void setField (uint32_t q_base_addr, uint32_t field, uint32_t val32)
{
	uint32_t addr = (q_base_addr + (8*(field/2)));
	uint8_t bmask = (field & 0x1) ? 0xf : 0xf0;	
	uint64_t val = val32;
	val = (field & 0x1) ? val : (val << 32);

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: setField val=0x%llx, qbase-addr=0x%lx, field=%d (addr=0x%x), bmask=0x%x, wrote 0x%x\n", val, q_base_addr, field, addr, bmask, val32);
#endif

	processorAccessMemory (0, 0, bmask, addr, val);
}


uint32_t getReadPointer (uint32_t q_base_addr)
{
	return(getField (q_base_addr,1));
}
uint32_t getWritePointer (uint32_t q_base_addr)
{
	return(getField (q_base_addr,2));
}
uint32_t getNumberOfMessages (uint32_t q_base_addr)
{
	return(getField (q_base_addr,0));
}

uint32_t getCapacity (uint32_t q_base_addr)
{
	return(getField (q_base_addr,3));
}


void setReadPointer (uint32_t q_base_addr, uint32_t val)
{
	setField(q_base_addr, 1, val);
}
uint32_t setWritePointer (uint32_t q_base_addr, uint32_t val)
{
	setField(q_base_addr, 2, val);
}
uint32_t setCapacity (uint32_t q_base_addr, uint32_t val)
{
	setField(q_base_addr, 3, val);
}
uint32_t setNumberOfMessages (uint32_t q_base_addr, uint32_t val)
{
	setField(q_base_addr, 0, val);
}

uint64_t getQueueEntry (uint32_t q_base_addr, uint32_t read_index)
{

	uint32_t buf_base_addr = getField(q_base_addr, 6);
	uint32_t entry_addr =  buf_base_addr + (8*read_index);
	uint8_t  bmask  = 0xff;
	uint64_t v64 = processorAccessMemory (0, 1, bmask, entry_addr, 0x0);

	uint32_t v32 = (entry_addr & 0x4) ? v64 : (v64 >> 32);
	return(v64);
	
}

void setQueueEntry (uint32_t q_base_addr, uint32_t write_index, uint64_t qval)
{
	uint32_t buf_base_addr = getField(q_base_addr, 6);
	uint32_t entry_addr =  buf_base_addr + (8*write_index);
	uint8_t  bmask  = 0xff;
	uint64_t v64 = qval;

	processorAccessMemory (0, 0, bmask, entry_addr, v64);
}


// return 0 on successful acquire.
int acquireLock(uint64_t q_base_address)
{
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered acquireLock 0x%llx\n", q_base_address);
#endif
	int ret_val = 0;

	// get the lock pointer.
	uint32_t lock_pointer = getField(q_base_address,5);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: acquireLock lock-pointer = 0x%x\n", lock_pointer);
#endif

	// the lock is stored in the byte pointed to by the
	// lock-pointer
	uint8_t  byte_index =  (lock_pointer & 0x7);
	uint8_t  bmask      =  (0x80 >> byte_index);

	// get the lock value: note the locking below.
	uint64_t val = processorAccessMemory (1, 1, 0xff, lock_pointer, 0);
	val = (val >> (byte_index*8)) & 0xff;

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: acquireLock lock-value = 0x%x\n", (uint32_t) val);
#endif

	if(val == 0x0)
	// write 0xff into lock.
	{
		// write the lock value and unlock the memory.
		processorAccessMemory (0, 0, bmask, lock_pointer, 0xffffffffffffffff);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: acquireLock success.\n");
#endif
		return(0);
	}
	else 
	{
		// unlock the memory bus, by reading the lock pointer again.
		val = processorAccessMemory (0, 1, 0xff, lock_pointer, 0);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: acquireLock failure.\n");
#endif
	}
	return(1);
}

int releaseLock(uint64_t q_base_address)
{
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered releaseLock 0x%llx\n", q_base_address);
#endif

	// get the lock pointer.
	uint32_t lock_pointer = getField (q_base_address, 5);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: releaseLock lock-pointer = 0x%x\n", lock_pointer);
#endif

	uint8_t  byte_index =  (lock_pointer & 0x7);
	uint8_t  bmask = (1 << (7 - byte_index));

	// write the lock value and unlock the memory.
	processorAccessMemory (0, 0, bmask, lock_pointer, 0x0);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: leaving releaseLock \n");
#endif
	return(0);
}



// return 0 on success
int pushIntoQueue (uint64_t q_base_address, uint64_t val)
{
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered pushIntoQueue 0x%llx, 0x%x \n", q_base_address, val);
#endif
	int ret_val = 1;
	while(acquireLock(q_base_address)) 
	{
		usleep(1000);
	};

	uint32_t q_capacity = getCapacity(q_base_address);
	uint32_t nmsgs = getNumberOfMessages (q_base_address);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: pushIntoQueue capacity=%d, nmsgs=%d, val=0x%llx\n", q_capacity, nmsgs, val);
#endif

	if(nmsgs < q_capacity)
	{
		uint32_t read_index = getReadPointer(q_base_address);
		uint32_t write_index = getWritePointer(q_base_address);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: pushIntoQueue: before push: read_pointer=0x%x, write_pointer=0x%x, nentries=%d.\n",
					read_index, write_index, nmsgs);
#endif

		ret_val = 0;
		setQueueEntry (q_base_address, write_index, val);

		write_index = (write_index + 1) % QUEUE_SIZE_IN_MSGS;
		setWritePointer (q_base_address, write_index);

		setNumberOfMessages (q_base_address, nmsgs + 1);

#ifdef DEBUGPRINT
		fprintf(stderr,"Info: pushIntoQueue: after push: q_base=0x%llx, read_pointer=0x%x, write_pointer=0x%x, nentries=%d.\n",
					q_base_address, read_index, write_index, nmsgs+1);
#endif
	}

	releaseLock (q_base_address);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: left pushIntoQueue returns %d \n", ret_val);
#endif
	return(ret_val);
}


// return 0 on success
int popFromQueue  (uint64_t q_base_address, uint64_t* val)
{
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: start popFromQueue 0x%llx\n", q_base_address);
#endif
	int ret_val = 1;
	*val = 0;
	while(acquireLock(q_base_address)) 
	{
		usleep(1000);
	}

	uint32_t read_index = getReadPointer(q_base_address);
	uint32_t write_index = getWritePointer(q_base_address);
	uint32_t nmsgs = getNumberOfMessages (q_base_address);

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: popFromQueue read_index = %d, write_index = %d, msg_count=%d.\n", 
				read_index, write_index, nmsgs);
#endif

	if(nmsgs > 0)
	{

		ret_val = 0;
		*val = getQueueEntry (q_base_address, read_index);

		read_index = (read_index + 1) % QUEUE_SIZE_IN_MSGS;
		setReadPointer  (q_base_address, read_index);

		setNumberOfMessages (q_base_address, nmsgs - 1);

#ifdef DEBUGPRINT
		fprintf(stderr,"Info: popFromQueue: after pop: q_base=0x%llx, read_pointer=0x%x, write_pointer=0x%x, nentries=%d.\n",
					q_base_address, read_index, write_index, nmsgs-1);
#endif
	}

	releaseLock (q_base_address);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: done popFromQueue returns %d, popped-value=0x%lx\n", ret_val, *val);
#endif
	return(ret_val);
}


int debugPushIntoQueue (uint32_t queue_id, uint32_t server_id,  uint32_t val)
{
	uint64_t cmd = 
		(((uint64_t) server_id) << 32) |
			(((uint64_t) queue_id) << 40) | val;
	write_uint64 ("debug_queue_command",  cmd);
	uint64_t ign = read_uint64 ("debug_queue_response");

	int ret_val = (ign != 0);

}

int debugPopFromQueue (uint32_t queue_id, uint32_t server_id, uint64_t* rval)
{
	uint64_t cmd = 
		(((uint64_t) 1) << 63) |
			(((uint64_t) server_id) << 32) |
			(((uint64_t) queue_id) << 40);
	write_uint64 ("debug_queue_command",  cmd);
	*rval = read_uint64 ("debug_queue_response");

	return((*rval >> 63) != 0);
}

// return 0 on success
int checkQueues (int queue_id)
{
	int err_flag =0;
	fprintf(stderr,"Info: checking queue %d.\n", queue_id);

	uint32_t I;
	for(I = 0; I < QUEUE_SIZE_IN_MSGS; I++)
	{
		int p_not_ok = debugPushIntoQueue (queue_id, 0,  I);
		if(p_not_ok)
		{
			fprintf(stderr,"Error: checkQueues %d: push not ok.\n", queue_id);
			err_flag = 1;
		}
	}

	fprintf(stderr,"Info: checkQueues: pushes done.\n");

	for(I = 0; I < QUEUE_SIZE_IN_MSGS; I++)
	{
		
		/*uint64_t queue_base_addr = 
			((queue_id == 0) ?  free_queue_base_address :
			 ((queue_id == 1) ? tx_queue_base_address : rx_queue_base_address));
			 
		*/	 
			 
		uint64_t queue_base_addr;		 
		switch(queue_id)
		{
			case 0   : queue_base_addr = free_queue_base_address; break;
			case 1   : queue_base_addr = tx_queue_base_address; break;
			case 2   : queue_base_addr = rx_queue_base_address; break;
			case 3   : assert(0); 
		}	 

		uint64_t v;
		int p_not_ok  = popFromQueue (queue_base_addr, &v);
		if(p_not_ok)
		{
			fprintf(stderr,"Error: checkQueues %d: pop not ok.\n", queue_id);
			err_flag = 1;
		}

		uint64_t ev = (I + 1);
		ev = (ev << 32) | I;
		if (v != ev)
		{
			fprintf(stderr,"Error: checkQueues %d: expected 0x%llx, received 0x%llx\n",
					queue_id, ev, v);
			err_flag = 1;
		}
	}
	fprintf(stderr,"Info: checkQueues: pops done.\n");

	return(err_flag);
}

int checkQueuesInReverse (int queue_id)
{
	int err_flag =0;
	fprintf(stderr,"Info: checking queue in reverse %d.\n", queue_id);
	
	/*
	uint64_t queue_base_addr = 
		((queue_id == 0) ?  free_queue_base_address :
		 ((queue_id == 1) ? tx_queue_base_address : rx_queue_base_address));

	*/
	
	uint64_t queue_base_addr;		 
		switch(queue_id)
		{
			case 0   : queue_base_addr = free_queue_base_address; break;
			case 1   : queue_base_addr = tx_queue_base_address; break;
			case 2   : queue_base_addr = rx_queue_base_address; break;
			case 3   : assert(0);
		}
	
	uint32_t I;
	for(I = 0; I < QUEUE_SIZE_IN_MSGS; I++)
	{
		uint64_t v = I+1;
		v = (v << 32) | I;
		
		int p_not_ok = pushIntoQueue (queue_base_addr, v);
		if(p_not_ok)
		{
			fprintf(stderr,"Error: checkQueuesInReverse %d: push not ok.\n", queue_id);
			err_flag = 1;
		}
	}

	fprintf(stderr,"Info: checkQueuesInReverse: pushes done.\n");

	for(I = 0; I < QUEUE_SIZE_IN_MSGS; I++)
	{
		uint64_t v;
		int p_not_ok  = debugPopFromQueue (queue_id, 0, &v);
		if(p_not_ok)
		{
			fprintf(stderr,"Error: checkQueuesInReverse %d: pop not ok.\n", queue_id);
			err_flag = 1;
		}

		uint64_t ev = (I + 1);
		ev = (ev << 32) | I;
		if (v != ev)
		{
			fprintf(stderr,"Error: checkQueuesInReverse %d: expected 0x%llx, received 0x%llx\n",
					queue_id, ev, v);
			err_flag = 1;
		}
	}
	fprintf(stderr,"Info: checkQueuesInReverse: pops done.\n");

	return(err_flag);
}

