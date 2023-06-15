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

//
NicQueue generateNicQueue(uint32_t msgSizeInBytes, uint32_t length);

uint32_t readNicReg(uint32_t);

void writeNicReg(uint32_t, uint32_t);

void readMemory(uint64_t);

void printMemory(void);

void printBuffer(uint32_t*, int);

void storeFile(int*, uint32_t*, uint32_t*, int*);

int sendFile(uint32_t* file_buf, CortosQueueHeader* free_queue, CortosQueueHeader* tx_queue, int last_written_index);

void loadEthernetHeader(uint32_t* buffer_addr, uint32_t* eth_hdr);

void nicRegConfig(CortosQueueHeader* free_queue, CortosQueueHeader* rx_queue,CortosQueueHeader* tx_queue);

void readNicRegs();

uint32_t readNicReg(uint32_t index);

void writeNicReg(uint32_t index, uint32_t value);

void readMemory(uint64_t phy_addr);

void printMemory();

void printBuffer(uint32_t* buffer, int buf_size);

void storeFile(int* start, uint32_t* file_buf, uint32_t* packet, int* last_written_index_addr);

int sendFile(uint32_t* file_buf, CortosQueueHeader* free_queue, CortosQueueHeader* tx_queue, int last_written_index);

void getConfigData(uint64_t* file_start_ptr, CortosQueueHeader* free_queue,CortosQueueHeader *rx_queue, int* lwi);

NicQueue generateNicQueue(uint32_t msgSizeInBytes, uint32_t length)
{
	NicQueue nicQueue;
	nicQueue.rx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	nicQueue.tx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	nicQueue.free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);

	return nicQueue;
}

void loadEthernetHeader(uint32_t* buffer_addr, uint32_t* eth_hdr)
{

	buffer_addr[6] = 0x0a001f0e;
	buffer_addr[7] = 0x1571e130;
	buffer_addr[8] = 0x68540008;
	buffer_addr[9] = 0x0a760535;	//0x501e0335;
}

void nicRegConfig(CortosQueueHeader* free_queue, CortosQueueHeader* rx_queue,CortosQueueHeader* tx_queue)
//void nicRegConfig(NicQueue* NQ)
{
	CORTOS_DEBUG("NIC_REG[22]=0x%x\n",readNicReg(22));
	uint32_t nic_reg_data;
	nic_reg_data = readNicReg(2);
	CORTOS_DEBUG("NIC reg 2 = 0x%x\t NQ.rx_queue = 0x%lx\n", nic_reg_data, rx_queue);
	
	writeNicReg(1,1);			//NIC_REG[1] = 1;//NUMBER_OF_SERVERS;
	writeNicReg(2,(uint32_t)rx_queue);	//NIC_REG[2] = Rx_Queue;
	writeNicReg(10,(uint32_t)tx_queue);	//NIC_REG[10] = Tx_Queue;
	writeNicReg(18,(uint32_t)free_queue);	//NIC_REG[18] = Free_Queue;
	
	// debug logic
	nic_reg_data = readNicReg(2);
	CORTOS_DEBUG("NIC reg 2 = 0x%x\t NQ.rx_queue = 0x%lx\n", nic_reg_data, (uint32_t)rx_queue);
	
	if(nic_reg_data != (uint32_t)rx_queue)
		while(1);
	// start NIC
	writeNicReg(0,0); //C_regs: 
	CORTOS_DEBUG("NIC config done\n");
		
}	
void readNicRegs()
{
	int i;
	for(i = 0; i < 64; i++)
	{
		
		CORTOS_DEBUG("NIC_REG[%d] = 0x%x\n",i,readNicReg(i));
	}
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
	CORTOS_DEBUG ("data at addr = 0x%lx%lx is 0x%x\n",phy_addr,phy_addr,data);
}

void printMemory()
{
	int i = 0;
	CORTOS_DEBUG("i = %u",i);
	for(i=0; i<512; i+=2) // 0x40000 
	{
		CORTOS_DEBUG("i = %u",i);
		CORTOS_DEBUG("Data at location 0x%x is = 0x%08x%08x\n",(MEM+i),MEM[i],MEM[i+1]);
		//readMemory((uint64_t)(MEM+i));
	}
}

void printBuffer(uint32_t* buffer, int buf_size)
{
	int i;
	for(i = 0; i < buf_size/4; i+=2)
		CORTOS_DEBUG("value at buffer addr[0x%lx] = 0x%lx%lx\n", (buffer+i), buffer[i], buffer[i+1]);	

}

