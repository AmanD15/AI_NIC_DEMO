#include "include/ethernetif.h"
#include "nic_driver.h"
int main()
{
	__ajit_write_serial_control_register__ (TX_ENABLE); 

	
	cortos_printf ("Started\n");
	const ip4_addr_t ipaddr  =  {{LWIP_MAKEU32(10,107,90,23)}}  ;
	const ip4_addr_t netmask  = {{LWIP_MAKEU32(255,255,240,0)}}  ; 
	const ip4_addr_t gw       = {{LWIP_MAKEU32(10,200,1,11)}}  ; 

	struct netif netif;
	lwip_init();
	//netif_add_noaddr(&netif, NULL, netif_initialize, netif_input);
	netif_add(&netif, &ipaddr, 
					  &netmask,
					  &gw, NULL, 
					  netif_initialize, netif_input);

	netif_set_default(&netif);
	netif_set_up(&netif);
	

	low_level_init();

/* Application beigns here*/

	unsigned int i;
	int message_counter = 0;
	
	while(1)

	{
		
		if(low_level_input(&netif) == 0) {

			message_counter++;
			cortos_printf ("main(): no. of messages recieved: %d\n",message_counter);
			
			
		}
		else
		{
			// Spin for 1024 clock cycles.
			__ajit_sleep__ (1024);
		}
	
		sys_check_timeouts();
		if(message_counter == 2048) {	
				break;
			}
	
	}
	

	// Disabling the NIC
	
	disableNic (0);

	// freeing the allocated queue

	cortos_freeQueue(rx_queue);	
	cortos_freeQueue(tx_queue);	
	cortos_freeQueue(free_queue);

	// release buffers
	for(i = 0; i < NUMBER_OF_BUFFERS; i++)
	{
		cortos_printf("Releasing buffer[%d] 0x%lx\n",i,(uint32_t)BufferPtrsVA[i]);
		cortos_brel_ncram(BufferPtrsVA[i]);
		cortos_printf("Released  buffer[%d] 0x%lx\n",i,(uint32_t)BufferPtrsVA[i]);
		
	}
		

	return 0;
}
