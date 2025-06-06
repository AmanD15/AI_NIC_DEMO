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

int packet_lengths[4] = {32, 37, 49, 64};

// 512 MB, 64K dwords
#define MEMSIZE (16*4096)
#define NBUFFERS 4  		// for debug purposes, keep it 1, later 4 or 8 or ....

int number_of_packets = 16;

uint64_t  mem_array [16*4096];
int 	  err_flag = 0;

uint32_t  free_queue_base_address = 0;      // includes 128-bytes for buffer.
uint32_t  rx_queue_base_address   = 256;    // includes 128-bytes for buffer.
uint32_t  tx_queue_base_address   = 512;    // includes 128-bytes for buffer.

uint32_t  free_queue_bget_address = 128;  
uint32_t  rx_queue_bget_address   = 256 + 128;    
uint32_t  tx_queue_bget_address   = 512 + 128;   


// four buffers for packets, each buffer has a capacity
// of 1024 bytes.
uint32_t  buffer_addresses[4]     = {1024, 2048, 3072, 4096};

// lock addresses
uint32_t free_queue_lock_address = 8092;
uint32_t rx_queue_lock_address   = 8093;
uint32_t tx_queue_lock_address   = 8094;

void printNicRegisters(uint32_t nic_id);
//void monitorNicRegisters(uint32_t nic_id, int monitor_duration_seconds); //Obsolete
void *monitorNicRegisters_thread_func(void *arg);

uint32_t accessNicReg (uint8_t rwbar, uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	// command format
	// unused nic-id  unused  rwbar  index   value
	//   8      8        7      1       8     32
	uint64_t cmd = (((uint64_t) nic_id) << 48) | (((uint64_t) rwbar) << 40) | (((uint64_t) reg_index) << 32) | reg_value;
	write_uint64 ("tb_to_nic_slave_request", cmd);
	uint32_t retval = read_uint32 ("nic_slave_response_to_tb");

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: accessNicReg rwbar=%d, nic_id = %d, reg_index=%d, write+_reg_value=0x%x, read_reg_value=0x%x\n",
					rwbar, nic_id, reg_index, reg_value, retval);
#endif

	return(retval);
}

void writeToNicReg (uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	accessNicReg (0, nic_id, reg_index, reg_value);	
	printNicRegisters(nic_id); // Print after every write
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
#ifdef DEBUGPRINT
	fprintf(stderr,"Info:  setNicQueuePhysicalAddresses nic_id=%d, server=%d, queue_type=%d, queue_addr=0x%x, queue_lock_addr=0x%x, queue_buffer_addr=0x%x\n",
				nic_id, server_id,
				queue_type,  queue_addr, 
				queue_lock_addr, queue_buffer_addr);
#endif

	uint32_t base_index;		 
	switch(queue_type)
	{
		case FREEQUEUE     : base_index = P_FREE_QUEUE_REGISTER_BASE_INDEX;    break;
		case RXQUEUE       : base_index = (P_RX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)); break;
		case TXQUEUE       : base_index = (P_TX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)); break;	
	}	 
		 
	setPhysicalAddressInNicRegPair (nic_id, base_index, queue_addr); 
	setPhysicalAddressInNicRegPair (nic_id, base_index+2, queue_lock_addr); 
	setPhysicalAddressInNicRegPair (nic_id, base_index+4, queue_buffer_addr); 
	
	printNicRegisters(nic_id); // Print after setting queue addresses
}

void getNicQueuePhysicalAddresses (uint32_t nic_id, uint32_t server_id,
		uint32_t queue_type,  uint64_t *queue_addr, 
		uint64_t *queue_lock_addr, uint64_t *queue_buffer_addr)
{
	uint32_t base_index;		 
	switch(queue_type)
	{
		case FREEQUEUE     : base_index = P_FREE_QUEUE_REGISTER_BASE_INDEX;    break;
		case RXQUEUE       : base_index = (P_RX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)); break;
		case TXQUEUE       : base_index = (P_TX_QUEUE_REGISTER_BASE_INDEX + (8*server_id)); break;	
	}	 		 
			 
	*queue_addr = getPhysicalAddressInNicRegPair (nic_id, base_index);
	*queue_lock_addr = getPhysicalAddressInNicRegPair (nic_id, base_index+2);
	*queue_buffer_addr = getPhysicalAddressInNicRegPair (nic_id, base_index+4);

