

#include "../include/ethernetif.h"
#include "nic_driver.h"
#include "lwip/sys.h"



typedef struct my_custom_pbuf
{
   struct pbuf_custom p;
   uint64_t bufferPA;  
} my_custom_pbuf_t;



//LWIP_MEMPOOL_DECLARE(RX_POOL, 10, sizeof(my_custom_pbuf_t), "Zero-copy RX PBUF pool");


void
low_level_init()
{
 

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
			//BufferPtrsVA[i] = (uint32_t*) cortos_bget(BUFFER_SIZE_IN_BYTES);

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
			//BufferPtrsVA[i] = (uint32_t*) cortos_bget(BUFFER_SIZE_IN_BYTES);
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



        // Step 8 : Initialize the custom memory pool, used in ZeroCopyRx_input()
	//LWIP_MEMPOOL_INIT(RX_POOL);

}


/******************************/



void my_pbuf_free_custom(void* p)
{
  SYS_ARCH_DECL_PROTECT(old_level);

  my_custom_pbuf_t* my_pbuf = (my_custom_pbuf_t*)p;


  /* Since NCRAM region is used, this is not required for now*/
	
  // invalidate data cache here - lwIP and/or application may have written into buffer!
  // (invalidate is faster than flushing, and no one needs the correct data in the buffer)
  // invalidate_cpu_cache(p->payload, p->tot_len);

	// flushing the entire D_CACHE here
	// __ajit_flush_dcache__();

  SYS_ARCH_PROTECT(old_level);

 	 /* free_rx_dma_descriptor(my_pbuf->dma_descriptor); */
	uint64_t bufptrPA = my_pbuf->bufferPA ;
	// replenshing free q after buffer has been passed to top layers for processing
	int write_ok = cortos_writeMessages(free_queue_rx, (uint8_t*)(&bufptrPA) , 1);
 	if(write_ok == 0){
   		cortos_printf("failed to wrtite to freexQ\n");
	        cortos_exit(0);
	 }

  //LWIP_MEMPOOL_FREE(RX_POOL, my_pbuf);
  SYS_ARCH_UNPROTECT(old_level);
}


int
ZeroCopyRx_input(struct netif *netif)
{

  uint16_t packetLenInBytes;
  uint32_t* bufptrVA;
  uint64_t bufptrPA;
  uint8_t* BufPtr;


	// Read the buffer pointer from RxQ
	  int read_ok = cortos_readMessages(rx_queue, (uint8_t*)(&bufptrPA), 1);
	  if(read_ok == 0){
		  return 1;
	  }
	
	// reverse table PA -> VA access
	 bufptrVA = translatePAtoVA(bufptrPA);
	 if (bufptrVA == NULL){

		cortos_printf("failed to find PA to VA translation!\n");
		cortos_exit(0); 

		}
	
	// Calculating packet length in bytes

	 packetLenInBytes = getPacketLen(bufptrVA);
	 //cortos_printf("len = %u\n",packetLenInBytes);

	/* zero copy receive */
       
	//my_custom_pbuf_t* my_pbuf  = (my_custom_pbuf_t*)LWIP_MEMPOOL_ALLOC(RX_POOL);
        my_custom_pbuf_t my_pbuf;
	my_pbuf.p.custom_free_function = my_pbuf_free_custom;
	my_pbuf.bufferPA         = bufptrPA;

	BufPtr =(uint8_t*) bufptrVA +24; // packet starts after 3 double words

	/* Since NCRAM region is used, this is not required for now*/
	//invalidate_cpu_cache(dma_desc->rx_data, dma_desc->rx_length);
	  
	  struct pbuf* p = pbuf_alloced_custom(PBUF_RAW,
	     packetLenInBytes,
	     PBUF_REF,
	     &my_pbuf.p,
	     BufPtr,
	     BUFFER_SIZE_IN_BYTES);

	  if(netif->input(p, netif) != ERR_OK) {
	    pbuf_free(p);
	  }
       /* end of zero copy receive*/
    return 0;  
  }


/******************************/


