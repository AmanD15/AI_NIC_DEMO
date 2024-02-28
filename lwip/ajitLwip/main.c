
/* Define those to better describe your network interface. */

#include "./include/ethernetif.h"

#define IFNAME0 'e'
#define IFNAME1 'n'
#define ETHERNET_MTU 1500



// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 32
#define QUEUE_LENGTH (16 + 4 * NUMBER_OF_BUFFERS)



CortosQueueHeader* free_queue;
CortosQueueHeader* rx_queue;
CortosQueueHeader* tx_queue;


volatile uint32_t* volatile Buffers[8];
int message_counter;

/*************************** Interrupt Handler Begins ********************************/

#define TIMERCOUNT 100000
#define COUNT TIMERCOUNT
#define TIMERINITVAL ((COUNT << 1) | 1)

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
  netif->hwaddr_len = ETHARP_HWADDR_LEN;
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
int 
main()
{
  struct netif netif;
  
  lwip_init();
  netif_add_noaddr(&netif, NULL, netif_initialize, netif_input);

  //netif_create_ip6_linklocal_address(&netif, 1);
  //netif.ip6_autoconfig_enabled = 1;
  //netif_set_status_callback(&netif, netif_status_callback);
  
  netif_set_default(&netif);
  netif_set_up(&netif);
  
  


    /* Cyclic lwIP timers check */
    //sys_check_timeouts();
     
    /* your application goes here */





    
}


