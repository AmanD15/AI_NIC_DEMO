#include "decl.h"

uint32_t* NIC_REG = NIC_START_ADDR;
uint32_t *ACCL_REG[NUM_ENGINES]= {ACCL1_START_ADDR,ACCL2_START_ADDR,ACCL3_START_ADDR,ACCL4_START_ADDR};

void generateNicQueue(NicQueue* nicQueue, uint32_t msgSizeInBytes,uint32_t length)
{
	nicQueue->free_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	nicQueue->rx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
	nicQueue->tx_queue = cortos_reserveQueue(msgSizeInBytes, length, 1);
}

void nicRegConfig(NicQueue *nQ)
{
	writeNicReg(1,1);			//NIC_REG[1] = 1;//NUMBER_OF_SERVERS;
	writeNicReg(2,(uint32_t)nQ->rx_queue);	//NIC_REG[2] = Rx_Queue;
	writeNicReg(10,(uint32_t)nQ->tx_queue);	//NIC_REG[10] = Tx_Queue;
	writeNicReg(18,(uint32_t)nQ->free_queue);	//NIC_REG[18] = Free_Queue;
	// start NIC
	writeNicReg(0,1); 			//NIC_REG[0] = 1;
}

// 1 : Reads buffer pointer from rx_queue 
// 2 : if(start) write payload to control data_addr
// 	eles	write payload to updated address
// 3 : Pushes buffer pointer back to free_queue
// 4 : if(finished) end
// 	else	goto 1

uint32_t readNicReg(uint32_t index)
{
	uint32_t data;
	data = __ajit_load_word_from_physical_address__(&NIC_REG[index]);
	return data;
}
void writeNicReg(uint32_t index, uint32_t value)
{
	__ajit_store_word_to_physical_address__(value,&NIC_REG[index]);
}

uint32_t readACCLReg(uint8_t engine, uint32_t index)
{
	uint32_t data;
	data = __ajit_load_word_from_physical_address__(&ACCL_REG[engine][index]);
	cortos_printf("Read %u from accelerator engine %u in register %u from address 0x%x \n",data,engine,index,&ACCL_REG[engine][index]);
	return data;
}

void writeACCLReg(uint8_t engine, uint32_t index, uint32_t value)
{
	__ajit_store_word_to_physical_address__(value,&ACCL_REG[engine][index]);
	cortos_printf("Writen %u to accelerator engine %u in register %u to address 0x%x \n",value,engine,index,&ACCL_REG[engine][index]);
}

uint32_t accessAcceleratorRegisters (uint8_t engine, uint8_t write_bar,
					uint32_t reg_index,
					uint32_t reg_value)
{
	uint32_t ret_val = 0;
	if (write_bar)
		ret_val = readACCLReg(engine, reg_index);
	else
		writeACCLReg(engine, reg_index,reg_value);
	

	return(ret_val);
}

uint8_t  poll_on_accelerator(uint8_t engine, uint32_t us)
{	
	uint32_t read_val = accessAcceleratorRegisters(engine,1,0,0);
	if ((read_val & 16) == 0)
	{
		uint64_t time = cortos_get_clock_time();
		// Wait for us microseconds
		uint64_t new_time = time + CLK_FREQ_IN_MHZ*us;
		while (new_time > time) time = cortos_get_clock_time();
		read_val = accessAcceleratorRegisters(engine,1,0,0);
	}
	return ((read_val & 16) != 0);
}

void execute_layer(uint8_t engine)
{

	accessAcceleratorRegisters (engine, 0,0, 0x7);

	// Polling code
	uint32_t read_val = accessAcceleratorRegisters(engine,1,0,0);
	uint32_t time_low,time_high;
	//cortos_printf("Reg 0 has %u\n",read_val);
	while ((read_val & 16) == 0)
	{
		uint32_t old = read_val;
		read_val = accessAcceleratorRegisters(engine,1,0,0);
		uint32_t r16 = accessAcceleratorRegisters(engine,1,15,0);
		uint64_t time = cortos_get_clock_time();
		time_low = time&0xFFFFFFFF;
		time_high = time>>32;
		// Wait for 10us before checking again
		uint64_t new_time = time + 1000;
		while (new_time > time) time = cortos_get_clock_time();
	}
	//cortos_printf("Received a layer\n");

	// disable everything..
	accessAcceleratorRegisters (engine,0,0, 0x0);
	
	//uint64_t time_at_exit = cortos_get_clock_time();
	//time_high = time_at_exit>>32;
	//time_low = time_at_exit&0xFFFFFFFF;
	//cortos_printf("Time taken = %u %u\n",time_high,time_low);
}