int
low_level_input(struct netif *netif)
{
  struct ethernetif *ethernetif = netif->state;
  struct pbuf *p, *q;
  uint32_t len,i;
  uint32_t* bufptrVA;
  uint64_t bufptrPA;
  uint8_t* BufPtr;

  /* Obtain the size of the packet and put it into the "len"
     variable. */
	 //cortos_printf("reached here 1\n");     
	// Read the buffer pointer from RxQ
	  int read_ok = cortos_readMessages(rx_queue, (uint8_t*)(&bufptrPA), 1);
	  if(read_ok == 0){
		  return 1;
	  }
	
	// reverse table PA -> VA access
	 bufptrVA = translatePAtoVA(bufptrPA);
	 if (bufptrVA == NULL){

		cortos_printf("failed to find PA to VA translation!\n");
		cortos_exit(0); 

		}
	/*
	// Print Packet Contents
	uint64_t*  BufferPtr = (uint64_t*)(bufptrVA);
	for(i=0;i<16 ;i++)
		cortos_printf("Packet[%u]: %016llx\n",8*i,(*BufferPtr++));
	*/	

	// Calculating packet length

	 len = getPacketLen(bufptrVA);
	 //cortos_printf("len = %u\n",len);	

#if ETH_PAD_SIZE
  len += ETH_PAD_SIZE; /* allow room for Ethernet padding */
#endif

  /* We allocate a pbuf chain of pbufs from the pool. */
 
  p = pbuf_alloc(PBUF_RAW, len, PBUF_POOL);
 
  if (p != NULL) {
	
#if ETH_PAD_SIZE
    pbuf_remove_header(p, ETH_PAD_SIZE); /* drop the padding word */
#endif

	// We would like to copy the contents after 3 double words i.e 24 bytes
	// actual packet starts from there.
	// First 8 byte : Control Word
	// Next 16 byte : Repeated Header

	BufPtr = ((uint8_t*)bufptrVA) + 24;

    /* We iterate over the pbuf chain until we have read the entire
     * packet into the pbuf. */
    for (q = p; q != NULL; q = q->next) {
      /* Read enough bytes to fill this pbuf in the chain. The
       * available data in the pbuf is given by the q->len
       * variable.*/

     // read data into(q->payload, q->len);

        memcpy(q->payload, BufPtr, q->len);
        BufPtr += q->len;
        //cortos_printf("q->len = %hu \n",q->len);
    }
	//cortos_printf("p->tot_len = %hu \n",p->tot_len);
   // acknowledge that packet has been read();
  
#if ETH_PAD_SIZE
    pbuf_add_header(p, ETH_PAD_SIZE); /* reclaim the padding word */
#endif

    
  } 

 if (p != NULL) {
    /* pass all packets to ethernet_input, which decides what packets it supports */
    if (netif->input(p, netif) != ERR_OK) {
  
      LWIP_DEBUGF(NETIF_DEBUG, ("ethernetif_input: IP input error\n"));
      pbuf_free(p);
      p = NULL;
      return 1;
    }

	// replenshing free q after buffer has been passed to top layers for processing
	int write_ok = cortos_writeMessages(free_queue_rx, (uint8_t*)(&bufptrPA) , 1);
 	if(write_ok == 0){
   		cortos_printf("failed to wrtite to freexQ\n");
	  return 1;
	 }
  	}

    return 0;  
  }





err_t
low_level_output(struct netif *netif, struct pbuf *p)
{
  struct pbuf *q;
  uint32_t* bufptrVA;
  uint64_t bufptrPA;

	// pop free_queue_tx for available buffer.

	int read_ok = cortos_readMessages(free_queue_tx, (uint8_t*)(&bufptrPA) , 1);
 	if(read_ok == 0){
		//cortos_printf("low_level_output: failed to read free buffer\n");
		return 1;
	 }

	// Preparing the Buffer for transmit Engine

	// reverse table PA -> VA access
	 bufptrVA = translatePAtoVA(bufptrPA);
	 if (bufptrVA == NULL){

		cortos_printf("low_level_output:failed to find PA to VA translation!\n");
		cortos_exit(0); 

	}

	// getting the length of packet to transmit.

	uint32_t lengthInBytes = p->tot_len;
	uint32_t lenInDW = getPacketLenInDW(lengthInBytes);
	uint32_t lastTkeep = getLastTkeep(lengthInBytes);
	*(bufptrVA + 1)  = (lenInDW << 11) | (lastTkeep) ;

	// Pushing the contents to transmit in this buffer.
	// Transmit engine sends after 3 8 byte words, see src code
	uint8_t* BufPtr = ((uint8_t*)bufptrVA) + 24; 
	for (q = p; q != NULL; q = q->next) {
	    /* Send the data from the pbuf to the interface, one pbuf at a
	       time. The size of the data in each pbuf is kept in the ->len
	       variable. */
	   // send data from(q->payload, q->len);
	    memcpy(BufPtr,q->payload,q->len);
	    //cortos_printf("BufPtr= %08lx, q->payload= %08lx\n",(uint32_t)BufPtr,(uint32_t)q->payload);
	    q->payload = (uint8_t*)q->payload + q->len;
	  }



	// Pushing the PA to transmit queue
 
	int write_ok = cortos_writeMessages(tx_queue, (uint8_t*)(&bufptrPA) , 1);
	 if(write_ok == 0){
	   cortos_printf("failed to wrtite to TxQ\n");
		  return 1;
	  }
	 // else
	  //  cortos_printf("netif->linkoutput() or low_level_output(): packet transmitted\n");

#if ETH_PAD_SIZE
  pbuf_add_header(p, ETH_PAD_SIZE); /* reclaim the padding word */
#endif


  return ERR_OK;
}

err_t 
netif_initialize(struct netif *netif)
{

  /* set MAC hardware address */
  netif->hwaddr_len = ETH_HWADDR_LEN;
  netif->hwaddr[0] = 0x00;//0x9c; 0x00;
  netif->hwaddr[1] = 0x0a;//0xb6; 0x0a;
  netif->hwaddr[2] = 0x35;//0x54; 0x35;
  netif->hwaddr[3] = 0x05;//0x0e; 0x05;
  netif->hwaddr[4] = 0x76;//0xa5; 0x76;
  netif->hwaddr[5] = 0xa0;//0xac; 0xa0;

  /* maximum transfer unit */
  netif->mtu = ETHERNET_MTU; // 1500

  /* device capabilities */
  /* don't set NETIF_FLAG_ETHARP if this device is not an ethernet one */
  netif->flags =  NETIF_FLAG_ETHARP | NETIF_FLAG_ETHERNET | NETIF_FLAG_LINK_UP ;


  netif->state = NULL;
  netif->name[0] = IFNAME0;
  netif->name[1] = IFNAME1;

  netif->output    =  etharp_output ; 
  netif->linkoutput = low_level_output;

  cortos_printf ("Configuration Done. NIC has started\n");
  return ERR_OK;

}


