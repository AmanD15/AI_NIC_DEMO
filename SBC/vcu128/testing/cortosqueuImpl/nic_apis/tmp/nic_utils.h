#ifndef NIC_UTILITIES_H
#define NIC_UTILITIES_H

#include "ajit_access_routines.h"
#include "core_portme.h"
#include <cortos.h>

/*
***********************************************************
  All functions are written considering signle NIC system
some may get modified for multiple NIC system. 
***********************************************************
*/


// NIC register start and end addresses
#define NIC_START_ADDR 0x10000000
#define NIC_END_ADDR   0x1FFFFFFF

// pointer to NIC regs
uint32_t* NIC_REG = NIC_START_ADDR;

// To read value stored in NIC registers
//    valid regIndex values are 0 - 64.
//    returns the value stored in register.
uint32_t readNicReg( uint32_t regIndex);

// To write value to NIC registers
void writeNicReg(uint32_t regIndex, uint32_t value);


// To initializre NIC registes
void nicRegInit(CortosQueueHeader* Free_Queue, CortosQueueHeader* Rx_Queue,CortosQueueHeader* Tx_Queue);

// to load Ethernet header
// 		eth_hdr should be array of length 4 and width 32.
//		ethernet header is written to eth_hdr array.
void loadEthernetHeader(uint32_t *buffer_addr, uint32_t *eth_hdr);


// to read control data of the buffer
//void readBufControlData(uint32_t *buffer_addr, uint16_t *packetSize, uint8_t *lastTkeep);

// to modify control data of the buffer
//void writeBufControlData(uint32_t *buffer_addr, uint16_t packetSize, uint8_t lastTkeep);


#endif
