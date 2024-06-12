
#include "../include/nic_driver.h"

// needs to be set right in the beginning to 
// a multiple of 256!
uint32_t  global_nic_register_base_pointer;

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
	uint32_t reg_addr = getGlobalNicRegisterBasePointer() + (nic_id * 256)  + (reg_index*4);
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

void setPhysicalAddressInNicRegPair (uint32_t nic_id, uint32_t reg_index, uint64_t pa)
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

void setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers)
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
void enableNic  (uint32_t nic_id, uint8_t enable_interrupt, uint8_t enable_mac, uint8_t enable_nic)
{
	writeNicControlRegister (nic_id, (enable_interrupt << 2) |(enable_mac << 1) | enable_nic);
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

	uint32_t base_index = (
			(queue_type == FREEQUEUE) ? P_FREE_QUEUE_REGISTER_BASE_INDEX :
			((queue_type  == RXQUEUE) ?
			 (P_RX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)) :
			 (P_TX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)) )
			 );
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
						I,
						TXQUEUE,
						config->tx_queue_addresses[I],	
						config->tx_queue_lock_addresses[I],	
						config->tx_queue_buffer_addresses[I]);	
		setNicQueuePhysicalAddresses (config->nic_id, 
						I,
						RXQUEUE,
						config->rx_queue_addresses[I],	
						config->rx_queue_lock_addresses[I],	
						config->rx_queue_buffer_addresses[I]);	
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

#ifdef USE_CORTOS
// Following stuff is used with lwip and baremetal testing
// not useful while compiling testbench
int translateVaToPa (uint32_t va, uint64_t* pa)
{
	uint32_t context  = __ajit_load_word_mmu_reg__ (MMU_REG_CONTEXT);
	uint32_t ctp_rval = __ajit_load_word_mmu_reg__ (MMU_REG_CONTEXT_TABLE_PTR);
	uint64_t context_table_pointer  =  (((uint64_t) ctp_rval) >> 2) << 6;
	uint8_t level; 
	uint64_t ptde_a; 
	uint32_t ptde;


	//cortos_printf("context  = %lx, ctp_rval = 0x%08lx, context_table_pointer = 0x%016llx  \n",
	//context,ctp_rval,context_table_pointer);

	


	int status = ajit_lookup_mmap (context_table_pointer,context,va, // input args
									 &level, pa, &ptde_a, &ptde);	  // output args
	return(status);
}
void findQueuePhyAddr(char *s,CortosQueueHeader* Q_VA,
						uint64_t* Q_PA,uint64_t* Qlock_PA,uint64_t* Qbuf_PA)
{

	int foundPTE;

	foundPTE = translateVaToPa( (uint32_t)Q_VA, Q_PA);
	if(foundPTE == 0)
		cortos_printf("%s address: VA = 0x%lx , PA = 0x%016llx \n",s,(uint32_t)Q_VA,*Q_PA);
	else
		cortos_printf("%s address translation not found\n", s);

	foundPTE = translateVaToPa((uint32_t)(Q_VA->lock), Qlock_PA);
	if(foundPTE == 0)
		cortos_printf("%s lock address: VA = 0x%lx , PA = 0x%016llx \n",s,(uint32_t)(Q_VA->lock),*Qlock_PA);
	else
		cortos_printf("%s lock address translation not found\n", s);

	foundPTE = translateVaToPa((uint32_t)(Q_VA + 1), Qbuf_PA);
	if(foundPTE == 0)
		cortos_printf("%s buffer start address: VA = 0x%lx , PA = 0x%016llx \n",s,(uint32_t)(Q_VA + 1),*Qbuf_PA);
	else
		cortos_printf("%s buffer address translation not found\n", s);

}

uint32_t getPacketLen(uint32_t* controlWord)
{

	uint8_t lastTkeep = (uint8_t) (0xFF & *(controlWord + 1));
	uint32_t packetLengthInDword = (uint32_t) (*(controlWord + 1 ) >> 8);
	uint32_t lenInBytes;

	switch(lastTkeep)
	{
		case 0xFF : lenInBytes = (packetLengthInDword - 0); break;
		case 0xFE : lenInBytes = (packetLengthInDword - 1); break;
		case 0xFC : lenInBytes = (packetLengthInDword - 2); break;
		case 0xF8 : lenInBytes = (packetLengthInDword - 3); break;
		case 0xF0 : lenInBytes = (packetLengthInDword - 4); break;
		case 0xE0 : lenInBytes = (packetLengthInDword - 5); break;
		case 0xC0 : lenInBytes = (packetLengthInDword - 6); break;
		case 0x80 : lenInBytes = (packetLengthInDword - 7); break;
	}

	return (lenInBytes - 16); // 8 bytes : control word, 16 bytes : Repeated Header 

}

void initTranslationTable(uint64_t pa, uint32_t* va)
{

 static int i = 0;
 
 translationTable[i].pa = pa;  
 translationTable[i].va = va; 
 
 i = i + 1;  


}


uint32_t* translatePAtoVA(uint64_t pa) {
    // Search the translation table for the physical address
    int i;
    for (i = 0; i < NUMBER_OF_BUFFERS; i++) {
        if (translationTable[i].pa == pa) {
            return translationTable[i].va;  // Return virtual address if physical address is found
        }
    }
    // Return NULL if physical address is not found
    return NULL;
}





uint32_t getPacketLenInDW(uint32_t lenInBytes)
{
	
	uint32_t rem = lenInBytes % 8;
	if(rem == 0)
		return lenInBytes;
	else
		return (lenInBytes+1);

}

uint32_t getLastTkeep(uint32_t lenInBytes)
{

	uint32_t rem = lenInBytes % 8;
	uint32_t lastTkeep;
	switch(rem)
	{
		case 0 : lastTkeep = 0xFF; break;
		case 7 : lastTkeep = 0xFE; break;
		case 6 : lastTkeep = 0xFC; break;
		case 5 : lastTkeep = 0xF8; break;
		case 4 : lastTkeep = 0xF0; break;
		case 3 : lastTkeep = 0xE0; break;
		case 2 : lastTkeep = 0xC0; break;
		case 1 : lastTkeep = 0x80; break;
	}

	return lastTkeep;

}

#endif