#ifdef DEBUGPRINT
	fprintf(stderr,"Info:  getNicQueuePhysicalAddresses nic_id=%d, server=%d, queue_type=%d, queue_addr=0x%x, queue_lock_addr=0x%x, queue_buffer_addr=0x%x\n",
				nic_id, server_id,
				queue_type,  *queue_addr, 
				*queue_lock_addr, *queue_buffer_addr);
#endif
}

void RxLoggerDaemon () {
	while(1)
	{
		uint32_t val = read_uint8("RX_ACTIVITY_LOGGER");
		fprintf (stderr, "Info: RX_ACTIVITY_LOGGER=0x%x\n", val);
	}
}
DEFINE_THREAD(RxLoggerDaemon);

void TxLoggerDaemon () {
	while(1)
	{
		uint32_t val = read_uint8("TX_ACTIVITY_LOGGER");
		fprintf (stderr, "Info: TX_ACTIVITY_LOGGER=0x%x\n", val);
	}
}
DEFINE_THREAD(TxLoggerDaemon);




void packetTxDaemon () {
	int packet_index = 0;
	uint8_t current_byte = 0;
	while(1)
	{
		int length = packet_lengths[packet_index % 4];
		fprintf(stderr,"packetTxDaemon: starting packet with length = %d.\n", length);
		while (length > 0)
		{
			uint16_t last = (length == 1);
			uint16_t tx_val = (last << 9) | (current_byte << 1);

			write_uint16 ("tb_to_nic_mac_bridge", tx_val);

			fprintf(stderr,"Info: packetTxDaemon: sent 0x%x byte=0x%x %s\n", tx_val, current_byte,
										last ? "last" : "");
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
	int packet_index = 0;
	uint8_t expected_current_byte = 0;
	while(1)
	{
		int length = packet_lengths[packet_index % 4];
		fprintf(stderr,"packetRxDaemon: expecting packet with length %d.\n", length);
		int rx_byte_index = 0;
		while (length > 0)
		{
			// last byte unused
			// 1     8   1
			uint16_t rx_val = read_uint16 ("nic_mac_bridge_to_tb");

			uint16_t last = (rx_val  >> 9) & 0x1;
			uint8_t rx_byte = (rx_val >> 1) & 0xff;

			fprintf(stderr,"Info: packetRxDaemon: received byte 0x%x %s\n", rx_byte, last ? "last" : "");
			uint16_t expected_rx_last = (length == 1);
			
			if(last != expected_rx_last)
			{
				fprintf(stderr,"Error: packet %d (length=%d), last mismatch at rx_byte_index=%d.\n", 
						packet_index, packet_lengths[packet_index % 4], rx_byte_index);
				err_flag = 1;
			}

			if(rx_byte != expected_current_byte)
			{
				fprintf(stderr,"Error: mismatched byte: expected = 0x%x, received = 0x%x, packet %d (length=%d), rx_byte_index=%d.\n", 
						expected_current_byte, rx_byte, packet_index, 
						packet_lengths[packet_index % 4], rx_byte_index);
				err_flag = 1;
			}


			expected_current_byte++;
			rx_byte_index++;

			length--;
		}
		packet_index++;
		fprintf(stderr,"packetRxDaemon: received packet with index %d.\n", packet_index);

		if(packet_index == number_of_packets)
		{
			fprintf(stderr,"packetRxDaemon: done.\n");
			break;
		}
	}
}
DEFINE_THREAD(packetRxDaemon);

uint64_t accessMemory (uint8_t count, uint8_t lock, uint8_t rwbar, uint8_t byte_mask, uint32_t addr, uint64_t wdata)
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
#ifdef DEBUGPRINT
		fprintf(stderr,"[count=0x%x]  MEM[0x%lx, 0x%x] = 0x%llx %s\n", count, addr, index, ins_data,
					(lock ? "lock" : ""));
#endif
	}
	else
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"[count=0x%x]   0x%llx = MEM[0x%llx, 0x%x] %s\n", 
			count, retval, addr, index, (lock ? "lock" : ""));
