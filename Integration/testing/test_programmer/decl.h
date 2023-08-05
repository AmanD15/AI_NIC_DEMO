#ifndef __decl_h
#define __decl_h

#include <stdio.h>
#include <stdint.h>
#include "core_portme.h"
#include "cortos.h"
#include "ajit_access_routines.h"

#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1000FFFF

#define ACCL_START_ADDR 0x10010000
#define ACCL_END_ADDR 0x1001FFFF


#define NUMBER_OF_BUFFERS 8
#define BUFFER_SIZE_IN_BYTES 1700 // 80
#define QUEUE_LENGTH 16 + 4 * NUMBER_OF_BUFFERS
#define FILE_BUF_SIZE 10100

#define ACC_UNUSED_ADDR 0x0000000
#define TWO_POWER_31 0x80000000

#define relu 1
#define sigmoid 0

uint32_t* NIC_REG = NIC_START_ADDR;
uint32_t* ACCL_REG = ACCL_START_ADDR;

typedef struct __NicQueue
{
	CortosQueueHeader *free_queue, *rx_queue, *tx_queue;
	//int x,y;
} NicQueue;

uint32_t readNicReg(uint32_t);
void writeNicReg(uint32_t, uint32_t);
uint32_t readACCLReg(uint32_t);
void writeACCLReg(uint32_t, uint32_t);

void storeFile(int* start, uint32_t* file_buf, uint32_t* packet, int* last_written_index_addr);
int sendFile(uint32_t* file_buf, CortosQueueHeader* free_queue, CortosQueueHeader* tx_queue, uint32_t size);

uint32_t accessAcceleratorRegisters (uint8_t write_bar, uint32_t reg_index, uint32_t reg_value);

void execute_layer();

void execute_convolution_layer (uint16_t rb, uint16_t cb, uint16_t rt, uint16_t ct, uint16_t chl_out, uint16_t chl_in, uint16_t rk, uint16_t ck, uint32_t addr_in1, uint32_t addr_in2, uint32_t addr_k, uint32_t addr_out1, uint32_t addr_out2, uint32_t scale_val, uint16_t shift_val, uint16_t pad, uint8_t pool, uint8_t activation, NicQueue *nQ);

void process_image(uint32_t** k_addr, uint32_t** t_addr, NicQueue *nQ);

uint32_t initialiseSpace(uint32_t**start_addr,uint32_t size[],uint32_t num_buffers, uint8_t mode);
void readNicRegs();
void printBuffer(uint32_t* buffer, int buf_size);

void getConfigData(uint64_t* file_start_ptr, CortosQueueHeader* free_queue,CortosQueueHeader *rx_queue, CortosQueueHeader *tx_queue,int* lwi);
uint32_t getFilesThroughEthernet(NicQueue*nicQueue, uint32_t **mem_start_addr,uint32_t num_files);
uint32_t sendFilesThroughEthernet(NicQueue*nicQueue, uint32_t **mem_start_addr, uint32_t size_array[], uint32_t num_files);

#endif
