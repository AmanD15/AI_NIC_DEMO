
/* Define those to better describe your network interface. */

#include "include/ethernetif.h"

#define IFNAME0 'e'
#define IFNAME1 'n'
#define ETHERNET_MTU 1500

/*************************** Interrupt Handler Begins ********************************/

#define TIMERCOUNT 100000
#define COUNT TIMERCOUNT
#define TIMERINITVAL ((COUNT << 1) | 1)
int message_counter;
void my_timer_interrupt_handler()
{

	
	// Code which depends on interrupt being observed.
	// 	(for example: status of Coprocessor action, scheduling of co-processor actions etc.)
	//
	// code which does not directly depend on interrupt flag being observed
	//  (e.g. PVT calculation)
	// this code depends on the state which may have been altered
	// above.
	

	int i;
	char packetData[30];
  for(i=0;i<30;i++) packetData[i]=i;
	cortos_printf ("no. of messages forwarded by main(): %d\n",message_counter);

	/* TRANSMISSION EMULATION*/
	
	uint32_t ptrToDataTx;
	int TxQpop = cortos_readMessages(tx_queue, (uint8_t*)(&ptrToDataTx), 1);

	if(TxQpop)
	{
		cortos_printf ("NIC transmitted a packet\n");

		// Pushing the buffer back to freeQ
		int freeQpush = cortos_writeMessages(free_queue, (uint8_t*)(&ptrToDataTx), 1);
		if(freeQpush)
			cortos_printf ("FreeQ replenished back\n");
		else
			cortos_printf ("FreeQ push failed\n");

	}
	else
		cortos_printf ("NIC has no packet to transmit!\n");
		


	/* RECEPTION EMULATION */

	// Get a free buffer from freeQ
	uint32_t ptrToDataRx;
	int freeQpop = cortos_readMessages(free_queue, (uint8_t*)(&ptrToDataRx), 1);

	if(freeQpop)
	{
		cortos_printf ("free buffer obtained by NIC\n");
		
		// Copying data to free buffer
		uint8_t* ptrToBuffer =(uint8_t*) ptrToDataRx;

		for(i = 0 ; i < 30 ; i++)
			*(ptrToBuffer + i) = packetData[i];
		
		// Pushing the buffer to RxQ
		int RxQpush = cortos_writeMessages(rx_queue, (uint8_t*)(&ptrToDataRx), 1);
	
		if(RxQpush)
			cortos_printf ("NIC received a packet\n");
		else
			cortos_printf ("NIC reception failure!\n");
	}

	else
		cortos_printf ("no free buffer available for NIC!\n");
		
    

	// clear timer control register.
	__ajit_write_timer_control_register_via_vmap__ (0x0);

	// reenable the timer, right away..
	__ajit_write_timer_control_register_via_vmap__ (TIMERINITVAL);

}


static err_t
low_level_output(struct netif *netif, struct pbuf *p)
{
  struct ethernetif *ethernetif = netif->state;
  struct pbuf *q;

  //initiate transfer();

#if ETH_PAD_SIZE
  pbuf_remove_header(p, ETH_PAD_SIZE); /* drop the padding word */
#endif

  for (q = p; q != NULL; q = q->next) {
    /* Send the data from the pbuf to the interface, one pbuf at a
       time. The size of the data in each pbuf is kept in the ->len
       variable. */
   // send data from(q->payload, q->len);
  }

 // signal that packet should be sent();

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
  netif->hwaddr[0] = 0x00;
  netif->hwaddr[1] = 0x0a;
  netif->hwaddr[2] = 0x35;
  netif->hwaddr[3] = 0x05;
  netif->hwaddr[4] = 0x76;
  netif->hwaddr[5] = 0xa0;

  /* maximum transfer unit */
  netif->mtu = ETHERNET_MTU; // 1500

  /* device capabilities */
  /* don't set NETIF_FLAG_ETHARP if this device is not an ethernet one */
  netif->flags =  NETIF_FLAG_ETHERNET ;


  netif->state = NULL;
  netif->name[0] = IFNAME0;
  netif->name[1] = IFNAME1;

  netif->output    = NULL; //etharp_output;
  netif->linkoutput = low_level_output;

  cortos_printf ("Configuration Done. NIC has started\n");
  return ERR_OK;

}



/*************************** main begins ********************************/

int main()
{
	__ajit_write_serial_control_register__ (TX_ENABLE); 

	
	cortos_printf ("Started\n");

	struct netif netif;
	lwip_init();
	netif_add_noaddr(&netif, NULL, netif_initialize, netif_input);
	netif_set_default(&netif);
	netif_set_up(&netif);
	low_level_init();

/* Application beigns here*/

	uint32_t i;
	uint32_t data[1];
	uint32_t controlRegister;
	


	// enable interrupt controller for the current thread.
	enableInterruptControllerAndAllInterrupts(0,0);

	// enable the timer, right away..
	__ajit_write_timer_control_register_via_vmap__ (TIMERINITVAL);
	message_counter=0;
	
	
	while(1)

	// spin this loop
	// while this loop is running, the interrupt handler
	// will be invoked by a timer interrupt (every 1ms or 10ms etc.)
	//   1. the interrupt handler will pop a packet from the tx-queue
	//      and if available, check the packet data if it is as expected.
	//   2. the interrupt handler will pop a buffer from the free queue
	//       and if available, fill it and push it to the rx-queue.

	{
		
		// disable timer interrupt and confirm that it is
		// disabled, by reading back the interrupt control register.
		//__TURN_OFF_INTERRUPTS__;
		
		disableInterrupt(0, 0, 10);
		controlRegister = readInterruptControlRegister(0, 0);
		

		// Read the buffer pointer from RxQ
		int read_ok = cortos_readMessages(rx_queue, (uint8_t*)data, 1);
		
		
	
		if(read_ok) {

			ethernetif_input(&netif);

			
			// Write the buffer pointer to TxQ
			int write_ok = cortos_writeMessages(tx_queue, (uint8_t*)data, 1);
			message_counter++;
			// just enable the interrupt by writing to the interrupt control register..
			//__TURN_ON_INTERRUPTS;
			enableInterrupt(0, 0, 10);
				

		}	
		else
		{
			// Spin for 1024 clock cycles.
			enableInterrupt(0, 0, 10);
			__ajit_sleep__ (1024);
		}


		if(message_counter == 512) break;
	}
	


	// free queue
	cortos_freeQueue(rx_queue);	
	cortos_freeQueue(tx_queue);	
	cortos_freeQueue(free_queue);

	// release buffers
	for(i = 0; i < 8; i++)
	{
		cortos_printf("Releasing buffer[%d] 0x%lx\n",i,(uint32_t)Buffers[i]);
		cortos_brel_ncram(Buffers[i]);
		cortos_printf("Released  buffer[%d] 0x%lx\n",i,(uint32_t)Buffers[i]);
		
	}
		

	return 0;
}