#endif
	}
	return(retval);
}

uint64_t processorAccessMemory (uint8_t lock,  uint8_t rwbar, uint8_t bmask, uint32_t addr, uint64_t wdata)
{
	uint64_t ctrl_word = addr | (((uint64_t) bmask) << 36) | (((uint64_t) rwbar) << 44) | (((uint64_t) lock) << 45) ;
#ifdef DEBUGPRINT
	fprintf(stderr,"processorAccessMemory: lock=%d, rwbar=%d, bmask=0x%x, addr=0x%x, wdata=0x%llx, ctrl-word=0x%llx\n",
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
				fprintf(stderr,"Error:memoryDaemon: two locks in a row.\n");
			}
			if(addr  != last_locked_addr)
			{
				fprintf(stderr,"Error:memoryDaemon: last_locked_addr = 0x%x != addr=0x%x\n",
							last_locked_addr, addr);
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


// forward daemon
void forwardDaemon () {
	while(1)
	{
		uint64_t buf_addr;
		while (popFromQueue (rx_queue_base_address, &buf_addr))
		{
			usleep (1000);
		}
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 
		fprintf(stderr,"forwardDaemon: popped from rxqueue addr=0x%x\n", buf_addr);
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 

		usleep(1000);

		while(pushIntoQueue  (tx_queue_base_address, buf_addr))
		{
			usleep (1000);
		}
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 
		fprintf(stderr,"forwardDaemon: pushed to txqueue addr=0x%x\n", buf_addr);
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 

		usleep(1000);
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
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered setUpEmptyQueueInMemory 0x%lx, 0x%lx, 0x%lx, %d, %d \n",
				queue_base_address, 
				queue_lock_address, 
				queue_bget_address,   
				max_number_of_messages, 
				message_length_in_bytes);
#endif
					
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

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: left setUpEmptyQueueInMemory 0x%lx, 0x%lx, 0x%lx, %d, %d\n",
				queue_base_address, 
				queue_lock_address, 
				queue_bget_address,   
				max_number_of_messages, message_length_in_bytes);
#endif
}


// Function to print all relevant NIC registers
void printNicRegisters(uint32_t nic_id) 
{
	fprintf(stderr, "--- NIC Registers (NIC ID: %u) ---\n", nic_id);

    	// General Registers
    	fprintf(stderr, "P_N_SERVERS_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_N_SERVERS_REGISTER_INDEX));
    	fprintf(stderr, "P_TX_PKT_COUNT_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_TX_PKT_COUNT_REGISTER_INDEX));
    	fprintf(stderr, "P_RX_PKT_COUNT_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_RX_PKT_COUNT_REGISTER_INDEX));
    	fprintf(stderr, "P_STATUS_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_STATUS_REGISTER_INDEX));
    	fprintf(stderr, "P_NIC_CONTROL_REGISTER_INDEX: 0x%08X\n", readFromNicReg(nic_id, P_NIC_CONTROL_REGISTER_INDEX));
    	
    	uint32_t counter_value = readFromNicReg(nic_id, 255); // Assuming 255 is the correct index
    	double seconds = (double)counter_value / 125000000.0; // Divide by frequency (125 MHz)

    	fprintf(stderr, "S_FREE_RUNNING_COUNTER: 0x%08X (%.9f seconds)\n", counter_value, seconds);
    	fflush(stderr); // Important: Flush stderr to ensure output is displayed

    	// Queue Registers (Iterate through server IDs if needed)
    	int server_id;
    	for (server_id = 0; server_id < getNumberOfServersInNic(nic_id); server_id++) 
    	{
        	uint64_t queue_addr, queue_lock_addr, queue_buffer_addr;

        	getNicQueuePhysicalAddresses(nic_id, server_id, FREEQUEUE, &queue_addr, &queue_lock_addr, &queue_buffer_addr);
        	fprintf(stderr, "--- Free Queue (Server %d) ---\n", server_id);
        	fprintf(stderr, "  Address: 0x%016lX\n", queue_addr);
        	fprintf(stderr, "  Lock Address: 0x%016lX\n", queue_lock_addr);
        	fprintf(stderr, "  Buffer Address: 0x%016lX\n", queue_buffer_addr);

        	getNicQueuePhysicalAddresses(nic_id, server_id, RXQUEUE, &queue_addr, &queue_lock_addr, &queue_buffer_addr);
        	fprintf(stderr, "--- RX Queue (Server %d) ---\n", server_id);
        	fprintf(stderr, "  Address: 0x%016lX\n", queue_addr);
        	fprintf(stderr, "  Lock Address: 0x%016lX\n", queue_lock_addr);
        	fprintf(stderr, "  Buffer Address: 0x%016lX\n", queue_buffer_addr);

        	getNicQueuePhysicalAddresses(nic_id, server_id, TXQUEUE, &queue_addr, &queue_lock_addr, &queue_buffer_addr);
        	fprintf(stderr, "--- TX Queue (Server %d) ---\n", server_id);
        	fprintf(stderr, "  Address: 0x%016lX\n", queue_addr);
        	fprintf(stderr, "  Lock Address: 0x%016lX\n", queue_lock_addr);
        	fprintf(stderr, "  Buffer Address: 0x%016lX\n", queue_buffer_addr);
    	}
    	//fprintf(stderr, "-----------------------------\n");

}



/*
//Obsolete
void monitorNicRegisters(uint32_t nic_id, int monitor_duration_seconds) 
{
    	time_t start_time = time(NULL);
    	while (time(NULL) - start_time < monitor_duration_seconds) 
    	{
        	printNicRegisters(nic_id);
        	usleep(100000); // Print every 100ms (adjust as needed)
    	}
}
DEFINE_THREAD(monitorNicRegisters);
*/


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



/*
// To test and log only counter value to a file
void monitorNicCounterToFile(uint32_t nic_id, uint32_t counter_register_index, const char *filename) {
    FILE *outfile = fopen(filename, "w"); // Open file for writing ("w" creates/overwrites)
    if (outfile == NULL) {
        perror("Error opening output file");
        return; // Or handle the error appropriately
    }

    uint32_t previous_counter_value = 0;
    uint32_t current_counter_value;
    double seconds;
    time_t start_time = time(NULL);
    while (time(NULL) - start_time < 10) {
        current_counter_value = readFromNicReg(nic_id, counter_register_index);

        if (current_counter_value != previous_counter_value) {
            seconds = (double)current_counter_value / 125000000.0;
            fprintf(outfile, "Counter (0x%X): 0x%08X (%.9f seconds)\n", counter_register_index, current_counter_value, seconds);
            fflush(outfile); // Important: Flush the file buffer
            previous_counter_value = current_counter_value;
        }
        usleep(1000);
    }

    fclose(outfile); // Close the file when done
}

struct monitor_args {
    uint32_t nic_id;
    uint32_t counter_register_index;
    const char* filename;
};
// Example usage in a thread:
void *monitorNicCounterToFile_thread_func(void *arg) {
    struct monitor_args *args = (struct monitor_args *)arg;
    uint32_t nic_id = args->nic_id;
    uint32_t counter_register_index = args->counter_register_index;
    const char* filename = args->filename;
    monitorNicCounterToFile(nic_id, counter_register_index, filename);
    return NULL;
}

// To log counter values in a file
int main() {
    pthread_t monitor_thread;
    struct monitor_args args;
    args.nic_id = 0;
    args.counter_register_index = 255;
    args.filename = "counter_log.txt"; // Specify the filename

    if (pthread_create(&monitor_thread, NULL, monitorNicCounterToFile_thread_func, &args) != 0) {
        perror("pthread_create failed");
        return 1;
    }

    pthread_join(monitor_thread, NULL);
    printf("Monitoring finished. Log written to counter_log.txt\n");
    return 0;
}
*/



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

	//////   For debug purposes...
		PTHREAD_DECL(RxLoggerDaemon);
		PTHREAD_CREATE(RxLoggerDaemon);
	

		PTHREAD_DECL(TxLoggerDaemon);
		PTHREAD_CREATE(TxLoggerDaemon);
	///////

	//-------------------------------------------------------------------------------------//
	//  First setup and check the free queue.
	//-------------------------------------------------------------------------------------//

	//-------------------------------------------------------------------------------------//
	// setup free queue in memory from the tb-side.
	//-------------------------------------------------------------------------------------//
	setUpEmptyQueueInMemory (free_queue_base_address, free_queue_lock_address, 
				free_queue_bget_address,       QUEUE_SIZE_IN_MSGS, QUEUE_MSG_SIZE_IN_BYTES);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf(stderr,"Info: setup empty free queue in memory.\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	// initialize lock to '0' in free-queue.
	releaseLock (free_queue_base_address);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf(stderr,"Info: cleared free queue locks.\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	setNumberOfMessages (free_queue_base_address, 0);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf(stderr,"Info: set num-messages = 0 in  free queue.\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	// confirm
	uint64_t b,l,g;
	// Set up the queues in the NIC
	setNicQueuePhysicalAddresses (0,0, FREEQUEUE,  free_queue_base_address,
							free_queue_lock_address, free_queue_bget_address); 
	getNicQueuePhysicalAddresses (0,0, FREEQUEUE,  &b, &l, &g);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: finished setting physical addresses of free queue into NIC \n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

#ifdef CHECK_QUEUES
	int cq_err = 0;
	cq_err = checkQueues(0);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueues(0) done (ret=%d)!\n", cq_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	if(cq_err)
	{
		fprintf(stderr,"Error: checkQueues(0) failed.\n");
		return(1);
	}

	int cqr_err = checkQueuesInReverse(0);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueuesInReverse(0) done (ret=%d)!\n", cqr_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	if(cqr_err)
	{
		fprintf(stderr,"Error: checkQueuesInReverse(0) failed.\n");
		return(1);
	}

#endif
	


	//-------------------------------------------------------------------------------------//
	//  Now setup the rx, tx queues.
	//-------------------------------------------------------------------------------------//

	//-------------------------------------------------------------------------------------//
	// setup rx, tx queues in memory!
	//-------------------------------------------------------------------------------------//
	setUpEmptyQueueInMemory (rx_queue_base_address,   rx_queue_lock_address,   
				rx_queue_bget_address,         QUEUE_SIZE_IN_MSGS, QUEUE_MSG_SIZE_IN_BYTES);
	setUpEmptyQueueInMemory (tx_queue_base_address,   rx_queue_lock_address,   
				tx_queue_bget_address,         QUEUE_SIZE_IN_MSGS, QUEUE_MSG_SIZE_IN_BYTES);



	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf(stderr,"Info: setup empty queues rx, tx in memory.\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	releaseLock (rx_queue_base_address);
	releaseLock (tx_queue_base_address);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf(stderr,"Info: cleared rx, tx queue locks.\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	// zero out the number of messages.
	setNumberOfMessages (rx_queue_base_address, 0);
	setNumberOfMessages (tx_queue_base_address, 0);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf(stderr,"Info: set num-messages = 0 in   rx, tx queues.\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");


	setNicQueuePhysicalAddresses (0,0, RXQUEUE,  rx_queue_base_address, rx_queue_lock_address, 
										rx_queue_bget_address);
	getNicQueuePhysicalAddresses (0,0, RXQUEUE,  &b, &l, &g);

	setNicQueuePhysicalAddresses (0,0, TXQUEUE,  tx_queue_base_address, tx_queue_lock_address, 
										tx_queue_bget_address);
	getNicQueuePhysicalAddresses (0,0, TXQUEUE,  &b, &l, &g);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: finished setting physical addresses of rx, tx, queues into NIC \n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

#ifdef CHECK_QUEUES
	cq_err = checkQueues(RXQUEUE);

	if(cq_err)
	{
		fprintf(stderr,"Error: checkQueues(%d) failed.\n", RXQUEUE);
		return(1);
	}

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueues(%d) done (ret=%d)!\n", RXQUEUE, cq_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	cqr_err = checkQueuesInReverse(RXQUEUE);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueuesInReverse(%d) done (ret=%d)!\n", RXQUEUE, cqr_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	if(cqr_err)
	{
		fprintf(stderr,"Error: checkQueuesInReverse(%d) failed.\n", RXQUEUE);
		return(1);
	}


	cq_err = checkQueues(TXQUEUE);

	if(cq_err)
	{
		fprintf(stderr,"Error: checkQueues(%d) failed.\n", TXQUEUE);
		return(1);
	}

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueues(%d) done (ret=%d)!\n", TXQUEUE, cq_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	cqr_err = checkQueuesInReverse(TXQUEUE);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueuesInReverse(%d) done (ret=%d)!\n", TXQUEUE, cqr_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	if(cqr_err)
	{
		fprintf(stderr,"Error: checkQueuesInReverse(%d) failed.\n", TXQUEUE);
		return(1);
	}

#endif
	
	int i;
	for(i = 0; i < NBUFFERS; i++)
	{
		//
		// Note: physical addresses of buffers are pushed into "FREEQUEUE".
		// 
		uint64_t max_addr_offset = 1016;
		max_addr_offset = (max_addr_offset << 48);
		processorAccessMemory (0, 0, 0xff, buffer_addresses[i], max_addr_offset); 

		pushIntoQueue (free_queue_base_address, buffer_addresses[i]);
	}
	
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: pushed %d buffers to free queue\n", NBUFFERS);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	// start the forwarding engine
	PTHREAD_DECL(forwardDaemon);
	PTHREAD_CREATE(forwardDaemon);
	
	// set the number of servers in the nic
	setNumberOfServersInNic(0,1);
	fprintf(stderr, "Number of servers set to: %d\n", getNumberOfServersInNic(0)); // Check if the value is correctly set
	//printNicRegisters(0); // Print just after setting the number of servers

	// Enable NIC, MAC
	//   start the receive and transmit daemons!
	writeNicControlRegister(0, 3);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: SPIN!\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	// Print register values after initialization
    	printNicRegisters(0);


	// Start the monitor thread	//Obsolete
    	//PTHREAD_DECL(monitorNicRegisters);
    	//PTHREAD_CREATE_PARAM(monitorNicRegisters, 0, 10); // Monitor for 10 seconds	
	
	
	pthread_t monitor_thread;
    	struct monitor_args args;
    	args.nic_id = 0; // Set your nic_id
    	args.monitor_duration_seconds = 10; // Set your monitoring duration

    	if (pthread_create(&monitor_thread, NULL, monitorNicRegisters_thread_func, &args) != 0) {
        	perror("pthread_create failed");
        	return 1;
    	}
	
	// start the RX, TX daemons.
	PTHREAD_DECL(packetTxDaemon);
	PTHREAD_DECL(packetRxDaemon);

	PTHREAD_CREATE(packetRxDaemon);
	PTHREAD_CREATE(packetTxDaemon);

	// wait to join.
	PTHREAD_JOIN(packetTxDaemon);
	PTHREAD_JOIN(packetRxDaemon);
	//PTHREAD_JOIN(monitorNicRegisters); // Obsolete
	pthread_join(monitor_thread, NULL);
	
	// Print register values before exiting
    	printNicRegisters(0);
	
	fprintf(stderr,"%s: completed %s\n", err_flag ? "Error" : "Info", err_flag ? "with error." : "");
	return(err_flag);
}

