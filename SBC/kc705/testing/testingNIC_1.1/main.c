#include <cortos.h>
#include "nic_driver.h"

#define MAC_ADDR_LEN 6

// The Queues
CortosQueueHeader* free_queue = NULL;
CortosQueueHeader* rx_queue = NULL;
CortosQueueHeader* tx_queue = NULL;


int main()
{
	 __ajit_write_serial_control_register__ (TX_ENABLE);
	cortos_printf ("Started\n");

	// Step 1: Allocating Cortos queues.
	
	uint32_t msgSizeInBytes = 8;
	uint32_t length = NUMBER_OF_BUFFERS;
	uint8_t nonCacheable = 1;
	
	free_queue = cortos_reserveQueue(msgSizeInBytes, length, nonCacheable);
	rx_queue   = cortos_reserveQueue(msgSizeInBytes, length, nonCacheable);
	tx_queue   = cortos_reserveQueue(msgSizeInBytes, length, nonCacheable);

	cortos_printf("Reserved queues in non cacheable region: free=0x%lx, rx=0x%lx, tx=0x%lx\n",
				(uint32_t) free_queue,
				(uint32_t) rx_queue,
				(uint32_t) tx_queue);


	// Step 2 : Finding the physical address, lock address and buffer address for each queue

	uint64_t freeQueuePA,freeQueueLockPA,freeQueueBuffPA;
	uint64_t rxQueuePA  ,rxQueueLockPA  ,rxQueueBuffPA;
	uint64_t txQueuePA  ,txQueueLockPA  ,txQueueBuffPA;

	findQueuePhyAddr("free_queue", free_queue, &freeQueuePA,&freeQueueLockPA,&freeQueueBuffPA);
	findQueuePhyAddr("rx_queue"  , rx_queue  , &rxQueuePA  ,&rxQueueLockPA  ,&rxQueueBuffPA);
	findQueuePhyAddr("tx_queue"  , tx_queue  , &txQueuePA  ,&txQueueLockPA  ,&txQueueBuffPA);


	// Step 3 : Configuring the NIC registers with physical addresses.

	setGlobalNicRegisterBasePointer(NIC_START_ADDR);

	NicConfiguration nicConfig;
	nicConfig.nic_id = 0;
	nicConfig.number_of_servers = 1;

	nicConfig.free_queue_address = freeQueuePA ;
	nicConfig.free_queue_lock_address = freeQueueLockPA ;
	nicConfig.free_queue_buffer_address = freeQueueBuffPA ;
	
	nicConfig.rx_queue_addresses[0] = rxQueuePA ;
	nicConfig.rx_queue_lock_addresses[0] = rxQueueLockPA;
	nicConfig.rx_queue_buffer_addresses[0] = rxQueueBuffPA;

	nicConfig.tx_queue_addresses[0] = txQueuePA ;
	nicConfig.tx_queue_lock_addresses[0] = txQueueLockPA ;
	nicConfig.tx_queue_buffer_addresses[0] = txQueueBuffPA;
	
	configureNic (&nicConfig);


	// Step 4 : Ensuring the physical addresses are properly stored in NIC registers
	
	uint64_t storedPA[9];

	getNicQueuePhysicalAddresses (0, 0,FREEQUEUE, &storedPA[0]  ,&storedPA[1]  ,&storedPA[2]);
	getNicQueuePhysicalAddresses (0, 0,RXQUEUE,   &storedPA[3]  ,&storedPA[4]  ,&storedPA[5]);
	getNicQueuePhysicalAddresses (0, 0,TXQUEUE,   &storedPA[6]  ,&storedPA[7]  ,&storedPA[8]);

	cortos_printf("free_queue addr: %016llx,free_queue lock addr: %016llx,free_queue buffer addr: %016llx\n",
	storedPA[0] ,storedPA[1]  ,storedPA[2]);
	cortos_printf("rx_queue addr: %016llx,rx_queue lock addr: %016llx,rx_queue buffer addr: %016llx \n",
	storedPA[3]  ,storedPA[4] ,storedPA[5]);
	cortos_printf("tx_queue addr: %016llx,tx_queue lock addr: %016llx,tx_queue buffer addr: %016llx \n",
	storedPA[6]  ,storedPA[7] ,storedPA[8]);


	// Step 5 : Allocating Packet buffers

		// Allocating buffers in freeQ

		int i,status;
		for(i = 0; i < NUMBER_OF_BUFFERS; i++)
		{
			BufferPtrsVA[i] = (uint32_t*) cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
			cortos_printf("for freeQ :Allocated Buffer[%d] VA = 0x%08lx\n", i,(uint32_t)BufferPtrsVA[i]);
		}
			
		// initialsing buffers with zero, and configuring buffer size
		// in the control word, top 16 bits.

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
			cortos_printf("for freeQ :Allocated Buffer[%d] PA = 0x%016llx\n", i,BufferPtrsPA[i]);
		}


	// Step 6 : Pushing Buffer pointers (PA) to free_queue.

		// For FREEQUEUE
		int msgs_written;
		for(i = 0; i < NUMBER_OF_BUFFERS; i++)
		{
			msgs_written = cortos_writeMessages(free_queue, (uint8_t*) (&BufferPtrsPA[i]), 1);
			if(msgs_written)
			cortos_printf("Stored Buffer[%d] in free-queue = 0x%016llx\n", i, BufferPtrsPA[i]);
		}

		
		// Ensuring buffers are stored properly in free queue.
			uint8_t* addr  = (uint8_t*)(free_queue + 1);
			cortos_printf("no. of item in free-queue: %u\n",free_queue->totalMsgs);
			
			for(i=0 ; i < free_queue->totalMsgs;i++)
				cortos_printf("bufferPtr(PA) stored in free-queue at : 0x%08lx is 0x%016llx\n",
				(uint32_t)(addr + 8*i),*( (uint64_t*)(addr + 8*i) ));

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


	// Step 7 : Enabling the NIC.

	enableNic (0,0,1,1);
	uint32_t controlReg = readFromNicReg (0,0);
	cortos_printf("Control register = 0x%08lx\n",controlReg);
	cortos_printf ("Configuration Done. NIC has started\n");

		
	// Step 8 : loopback test begins.

	int message_counter = 0;
	uint32_t* bufptrVA;
	uint64_t bufptrPA;
	int msgsRead;
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
	
	while(1)
	{
		msgsRead = cortos_readMessages(rx_queue, (uint8_t*)(&bufptrPA), 1);

		if(msgsRead)
		{
			//t1 = Sample clock
			t1 = cortos_get_clock_time();

			// reverse table PA -> VA access
			bufptrVA = translatePAtoVA(bufptrPA);
			if (bufptrVA == NULL)
			{
				cortos_printf("Error: Failed to find PA to VA translation!\n");
				cortos_exit(0); 
			}

/*
			// Print Packet Contents
			RxBufferPtr = (uint64_t*)(bufptrVA);
			TxBufferPtr = (uint64_t*)(bufptrVA);


			// Ensuring buffers are stored properly in rx queue.
			uint8_t* rx_addr  = (uint8_t*)(rx_queue + 1);
			cortos_printf("no. of item in rx-queue: %u\n",rx_queue->totalMsgs);
			
			for(i=0 ; i < NUMBER_OF_BUFFERS;i++)
				cortos_printf("bufferPtr(PA) stored in rx-queue at : 0x%08lx is 0x%016llx\n",
				(uint32_t)(rx_addr + 8*i),*( (uint64_t*)(rx_addr + 8*i) ));			

			// Packet processing (get packet length)
			//packetLen = (*(bufptrVA + 1) >> 8); 
			//cortos_printf("Packet Length in bytes = %u\n",packetLen);


			// Get packet length and validate
    			packetLen = getPacketLen(bufptrVA);
    			cortos_printf("DEBUG: Received packet length: %u bytes\n", packetLen);
		
    			// Debugging packet length and contents in RxBuffer
			RxBufferPtr = (uint64_t*)(bufptrVA);
			for(i=0;i<(((packetLen+24) / 8)+(((packetLen+24) % 8) != 0)) ;i++)
				cortos_printf("Packet[%u]: %016llx\n",8*i,(*RxBufferPtr++));
*/

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
			for(i = 0; i < MAC_ADDR_LEN; i++) {
				temp_mac[i] = src_mac[i];  // Copy source MAC to temp
    				src_mac[i] = dest_mac[i]; // Copy destination MAC to source
    				dest_mac[i] = temp_mac[i]; // Copy temp (original source) to destination	
			}

			// Pushing the buffer to transmit queue
			msgs_written = cortos_writeMessages(tx_queue, (uint8_t*)(&bufptrPA), 1);


			// t2= Sample clock
			t2 = cortos_get_clock_time();
			// time_spent += t2  - t1;
			cycle_diff = t2 - t1;
			clock_spent += cycle_diff;
			
/*
			// Ensuring buffers are stored properly in tx queue.
			uint8_t* tx_addr  = (uint8_t*)(tx_queue + 1);
			cortos_printf("no. of item in tx-queue: %u\n",tx_queue->totalMsgs);
			
			for(i=0 ; i < NUMBER_OF_BUFFERS;i++)
				cortos_printf("bufferPtr(PA) stored in tx-queue at : 0x%08lx is 0x%016llx\n",
				(uint32_t)(tx_addr + 8*i),*( (uint64_t*)(tx_addr + 8*i) ));	

			// Debugging packet length and contents in TxBuffer
			TxBufferPtr = (uint64_t*)(bufptrVA);
			for(i=0;i<(((packetLen+24) / 8)+(((packetLen+24) % 8) != 0)) ;i++)
				cortos_printf("Packet[%u]: %016llx\n",8*i,(*TxBufferPtr++));

			// Packet processing (get packet length)
			//packetLen = (*(bufptrVA + 1) >> 8); 
			//cortos_printf("Packet Length in bytes = %u\n",packetLen);
			
			
			if(msgs_written)
			cortos_printf("Transmitted the packet\n");
			else
                    	cortos_printf("Error: Failed to write buffer to TxQ\n");
*/	
				
			// NIC stats
			message_counter++;
			cortos_printf("Time spent for iteration %d = %llu clock cycles (%.9f seconds)\n",message_counter ,cycle_diff ,
			((double)cycle_diff/80000000.0));
/*
			cortos_printf("No. of messages received and sent back:%d\n",message_counter);
			probeNic (0,&tx_pkt_count,&rx_pkt_count,&status_reg);
			cortos_printf("Transmitted packet = %u, Received packet = %u, Status register = %u\n",
			 tx_pkt_count, rx_pkt_count,status_reg);
			
			counterReg = readFromNicReg (0,255);
			seconds = (double)counterReg / 125000000.0; // Divide by NIC frequency (125 MHz)
			cortos_printf("Counter register = 0x%08lx (%.9f seconds)\n",counterReg, seconds);
*/

		}	
		else
		{
			// Spin for 1024 clock cycles.
			
			__ajit_sleep__ (1024);
		}

		if(message_counter == 2048)
		{
			total_time = (double)clock_spent / 80000000.0; // Divide by processor frequency (80 MHz)
			cortos_printf("Total time spent in processor = %llu clock cycles (%.9f seconds)\n",clock_spent ,total_time);
			avg_clk_cycles = clock_spent / message_counter;
			avg_time = total_time / message_counter;
			cortos_printf("Avegare time spent in processor = %llu clock cycles (%.9f seconds)\n",avg_clk_cycles ,avg_time);	
			break;
		}

	}
	
	
	// Disabling the NIC
	
	disableNic (0);

	// freeing the allocated queue

	cortos_freeQueue(rx_queue);	
	cortos_freeQueue(tx_queue);	
	cortos_freeQueue(free_queue);

	// freeing the allocated buffers

	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		cortos_printf("Releasing buffer[%d] 0x%lx\n",i,(uint32_t)BufferPtrsVA[i]);
		cortos_brel_ncram((void*) BufferPtrsVA[i]);
		cortos_printf("Released  buffer[%d] 0x%lx\n",i,(uint32_t)BufferPtrsVA[i]);
		
	}
		

		cortos_exit(0);	
}



