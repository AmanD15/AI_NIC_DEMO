// Configs the Registers, Creates Free Buffers, swaps MAC addresses and pushes to the Queues

void readNicReg(void);

void cpu_model()
{
	fprintf(stderr, "CPU_THREAD : started \n");
	// Initialise Free, Rx and Tx Queues

	// for march test on nic regs.	
	//writeNicReg();
	//readNicReg();

	readNicReg();
	initQueue(FREE_QUEUE, 8, 4);
	initQueue(RX_QUEUE, 8,4);
	initQueue(TX_QUEUE, 8,4);

	(DEBUG == 0) && fprintf(stderr, "CPU_THREAD : Init queue done. \n");
	

	// Push Buffer Pointers to Free Queue for access by NIC
	push(FREE_QUEUE , (BUF_0<<4));
	push(FREE_QUEUE , (BUF_1<<4));
	push(FREE_QUEUE , (BUF_2<<4));
	int ret_val = push(FREE_QUEUE , (BUF_3<<4));
	(DEBUG == 0) && fprintf(stderr, "CPU_THREAD : pushed buffers to free queue last_ret_val = %d\n",ret_val);
	// Config NIC Registers
	(DEBUG == 0) && fprintf(stderr, "CPU_THREAD : configuring NIC registers\n");
	
	register_config (RX_QUEUE, TX_QUEUE, FREE_QUEUE);


	//fprintf(stderr,"reading mac_enable\n");
	//uint8_t mac_enable = 0;
	//while(mac_enable == 0)
	//{
	//	mac_enable= read_uint8("mac_test_data");
	//	fprintf(stderr,"mac_enable = %d\n",mac_enable);
	//}
	//MAC_ENABLE = mac_enable;	
	uint32_t buffer_with_packet = 0;

	while(1)
	{

		// If Rx Queue has data then pop and push to Tx Queue 
		//	(For now not swapping Addresses to reduce 
		//		complexity since we are just simulating 
		//		to check the NIC functionality)
		//readNicReg();
		if(pop (RX_QUEUE, &buffer_with_packet)){
			(DEBUG == 1) && fprintf(stderr, "CPU_THREAD : Got RX_Q = %lx and buffer_with_packet = %lx pointer sending it to TX_Q\n", RX_QUEUE, buffer_with_packet);	
			push(TX_QUEUE, buffer_with_packet);
		}
		// If no data, then sleep for 5 seconds and try again
		else{

			fprintf(stderr, "CPU_THREAD : Sleeping\n");	
			//sleep(1);	
			int k;
			for(k = 0 ; k < 250000000; k++);
			//readNicReg();
		}
	}
}
