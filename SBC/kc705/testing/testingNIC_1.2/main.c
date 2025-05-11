#include <cortos.h>
#include "nic_driver.h"


int main()
{
	 __ajit_write_serial_control_register__ (TX_ENABLE);
	cortos_printf ("Started\n");


	// Step 1 : Configuring the NIC registers.

	setGlobalNicRegisterBasePointer(NIC_START_ADDR);

#if defined(NORMAL_MODE) || defined(NIC_LOOPBACK)
	NicConfiguration nicConfig;
	nicConfig.nic_id = NIC_ID;
	nicConfig.number_of_servers = NUMBER_OF_SERVERS;
	nicConfig.number_of_buffers = NUMBER_OF_BUFFERS;
	
	configureNic (&nicConfig);


	// Step 2 : Allocating packet buffers

	// Allocating buffers in freeQ
	int i,status;
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		BufferPtrsVA[i] = (uint32_t*) cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
		cortos_printf("for freeQ: Allocated Buffer[%d] VA = 0x%08lx\n", i,(uint32_t)BufferPtrsVA[i]);
	}
		
	// Initialsing buffers with zero, and configuring buffer size in the control word, top 16 bits.
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		memset((uint8_t*)BufferPtrsVA[i],0,BUFFER_SIZE_IN_BYTES);
		*BufferPtrsVA[i] = (BUFFER_SIZE_IN_BYTES - 8) << 16;
		cortos_printf("control word: %016llx\n",*((uint64_t*)BufferPtrsVA[i]));
	}
	
	// Converting to PA
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		status = translateVaToPa ((uint32_t) BufferPtrsVA[i], &BufferPtrsPA[i]);
		if(status==0)
		cortos_printf("for freeQ: Allocated Buffer[%d] PA = 0x%016llx\n", i,BufferPtrsPA[i]);
	}


	// Step 3 : Pushing Buffer pointers (PA) to free_queue.
	// For FREEQUEUE
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		int push_not_ok;
		do {
#ifdef DEBUGPRINT
			cortos_printf("Info: Acquiring lock for free queue.\n");
#endif
			while(acquireLock(NIC_ID)) 
			{
				("Warning: lock not acquired, retrying again.\n");
			};
#ifdef DEBUGPRINT
			cortos_printf("Info: Lock acquired.\n");
			cortos_printf("Info: Pushing into free queue.\n");
#endif
			push_not_ok = pushIntoQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, (uint32_t) BufferPtrsPA[i]);
			releaseLock (NIC_ID);
#ifdef DEBUGPRINT
			cortos_printf("Info: Lock released.\n");
#endif
			if(push_not_ok)
			{
				cortos_printf("Warning: push to free queue not ok, retrying again.\n");
			}
		} while (push_not_ok);
		cortos_printf("Info: pushed to free queue, buf_addr = 0x%x\n", (uint32_t) BufferPtrsPA[i]);
	}

	// Ensuring buffers are stored properly in free queue by reading status, i.e., no. of entries.
	uint32_t entries_in_freeQ = getStatusOfQueueInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE);
	cortos_printf("Info: Total number of entries in free queue = %d\n", entries_in_freeQ);

	// Initialising the reverse translation table.
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		initTranslationTable(BufferPtrsPA[i], BufferPtrsVA[i]);
	}
	cortos_printf("Reverse Translation Table is as follows:\n");
	cortos_printf("Physical Address	|	Virtual Address\n");
	cortos_printf("----------------------------------------\n");
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
	cortos_printf("0x%016llx	|	0x%08lx\n",translationTable[i].pa,(uint32_t)translationTable[i].va);
	}
#endif

#ifdef MAC_LOOPBACK
	// Enable MAC and select MAC loopback test mode, i.e., control_reg [8] should be set
	uint32_t control_value = ((MAC_LOOPBACK << 7) | (SERVERS_ENABLED << 3) | (DISABLE_NIC_INTERRUPT << 2) | (ENABLE_MAC << 1) | DISABLE_NIC);
	cortos_printf ("Info: Writing value = 0x%x to control register \n", control_value);
