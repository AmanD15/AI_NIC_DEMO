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

	fprintf(stderr,"Info: getField returns val=0x%llx, val32 = 0x%x, field=%d, qbase=0x%x,  addr=0x%x\n", val, val32, q_base_addr, field, addr);
	return(val32);
}

void setField (uint32_t q_base_addr, uint32_t field, uint32_t val32)
{
	uint32_t addr = (q_base_addr + (8*(field/2)));
	uint8_t bmask = (field & 0x1) ? 0xf : 0xf0;	
	uint64_t val = val32;
	val = (field & 0x1) ? val : (val << 32);

	fprintf(stderr,"Info: setField val=0x%llx, qbase-addr=0x%lx, %d (addr=0x%x), bmask=0x%x, wrote 0x%x\n", val, q_base_addr, field, addr, bmask, val32);
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


void setReadPointer (uint32_t q_base_addr, uint32_t val)
{
	setField(q_base_addr, 1, val);
}
uint32_t setWritePointer (uint32_t q_base_addr, uint32_t val)
{
	setField(q_base_addr, 2, val);
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
	uint8_t  bmask  = (entry_addr & 0x4) ? 0xf : 0xf0;
	uint64_t v64 = qval;

	processorAccessMemory (0, 0, bmask, entry_addr, v64);
}


// return 0 on successful acquire.
int acquireLock(uint64_t q_base_address)
{
	fprintf(stderr,"Info: entered acquireLock 0x%llx\n", q_base_address);
	int ret_val = 0;

	// get the lock pointer.
	uint32_t lock_pointer = getField(q_base_address,5);
	fprintf(stderr,"Info: acquireLock lock-pointer = 0x%x\n", lock_pointer);

	// the lock is stored in the byte pointed to by the
	// lock-pointer
	uint8_t  byte_index =  (lock_pointer & 0x7);
	uint8_t  bmask = (1 << (7 - byte_index));

	// get the lock value: note the locking below.
	uint64_t val = processorAccessMemory (1, 1, 0xf0, lock_pointer, 0);
	val = (val >> ((7 - byte_index)*8)) & 0xff;

	fprintf(stderr,"Info: acquireLock lock-value = 0x%x\n", (uint32_t) val);

	if(val == 0x0)
	// write 0xff into lock.
	{
		// write the lock value and unlock the memory.
		processorAccessMemory (0, 0, bmask, lock_pointer, 0xffffffffffffffff);
		fprintf(stderr,"Info: acquireLock success.\n");
		return(0);
	}
	else 
	{
		// unlock the memory bus, by reading the lock pointer again.
		val = processorAccessMemory (0, 1, 0xff, lock_pointer, 0);
		fprintf(stderr,"Info: acquireLock failure.\n");
	}
	return(1);
}

int releaseLock(uint64_t q_base_address)
{
	fprintf(stderr,"Info: entered releaseLock 0x%llx\n", q_base_address);

	// get the lock pointer.
	uint32_t lock_pointer = getField (q_base_address, 5);
	fprintf(stderr,"Info: releaseLock lock-pointer = 0x%x\n", lock_pointer);

	uint8_t  byte_index =  (lock_pointer & 0x7);
	uint8_t  bmask = (1 << (7 - byte_index));

	// write the lock value and unlock the memory.
	processorAccessMemory (0, 0, bmask, lock_pointer, 0x0);
	fprintf(stderr,"Info: leaving releaseLock \n");
	return(0);
}



// return 0 on success
int pushIntoQueue (uint64_t q_base_address, uint64_t val)
{
	fprintf(stderr,"Info: entered pushIntoQueue 0x%llx, 0x%x \n", q_base_address, val);
	int ret_val = 1;
	while(acquireLock(q_base_address)) 
	{
		sleep(1000);
	};

	uint32_t read_index = getReadPointer(q_base_address);
	uint32_t write_index = getWritePointer(q_base_address);

	write_index = (write_index + 1) % QUEUE_SIZE_IN_MSGS;

	if(write_index  != read_index)
	{

		ret_val = 0;
		setQueueEntry (q_base_address, write_index, val);
		setWritePointer (q_base_address, write_index);

		uint32_t nmsgs = getNumberOfMessages (q_base_address);
		setNumberOfMessages (q_base_address, nmsgs + 1);
	}

	releaseLock (q_base_address);
	fprintf(stderr,"Info: left pushIntoQueue returns %d \n", ret_val);
	return(ret_val);
}


// return 0 on success
int popFromQueue  (uint64_t q_base_address, uint64_t* val)
{
	fprintf(stderr,"Info: start popFromQueue 0x%llx\n", q_base_address);
	int ret_val = 1;
	*val = 0;
	while(acquireLock(q_base_address)) 
	{
		sleep(1000);
	}

	uint32_t read_index = getReadPointer(q_base_address);
	uint32_t write_index = getWritePointer(q_base_address);

	if(write_index != read_index)
	{

		ret_val = 0;
		*val = getQueueEntry (q_base_address, read_index);

		read_index = (read_index + 1) % QUEUE_SIZE_IN_MSGS;
		setReadPointer  (q_base_address, read_index);

		uint32_t nmsgs = getNumberOfMessages (q_base_address);
		setNumberOfMessages (q_base_address, nmsgs - 1);
	}

	releaseLock (q_base_address);
	fprintf(stderr,"Info: done popFromQueue returns %d\n", ret_val);
	return(ret_val);
}
