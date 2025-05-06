#ifndef tb_queue_h_______    
#define tb_queue_h_______    

// 512 MB, 64K dwords
#define MEMSIZE (16*4096)

// NIC settings
#define NSERVERS 4		// number of servers enabled (max = 4);	from server_id 0 to (max-1) 
#define NBUFFERS 64  		// number of buffer pointers in each queue (max 64 for current hardware)


// options to run different tests

//#define CHECK_QUEUES 		// Uncomment this line to test queue operations from processor side
//#define DEBUG_QUEUES 		// Uncomment this line to test queue operations from NIC side
//#define CHECK_QUEUE_SEQUENCE 	// Uncomment this line to mimic and test queue sequence from processor side
//#define DEBUG_QUEUE_SEQUENCE 	// Uncomment this line to mimic and test queue sequence from NIC side

//#define CHECK_MEMORY_ACCESS	// Uncomment this line to test memory access from processor side
//#define DEBUG_MEMORY_ACCESS	// Uncomment this line to test memory access from NIC side

#define CHECK_NIC		// Uncomment this line to check complete NIC 
//#define MONITOR_NIC_REG	// Uncomment this line to print values of relevant NIC registers in-between


// constants
#define NIC_ID 			0
#define FQ_SERVER_ID 		0

#define ENABLE_NIC		1
#define ENABLE_MAC		1
#define ENABLE_NIC_INTERRUPT	0


//  Register definitions..  These must be consistent
//  with the parameters.aa file in the NIC AA source
#define    P_NIC_CONTROL_REGISTER_INDEX      0
#define    P_N_SERVERS_REGISTER_INDEX        1 
#define    P_DEBUG_REGISTER_0	             2 
#define    P_DEBUG_REGISTER_1	             3 
#define    P_N_BUFFERS_REGISTER_INDEX        4  
#define    P_MAC_REGISTER_H_INDEX            208
#define    P_MAC_REGISTER_L_INDEX            209
#define    P_RX_PKT_COUNT_REGISTER_INDEX     210
#define    P_TX_PKT_COUNT_REGISTER_INDEX     211
#define    P_STATUS_REGISTER_INDEX           212
#define    P_COUNTER_REGISTER_INDEX	     255

// Index for queue access
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


#define    FREEQUEUE	0
#define    RXQUEUE	1
#define    TXQUEUE	2


void setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers_enabled);
uint32_t getNumberOfServersInNic (uint32_t nic_id);

void setNumberOfBuffersInQueue (uint32_t nic_id, uint32_t number_of_buffers);
uint32_t getNumberOfBuffersInQueue (uint32_t nic_id);

uint32_t getStatusOfQueueInNic (uint32_t nic_id, uint32_t server_id, uint32_t queue_type);

int acquireLock(uint32_t nic_id);
int releaseLock(uint32_t nic_id);

int pushIntoQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t push_value);
int popFromQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t* popped_value);

#ifdef CHECK_QUEUES
int checkQueues (uint32_t queue_type, uint32_t server_id);
#endif

#if defined(DEBUG_QUEUES) || defined(DEBUG_QUEUE_SEQUENCE)
int debugPushIntoQueue (uint32_t queue_type, uint32_t server_id, uint32_t val);
int debugPopFromQueue (uint32_t queue_type, uint32_t server_id, uint64_t* rval);
#endif

#ifdef DEBUG_QUEUES
int debugQueues (uint32_t queue_type, uint32_t server_id);
int debugQueuesInReverse (uint32_t queue_type, uint32_t server_id);
#endif

#ifdef CHECK_QUEUE_SEQUENCE
int checkQueueSequence ();
#endif

#ifdef DEBUG_QUEUE_SEQUENCE
int debugQueueSequence ();
#endif

#ifdef CHECK_MEMORY_ACCESS
int checkMemoryAccess ();
#endif

#ifdef DEBUG_MEMORY_ACCESS
uint64_t nicAccessMemory (uint8_t lock,  uint8_t rwbar, uint8_t bmask, uint32_t addr, uint64_t wdata);
int debugMemoryAccess ();
int debugMemoryAccessInReverse ();
#endif

#endif
