#include<stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
#include <cortos.h>
// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 180 // 80
#define QUEUE_LENGTH 16 + 4 * NUMBER_OF_BUFFERS

#define MEM_START_ADDR 0x51800 //0x3FFC00 // 3ffff8 - 3ffe00 = 1f8 = 

#define NIC_START_ADDR 0x20000000
#define NIC_END_ADDR   (NIC_START_ADDR + 255)

uint32_t* MEM = MEM_START_ADDR;
uint32_t* NIC_REG = NIC_START_ADDR;

uint32_t readNicReg(uint32_t);
void writeNicReg(uint32_t, uint32_t);
void readMemory(uint64_t);
void printMemory(void);

void swapMacAddress(uint32_t*);
void printFrame(uint32_t*);

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


void readNicRegs()
{
	int i;
	for(i = 0; i < 64; i++)
	{
		cortos_printf("NIC_REG[%d] = 0x%x\n",i,readNicReg(i));
	}
}



int main()
{
	 __ajit_write_serial_control_register__ (TX_ENABLE);
	cortos_printf ("Started\n");
	
	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 8;

	// Get queues.
	CortosQueueHeader* free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* rx_queue   = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* tx_queue   = cortos_reserveQueue(msgSizeInBytes, length, 1);
		
	cortos_printf("Reserved queues: free=0x%lx, rx=0x%lx, tx=0x%lx\n",
				(uint32_t) free_queue,
				(uint32_t) rx_queue,
				(uint32_t) tx_queue);

				
	// allocate buffers
	uint8_t* Buffers[8];
	int i;
	for(i = 0; i < 8; i++)
	{
		Buffers[i] = (uint8_t*)cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
		cortos_printf("Allocated Buffer[%d] = 0x%lx\n", i, (uint32_t) Buffers[i]);
	}


	// Put the four buffers onto the free-queue, so free queue has space, if Tx Q wants to push after transmission.

	for(i = 0; i < 4; i++)
	{
		msgs_written = cortos_writeMessages(free_queue, (uint8_t*)Buffers[i], 1);
		cortos_printf("Stored Buffer[%d] in free-queue = 0x%lx\n", i, (uint32_t) Buffers[i]);
	}

	
	//msgs_written = cortos_writeMessages(free_queue, (uint32_t) Buffers, 4);
	//msgs_written = cortos_writeMessages(free_queue,  Buffers[0], 8);
	
	// set the queues in nicRegs and enable the NIC.
	nicRegConfig(free_queue,rx_queue,tx_queue);
	cortos_printf ("Configuration Done. NIC has started\n");
        
	int I = 0;
	uint32_t buffer_with_packet = 0;
	int message_counter = 0;
	
	
	uint8_t* ptrToData = (uint8_t*)cortos_bget(4);
	//uint32_t data[1];
	//uint8_t* ptrToData=&data[0];
	while(1)
	{
		

		if(cortos_readMessages(rx_queue, ptrToData, 1)){
			cortos_printf("main:  received data in rx_queue");

			//printFrame(data);
			//swapMacAddress(data);
			//printFrame(data);
			msgs_written = cortos_writeMessages(tx_queue, ptrToData, 1);
			message_counter++;
			cortos_printf("message_counter:%d\n",message_counter);
	

		}	
		else
		{
			// Spin for 1024 clock cycles.
			
			__ajit_sleep__ (1024);
		}

		
		if(message_counter == 65)break;
		

	}
	cortos_brel(ptrToData);
	
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
		cortos_printf("Releasing buffer[%d] 0x%x\n",
					i,(uint32_t) Buffers[i]);
		cortos_brel_ncram(Buffers[i]);
		cortos_printf("Released buffer[%d] 0x%x\n",
					i,(uint32_t) Buffers[i]);
		
	}
		

	return 0;
}

uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	//data = __ajit_load_word_mmu_bypass__(&NIC_REG[index]);
	data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	return data;
}


void writeNicReg(uint32_t index, uint32_t value)
{
	//__ajit_store_word_mmu_bypass__(value,&NIC_REG[index]);
	__ajit_store_word_to_physical_address__(value,(uint64_t) &NIC_REG[index]);
}


void readMemory(uint64_t phy_addr)
{
	uint32_t data;
	data = __ajit_load_word_from_physical_address__(phy_addr);
	cortos_printf ("data at addr = 0x%lx%lx is 0x%x\n",phy_addr,phy_addr,data);
}

void printMemory()
{
	int i = 0;
	cortos_printf("i = %u",i);
	for(i=0; i<512; i+=2) // 0x40000 
	{
		cortos_printf("i = %u",i);
		cortos_printf("Data at location 0x%x is = 0x%08x%08x\n",(MEM+i),MEM[i],MEM[i+1]);
		//readMemory((uint64_t)(MEM+i));
	}
}