void disable_accelerator(uint8_t engine)
{
	accessAcceleratorRegisters (engine,0,0, 0x0);
}

// void execute_convolution_layer (uint8_t engine, uint16_t rb, uint16_t cb, uint16_t rt, uint16_t ct, uint16_t chl_out, uint16_t chl_in, uint16_t rk, uint16_t ck, uint32_t addr_in1, uint32_t addr_in2, uint32_t addr_k, uint32_t addr_out1, uint32_t addr_out2, uint32_t scale_val, uint16_t shift_val, uint16_t pad, uint8_t pool, uint8_t concat, uint8_t activation, NicQueue *nQ)
// {
// 	uint32_t word_to_send;
// 	//cortos_printf("Accessed Accelerator Registers\n");
// 	word_to_send = (((uint32_t) rb) << 16) + cb;
// 	accessAcceleratorRegisters(engine,0,1,word_to_send);
// 	word_to_send = (((uint32_t) rt) << 16) + ct;
// 	accessAcceleratorRegisters(engine,0,2,word_to_send);
// 	word_to_send = (((uint32_t) chl_out) << 16) + chl_in;
// 	accessAcceleratorRegisters(engine,0,3,word_to_send);
// 	word_to_send = (((uint32_t) rk) << 16) + ck;
// 	accessAcceleratorRegisters(engine,0,4,word_to_send);
// 	word_to_send = (((uint32_t) shift_val) << 16) + pad;
// 	accessAcceleratorRegisters(engine,0,5,word_to_send);
// 	word_to_send = (((uint32_t) concat) << 16) + (((uint16_t) pool) << 8) + activation;
// 	accessAcceleratorRegisters(engine,0,6,word_to_send);
// 	word_to_send = addr_in1;
// 	accessAcceleratorRegisters(engine,0,7,word_to_send);
// 	word_to_send = addr_in2;
// 	accessAcceleratorRegisters(engine,0,8,word_to_send);
// 	word_to_send = addr_out1;
// 	accessAcceleratorRegisters(engine,0,9,word_to_send);
// 	word_to_send = addr_out2;
// 	accessAcceleratorRegisters(engine,0,10,word_to_send);
// 	word_to_send = addr_k;
// 	accessAcceleratorRegisters(engine,0,11,word_to_send);
// 	word_to_send = scale_val;
// 	accessAcceleratorRegisters(engine,0,12,word_to_send);

// 	//Start execution
// 	accessAcceleratorRegisters (engine, 0,0, 0x7);
	
// 	cortos_printf("Programmed a layer\n");

// }

