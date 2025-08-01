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
#include "tb_queue.h"

// For M Bytes packet_length, required buffer_size = (8+16+M) = (M+24) Bytes
// (8 for control_info + 16 for additional_header required due to fsm logic)
// and max_address_offset = (buffe_size - 8) for Dword addressable

int err_flag = 0;
#if defined(CHECK_NIC) || defined(NIC_LOOPBACK) || defined(MAC_LOOPBACK)
int number_of_packets = 6;
int packet_lengths[6] = {32, 64, 128, 256, 512, 1024};
#endif

#if defined(CHECK_NIC) || defined(NIC_LOOPBACK)
// buffers for packets
uint32_t  buffer_addresses[NBUFFERS];
#endif

#if defined(CHECK_MEMORY_ACCESS) || defined(DEBUG_MEMORY_ACCESS) || defined(CHECK_NIC) || defined(NIC_LOOPBACK)
uint64_t  mem_array [16*4096];
#endif

uint32_t accessNicReg (uint8_t rwbar, uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	// command format
	// unused nic-id  unused  rwbar  index   value
	//   8      8        7      1       8     32
	uint64_t cmd = (((uint64_t) nic_id) << 48) | (((uint64_t) rwbar) << 40) | (((uint64_t) reg_index) << 32) | reg_value;
	write_uint64 ("tb_to_nic_slave_request", cmd);
	uint32_t retval = read_uint32 ("nic_slave_response_to_tb");
	
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: accessNicReg rwbar=%d, nic_id = %d, reg_index=%d, write_reg_value=0x%x, read_reg_value=0x%x\n",
					rwbar, nic_id, reg_index, reg_value, retval);
#endif
	return(retval);
}

uint32_t writeToNicReg (uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	uint32_t retval = accessNicReg (0, nic_id, reg_index, reg_value);
	return(retval);	
}

uint32_t readFromNicReg (uint32_t nic_id, uint32_t reg_index)
{
	uint32_t retval = accessNicReg (1, nic_id, reg_index, 0);	
	return(retval);
}

#if defined(CHECK_NIC) || defined(NIC_LOOPBACK) || defined(MAC_LOOPBACK)
void writeNicControlRegister (uint32_t nic_id, uint32_t enable_flags)
{
	writeToNicReg (nic_id, P_NIC_CONTROL_REGISTER_INDEX, enable_flags);
}

uint32_t readNicControlRegister (uint32_t nic_id)
{
	return (readFromNicReg (nic_id, P_NIC_CONTROL_REGISTER_INDEX));
}

void probeNic (uint32_t nic_id, uint32_t* rx_pkt_count, uint32_t* tx_pkt_count, uint32_t* status)
{
	*rx_pkt_count = readFromNicReg (nic_id, P_RX_PKT_COUNT_REGISTER_INDEX);
	*tx_pkt_count = readFromNicReg (nic_id, P_TX_PKT_COUNT_REGISTER_INDEX);
	*status       = readFromNicReg (nic_id, P_STATUS_REGISTER_INDEX);
}

// Send packets to Rx_in_pipe of NIC
void packetTxDaemon () {
	int packet_index = 0;
	uint8_t tx_byte = 0;
	while(1)
	{
		int length = packet_lengths[packet_index % 4];
		fprintf(stderr,"Info: packetTxDaemon: sending packet with length = %d.\n", length);
		while (length > 0)
		{
			uint16_t last = (length == 1);
			uint16_t tx_val = (last << 9) | (tx_byte << 1);
			// last byte unused
			// 1     8   1
			write_uint16 ("tb_to_nic_mac_bridge", tx_val);

			fprintf(stderr,"Info: packetTxDaemon: sent%sbyte 0x%x \n", last ? " last " : " ", tx_byte);
			tx_byte++;

			length--;
		}
		packet_index++;
		fprintf(stderr,"Info: packetTxDaemon: sent packet with index %d.\n", packet_index);

		if(packet_index == number_of_packets)
		{
			fprintf(stderr,"Info: packetTxDaemon: done.\n");
			break;
		}
	}
}
DEFINE_THREAD(packetTxDaemon);