void swapMacAddress(uint32_t* data)
{

	char src_mac[6], dest_mac[6];
	int count =8; // header starts from (buff_addr+8)

	// Original SRC and DEST MAC addresses


	dest_mac[0] = *((uint8_t*)data[0]+count+7); 
	dest_mac[1] = *((uint8_t*)data[0]+count+6);
	dest_mac[2] = *((uint8_t*)data[0]+count+5);
	dest_mac[3] = *((uint8_t*)data[0]+count+4);
	dest_mac[4] = *((uint8_t*)data[0]+count+3);
	dest_mac[5] = *((uint8_t*)data[0]+count+2);

	src_mac[0] = *((uint8_t*)data[0]+count+1);
	src_mac[1] = *((uint8_t*)data[0]+count+0);
	count = count + 8;
	src_mac[2] = *((uint8_t*)data[0]+count+7); 
	src_mac[3] = *((uint8_t*)data[0]+count+6);
	src_mac[4] = *((uint8_t*)data[0]+count+5);
	src_mac[5] = *((uint8_t*)data[0]+count+4);

	// Swapping SRC and DEST MAC addresses
	/*
	count = 8;
	*((uint8_t*)data[0]+count+7) = src_mac[0];
	*((uint8_t*)data[0]+count+6) = src_mac[1];
	*((uint8_t*)data[0]+count+5) = src_mac[2];
	*((uint8_t*)data[0]+count+4) = src_mac[3];
	*((uint8_t*)data[0]+count+3) = src_mac[4];
	*((uint8_t*)data[0]+count+2) = src_mac[5];

	*((uint8_t*)data[0]+count+1) = dest_mac[0];
	*((uint8_t*)data[0]+count+0) = dest_mac[1];
	count = count + 8;
	*((uint8_t*)data[0]+count+7) = dest_mac[2];
	*((uint8_t*)data[0]+count+6) = dest_mac[3];
	*((uint8_t*)data[0]+count+5) = dest_mac[4];
	*((uint8_t*)data[0]+count+4) = dest_mac[5];
	*/

	count = count + 8;
	*((uint8_t*)data[0]+count+7) = src_mac[0];
	*((uint8_t*)data[0]+count+6) = src_mac[1];
	*((uint8_t*)data[0]+count+5) = src_mac[2];
	*((uint8_t*)data[0]+count+4) = src_mac[3];
	*((uint8_t*)data[0]+count+3) = src_mac[4];
	*((uint8_t*)data[0]+count+2) = src_mac[5];

	*((uint8_t*)data[0]+count+1) = dest_mac[0];
	*((uint8_t*)data[0]+count+0) = dest_mac[1];
	count = count + 8;
	*((uint8_t*)data[0]+count+7) = dest_mac[2];
	*((uint8_t*)data[0]+count+6) = dest_mac[3];
	*((uint8_t*)data[0]+count+5) = dest_mac[4];
	*((uint8_t*)data[0]+count+4) = dest_mac[5];



}

void printFrame(uint32_t* data)
{
	int count;
	count=0;
			
	// printing the header

	cortos_printf("content of header are: \n");
	while(count<40)
	{
		cortos_printf("%x %x %x %x %x %x %x %x  \n",
		*((uint8_t*)data[0]+count+7),
		*((uint8_t*)data[0]+count+6),
		*((uint8_t*)data[0]+count+5),
		*((uint8_t*)data[0]+count+4),
		*((uint8_t*)data[0]+count+3),
		*((uint8_t*)data[0]+count+2),
		*((uint8_t*)data[0]+count+1),
		*((uint8_t*)data[0]+count+0)
		);
		count=count+8;
	}


	// printing the payload

	cortos_printf("content of payload are: \n");
	while(count<96)
	{
		cortos_printf("%x %x %x %x %x %x %x %x => %c %c %c %c %c %c %c %c \n",
		*((uint8_t*)data[0]+count+7),
		*((uint8_t*)data[0]+count+6),
		*((uint8_t*)data[0]+count+5),
		*((uint8_t*)data[0]+count+4),
		*((uint8_t*)data[0]+count+3),
		*((uint8_t*)data[0]+count+2),
		*((uint8_t*)data[0]+count+1),
		*((uint8_t*)data[0]+count+0),
		*((uint8_t*)data[0]+count+7),
		*((uint8_t*)data[0]+count+6),
		*((uint8_t*)data[0]+count+5),
		*((uint8_t*)data[0]+count+4),
		*((uint8_t*)data[0]+count+3),
		*((uint8_t*)data[0]+count+2),
		*((uint8_t*)data[0]+count+1),
		*((uint8_t*)data[0]+count+0)
		);
		count=count+8;
	}

}





