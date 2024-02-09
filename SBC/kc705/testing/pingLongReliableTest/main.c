#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
#include <cortos.h>
// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 180
#define QUEUE_LENGTH (16 + 4 * NUMBER_OF_BUFFERS)

#define NIC_START_ADDR 0xFF000000
#define NIC_END_ADDR   (NIC_START_ADDR + 255)


uint32_t* NIC_REG = NIC_START_ADDR;

uint32_t readNicReg(uint32_t);
void writeNicReg(uint32_t, uint32_t);
void nicRegConfig(CortosQueueHeader*, CortosQueueHeader*, CortosQueueHeader*);
void swapMacAddress(uint32_t*);
void printFrame(uint32_t*);

struct CortosQueueHeader* volatile free_queue;
struct CortosQueueHeader* volatile rx_queue;
struct CortosQueueHeader* volatile tx_queue;

uint32_t * volatile Buffers[8];

int main()
{
	 __ajit_write_serial_control_register__ (TX_ENABLE);
	cortos_printf ("Started\n");
	
	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 8;
	int I = 0;
	int message_counter = 0;
	uint32_t data[1];
	
	// Get queues.

	free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	rx_queue   = cortos_reserveQueue(msgSizeInBytes, length, 1);
	tx_queue   = cortos_reserveQueue(msgSizeInBytes, length, 1);
		
	cortos_printf("Reserved queues: free=0x%lx, rx=0x%lx, tx=0x%lx\n",
				(uint32_t) free_queue,
				(uint32_t) rx_queue,
				(uint32_t) tx_queue);

				
	// Allocate buffers
	
	int i;
	for(i = 0; i < 8; i++)
	{
		Buffers[i] = (uint32_t*) cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
		cortos_printf("Allocated Buffer[%d] = 0x%lx\n", i,(uint32_t)Buffers[i]);
	}


	// Preparing the allocated buffers, to push into the Q, via cortos_writeMessages

	uint32_t BuffersForQ[8];
	for(i = 0;i < 8; i++)
	BuffersForQ[i] = (uint32_t) Buffers[i];
	
	// Put the four buffers onto the free-queue, so free queue has space, if Tx Q wants to push after transmission.

	for(i = 0; i < 4; i++)
	{
		msgs_written = cortos_writeMessages(free_queue, (uint8_t*) (BuffersForQ + i), 1);
		cortos_printf("Stored Buffer[%d] in free-queue = 0x%lx\n", i, BuffersForQ[i]);
	}

	
	
	// set the queues in nicRegs and enable the NIC.
	nicRegConfig(free_queue,rx_queue,tx_queue);
	cortos_printf ("Configuration Done. NIC has started\n");
        
	
	
	
	while(1)
	{
		

		if(cortos_readMessages(rx_queue, (uint8_t*)data, 1)){

			printFrame(data);
			swapMacAddress(data);
			//printFrame(data);
			msgs_written = cortos_writeMessages(tx_queue, (uint8_t*)data, 1);
			message_counter++;
			cortos_printf("message_counter:%d\n",message_counter);
	

		}	
		else
		{
			// Spin for 1024 clock cycles.
			
			__ajit_sleep__ (1024);
		}

		
		
		

	}
	
	
	uint32_t tx_packet_count = readNicReg(21);	
	cortos_printf("Info: NIC has transmitted %d packets.\n", tx_packet_count);
	
	writeNicReg(0,0);

	// free queue
	cortos_freeQueue(rx_queue);	
	cortos_freeQueue(tx_queue);	
	cortos_freeQueue(free_queue);

	// release buffers
	for(i = 0; i < 8; i++)
	{
		cortos_printf("Releasing buffer[%d] 0x%lx\n",i,(uint32_t)Buffers[i]);
		cortos_brel_ncram(Buffers[i]);
		cortos_printf("Released  buffer[%d] 0x%lx\n",i,(uint32_t)Buffers[i]);
		
	}
		

	return 0;
}



void nicRegConfig(CortosQueueHeader* Free_Queue, 
			CortosQueueHeader* Rx_Queue,
			CortosQueueHeader* Tx_Queue)
{
	cortos_printf("NIC_REG[22]=0x%x\n",readNicReg(22));
	
	writeNicReg(1,1);			//NIC_REG[1] = 1;//NUMBER_OF_SERVERS;
	writeNicReg(2,(uint32_t)Rx_Queue);	//NIC_REG[2] = Rx_Queue;
	writeNicReg(10,(uint32_t)Tx_Queue);	//NIC_REG[10] = Tx_Queue;
	writeNicReg(18,(uint32_t)Free_Queue);	//NIC_REG[18] = Free_Queue;

	writeNicReg (21, 0); // number of transmmitted packets = 0.

	// Enable NIC.
	writeNicReg(0,1); 			//NIC_REG[0] = 1;
	cortos_printf("NIC_regs: [1]=0x%x,[2]=0x%x,[10]=0x%x,[18]=0x%x,[0]=0x%x,"
			"[21]=0x%x,[22]=0x%x\n",
			readNicReg(1),
			readNicReg(2),
			readNicReg(10),
			readNicReg(18),
			readNicReg(0),
			readNicReg(21),
			readNicReg(22));
}	







uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	//data = __ajit_load_word_mmu_bypass__(&NIC_REG[index]);
	//data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	data = NIC_REG[index];

	return data;
}


void writeNicReg(uint32_t index, uint32_t value)
{
	//__ajit_store_word_mmu_bypass__(value,&NIC_REG[index]);
	//__ajit_store_word_to_physical_address__(value,(uint64_t) &NIC_REG[index]);
	NIC_REG[index] = value;



}





void swapMacAddress(uint32_t* data)
{
	

	/* PACKET STRUCTURE BEGIN:
                 
		data      : -  -  -  -  -  -  -  -
		ptrToHead : d0 d1 d2 d3 d4 d5 s0 s1 
			    s2 s3 s4 s5 -  -  -  -
			    d0 d1 d2 d3 d4 d5 s0 s1 
			    s2 s3 s4 s5 -  -  -  -
		ptrToData :
			
	   PACKET STRUCTURE END

           observation: first 8 bytes have 6 bytes of Dest MAC address
		        and 2 bytes of source MAC address. Next 8 bytes
		        have remaining 4 bytes of source MAC address.
	
	*/


	int i,count=0;
	uint8_t src_mac[6], dest_mac[6];
	uint8_t* ptrToHead = data[0] + 8; // header starts from (buff_addr+8)





	// Extracting Original SRC and DEST MAC addresses

	dest_mac[0] = *(ptrToHead + 7); 
	dest_mac[1] = *(ptrToHead + 6);
	dest_mac[2] = *(ptrToHead + 5);
	dest_mac[3] = *(ptrToHead + 4);
	dest_mac[4] = *(ptrToHead + 3);
	dest_mac[5] = *(ptrToHead + 2);
	src_mac[0]  = *(ptrToHead + 1);
	src_mac[1]  = *(ptrToHead + 0);

	count = count + 8;
	src_mac[2] = *(ptrToHead+count+7); 
	src_mac[3] = *(ptrToHead+count+6);
	src_mac[4] = *(ptrToHead+count+5);
	src_mac[5] = *(ptrToHead+count+4);

	cortos_printf("Destination MAC address: %x %x %x %x %x %x\n",
		dest_mac[0],
		dest_mac[1],
		dest_mac[2],
		dest_mac[3],
		dest_mac[4],
		dest_mac[5]
	
		);

	cortos_printf("Source MAC address: %x %x %x %x %x %x\n",
		src_mac[0],
		src_mac[1],
		src_mac[2],
		src_mac[3],
		src_mac[4],
		src_mac[5]
	
		);

	
	// Swapping Original SRC and DEST MAC addresses 

	count = count + 8; //Swapping at the second dest and src MAC addr location.
	*(ptrToHead+count+7) = src_mac[0];
	*(ptrToHead+count+6) = src_mac[1];
	*(ptrToHead+count+5) = src_mac[2];
	*(ptrToHead+count+4) = src_mac[3];
	*(ptrToHead+count+3) = src_mac[4];
	*(ptrToHead+count+2) = src_mac[5];
	*(ptrToHead+count+1) = dest_mac[0];
	*(ptrToHead+count+0) = dest_mac[1];

	count = count + 8;
	*(ptrToHead+count+7) = dest_mac[2];
	*(ptrToHead+count+6) = dest_mac[3];
	*(ptrToHead+count+5) = dest_mac[4];
	*(ptrToHead+count+4) = dest_mac[5];



}

void printFrame(uint32_t* data)
{
	int count=0;
	uint8_t* ptrToHead = data[0]; 
			
	// printing the header

	cortos_printf("content of header are: \n");
	while(count<40)
	{
		cortos_printf("%x %x %x %x %x %x %x %x  \n",
		*(ptrToHead + count + 7),
		*(ptrToHead + count + 6),
		*(ptrToHead + count + 5),
		*(ptrToHead + count + 4),
		*(ptrToHead + count + 3),
		*(ptrToHead + count + 2),
		*(ptrToHead + count + 1),
		*(ptrToHead + count + 0)
		);
		count=count+8;
	}



}





