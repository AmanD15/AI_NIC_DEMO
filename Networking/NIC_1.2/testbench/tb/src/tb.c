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


int packet_lengths[4] = {32, 37, 49, 64};

// 512 MB, 64K dwords
#define MEMSIZE (16*4096)
#define NSERVERS 1		// servers_enable (max = 4);	from server_id 0 to (max-1) 
#define NBUFFERS 4  		// for debug purposes, keep it 1, later 4 or 8 or ....

const int NIC_ID = 0;
const int FQ_SERVER_ID = 0;
const int INITIAL_STATUS = 0;

int number_of_packets = 4;

uint64_t  mem_array [16*4096];
int 	  err_flag = 0;


// buffers for packets
uint32_t  buffer_addresses[NBUFFERS];


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

void writeToNicReg (uint32_t nic_id, uint32_t reg_index, uint32_t reg_value)
{
	accessNicReg (0, nic_id, reg_index, reg_value);	
}

uint32_t readFromNicReg (uint32_t nic_id, uint32_t reg_index)
{
	uint32_t retval = accessNicReg (1, nic_id, reg_index, 0);	
	return(retval);
}


void     setNumberOfServersInNic (uint32_t nic_id, uint32_t number_of_servers_enabled)
{
	writeToNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX, number_of_servers_enabled);
}

uint32_t getNumberOfServersInNic (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_N_SERVERS_REGISTER_INDEX));
}


void     setNumberOfBuffersInQueue (uint32_t nic_id, uint32_t number_of_buffers)
{
	writeToNicReg (nic_id, P_N_BUFFERS_REGISTER_INDEX, number_of_buffers);
}

uint32_t getNumberOfBuffersInQueue (uint32_t nic_id)
{
	return(readFromNicReg (nic_id, P_N_BUFFERS_REGISTER_INDEX));
}


void     setStatusOfQueuesInNic (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t status_value)
{
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_STATUS_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;	
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: setStatusOfQueuesInNic reg_index=%d \n", reg_index);
#endif
	writeToNicReg (nic_id, reg_index, status_value);
}

uint32_t getStatusOfQueuesInNic (uint32_t nic_id, uint32_t server_id, uint32_t queue_type)
{
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_STATUS_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_STATUS_INDEX + (2*server_id)); break;		
	}
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: getStatusOfQueuesInNic reg_index=%d \n", reg_index);
#endif
	return(readFromNicReg (nic_id, reg_index));
}


// return 0 on successful acquire.
int acquireLock(uint32_t nic_id)
{
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered acquireLock\n");
#endif

	// get the lock value and 
	uint32_t val = readFromNicReg (nic_id, P_FREE_QUEUE_LOCK_INDEX);

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: acquireLock lock-value = 0x%x\n", val);
#endif

	if(val == 0x0)
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: acquireLock success.\n");
#endif
		return(0);
	}
	else 
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: acquireLock failure.\n");
#endif
	}
	return(1);
}

int releaseLock(uint32_t nic_id)
{
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered releaseLock\n");
#endif

	// write the lock value and unlock the memory.
	writeToNicReg (nic_id, P_FREE_QUEUE_LOCK_INDEX, 0);
#ifdef DEBUGPRINT
	fprintf(stderr,"Info: leaving releaseLock \n");
#endif
	return(0);
}


// return 0 on success
int pushIntoQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t push_value)
{
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_INDEX + (2*server_id)); break;	
	}

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered pushIntoQueue: push_value=0x%x reg_index=%d \n", push_value, reg_index);
#endif
	int ret_val = 1;
	
	uint32_t init_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t init_nentries = (init_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t init_push_status = (init_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t init_pop_status = init_status & 0xFF;             // Extract the least significant 8 bits
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: pushIntoQueue: before push: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					init_nentries, init_push_status, init_pop_status);
#endif

	writeToNicReg (nic_id, reg_index, push_value);

	uint32_t final_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t final_nentries = (init_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t final_push_status = (init_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t final_pop_status = init_status & 0xFF;             // Extract the least significant 8 bits
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: pushIntoQueue: after push: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					final_nentries, final_push_status, final_pop_status);
#endif

	if((init_nentries < final_nentries) && (final_push_status == 0))
	{
		ret_val = 0;
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: pushIntoQueue: Push Successful\n");
#endif
	}
	else
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: pushIntoQueue: Push Failed\n");
#endif	
	}

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: left pushIntoQueue returns %d \n", ret_val);
#endif
	return(ret_val);
}

