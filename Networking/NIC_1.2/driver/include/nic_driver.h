/*
#ifndef NIC_DRIVER_H___
#define NIC_DRIVER_H___
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

// Buffer parameters
#define NUMBER_OF_BUFFERS 4
#define BUFFER_SIZE_IN_BYTES 1500
#define NIC_START_ADDR 0xFF000000


#ifdef USE_CORTOS

// Following stuff is used with lwip and baremetal testing
// not useful while compiling testbench

#include <ajit_access_routines.h>
#include <ajit_mmap.h>
#include <cortos.h>

#endif

*/


//  Register definitions..  These must be consistent
//  with the parameters.aa file in the NIC AA source
#define    P_NIC_CONTROL_REGISTER_INDEX      0
#define    P_N_SERVERS_REGISTER_INDEX        1 
#define    P_DEBUG_REGISTER_0	             2 
#define    P_DEBUG_REGISTER_1	             3 
#define    P_N_BUFFERS_REGISTER_INDEX        4  
#define    P_MAC_REGISTER_H_INDEX            208
#define    P_MAC_REGISTER_L_INDEX            209
#define    P_TX_PKT_COUNT_REGISTER_INDEX     210
#define    P_RX_PKT_COUNT_REGISTER_INDEX     211
#define    P_STATUS_REGISTER_INDEX           212

//  Base index for queue access
#define    P_RX_QUEUE_0_INDEX		     8 
#define    P_RX_QUEUE_0_STATUS_INDEX	     9 
#define    P_RX_QUEUE_1_INDEX		     10 
#define    P_RX_QUEUE_1_STATUS_INDEX	     11 
#define    P_RX_QUEUE_2_INDEX		     12 
#define    P_RX_QUEUE_2_STATUS_INDEX	     13 
#define    P_RX_QUEUE_3_INDEX		     14 
#define    P_RX_QUEUE_3_STATUS_INDEX	     15 

#define    P_TX_QUEUE_0_INDEX		     16 
#define    P_TX_QUEUE_0_STATUS_INDEX	     17 
#define    P_TX_QUEUE_1_INDEX		     18 
#define    P_TX_QUEUE_1_STATUS_INDEX	     19 
#define    P_TX_QUEUE_2_INDEX		     20 
#define    P_TX_QUEUE_2_STATUS_INDEX	     21 
#define    P_TX_QUEUE_3_INDEX		     22 
#define    P_TX_QUEUE_3_STATUS_INDEX	     23 

#define    P_FREE_QUEUE_INDEX		     24 
#define    P_FREE_QUEUE_STATUS_INDEX   	     25 
#define    P_FREE_QUEUE_LOCK_INDEX     	     26 

// flags.
#define    F_ENABLE_NIC			     0x1
#define    F_ENABLE_NIC_INTERRUPT	     0x2

#define    FREEQUEUE				0
#define    RXQUEUE				1
#define    TXQUEUE				2

#define    NIC_MAX_NUMBER_OF_SERVERS		4


/*
typedef struct __NicConfiguration {
	uint32_t  nic_id;

	// < max number of servers = 4.
	uint32_t  number_of_servers_enabled;
} NicConfiguration;


uint32_t getGlobalNicRegisterBasePointer ();

// return 0 on success.
int setGlobalNicRegisterBasePointer(uint32_t ptr);


//
// There can be multiple NICs.   Each NIC will be
// given a physical address space of 256 registers
// for internal control.
//
void writeToNicReg (uint32_t nic_id, uint32_t reg_index, uint32_t reg_value);
uint32_t readFromNicReg (uint32_t nic_id, uint32_t reg_index);
uint32_t accessNicReg (uint8_t rwbar, uint32_t nic_id, uint32_t reg_index, uint32_t reg_value);


void     setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers_enabled);
uint32_t getNumberOfServersInNic (uint32_t nic_id);

void probeNic (uint32_t nic_id,
			uint32_t* tx_pkt_count,
			uint32_t* rx_pkt_count,
			uint32_t* status);

void writeNicControlRegister   (uint32_t nic_id, uint32_t enable_flags);

void configureNic (NicConfiguration* config);
void enableNic  (uint32_t nic_id, uint8_t enable_interrupt, uint8_t enable_mac, uint8_t enable_nic);
void disableNic (uint32_t nic_id);

// The following routine gives the PA for the specified VA
// returns 0 if translation is successful (*pa holds the return value)
int translateVaToPa (uint32_t va, uint64_t* pa);


// The following function gives actual packet length, used by LwIP: 
uint32_t getPacketLen(uint32_t* controlWord);
		
// Define the structure for the translation table entry

typedef struct {
    uint64_t pa;  // Physical address
    uint32_t* va;  // Virtual address
} TranslationEntry;

// Define the translation table with NUMBER_OF_BUFFER entries
TranslationEntry translationTable[NUMBER_OF_BUFFERS];

// For initialsing the translation Table 
void initTranslationTable(uint64_t,uint32_t*);

// Function to translate physical address to virtual address
uint32_t* translatePAtoVA(uint64_t pa);


uint32_t getPacketLenInDW(uint32_t lenInBytes);

uint32_t getLastTkeep(uint32_t lenInBytes);

*/

