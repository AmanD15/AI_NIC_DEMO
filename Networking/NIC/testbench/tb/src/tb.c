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
#include "tb_queue.h"


// 512 MB, 64K dwords
#define MEMSIZE (16*4096)
#define NBUFFERS 1  		// for debug purposes, keep it 1, later 4 or 8 or ....

int number_of_packets = 4;

uint64_t  mem_array [16*4096];
int 	  err_flag = 0;

uint32_t  free_queue_base_address = 0;      // includes 16-bytes for buffer.
uint32_t  rx_queue_base_address   = 256;    // includes 16-bytes for buffer.
uint32_t  tx_queue_base_address   = 512;    // includes 16-bytes for buffer.

uint32_t  free_queue_bget_address = 128;  
uint32_t  rx_queue_bget_address   = 256 + 128;    
uint32_t  tx_queue_bget_address   = 512 + 128;   


// four buffers for packets, each buffer has a capacity
// of 1024 bytes.
uint32_t  buffer_addresses[4]  = {1024,2048, 3072, 4096};

// lock addresses
uint32_t free_queue_lock_address = 4097;
uint32_t rx_queue_lock_address   = 4098;
uint32_t tx_queue_lock_address   = 4099;



uint32_t accessNicReg (uint8_t rwbar, uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	// command format
	// unused nic-id  unused  rwbar  index   value
	//   8      8        7      1       8     32
	uint64_t cmd = (((uint64_t) nic_id) << 48) | (((uint64_t) rwbar) << 40) | (((uint64_t) reg_index) << 32) | reg_value;
	write_uint64 ("tb_to_nic_slave_request", cmd);
	uint32_t retval = read_uint32 ("nic_slave_response_to_tb");

	fprintf(stderr,"Info: accessNicReg rwbar=%d, nic_id = %d, reg_index=%d, write+_reg_value=0x%x, read_reg_value=0x%x\n",
					rwbar, nic_id, reg_index, reg_value, retval);
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

	writeToNicReg (nic_id, reg_index, hval);
	writeToNicReg (nic_id, reg_index+1, lval);

}
uint64_t getPhysicalAddressInNicRegPair (uint32_t nic_id, uint32_t reg_index)
{
	uint32_t h = readFromNicReg (nic_id, reg_index);
	uint32_t l = readFromNicReg (nic_id, reg_index+1);

	uint64_t rval = h;
	rval = (rval << 32) | l;

	return(rval);
}

void     setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers)
{
	writeToNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX, number_of_servers);
}

uint32_t getNumberOfServersInNic (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX));
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
	writeToNicReg (nic_id, P_NIC_CONTROL_REGISTER_INDEX, enable_flags);
}

void setNicQueuePhysicalAddresses (uint32_t nic_id, uint32_t server_id,
		uint32_t queue_type,  uint64_t queue_addr, 
		uint64_t queue_lock_addr, uint64_t queue_buffer_addr)
{
	fprintf(stderr,"Info:  setNicQueuePhysicalAddresses nic_id=%d, server=%d, queue_type=%d, queue_addr=0x%x, queue_lock_addr=0x%x, queue_buffer_addr=0x%x\n",
				nic_id, server_id,
				queue_type,  queue_addr, 
				queue_lock_addr, queue_buffer_addr);

	uint32_t base_index = ((queue_type == FREEQUEUE) ? P_FREE_QUEUE_REGISTER_BASE_INDEX :
			((queue_type  == RXQUEUE) ?
			 (P_RX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)) :
			 (P_TX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)) ));
	setPhysicalAddressInNicRegPair (nic_id, base_index, queue_addr); 
	setPhysicalAddressInNicRegPair (nic_id, base_index+2, queue_lock_addr); 
	setPhysicalAddressInNicRegPair (nic_id, base_index+4, queue_buffer_addr); 
}