// return 0 on success
int popFromQueue (uint32_t nic_id, uint32_t server_id, uint32_t queue_type, uint32_t* popped_value)
{
	uint32_t reg_index;
	switch(queue_type)
	{
		case FREEQUEUE     : reg_index = P_FREE_QUEUE_INDEX;    break;
		case RXQUEUE       : reg_index = (P_RX_QUEUE_0_INDEX + (2*server_id)); break;
		case TXQUEUE       : reg_index = (P_TX_QUEUE_0_INDEX + (2*server_id)); break;	
	}

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: entered popFromQueue reg_index=%d \n", reg_index);
#endif
	int ret_val = 1;
	
	uint32_t init_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t init_nentries = (init_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t init_push_status = (init_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t init_pop_status = init_status & 0xFF;             // Extract the least significant 8 bits
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: popFromQueue: before pop: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					init_nentries, init_push_status, init_pop_status);
#endif

	*popped_value = readFromNicReg (nic_id, reg_index);
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: popFromQueue: after pop: popped_value=0x%x.\n", *popped_value);
#endif

	uint32_t final_status = readFromNicReg (nic_id, reg_index + 1);
	uint16_t final_nentries = (init_status >> 16) & 0xFFFF;  // Extract the 16 most significant bits
    	uint8_t final_push_status = (init_status >> 8) & 0xFF;      // Extract the next 8 bits
    	uint8_t final_pop_status = init_status & 0xFF;             // Extract the least significant 8 bits
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: popFromQueue: after pop: nentries=%d, push_status=0x%x, pop_status=0x%x.\n",
					final_nentries, final_push_status, final_pop_status);
#endif

	if((init_nentries > final_nentries) && (final_pop_status == 0))
	{
		ret_val = 0;
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: popFromQueue: Pop Successful\n");
#endif
	}
	else
	{
#ifdef DEBUGPRINT
		fprintf(stderr,"Info: popFromQueue: Pop Failed\n");
#endif	
	}

#ifdef DEBUGPRINT
	fprintf(stderr,"Info: left popFromQueue returns %d \n", ret_val);
#endif
	return(ret_val);
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


// return 0 on success
int debugPushIntoQueue (uint32_t queue_type, uint32_t server_id, uint32_t val)
{
	uint64_t cmd = 
		(((uint64_t) queue_type) << 36) | 
			(((uint64_t) server_id) << 32) | val;
	write_uint64 ("debug_queue_command",  cmd);
	uint64_t ign = read_uint64 ("debug_queue_response");

	int ret_val = (ign != 0);

}

// return 0 on success
int debugPopFromQueue (uint32_t queue_type, uint32_t server_id, uint64_t* rval)
{
	uint64_t cmd = 
		(((uint64_t) 1) << 63) |
			(((uint64_t) queue_type) << 36) | 
			(((uint64_t) server_id) << 32);
	write_uint64 ("debug_queue_command",  cmd);
	*rval = read_uint64 ("debug_queue_response");

	return((*rval >> 63) != 0);
}

// return 0 on success
int checkQueues (uint32_t server_id, uint32_t queue_type)
{
	int err_flag =0;
	fprintf(stderr,"Info: checking queue %d.\n", queue_type);

	uint32_t I;
	for(I = 0; I < 16; I++)
	{
		//int p_not_ok = debugPushIntoQueue (queue_type, server_id, I);
		int p_not_ok = pushIntoQueue (NIC_ID, server_id, queue_type, I);
		if(p_not_ok)
		{
			fprintf(stderr,"Error: checkQueues %d: push not ok.\n", queue_type);
			err_flag = 1;
		}
	}

	fprintf(stderr,"Info: checkQueues: pushes done.\n");

	for(I = 0; I < 16; I++)
	{
		uint32_t J;
		int p_not_ok  = popFromQueue (NIC_ID, server_id, queue_type, &J);
		if(p_not_ok)
		{
			fprintf(stderr,"Error: checkQueues %d: pop not ok.\n", queue_type);
			err_flag = 1;
		}

		if (J != I)
		{
			fprintf(stderr,"Error: checkQueues %d: expected 0x%lx, received 0x%lx\n",
					queue_type, I, J);
			err_flag = 1;
		}
	}
	fprintf(stderr,"Info: checkQueues: pops done.\n");

	return(err_flag);
}

// return 0 on success
int checkQueuesInReverse (uint32_t server_id, uint32_t queue_type)
{
	int err_flag =0;
	fprintf(stderr,"Info: checking queue in reverse %d.\n", queue_type);
	
	uint32_t I;
	for(I = 0; I < NBUFFERS; I++)
	{	
		int p_not_ok = pushIntoQueue (NIC_ID, server_id, queue_type, I);
		if(p_not_ok)
		{
			fprintf(stderr,"Error: checkQueuesInReverse %d: push not ok.\n", queue_type);
			err_flag = 1;
		}
	}

	fprintf(stderr,"Info: checkQueuesInReverse: pushes done.\n");

	for(I = 0; I < NBUFFERS; I++)
	{
		uint64_t J;
		int p_not_ok  = debugPopFromQueue (queue_type, server_id, &J);
		if(p_not_ok)
		{
			fprintf(stderr,"Error: checkQueuesInReverse %d: pop not ok.\n", queue_type);
			err_flag = 1;
		}

		if ((uint64_t) J != I)
		{
			fprintf(stderr,"Error: checkQueuesInReverse %d: expected 0x%lx, received 0x%lx\n",
					queue_type, I, J);
			err_flag = 1;
		}
	}
	fprintf(stderr,"Info: checkQueuesInReverse: pops done.\n");

	return(err_flag);
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
	uint32_t server_id = 0;
	while(1)
	{
		uint32_t buf_addr;
		while (popFromQueue (NIC_ID, server_id, RXQUEUE, &buf_addr))
		{
			usleep (1000);
		}
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 
		fprintf(stderr,"forwardDaemon: popped from rxqueue, buf_addr=0x%x\n", buf_addr);
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 

		usleep(1000);

		while(pushIntoQueue  (NIC_ID, server_id, TXQUEUE, buf_addr))
		{
			usleep (1000);
		}
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 
		fprintf(stderr,"forwardDaemon: pushed to txqueue, buf_addr=0x%x\n", buf_addr);
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 

		usleep(1000);
		
		server_id = (server_id + 1) % NSERVERS;
	}
}
DEFINE_THREAD(forwardDaemon);



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

	/*   For debug purposes...
		PTHREAD_DECL(RxLoggerDaemon);
		PTHREAD_CREATE(RxLoggerDaemon);
	

		PTHREAD_DECL(TxLoggerDaemon);
		PTHREAD_CREATE(TxLoggerDaemon);
	*/

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: after memory daemon\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	// buffers for packets, each buffer has a capacity of 1024 bytes.
	int i;
	for (i = 0; i < NBUFFERS; i++) 
	{
        	buffer_addresses[i] = 1024 * (i + 1);  // Starting from 1024 and increasing by 1024
		fprintf (stderr,"Info: inside buffer allocation\n");
    	}
	
	fprintf (stderr,"Info: setting servers\n");
	// set the number of servers in the nic
	setNumberOfServersInNic(NIC_ID, NSERVERS);
	
	// get the number of servers in the nic
	getNumberOfServersInNic(NIC_ID);

	fprintf (stderr,"Info: setting buffers\n");
	// set the number of buffers in the queue
	setNumberOfBuffersInQueue(NIC_ID, NBUFFERS);
	
	// get the number of buffers in the queue
	getNumberOfBuffersInQueue(NIC_ID);
	
	fprintf (stderr,"Info: resetting status registers\n");
	// reset the free queue status registers
	getStatusOfQueuesInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE);
	setStatusOfQueuesInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE, INITIAL_STATUS);
	getStatusOfQueuesInNic (NIC_ID, FQ_SERVER_ID, FREEQUEUE);
	
	int s_id;
	for(s_id = 0; s_id < 4; s_id++)
	{
		getStatusOfQueuesInNic (NIC_ID, s_id, RXQUEUE);
		// reset the RX queue status registers for all 4 servers
		setStatusOfQueuesInNic (NIC_ID, s_id, RXQUEUE, INITIAL_STATUS);
		getStatusOfQueuesInNic (NIC_ID, s_id, RXQUEUE);
		getStatusOfQueuesInNic (NIC_ID, s_id, TXQUEUE);
		// reset the TX queue status registers for all 4 servers
		setStatusOfQueuesInNic (NIC_ID, s_id, TXQUEUE, INITIAL_STATUS);
		getStatusOfQueuesInNic (NIC_ID, s_id, TXQUEUE);
	}
	
	
