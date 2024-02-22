#ifndef NIC_DRIVER_H___
#define NIC_DRIVER_H___

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

#define    F_ENABLE_NIC			      0x1
#define    F_ENABLE_NIC_INTERRUPT	      0x2

#define    FREEQUEUE				0
#define    TXQUEUE				1
#define    RXQUEUE				2

// This should be aligned to a quad-word.
typedef struct __NicPacketBuffer {

	// unused   buffer-size   pkt-length   last-dword-byte-mask
	// 	     in dwords	   in dwords
	// [63:32]   [31:20]        [19:8]           [7:0]
	// 
	uint64_t control_word;

	uint64_t ethernet_header_h;
	uint64_t ethernet_header_l;

	// max packet length = 2048 bits
	// room to spare.
	uint64_t packet_data [32];

	// time-stamps.
	uint64_t nic_arrival_time_stamp;
	uint64_t nic_exit_time_stamp;
	
	uint64_t processor_arrival_time_stamp;
	uint64_t processor_exit_time_stamp;
	
} NicPacketBuffer;


// This is a mirror of the cortos-queue data
// structure.  Note that the lock and buffer
// addresses are virtual.   The physical addresses
// are kept separately in the NIC.
typedef struct __NicCortosQueue {
  uint32_t totalMsgs;  
  uint32_t readIndex;				   
  uint32_t writeIndex;				   
  uint32_t length;				    
  uint32_t msgSizeInBytes;			    
  uint32_t lock_virtual_address;			    
  uint32_t buffer_virtual_address;
   // if misc == 1, then assume single writer and single reader and don't use locks
   //    Use misc[31:24] to keep server id
   //    Use misc[23:16] to keep queue-type 
   //    misc[15:1] is unused.
   //    Use misc[0] to keep single writer/reader status.
  uint32_t misc;		
	
} NicCortosQueue;

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
		
#endif
