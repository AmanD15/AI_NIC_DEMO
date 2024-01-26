
#include "nic_utils.h"

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

// to load Ethernet header
void loadEthernetHeader(uint32_t* buffer_addr, uint32_t* eth_hdr)
{
	eth_hdr[0] = buffer_addr[2];
	eth_hdr[1] = buffer_addr[3];
	eth_hdr[2] = buffer_addr[4];
	eth_hdr[3] = buffer_addr[5];
}
	
// to read control data of the buffer
//void readBufControlData(uint32_t *buffer_addr, uint16_t *packetSize, uint8_t *lastTkeep)
//{
//	uint32_t data = buffer_addr[0];
//	*packetSize = (data >> 8) & 0xff;
//	*lastTkeep = data & 0xff; 
//}

// to modify control data of the buffer
//void writeBufControlData(uint32_t *buffer_addr, uint16_t packetSize, uint8_t lastTkeep)
//{
//	buffer_addr[0] = (packetSize << 8) & lastTkeep;
//}