// Receive packets from Tx_in_pipe of NIC
void packetRxDaemon () {
	int packet_index = 0;
	uint8_t expected_byte = 0;
	while(1)
	{
		int length = packet_lengths[packet_index % 4];
		fprintf(stderr,"Info: packetRxDaemon: expecting packet with length = %d.\n", length);
		int rx_byte_index = 0;
		while (length > 0)
		{
			// last byte unused
			// 1     8   1
			uint16_t rx_val = read_uint16 ("nic_mac_bridge_to_tb");

			uint16_t last = (rx_val  >> 9) & 0x1;
			uint8_t rx_byte = (rx_val >> 1) & 0xff;

			fprintf(stderr,"Info: packetRxDaemon: received%sbyte 0x%x \n", last ? " last " : " ", rx_byte);
			uint16_t expected_last = (length == 1);
			
			if(last != expected_last)
			{
				fprintf(stderr,"Error: packet %d (length=%d), last mismatch at rx_byte_index=%d.\n", 
						packet_index, packet_lengths[packet_index % 4], rx_byte_index);
				err_flag = 1;
			}

			if(rx_byte != expected_byte)
			{
				fprintf(stderr,"Error: mismatched byte: expected = 0x%x, received = 0x%x, packet %d (length=%d), rx_byte_index=%d.\n", 
					expected_byte, rx_byte, packet_index, packet_lengths[packet_index % 4], rx_byte_index);
				err_flag = 1;
			}

			expected_byte++;
			rx_byte_index++;

			length--;
		}
		packet_index++;
		fprintf(stderr,"Info: packetRxDaemon: received packet with index %d.\n", packet_index);

		if(packet_index == number_of_packets)
		{
			fprintf(stderr,"Info: packetRxDaemon: done.\n");
			break;
		}
	}
}
DEFINE_THREAD(packetRxDaemon);
#endif

#ifdef CHECK_NIC
// forward daemon
void forwardDaemon () {
	uint32_t server_id = 0;
	while(1)
	{
		uint32_t buf_addr;
		while (popFromQueue (NIC_ID, server_id, RXQUEUE, &buf_addr))
		{
#ifdef DEBUGPRINT
			fprintf(stderr,"Warning: forwardDaemon : pop from Rx queue not ok, retrying again.\n");
#endif
		}
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 
		fprintf(stderr,"Info: forwardDaemon: popped from Rx queue server %d, buf_addr=0x%x\n", server_id, buf_addr);
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 

		while(pushIntoQueue  (NIC_ID, server_id, TXQUEUE, buf_addr))
		{
#ifdef DEBUGPRINT
			fprintf(stderr,"Warning: forwardDaemon : push into Tx queue not ok, retrying again.\n");
#endif
		}
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 
		fprintf(stderr,"Info: forwardDaemon: pushed into Tx queue server %d, buf_addr=0x%x\n", server_id, buf_addr);
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 
		
		server_id = (server_id + 1) % NSERVERS;
	}
}
DEFINE_THREAD(forwardDaemon);
#endif

#if defined(CHECK_MEMORY_ACCESS) || defined(DEBUG_MEMORY_ACCESS) || defined(CHECK_NIC) || defined(NIC_LOOPBACK)
uint64_t accessMemory (uint8_t count, uint8_t lock, uint8_t rwbar, uint8_t byte_mask, uint32_t addr, uint64_t wdata)
{
	int index = (addr >> 3) % MEMSIZE;
	uint64_t retval = mem_array [index];
	uint64_t ins_data = retval;
	if(!rwbar) 
	{
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
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: [count=0x%x]  MEM[0x%lx, 0x%x] = 0x%llx %s\n", count, addr, index, ins_data, (lock ? "lock" : ""));
#endif
	}
	else
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: [count=0x%x]   0x%llx = MEM[0x%lx, 0x%x] %s\n", count, retval, addr, index, (lock ? "lock" : ""));
#endif
	}
	return(retval);
}

uint64_t processorAccessMemory (uint8_t lock,  uint8_t rwbar, uint8_t bmask, uint32_t addr, uint64_t wdata)
{
	uint64_t ctrl_word = (((uint64_t) lock) << 45) | (((uint64_t) rwbar) << 44) | (((uint64_t) bmask) << 36) | addr ;
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: processorAccessMemory: lock=%d, rwbar=%d, bmask=0x%x, addr=0x%lx, wdata=0x%llx, ctrl-word=0x%llx\n",
				lock, rwbar, bmask, addr, wdata, ctrl_word);
#endif
	write_uint64 ("TB_PROCESSOR_TO_MEM", ctrl_word);
	write_uint64 ("TB_PROCESSOR_TO_MEM", wdata);
	
	uint64_t rdata = read_uint64 ("MEM_TO_TB_PROCESSOR");
	return(rdata);
}