void storeFile(int* start, uint32_t* file_buf, uint32_t* packet, int* last_written_index_addr)
{
	int file_buf_size;
	int packet_size;
	int index;
	packet_size = (int)(*(packet+1))>>8 & 0x7ff;
	if((*(packet + 8)>>25) & 0x1 == 1 )
	{
		*(file_buf + 1) = *(packet+1);
	}
	//CORTOS_DEBUG("packet_size = %d\n", packet_size);
	if(*start == 1)
	{
		*(file_buf + 2) = *(packet+6); // eth hdr 0
		*(file_buf + 3) = *(packet+7); // eth hdr 0
		*(file_buf + 4) = *(packet+8); // eth hdr 1
		*(file_buf + 5) = *(packet+9); // eth hdr 1
		file_buf_size = 16;
		index  = 6;
		*start = 0;
	}
	else
		index = *last_written_index_addr + 1;

	int I;

	for(I = 10; I < packet_size/4; I+=2)
	{
		*(file_buf + index) = *(packet + I);
		*(file_buf + index + 1) = *(packet + I + 1);
		*last_written_index_addr = index + 1;
		index += 2;
		file_buf_size += 8; 
	}
	if((I-1)*4 != packet_size)
	{
		*(file_buf + index) = *(packet + I);
		*(file_buf + index + 1) = *(packet + I + 1);
		*last_written_index_addr = index + 1;
		file_buf_size += packet_size % 8;
	}

}

int sendFile(uint32_t* file_buf, CortosQueueHeader* free_queue, CortosQueueHeader* tx_queue, int last_written_index)
{
	int size_in_bytes = (last_written_index + 1)*4;
	int payload_size_in_bytes = (last_written_index - 5)*4;
	uint32_t* data[1];
	//uint8_t tkeep[8] = {0x00,0x01,0x03,0x07,0x0f,0x1f,0x3f,0x7f};
	uint32_t byte0, byte1, byte2, byte3;
	uint16_t buf_size;
	uint8_t last_tkeep, tkeep;
	int msgs_written;
	int remaining_bytes = size_in_bytes % 8;

	buf_size = (last_written_index-5)*4+32;
	last_tkeep = *(file_buf+1)&0xff; //tkeep[remaining_bytes];
	tkeep = 0xff;

	byte0 = *(file_buf + 2);
	byte1 = *(file_buf + 3);
	byte2 = *(file_buf + 4);
	byte3 = *(file_buf + 5);


	if(size_in_bytes > 1512)
	{
		int bytes_rem = payload_size_in_bytes;
		int i,j;
		int k;
		j = 6;	
		while(1)
		{
			buf_size = 0x5f8;
			while(1)
			{
				if(cortos_readMessages(free_queue, (uint8_t*)data, 1))
					break;
				else
					CORTOS_DEBUG("free_queue empty\n");
			}
			uint32_t* packet_buf_addr = (uint32_t *)data[0];
			*(packet_buf_addr + 1) = buf_size<<8 | tkeep; // control data
			*(packet_buf_addr + 6) = byte0;
			*(packet_buf_addr + 7) = byte1;
			*(packet_buf_addr + 8) = byte2 & ~(0x1 << 25);
			*(packet_buf_addr + 9) = byte3;
		
			for(i = 10, k = 0; k < 1496/4; j+=2 , i+=2, k = k+2)
			{
				*(packet_buf_addr+i) = *(file_buf + j);
				*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
			}
			while(1)
			{
				if(cortos_writeMessages(tx_queue, (uint8_t*)data,1))
					break;
				else
					CORTOS_DEBUG("tx_queue full\n");
			}
			bytes_rem = bytes_rem - 1496;
			if(bytes_rem < 1496)
			{
				//CORTOS_DEBUG("last pkt");
				buf_size = bytes_rem + 32;
				while(1)
				{
					if(cortos_readMessages(free_queue, (uint8_t*)data, 1))
						break;
					else
						CORTOS_DEBUG("free_queue empty!\n");
				}
				uint32_t* packet_buf_addr = (uint32_t *)data[0];
				*(packet_buf_addr + 1) = buf_size<<8 | last_tkeep; // control data
	
				// header and EOF
				*(packet_buf_addr + 6) = byte0;
				*(packet_buf_addr + 7) = byte1;
				*(packet_buf_addr + 8) = byte2 | (1 << 25);
				*(packet_buf_addr + 9) = byte3;
				
				// payload
				for(i = 10,k = 0; k < bytes_rem/4; i+=2, j+=2, k+=2)
				{
					*(packet_buf_addr+i) = *(file_buf + j);
					*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
				}
				if(((k-1)*4) != bytes_rem)
				{	
					*(packet_buf_addr+i) = *(file_buf + j);
					*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
				}
				//CORTOS_DEBUG("*data = 0x%lx, pkt_buf_addr = 0x%lx\n", data[0],packet_buf_addr);
				while(1)
				{
					if(cortos_writeMessages(tx_queue, (uint8_t*)data, 1))
						break;
					else
						CORTOS_DEBUG("tx_queue full\n");
				}
				break;
			}
		}	
	}
	else
	{
		while(1)
		{
			if(cortos_readMessages(free_queue, (uint8_t*)data, 1))
				break;
			else
				CORTOS_DEBUG("free_queue empty!\n");
		}
		uint32_t* packet_buf_addr = (uint32_t *)data[0];
		*(packet_buf_addr + 1) = buf_size<<8 | last_tkeep; // control data
		
		// header and EOF
		*(packet_buf_addr + 6) = byte0;
		*(packet_buf_addr + 7) = byte1;
		*(packet_buf_addr + 8) = byte2;
		*(packet_buf_addr + 9) = byte3;
	
			
		int i,j;
		// payload
		for(i = 10, j = 6; j < size_in_bytes/4; i+=2, j+=2)
		{
			*(packet_buf_addr+i) = *(file_buf + j);
			*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
		}
		if(((i-1)*4) != size_in_bytes)
		{	
			*(packet_buf_addr+i) = *(file_buf + j);
			*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
		}
		printBuffer(packet_buf_addr,BUFFER_SIZE_IN_BYTES);
		//CORTOS_DEBUG("*data = 0x%lx, pkt_buf_addr = 0x%lx\n", data[0],packet_buf_addr);
		while(1)
		{
			if(cortos_writeMessages(tx_queue, (uint8_t*)data, 1))
				break;
			else
				CORTOS_DEBUG("tx_queue full!\n");
		}
	}
}