void packetTxDaemon () {
	int lengths[4] = {16, 32, 64, 128};
	int packet_index = 0;
	uint8_t current_byte = 0;
	while(1)
	{
		int length = lengths[packet_index % 4];
		while (length > 0)
		{
			uint16_t last = (length == 1);
			uint16_t tx_val = (last << 8) | current_byte;

			write_uint16 ("tb_to_nic_mac_bridge", tx_val);

			fprintf(stderr,"Info: packetTxDaemon: sent 0x%x %s\n", tx_val, last ? "last" : "");
			current_byte++;

			length--;
		}
		packet_index++;

		if(packet_index == number_of_packets)
		{
			fprintf(stderr,"packetTxDaemon: done.\n");
			break;
		}
	}
}
DEFINE_THREAD(packetTxDaemon);

void packetRxDaemon () {
	int lengths[4] = {32, 64, 128, 256};
	int packet_index = 0;
	uint8_t expected_current_byte = 0;
	while(1)
	{
		int length = lengths[packet_index % 4];
		int rx_byte_index = 0;
		while (length > 0)
		{
			uint16_t rx_val = read_uint16 ("nic_mac_bridge_to_tb");

			uint16_t last = (rx_val  >> 8) | 0x1;

			fprintf(stderr,"Info: packetRxDaemon: received 0x%x %s\n", rx_val, last ? "last" : "");
			uint16_t expected_rx_last = (length == 1);
			
			if(last != expected_rx_last)
			{
				fprintf(stderr,"Error: packet %d (length=%d), last mismatch at rx_byte_index=%d.\n", 
						packet_index, lengths[packet_index % 4], rx_byte_index);
				err_flag = 1;
			}

			uint8_t rx_byte = rx_val & 0xff;
			if(rx_byte != expected_current_byte)
			{
				fprintf(stderr,"Error: mismatched byte: expected = 0x%x, received = 0x%x, packet %d (length=%d), rx_byte_index=%d.\n", 
						expected_current_byte, rx_byte, packet_index, lengths[packet_index % 4], rx_byte_index);
				err_flag = 1;
			}


			expected_current_byte++;
			rx_byte_index++;

			length--;
		}
		packet_index++;

		if(packet_index == number_of_packets)
		{
			fprintf(stderr,"packetRxDaemon: done.\n");
			break;
		}
	}
}
DEFINE_THREAD(packetRxDaemon);

uint64_t accessMemory (uint8_t rwbar, uint8_t byte_mask, uint32_t addr, uint64_t wdata)
{
	int index = (addr >> 3) % MEMSIZE;
	uint64_t retval = mem_array [index];
	uint64_t ins_data = retval;
	if(!rwbar) {
		uint64_t mask = 0xff;
		if(byte_mask & 0x1) 
		{
			ins_data =  (ins_data & (~mask)) | (wdata & mask);
		}	
		if(byte_mask & 0x2)
		{
			ins_data =  (ins_data & (~(mask << 8))) | (wdata & (mask << 8));
		}
		if(byte_mask & 0x4)
		{
			ins_data =  (ins_data & (~(mask << 16))) | (wdata & (mask << 16));
		}
		if(byte_mask & 0x8)
		{
			ins_data =  (ins_data & (~(mask << 24))) | (wdata & (mask << 24));
		}
		if(byte_mask & 0x10)
		{
			ins_data =  (ins_data & (~(mask << 32))) | (wdata & (mask << 32));
		}
		if(byte_mask & 0x20)
		{
			ins_data =  (ins_data & (~(mask << 40))) | (wdata & (mask << 40));
		}
		if(byte_mask & 0x40)
		{
			ins_data =  (ins_data & (~(mask << 48))) | (wdata & (mask << 48));
		}
		if(byte_mask & 0x80)
		{
			ins_data =  (ins_data & (~(mask << 56))) | (wdata & (mask << 56));
		}
		mem_array[index] = ins_data;	
		fprintf(stderr,"MEM[0x%lx, 0x%x] = 0x%llx \n", addr, index, ins_data);
	}
	else
	{
		fprintf(stderr,"0x%llx = MEM[0x%x]\n", retval, index);
	}
	return(retval);
}