void memoryDaemon ()
{
	int last_was_locked = 0;
	uint32_t last_locked_addr = 0;
	while(1)	
	{
		uint64_t ctrl  = read_uint64("TEST_SYSTEM_TO_TB_MEM");
		uint64_t wdata = read_uint64("TEST_SYSTEM_TO_TB_MEM");

		uint32_t addr  = ctrl & 0xffffffff;
		uint8_t  bmask = ((ctrl >> 32) & 0xff);
		uint8_t rwbar  = (ctrl  >> 40) & 0x1;
		uint8_t lock   = (ctrl  >> 41) & 0x1;
		uint8_t count  = (ctrl >> 56) & 0xff;

		if(last_was_locked)
		{
			if(lock)
			{
				fprintf(stderr,"Error: memoryDaemon: two locks in a row.\n");
			}
			if(addr != last_locked_addr)
			{
				fprintf(stderr,"Error: memoryDaemon: last_locked_addr = 0x%x != addr=0x%x\n", last_locked_addr, addr);
			}
		}

		if(lock) 
		{
			last_was_locked = 1;
			last_locked_addr = addr;
		}
		else
		{
			last_was_locked = 0;
		}
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: memoryDaemon[0x%x]: started  lock=%d, rwbar=%d bmask=0x%x addr = 0x%lx, wdata = 0x%llx,  ctrl=0x%llx\n",
					 count, lock, rwbar, bmask, addr, wdata, ctrl);
#endif
		uint64_t rdata = accessMemory (count, lock, rwbar, bmask, addr, wdata);

		write_uint64("TB_MEM_TO_TEST_SYSTEM", rdata);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: memoryDaemon: completed  rwbar=%d bmask=0x%x addr = 0x%lx, wdata = 0x%llx, rdata = 0x%llx\n",
					rwbar, bmask, addr, wdata, rdata);
#endif
	}
}
DEFINE_THREAD(memoryDaemon);
#endif