void execute_convolution_layer (uint8_t engine, uint32_t input_start_addr, uint32_t output_start_addr, uint32_t outGrpNo, 
	uint32_t outMask, uint16_t in_rows, uint16_t in_cols, uint16_t in_chns, uint16_t in_grps, uint32_t ker_size, 
	uint32_t util_start_addr, uint16_t out_chns, uint16_t out_chn_ind, uint32_t ker_start_addr, uint8_t isLastStage, 
	uint8_t padReq, uint8_t poolReq, uint8_t isLinear, uint8_t isActivation,uint8_t isFlatten,uint32_t debug, NicQueue *nQ)
{
	uint32_t word_to_send;
	//cortos_printf("Accessed Accelerator Registers\n");

	// Inp Start Address
	word_to_send = (uint32_t)input_start_addr;
	accessAcceleratorRegisters(engine,0,1,word_to_send);

	// Output Start Address
	word_to_send = (uint32_t)output_start_addr;
	accessAcceleratorRegisters(engine,0,2,word_to_send);

	// Output Group Number
	word_to_send = (uint32_t) outGrpNo;
	accessAcceleratorRegisters(engine,0,3,word_to_send);

	// Output Byte Mask
	word_to_send = (uint32_t)outMask;
	accessAcceleratorRegisters(engine,0,4,word_to_send);

	// Input Rows - Input Columns
	word_to_send = (uint32_t)((in_rows << 16) + in_cols);
	accessAcceleratorRegisters(engine,0,5,word_to_send);

	// Input Channels - Input Groups
	word_to_send = (uint32_t)((in_chns << 16) + in_grps);
	accessAcceleratorRegisters(engine,0,6,word_to_send);

	// Kernel Size 
	word_to_send = (uint32_t) ker_size;
	accessAcceleratorRegisters(engine,0,7,word_to_send);

	// Pool Stride - Pool Kernel Size
	word_to_send = (uint32_t) ((2<<16)+2);
	accessAcceleratorRegisters(engine,0,8,word_to_send);

	// Scale and zero point values
	word_to_send = (uint32_t)util_start_addr;
	accessAcceleratorRegisters(engine,0,9,word_to_send);

	
	word_to_send = (uint32_t) ((isLastStage<<5)   +  (padReq<<4) + (poolReq<<3)  +  (isLinear<<2)  +  (isActivation<<1)    +       isFlatten);
	accessAcceleratorRegisters(engine,0,10,word_to_send);

	// Out Channels - Output Channel Index
	word_to_send = (uint32_t) ((out_chns<<16)+out_chn_ind);
	accessAcceleratorRegisters(engine,0,11,word_to_send);

	// Kernel Start Address
	word_to_send = (uint32_t) (ker_start_addr);
	accessAcceleratorRegisters(engine,0,12,word_to_send);

	// debug mode
	word_to_send = (uint32_t) (debug);
	accessAcceleratorRegisters(engine,0,13,word_to_send);

	//Start execution
	accessAcceleratorRegisters (engine, 0,0, 0x7);
	
	cortos_printf("Programmed a layer\n");

}
void process_image(uint8_t engine, uint32_t** k_addr, uint32_t** in_addr,uint32_t** output_addr, float* util_addr, NicQueue *nQ,uint32_t stage)
{
	int ker_no = 0;
	int grp_no = 0;
	int output_channel_index = 0;
	uint8_t *ker_cur_addr;
	uint8_t *inp_cur_addr;
	uint8_t *out_cur_addr;

	switch(stage){
	
	case 1:
	//Stage 1
	
	ker_cur_addr = (uint8_t*)k_addr[0];
	inp_cur_addr = (uint8_t*)in_addr[0];
	out_cur_addr = (uint8_t*)output_addr[0];
	for(ker_no = 0; ker_no<6; ker_no++){
		if( ((ker_no % 8) == 0) && (ker_no != 0) ) grp_no++;
		output_channel_index = ker_no % 8;

		execute_convolution_layer(engine,(uint32_t)inp_cur_addr,(uint32_t)out_cur_addr,(uint32_t)grp_no,255,28,28,8,
								   1,5,(uint32_t)util_addr, 8, (uint16_t)output_channel_index,(uint32_t)ker_cur_addr,
								   0,0,1,0,1,0,(uint32_t)0,nQ);
		ker_cur_addr = ker_cur_addr + 200;
		//    Update the ker_cur_address
	}
	// execute_convolution_layer(engine,224,224,224,224,64,3,3,3,(uint32_t)t_addr[0],ACC_UNUSED_ADDR,(uint32_t)k_addr[0],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,1,0,0,relu,nQ);
	break;

	case 2:
	//Stage 2

	// ker_cur_addr = &k_addr[1];
	ker_cur_addr = (uint8_t*)k_addr[1];
	inp_cur_addr = (uint8_t*)in_addr[0];
	out_cur_addr = (uint8_t*)output_addr[0];
	for(ker_no = 0; ker_no<16; ker_no++){
		if( ((ker_no % 8) == 0) && (ker_no != 0) ) grp_no++;
		output_channel_index = ker_no % 8;

		execute_convolution_layer(engine,(uint32_t)inp_cur_addr,(uint32_t)out_cur_addr,(uint32_t)grp_no,255,12,12,8,
								   1,5,(uint32_t)util_addr, 16, (uint16_t)output_channel_index,(uint32_t)ker_cur_addr,
								   0,0,1,0,1,1,(uint32_t)0,nQ);
		//    Update the ker_cur_address
		ker_cur_addr = ker_cur_addr + 200;
	}
	break;

	case 3:
	//Stage 3

	// ker_cur_addr = &k_addr[2];
	ker_cur_addr = (uint8_t*)k_addr[2];
	inp_cur_addr = (uint8_t*)in_addr[0];
	out_cur_addr = (uint8_t*)output_addr[0];
	// for(ker_no = 0; ker_no<256; ker_no++){
	// 	if((ker_no % 8) == 0) grp_no++;

	execute_convolution_layer(engine,(uint32_t)inp_cur_addr,(uint32_t)out_cur_addr,(uint32_t)grp_no,255,256,1,256,
								32,5,(uint32_t)util_addr, 120, (uint16_t)ker_no,(uint32_t)ker_cur_addr,
								0,0,0,1,1,0,(uint32_t)1,nQ);
		//    Update the ker_cur_address
	// }
	break;

	case 4:
	//Stage 4

	// ker_cur_addr = &k_addr[3];
	ker_cur_addr = (uint8_t*)k_addr[3];
	inp_cur_addr = (uint8_t*)in_addr[0];
	out_cur_addr = (uint8_t*)output_addr[0];
	// for(ker_no = 0; ker_no<120; ker_no++){
	// 	if((ker_no % 8) == 0) grp_no++;

	execute_convolution_layer(engine,(uint32_t)inp_cur_addr,(uint32_t)out_cur_addr,(uint32_t)grp_no,255,120,1,120,
								15,5,(uint32_t)util_addr, 84, (uint16_t)ker_no,(uint32_t)ker_cur_addr,
								0,0,0,1,1,0,(uint32_t)0,nQ);
		//    Update the ker_cur_address
	// }
	break;
	case 5:
	//Stage 5

	// ker_cur_addr = &k_addr[4];
	ker_cur_addr = (uint8_t*)k_addr[4];
	inp_cur_addr = (uint8_t*)in_addr[0];
	out_cur_addr = (uint8_t*)output_addr[0];
	// for(ker_no = 0; ker_no<84; ker_no++){
	// 	if((ker_no % 8) == 0) grp_no++;

	execute_convolution_layer(engine,(uint32_t)inp_cur_addr,(uint32_t)out_cur_addr,(uint32_t)grp_no,255,84,1,84,
								11,5,(uint32_t)util_addr, 10, (uint16_t)ker_no,(uint32_t)ker_cur_addr,
								1,0,0,1,1,0,(uint32_t)0,nQ);
		//    Update the ker_cur_address
	// }
	break;

	default:
	cortos_printf("Check Process Image stage number\n");
	break;
	
	}
}

