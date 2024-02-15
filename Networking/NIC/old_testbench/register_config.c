// register_config.c :
// AFB Bus -> AFB_NIC_REQUEST       AFB_NIC_RESPONSE
// No error in configuring the register is indicated by MSB 0 in response

// Need to populate atleast 7 registers

#define NUMBER_OF_SERVERS 1
#define NUMBER_OF_REGISTERS_TO_WRITE 5

// to get slice of word when upper and lower index is given.
uint64_t getSliceFromWord (uint64_t word, uint8_t high, uint8_t low)
{
	word = word << (63 - high); // First remove extra bits in MSB 
	word = word >> ((63 - high) + low); // Then remove extra bits in LSB
	return word;
}

// to set slice of word(32 bit wide) when upper and lower index is given
uint32_t setSliceOfWord_32(uint32_t word, uint8_t high, uint8_t low, uint32_t wval)
{
	uint32_t word_mask = -1;
	word_mask = word_mask >> (31 - high + low);
	wval = wval & word_mask;
	wval = wval << low;

	word_mask = word_mask <<low;
	word = word & (~word_mask);
	word = word | wval;
	return word;
}

// to set slice of word(64 bit wide) when upper and lower index is given
uint64_t setSliceOfWord_64 (uint64_t word, uint8_t high, uint8_t low, uint64_t wval)
{

	uint64_t word_mask = -1;
	word_mask = word_mask >> (63 - high + low);
	wval = wval & word_mask;
	wval = wval << low;

	word_mask = word_mask <<low;
	word = word & (~word_mask);
	word = word | wval;
	return word;

}

// configures the nic registers.
void register_config (uint64_t RX_Q_0_ADDRESS,uint64_t TX_Q_0_ADDRESS , uint64_t FREE_Q_ADDRESS )
{
	uint32_t write_data;
	uint64_t register_address;
	uint64_t byte_mask;
	uint64_t rw_lock;
	uint64_t response_word;
	
	fprintf(stderr,"REG_CONFIG: Started\n");

// Control word_0 contains lower 32 bit write data
// Control word_1 contains all other information -> bmask, address, rwbar etc..
	uint32_t control_word_0 [NUMBER_OF_REGISTERS_TO_WRITE];
	uint64_t control_word_1 [NUMBER_OF_REGISTERS_TO_WRITE];

	//uint64_t register_addresses_array [] = {1,2,10,18,0};
	uint64_t register_addresses_array [] = {0x0004,0x0008,0x0028,0x0048,0x0000};
	uint32_t write_data_array[] =			
			{NUMBER_OF_SERVERS,RX_Q_0_ADDRESS,TX_Q_0_ADDRESS,FREE_Q_ADDRESS,1};
			//{NUMBER_OF_SERVERS,RX_Q_0_ADDRESS>>4,TX_Q_0_ADDRESS>>4,FREE_Q_ADDRESS>>4,1};


	int i;
	// Populate Control_word to send
	for(i = 0; i<NUMBER_OF_REGISTERS_TO_WRITE ; i++)
	{
		write_data = write_data_array[i];
		control_word_0[i] = write_data;

		// Set Address 
		register_address = register_addresses_array[i];
		control_word_1[i] = setSliceOfWord_64(control_word_1[i],35,0,register_address);

		// Set Byte Mask
		byte_mask = 15; // 1111
		control_word_1[i] = setSliceOfWord_64(control_word_1[i],39,36,byte_mask);

		// Set Read Write-Bar and Lock bit
		rw_lock = 0; // 01
		control_word_1[i] = setSliceOfWord_64(control_word_1[i],41,40,rw_lock);

		// Organised as control_word_1...control_word_0

		// Send Data to Pipe --> Aa module will concatenate the bits to generate 74-bit
		// response
		(DEBUG == 1) && fprintf(stderr,"REG_CONFIG: Requesting to write control word to nic %lx, %lx\n",control_word_0[i],control_word_1[i]);

		write_uint32("control_word_request_pipe_0",control_word_0[i]);
		write_uint64("control_word_request_pipe_1",control_word_1[i]);

		// Wait for response -> Since for every request there will be a response

		response_word = read_uint64("control_word_response_pipe");

	}
	fprintf(stderr,"REG_CONFIG: All requests sent\n");
}

void readNicReg()
{
	int i;
	uint32_t wdata = 0;
	uint64_t req =0;
	req =  setSliceOfWord_64(req,41,40,1);
	uint64_t addr = 0;
	uint64_t response_word;
	for(i = 0; i < 64; i++)
	{
		addr = i*4;
		req = setSliceOfWord_64(req,35,0,addr);
		write_uint32("control_word_request_pipe_0",wdata);
		write_uint64("control_word_request_pipe_1",req);
	
		response_word = read_uint64("control_word_response_pipe");
		response_word = setSliceOfWord_64(response_word,32,31,0);
		fprintf(stderr,"NIC_REG[%d] = 0x%lx\n",i,response_word);	
	}
}
void writeNicReg()
{
	int i;
	uint32_t wdata = 0;
	uint64_t req =0;
	req =  setSliceOfWord_64(req,41,40,0);
	req =  setSliceOfWord_64(req,39,36,15);
	uint64_t addr = 0;
	uint64_t response_word;
	for(i = 0; i < 64; i++)
	{
		addr = i*4;
		wdata = i;
		req = setSliceOfWord_64(req,35,0,addr);
		write_uint32("control_word_request_pipe_0",wdata);
		write_uint64("control_word_request_pipe_1",req);
	
		response_word = read_uint64("control_word_response_pipe");
	}
	fprintf(stderr,"Writing Nic regs complete.\n");	
}
