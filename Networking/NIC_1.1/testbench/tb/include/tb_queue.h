#ifndef tb_queue_h_______    
#define tb_queue_h_______    

#define QUEUE_SIZE_IN_MSGS       4
#define QUEUE_MSG_SIZE_IN_BYTES  8

uint32_t getField (uint32_t q_base_addr, uint32_t field);
void setField (uint32_t q_base_addr, uint32_t field, uint32_t val32);

uint32_t getReadPointer (uint32_t q_base_addr);
void setReadPointer (uint32_t q_base_addr, uint32_t val);

uint32_t getWritePointer (uint32_t q_base_addr);
uint32_t setWritePointer (uint32_t q_base_addr, uint32_t val);

uint32_t getNumberOfMessages (uint32_t q_base_addr);
uint32_t setNumberOfMessages (uint32_t q_base_addr, uint32_t val);

uint64_t getQueueEntry (uint32_t q_base_addr, uint32_t read_index);
void setQueueEntry (uint32_t q_base_addr, uint32_t write_index, uint64_t qval);

int popFromQueue  (uint64_t q_base_address, uint64_t* val);
int pushIntoQueue (uint64_t q_base_address, uint64_t val);

int acquireLock  (uint64_t q_base_address);
int releaseLock   (uint64_t q_base_address);

int debugPushIntoQueue (uint32_t queue_id, uint32_t server_id,  uint32_t val);
int debugPopFromQueue (uint32_t queue_id, uint32_t server_id, uint64_t* rval);

int checkQueues(int queue_id);
int checkQueuesInReverse (int queue_id);

#endif
