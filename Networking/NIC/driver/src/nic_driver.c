#include <string.h>
#include "cortos.h"
#include "nic_driver.h"

// needs to be set right in the beginning to 
// a multiple of 256!
uint32_t  global_nic_register_base_pointer = 0x1;

uint32_t getGlobalNicRegisterBasePointer ()
{
	return(global_nic_register_base_pointer);
}


// return 0 on success.
int setGlobalNicRegisterBasePointer(uint32_t ptr)
{
	int ret_val = ((ptr & 0xff) != 0);
	if(!ret_val)
		global_nic_register_base_pointer = ptr;
}

uint32_t accessNicReg (uint8_t rwbar, uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	uint32_t ret_val = 0;
	uint32_t reg_addr = getGlobalNicRegisterBasePtr() + (nic_id * 256)  + (reg_index*4);
	if(rwbar)
		ret_val = *((uint32_t*) reg_addr);
	else
		*((uint32_t*) reg_addr) = reg_value;

	return(ret_val);
}

void writeToNicReg (uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	accessNicReg (0, nic_id, reg_index, reg_value);	
}

uint32_t readFromNicReg (uint32_t nic_id, uint32_t reg_index)
{
	uint32_t retval = accessNicReg (1, nic_id, reg_index, 0);	
	return(retval);
}

void     setPhysicalAddressInNicRegPair (uint32_t nic_id, uint32_t reg_index, uint64_t pa)
{
	uint32_t hval = (pa >> 32) & 0xffffffff;
	uint32_t lval = pa & 0xffffffff;

	writeToNicReg (nic_id, reg_index, hval);
	writeToNicReg (nic_id, reg_index+1, lval);

}
uint64_t getPhysicalAddressInNicRegPair (uint32_t nic_id, uint32_t reg_index)
{
	uint32_t h = readFromNicReg (nic_id, reg_index);
	uint32_t l = readFromNicReg (nic_id, reg_index+1);

	uint64_t rval = h;
	rval = (rval << 32) | l;

	return(rval);
}

void     setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers)
{
	writeToNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX, number_of_servers);
}

uint32_t getNumberOfServersInNic (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX));
}

void probeNic (uint32_t nic_id,
		uint32_t* tx_pkt_count,
		uint32_t* rx_pkt_count,
		uint32_t* status)
{
	*tx_pkt_count = readFromNicReg (nic_id, P_TX_PKT_COUNT_REGISTER_INDEX);
	*rx_pkt_count = readFromNicReg (nic_id, P_RX_PKT_COUNT_REGISTER_INDEX);
	*status       = readFromNicReg (nic_id, P_STATUS_REGISTER_INDEX);
}

void writeNicControlRegister   (uint32_t nic_id, uint32_t enable_flags)
{
	writeToNicReg (nic_id, P_NIC_CONTROL_REGISTER_INDEX, enable_flags);
}
void enableNic  (uint32_t nic_id, uint8_t enable_interrupt, uint8_t enable_nic)
{
	writeNicControlRegister (nic_id, (enable_interrupt << 1) | enable_nic);
}

void disableNic (uint32_t nic_id)
{
	writeNicControlRegister (nic_id, 0);
}

void setNicQueuePhysicalAddresses (uint32_t nic_id, uint32_t server_id,
		uint32_t queue_type,  uint64_t queue_addr, 
		uint64_t queue_lock_addr, uint64_t queue_buffer_addr)
{
	uint32_t base_index = ((queue_type == FREEQUEUE) ? P_FREE_QUEUE_REGISTER_BASE_INDEX :
			((queue_type  == RXQUEUE) ?
			 (P_RX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)) :
			 (P_TX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)) ));
	setPhysicalAddressInNicRegPair (nic_id, base_index, queue_addr); 
	setPhysicalAddressInNicRegPair (nic_id, base_index+2, queue_lock_addr); 
	setPhysicalAddressInNicRegPair (nic_id, base_index+4, queue_buffer_addr); 
}

void getNicQueuePhysicalAddresses (uint32_t nic_id, uint32_t server_id,
		uint32_t queue_type,  uint64_t *queue_addr, 
		uint64_t *queue_lock_addr, uint64_t *queue_buffer_addr)
{

	uint32_t base_index = ((queue_type == FREEQUEUE) ? P_FREE_QUEUE_REGISTER_BASE_INDEX :
			((queue_type  == RXQUEUE) ?
			 (P_RX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)) :
			 (P_TX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)) ));
	*queue_addr = getPhysicalAddressInNicRegPair (nic_id, base_index);
	*queue_lock_addr = getPhysicalAddressInNicRegPair (nic_id, base_index+2);
	*queue_buffer_addr = getPhysicalAddressInNicRegPair (nic_id, base_index+4);
}

void configureNic (NicConfiguration* config)
{
	// clear all the registers.
	int I;
	for(I = 0; I < 256; I++)
		writeToNicReg (config->nic_id, I, 0);
	
	// set the number of servers.
	setNumberOfServersInNic (config->nic_id, config->number_of_servers);

	// free-queue.
	setNicQueuePhysicalAddresses (config->nic_id, 
			0,
			FREEQUEUE,
			config->free_queue_address,	
			config->free_queue_lock_address,	
			config->free_queue_buffer_address);	
	for(I = 0; I  < config->number_of_servers; I++)
	{
		setNicQueuePhysicalAddresses (config->nic_id, 
						I
						TXQUEUE,
						config->tx_queue_address,	
						config->tx_queue_lock_address,	
						config->tx_queue_buffer_address);	
		setNicQueuePhysicalAddresses (config->nic_id, 
						I
						RXQUEUE,
						config->tx_queue_address,	
						config->tx_queue_lock_address,	
						config->tx_queue_buffer_address);	
	}
}

void initNicCortosQueue (NicCortosQueue* cqueue,
				uint32_t queue_capacity,
				uint32_t message_size_in_bytes,
				uint8_t* lock_va,
				uint8_t* buffer_va,
				uint32_t misc)
{
	if(cqueue != NULL)
	{
		cqueue->totalMsgs  = 0;
		cqueue->readIndex  = 0;
		cqueue->writeIndex = 0;
		cqueue->length = queue_capacity;
		cqueue->msgSizeInBytes = message_size_in_bytes;
		cqueue->lock	  = lock_va;
		cqueue->bget_addr = buffer_va;
		cqueue->misc = misc;
	}
}


