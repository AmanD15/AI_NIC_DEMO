#include "include/ethernetif.h"


 
 // Ethernet frame structure: Destination MAC (6 bytes), Source MAC (6 bytes), Type (2 bytes), Payload (Variable bytes), CRC (4 bytes)
 
    uint8_t ethernet_frame[ETHER_FRAME_LEN] = {
		
    
	//ETHERNET HEADER:
		// Destination MAC Address: 
		0x00, 0x0A, 0x35, 0x05, 0x76, 0xA0,
		// Source MAC Address: 
		0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB,
		// Ethernet Type (Assuming IPv4 for example, 0x0800)
		0x08, 0x00, 

    // IP HEADER:
		0x45, 0x00, 0x00, 0x22, 
		0x04, 0xD2, 0x00, 0x00,
		0x40, 0x01, 0xF1, 0xEE,
		// Source IP Address:  
		0xC0, 0xA8, 0x01, 0x64, 
		// Destination IP Address:
		0xC0, 0xA8, 0x01, 0x66, 

	// ICMP HEADER:
		0x08, 0x00, 0xCF, 0x5A, 
		0x04, 0xD2, 0x00, 0x01,

	// ICMP DATA: Hello	 
		0x48, 0x65, 0x6C, 0x6C, 
		0x6F, 0x00
		

	};
    

// ARP Response packet
    uint8_t arpResponse[ETHER_FRAME_LEN] = {
		
    
	//ETHERNET HEADER:
		// Destination MAC Address: 
		0x00, 0x0A, 0x35, 0x05, 0x76, 0xA0,
		// Source MAC Address: 
		0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB,
		// Ethernet Type (Assuming IPv4 for example, 0x0800)
		0x08, 0x06, 

    //Constructed ARP Response:
		0x00, 0x01, 0x08, 0x00, 
		0x06, 0x04, 0x00, 0x02, 
		0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB,  
		0xC0, 0xA8, 0x01, 0x64, 
		0x00, 0x0A, 0x35, 0x05, 0x76, 0xA0,  
		0xC0, 0xA8, 0x01, 0x66
	
	};
    
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

	cortos_printf ("\n*************** EMULATED NIC(HARDWARE) LOG BEGINS***************\n");


	/* TRANSMISSION EMULATION*/
	uint8_t arpPacketTransmitted,arpPacketReceived; 
	uint8_t* ethernetFrame;
	uint32_t ptrToDataTx;
	
	int TxQpop = cortos_readMessages(tx_queue, (uint8_t*)(&ptrToDataTx), 1);

	if(TxQpop)
	{
		ethernetFrame = (uint8_t*) ptrToDataTx;
		arpPacketTransmitted = (ethernetFrame[12] == 0x08) && (ethernetFrame[13] == 0x06);
		cortos_printf ("NIC transmitted a packet \n");

		// Print the constructed Ethernet frame
		cortos_printf("Transmitted packet:\n");

		cortos_printf("Ethernet Header:\n");
		printEthernetFrame(ethernetFrame, 0, 14, 6);


		if(arpPacketTransmitted)
		{
			cortos_printf("ARP Header:\n");
			printEthernetFrame(ethernetFrame, 14, (14 + 28), 4);
		}
		else
		{
			cortos_printf("IP Header:\n");
			printEthernetFrame(ethernetFrame, 14, (14 + 20), 4);

			cortos_printf("ICMP Header:\n");
			printEthernetFrame(ethernetFrame, 34, (34 + 8), 4);
		}

		// Pushing the buffer back to freeQ
		int freeQpush = cortos_writeMessages(free_queue, (uint8_t*)(&ptrToDataTx), 1);
		if(freeQpush)
		{
			cortos_printf ("FreeQ replenished back\n");
		}
		else
		{
			cortos_printf ("FreeQ push failed\n");
		}

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
		int i;
	
		if(TxQpop)
		{

			
			if (arpPacketTransmitted)
				{
					 memcpy(ptrToBuffer,arpResponse,ETHER_FRAME_LEN);
				}

			else
				{

					memcpy(ptrToBuffer,ethernet_frame,ETHER_FRAME_LEN);

				}



		}
		else
		{

			memcpy(ptrToBuffer,ethernet_frame,ETHER_FRAME_LEN);

		}
			

		// Pushing the buffer to RxQ
		cortos_printf("bufptr written = %lx \n", ptrToDataRx);
		int RxQpush = cortos_writeMessages(rx_queue, (uint8_t*)(&ptrToDataRx), 1);
	
		if(RxQpush)
		{
			cortos_printf ("NIC received a packet\n");

			// Print the constructed Ethernet frame
			cortos_printf("Receieved packet:\n");

			cortos_printf("Ethernet Header:\n");
			printEthernetFrame(ptrToBuffer, 0, 14, 6);

			arpPacketReceived = (ptrToBuffer[12] == 0x08) && (ptrToBuffer[13] == 0x06);

			if (arpPacketReceived)
				{
					cortos_printf("ARP Header:\n");
					printEthernetFrame(ptrToBuffer, 14, (14 + 28), 4);
				}

			else
				{

					cortos_printf("IP Header:\n");
					printEthernetFrame(ptrToBuffer, 14, (14 + 20), 4);

					cortos_printf("ICMP Header:\n");
					printEthernetFrame(ptrToBuffer, 34, (34 + 8), 4);

				}
			




		}
		else
			cortos_printf ("NIC reception failure!\n");
	}

	else
		cortos_printf ("no free buffer available for NIC!\n");
		
    
	    cortos_printf ("\n*************** EMULATED NIC(HARDWARE) LOG ENDS*****************\n");
	// clear timer control register.
	__ajit_write_timer_control_register_via_vmap__ (0x0);

	// reenable the timer, right away..
	__ajit_write_timer_control_register_via_vmap__ (TIMERINITVAL);

}



/*************************** main begins ********************************/

int main()
{
	__ajit_write_serial_control_register__ (TX_ENABLE); 

	
	cortos_printf ("Started\n");
	const ip4_addr_t ipaddr  =  {{LWIP_MAKEU32(192,168,1,102)}}  ;
	const ip4_addr_t netmask  = {{LWIP_MAKEU32(255,255,255,0)}}  ;
	const ip4_addr_t gw       = {{LWIP_MAKEU32(127,0,0,1)}}  ;

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

	uint32_t i;
	uint32_t controlRegister;
	

	// enable the timer, right away..
	__ajit_write_timer_control_register_via_vmap__ (TIMERINITVAL);
	message_counter=0;
	
	unsigned int n = 1;
	char *c;
	c = (char *)&n;
	if(*c  == 1)
		cortos_printf("Ajit Follows Little endian \n");
	else
		cortos_printf("Ajit Follows Big endian \n");

	// enable interrupt controller for the current thread.
	enableInterruptControllerAndAllInterrupts(0,0);
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
		

	
		if(low_level_input(&netif) == ERR_OK) {



			message_counter++;
			cortos_printf ("main(): no. of messages recieved: %d\n",message_counter);

			if(message_counter == 8) {	
		
			disableInterrupt(0, 0, 10);
			controlRegister = readInterruptControlRegister(0, 0);
			break;
			}

			// just enable the interrupt by writing to the interrupt control register..
			//__TURN_ON_INTERRUPTS;
			enableInterrupt(0, 0, 10);
		}	
		else
		{
			
			// just enable the interrupt by writing to the interrupt control register..
			//__TURN_ON_INTERRUPTS;
			enableInterrupt(0, 0, 10);
			// Spin for 1024 clock cycles.
			__ajit_sleep__ (1024);
		}


	
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

