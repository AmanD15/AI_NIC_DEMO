#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>

#include <string.h>
#include "Pipes.h"
#include "pipeHandler.h"
#include "pthreadUtils.h"
#include "nic_driver.h"


uint64_t  mem_array [16*4096];

uint32_t accessNicReg (uint8_t rwbar, uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	uint64_t cmd = (nic_id << 48) | (rwbar << 40) | (reg_index << 32) | reg_value;
	write_uint64 ("tb_to_nic_slave_request", cmd);
	uint32_t retval = read_uint32 ("nic_slave_response_to_tb");
	return(retval);
}

void writeToNicReg (uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	accessNicReg (0, nic_id, reg_index, reg_value);	
}

uint32_t readFromNicReg (uint32_t nic_id, uint32_t reg_index)
{
	uint32_t retval = accessNicReg (1, nic_id, reg_index, 0);	
	return(retval);
}

void     setPhysicalAddressInNicRegPair (uint32_t nic_id, uint32_t reg_index, uint64_t pa)
{
	uint32_t hval = (pa >> 32) & 0xffffffff;
	uint32_t lval = pa & 0xffffffff;

	writeToNicReg (nic_id, reg_index, hva);
	writeToNicReg (nic_id, reg_index+1, hva);

}
uint64_t getPhysicalAddressInNicRegPair (uint32_t nic_id, uint32_t reg_index)
{
	uint32_t h = readFromNicReg (nic_id, reg_index);
	uint32_t l = readFromNicReg (nic_id, reg_index+1);

	uint64_t rval = h;
	rval = (rval << 64) | l;

	return(rval);
}

void     setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers)
{
	writeToNicReg (nic_id, P_NSERVERS_REGISTER_INDEX, number_of_servers);
}

uint32_t getNumberOfServersInNic (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_NSERVERS_REGISTER_INDEX));
}

void probeNic (uint32_t nic_id,
			uint32_t* tx_pkt_count,
			uint32_t* rx_pkt_count,
			uint32_t* status)
{
	*tx_pkt_count = readFromNicReg (nic_id, P_TX_PKT_COUNT_REGISTER_INDEX);
	*rx_pkt_count = readFromNicReg (nic_id, P_RX_PKT_COUNT_REGISTER_INDEX);
	*status       = readFromNicReg (nic_id, P_STATUS_REGISTER_INDEX);
}

void writeNicControlRegister   (uint32_t nic_id, uint32_t enable_flags)
{
	writeToNicReg (nic_id, P_NIC_CONTORL_REGISTER_INDEX, enable_flags);
}

void setNicQueuePhysicalAddresses (uint32_t nic_id, uint32_t server_id,
						uint32_t queue_type,  uint64_t queue_addr, 
						uint64_t queue_lock_addr, uint64_t queue_buffer_addr)
{
	uint32_t base_index = ((queue_type == FREEQUEUE) ? P_FREE_QUEUE_REGISTER_BASE_INDEX :
					((queue_type  == RXQUEUE) ?
							(P_RX_QUEUE_REGISTER_BASE_INDEX + (8*SERVER_ID)) :
							(P_TX_QUEUE_REGISTER_BASE_INDEX + (8*SERVER_ID)) ));
	setPhysicalAddressInNicRegPair (nic_id, base_index, queue_addr); 
	setPhysicalAddressInNicRegPair (nic_id, base_index+2, queue_lock_addr); 
	setPhysicalAddressInNicRegPair (nic_id, base_index+4, queue_buffer_addr); 
}

// set up the queues.
void setupQueues ();

// return 0 on success
int pushIntoQueue (uint64_t q_buf_base_address, uint32_t val);

// return 0 on success
int popFromQueue  (uint64_t q_buf_base_address, uint32_t* val);

void txDaemon ()
{
	// wait until MAC is enabled.
	
	// Spin, creating packets to send .
}

void rxDaemon ()
{
	// Spin absorbing packets from nic
}


int main(int argc, char* argv[])
{
	// Set up the rx queue, tx queue, and free queue
	
	// Set up the queues in the NIC
	
	// Enable NIC
}

