
#include "include/nic_driver.h"


#define NUMBER_OF_BUFFERS 4
#define BUFFER_SIZE_IN_BYTES 64
#define NIC_START_ADDR 0xFF000000

void findQueuePhyAddr(char*,CortosQueueHeader*,uint64_t*,uint64_t*,uint64_t*);

CortosQueueHeader* free_queue;
CortosQueueHeader* rx_queue;
CortosQueueHeader* tx_queue;

volatile uint32_t*  BufferPtrsVA[NUMBER_OF_BUFFERS];
volatile uint64_t   BufferPtrsPA[NUMBER_OF_BUFFERS];

int main()
{
	 __ajit_write_serial_control_register__ (TX_ENABLE);
	cortos_printf ("Started\n");

	// Step 1: Allocating Cortos queues.
	
	uint32_t msgSizeInBytes = 8;
	uint32_t length = 8;
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

	int i,status;
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		BufferPtrsVA[i] = (uint32_t*) cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
		cortos_printf("Allocated Buffer[%d] VA = 0x%08lx\n", i,(uint32_t)BufferPtrsVA[i]);
	}

		// Converting to PA
	
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		status = translateVaToPa ((uint32_t) BufferPtrsVA[i], &BufferPtrsPA[i]);
		if(status==0)
		cortos_printf("Allocated Buffer[%d] PA = 0x%016llx\n", i,BufferPtrsPA[i]);
	}

	// Step 6 : Pushing Buffer pointers (PA) to free queue.


		// Put the four buffers onto the free-queue, so free queue has space, 
		// if Tx Q wants to push after transmission.
	int msgs_written;
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		msgs_written = cortos_writeMessages(free_queue, (uint8_t*) (&BufferPtrsPA[i]), 1);
		if(msgs_written)
		cortos_printf("Stored Buffer[%d] in free-queue = 0x%016llx\n", i, BufferPtrsPA[i]);
	}

	// Step 7 : Enabling the NIC.

	enableNic (0,0,1,1);
	uint32_t controlReg = readFromNicReg (0,0);
	cortos_printf("Control register = 0x%08lx\n",controlReg);
	cortos_printf ("Configuration Done. NIC has started\n");

	
		
	// Step 8 : loopback test begins.

	int message_counter = 0;
	uint64_t bufptr;
	uint32_t tx_pkt_count;
	uint32_t rx_pkt_count;
	uint32_t status_reg;
	while(1)
	{
		

		if(cortos_readMessages(rx_queue, (uint8_t*)(&bufptr), 1)){

			
			msgs_written = cortos_writeMessages(tx_queue, (uint8_t*)(&bufptr), 1);
			if(msgs_written)
				cortos_printf("packet red and sent back, buffer used = %016llx\n",bufptr);
			message_counter++;
			cortos_printf("message_counter:%d\n",message_counter);

			probeNic (0,&tx_pkt_count,&rx_pkt_count,&status_reg);
			cortos_printf("transmitted packet = %u, Received packet = %u, status register = %u\n",
			 tx_pkt_count, rx_pkt_count,status_reg);


	

		}	
		else
		{
			// Spin for 1024 clock cycles.
			
			__ajit_sleep__ (1024);
		}

		
		
		if(message_counter == 512)break;

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
		cortos_brel_ncram((void*)BufferPtrsVA[i]);
		cortos_printf("Released  buffer[%d] 0x%lx\n",i,(uint32_t)BufferPtrsVA[i]);
		
	}
		

		cortos_exit(0);	
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

	foundPTE = translateVaToPa((uint32_t)(Q_VA->bget_addr), Qbuf_PA);
	if(foundPTE == 0)
		cortos_printf("%s buffer start address: VA = 0x%lx , PA = 0x%016llx \n",s,(uint32_t)(Q_VA->bget_addr),*Qbuf_PA);
	else
		cortos_printf("%s buffer address translation not found\n", s);

}





