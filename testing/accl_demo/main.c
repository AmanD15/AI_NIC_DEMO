#include "new.h"

#define PROG_START_ADDR 0x220000

int main()
{
	 __ajit_write_serial_control_register__ ( TX_ENABLE | RX_ENABLE);
	// ---------------
	// -- FLOW
	// ---------------

	// 1 Allocate buffers and initialise queues
	// 2 configure NIC registers
	// 3 configure ACCL registers
	// 4 Write control data co-ordinates to ACCL
	// 5 Read Image from NIC
	// 6 send co-ordinates to accl
	// 7 wait till interrupt
	// 8 Send processed image out
	

	// -------------------------------------------
	// -- 1 Allocate buffers and initialise queues
	// -------------------------------------------
 	uint32_t msgSizeInBytes,length,msgs_written;
	msgSizeInBytes = 4;
	length = 64;

	NicQueue nicQueue;
       	generateNicQueue(&nicQueue,msgSizeInBytes,length); 
	cortos_printf("Queues initialised\n");
	uint32_t kernel_size_array[18] = {1728+32,36864+32,73728+32,147456+32,294292+32,589824+32,
		1179648+32,2359296+32,524288+32,1179648+32,589824+32,131072+32,
		294292+32,147456+32,32768+32,73728+32,36864+32,1728+32};
	uint32_t tensor_size_array[5] = {3211264+32,3211264+32,3211264+32,1605632+32,802816+32};
	uint32_t packet_size_array[1] = {1600};

	uint32_t *kernel_start_addr[18], *tensor_start_addr[5], *packet_start_addr[length];
	uint32_t *new_kernel[18], *new_tensor[5];
	uint32_t kernel[18], tensor[5];
	if (initialiseSpace(kernel_start_addr,kernel_size_array,18,1) != 18) cortos_printf("Kernel init error\n");
	if (initialiseSpace(tensor_start_addr,tensor_size_array,5,1) != 5) cortos_printf("Tensor init error\n");
	if (initialiseSpace(packet_start_addr,packet_size_array,length,0) != length) cortos_printf("Packet init error\n");
	cortos_printf("Memory spaces initialised\n");
	
	payloadAddressFromNetworkAddress(new_kernel,kernel_start_addr,6,18);
	byteToDoubleWord(new_kernel,kernel,18);
	payloadAddressFromNetworkAddress(new_tensor,tensor_start_addr,6,5);
	byteToDoubleWord(new_tensor,tensor,5);

	int i;
	//for (i=0;i<18;i++) cortos_printf("%u %x %x\n",i,kernel_start_addr[i]);
	//for (i=0;i<5;i++) cortos_printf("%u %x %x\n",i,tensor_start_addr[i]);
	
	// push free queue
	uint32_t msg_written = cortos_writeMessages(nicQueue.free_queue, packet_start_addr, 63);
	if (msg_written != 63) CORTOS_ERROR("Free queue push failed\n");
	cortos_printf("Free queues initialised\n");
	
	// ----------------------------
	// -- 2 configure NIC registers
	// ----------------------------	
	nicRegConfig(&nicQueue);
	cortos_printf("NIC started\n");

	//getFilesThroughEthernet(&nicQueue,kernel_start_addr,18);

	//while(1)
	{
	
		// ------------------------
		// -- 5 Read Image from NIC
		// ------------------------
		//getFilesThroughEthernet(&nicQueue,tensor_start_addr,5);
	
		// ------------------------------
		// -- 6 send co-ordinates to accl
		// -- 7 wait till interrupt
		// ------------------------
		//cortos_printf("Reached pre-compute here\n");
		//process_image(kernel,tensor,&nicQueue);

		// -----------------------------
		// -- 8 Send processed image out
		// -----------------------------
		//uint32_t op_array[1] = {224*224*3+32};
		//sendFilesThroughEthernet(&nicQueue,tensor_start_addr,op_array,1);
		//sendFilesThroughEthernet(&nicQueue,kernel_start_addr,kernel_size_array,18);
		//sendFilesThroughEthernet(&nicQueue,tensor_start_addr,tensor_size_array,5);
	


	}
	getFilesThroughEthernet(&nicQueue,tensor_start_addr,3);
	execute_convolution_layer (16,16,16,16,16,16,3,3,tensor[0],ACC_UNUSED_ADDR,tensor[1],tensor[2],ACC_UNUSED_ADDR,1,0,1,0,1,&nicQueue);

	while(1);
	return(0);
}


