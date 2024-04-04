
#include "include/nic_driver.h"


#define NUMBER_OF_BUFFERS 1
#define BUFFER_SIZE_IN_BYTES 128
#define NIC_START_ADDR 0xFF000000
#define RXQ_LOCK_ADDR 0x40014006

void findQueuePhyAddr(char*,CortosQueueHeader*,uint64_t*,uint64_t*,uint64_t*);

CortosQueueHeader* free_queue;
CortosQueueHeader* rx_queue;
CortosQueueHeader* tx_queue;

volatile uint32_t*  BufferPtrsVA[NUMBER_OF_BUFFERS];
volatile uint64_t   BufferPtrsPA[NUMBER_OF_BUFFERS];

//////////////////////////////////////
uint32_t cortos_readMessages2(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count) {
  uint8_t *dest = 0, *src = 0; // nullptr
  uint32_t process = count;
  uint32_t i;

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
	if(((uint32_t)hdr->lock) != RXQ_LOCK_ADDR )
	{
		cortos_printf("length modfied to:%08lx\n",hdr->length);
		cortos_printf("msgSizeInBytes modfied to:%08lx\n",hdr->msgSizeInBytes);
		cortos_printf("Lock address modfied to:0x%08lx\n",(uint32_t)hdr->lock);
		cortos_exit(0);
	}

    cortos_lock_acquire_buzy(hdr->lock);
  } else {
    if (hdr->totalMsgs == 0) return 0; // read only when there are messages
  }

  uint32_t totalMsgs      = hdr->totalMsgs;
  uint32_t readIndex      = hdr->readIndex;
  uint32_t length         = hdr->length;
  uint32_t msgSizeInBytes = hdr->msgSizeInBytes;
  uint8_t* queuePtr       = (uint8_t*)(hdr + 1);

  while ((process > 0) && (totalMsgs > 0)) {
    dest = msgs + (msgSizeInBytes * (count - process));
    src  = queuePtr + (msgSizeInBytes * readIndex);
    for (i = 0; i < msgSizeInBytes; ++i) {
      *(dest+i) = *(src+i);                     // READ THE MESSAGE HERE
    }
    readIndex = (readIndex+1) % length;
    --totalMsgs; --process;
  }

  hdr->readIndex  = readIndex;
  hdr->totalMsgs  = totalMsgs;

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {

	if(((uint32_t)hdr->lock) != RXQ_LOCK_ADDR )
	{
		cortos_printf("length modfied to:%08lx\n",hdr->length);
		cortos_printf("msgSizeInBytes modfied to:%08lx\n",hdr->msgSizeInBytes);
		cortos_printf("Lock address modfied to:0x%08lx\n",(uint32_t)hdr->lock);
		
		cortos_exit(0);
	}
	
    cortos_lock_release(hdr->lock);              // RELEASE LOCK
  }
  return (count - process);
}


//////////////////////////////////////

int main()
{
	 __ajit_write_serial_control_register__ (TX_ENABLE);
	cortos_printf ("Started\n");

	// Step 1: Allocating Cortos queues.
	
	uint32_t msgSizeInBytes = 8;
	uint32_t length = NUMBER_OF_BUFFERS;
	uint8_t nonCacheable = 1;

	/*
	// Step 5 : Allocating Packet buffers

	int i,status;
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		BufferPtrsVA[i] = (uint32_t*) cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
		cortos_printf("Allocated Buffer[%d] VA = 0x%08lx\n", i,(uint32_t)BufferPtrsVA[i]);
	}
	*/
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
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
		memset((uint8_t*)BufferPtrsVA[i],0,BUFFER_SIZE_IN_BYTES);
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

		
		// Ensuring buffers are stored properly in free queue.
			uint8_t* addr  = (uint8_t*)(free_queue + 1);
			cortos_printf("no. of item in free queue: %u\n",free_queue->totalMsgs);
			
			for(i=0 ; i <free_queue->totalMsgs;i++)
				cortos_printf("bufferPtr(PA) stored in freeQ at : 0x%08lx is 0x%016llx\n",
				(uint32_t)(addr + 8*i),*( (uint64_t*)(addr + 8*i) ));

		


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
	uint32_t last_addr,packetLen;
	uint64_t* BufferPtr;
	while(1)
	{
		

		if(cortos_readMessages2(rx_queue, (uint8_t*)(&bufptr), 1)){

			last_addr = readFromNicReg (0, P_DEBUG_LAST_ADDRESS_WRITTEN_INDEX);
			cortos_printf("last written addr by NIC:0x%08lx\n",last_addr);
			
			//Print RxQ data structure
			cortos_printf("bufferPtr(PA) red = %016llx\n",bufptr);
			cortos_printf("rxQ: %u, %u, %u, %u, %u, %u, %u, %u \n",
			rx_queue->totalMsgs, rx_queue->readIndex, rx_queue->writeIndex, rx_queue->length,
			rx_queue->msgSizeInBytes, (uint32_t)rx_queue->lock, (uint32_t)rx_queue->bget_addr, rx_queue->misc);
			
			BufferPtr = (uint64_t*)((uint32_t)bufptr);
			packetLen = (*BufferPtr) >> 8;	
			cortos_printf("Packet Length = %u\n",packetLen);
			
			
			
			// Print Packet Contents
			BufferPtr++;
			for(i=1;i<16 ;i++)
				cortos_printf("Packet[%u]: %016llx\n",8*i,(*BufferPtr++));
			
			/*
			msgs_written = cortos_writeMessages(tx_queue, (uint8_t*)(&bufptr), 1);
			if(msgs_written){
			//Print TxQ data structure
				cortos_printf("txQ: %u, %u, %u, %u, %u, %u, %u, %u \n",
			tx_queue->totalMsgs, tx_queue->readIndex, tx_queue->writeIndex, tx_queue->length,
			tx_queue->msgSizeInBytes, (uint32_t)tx_queue->lock, (uint32_t)tx_queue->bget_addr, tx_queue->misc);
				cortos_printf("bufferPtr(PA) written = %016llx\n",bufptr);

			}
			*/

		
			msgs_written = cortos_writeMessages(free_queue, (uint8_t*)(&bufptr), 1);
			if(msgs_written){
				cortos_printf("freeQ replenished \n");
				cortos_printf("*(free_queue->lock) = %x \n",*(free_queue->lock));
			}
			
			

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

		
		
		if(message_counter == 2048)break;

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
		cortos_brel_ncram(BufferPtrsVA[i]);
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

	foundPTE = translateVaToPa((uint32_t)(Q_VA + 1), Qbuf_PA);
	if(foundPTE == 0)
		cortos_printf("%s buffer start address: VA = 0x%lx , PA = 0x%016llx \n",s,(uint32_t)(Q_VA + 1),*Qbuf_PA);
	else
		cortos_printf("%s buffer address translation not found\n", s);

}