uint64_t processorAccessMemory (uint8_t lock,  uint8_t rwbar, uint8_t bmask, uint32_t addr, uint64_t wdata)
{
	uint64_t ctrl_word = addr | (((uint64_t) bmask) << 36) | (((uint64_t) rwbar) << 44) | (((uint64_t) lock) << 45) ;
	fprintf(stderr,"processorAccessMemory: lock=%d, rwbar=%d, bmask=0x%x, addr=0x%x, wdata=0x%llx, ctrl-word=0x%llx\n",
				lock, rwbar, bmask, addr, wdata, ctrl_word);
	write_uint64 ("TB_PROCESSOR_TO_MEM", ctrl_word);
	write_uint64 ("TB_PROCESSOR_TO_MEM", wdata);
	
	uint64_t rdata = read_uint64 ("MEM_TO_TB_PROCESSOR");
	return(rdata);
}



void memoryDaemon ()
{
	while(1)	
	{
		uint64_t ctrl  = read_uint64("TEST_SYSTEM_TO_TB_MEM");
		uint64_t wdata = read_uint64("TEST_SYSTEM_TO_TB_MEM");

		uint32_t addr  = ctrl & 0xffffffff;
		uint8_t  bmask = ((ctrl >> 32) & 0xff);
		uint8_t rwbar  = (ctrl  >> 40) & 0x1;

		fprintf(stderr,"Info: memoryDaemon: started  rwbar=%d bmask=0x%x addr = 0x%lx, wdata = 0x%llx,  ctrl=0x%llx\n",
					rwbar, bmask, addr, wdata, ctrl);
		uint64_t rdata = accessMemory (rwbar, bmask, addr, wdata);


		write_uint64("TB_MEM_TO_TEST_SYSTEM", rdata);

//#ifdef DEBUGPRINT
		fprintf(stderr,"Info: memoryDaemon: completed  rwbar=%d bmask=0x%x addr = 0x%lx, wdata = 0x%llx, rdata = 0x%llx\n",
				rwbar, bmask, addr, wdata);
//#endif
	}
}
DEFINE_THREAD(memoryDaemon);


// forward daemon
void forwardDaemon () {
	while(1)
	{
		uint32_t buf_addr;
		while (popFromQueue (rx_queue_base_address, &buf_addr))
		{
			sleep (1000);
		}

		sleep(1000);

		while(pushIntoQueue  (tx_queue_base_address, buf_addr))
		{
			sleep (1000);
		}

		sleep(1000);
	}
}
DEFINE_THREAD(forwardDaemon);

//
//  From the processor side, we set up the queues..
//
void setUpEmptyQueueInMemory (uint32_t queue_base_address, 
				uint32_t queue_lock_address, 
				uint32_t queue_bget_address,   
				uint32_t max_number_of_messages, uint32_t message_length_in_bytes)
{
	fprintf(stderr,"Info: entered setUpEmptyQueueInMemory 0x%lx, 0x%lx, 0x%lx, %d, %d \n",
				queue_base_address, 
				queue_lock_address, 
				queue_bget_address,   
				max_number_of_messages, 
				message_length_in_bytes);
					
	// message-count.
	setField(queue_base_address, 0,0);

	// read-index
	setField(queue_base_address, 1,0);

	// write-index
	setField(queue_base_address, 2,0);

	// length
	setField (queue_base_address, 3, max_number_of_messages);

	// message size.
	setField (queue_base_address, 4, message_length_in_bytes);

	// lock pointer
	setField (queue_base_address, 5, queue_lock_address);

	// bget-va  
	setField (queue_base_address, 6, queue_bget_address);

	// misc
	setField (queue_base_address, 7, 0);

	fprintf(stderr,"Info: left setUpEmptyQueueInMemory 0x%lx, 0x%lx, 0x%lx, %d, %d\n",
				queue_base_address, 
				queue_lock_address, 
				queue_bget_address,   
				max_number_of_messages, message_length_in_bytes);
}


