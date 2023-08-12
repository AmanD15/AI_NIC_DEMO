

#define NUMBER_OF_LOCKS 8 // should be multiple of 8

//			64		80		8		8	
#define MEM_SIZE ((QUEUE_LENGTH*3) + (BUF_SIZE*NUM_OF_BUFFERS) + (2*NUMBER_OF_LOCKS) + 256) // 256 extra bytes
//			48		320				16		256
// 728
// 3 queues(free_q, tx_q, rx_q)
// and 16 buffers.
uint8_t memory_array[MEM_SIZE]; // 

// keep last 8*NUMBER_OF_LOCKS bytes for NUMBER_OF_LOCKS locks, 
//			i.e. last NUMBER_OF_LOCKS index of memory_array
//	memory_array[MEM_SIZE-NUMBER_OF_LOCKS] : memory_array[MEM_SIZE-1] 
//
//	mem_end-1	0xl0l1l2l3l4l5l6l7
//	mem_end 	0x0000000000000000 00
int lock_index = (MEM_SIZE - 2*NUMBER_OF_LOCKS); //2*
uint32_t reserve_lock()
{
	uint32_t lock_ptr = lock_index;
	lock_index += 1;
	fprintf(stderr,"lock_ptr = 0x%x\n", lock_ptr);
	return lock_ptr;
}

// access memory utility for reading as well as writing data
//	Output : 65 bit 
//	Input  : 110 bit
//		1. 1  bit lock
//		2. 1  bit rwbar
//		3. 8  bit byte_mask
//		4. 36 bit memory_address(will be converted to 36 bit inside function)
//		5. 64 bit wdata

// memory lock status, 
// 	index -> 
//		0 : cpu, 
//		1 : memory.


// reads 64 bits from memory for given address.
uint64_t read64(uint64_t addr)
{
	uint64_t rdata = 0;
	int i,k;	
	for(i =56 ; i>=0; i-=8 )
	{
		rdata = setSliceOfWord_64(rdata,i+7,i,memory_array[addr]);
		addr = addr + 1;
	}
	(DEBUG == 1) && fprintf(stderr,"****Reading Memory[%d] = 0x%08x ****\n",addr,rdata);

	for(k = 0; k < MEM_SIZE;k = k + 8)
	{
		(DEBUG == 1) && fprintf(stderr,"reading MEMORY contents[%d:%d] : "
			"0x%02x %02x %02x %02x %02x %02x %02x %02x\n",k,k+7,memory_array[k],memory_array[k+1],memory_array[k+2],
			memory_array[k+3],memory_array[k+4],memory_array[k+5],memory_array[k+6],memory_array[k+7]);
	}
	return rdata;
}
/*
uint64_t display_memory(uint64_t addr)
{

	uint64_t rdata = 0;
	int i;	
	for(i =56 ; i>=0; i =i - 8 )
	{
		rdata = setSliceOfWord_64(rdata,i+7,i,memory_array[addr]);
		//fprintf(stderr,"Loop Memory %d\n",memory_array[addr]);
		addr = addr + 1;
	}

	return rdata;
}*/

// writes 64 bits to memory.
void write64(uint64_t addr, uint64_t wval, uint8_t bmask)
{
	int j = 56;
	int i;
	for(i=7;i>=0;i--)
	{

		if(((bmask>>i)&0x1) == 1)
		{
			memory_array[addr] = getSliceFromWord(wval,j+7,j);
		}
			addr = addr + 1;
			j = j - 8;
	}
	uint64_t k;
	(DEBUG == 1) && fprintf(stderr,"****Written Memory[%d] = 0x%08x with bmsk = 0x%02x****\n",addr,wval,bmask);

	for(k = 0; k < MEM_SIZE;k = k + 8)
	{
		(DEBUG == 1) && fprintf(stderr,"writing MEMORY contents[%d:%d] : "
			"0x%02x %02x %02x %02x %02x %02x %02x %02x\n",k,k+7,memory_array[k],memory_array[k+1],memory_array[k+2],
			memory_array[k+3],memory_array[k+4],memory_array[k+5],memory_array[k+6],memory_array[k+7]);
	}
}

// for memory locking
//  index 0 for processor
//  index 1 for nic
int memory_lock_status[] = {0,0};

// mutex for memory array(access_memory function).
pthread_mutex_t mutex_memory_lock = PTHREAD_MUTEX_INITIALIZER;

pthread_mutex_t mutex_acb_mux = PTHREAD_MUTEX_INITIALIZER;

