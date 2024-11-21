
#include "nic_driver.h"



int main()
{
	 __ajit_write_serial_control_register__ (TX_ENABLE);
	cortos_printf ("Started\n");

	// Step 1: Allocating Cortos queues.
	
	uint32_t msgSizeInBytes = 8;
	uint32_t length = NUMBER_OF_BUFFERS;
	uint8_t nonCacheable = 1;

	
	free_queue_rx = cortos_reserveQueue(msgSizeInBytes, length, nonCacheable);
	free_queue_tx = cortos_reserveQueue(msgSizeInBytes, length, nonCacheable);
	rx_queue      = cortos_reserveQueue(msgSizeInBytes, length, nonCacheable);
	tx_queue      = cortos_reserveQueue(msgSizeInBytes, length, nonCacheable);
	


	cortos_printf("Reserved queues in non cacheable region: free_rx=0x%lx,free_tx=0x%lx, rx=0x%lx, tx=0x%lx\n",
				(uint32_t) free_queue_rx,
				(uint32_t) free_queue_tx,
				(uint32_t) rx_queue,
				(uint32_t) tx_queue);


	// Step 2 : Finding the physical address, lock address and buffer address for each queue

	uint64_t freeQueueTxPA,freeQueueTxLockPA,freeQueueTxBuffPA;
	uint64_t freeQueueRxPA,freeQueueRxLockPA,freeQueueRxBuffPA;
	uint64_t rxQueuePA  ,rxQueueLockPA  ,rxQueueBuffPA;
	uint64_t txQueuePA  ,txQueueLockPA  ,txQueueBuffPA;

	findQueuePhyAddr("free_queue_rx", free_queue_rx, &freeQueueRxPA,&freeQueueRxLockPA,&freeQueueRxBuffPA);
	findQueuePhyAddr("free_queue_tx", free_queue_tx, &freeQueueTxPA,&freeQueueTxLockPA,&freeQueueTxBuffPA);
	findQueuePhyAddr("rx_queue"  , rx_queue  , &rxQueuePA  ,&rxQueueLockPA  ,&rxQueueBuffPA);
	findQueuePhyAddr("tx_queue"  , tx_queue  , &txQueuePA  ,&txQueueLockPA  ,&txQueueBuffPA);


	// Step 3 : Configuring the NIC registers with physical addresses.

	setGlobalNicRegisterBasePointer(NIC_START_ADDR);

	NicConfiguration nicConfig;
	nicConfig.nic_id = 0;
	nicConfig.number_of_servers = 1;

	nicConfig.free_queue_rx_address = freeQueueRxPA ;
	nicConfig.free_queue_rx_lock_address = freeQueueRxLockPA ;
	nicConfig.free_queue_rx_buffer_address = freeQueueRxBuffPA ;

	nicConfig.free_queue_tx_address = freeQueueTxPA ;
	nicConfig.free_queue_tx_lock_address = freeQueueTxLockPA ;
	nicConfig.free_queue_tx_buffer_address = freeQueueTxBuffPA ;

	nicConfig.rx_queue_addresses[0] = rxQueuePA ;
	nicConfig.rx_queue_lock_addresses[0] = rxQueueLockPA;
	nicConfig.rx_queue_buffer_addresses[0] = rxQueueBuffPA;

	nicConfig.tx_queue_addresses[0] = txQueuePA ;
	nicConfig.tx_queue_lock_addresses[0] = txQueueLockPA ;
	nicConfig.tx_queue_buffer_addresses[0] = txQueueBuffPA;
	
	configureNic (&nicConfig);

	// Step 4 : Ensuring the physical addresses are properly stored in NIC registers

	uint64_t storedPA[12];

	getNicQueuePhysicalAddresses (0, 0,FREEQUEUE_RX, &storedPA[0]  ,&storedPA[1]  ,&storedPA[2]);
	getNicQueuePhysicalAddresses (0, 0,FREEQUEUE_TX, &storedPA[3]  ,&storedPA[4]  ,&storedPA[5]);
	getNicQueuePhysicalAddresses (0, 0,RXQUEUE,   &storedPA[6]  ,&storedPA[7]  ,&storedPA[8]);
	getNicQueuePhysicalAddresses (0, 0,TXQUEUE,   &storedPA[9]  ,&storedPA[10]  ,&storedPA[11]);

	cortos_printf("free_queue_rx addr: %016llx,free_queue_rx lock addr: %016llx,free_queue_rx buffer addr: %016llx\n",
	storedPA[0] ,storedPA[1]  ,storedPA[2]);
	cortos_printf("free_queue_tx addr: %016llx,free_queue_tx lock addr: %016llx,free_queue_tx buffer addr: %016llx\n",
	storedPA[3] ,storedPA[4]  ,storedPA[5]);
	cortos_printf("rx_queue addr: %016llx,rx_queue lock addr: %016llx,rx_queue buffer addr: %016llx \n",
	storedPA[6]  ,storedPA[7] ,storedPA[8]);
	cortos_printf("tx_queue addr: %016llx,tx_queue lock addr: %016llx,tx_queue buffer addr: %016llx \n",
	storedPA[9]  ,storedPA[10] ,storedPA[11]);


	
	// Step 5 : Allocating Packet buffers

		// Allocating buffers in freeQRx (For Receive Engine)

		int i,status;
		for(i = 0; i < NUMBER_OF_BUFFERS; i++)
		{
			BufferPtrsVA[i] = (uint32_t*) cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
			cortos_printf("for freeQRx :Allocated Buffer[%d] VA = 0x%08lx\n", i,(uint32_t)BufferPtrsVA[i]);
		}

			// configuring buffer size in the control word, top 16 bits.
			
			for(i = 0; i < NUMBER_OF_BUFFERS; i++)
			{
				
				*BufferPtrsVA[i] = (BUFFER_SIZE_IN_BYTES - 8) << 16;
				//cortos_printf("control word: %016llx\n",*((uint64_t*)BufferPtrsVA[i]));
			}
	
			// Converting to PA
	
			for(i = 0; i < NUMBER_OF_BUFFERS; i++)
			{
				status = translateVaToPa ((uint32_t) BufferPtrsVA[i], &BufferPtrsPA[i]);
				if(status==0)
				cortos_printf("for freeQRx :Allocated Buffer[%d] PA = 0x%016llx\n", i,BufferPtrsPA[i]);
			}


		// Allocating buffers in freeQTx (For Transmit Engine)

		for(i = NUMBER_OF_BUFFERS; i < 2*NUMBER_OF_BUFFERS; i++)
		{
			BufferPtrsVA[i] = (uint32_t*) cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
			cortos_printf("for freeQTx :Allocated Buffer[%d] VA = 0x%08lx\n", i,(uint32_t)BufferPtrsVA[i]);
		}

			// Converting to PA
	
			for(i = NUMBER_OF_BUFFERS; i < 2*NUMBER_OF_BUFFERS; i++)
			{
				status = translateVaToPa ((uint32_t) BufferPtrsVA[i], &BufferPtrsPA[i]);
				if(status==0)
				cortos_printf("for freeQTx :Allocated Buffer[%d] PA = 0x%016llx\n", i,BufferPtrsPA[i]);
			}


	// Step 6 : Pushing Buffer pointers (PA) to free_queue_rx and free_queue_tx.


		// For FREEQUEUE_RX
		int msgs_written;
		for(i = 0; i < NUMBER_OF_BUFFERS; i++)
		{
			msgs_written = cortos_writeMessages(free_queue_rx, (uint8_t*) (&BufferPtrsPA[i]), 1);
			if(msgs_written)
			cortos_printf("Stored Buffer[%d] in free-queue-rx = 0x%016llx\n", i, BufferPtrsPA[i]);
		}

		
		// Ensuring buffers are stored properly in free queue rx.
			uint8_t* addr  = (uint8_t*)(free_queue_rx + 1);
			cortos_printf("no. of item in free-queue-rx: %u\n",free_queue_rx->totalMsgs);
			
			for(i=0 ; i < free_queue_rx->totalMsgs;i++)
				cortos_printf("bufferPtr(PA) stored in free-queue-rx at : 0x%08lx is 0x%016llx\n",
				(uint32_t)(addr + 8*i),*( (uint64_t*)(addr + 8*i) ));

		// For FREEQUEUE_TX
		for(i = NUMBER_OF_BUFFERS; i < 2*NUMBER_OF_BUFFERS; i++)
		{
			msgs_written = cortos_writeMessages(free_queue_tx, (uint8_t*) (&BufferPtrsPA[i]), 1);
			if(msgs_written)
			cortos_printf("Stored Buffer[%d] in free-queue-tx = 0x%016llx\n", i, BufferPtrsPA[i]);
		}

		
		// Ensuring buffers are stored properly in free queue tx.
			addr  = (uint8_t*)(free_queue_tx + 1);
			cortos_printf("no. of item in free-queue-tx: %u\n",free_queue_tx->totalMsgs);
			
			for(i=0 ; i <free_queue_tx->totalMsgs;i++)
				cortos_printf("bufferPtr(PA) stored in free-queue-tx at : 0x%08lx is 0x%016llx\n",
				(uint32_t)(addr + 8*i),*( (uint64_t*)(addr + 8*i) ));


		// Initialising the reverse translation table.

		for(i = 0; i < 2*NUMBER_OF_BUFFERS; i++)
		{
			initTranslationTable(BufferPtrsPA[i], BufferPtrsVA[i]);
		}
		cortos_printf("Reverse Translation Table is as follows:\n");
		cortos_printf("Physical Address	|	Virtual Address\n");
		cortos_printf("----------------------------------------\n");
		for(i = 0; i < 2*NUMBER_OF_BUFFERS; i++)
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
	uint32_t* bufptrVA_RX,bufptrVA_TX;
	uint64_t bufptrPA_RX,bufptrPA_TX;
	int msgsRead;
	uint32_t tx_pkt_count;
	uint32_t rx_pkt_count;
	uint32_t status_reg;
	uint32_t packetLen;
	uint64_t* BufferPtr;
	while(1)
	{
		
		msgsRead = cortos_readMessages(rx_queue, (uint8_t*)(&bufptrPA_RX), 1);

		if(msgsRead){
			


			// reverse table PA -> VA access
			 bufptrVA_RX = translatePAtoVA(bufptrPA_RX);
			 if (bufptrVA_RX == NULL){
				cortos_printf("failed to find PA to VA translation!\n");
				cortos_exit(0); 
				}

			// Print Packet Contents
			BufferPtr = (uint64_t*)(bufptrVA_RX);
			for(i=0;i<16 ;i++)
				cortos_printf("Packet[%u]: %016llx\n",8*i,(*BufferPtr++));

			// Packet processing (get packet length)
			packetLen = (*(bufptrVA_RX + 1) >> 8) + 8; // extra 8 bytes  for control word	
			cortos_printf("Packet Length in bytes = %u\n",packetLen);

			// Pop buffer from free_queue_tx for transmitting
			msgsRead = cortos_readMessages(free_queue_tx, (uint8_t*)(&bufptrPA_TX), 1);
			if(msgsRead){

				// reverse table PA -> VA access
			 	bufptrVA_TX = translatePAtoVA(bufptrPA_TX);
			 	if (bufptrVA_TX == NULL){
					cortos_printf("failed to find PA to VA translation!\n");
					cortos_exit(0); 
				}

				// Copying the packet as it is.
				memcpy( (uint8_t*)(bufptrVA_TX),(uint8_t*)(bufptrVA_RX),packetLen);

				// Pushing the buffer to transmit queue
				msgs_written = cortos_writeMessages(tx_queue, (uint8_t*)(&bufptrPA_TX), 1);
				if(msgs_written)
				cortos_printf("transmitted the packet\n");
			
			}
			
			// pushing the receive buffer back to free_queue_rx 
			msgs_written = cortos_writeMessages(free_queue_rx, (uint8_t*)(&bufptrPA_RX), 1);
			if(msgs_written)
			cortos_printf("freeQ replenished \n");
				
			
			// NIC stats
			message_counter++;
			cortos_printf("no. of messages received and sent back:%d\n",message_counter);
			probeNic (0,&tx_pkt_count,&rx_pkt_count,&status_reg);
			cortos_printf("transmitted packet = %u, Received packet = %u, status register = %u\n",
			 tx_pkt_count, rx_pkt_count,status_reg);
			

		}	
		

		if(message_counter == 2048)break;

	}
	
	
	// Disabling the NIC
	
	disableNic (0);

	// freeing the allocated queue

	cortos_freeQueue(rx_queue);	
	cortos_freeQueue(tx_queue);	
	cortos_freeQueue(free_queue_rx);
	cortos_freeQueue(free_queue_tx);

	// freeing the allocated buffers

	for(i = 0; i < 2*NUMBER_OF_BUFFERS; i++)
	{
		cortos_printf("Releasing buffer[%d] 0x%lx\n",i,(uint32_t)BufferPtrsVA[i]);
		cortos_brel_ncram(BufferPtrsVA[i]);
		cortos_printf("Released  buffer[%d] 0x%lx\n",i,(uint32_t)BufferPtrsVA[i]);
		
	}
		

		cortos_exit(0);	
}



