#include<stdio.h>
#include <stdint.h>
#include <cortos.h>
#include <ajit_access_routines.h>
#include <ajit_mt_irc.h>
#include <core_portme.h>


// queue related constants
#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 32
#define QUEUE_LENGTH (16 + 4 * NUMBER_OF_BUFFERS)

#define X8_F  "02x" 
#define X16_F "hx"
/** MAC Addr */
struct eth_addr {
 uint8_t addr[6];
};

/** Ethernet header */
struct eth_hdr {
 struct eth_addr dest;
 struct eth_addr src;
 uint16_t type;
};



CortosQueueHeader* free_queue;
CortosQueueHeader* rx_queue;
CortosQueueHeader* tx_queue;


volatile uint32_t* volatile Buffers[8];
int message_counter;

/*************************** Interrupt Handler Begins ********************************/

#define TIMERCOUNT 100000
#define COUNT TIMERCOUNT
#define TIMERINITVAL ((COUNT << 1) | 1)
#define ETHER_FRAME_LEN 32
 
 
 // Ethernet frame structure: Destination MAC (6 bytes), Source MAC (6 bytes), Type (2 bytes), Payload (Variable bytes), CRC (4 bytes)
 
    uint8_t ethernet_frame[ETHER_FRAME_LEN] = {
        // Destination MAC Address: 0xAAAAAAAAAAAA
        0x00, 0x0a, 0x35, 0x05, 0x76, 0xa0,
        // Source MAC Address: 0xBBBBBBBBBBBB
        0xBB, 0xBB, 0xBB, 0xBB, 0xBB, 0xBB,
        // Ethernet Type (Assuming IPv4 for example, 0x0800)
        0x08, 0x00,
	// Payload Data:0123456789
	'0','1','2','3','4','5','6','7','8','9'
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
		for(i = 0 ; i < 24 ; i++){
			
			*(ptrToBuffer + i) = ethernet_frame[i];
		
		}

		// Pushing the buffer to RxQ
		cortos_printf("IN NIC :bufptr written = %lx \n", ptrToDataRx);
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
	
	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 8;
	int I = 0;
	
	uint32_t bufptr;
	
	uint32_t controlRegister;
	// Get queues.

	free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	rx_queue   = cortos_reserveQueue(msgSizeInBytes, length, 1);
	tx_queue   = cortos_reserveQueue(msgSizeInBytes, length, 1);
		
	cortos_printf("Reserved queues: free=0x%lx, rx=0x%lx, tx=0x%lx\n",
				(uint32_t) free_queue,
				(uint32_t) rx_queue,
				(uint32_t) tx_queue);

				
	// Allocate buffers
	
	int i;
	for(i = 0; i < 8; i++)
	{
		Buffers[i] = (uint32_t*) cortos_bget_ncram(BUFFER_SIZE_IN_BYTES);
		cortos_printf("Allocated Buffer[%d] = 0x%lx\n", i,(uint32_t)Buffers[i]);
	}


	// Preparing the allocated buffers, to push into the Q, via cortos_writeMessages

	uint32_t BuffersForQ[8];
	for(i = 0;i < 8; i++)
	BuffersForQ[i] = (uint32_t) Buffers[i];
	
	// Put the four buffers onto the free-queue, so free queue has space, if Tx Q wants to push after transmission.

	for(i = 0; i < 4; i++)
	{
		msgs_written = cortos_writeMessages(free_queue, (uint8_t*) (BuffersForQ + i), 1);
		cortos_printf("Stored Buffer[%d] in free-queue = 0x%lx\n", i, BuffersForQ[i]);
	}


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
		
		int read_ok = cortos_readMessages(rx_queue, (uint8_t*)(&bufptr), 1);
		cortos_printf("IN MAIN :bufptr red = %lx \n",bufptr);
	
		if(read_ok) {

			

			struct eth_hdr *ethhdr = (struct eth_hdr *)bufptr;
	 cortos_printf("ethernet_input: dest:%"X8_F":%"X8_F":%"X8_F":%"X8_F":%"X8_F":%"X8_F", src:%"X8_F":%"X8_F":%"X8_F":%"X8_F":%"X8_F":%"X8_F", 				type:%"X16_F"\n",
		       (unsigned char)ethhdr->dest.addr[0], (unsigned char)ethhdr->dest.addr[1], (unsigned char)ethhdr->dest.addr[2],
		       (unsigned char)ethhdr->dest.addr[3], (unsigned char)ethhdr->dest.addr[4], (unsigned char)ethhdr->dest.addr[5],
		       (unsigned char)ethhdr->src.addr[0],  (unsigned char)ethhdr->src.addr[1],  (unsigned char)ethhdr->src.addr[2],
		       (unsigned char)ethhdr->src.addr[3],  (unsigned char)ethhdr->src.addr[4],  (unsigned char)ethhdr->src.addr[5],
		       (uint16_t)(ethhdr->type) );

			
			// Write the buffer pointer to TxQ
			int write_ok = cortos_writeMessages(tx_queue, (uint8_t*)(&bufptr), 1);
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


		if(message_counter == 16) {	
		
			disableInterrupt(0, 0, 10);
			controlRegister = readInterruptControlRegister(0, 0);
			break;
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



