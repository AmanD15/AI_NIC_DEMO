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

//#define NIC_START_ADDR 0xFFFF5000
//#define NIC_END_ADDR   0xFFFF50FF
#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1fffffff

uint32_t* MEM = MEM_START_ADDR;
uint32_t* NIC_REG = NIC_START_ADDR;

uint32_t readNicReg(uint32_t);
void writeNicReg(uint32_t, uint32_t);
void readMemory(uint64_t);
void printMemory(void);

void loadEthernetHeader(uint32_t* buffer_addr, uint32_t* eth_hdr)
{
	/*eth_hdr[0] = buffer_addr[2];
	eth_hdr[1] = buffer_addr[3];
	eth_hdr[2] = buffer_addr[4];
	eth_hdr[3] = buffer_addr[5];*/
	
	//eth_hdr[0] = buffer_addr[6];
	//eth_hdr[1] = buffer_addr[7];
	//eth_hdr[2] = buffer_addr[8];
	//eth_hdr[3] = buffer_addr[9];

	buffer_addr[6] = 0x0a001f0e;
	buffer_addr[7] = 0x1571e130;
	buffer_addr[8] = 0x68540008;
	buffer_addr[9] = 0x501e0335;
}

void nicRegConfig(CortosQueueHeader* Free_Queue, CortosQueueHeader* Rx_Queue,CortosQueueHeader* Tx_Queue)
{
	ee_printf("NIC_REG[22]=0x%x\n",readNicReg(22));
	writeNicReg(1,1);			//NIC_REG[1] = 1;//NUMBER_OF_SERVERS;
	writeNicReg(2,(uint32_t)Rx_Queue);	//NIC_REG[2] = Rx_Queue;
	writeNicReg(10,(uint32_t)Tx_Queue);	//NIC_REG[10] = Tx_Queue;
	writeNicReg(18,(uint32_t)Free_Queue);	//NIC_REG[18] = Free_Queue;
	// start NIC
	writeNicReg(0,1); 			//NIC_REG[0] = 1;
	ee_printf("NIC_regs: [1]=0x%x,[2]=0x%x,[10]=0x%x,[18]=0x%x,[0]=0x%x,"
			"[21]=0x%x,[22]=0x%x\n",readNicReg(1),readNicReg(2),
			readNicReg(10),readNicReg(18),readNicReg(0),readNicReg(21),readNicReg(22));
}	
void readNicRegs()
{
	int i;
	for(i = 0; i < 64; i++)
	{
		
		ee_printf("NIC_REG[%d] = 0x%x\n",i,readNicReg(i));
	}
}

int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	ee_printf ("Started\n");
	
	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 8;
	CortosQueueHeader* free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* rx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	CortosQueueHeader* tx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);

	// allocate buffers
	uint8_t* Buffers[8];
	int i;
	for(i = 0; i < 8; i++)
	{
		Buffers[i] = (uint8_t*)cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
	}
	ee_printf ("All Addresses:\n\tBuffer[0]=0x%lx,\n\tBuffer[1]=0x%lx,\n\tBuffer[2]=0x%lx,"
			"\n\trx_queue=0x%lx,\n\ttx_queue=0x%lx,\n\tFree_Queue=0x%lx\n",Buffers[0],
			Buffers[1],Buffers[2],rx_queue,tx_queue,free_queue);

	msgs_written = cortos_writeMessages(free_queue, Buffers, 4);
	
	nicRegConfig(free_queue,rx_queue,tx_queue);
	ee_printf ("Configuration Done. NIC has started\n");

	uint32_t eth_hdr[4];
        //loadEthernetHeader(Buffers[0],&eth_hdr);
        
	int I = 0;
	uint32_t buffer_with_packet = 0;
	while(1){
		uint32_t data[1];
		readNicRegs();
		if(cortos_readMessages(rx_queue, (uint8_t*)data, 1)){

			//ee_printf ("Got buffer pointer from Rx_queue=0x%x\n",data[1]);
			//loadEthernetHeader(data[0],&eth_hdr);
			//cortos_printf("ETH Header = 0x%lx\t0x%lx\t0x%lx\t0x%lx\n",eth_hdr[0],eth_hdr[1],eth_hdr[2],eth_hdr[3]);
			msgs_written = cortos_writeMessages(tx_queue, (uint8_t*)data, 1);
			//ee_printf ("Written to Tx queue.mags_written=%u\nNIC_REG[21]=0x%x\n",msgs_written,readNicReg(21));
		}	
		else
		{
			//ee_printf ("Reading Rx_Queue\n");
			int k = 0;
			for(k = 0; k < 2500000; k++);
			//ee_printf ("Nothing in Rx queue.\nNIC_REG[21]=0x%x\n",readNicReg(21));
			//ee_printf ("Free Queue = 0x%x, rx_queue = 0x%x, tx_queue = 0x%x\n",free_queue,rx_queue,tx_queue);
		}
	}
	writeNicReg(0,0);

	// free queue
	cortos_freeQueue(rx_queue);	
	cortos_freeQueue(tx_queue);	
	cortos_freeQueue(free_queue);

	// release buffers
	for(i = 0; i < 8; i++)
	{
		cortos_brel(Buffers[i]);
	}
	readNicRegs();
	printMemory();	

	return(0);
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
	__ajit_store_word_to_physical_address__(value,&NIC_REG[index]);
}


void readMemory(uint64_t phy_addr)
{
	uint32_t data;
        data = __ajit_load_word_from_physical_address__(phy_addr);
	ee_printf ("data at addr = 0x%lx%lx is 0x%x\n",phy_addr,phy_addr,data);
}

void printMemory()
{
	int i = 0;
	ee_printf("i = %u",i);
	for(i=0; i<512; i+=2) // 0x40000 
	{
		ee_printf("i = %u",i);
		ee_printf("Data at location 0x%x is = 0x%08x%08x\n",(MEM+i),MEM[i],MEM[i+1]);
		//readMemory((uint64_t)(MEM+i));
	}
}
