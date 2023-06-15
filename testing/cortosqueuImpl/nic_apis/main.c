#include<stdio.h>
#include <stdint.h>
#include "ajit_access_routines.h"
#include "core_portme.h"
#include <cortos.h>



//#include "nic_utils.h"



// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 180 // 80

// NIC register start and end  addresses
#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1FFFFFFF

// pointer to NIC regs
uint32_t* NIC_REG = NIC_START_ADDR;


uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	return data;
}


void writeNicReg(uint32_t index, uint32_t value)
{
	__ajit_store_word_to_physical_address__(value,&NIC_REG[index]);
}


void nicRegInit(CortosQueueHeader* Free_Queue, CortosQueueHeader* Rx_Queue,CortosQueueHeader* Tx_Queue)
{
	writeNicReg(1,1);				//NIC_REG[1]  <- NUMBER_OF_SERVERS;
	writeNicReg(2,(uint32_t)Rx_Queue);		//NIC_REG[2]  <- Rx_Queue pointer;
	writeNicReg(10,(uint32_t)Tx_Queue);		//NIC_REG[10] <- Tx_Queue pointer;
	writeNicReg(18,(uint32_t)Free_Queue);		//NIC_REG[18] <- Free_Queue pointer;
	// start NIC					//NIC_REG[0]  <- NIC_Control (1 -> starts NIC,
	writeNicReg(0,1); 				//			      0 -> stops NIC);
}

// to load Ethernet header frmo memory
void loadEthernetHeader(uint32_t* buffer_addr, uint32_t* eth_hdr)
{
	eth_hdr[0] = buffer_addr[2]; // 2
	eth_hdr[1] = buffer_addr[3]; // 3
	eth_hdr[2] = buffer_addr[4];
	eth_hdr[3] = buffer_addr[5];
}

// to read control data of the buffer
void readBufControlData(uint32_t *buffer_addr, uint16_t *packetSize, uint8_t *lastTkeep)
{
	uint32_t data[1];
	data[0] = buffer_addr[1];
	*packetSize = (data[0] >> 8) & 0xffff;
	*lastTkeep = data[0] & 0xff; 
}

// to modify control data of the buffer
void writeBufControlData(uint32_t *buffer_addr, uint16_t packetSize, uint8_t lastTkeep)
{
	uint32_t new_data[1];
	new_data[0] = (uint32_t)((packetSize << 8) | lastTkeep);
	ee_printf("control data = 0x%08x\n",new_data[0]);
	buffer_addr[1] = new_data[0];
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
	uint8_t* Buffers[3];
	int i;
	for(i = 0; i < 3; i++)
	{
		Buffers[i] = (uint8_t*)cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
	}

	msgs_written = cortos_writeMessages(free_queue, Buffers, 3);

	nicRegInit(free_queue,rx_queue,tx_queue);

	
	uint32_t eth_hdr[4];
        loadEthernetHeader(Buffers[0],&eth_hdr);
	ee_printf("eth_hdr[0] = 0x%x\n", eth_hdr[0]);
	ee_printf("eth_hdr[1] = 0x%x\n", eth_hdr[1]);
        ee_printf("eth_hdr[2] = 0x%x\n", eth_hdr[2]);
	ee_printf("eth_hdr[3] = 0x%x\n", eth_hdr[3]);

	uint16_t packetSize;
	uint8_t lastTkeep;

	uint32_t buffer_with_packet = 0;
	while(1){
		
		uint32_t data[1];
		if(cortos_readMessages(rx_queue, (uint8_t*)data, 1)){

			msgs_written = cortos_writeMessages(tx_queue, (uint8_t*)data, 1);
			ee_printf("Number of Packets transmitted = %d\n", readNicReg(21));
		}	
		else
		{
			int k = 0;
			for(k = 0; k < 2500000; k++);
		}
		if(readNicReg(21) == 1)
		{
			readBufControlData(Buffers[0], &packetSize, &lastTkeep);
			packetSize = packetSize + 1;
			writeBufControlData(Buffers[0], packetSize, lastTkeep);
			break;
		}
	}
	readBufControlData(Buffers[0], &packetSize, &lastTkeep);
	ee_printf("packet size = %d, lastTkeep = 0x%x\n",packetSize,lastTkeep);
	writeNicReg(0,0);

	// free queue
	cortos_freeQueue(rx_queue);	
	cortos_freeQueue(tx_queue);	
	cortos_freeQueue(free_queue);

	// release buffers
	for(i = 0; i < 3; i++)
	{
		cortos_brel(Buffers[i]);
	}
	return(0);
}