// void process_image(uint8_t engine, uint32_t** k_addr, uint32_t** t_addr, NicQueue *nQ,uint32_t stage)
// {
// 	switch(stage){
// 	default:
// 	case 1:
// 	//Stage 1
// 	execute_convolution_layer(engine,224,224,224,224,64,3,3,3,(uint32_t)t_addr[0],ACC_UNUSED_ADDR,(uint32_t)k_addr[0],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,1,0,0,relu,nQ);
// 	break;
// 	case 2:
// 	//Stage 2
// 	execute_convolution_layer(engine,224,224,224,224,64,64,3,3,(uint32_t)t_addr[1],ACC_UNUSED_ADDR,(uint32_t)k_addr[1],(uint32_t)t_addr[2],(uint32_t)t_addr[0],1,0,1,3,0,relu,nQ);
// 	break;
// 	case 3:
// 	//Stage 3
// 	execute_convolution_layer(engine,112,112,112,112,128,64,3,3,(uint32_t)t_addr[0],ACC_UNUSED_ADDR,(uint32_t)k_addr[2],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,1,0,0,relu,nQ);
// 	break;
// 	case 4:
// 	//Stage 4
// 	execute_convolution_layer(engine,112,112,112,112,128,128,3,3,(uint32_t)t_addr[1],ACC_UNUSED_ADDR,(uint32_t)k_addr[3],(uint32_t)t_addr[3],(uint32_t)t_addr[0],1,0,1,3,0,relu,nQ);	
// 	break;
// 	case 5:
// 	//Stage 5
// 	execute_convolution_layer(engine,56,56,56,56,256,128,3,3,(uint32_t)t_addr[0],ACC_UNUSED_ADDR,(uint32_t)k_addr[4],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,1,0,0,relu,nQ);
// 	break;
// 	case 6:
// 	//Stage 6
// 	execute_convolution_layer(engine,56,56,56,56,256,256,3,3,(uint32_t)t_addr[1],ACC_UNUSED_ADDR,(uint32_t)k_addr[5],(uint32_t)t_addr[4],(uint32_t)t_addr[0],1,0,1,3,0,relu,nQ);
// 	break;
// 	case 7:
// 	//Stage 7
// 	execute_convolution_layer(engine,28,28,28,28,512,256,3,3,(uint32_t)t_addr[0],ACC_UNUSED_ADDR,(uint32_t)k_addr[6],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,1,0,0,relu,nQ);
// 	break;
// 	case 8:
// 	//Stage 8
// 	execute_convolution_layer(engine,28,28,28,28,512,512,3,3,(uint32_t)t_addr[1],ACC_UNUSED_ADDR,(uint32_t)k_addr[7],(uint32_t)t_addr[0],ACC_UNUSED_ADDR,1,0,1,0,0,relu,nQ);
// 	break;
// 	case 9:
// 	//Stage 9
// 	execute_convolution_layer(engine,56,56,28,28,256,512,2,2,(uint32_t)t_addr[0],ACC_UNUSED_ADDR,(uint32_t)k_addr[8],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,0,0,0,relu,nQ);
// 	break;
// 	case 10:
// 	//Stage 10
// 	execute_convolution_layer(engine,56,56,56,56,256,512,3,3,(uint32_t)t_addr[1],(uint32_t)t_addr[4],(uint32_t)k_addr[9],(uint32_t)t_addr[0],ACC_UNUSED_ADDR,1,0,1,0,1,relu,nQ);
// 	break;
// 	case 11:
// 	//Stage 11
// 	execute_convolution_layer(engine,56,56,56,56,256,256,3,3,(uint32_t)t_addr[0],ACC_UNUSED_ADDR,(uint32_t)k_addr[10],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,1,0,0,relu,nQ);
// 	break;
// 	case 12:
// 	//Stage 12
// 	execute_convolution_layer(engine,112,112,56,56,128,256,2,2,(uint32_t)t_addr[1],ACC_UNUSED_ADDR,(uint32_t)k_addr[11],(uint32_t)t_addr[0],ACC_UNUSED_ADDR,1,0,0,0,0,relu,nQ);
// 	break;
// 	case 13:
// 	//Stage 13
// 	execute_convolution_layer(engine,112,112,112,112,128,256,3,3,(uint32_t)t_addr[0],(uint32_t)t_addr[3],(uint32_t)k_addr[12],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,1,0,1,relu,nQ);
// 	break;
// 	case 14:
// 	//Stage 14
// 	execute_convolution_layer(engine,112,112,112,112,128,128,3,3,(uint32_t)t_addr[1],ACC_UNUSED_ADDR,(uint32_t)k_addr[13],(uint32_t)t_addr[0],ACC_UNUSED_ADDR,1,0,1,0,0,relu,nQ);
// 	break;
// 	case 15:
// 	//Stage 15
// 	execute_convolution_layer(engine,224,224,112,112,64,128,2,2,(uint32_t)t_addr[0],ACC_UNUSED_ADDR,(uint32_t)k_addr[14],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,0,0,0,relu,nQ);
// 	break;
// 	case 16:
// 	//Stage 16
// 	execute_convolution_layer(engine,224,224,224,224,64,128,3,3,(uint32_t)t_addr[1],(uint32_t)t_addr[2],(uint32_t)k_addr[15],(uint32_t)t_addr[0],ACC_UNUSED_ADDR,1,0,1,0,1,relu,nQ);
// 	break;
// 	case 17:
// 	//Stage 17
// 	execute_convolution_layer(engine,224,224,224,224,64,64,3,3,(uint32_t)t_addr[0],ACC_UNUSED_ADDR,(uint32_t)k_addr[16],(uint32_t)t_addr[1],ACC_UNUSED_ADDR,1,0,1,0,0,relu,nQ);
// 	break;
// 	case 18:
// 	//Stage 18
// 	execute_convolution_layer(engine,224,224,224,224,3,64,3,3,(uint32_t)t_addr[1],ACC_UNUSED_ADDR,(uint32_t)k_addr[17],(uint32_t)t_addr[0],ACC_UNUSED_ADDR,1,0,1,0,0,sigmoid,nQ);
// 	break;
// 	}
// }

