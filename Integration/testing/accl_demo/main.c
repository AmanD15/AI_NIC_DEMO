#include "decl.h"

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
	uint32_t kernel_size_array[18] = {1728+32,36864+32,73728+32,147456+32,294912+32,589824+32,
		1179648+32,2359296+32,524288+32,1179648+32,589824+32,131072+32,
		294912+32,147456+32,32768+32,73728+32,36864+32,1728+32};
	uint32_t tensor_size_array[5] = {3211264+32,3211264+32,3211264+32,1605632+32,802816+32};
	uint32_t packet_size_array[1] = {1600};

	uint32_t *kernel_start_addr[18], *tensor_start_addr[4][5], *packet_start_addr[length];
	uint32_t *new_kernel[18], *new_tensor[4][5];
	uint32_t kernel[18], tensor[4][5];
	if (initialiseSpace(kernel_start_addr,kernel_size_array,18,1) != 18) cortos_printf("Kernel init error\n");
	if (initialiseSpace(tensor_start_addr[0],tensor_size_array,5,1) != 5) cortos_printf("Tensor 1 init error\n");
	if (initialiseSpace(tensor_start_addr[1],tensor_size_array,5,1) != 5) cortos_printf("Tensor 2 init error\n");
	if (initialiseSpace(tensor_start_addr[2],tensor_size_array,5,1) != 5) cortos_printf("Tensor 3 init error\n");
	if (initialiseSpace(tensor_start_addr[3],tensor_size_array,5,1) != 5) cortos_printf("Tensor 4 init error\n");
	if (initialiseSpace(packet_start_addr,packet_size_array,length,0) != length) cortos_printf("Packet init error\n");
	cortos_printf("Memory spaces initialised\n");
	
	payloadAddressFromNetworkAddress(new_kernel,kernel_start_addr,6,18);
	byteToDoubleWord(new_kernel,kernel,18);
	payloadAddressFromNetworkAddress(new_tensor[0],tensor_start_addr[0],6,5);
	payloadAddressFromNetworkAddress(new_tensor[1],tensor_start_addr[1],6,5);
	payloadAddressFromNetworkAddress(new_tensor[2],tensor_start_addr[2],6,5);
	payloadAddressFromNetworkAddress(new_tensor[3],tensor_start_addr[3],6,5);
	byteToDoubleWord(new_tensor[0],tensor[0],5);
	byteToDoubleWord(new_tensor[1],tensor[1],5);
	byteToDoubleWord(new_tensor[2],tensor[2],5);
	byteToDoubleWord(new_tensor[3],tensor[3],5);

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

	getFilesThroughEthernet(&nicQueue,kernel_start_addr,18);

	//while(1)
	{
	
		// ------------------------
		// -- 5 Read Image from NIC
		// ------------------------
		getFilesThroughEthernet(&nicQueue,tensor_start_addr[0],5);
		getFilesThroughEthernet(&nicQueue,tensor_start_addr[1],5);
		getFilesThroughEthernet(&nicQueue,tensor_start_addr[2],5);
		getFilesThroughEthernet(&nicQueue,tensor_start_addr[3],5);
	
		// ------------------------------
		// -- 6 send co-ordinates to accl
		// -- 7 wait till interrupt
		// ------------------------
		//cortos_printf("Reached pre-compute here\n");
	

		writeNicReg(0,0); 			//NIC_REG[0] = 1;
		uint64_t start = cortos_get_clock_time();


		// Stages are 1 to 18
		// Engines are 0 to 3
		process_image(0,kernel,tensor[0],&nicQueue,1);
		process_image(1,kernel,tensor[1],&nicQueue,1);
		process_image(2,kernel,tensor[2],&nicQueue,1);
		process_image(3,kernel,tensor[3],&nicQueue,1);
		uint8_t s1 = 2, s2 = 2, s3 = 2,s4 =2;
		while ((s1 <= 18) || (s2 <= 18) || (s3 <= 18) || (s4 <= 18))
		{
			//cortos_printf("%u %u %u %u\n",s1,s2,s3,s4);
			if (s1 <= 18)
			{
				if (poll_on_accelerator(0,1))
				{
					disable_accelerator(0);
					process_image(0,kernel,tensor[0],&nicQueue,s1);
					s1++;
				}
			}
			if (s2 <= 18)
			{
				if (poll_on_accelerator(1,1))
				{
						disable_accelerator(1);
						process_image(1,kernel,tensor[1],&nicQueue,s2);
						s2++;
				}
			}
			if (s3 <= 18)
			{
				if (poll_on_accelerator(2,1))
				{
						disable_accelerator(2);
						process_image(2,kernel,tensor[2],&nicQueue,s3);
						s3++;
				}
			}
			if (s4 <= 18)
			{
				if (poll_on_accelerator(3,1))
				{
						disable_accelerator(3);
						process_image(3,kernel,tensor[3],&nicQueue,s4);
						s4++;
				}
			}
		}
		uint64_t end = cortos_get_clock_time();
		uint64_t time = (end - start);

		uint32_t time_low = time&0xFFFFFFFF;
		uint32_t time_high = time>>32;
		cortos_printf("Time taken = %u %u\n",time_high,time_low);

		// -----------------------------
		// -- 8 Send processed image out
		// -----------------------------
		uint32_t op_array[1] = {224*224*3+24};

		writeNicReg(0,1); 			//NIC_REG[0] = 1;
		sendFilesThroughEthernet(&nicQueue,tensor_start_addr[0],op_array,1);
		sendFilesThroughEthernet(&nicQueue,tensor_start_addr[1],op_array,1);
		sendFilesThroughEthernet(&nicQueue,tensor_start_addr[2],op_array,1);
		sendFilesThroughEthernet(&nicQueue,tensor_start_addr[3],op_array,1);
		//sendFilesThroughEthernet(&nicQueue,kernel_start_addr,kernel_size_array,18);
		//sendFilesThroughEthernet(&nicQueue,tensor_start_addr,tensor_size_array,5);
	


	}
	//getFilesThroughEthernet(&nicQueue,tensor_start_addr,3);
	//execute_convolution_layer (16,16,16,16,16,16,3,3,tensor[0],ACC_UNUSED_ADDR,tensor[1],tensor[2],ACC_UNUSED_ADDR,1,0,1,0,1,&nicQueue);

	while(1);
	return(0);
}


