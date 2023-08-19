// test the icache
//
#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>


#include <string.h>
#include "Pipes.h"
#include "pipeHandler.h"
#include "pthreadUtils.h"

// Includes for sized_tensor and convolution
#include "sized_tensor.h"
#include "convolution.h"

#define TEST_MEM_SIZE_IN_DWORDS  8
#define NUM_LAYERS 18

uint32_t myLog2(uint32_t X)
{
	if(X == 1)
		return(0);
	else if(X == 2)
		return(1);


	uint32_t R = myLog2(X/2)  + 1;
	return(R);
}

/*
// a bit of memory/
uint64_t mem_array[TEST_MEM_SIZE_IN_DWORDS];
		
void dumpMemory()
{
	fprintf(stderr,"Mem Dump.\n");
	uint32_t I;
	for(I = 0; I < TEST_MEM_SIZE_IN_DWORDS; I++)
	{
		fprintf(stderr," 0x%x 0x%llx \n", I, mem_array[I]);
	}
}

void init_memory ()
{
	int I;
	for(I = 0; I < TEST_MEM_SIZE_IN_DWORDS; I++)
		mem_array[I] = I;
}

void memoryDaemon ()
{
	while(1)
	{
		uint8_t write_bar = read_uint8("tester_mem_access_rwbar");

		// read but ignore for now..
		uint8_t byte_mask = read_uint8("tester_mem_access_bmask");

		uint32_t addr = read_uint32 ("tester_mem_access_address");
		uint64_t wdata = read_uint64 ("tester_mem_access_wdata");

		
		uint64_t rdata = 0;
		uint32_t I = (addr >> 3);
		rdata = mem_array[I];
		if(!write_bar)
		{
			mem_array[I] = wdata;
#ifdef DEBUG_PRINT
			fprintf(stderr,"memoryDaemon: mem[0x%x] = 0x%llx\n", I, wdata);
#endif
		}
		else
		{
			fprintf(stderr,"memoryDaemon: 0x%llx = mem[0x%x]\n", rdata, I);
		}

#ifdef DEBUG_PRINT
		fprintf(stderr,"memoryDaemon: 0x%x 0x%x 0x%llx 0x%llx\n",
					write_bar, addr, wdata, rdata);
#endif

		write_uint64 ("tester_mem_access_rdata", rdata);
	}
}
*/

//DEFINE_THREAD(memoryDaemon);


uint32_t accessAcceleratorRegisters (uint8_t write_bar,
					uint32_t reg_index,
					uint32_t reg_value)
{
	uint64_t cmd = write_bar;
	cmd = (cmd << 31) | reg_index;
	cmd = (cmd << 32) | reg_value;
	write_uint64 ("tester_control_command", cmd);
	uint32_t ret_val = read_uint32("tester_control_response");

#ifdef DEBUG_PRINT
	fprintf(stderr,"accessAcceleratorRegisters: 0x%x 0x%x 0x%x 0x%x\n",
					write_bar, reg_index, reg_value, ret_val);
#endif
	return(ret_val);
}

void execute_layer()
{
	accessAcceleratorRegisters (0,0, 0x7);
	// wait until interrupt is 0.
	while(1)
	{
		if(!read_uint8("ACCELERATOR_INTERRUPT_8"))
			break;
		else 
			usleep(1000);
	}

	// wait until interrupt is 1
	while(1)
	{
		if(read_uint8("ACCELERATOR_INTERRUPT_8"))
			break;
		else 
			usleep(1000);
	}
	//fprintf(stderr,"Post pass %d\n", I+1);
	//dumpMemory();
	// disable everything..
	accessAcceleratorRegisters (0,0, 0x0);
}