void payloadAddressFromNetworkAddress(uint32_t** payload_start, uint32_t** actual_start, uint32_t offset,uint32_t num_addr)
{
	uint32_t i;
	for (i = 0; i < num_addr; i++)
	{
		payload_start[i] = (uint32_t*)actual_start[i] + offset;
	}
}

void payloadAddressFromNetworkAddressFloat(float** payload_start, float** actual_start, uint32_t offset,uint32_t num_addr)
{
	uint32_t i;
	for (i = 0; i < num_addr; i++)
	{
		payload_start[i] = (uint32_t*)actual_start[i] + offset;
	}
}

void networkAddressFromPayloadAddress(uint32_t** payload_start, uint32_t** network_start, uint32_t offset, uint32_t num_addr)
{
	uint32_t i;
	for (i = 0; i < num_addr; i++)
	{
		network_start[i] = (uint32_t*)payload_start[i] - offset;
	}
}

void byteToDoubleWord(uint32_t*arr, uint32_t*ret_arr, uint32_t num_elements)
{
	uint32_t i;
	for (i = 0; i < num_elements; i++)
	{
		ret_arr[i] = ((uint32_t)arr[i])>>3;
	}
}

void byteToDoubleWordFloat(float*arr, float*ret_arr, uint32_t num_elements)
{
	uint32_t i;
	for (i = 0; i < num_elements; i++)
	{
		// ret_arr[i] = (arr[i])>>3;
		ret_arr[i] = (arr[i]);
	}
}