#if defined(MONITOR_NIC_REG) || defined(DEBUGPRINT)
// Function to print all relevant NIC registers
void printNicRegisters(uint32_t nic_id) 
{
	fprintf(stderr, "--- NIC Registers (NIC ID: %u) ---\n", nic_id);

    	// General Registers
    	fprintf(stderr, "P_N_SERVERS_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_N_SERVERS_REGISTER_INDEX));
    	fprintf(stderr, "P_N_BUFFERS_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_N_BUFFERS_REGISTER_INDEX));
    	fprintf(stderr, "P_TX_PKT_COUNT_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_TX_PKT_COUNT_REGISTER_INDEX));
    	fprintf(stderr, "P_RX_PKT_COUNT_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_RX_PKT_COUNT_REGISTER_INDEX));
    	fprintf(stderr, "P_STATUS_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_STATUS_REGISTER_INDEX));
    	fprintf(stderr, "P_NIC_CONTROL_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_NIC_CONTROL_REGISTER_INDEX));
    	
    	uint32_t counter_value = readFromNicReg(nic_id, P_COUNTER_REGISTER_INDEX); 
    	double seconds = (double)counter_value / 125000000.0; // Divide by frequency (125 MHz)

    	fprintf(stderr, "S_FREE_RUNNING_COUNTER: 0x%08X (%.9f seconds)\n", counter_value, seconds);
    	fflush(stderr); // Important: Flush stderr to ensure output is displayed
    	fprintf(stderr, "-----------------------------\n");
}
#endif

#ifdef MONITOR_NIC_REG
struct monitor_args {
    int nic_id;
    int monitor_duration_seconds;
};

void *monitorNicRegisters_thread_func(void *arg) 
{
    	struct monitor_args *args = (struct monitor_args *)arg;
    	int nic_id = args->nic_id;
    	int monitor_duration_seconds = args->monitor_duration_seconds;
    	time_t start_time = time(NULL);
    	while (time(NULL) - start_time < monitor_duration_seconds) 
    	{
        	printNicRegisters(nic_id);
        	//usleep(100000); // 100ms
    	}
    	return NULL;
}
#endif

int main(int argc, char* argv[])
{
#if defined(CHECK_NIC) || defined(NIC_LOOPBACK) || defined(MAC_LOOPBACK)
	fprintf(stderr, "%s <n-packets> (default 6) \n", argv[0]);
	if(argc > 1)
		number_of_packets = atoi(argv[1]);
	else
	{
		fprintf(stderr, "Usage: %s <n-packets> (default 6) \n", argv[0]);
	}
	fprintf(stderr,"number_of_packets=%d.\n", number_of_packets);
#endif
	
	fprintf (stderr,"Info: setting number of servers enabled to %d \n", NSERVERS);
	// set the number of servers in the nic
	setNumberOfServersInNic(NIC_ID, NSERVERS);
#ifdef DEBUGPRINT
	fprintf (stderr,"Info: set number of servers enabled\n");
	// get the number of servers in the nic
	uint32_t servers_enabled = getNumberOfServersInNic(NIC_ID);
	fprintf (stderr,"Info: reading from register, number of servers enabled = %d \n", servers_enabled);
#endif

	fprintf (stderr,"Info: setting number of buffers in each queue to %d \n", NBUFFERS);
	// set the number of buffers in the queue
	setNumberOfBuffersInQueue(NIC_ID, NBUFFERS);
#ifdef DEBUGPRINT
	fprintf (stderr,"Info: set number of buffers in each queue\n");
	// get the number of buffers in the queue
	uint32_t buffers_in_queue = getNumberOfBuffersInQueue(NIC_ID);
	fprintf (stderr,"Info: reading from register, number of buffers in each queue = %d \n", buffers_in_queue);
#endif
	
	
#ifdef CHECK_QUEUES
	int s_id;
	int cq_err = 0;
	// checking free queue using lock-push/pop-unlock operations
	cq_err = checkQueues(FREEQUEUE, FQ_SERVER_ID);
		if(cq_err)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d failed.\n", FREEQUEUE, FQ_SERVER_ID);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueues queue %d server %d done (ret=%d)!\n", FREEQUEUE, FQ_SERVER_ID, cq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	
	for(s_id = 0; s_id < NSERVERS; s_id++)
	{
		// checking Rx queue using push/pop operations for all 4 servers
		cq_err = checkQueues(RXQUEUE, s_id);
		if(cq_err)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d failed.\n", RXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueues queue %d server %d done (ret=%d)!\n", RXQUEUE, s_id, cq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");

		// checking Tx queue using push/pop operations for all 4 servers
		cq_err = checkQueues(TXQUEUE, s_id);
		if(cq_err)
		{
			fprintf(stderr,"Error: checkQueues queue %d server %d failed.\n", TXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueues queue %d server %d done (ret=%d)!\n", TXQUEUE, s_id, cq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	}
#endif
	
	
#ifdef DEBUG_QUEUES
	int s_id;
	int dq_err = 0;
	// checking freeQ using push (w/o lock-unlock) from NIC side through debug queue pipes
	dq_err = debugQueues(FREEQUEUE, FQ_SERVER_ID);
	if(dq_err)
	{
		fprintf(stderr,"Error: debugCheckQueues queue %d server %d failed.\n", FREEQUEUE, FQ_SERVER_ID);
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: debugCheckQueues queue %d server %d done (ret=%d)!\n", FREEQUEUE, FQ_SERVER_ID, dq_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	// checking free using pop (w/o lock-unlock) from NIC side through debug queue pipes
	dq_err = debugQueuesInReverse(FREEQUEUE, FQ_SERVER_ID);
	if(dq_err)
	{
		fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d failed.\n", FREEQUEUE, FQ_SERVER_ID);
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: debugCheckQueuesInReverse queue %d server %d done (ret=%d)!\n", FREEQUEUE, FQ_SERVER_ID, dq_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	for(s_id = 0; s_id < NSERVERS; s_id++)
	{
		// checking Rx queue using push from NIC side through debug queue pipes for all 4 servers
		dq_err = debugQueues(RXQUEUE, s_id);
		if(dq_err)
		{
			fprintf(stderr,"Error: debugCheckQueues queue %d server %d failed.\n", RXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: debugCheckQueues queue %d server %d done (ret=%d)!\n", RXQUEUE, s_id, dq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");

		// checking Rx queue using pop from NIC side through debug queue pipes for all 4 servers
		dq_err = debugQueuesInReverse(RXQUEUE, s_id);
		if(dq_err)
		{
			fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d failed.\n", RXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: debugCheckQueuesInReverse queue %d server %d done (ret=%d)!\n", RXQUEUE, s_id, dq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		
		// checking Tx queue using push from NIC side through debug queue pipes for all 4 servers
		dq_err = debugQueues(TXQUEUE, s_id);
		if(dq_err)
		{
			fprintf(stderr,"Error: debugCheckQueues queue %d server %d failed.\n", TXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: debugCheckQueues queue %d server %d done (ret=%d)!\n", TXQUEUE, s_id, dq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");

		// checking Tx queue using pop from NIC side through debug queue pipes for all 4 servers
		dq_err = debugQueuesInReverse(TXQUEUE, s_id);
		if(dq_err)
		{
			fprintf(stderr,"Error: debugCheckQueuesInReverse queue %d server %d failed.\n", TXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: debugCheckQueuesInReverse queue %d server %d done (ret=%d)!\n", TXQUEUE, s_id, dq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	}
#endif
	
	
#ifdef CHECK_QUEUE_SEQUENCE
	int cqs_err = 0;
	// Mimics and checks queue sequencing operations from processor side
	cqs_err = checkQueueSequence ();
	if(cqs_err)
	{
		fprintf(stderr,"Error: checkQueueSequence failed.\n");
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueueSequence done (ret=%d)!\n", cqs_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
#endif
	
	
#ifdef DEBUG_QUEUE_SEQUENCE
	int dqs_err = 0;
	// Mimics and checks queue sequencing operations from NIC side
	dqs_err = debugQueueSequence ();
	if(dqs_err)
	{
		fprintf(stderr,"Error: debugQueueSequence failed.\n");
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: debugQueueSequence done (ret=%d)!\n", dqs_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
#endif

#if defined(CHECK_MEMORY_ACCESS) || defined(DEBUG_MEMORY_ACCESS) || defined(CHECK_NIC) || defined(NIC_LOOPBACK)
	// start the memory daemon...
	PTHREAD_DECL(memoryDaemon);
	PTHREAD_CREATE(memoryDaemon);
	
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: Started memory daemon\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
#endif
	
#ifdef CHECK_MEMORY_ACCESS
	int cma_err = 0;
	// Check the memory access from the processor side.
	cma_err = checkMemoryAccess ();
	if(cma_err)
	{
		fprintf(stderr,"Error: checkMemoryAccess failed.\n");
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkMemoryAccess done (ret=%d)!\n", cma_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
#endif	


#ifdef DEBUG_MEMORY_ACCESS
	int dma_err = 0;
	// Checking memory access using write from NIC side through debug pipes.
	dma_err = debugMemoryAccess ();
	if(dma_err)
	{
		fprintf(stderr,"Error: debugMemoryAccess failed.\n");
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: debugMemoryAccess done (ret=%d)!\n", dma_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	// Checking memory access using read from NIC side through debug pipes.
	dma_err = debugMemoryAccessInReverse ();
	if(dma_err)
	{
		fprintf(stderr,"Error: debugMemoryAccessInReverse failed.\n");
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: debugMemoryAccessInReverse done (ret=%d)!\n", dma_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
#endif
	
	
#if defined(CHECK_NIC) || defined(NIC_LOOPBACK)
	// Checks overall functioning of NIC
	// buffers for packets, each buffer has a capacity of 1024 bytes.
	int i;
	// Allocating buffers
	for (i = 0; i < NBUFFERS; i++) 
	{
        	buffer_addresses[i] = 1048 * (i + 1);  // Starting from 1048 and increasing by 1048, i.e., buffer_size for 1024 B
		fprintf (stderr,"Info: Allocated buffer %d adddress %x \n", i, buffer_addresses[i]);
    	}

	for(i = 0; i < NBUFFERS; i++)
	{
		// Writing max_addr_offset as control information to memory
		uint64_t max_addr_offset = 1040;	// (buffer_size - 8)
		max_addr_offset = (max_addr_offset << 48);
		processorAccessMemory (0, 0, 0xff, buffer_addresses[i], max_addr_offset); 
		
		// Pushing physical addresses of buffers into "FREEQUEUE".
		int push_not_ok;
		do {
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Acquiring lock for free queue.\n");
#endif
			while(acquireLock(NIC_ID)) 
			{
				fprintf(stderr,"Warning: lock not acquired, retrying again.\n");
			};
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock acquired.\n");
			fprintf(stderr,"Info: Pushing into free queue.\n");
#endif
			push_not_ok = pushIntoQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, buffer_addresses[i]);
			releaseLock (NIC_ID);
#ifdef DEBUGPRINT
			fprintf(stderr,"Info: Lock released.\n");
#endif
			if(push_not_ok)
			{
				fprintf(stderr,"Warning: push to free queue not ok, retrying again.\n");
			}
		} while (push_not_ok);
		fprintf(stderr,"Info: pushed to free queue, buf_addr=0x%x\n", buffer_addresses[i]);
	}
	
	// Ensuring buffers are stored properly in free queue by reading status, i.e., no. of entries.
	uint32_t entries_in_freeQ = getStatusOfQueueInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE);
	fprintf(stderr,"Info: Total number of entries in free queue = %d\n", entries_in_freeQ);
#endif

#ifdef CHECK_NIC	
	// start the forwarding engine
	PTHREAD_DECL(forwardDaemon);
	PTHREAD_CREATE(forwardDaemon);

	// Enable NIC, MAC and servers (To start the receive and transmit engines of NIC)
	uint32_t control_value = ((NORMAL_MODE << 7) | (SERVERS_ENABLED << 3) | (DISABLE_NIC_INTERRUPT << 2) | (ENABLE_MAC << 1) | ENABLE_NIC);
	fprintf (stderr,"Info: writing value = 0x%x to control register \n", control_value);
#endif

#ifdef NIC_LOOPBACK
	// Enable NIC, MAC, servers and select NIC loopback test mode, i.e., control_reg [7] should be set
	uint32_t control_value = ((NIC_LOOPBACK << 7) | (SERVERS_ENABLED << 3) | (DISABLE_NIC_INTERRUPT << 2) | (ENABLE_MAC << 1) | ENABLE_NIC);
	fprintf (stderr,"Info: writing value = 0x%x to control register \n", control_value);
#endif

#ifdef MAC_LOOPBACK
	// Enable MAC and select MAC loopback test mode, i.e., control_reg [8] should be set
	uint32_t control_value = ((MAC_LOOPBACK << 7) | (SERVERS_ENABLED << 3) | (DISABLE_NIC_INTERRUPT << 2) | (ENABLE_MAC << 1) | DISABLE_NIC);
	fprintf (stderr,"Info: writing value = 0x%x to control register \n", control_value);
#endif
	
#if defined(CHECK_NIC) || defined(NIC_LOOPBACK) || defined(MAC_LOOPBACK)
	// Write the control value
	writeNicControlRegister(NIC_ID, control_value);
#ifdef DEBUGPRINT
	// Read the control status
	uint32_t control_status = readNicControlRegister (NIC_ID);
	fprintf (stderr,"Info: reading from register, control status = 0x%x \n", control_status);
#endif
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: SPIN!\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
#endif

#ifdef CHECK_NIC

#if defined(MONITOR_NIC_REG) || defined(DEBUGPRINT)
	// Print register values after initialization
    	printNicRegisters(NIC_ID);
#endif
    	
#ifdef MONITOR_NIC_REG
    	pthread_t monitor_thread;
    	struct monitor_args args;
    	args.nic_id = NIC_ID; // Set your nic_id
    	args.monitor_duration_seconds = 10; // Set your monitoring duration

    	if (pthread_create(&monitor_thread, NULL, monitorNicRegisters_thread_func, &args) != 0) {
        	perror("pthread_create failed");
        	return 1;
    	}
#endif

#endif

#if defined(CHECK_NIC) || defined(NIC_LOOPBACK) || defined(MAC_LOOPBACK)
	// start the RX, TX daemons.
	PTHREAD_DECL(packetTxDaemon);
	PTHREAD_DECL(packetRxDaemon);

	PTHREAD_CREATE(packetRxDaemon);
	PTHREAD_CREATE(packetTxDaemon);

	// wait to join.
	PTHREAD_JOIN(packetTxDaemon);
	PTHREAD_JOIN(packetRxDaemon);
#endif

#ifdef CHECK_NIC	

#ifdef MONITOR_NIC_REG
	pthread_join(monitor_thread, NULL);
#endif

#if defined(MONITOR_NIC_REG) || defined(DEBUGPRINT)
	// Print register values before exiting
    	printNicRegisters(NIC_ID);
#endif

#endif

#if defined(CHECK_NIC) || defined(NIC_LOOPBACK) || defined(MAC_LOOPBACK)
	fprintf(stderr,"%s: completed %s\n", err_flag ? "Error" : "Info", err_flag ? "with error." : "");
#endif
	return(err_flag);
}

