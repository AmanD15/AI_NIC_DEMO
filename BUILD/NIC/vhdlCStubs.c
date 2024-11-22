#include <vhdlCStubs.h>
void ReceiveEngineDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call ReceiveEngineDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
uint8_t accessMemoryLdStub(uint8_t tag,uint64_t byte_addr_base,uint64_t offset)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call accessMemoryLdStub ");
append_int(buffer,3); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,byte_addr_base); ADD_SPACE__(buffer);
append_uint64_t(buffer,offset); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,8); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
uint8_t rbyte = get_uint8_t(buffer,&ss);
return(rbyte);
}
void controlDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call controlDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
uint64_t getQueueElement(uint8_t tag,uint64_t buf_base_addr,uint32_t read_index)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call getQueueElement ");
append_int(buffer,3); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,buf_base_addr); ADD_SPACE__(buffer);
append_uint32_t(buffer,read_index); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,64); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
uint64_t q_r_data = get_uint64_t(buffer,&ss);
return(q_r_data);
}
uint32_t getQueueLength(uint8_t tag,uint64_t q_base_address)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call getQueueLength ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,q_base_address); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
uint32_t queue_length = get_uint32_t(buffer,&ss);
return(queue_length);
}
void getQueuePointers(uint8_t tag,uint64_t q_base_address,uint32_t* wp,uint32_t* rp)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call getQueuePointers ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,q_base_address); ADD_SPACE__(buffer);
append_int(buffer,2); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
*wp = get_uint32_t(buffer,&ss);
*rp = get_uint32_t(NULL,&ss);
return;
}
uint32_t getTotalMessages(uint8_t tag,uint64_t q_base_address)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call getTotalMessages ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,q_base_address); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
uint32_t total_msgs = get_uint32_t(buffer,&ss);
return(total_msgs);
}
void global_storage_initializer_()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call global_storage_initializer_ ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void incrementNumberOfPacketsReceived()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call incrementNumberOfPacketsReceived ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void incrementNumberOfPacketsTransmitted()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call incrementNumberOfPacketsTransmitted ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
uint32_t incrementRegister(uint8_t reg_index)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call incrementRegister ");
append_int(buffer,1); ADD_SPACE__(buffer);
append_uint8_t(buffer,reg_index); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,32); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
uint32_t incremented_value = get_uint32_t(buffer,&ss);
return(incremented_value);
}
void nicRxFromMacDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call nicRxFromMacDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void populateRxQueue(uint8_t tag,uint64_t rx_buffer_pointer)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call populateRxQueue ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,rx_buffer_pointer); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void queueTestDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call queueTestDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void releaseLock(uint8_t tag,uint64_t lock_address_pointer)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call releaseLock ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,lock_address_pointer); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void setGlobalSignals()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call setGlobalSignals ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void setQueueElement(uint8_t tag,uint64_t buf_base_address,uint32_t write_index,uint64_t q_w_data)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call setQueueElement ");
append_int(buffer,4); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,buf_base_address); ADD_SPACE__(buffer);
append_uint32_t(buffer,write_index); ADD_SPACE__(buffer);
append_uint64_t(buffer,q_w_data); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void setQueuePointers(uint8_t tag,uint64_t q_base_address,uint32_t wp,uint32_t rp)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call setQueuePointers ");
append_int(buffer,4); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,q_base_address); ADD_SPACE__(buffer);
append_uint32_t(buffer,wp); ADD_SPACE__(buffer);
append_uint32_t(buffer,rp); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void setTotalMessages(uint8_t tag,uint64_t q_base_address,uint32_t updated_total_msgs)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call setTotalMessages ");
append_int(buffer,3); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,q_base_address); ADD_SPACE__(buffer);
append_uint32_t(buffer,updated_total_msgs); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
void transmitEngineDaemon()
{
char buffer[4096];  char* ss;  sprintf(buffer, "call transmitEngineDaemon ");
append_int(buffer,0); ADD_SPACE__(buffer);
append_int(buffer,0); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
return;
}
uint16_t writeEthernetHeaderToMem(uint8_t tag,uint64_t buf_pointer)
{
char buffer[4096];  char* ss;  sprintf(buffer, "call writeEthernetHeaderToMem ");
append_int(buffer,2); ADD_SPACE__(buffer);
append_uint8_t(buffer,tag); ADD_SPACE__(buffer);
append_uint64_t(buffer,buf_pointer); ADD_SPACE__(buffer);
append_int(buffer,1); ADD_SPACE__(buffer);
append_int(buffer,16); ADD_SPACE__(buffer);
send_packet_and_wait_for_response(buffer,strlen(buffer)+1,"localhost",9999);
uint16_t addr_offset = get_uint16_t(buffer,&ss);
return(addr_offset);
}
