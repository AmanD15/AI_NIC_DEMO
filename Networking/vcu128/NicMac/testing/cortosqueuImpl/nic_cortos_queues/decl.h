#ifndef __decl_h
#define __decl_h
#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
#include <cortos.h>
// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 1700 // 80
#define FILE_BUF_SIZE 10100
#define QUEUE_LENGTH (16 + (4 * NUMBER_OF_BUFFERS))

#define MEM_START_ADDR 0x3FF800  

#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1fffffff

uint32_t* MEM = MEM_START_ADDR;
uint32_t* NIC_REG = NIC_START_ADDR;

typedef struct __NicQueue__
{
	CortosQueueHeader* free_queue;
	CortosQueueHeader* tx_queue; 
	CortosQueueHeader* rx_queue; 
}NicQueue;

// Function reserves cortos queues(rx,tx,free) of size msgSizeInBytes*length
//  Returns = NicQueue structure
NicQueue generateNicQueue(uint32_t msgSizeInBytes, uint32_t length);

// Function to use NIC registers
//  arg = reg index
//  returns = reg value
uint32_t readNicReg(uint32_t);

// Function to print values of all NIC's registers
void readNicRegs();

// Function to write value to NIC reg
//  arg1 = reg index
//  arg2 = value to be written 
void writeNicReg(uint32_t, uint32_t);

// Function to read(print) memory from physical addresss
// arg = physical addr
void readMemory(uint64_t);

// Function to print Buffer 
//  arg1 = buffer address
//  arg2 = buffer size
void printBuffer(uint32_t*, int);


// Function to store packet in file
//  arg1 = start flag - make 1 when storing first packet 
//  arg2 = file buffer address
//  arg3 = packet buffer address
//  arg4 = address to last written index for file 
void storeFile(int*, uint32_t*, uint32_t*, int*);

// Function to Send file out from memory
//  Breaks the file in packets and sends out
// arg1 = file buffer address
// arg2 = address of free queue
// arg3 = address of tx queue
// aeg4 = last written index {of arg1}
int sendFile(uint32_t* file_buf, CortosQueueHeader* free_queue, CortosQueueHeader* tx_queue, int last_written_index);

// Not needed
void loadEthernetHeader(uint32_t* buffer_addr, uint32_t* eth_hdr);

// Function configures NIC's register with addrress of queues and starts nic
//  arg1 = address of free queue
//  arg2 = address of rx queue
//  arg3 = address of tx queue
void nicRegConfig(CortosQueueHeader* free_queue, CortosQueueHeader* rx_queue,CortosQueueHeader* tx_queue);

// Function to get configuration file from NIC
//  arg1 = file buf address
//  arg2 = address of free_queue
//  arg3 = address of rx queue
//  arg4 = address of last written index
void getConfigData(uint64_t* file_start_ptr, CortosQueueHeader* free_queue,CortosQueueHeader *rx_queue, int* lwi);

#endif
