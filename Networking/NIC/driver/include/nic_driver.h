#ifndef NIC_DRIVER_H___
#define NIC_DRIVER_H___

#ifdef USE_CORTOS
#include "cortos.h"
#endif

//  Register definitions..  These must be consistent
//  with the parameters.aa file in the NIC AA source
#define    P_NIC_CONTROL_REGISTER_INDEX      0
#define    P_N_SERVERS_REGISTER_INDEX        1 
#define    P_DEBUG_REGISTER_0	             2 
#define    P_DEBUG_REGISTER_1	             3 
#define    P_RX_QUEUE_REGISTER_BASE_INDEX    8
#define    P_TX_QUEUE_REGISTER_BASE_INDEX    128
#define    P_FREE_QUEUE_REGISTER_BASE_INDEX  200
#define    P_MAC_REGISTER_H_INDEX            208
#define    P_MAC_REGISTER_L_INDEX            209
#define    P_TX_PKT_COUNT_REGISTER_INDEX     210
#define    P_RX_PKT_COUNT_REGISTER_INDEX     211
#define    P_STATUS_REGISTER_INDEX           212

// flags.
#define    F_ENABLE_NIC			      0x1
#define    F_ENABLE_NIC_INTERRUPT	      0x2

#define    FREEQUEUE				0
#define    TXQUEUE				1
#define    RXQUEUE				2

#define    NIC_MAX_NUMBER_OF_SERVERS		8

// This should be allocated only from non-cacheable NCRAM.
typedef struct __NicPacketBuffer {

	// unused   buffer-size   pkt-length   last-dword-byte-mask
	// 	     in dwords	   in bytes
	// [63:32]   [31:20]        [19:8]           [7:0]
	// 
	uint64_t control_word;

	uint64_t ethernet_header_h;
	uint64_t ethernet_header_l;

	uint64_t* packet_data;

	// time-stamps.
	uint64_t nic_arrival_time_stamp;
	uint64_t nic_exit_time_stamp;
	
	uint64_t processor_arrival_time_stamp;
	uint64_t processor_exit_time_stamp;
	
} NicPacketBuffer;


#ifndef USE_CORTOS
// This is a mirror of the cortos-queue data
// structure.  Note that the lock and buffer
// addresses are virtual.   The physical addresses
// are kept separately in the NIC.
typedef struct __NicCortosQueue {
  uint32_t totalMsgs;     			 // + 0
  uint32_t readIndex;				 // + 4
  uint32_t writeIndex;				 // + 8 
  uint32_t length;				 // + 12 
  uint32_t msgSizeInBytes;			 // + 16   
  uint8_t *lock;	         		 // + 20		    
  uint8_t *bget_addr;               			 // + 24
   // if misc == 1, then assume single writer and single reader and don't use locks
   //    Use misc[31:24] to keep server id
   //    Use misc[23:16] to keep queue-type 
   //    misc[15:1] is unused.
   //    Use misc[0] to keep single writer/reader status.
  uint32_t misc;		                 // + 28
	
} NicCortosQueue;
#else
typedef CortosQueueHeader NicCortosQueue;
#endif

void initNicCortosQueue (NicCortosQueue* cqueue,
				uint32_t queue_capacity,
				uint32_t message_size_in_bytes,
				uint8_t* lock,
				uint8_t* bget_addr,
				uint32_t misc);


typedef struct __NicConfiguration {
	uint32_t  nic_id;

	// < max number of servers = 8.
	uint32_t  number_of_servers;
	
	// Physical addresses, all!
	//    need to be double-word aligned.
	uint64_t  free_queue_address;
	uint64_t  free_queue_lock_address; 
	uint64_t  free_queue_buffer_address; 

	uint64_t  rx_queue_addresses[NIC_MAX_NUMBER_OF_SERVERS];
	uint64_t  rx_queue_lock_addresses[NIC_MAX_NUMBER_OF_SERVERS];
	uint64_t  rx_queue_buffer_addresses[NIC_MAX_NUMBER_OF_SERVERS];

	uint64_t  tx_queue_addresses[NIC_MAX_NUMBER_OF_SERVERS];
	uint64_t  tx_queue_lock_addresses[NIC_MAX_NUMBER_OF_SERVERS];
	uint64_t  tx_queue_buffer_addresses[NIC_MAX_NUMBER_OF_SERVERS];

} NicConfiguration;


uint32_t getGlobalNicRegisterBasePointer ();

// return 0 on success.
int setGlobalNicRegisterBasePointer(uint32_t ptr);




//
// translate the queue related virtual addresses to physical, 
// by accessing the NIC registers (note that qptr->misc field is used
// by software in the translation).
//
uint64_t getQueuePhysicalAddressFromNic (NicCortosQueue* qptr);
uint64_t getQueueLockPhysicalAddressFromNic (NicCortosQueue* qptr);
uint64_t getQueueBufferPhysicalAddressFromNic (NicCortosQueue* qptr);

//
// There can be multiple NICs.   Each NIC will be
// given a physical address space of 256 registers
// for internal control.
//
void writeToNicReg (uint32_t nic_id, uint32_t reg_index, uint32_t reg_value);
uint32_t readFromNicReg (uint32_t nic_id, uint32_t reg_index);
uint32_t accessNicReg (uint8_t rwbar, uint32_t nic_id, uint32_t reg_index, uint32_t reg_value);

void     setPhysicalAddressInNicRegPair (uint32_t nic_id, uint32_t reg_index, uint64_t pa);
uint64_t getPhysicalAddressInNicRegPair (uint32_t nic_id, uint32_t reg_index);

void     setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers);
uint32_t getNumberOfServersInNic (uint32_t nic_id);

void probeNic (uint32_t nic_id,
			uint32_t* tx_pkt_count,
			uint32_t* rx_pkt_count,
			uint32_t* status);

void writeNicControlRegister   (uint32_t nic_id, uint32_t enable_flags);
void setNicQueuePhysicalAddresses (uint32_t nic_id, uint32_t server_id,
						uint32_t queue_type, uint64_t queue_addr, 
						uint64_t queue_lock_addr, uint64_t queue_buffer_addr);
void getNicQueuePhysicalAddresses (uint32_t nic_id, uint32_t server_id,
		uint32_t queue_type,  uint64_t *queue_addr, 
		uint64_t *queue_lock_addr, uint64_t *queue_buffer_addr);

void configureNic (NicConfiguration* config);
void enableNic  (uint32_t nic_id, uint8_t enable_interrupt, uint8_t enable_nic);
void disableNic (uint32_t nic_id);
		
#endif