uint32_t initialiseSpace(uint32_t**start_addr,uint32_t size[],uint32_t num_buffers, uint8_t mode)
{
	uint32_t i,num_bytes;
	
	for(i = 0; i < num_buffers; i++)
	{
		num_bytes = mode ? size[i] : size[0];
		start_addr[i] = (uint32_t*)cortos_bget_ncram(num_bytes);
		if (start_addr[i] == 0) return i;
	}
	return num_buffers;
}

uint32_t initialiseSpaceFloat(float**start_addr,uint32_t size[],uint32_t num_buffers, uint8_t mode)
{
	uint32_t i,num_bytes;
	
	for(i = 0; i < num_buffers; i++)
	{
		num_bytes = mode ? size[i] : size[0];
		start_addr[i] = (float*)cortos_bget_ncram(num_bytes);
		if (start_addr[i] == 0) return i;
	}
	return num_buffers;
}

void readNicRegs()
{
	int i;
	for(i = 0; i < 64; i++)
	{
		
		CORTOS_DEBUG("NIC_REG[%d] = 0x%x\n",i,readNicReg(i));
	}
}

void printBuffer(uint32_t* buffer, int buf_size)
{
	int i;
	for(i = 0; i < buf_size/4; i+=2)
		cortos_printf("value at buffer addr[0x%lx] = 0x%lx%lx\n", (buffer+i), buffer[i], buffer[i+1]);	

}

void storeFile(int* start, uint32_t* file_buf, uint32_t* packet, int* last_written_index_addr)
{
	int file_buf_size;
	int packet_size;
	int index;
	packet_size = (int)(*(packet+1))>>8 & 0x7ff;
	if((*(packet + 8)>>25) & 0x1 == 1 )
	{
		*(file_buf + 1) = *(packet+1);
	}
	CORTOS_DEBUG("packet_size = %d\n", packet_size);
	if(*start == 1)
	{
		*(file_buf + 2) = *(packet+6); // eth hdr 0
		*(file_buf + 3) = *(packet+7); // eth hdr 0
		*(file_buf + 4) = *(packet+8); // eth hdr 1
		*(file_buf + 5) = *(packet+9); // eth hdr 1
		file_buf_size = 16;
		index  = 6;
		*start = 0;
	}
	else
		index = *last_written_index_addr + 1;

	int I;

	for(I = 10; I < packet_size/4; I+=2)
	{
		*(file_buf + index) = *(packet + I);
		*(file_buf + index + 1) = *(packet + I + 1);
		*last_written_index_addr = index + 1;
		index += 2;
		file_buf_size += 8; 
	}
	if((I-1)*4 != packet_size)
	{
		*(file_buf + index) = *(packet + I);
		*(file_buf + index + 1) = *(packet + I + 1);
		*last_written_index_addr = index + 1;
		file_buf_size += packet_size % 8;
	}

}