void set_convolution_layer (uint16_t rb, uint16_t cb, uint16_t rt, uint16_t ct, uint16_t chl_out, uint16_t chl_in, uint16_t rk, uint16_t ck, uint32_t addr_in1, uint32_t addr_in2, uint32_t addr_k, uint8_t addr_out, uint16_t shift_val,uint16_t pad, uint8_t pool, uint8_t activation);
{
	uint32_t word_to_send;
	word_to_send = (((uint32_t) rb) << 16) + cb;
	accessAcceleratorRegisters(0,1,word_to_send);
	word_to_send = (((uint32_t) rt) << 16) + ct;
	accessAcceleratorRegisters(0,2,word_to_send);
	word_to_send = (((uint32_t) chl_out) << 16) + chl_in;
	accessAcceleratorRegisters(0,3,word_to_send);
	word_to_send = (((uint32_t) rk) << 16) + ck;
	accessAcceleratorRegisters(0,4,word_to_send);
	word_to_send = (((uint32_t) shift_val) << 16) + pad;
	accessAcceleratorRegisters(0,5,word_to_send);
	word_to_send = (((uint16_t) pool) << 8) + act;
	accessAcceleratorRegisters(0,6,word_to_send);
	word_to_send = addr_in1;
	accessAcceleratorRegisters(0,7,word_to_send);
	word_to_send = addr_in2;
	accessAcceleratorRegisters(0,8,word_to_send);
	word_to_send = addr_out;
	accessAcceleratorRegisters(0,9,word_to_send);
	word_to_send = addr_k;
	accessAcceleratorRegisters(0,10,word_to_send);

int main(int argc, char **argv)
{
	int row_outs[NUM_LAYERS] = {224,224,112,112,56,56,28,28,56,56,56,112,112,112,224,224,224,224};
	int col_outs[NUM_LAYERS] = {224,224,112,112,56,56,28,28,56,56,56,112,112,112,224,224,224,224};
	int row_ins[NUM_LAYERS] = {224,224,112,112,56,56,28,28,28,56,56,56,112,112,112,224,224,224};
	int col_ins[NUM_LAYERS] = {224,224,112,112,56,56,28,28,28,56,56,56,112,112,112,224,224,224};
	int chl_outs[NUM_LAYERS] = {64,64,128,128,256,256,512,512,256,256,256,128,128,128,64,64,64,3};
	int chl_ins[NUM_LAYERS] = {3,64,64,128,128,256,256,512,512,512,256,256,256,128,128,128,64,3};
	int row_ks[NUM_LAYERS] = {3,3,3,3,3,3,3,3,2,3,3,2,3,3,2,3,3,3};
	int col_ks[NUM_LAYERS] = {3,3,3,3,3,3,3,3,2,3,3,2,3,3,2,3,3,3};
	int addr_in1s[NUM_LAYERS] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	int addr_in2s[NUM_LAYERS] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	int addr_outs[NUM_LAYERS] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	int addr_ks[NUM_LAYERS]= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	int shift_vals[NUM_LAYERS] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
       	int pads[NUM_LAYERS] = {1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1};
	int pools[NUM_LAYERS] = {0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0};
	int activations[NUM_LAYERS] = {relu,relu,relu,relu,relu,relu,relu,relu,relu,relu,relu,relu,relu,relu,relu,relu,relu,sigmoid};

	register_signal("ACCELERATOR_INTERRUPT_8",8);
	init_memory();

	// start mmu-daemon
	//PTHREAD_DECL(memoryDaemon);
	//PTHREAD_CREATE(memoryDaemon);

	//getFromEthernet();
	
	for (int i = 0; i < NUM_LAYERS; i++)
	{
		set_convolution_layer(
			row_outs[i], col_outs[i], row_ins[i], col_ins[i],
			chl_outs[i], chl_ins[i], row_ks[i], col_ks[i],
			addr_in1s[i], addr_in2s[i], addr_ks[i], add_outs[i],
			shift_vals[i], pads[i], pools[i], activations[i]
			);
		execute_layer();
		writeTime(i);
	}

		return(0);
}