#ifdef CHECK_QUEUES
	int cq_err, cqr_err = 0;
	/*
	cq_err = checkQueues(FQ_SERVER_ID, FREEQUEUE);
	if(cq_err)
	{
		fprintf(stderr,"Error: checkQueues(%d) failed.\n", FREEQUEUE);
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueues(%d) done (ret=%d)!\n", FREEQUEUE, cq_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	cqr_err = checkQueuesInReverse(FQ_SERVER_ID, FREEQUEUE);
	if(cqr_err)
	{
		fprintf(stderr,"Error: checkQueuesInReverse(%d) failed.\n", FREEQUEUE);
		return(1);
	}
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: checkQueuesInReverse(%d) done (ret=%d)!\n", FREEQUEUE, cqr_err);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	*/	
	
	for(s_id = 0; s_id < 4; s_id++)
	{
		cq_err = checkQueues(s_id, RXQUEUE);
		if(cq_err)
		{
			fprintf(stderr,"Error: checkQueues(%d) (server_id=%d) failed.\n", RXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueues(%d) (server_id=%d) done (ret=%d)!\n", RXQUEUE, s_id, cq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");

/*		cqr_err = checkQueuesInReverse(s_id, RXQUEUE);
		if(cqr_err)
		{
			fprintf(stderr,"Error: checkQueuesInReverse(%d) (server_id=%d) failed.\n", RXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueuesInReverse(%d) (server_id=%d) done (ret=%d)!\n", RXQUEUE, s_id, cqr_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
*/
		
		cq_err = checkQueues(s_id, TXQUEUE);
		if(cq_err)
		{
			fprintf(stderr,"Error: checkQueues(%d) (server_id=%d) failed.\n", TXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueues(%d) (server_id=%d) done (ret=%d)!\n", TXQUEUE, s_id, cq_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");

/*		cqr_err = checkQueuesInReverse(s_id, TXQUEUE);
		if(cqr_err)
		{
			fprintf(stderr,"Error: checkQueuesInReverse(%d) (server_id=%d) failed.\n", TXQUEUE, s_id);
			return(1);
		}
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
		fprintf (stderr,"Info: checkQueuesInReverse(%d) (server_id=%d) done (ret=%d)!\n", TXQUEUE, s_id, cqr_err);
		fprintf(stderr,"-------------------------------------------------------------------------------------\n");
*/
	}
#endif
	
	
	for(i = 0; i < NBUFFERS; i++)
	{
		//
		// Note: physical addresses of buffers are pushed into "FREEQUEUE".
		// 
		uint64_t max_addr_offset = 1016;
		max_addr_offset = (max_addr_offset << 48);
		processorAccessMemory (0, 0, 0xff, buffer_addresses[i], max_addr_offset); 
		
		int push_ok;
		do {
			while(acquireLock(NIC_ID)) 
			{
				usleep(1000);
			};
			push_ok = pushIntoQueue (NIC_ID, FQ_SERVER_ID, FREEQUEUE, buffer_addresses[i]);
			releaseLock (NIC_ID);
			usleep(1000);
		} while (push_ok);
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 
		fprintf(stderr,"forwardDaemon: pushed to free queue, buf_addr=0x%x\n", buffer_addresses[i]);
		fprintf(stderr,"//--------------------------------------------------------------------------------//\n"); 
	}
	
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: pushed %d buffers to free queue\n", NBUFFERS);
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	
	// start the forwarding engine
	PTHREAD_DECL(forwardDaemon);
	PTHREAD_CREATE(forwardDaemon);

	// Enable NIC, MAC and servers
	uint32_t control_value = ((((1 << NSERVERS) - 1) << 3) | 3);
	//   start the receive and transmit daemons!
	writeNicControlRegister(NIC_ID, control_value);

	fprintf(stderr,"-------------------------------------------------------------------------------------\n");
	fprintf (stderr,"Info: SPIN!\n");
	fprintf(stderr,"-------------------------------------------------------------------------------------\n");

	// start the RX, TX daemons.
	PTHREAD_DECL(packetTxDaemon);
	PTHREAD_DECL(packetRxDaemon);

	PTHREAD_CREATE(packetRxDaemon);
	PTHREAD_CREATE(packetTxDaemon);

	// wait to join.
	PTHREAD_JOIN(packetTxDaemon);
	PTHREAD_JOIN(packetRxDaemon);
	
	fprintf(stderr,"%s: completed %s\n", err_flag ? "Error" : "Info", err_flag ? "with error." : "");
	return(err_flag);
}

