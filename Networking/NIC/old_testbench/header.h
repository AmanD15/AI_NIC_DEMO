#include "InterfaceDataStructures_Utils.h"

int MAC_ENABLE = 0;


void register_pipes(void);

// configuration of nic registers.
void register_config (uint64_t, uint64_t, uint64_t );

// MAC functions.
//---------------
//  pushes packet to nic.
void macToNicData(void);

// pulls packet from nic.
void nicToMacData(void);

// Processor function.
//----------------------
//	models the cpu.
void cpu_model();


// to register all necessary pipes.
void register_pipes()
{
	// mac <-> nic interface
	register_pipe("mac_to_nic_data_0",2,64,PIPE_FIFO_MODE);
	register_pipe("mac_to_nic_data_1",2,16,PIPE_FIFO_MODE);
	register_pipe("nic_to_mac_data_0",2,64,PIPE_FIFO_MODE);
	register_pipe("nic_to_mac_data_1",2,16,PIPE_FIFO_MODE);
	
	// processor <-> nic inteface
	register_pipe("control_word_request_pipe_0",2,32,PIPE_FIFO_MODE);
	register_pipe("control_word_request_pipe_1",2,64,PIPE_FIFO_MODE);
	register_pipe("control_word_responce_pipe",2,64,PIPE_FIFO_MODE);

	// memory <-> nic interface
	
	register_pipe("mem_req0_pipe0",2,64,PIPE_FIFO_MODE);
	register_pipe("mem_req0_pipe1",2, 8,PIPE_FIFO_MODE);
	register_pipe("mem_resp0_pipe0",2,64,PIPE_FIFO_MODE);
	register_pipe("mem_resp0_pipe1",2, 8,PIPE_FIFO_MODE);
	
	// Processor <-> memory interface
	register_pipe("mem_req1_pipe0",2,64,PIPE_FIFO_MODE);
	register_pipe("mem_req1_pipe1",2, 8,PIPE_FIFO_MODE);
	register_pipe("mem_resp1_pipe0",2,64,PIPE_FIFO_MODE);
	register_pipe("mem_resp1_pipe1",2, 8,PIPE_FIFO_MODE);
}