int main(int argc, char* argv[])
{
	fprintf(stderr, "%s <n-packets> (default 4) \n", argv[0]);
	if(argc > 1)
		number_of_packets = atoi(argv[1]);
	else
	{
		fprintf(stderr, "Usage: %s <n-packets> (default 4) \n", argv[0]);
		return(1);
	}

	fprintf(stderr,"number_of_packets=%d.\n", number_of_packets);

	// start the memory daemon...
	PTHREAD_DECL(memoryDaemon);
	PTHREAD_CREATE(memoryDaemon);

	// allocate queues in memory!
	setUpEmptyQueueInMemory (free_queue_base_address, free_queue_lock_address, free_queue_bget_address,       QUEUE_SIZE_IN_MSGS, QUEUE_MSG_SIZE_IN_BYTES);
	setUpEmptyQueueInMemory (rx_queue_base_address,   rx_queue_lock_address,   rx_queue_bget_address,         QUEUE_SIZE_IN_MSGS, QUEUE_MSG_SIZE_IN_BYTES);
	setUpEmptyQueueInMemory (tx_queue_base_address,   rx_queue_lock_address,   tx_queue_bget_address,         QUEUE_SIZE_IN_MSGS, QUEUE_MSG_SIZE_IN_BYTES);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf(stderr,"Info: setup empty queues free, rx, tx in memory.\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	// initialize locks to '0'.
	releaseLock (free_queue_base_address);
	releaseLock (rx_queue_base_address);
	releaseLock (tx_queue_base_address);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf(stderr,"Info: cleared free, rx, tx queue locks.\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	// zero out the number of messages.
	setNumberOfMessages (free_queue_base_address, 0);
	setNumberOfMessages (rx_queue_base_address, 0);
	setNumberOfMessages (tx_queue_base_address, 0);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf(stderr,"Info: set num-messages = 0 in  free, rx, tx queues.\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	int i;
	for(i = 0; i < NBUFFERS; i++)
	{
		//
		// Note: buf_address is shifted-right by 4 before storing in queue.
		// 
		pushIntoQueue (free_queue_base_address, buffer_addresses[i] >> 4);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: pushed %d buffers to free queue\n", NBUFFERS);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	
	// TODO: check this out next.
	// Set up the queues in the NIC
	setNicQueuePhysicalAddresses (0,0, FREEQUEUE,  free_queue_base_address, free_queue_lock_address, free_queue_bget_address);
	setNicQueuePhysicalAddresses (0,0, RXQUEUE,  rx_queue_base_address, rx_queue_lock_address, rx_queue_bget_address);
	setNicQueuePhysicalAddresses (0,0, TXQUEUE,  tx_queue_base_address, tx_queue_lock_address, tx_queue_bget_address);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: set physical addresses of queues into NIC \n", NBUFFERS);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	
	// start the forwarding engine
	// PTHREAD_DECL(forwardDaemon);
	// PTHREAD_CREATE(forwardDaemon);
	
	// Enable NIC, MAC
	writeNicControlRegister(0, 3);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: SPIN!\n", NBUFFERS);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	while(1);

	// start the RX, TX daemons.
	PTHREAD_DECL(packetTxDaemon);
	PTHREAD_DECL(packetRxDaemon);

	PTHREAD_CREATE(packetRxDaemon);
	PTHREAD_CREATE(packetTxDaemon);

	// wait to join.
	PTHREAD_JOIN(packetTxDaemon);
	PTHREAD_JOIN(packetRxDaemon);

	fprintf(stderr,"%s: completed %\n", err_flag ? "Error" : "Info", err_flag ? "with error." : "");
	return(err_flag);

}

