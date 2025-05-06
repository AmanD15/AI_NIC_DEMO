#include "nic_driver.h"

// needs to be set right in the beginning to a multiple of 256!
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
		ret_val = (*((uint32_t*) reg_addr) = reg_value);

	return(ret_val);
}

uint32_t writeToNicReg (uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	uint32_t retval = accessNicReg (0, nic_id, reg_index, reg_value);
	return(retval);		
}

uint32_t readFromNicReg (uint32_t nic_id, uint32_t reg_index)
{
	uint32_t retval = accessNicReg (1, nic_id, reg_index, 0);	
	return(retval);
}

void setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers)
{
	writeToNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX, number_of_servers);
}

uint32_t getNumberOfServersInNic (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX));
}

void setNumberOfBuffersInQueue (uint32_t nic_id, uint32_t number_of_buffers)
{
	writeToNicReg (nic_id, P_N_BUFFERS_REGISTER_INDEX, number_of_buffers);
}

uint32_t getNumberOfBuffersInQueue (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_N_BUFFERS_REGISTER_INDEX));
}

uint32_t getStatusOfQueueInNic (uint32_t nic_id, uint32_t server_id, uint32_t queue_type)
{
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_STATUS_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;	
	}
	return(readFromNicReg (nic_id, reg_index));
}

// return 0 on successful acquire
int acquireLock(uint32_t nic_id)
{
	int ret_val = 1;
	cortos_printf("Info: entered acquireLock\n");
	// get the lock value and 
	uint32_t val = readFromNicReg (nic_id, P_FREE_QUEUE_LOCK_INDEX);
	cortos_printf("Info: acquireLock lock-value = 0x%x\n", val);
	if(val == 0x0)
	{
		cortos_printf("Info: acquireLock success.\n");
		ret_val = 0;
	}
	else 
	{
		cortos_printf("Info: acquireLock failure.\n");
	}
	return(ret_val);
}

int releaseLock(uint32_t nic_id)
{
	cortos_printf("Info: entered releaseLock\n");
	// write the lock value and unlock the memory.
	writeToNicReg (nic_id, P_FREE_QUEUE_LOCK_INDEX, 0);
	cortos_printf("Info: leaving releaseLock \n");
	return(0);
}

// return 0 on success
int pushIntoQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t push_value)
{
	int ret_val = 1;
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_INDEX + (2*server_id)); break;	
	}
	cortos_printf("Info: entered pushIntoQueue: push_value=0x%x reg_index=%d \n", push_value, reg_index);
	int status = writeToNicReg (nic_id, reg_index, push_value);

    	uint8_t push_status = (status >> 1) & 0x1;      // Extract the second least significant bit
    	uint8_t pop_status = status & 0x1;             // Extract the least significant bit
	cortos_printf("Info: pushIntoQueue: after push: push_status=0x%x, pop_status=0x%x.\n", push_status, pop_status);
	if(push_status == 0)
	{
		ret_val = 0;
		cortos_printf("Info: pushIntoQueue: Push Successful\n");

	}
	else
	{
		cortos_printf("Info: pushIntoQueue: Push Failed\n");
	}
	cortos_printf("Info: leaving pushIntoQueue : returns %d \n", ret_val);
	return(ret_val);
}

// return 0 on success
int popFromQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t* popped_val_status)
{
	int ret_val = 1;
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_INDEX + (2*server_id)); break;	
	}
	cortos_printf("Info: entered popFromQueue reg_index=%d \n", reg_index);
	*popped_val_status = readFromNicReg (nic_id, reg_index);

    	uint8_t push_status = (*popped_val_status >> 1) & 0x1;      // Extract the second least significant bit
    	uint8_t pop_status = *popped_val_status & 0x1;             // Extract the least significant bit
	cortos_printf("Info: popFromQueue: after pop: push_status=0x%x, pop_status=0x%x.\n", push_status, pop_status);
	if(pop_status == 0)
	{
		ret_val = 0;
		cortos_printf("Info: popFromQueue: Pop Successful\n");
		cortos_printf("Info: popFromQueue: after pop: popped_value=0x%x.\n", *popped_val_status);
	}
	else
	{
		cortos_printf("Info: popFromQueue: Pop Failed\n");
	}
	cortos_printf("Info: leaving popFromQueue : returns %d \n", ret_val);
	return(ret_val);
}

void probeNic (uint32_t nic_id, uint32_t* tx_pkt_count, uint32_t* rx_pkt_count, uint32_t* status)
{
	*tx_pkt_count = readFromNicReg (nic_id, P_TX_PKT_COUNT_REGISTER_INDEX);
	*rx_pkt_count = readFromNicReg (nic_id, P_RX_PKT_COUNT_REGISTER_INDEX);
	*status       = readFromNicReg (nic_id, P_STATUS_REGISTER_INDEX);
}

void writeNicControlRegister   (uint32_t nic_id, uint32_t enable_flags)
{
	writeToNicReg (nic_id, P_NIC_CONTROL_REGISTER_INDEX, enable_flags);
}

uint32_t readNicControlRegister (uint32_t nic_id)
{
	return (readFromNicReg (nic_id, P_NIC_CONTROL_REGISTER_INDEX));
}

void enableNic  (uint32_t nic_id, uint8_t enable_interrupt, uint8_t enable_mac, uint8_t enable_nic)
{
	writeNicControlRegister (nic_id, (((1 << NUMBER_OF_SERVERS) - 1) << 3) | (enable_interrupt << 2) | (enable_mac << 1) | enable_nic);
}

void disableNic (uint32_t nic_id)
{
	writeNicControlRegister (nic_id, 0);
}

void configureNic (NicConfiguration* config)
{
	// clear all the registers, except queues and fq_lock.
	int I;
	for(I = 0; I < 256; I++)
	{
		if((I>= 8) || (I<= 26))
			continue;
		writeToNicReg (config->nic_id, I, 0);
	}
	
	// set the number of servers.
	setNumberOfServersInNic (config->nic_id, config->number_of_servers);
	// set the number of buffers.
	setNumberOfBuffersInQueue (config->nic_id, config->number_of_buffers);
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