void getConfigData(uint64_t* file_start_ptr, CortosQueueHeader* free_queue,CortosQueueHeader *rx_queue, int* lwi)
{
	uint32_t* data[1];
	int i;
	//file_start_ptr = (uint64_t*)cortos_bget_ncram(FILE_BUF_SIZE);
	int start = 1,msg_written;
	while(1)
	{
		CORTOS_DEBUG("rx_queue = 0x%lx\n", rx_queue);
		CORTOS_DEBUG("free_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n", free_queue ->readIndex, free_queue -> writeIndex, free_queue -> totalMsgs);
		CORTOS_DEBUG("rx_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n", rx_queue ->readIndex, rx_queue -> writeIndex, rx_queue -> totalMsgs);
		printBuffer((uint32_t*)rx_queue, 305);
		if(cortos_readMessages(rx_queue, (uint8_t*)data, 1))
		{
			CORTOS_DEBUG("Got RX packet\n");
			uint32_t* buf_addr = (uint32_t*)data[0];
			storeFile(&start, file_start_ptr, buf_addr, lwi);
			CORTOS_DEBUG("rx queue pop data = 0x%lx\n",buf_addr);
			printBuffer(buf_addr, BUFFER_SIZE_IN_BYTES);
			// ack
			//*(buf_addr + 1) = 92 << 8;
			//*(buf_addr + 8) |= (1 < 8);	
			//while((cortos_writeMessages(NQ.tx_queue, (uint8_t*)data, 1) != 1));
			
			// no ack
			while(1)
			{
				if(cortos_writeMessages(free_queue, (uint8_t*)data, 1))
					break;
				else
					CORTOS_DEBUG("Unable to push to free queue.\n");
			}
					
			if((*(buf_addr + 8)>>25) & 0x1 == 1 )
                                break;
			else
				CORTOS_DEBUG("Not last packet of file\n");
		}
		else
		{
			int k = 0;
			for(k = 0; k < 2500000; k++);
			CORTOS_DEBUG("No packet found empty rx_queue\n");
		}
	}
	
}
#endif