void getConfigData(uint64_t* file_start_ptr, CortosQueueHeader* free_queue,CortosQueueHeader *rx_queue, CortosQueueHeader *tx_queue,int* lwi)
{
	uint32_t* data[1];
	int i;
	//file_start_ptr = (uint64_t*)cortos_bget_ncram(FILE_BUF_SIZE);
	int start = 1,msg_written;
	while(1)
	{
		//CORTOS_DEBUG("rx_queue = 0x%lx\n", rx_queue);
		//CORTOS_DEBUG("free_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n", free_queue ->readIndex, free_queue -> writeIndex, free_queue -> totalMsgs);
		//CORTOS_DEBUG("rx_queue : \n\treadIndex = %d\n\twriteIndex = %d\n\ttotalmMsgs = %d\n\n", rx_queue ->readIndex, rx_queue -> writeIndex, rx_queue -> totalMsgs);
		//printBuffer((uint32_t*)rx_queue, 305);
		if(cortos_readMessages(rx_queue, (uint8_t*)data, 1))
		{
			CORTOS_DEBUG("Got RX packet\n");
			uint32_t* buf_addr = (uint32_t*)data[0];
			storeFile(&start, file_start_ptr, buf_addr, lwi);
			//CORTOS_DEBUG("rx queue pop data = 0x%lx\n",buf_addr);
			//printBuffer(buf_addr, BUFFER_SIZE_IN_BYTES);
			// ack
			*(buf_addr + 1) = 92 << 8;
			*(buf_addr + 8) |= (1 < 8);	
			while(1)
			{
				if(cortos_writeMessages(tx_queue, (uint8_t*)data, 1))
					break;
				else
					CORTOS_DEBUG("Unable to push to free queue.\n");
			}
			
			// no ack
			while(1)
			{
				if(cortos_writeMessages(free_queue, (uint8_t*)data, 1))
					break;
				else
					CORTOS_DEBUG("Unable to push to free queue.\n");
			}
					
			if((*(buf_addr + 8)>>25) & 0x1 == 1 )
                                break;
			else
				CORTOS_DEBUG("Not last packet of file\n");
		}
		else
		{
			int k = 0;
			for(k = 0; k < 2500000; k++);
			CORTOS_DEBUG("No packet found empty rx_queue\n");
		}
	}
	
}


