#include "include/ethernetif.h"

/*************************** Interrupt Handler Begins ********************************/
#define TIMERCOUNT 100000
#define COUNT TIMERCOUNT
#define TIMERINITVAL ((COUNT << 1) | 1)
#define ETHER_FRAME_LEN 32
 
 int message_counter;
 
 
 // Ethernet frame structure: Destination MAC (6 bytes), Source MAC (6 bytes), Type (2 bytes), Payload (Variable bytes), CRC (4 bytes)
 
    uint8_t ethernet_frame[ETHER_FRAME_LEN] = {
        // Destination MAC Address: 0xAAAAAAAAAAAA
        0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA,
        // Source MAC Address: 0xBBBBBBBBBBBB
        0xBB, 0xBB, 0xBB, 0xBB, 0xBB, 0xBB,
        // Ethernet Type (Assuming IPv4 for example, 0x0800)
        0x08, 0x00,
        // Payload Data: "0123456789"
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
        // CRC (Placeholder)
    };
    
    
void my_timer_interrupt_handler()
{

	
	// Code which depends on interrupt being observed.
	// 	(for example: status of Coprocessor action, scheduling of co-processor actions etc.)
	//
	// code which does not directly depend on interrupt flag being observed
	//  (e.g. PVT calculation)
	// this code depends on the state which may have been altered
	// above.
	

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
		int i;
		for(i = 0 ; i < 32 ; i++)
			*(ptrToBuffer + i) = ethernet_frame[i];
		
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
		

	
		if(ethernetif_input(&netif) == ERR_OK) {




			// Write the buffer pointer to TxQ
			int write_ok = cortos_writeMessages(tx_queue, (uint8_t*)data, 1);
			message_counter++;



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