#endif

#ifdef NIC_LOOPBACK
	// Enable NIC, MAC, servers and select NIC loopback test mode, i.e., control_reg [7] should be set
	uint32_t control_value = ((NIC_LOOPBACK << 7) | (SERVERS_ENABLED << 3) | (DISABLE_NIC_INTERRUPT << 2) | (ENABLE_MAC << 1) | ENABLE_NIC);
	cortos_printf ("Info: Writing value = 0x%x to control register \n", control_value);
#endif

#if defined(NIC_LOOPBACK) || defined(MAC_LOOPBACK)
	// Write the control value
	writeNicControlRegister(NIC_ID, control_value);
	// Read the control status
	uint32_t control_status = readNicControlRegister (NIC_ID);
#ifdef DEBUGPRINT
	cortos_printf ("Info: Reading from register, control status = 0x%x \n", control_status);
#endif
	cortos_printf ("Configuration Done. NIC has started in %s loopback mode.\n", ((control_status >> 7) & 0x1) ? "NIC" : "MAC");
	
	while(1);
#endif

#ifdef NORMAL_MODE
	// Step 4 : Enabling the NIC.

	enableNic (NIC_ID, DISABLE_NIC_INTERRUPT, ENABLE_MAC, ENABLE_NIC);
	uint32_t controlReg = readNicControlRegister (NIC_ID);
	cortos_printf("Control register = 0x%08lx\n",controlReg);
	cortos_printf ("Configuration Done. NIC has started in Normal Mode\n");

		
	// Step 5 : loopback test begins.

	#define MAX_MESSAGES 20480	
	
	int message_counter = 0;
	uint32_t server_id = 0;
	uint32_t* bufptrVA;
	uint64_t bufptrPA;
	uint32_t bufptrPA_lower_32;
	uint32_t tx_pkt_count;
	uint32_t rx_pkt_count;
	uint32_t status_reg;
	uint32_t packetLen;
	uint64_t* RxBufferPtr;
	uint64_t* TxBufferPtr;
	uint32_t counterReg;
	double seconds, total_time, avg_time;
	uint64_t t1, t2, cycle_diff, avg_clk_cycles;
	uint64_t clock_spent = 0;
	uint64_t clock_cycles_per_packet[MAX_MESSAGES];
	uint32_t packet_lengths[MAX_MESSAGES];
	uint64_t total_data_bytes = 0;

	
	while(1)
	{
		while (popFromQueue (NIC_ID, server_id, RXQUEUE, &bufptrPA_lower_32))
		{
#ifdef DEBUGPRINT
			cortos_printf("Warning: pop from Rx queue not ok, retrying again.\n");
			__ajit_sleep__ (1024);
#endif
		}

		// For now, bits [35:32] of PA are 0.
		bufptrPA = (uint64_t) bufptrPA_lower_32;

		//t1 = Sample clock
		t1 = cortos_get_clock_time();

		// reverse table PA -> VA access
		bufptrVA = translatePAtoVA(bufptrPA);
		if (bufptrVA == NULL)
		{
			cortos_printf("Error: Failed to find PA to VA translation!\n");
			cortos_exit(0); 
		}

		// Packet processing (get packet length)
		//packetLen = (*(bufptrVA + 1) >> 8); 
		//cortos_printf("Packet Length in bytes = %u\n",packetLen);

		// Get packet length and validate
		packetLen = getPacketLen(bufptrVA);
		packet_lengths[message_counter] = packetLen;
		total_data_bytes += packetLen;
		
#ifdef ENABLE_PRINT
		cortos_printf("DEBUG: Received packet length: %u bytes\n", packetLen);
		
    		// Debugging packet length and contents in RxBuffer
		RxBufferPtr = (uint64_t*)(bufptrVA);
		for(i=0;i<(((packetLen+24) / 8)+(((packetLen+24) % 8) != 0)) ;i++)
			cortos_printf("Packet[%u]: %016llx\n",8*i,(*RxBufferPtr++));
#endif

    		if (packetLen > BUFFER_SIZE_IN_BYTES) {
        		cortos_printf("ERROR: Received packet length %u exceeds expected size %u\n", packetLen, BUFFER_SIZE_IN_BYTES);
        		return 1;  // Drop the packet
    		}

		// Extract pointers to the destination and source MAC addresses
    		uint8_t* dest_mac = (uint8_t*)bufptrVA + 24;
    		uint8_t* src_mac = (uint8_t*)bufptrVA + MAC_ADDR_LEN + 24;

		// Temporary buffer to hold the source MAC address
		uint8_t temp_mac[MAC_ADDR_LEN];

		// Swap the MAC addresses
		for(i = 0; i < MAC_ADDR_LEN; i++) 
		{
			temp_mac[i] = src_mac[i];  	// Copy source MAC to temp
    			src_mac[i] = dest_mac[i]; 	// Copy destination MAC to source
    			dest_mac[i] = temp_mac[i]; 	// Copy temp (original source) to destination	
		}

		// Pushing the buffer to transmit queue
		while(pushIntoQueue  (NIC_ID, server_id, TXQUEUE, bufptrPA_lower_32))
		{
#ifdef DEBUGPRINT
			cortos_printf("Warning: push into Tx queue not ok, retrying again.\n");
			__ajit_sleep__ (1024);
#endif
		}

		// t2= Sample clock
		t2 = cortos_get_clock_time();
		// time_spent += t2  - t1;
		cycle_diff = t2 - t1;
		clock_cycles_per_packet[message_counter] = cycle_diff;
		clock_spent += cycle_diff;
	
#ifdef ENABLE_PRINT		
		// Debugging packet length and contents in TxBuffer
		TxBufferPtr = (uint64_t*)(bufptrVA);
		for(i=0;i<(((packetLen+24) / 8)+(((packetLen+24) % 8) != 0)) ;i++)
			cortos_printf("Packet[%u]: %016llx\n",8*i,(*TxBufferPtr++));
			
		cortos_printf("Transmitted the packet\n");
#endif		

		// NIC stats
		message_counter++;
#ifdef ENABLE_PRINT		
		cortos_printf("Time spent for iteration %d = %llu clock cycles (%.9f seconds)\n", message_counter, cycle_diff,
		((double)cycle_diff/80000000.0));

		cortos_printf("No. of messages received and sent back:%d\n",message_counter);
		probeNic (NIC_ID, &tx_pkt_count, &rx_pkt_count, &status_reg);
		cortos_printf("Transmitted packet = %u, Received packet = %u, Status register = %u\n",
		tx_pkt_count, rx_pkt_count, status_reg);
			
		counterReg = readFromNicReg (NIC_ID, P_COUNTER_REGISTER_INDEX);
		seconds = (double)counterReg / 125000000.0; // Divide by NIC frequency (125 MHz)
		cortos_printf("Counter register = 0x%08lx (%.9f seconds)\n",counterReg, seconds);
#endif
			
		server_id = (server_id + 1) % NUMBER_OF_SERVERS;
		
		if(message_counter == MAX_MESSAGES)
		{
			total_time = (double)clock_spent / 80000000.0; // Divide by processor frequency (80 MHz)
			double throughput_mbps = ((double)total_data_bytes * 8.0) / (total_time * 1000000.0); // bytes to bits, bits/sec to Mbps

			cortos_printf("Total packets processed: %d\n", message_counter);
			cortos_printf("Total data processed: %llu bytes\n", total_data_bytes);
			cortos_printf("Total time: %.9f seconds\n", total_time);
			cortos_printf("Throughput: %.6f Mbps\n", throughput_mbps);

			avg_clk_cycles = clock_spent / message_counter;
			avg_time = total_time / message_counter;
			cortos_printf("Average time per packet: %llu clock cycles (%.9f seconds)\n", avg_clk_cycles , avg_time);

			message_counter = 0;
			clock_spent = 0;
			total_data_bytes = 0;
			//break;
		}
	}


	// Step 6 : Disabling the NIC
	
	disableNic (NIC_ID);


	// Step 7 : Popping Buffer pointers (PA) from free_queue.

	uint32_t popped_count = 0;
	while(popped_count < NUMBER_OF_BUFFERS)
	{
		uint32_t J;
		// For RXQUEUE
		for(server_id = 0; server_id < NUMBER_OF_SERVERS; server_id++)
		{
			// Getting no. of buffers to pop from Rx queue (if any) by reading status, i.e., no. of entries.
			uint32_t entries_in_RxQ = getStatusOfQueueInNic (NIC_ID, server_id, RXQUEUE);
			cortos_printf("Info: Total number of entries in Rx queue server %d = %d\n", server_id, entries_in_RxQ);
			
			while(entries_in_RxQ > 0)
			{
				while (popFromQueue (NIC_ID, server_id, RXQUEUE, &J))
				{
					cortos_printf("Warning: pop from Rx queue not ok, retrying again.\n");
				}
				cortos_printf("Info: popped from Rx queue server %d, buf_addr=0x%x\n", server_id, J);
				if (J != (uint32_t) BufferPtrsPA[popped_count])
				{
					cortos_printf("Error: pop from Rx queue server %d: expected 0x%x, received 0x%x\n", server_id, 
							(uint32_t) BufferPtrsPA[popped_count], J);
				}
				entries_in_RxQ--;
				popped_count++;
			}
		}
		
		// For FREEQUEUE
		// Getting no. of buffers to pop from free queue by reading status, i.e., no. of entries.
		uint32_t entries_in_freeQ = getStatusOfQueueInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE);
		cortos_printf("Info: Total number of entries in free queue = %d\n", entries_in_freeQ);
		
		cortos_printf("Info: Buf_addr = 0x%x, already popped from free queue by NIC\n",(uint32_t) BufferPtrsPA[popped_count]);
		popped_count++;

		while(entries_in_freeQ > 0)
		{
			int pop_not_ok;
			do {
#ifdef DEBUGPRINT
				cortos_printf("Info: Acquiring lock for free queue.\n");
#endif
				while(acquireLock(NIC_ID)) 
				{
					("Warning: lock not acquired, retrying again.\n");
				};
#ifdef DEBUGPRINT
				cortos_printf("Info: Lock acquired.\n");
				cortos_printf("Info: Popping from free queue.\n");
#endif
				pop_not_ok = popFromQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, &J);
				releaseLock (NIC_ID);
#ifdef DEBUGPRINT
				cortos_printf("Info: Lock released.\n");
#endif
				if(pop_not_ok)
				{
					cortos_printf("Warning: pop from free queue not ok, retrying again.\n");
				}
			} while (pop_not_ok);
			cortos_printf("Info: popped from free queue, buf_addr = 0x%x\n", J);
			if (J != (uint32_t) BufferPtrsPA[popped_count])
			{
				cortos_printf("Error: pop from free queue: expected 0x%x, received 0x%x\n", 
						(uint32_t) BufferPtrsPA[popped_count], J);
			}
			entries_in_freeQ--;
			popped_count++;
		}
		if (popped_count == NUMBER_OF_BUFFERS)
                	break;
                else
                	cortos_printf("Error: Failed to pop remaining %d buffers, retrying again.\n", NUMBER_OF_BUFFERS - popped_count);
	}


	// Step 8 : Freeing the allocated buffers

	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		cortos_printf("Releasing buffer[%d] 0x%lx\n",i,(uint32_t)BufferPtrsVA[i]);
		cortos_brel_ncram((void*) BufferPtrsVA[i]);
		cortos_printf("Released  buffer[%d] 0x%lx\n",i,(uint32_t)BufferPtrsVA[i]);
		
	}
#endif
		
	cortos_exit(0);	
}