int sendFile(uint32_t* file_buf, CortosQueueHeader* free_queue, CortosQueueHeader* tx_queue, uint32_t size)
{
	uint32_t size4 = size-4;
	uint32_t size_in_bytes = (size4 + 4);
	uint32_t payload_size_in_bytes = size4 - 20;
	uint32_t* data[1];
	//uint8_t tkeep[8] = {0x00,0x01,0x03,0x07,0x0f,0x1f,0x3f,0x7f};
	uint32_t byte0, byte1, byte2, byte3;
	uint16_t buf_size;
	uint8_t last_tkeep, tkeep;
	int msgs_written;
	int remaining_bytes = size_in_bytes & 7;

	buf_size = size4+12;
	last_tkeep = *(file_buf+1)&0xff; //tkeep[remaining_bytes];
	tkeep = 0xff;

	byte0 = *(file_buf + 2);
	byte1 = *(file_buf + 3);
	byte2 = *(file_buf + 4);
	byte3 = *(file_buf + 5);


	if(size_in_bytes > 1512)
	{
		int bytes_rem = payload_size_in_bytes;
		int i,j;
		int k;
		j = 6;	
		while(1)
		{
			buf_size = 0x5f8;
			while(1)
			{
				if(cortos_readMessages(free_queue, (uint8_t*)data, 1))
					break;
				else
					CORTOS_DEBUG("free_queue empty\n");
			}
			uint32_t* packet_buf_addr = (uint32_t *)data[0];
			*(packet_buf_addr + 1) = buf_size<<8 | tkeep; // control data
			*(packet_buf_addr + 6) = byte0;
			*(packet_buf_addr + 7) = byte1;
			*(packet_buf_addr + 8) = byte2 & ~(0x1 << 25);
			*(packet_buf_addr + 9) = byte3;
		
			for(i = 10, k = 0; k < 1496/4; j+=2 , i+=2, k = k+2)
			{
				*(packet_buf_addr+i) = *(file_buf + j);
				*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
			}
			//printBuffer(packet_buf_addr,1700);
			while(1)
			{
				if(cortos_writeMessages(tx_queue, (uint8_t*)data,1))
					break;
				else
					CORTOS_DEBUG("tx_queue full\n");
			}
			bytes_rem = bytes_rem - 1496;
			if(bytes_rem < 1496)
			{
				//CORTOS_DEBUG("last pkt");
				buf_size = bytes_rem + 32;
				while(1)
				{
					if(cortos_readMessages(free_queue, (uint8_t*)data, 1))
						break;
					else
						CORTOS_DEBUG("free_queue empty!\n");
				}
				uint32_t* packet_buf_addr = (uint32_t *)data[0];
				*(packet_buf_addr + 1) = buf_size<<8 | last_tkeep; // control data
	
				// header and EOF
				*(packet_buf_addr + 6) = byte0;
				*(packet_buf_addr + 7) = byte1;
				*(packet_buf_addr + 8) = byte2 | (1 << 25);
				*(packet_buf_addr + 9) = byte3;
				
				// payload
				for(i = 10,k = 0; k < bytes_rem/4; i+=2, j+=2, k+=2)
				{
					*(packet_buf_addr+i) = *(file_buf + j);
					*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
				}
				if(((k-1)*4) != bytes_rem)
				{	
					*(packet_buf_addr+i) = *(file_buf + j);
					*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
				}
				//CORTOS_DEBUG("*data = 0x%lx, pkt_buf_addr = 0x%lx\n", data[0],packet_buf_addr);
				while(1)
				{
					if(cortos_writeMessages(tx_queue, (uint8_t*)data, 1))
						break;
					else
						CORTOS_DEBUG("tx_queue full\n");
				}
				break;
			}
		}	
	}
	else
	{
		while(1)
		{
			if(cortos_readMessages(free_queue, (uint8_t*)data, 1))
				break;
			else
				CORTOS_DEBUG("free_queue empty!\n");
		}
		uint32_t* packet_buf_addr = (uint32_t *)data[0];
		*(packet_buf_addr + 1) = buf_size<<8 | last_tkeep; // control data
		
		// header and EOF
		*(packet_buf_addr + 6) = byte0;
		*(packet_buf_addr + 7) = byte1;
		*(packet_buf_addr + 8) = byte2;
		*(packet_buf_addr + 9) = byte3;
	
			
		int i,j;
		// payload
		for(i = 10, j = 6; j < size_in_bytes/4; i+=2, j+=2)
		{
			*(packet_buf_addr+i) = *(file_buf + j);
			*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
		}
		if(((i-1)*4) != size_in_bytes)
		{	
			*(packet_buf_addr+i) = *(file_buf + j);
			*(packet_buf_addr + i + 1) = *(file_buf + j + 1);
		}
		//printBuffer(packet_buf_addr,BUFFER_SIZE_IN_BYTES);
		//CORTOS_DEBUG("*data = 0x%lx, pkt_buf_addr = 0x%lx\n", data[0],packet_buf_addr);
		while(1)
		{
			if(cortos_writeMessages(tx_queue, (uint8_t*)data, 1))
				break;
			else
				CORTOS_DEBUG("tx_queue full!\n");
		}
	}
}



uint32_t getFilesThroughEthernet(NicQueue*nicQueue, uint32_t **mem_start_addr,uint32_t num_files)
{
	uint32_t i, lwi ;
	for (i = 0; i < num_files; i++)
	{
		getConfigData(mem_start_addr[i],nicQueue->free_queue,nicQueue->rx_queue,nicQueue->tx_queue,&lwi);
		cortos_printf("File %u received\n",i);
	}
	
	//for(i = 0; i < 64; i++)
	//{
	//	cortos_printf("free_queue[%d] = 0x%lx\n", i, *((uint32_t*)(nicQueue->free_queue+1) + i));
	//}
	return num_files;
}

uint32_t getFilesThroughEthernetFloat(NicQueue*nicQueue, float **mem_start_addr,uint32_t num_files)
{
	uint32_t i, lwi ;
	for (i = 0; i < num_files; i++)
	{
		getConfigData(mem_start_addr[i],nicQueue->free_queue,nicQueue->rx_queue,nicQueue->tx_queue,&lwi);
		cortos_printf("File %u received\n",i);
	}
	
	return num_files;
}

uint32_t sendFilesThroughEthernet(NicQueue*nicQueue, uint32_t **mem_start_addr, uint32_t size_array[], uint32_t num_files)
{
	uint32_t i;
	for (i = 0; i < num_files; i++)
	{
		// __ajit_serial_getchar__();
		sendFile(mem_start_addr[i],nicQueue->free_queue,nicQueue->tx_queue,size_array[i]);
		cortos_printf("File %u sent back\n",i);
	}
	return num_files;	
}