// reads/writes to memory
int accessMemory(uint8_t requester_id,
			uint8_t lock,
			uint8_t read_write_bar,
			uint8_t byte_mask,
			uint64_t addr,
			uint64_t wdata,
			uint64_t* rdata)
{
	int __error_flg = 0;
	// LOCK MUTEX
	pthread_mutex_lock(&mutex_memory_lock);
	// PERFORM MEMORY OPERATION
	if(memory_lock_status[0] || memory_lock_status[1])
	{
		// memory is locked.
		if(memory_lock_status[requester_id] == 1)
			if(lock == 0)
				// unlock memory.
				memory_lock_status[requester_id] = 0;
			
			else
				memory_lock_status[requester_id] = 1;
			
		else{
			(DEBUG == 1) && fprintf(stderr,"Memory locked for Requester = %d,accessing = 0x%x lock = %d,"
			" memory_lock_status[0] = %d, memory_lock_status[1] = %d\n",requester_id,addr,
			lock,memory_lock_status[0],memory_lock_status[1]);
			__error_flg = 1;
		}
	}
	// memory is unlocked but requester requetsed to lock.
	else if(lock == 1) 
		// lock the memory
		memory_lock_status[requester_id] = 1;
	// check if there was error due memory lock
	if(!__error_flg)
	{
		// no error due to memory locking
		if(read_write_bar)
		{
			// read data
			*(rdata) = read64(addr);
			(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [AccessMemory] : Read Data = 0x%lx. \n",*(rdata));
		}
		else 
		{	
			(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [AccessMemory] :Req_id:%d,"
					" Writing Data = 0x%lx,bmask = 0x%x Address = 0x%lx. \n",requester_id,wdata,byte_mask, addr);
					
			write64(addr,wdata,byte_mask);
			
			(DEBUG == 1) && fprintf(stderr,"CPU_THREAD [AccessMemory] : %d Address = %lx,"
					" Write Data = %lx, Memory Data = %lx, Byte Mask = %lx, Addr = %lx. \n",requester_id,
					addr,wdata,read64(72),byte_mask,addr);
		}
	}
	// UNLOCK MUTEX
	pthread_mutex_unlock(&mutex_memory_lock);
	return(__error_flg);
}


// reads request from pipes(corresping to requester_id)
void getReqFromTester(  uint8_t requester_id,
			uint8_t* lock,
			uint8_t* rwbar,
			uint8_t* bmask,
			uint32_t* addr,
			uint64_t* wdata)
{
	// pipes
	char req_pipe0[30], req_pipe1[30];
	sprintf(req_pipe0,"mem_req%d_pipe0",(int)requester_id);//64 bit wide
	sprintf(req_pipe1,"mem_req%d_pipe1",(int)requester_id);//64 bit wide	
	
	uint64_t req1;
	// read pipes
	*(wdata) = read_uint64(req_pipe0);
	req1 = read_uint64(req_pipe1);
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [getReqFromTester] : req_id=%d"
			" : Reading request from Tester. \n",requester_id);
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [getReqFromTester] : Req_id:%d"
			" req1 = %lx from pipe = %s\n",requester_id,req1,req_pipe1);
	*(lock)  = (req1 >> 45) & 0x01; 
	*(rwbar) = (req1 >> 44) & 0x01;
	*(addr) = (req1 & 0xffffffff8) ;
	*(bmask) = (req1 >> 36) & 0xff;
	(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [getReqFromTester] : Req_id:%d"
			" req1 = %lx\t wdata = 0x%lx,lock = %lx,rwbar = %lx, addr = %lx,"
			" bmask=%lx.\n",requester_id,req1,*(wdata),*(lock),*(rwbar),*(addr),*(bmask));

}

// sends response to pipes(corresping to requester_id)
void sendResponseToTester(uint8_t requester_id, uint8_t error, uint64_t rdata)
{	
	// pipes
	char resp_pipe0[30], resp_pipe1[30];
	sprintf(resp_pipe0,"mem_resp%d_pipe0",(int)requester_id);// 64 bit wide
	sprintf(resp_pipe1,"mem_resp%d_pipe1",(int)requester_id);//  8 bit wide

	write_uint64(resp_pipe0,rdata);
	write_uint8(resp_pipe1,error); // Changed
}

// this function reads request, performs memory operation and then sends responce. 
void memoryServiceModel(uint8_t requester_id)
{
	uint8_t lock_tester,rwbar_tester,bmask_tester;
	uint64_t wdata_tester, rdata;
	uint32_t addr_tester;

	while(1)
	{

		uint8_t status = 1; 
		// reads request from pipes
		getReqFromTester(requester_id,&lock_tester,&rwbar_tester,&bmask_tester,&addr_tester,&wdata_tester);
		// read/write from/to memory.
		(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [MemoryServiceModel] :  %d,"
				"  %d, %d, 0x%lx, 0x%lx, 0x%lx. \n",requester_id,lock_tester,
				rwbar_tester,bmask_tester,addr_tester,wdata_tester);
				
		status = accessMemory(requester_id,lock_tester,rwbar_tester,bmask_tester,addr_tester,wdata_tester,&rdata);
		// write response
		sendResponseToTester(requester_id,status,rdata);
		(DEBUG == 1) && fprintf(stderr, "CPU_THREAD [MemoryServiceModel] : Sending Response % d \n",requester_id);
	}
}

// this daemon will serve memory requests from nic.
void nicMemoryServiceDaemon()
{
	uint8_t nic_id = 1;
	memoryServiceModel(nic_id);
}DEFINE_THREAD(nicMemoryServiceDaemon);

// this daemon will serve memory requests from cpu.
void cpuMemoryServiceDaemon()
{

	uint8_t cpu_id = 0;
	uint64_t i;
	(DEBUG == 0) && fprintf(stderr, "Queue_length = %d for Num. of buffers = %d\n",QUEUE_LENGTH,NUM_OF_BUFFERS);
	(DEBUG == 0) && fprintf(stderr, "Rx_Queue = %d, Tx_QUEUE = %d,Buffers= %d\t%d\t%d\n",RX_QUEUE,TX_QUEUE,BUF_0,BUF_1,BUF_2);
	for(i = 0; i < MEM_SIZE; i++ )
	{
		memory_array[i] = 0;
	}
	memoryServiceModel(cpu_id);
}DEFINE_THREAD(cpuMemoryServiceDaemon);

