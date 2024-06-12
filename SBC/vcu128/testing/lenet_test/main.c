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

	float utils_vals[30] = {
		0.015748031437397003,64,0.008999070152640343,0,0.05437639355659485,0,
		0.05437639355659485,0,0.027467360720038414,0,0.2836248278617859,0,
		0.2836248278617859,0,0.03345179185271263,0,1.6415902376174927,0,
		1.6415902376174927,0,0.0163983516395092,0,2.435471773147583,0,
		2.435471773147583,0,0.024049585685133934,0,2.011951208114624,90
	};

	float *util_start_addr;
	util_start_addr = (float*)cortos_bget_ncram(300);

	float *util_cur_addr = util_start_addr;
	int j =0;
	for(j=0;j<30;j++){
		*util_cur_addr = (float)utils_vals[j];
		util_cur_addr++;
	}

	uint32_t kernel_size_array[5] = {2500+32,5000+32,40000+32,20000+64,20000+64};
	uint32_t input_size_array[1] = {10500+64};
	uint32_t output_size_array[1] = {3000+64};
	uint32_t packet_size_array[1] = {1600};

	uint32_t *kernel_start_addr[5], *input_start_addr[1],*output_start_addr[1], *packet_start_addr[length];
	// float *utils_start_addr[1];

	uint32_t *new_kernel[5], *new_input_tensor[1], *new_output_tensor[1];
	// float *new_utils[1];

	uint32_t kernel[5], input[1],output[1];
	// float utils[1];
	if (initialiseSpace(kernel_start_addr,kernel_size_array,5,1) != 5) cortos_printf("Kernel init error\n");
	if (initialiseSpace(input_start_addr,input_size_array,1,1) != 1) cortos_printf("Input init error\n");
	if (initialiseSpace(output_start_addr,output_size_array,1,1) != 1) cortos_printf("Output init error\n");

	if (initialiseSpace(packet_start_addr,packet_size_array,length,0) != length) cortos_printf("Packet init error\n");
	cortos_printf("Memory spaces initialised\n");
	
	payloadAddressFromNetworkAddress(new_kernel,kernel_start_addr,6,5);
	byteToDoubleWord(new_kernel,kernel,5);
	payloadAddressFromNetworkAddress(new_input_tensor,input_start_addr,6,1);

	
	int kk;
	uint8_t *output_cur_addr1 = (uint8_t*)output_start_addr[0];
	for(kk = 0; kk < 800; kk++)
	{	
		*output_cur_addr1 = 101;
		output_cur_addr1++;

	}

	int i;

	
	// push free queue
	uint32_t msg_written = cortos_writeMessages(nicQueue.free_queue, packet_start_addr, 63);
	if (msg_written != 63) CORTOS_ERROR("Free queue push failed\n");
	cortos_printf("Free queues initialised\n");
	
	// ----------------------------
	// -- 2 configure NIC registers
	// ----------------------------	
	nicRegConfig(&nicQueue);
	cortos_printf("NIC started\n");


	getFilesThroughEthernet(&nicQueue,kernel_start_addr,5);
	cortos_printf("Kernel Data Received\n");

	while(1)
	{
		payloadAddressFromNetworkAddress(new_input_tensor,input_start_addr,6,1);
	
		// ------------------------
		// -- 5 Read Image from NIC
		// ------------------------
		getFilesThroughEthernet(&nicQueue,input_start_addr,1);
		cortos_printf("Image Received\n");

		writeNicReg(0,0); 	



		// ------------------------------
		// -- 6 send co-ordinates to accl
		// -- 7 wait till interrupt
		// ------------------------
		//cortos_printf("Reached pre-compute here\n");


				//NIC_REG[0] = 1;
		uint64_t start = cortos_get_clock_time();

		util_cur_addr =  util_start_addr;
		uint8_t s1 = 1;
		uint32_t *temp_addr;
		uint32_t read_val;
		while ((s1 <= 5))
		{
			cortos_printf("Current Stage is %u\n",s1);
			if (s1 <= 5)
			{
				process_image(0,new_kernel,new_input_tensor,output_start_addr, util_cur_addr,&nicQueue,s1);

				read_val = readACCLReg(0,0);
				while ((read_val & 16) == 0)
				{
					uint64_t time = cortos_get_clock_time();
					// Wait for us microseconds
					uint64_t new_time = time + CLK_FREQ_IN_MHZ;
					while (new_time > time) time = cortos_get_clock_time();
					read_val = readACCLReg(0,0);
				}
				cortos_printf("Completed convolution\n");
				util_cur_addr += 6;
				temp_addr            =  (uint32_t*)new_input_tensor[0];
				new_input_tensor[0]  =  (uint32_t*)output_start_addr[0];
				if(s1 !=5){
					output_start_addr[0] =  (uint32_t*)temp_addr;
				}
				
				s1++;
			}
		}


		uint64_t end = cortos_get_clock_time();
		uint64_t time = (end - start);

		uint32_t time_low = time&0xFFFFFFFF;
		uint32_t time_high = time>>32;
		cortos_printf("Time taken = %u %u\n",time_high,time_low);

		uint8_t *output_cur_addr = (uint8_t*) output_start_addr[0];
		uint8_t *input_cur_addr = (uint8_t*)input_start_addr[0];
		input_cur_addr = input_cur_addr + 24;
		int k = 0;
		for(k = 0; k < 10; k++)
		{
			cortos_printf("Output k = %u, val(in Decimal)=%u, val(in Hex)=%x at address %x\n",k,*output_cur_addr,*output_cur_addr,output_cur_addr);
			*input_cur_addr = *output_cur_addr;
			output_cur_addr++;
			input_cur_addr++;

		}


		// }

		// -----------------------------
		// -- 8 Send processed image out
		// -----------------------------
		// uint32_t op_array[1] = {224*224*3+24};

		// -------------------------------------------------------------
		// Uncomment Below
		uint32_t op_array[1] = {1600+24};

		writeNicReg(0,1); 			//NIC_REG[0] = 1;
		//--------------------------------------------------------------------------

		sendFilesThroughEthernet(&nicQueue,input_start_addr,op_array,1);
	}
	// while(1);
	return(0);
}


