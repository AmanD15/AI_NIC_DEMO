#ifndef tb_queue_h_______    
#define tb_queue_h_______    

// 512 MB, 64K dwords
#define MEMSIZE (16*4096)

// NIC settings
#define NSERVERS 1		// number of servers enabled (max = 4);	from server_id 0 to (max-1) 
#define NBUFFERS 4  		// number of buffer pointers in each queue (max 64 for current hardware)

// options to run different tests
//#define CHECK_QUEUES 		// Uncomment this line to test queue operations from processor side
//#define DEBUG_QUEUES 		// Uncomment this line to test queue operations from NIC side
//#define CHECK_QUEUE_SEQUENCE 	// Uncomment this line to mimic and test queue sequence from processor side
//#define DEBUG_QUEUE_SEQUENCE 	// Uncomment this line to mimic and test queue sequence from NIC side

// constants
#define NIC_ID 0
#define FQ_SERVER_ID 0
#define INITIAL_STATUS 0


void setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers_enabled);
uint32_t getNumberOfServersInNic (uint32_t nic_id);

void setStatusOfQueuesInNic (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t status_value);
uint32_t getStatusOfQueuesInNic (uint32_t nic_id, uint32_t server_id, uint32_t queue_type);

int acquireLock(uint32_t nic_id);
int releaseLock(uint32_t nic_id);

int pushIntoQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t push_value);
int popFromQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t* popped_value);

#ifdef CHECK_QUEUES
int checkQueues (uint32_t queue_type, uint32_t server_id);
#endif

int debugPushIntoQueue (uint32_t queue_type, uint32_t server_id, uint32_t val);
int debugPopFromQueue (uint32_t queue_type, uint32_t server_id, uint64_t* rval);

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

#endif
