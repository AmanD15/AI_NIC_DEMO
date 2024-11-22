#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <Pipes.h>
#include <SocketLib.h>
void ReceiveEngineDaemon();
uint8_t accessMemoryLdStub(uint8_t tag,uint64_t byte_addr_base,uint64_t offset);
void controlDaemon();
uint64_t getQueueElement(uint8_t tag,uint64_t buf_base_addr,uint32_t read_index);
uint32_t getQueueLength(uint8_t tag,uint64_t q_base_address);
void getQueuePointers(uint8_t tag,uint64_t q_base_address,uint32_t* wp,uint32_t* rp);
uint32_t getTotalMessages(uint8_t tag,uint64_t q_base_address);
void global_storage_initializer_();
void incrementNumberOfPacketsReceived();
void incrementNumberOfPacketsTransmitted();
uint32_t incrementRegister(uint8_t reg_index);
void nicRxFromMacDaemon();
void populateRxQueue(uint8_t tag,uint64_t rx_buffer_pointer);
void queueTestDaemon();
void releaseLock(uint8_t tag,uint64_t lock_address_pointer);
void setGlobalSignals();
void setQueueElement(uint8_t tag,uint64_t buf_base_address,uint32_t write_index,uint64_t q_w_data);
void setQueuePointers(uint8_t tag,uint64_t q_base_address,uint32_t wp,uint32_t rp);
void setTotalMessages(uint8_t tag,uint64_t q_base_address,uint32_t updated_total_msgs);
void transmitEngineDaemon();
uint16_t writeEthernetHeaderToMem(uint8_t tag,uint64_t buf_pointer);
