#include <stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "cortos.h"
#include "ajit_access_routines.h"
#include "new.h"

int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);

	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 64;

	NicQueue nicQueue;
       	generateNicQueue(&nicQueue,msgSizeInBytes,length); 
	cortos_printf("Queues initialised\n");
	uint32_t size[1] = {1000000}, packet_size_array[1] = {1600};

	uint32_t *start[1],*packet_start_addr[length];
	if (initialiseSpace(packet_start_addr,packet_size_array,length,0) != length) cortos_printf("Packet init error\n");
	if (initialiseSpace(start,size,1,0) != 1) cortos_printf("Packet init error\n");
	cortos_printf("Memory spaces initialised\n");

	cortos_printf("%x %x %x\n",nicQueue.rx_queue,nicQueue.tx_queue,nicQueue.free_queue);
	cortos_printf("%x %x\n",start[0],packet_start_addr[0]);

	// push free queue
	uint32_t msg_written = cortos_writeMessages(nicQueue.free_queue, packet_start_addr, 63);
	if (msg_written != 63) CORTOS_ERROR("Free queue push failed\n");
	cortos_printf("Free queues initialised\n");
	
	nicRegConfig(&nicQueue);
	cortos_printf("NIC started\n");

	while (1){
	__ajit_serial_getchar__();cortos_printf("HI\n");}
	getFilesThroughEthernet(&nicQueue,start,1);
	cortos_printf("NIC started\n");
	__ajit_serial_getchar__();
	sendFilesThroughEthernet(&nicQueue,start,size,1);
	cortos_printf("NIC started\n");

	return(0);
}


