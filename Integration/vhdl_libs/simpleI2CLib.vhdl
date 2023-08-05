library ieee;
use ieee.std_logic_1164.all;


package i2cBaseComponents is
  component i2c_master IS
  --
  -- MPD: pass the divider as a signal to the design.
  --
  -- GENERIC(
    -- input_clk : INTEGER := 50_000_000; --input clock speed from user logic in Hz
    -- bus_clk   : INTEGER := 400_000);   --speed the i2c bus (scl) will run at in Hz

  PORT(
    clock_divide_count   : IN integer;
    clk       : IN     STD_LOGIC;                    --system clock
    reset_n   : IN     STD_LOGIC;                    --active low reset
    ena       : IN     STD_LOGIC;                    --latch in command
    addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
    rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
    data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
    busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
    data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
    ack_error : BUFFER STD_LOGIC;                    --flag if improper acknowledge from slave
    sda_in    : in  STD_LOGIC;                  
    sda_pull_down : out STD_LOGIC;
    scl_in    : in std_logic;
    scl_pull_down : out std_logic);
  END component;

  component afb_i2c_master is
	port (
		AFB_BUS_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
      		AFB_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      		AFB_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      		AFB_BUS_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
      		AFB_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      		AFB_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    		sda_pull_down       : out  std_logic_vector(0 downto 0);
    		sda_in       	    : in  std_logic_vector(0 downto 0);
    		scl_pull_down       : out std_logic_vector(0 downto 0);
    		scl_in       	    : in  std_logic_vector(0 downto 0);
		clk, reset: in std_logic
		);
   end component;
   component I2CSLAVEMEM is
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		SCL_IN		: in	std_logic;
		SDA_IN		: in	std_logic;
		SCL_OUT		: out	std_logic;
		SDA_OUT		: out	std_logic
	);
   end component;
   component I2CSLAVE is
	generic(
		DEVICE 		: std_logic_vector(7 downto 0) := x"38"
	);
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		SDA_IN		: in	std_logic;
		SCL_IN		: in	std_logic;
		SDA_OUT		: out	std_logic;
		SCL_OUT		: out	std_logic;
		ADDRESS		: out	std_logic_vector(7 downto 0);
		DATA_OUT	: out	std_logic_vector(7 downto 0);
		DATA_IN		: in	std_logic_vector(7 downto 0);
		WR			: out	std_logic;
		RD			: out	std_logic;
        	READ_DONE   : out   std_logic
	);
   end component;
   component sp256x8 is
	port(
		address		: in	std_logic_vector(7 downto 0);
		clk		: in	std_logic;
		reset		: in    std_logic;
		data		: in	std_logic_vector(7 downto 0);
		wren		: in	std_logic;
		q		    : out	std_logic_vector(7 downto 0)
	);
   end component;
end package i2cBaseComponents;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--
--   FileName:         i2c_master.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 13.1 Build 162 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 11/01/2012 Scott Larson
--     Initial Public Release
--   Version 2.0 06/20/2014 Scott Larson
--     Added ability to interface with different slaves in the same transaction
--     Corrected ack_error bug where ack_error went 'Z' instead of '1' on error
--     Corrected timing of when ack_error signal clears
--   Version 2.1 10/21/2014 Scott Larson
--     Replaced gated clock with clock enable
--     Adjusted timing of SCL during start and stop conditions
--   Version 2.2 02/05/2015 Scott Larson
--     Corrected small SDA glitch introduced in version 2.1
-- 
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY i2c_master IS
  --
  -- MPD: pass the divider as a signal to the design.
  --
  -- GENERIC(
    -- input_clk : INTEGER := 50_000_000; --input clock speed from user logic in Hz
    -- bus_clk   : INTEGER := 400_000);   --speed the i2c bus (scl) will run at in Hz
    -- clock divide count is (input_clk/bus_clk)*4

  -- MPD removed the tristates and made all I/O's unidirectional...

  PORT(
     -- CONSTANT divider  :  INTEGER := (input_clk/bus_clk)/4; --number of clocks in 1/4 cycle of scl
    clock_divide_count   : IN integer;
    clk       : IN     STD_LOGIC;                    --system clock
    reset_n   : IN     STD_LOGIC;                    --active low reset
    ena       : IN     STD_LOGIC;                    --latch in command
    addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
    rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
    data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
    busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
    data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
    ack_error : BUFFER STD_LOGIC;                    --flag if improper acknowledge from slave
    -- unidirectionals here.. make them bidirectionals at a higher layer.
    sda_in    : in  STD_LOGIC;                  
    sda_pull_down : out STD_LOGIC;
    scl_in    : in std_logic;
    scl_pull_down : out std_logic
   );                   --serial clock output of i2c bus
END i2c_master;

ARCHITECTURE logic OF i2c_master IS

  -- CONSTANT divider  :  INTEGER := (input_clk/bus_clk)/4; --number of clocks in 1/4 cycle of scl
  signal   cdivX4, cdivX2, cdivX3: integer;

  TYPE machine IS(ready, start, command, slv_ack1, wr, rd, slv_ack2, mstr_ack, stop); --needed states

  SIGNAL state         : machine;                        --state machine
  SIGNAL data_clk      : STD_LOGIC;                      --data clock for sda
  SIGNAL data_clk_prev : STD_LOGIC;                      --data clock during previous system clock
  SIGNAL scl_clk       : STD_LOGIC;                      --constantly running internal scl
  SIGNAL scl_ena       : STD_LOGIC := '0';               --enables internal scl to output
  SIGNAL sda_int       : STD_LOGIC := '1';               --internal sda
  SIGNAL sda_ena_n     : STD_LOGIC;                      --enables internal sda to output
  SIGNAL addr_rw       : STD_LOGIC_VECTOR(7 DOWNTO 0);   --latched in address and read/write
  SIGNAL data_tx       : STD_LOGIC_VECTOR(7 DOWNTO 0);   --latched in data to write to slave
  SIGNAL data_rx       : STD_LOGIC_VECTOR(7 DOWNTO 0);   --data received from slave
  SIGNAL bit_cnt       : INTEGER RANGE 0 TO 7 := 7;      --tracks bit number in transaction
  SIGNAL stretch       : STD_LOGIC := '0';               --identifies if slave is stretching scl

  signal sda, scl, sda_pull_down_sig, scl_pull_down_sig: std_logic;
  signal COUNT_SIG: integer;

BEGIN

  cdivX4 <= clock_divide_count*4;
  cdivX2 <= clock_divide_count*2;
  cdivX3 <= (cdivX2 + clock_divide_count);

  --generate the timing for the bus clock (scl_clk) and the data clock (data_clk)
  PROCESS(clk, reset_n)
    VARIABLE count  :  INTEGER RANGE 0 TO 1023;  --timing for clock generation
  BEGIN
    COUNT_SIG <= COUNT;
    IF(reset_n = '0') THEN                --reset asserted
      stretch <= '0';
      count := 0;
    ELSIF(clk'EVENT AND clk = '1') THEN
      data_clk_prev <= data_clk;          --store previous value of data clock
      IF(count = cdivX4-1) THEN           --end of timing cycle
        count := 0;                       --reset timer
      ELSIF(stretch = '0') THEN           --clock stretching from slave not detected
        count := count + 1;               --continue clock generation timing
      END IF;
      if (COUNT < clock_divide_count) then --first 1/4 cycle of clocking
          scl_clk <= '0';
          data_clk <= '0';
      elsif (COUNT < cdivX2) then      	   --second 1/4 cycle of clocking
          scl_clk <= '0';
          data_clk <= '1';
      elsif (COUNT < cdivX3)  then  	   --third 1/4 cycle of clocking
          scl_clk <= '1';                 --release scl
          IF(scl = '0') THEN              --detect if slave is stretching clock
            stretch <= '1';
          ELSE
            stretch <= '0';
          END IF;
          data_clk <= '1';
      else
          scl_clk <= '1';
          data_clk <= '0';
      end if;
    END IF;
  END PROCESS;

  --state machine and writing to sda during scl low (data_clk rising edge)
  PROCESS(clk, reset_n)
  BEGIN
    IF(clk'EVENT AND clk = '1') THEN
      IF(reset_n = '0') THEN                 --reset asserted
        state <= ready;                      --return to initial state
        busy <= '1';                         --indicate not available
        scl_ena <= '0';                      --sets scl high impedance
        sda_int <= '1';                      --sets sda high impedance
        ack_error <= '0';                    --clear acknowledge error flag
        bit_cnt <= 7;                        --restarts data bit counter
        data_rd <= "00000000";               --clear data read port
      ELSE
        IF(data_clk = '1' AND data_clk_prev = '0') THEN  --data clock rising edge
          CASE state IS
            WHEN ready =>                      --idle state
              IF(ena = '1') THEN               --transaction requested
                busy <= '1';                   --flag busy
                addr_rw <= addr & rw;          --collect requested slave address and command
                data_tx <= data_wr;            --collect requested data to write
                state <= start;                --go to start bit
              ELSE                             --remain idle
                busy <= '0';                   --unflag busy
                state <= ready;                --remain idle
              END IF;
            WHEN start =>                      --start bit of transaction
              busy <= '1';                     --resume busy if continuous mode
              sda_int <= addr_rw(bit_cnt);     --set first address bit to bus
              state <= command;                --go to command
            WHEN command =>                    --address and command byte of transaction
              IF(bit_cnt = 0) THEN             --command transmit finished
                sda_int <= '1';                --release sda for slave acknowledge
                bit_cnt <= 7;                  --reset bit counter for "byte" states
                state <= slv_ack1;             --go to slave acknowledge (command)
              ELSE                             --next clock cycle of command state
                bit_cnt <= bit_cnt - 1;        --keep track of transaction bits
                sda_int <= addr_rw(bit_cnt-1); --write address/command bit to bus
                state <= command;              --continue with command
              END IF;
            WHEN slv_ack1 =>                   --slave acknowledge bit (command)
              IF(addr_rw(0) = '0') THEN        --write command
                sda_int <= data_tx(bit_cnt);   --write first bit of data
                state <= wr;                   --go to write byte
              ELSE                             --read command
                sda_int <= '1';                --release sda from incoming data
                state <= rd;                   --go to read byte
              END IF;
            WHEN wr =>                         --write byte of transaction
              busy <= '1';                     --resume busy if continuous mode
              IF(bit_cnt = 0) THEN             --write byte transmit finished
                sda_int <= '1';                --release sda for slave acknowledge
                bit_cnt <= 7;                  --reset bit counter for "byte" states
                state <= slv_ack2;             --go to slave acknowledge (write)
              ELSE                             --next clock cycle of write state
                bit_cnt <= bit_cnt - 1;        --keep track of transaction bits
                sda_int <= data_tx(bit_cnt-1); --write next bit to bus
                state <= wr;                   --continue writing
              END IF;
            WHEN rd =>                         --read byte of transaction
              busy <= '1';                     --resume busy if continuous mode
              IF(bit_cnt = 0) THEN             --read byte receive finished
                IF(ena = '1' AND addr_rw = addr & rw) THEN  --continuing with another read at same address
                  sda_int <= '0';              --acknowledge the byte has been received
                ELSE                           --stopping or continuing with a write
                  sda_int <= '1';              --send a no-acknowledge (before stop or repeated start)
                END IF;
                bit_cnt <= 7;                  --reset bit counter for "byte" states
                data_rd <= data_rx;            --output received data
                state <= mstr_ack;             --go to master acknowledge
              ELSE                             --next clock cycle of read state
                bit_cnt <= bit_cnt - 1;        --keep track of transaction bits
                state <= rd;                   --continue reading
              END IF;
            WHEN slv_ack2 =>                   --slave acknowledge bit (write)
              IF(ena = '1') THEN               --continue transaction
                busy <= '0';                   --continue is accepted
                addr_rw <= addr & rw;          --collect requested slave address and command
                data_tx <= data_wr;            --collect requested data to write
                IF(addr_rw = addr & rw) THEN   --continue transaction with another write
                  sda_int <= data_wr(bit_cnt); --write first bit of data
                  state <= wr;                 --go to write byte
                ELSE                           --continue transaction with a read or new slave
                  state <= start;              --go to repeated start
                END IF;
              ELSE                             --complete transaction
                state <= stop;                 --go to stop bit
              END IF;
            WHEN mstr_ack =>                   --master acknowledge bit after a read
              IF(ena = '1') THEN               --continue transaction
                busy <= '0';                   --continue is accepted and data received is available on bus
                addr_rw <= addr & rw;          --collect requested slave address and command
                data_tx <= data_wr;            --collect requested data to write
                IF(addr_rw = addr & rw) THEN   --continue transaction with another read
                  sda_int <= '1';              --release sda from incoming data
                  state <= rd;                 --go to read byte
                ELSE                           --continue transaction with a write or new slave
                  state <= start;              --repeated start
                END IF;    
              ELSE                             --complete transaction
                state <= stop;                 --go to stop bit
              END IF;
            WHEN stop =>                       --stop bit of transaction
              busy <= '0';                     --unflag busy
              state <= ready;                  --go to idle state
          END CASE;    
        ELSIF(data_clk = '0' AND data_clk_prev = '1') THEN  --data clock falling edge
          CASE state IS
            WHEN start =>                  
              IF(scl_ena = '0') THEN                  --starting new transaction
                scl_ena <= '1';                       --enable scl output
                ack_error <= '0';                     --reset acknowledge error output
              END IF;
            WHEN slv_ack1 =>                          --receiving slave acknowledge (command)
              IF(sda /= '0' OR ack_error = '1') THEN  --no-acknowledge or previous no-acknowledge
                ack_error <= '1';                     --set error output if no-acknowledge
              END IF;
            WHEN rd =>                                --receiving slave data
              data_rx(bit_cnt) <= sda;                --receive current slave data bit
            WHEN slv_ack2 =>                          --receiving slave acknowledge (write)
              IF(sda /= '0' OR ack_error = '1') THEN  --no-acknowledge or previous no-acknowledge
                ack_error <= '1';                     --set error output if no-acknowledge
              END IF;
            WHEN stop =>
              scl_ena <= '0';                         --disable scl
            WHEN OTHERS =>
              NULL;
          END CASE;
        END IF;
      END IF;
    END IF;
  END PROCESS;  

  --set sda output
  WITH state SELECT
    sda_ena_n <= data_clk_prev WHEN start,     --generate start condition
                 NOT data_clk_prev WHEN stop,  --generate stop condition
                 sda_int WHEN OTHERS;          --set to internal sda signal    
      
  -- pull downs.
  scl_pull_down_sig <= scl_ena and (not scl_clk);
  sda_pull_down_sig <= (not sda_ena_n);

  -- ports.
  scl_pull_down <= scl_pull_down_sig;
  sda_pull_down <= sda_pull_down_sig;

  -- resolved signals used inside the design..
  scl <= scl_in;
  sda <= sda_in;

  
END logic;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library simpleI2CLib;
use simpleI2CLib.i2cBaseComponents.all;

-- An interface from the AFB bus (AJIT peripheral bus) to
-- the i2c_master..  

-- There are two registers in the i2c.
--                addr 
--     register 0  0x0  [31:0] = clock divider count.
--     register 1  0x4  [31:0] = command register
--            command format:  
--                             [31]    rwbar
--                             [30:29] write-mask 
--					[30] if set send register address
--                                      [29] if set send write data.
--                             [28:22] unused
--                             [22:16] device address
--                             [15:8]  register address in device.
--                             [7:0]   write data byte.
--     register 2  0x8  response register.
--            response format: [31:11] unused
--                             [10]  ready
--                             [9]   ack-error
--                             [8]   busy
--                             [7:0] read data
-- 
entity afb_i2c_master is
	port (
		AFB_BUS_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
      		AFB_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      		AFB_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      		AFB_BUS_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
      		AFB_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      		AFB_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    		sda_pull_down       : out  std_logic_vector(0 downto 0);
    		sda_in       	    : in  std_logic_vector(0 downto 0);
    		scl_pull_down       : out std_logic_vector(0 downto 0);
    		scl_in       	    : in  std_logic_vector(0 downto 0);
		clk, reset: in std_logic
		);
end entity afb_i2c_master;

architecture MixedBeh of afb_i2c_master is
	signal reset_n: std_logic;

	signal i2cm_device_addr: std_logic_vector(6 downto 0);
	signal i2cm_register_addr: std_logic_vector(7 downto 0);
	signal i2cm_active_wdata: std_logic_vector(7 downto 0);
	signal i2cm_send_addr : boolean;
	signal i2cm_send_wdata: boolean;

	signal i2cm_rdata, i2cm_rdata_reg,  i2cm_wdata: std_logic_vector(7 downto 0);
	signal i2cm_ena, i2cm_rwbar, i2cm_busy, i2cm_ack_error: std_logic;
	signal i2cm_active_rwbar: std_logic;
	
	signal latch_i2cm_clock_divide_count: boolean;
	signal latch_i2cm_rdata: boolean;

	type AfbFsmState is (AFB_IDLE, AFB_WAIT);
	signal afb_fsm_state: AfbFsmState;


	signal afb_command_available, afb_ready_for_response  : boolean;
	signal afb_write_bar, afb_write_bar_reg: std_logic;
	signal afb_clock_divide_count: unsigned(30 downto 0);
	signal reg_id, reg_id_reg: unsigned(1 downto 0);
	signal afb_address: std_logic_vector(35 downto 0);
	signal afb_wdata: std_logic_vector(31 downto 0);
	signal update_regs: boolean;
	signal afb_exec: boolean;

	type RunFsmState is (IDLE, I2CM_ADDRESS_CYCLE, I2CM_ADDRESS_CYCLE_COMPLETE,
					I2CM_RDATA_CYCLE, I2CM_RDATA_CYCLE_COMPLETE,
					I2CM_WDATA_CYCLE, I2CM_WDATA_CYCLE_COMPLETE);
	signal fsm_state: RunFsmState;

	signal clock_divide_count_register: integer;
	signal command_register: std_logic_vector(31 downto 0);
	signal status_register: std_logic_vector(31 downto 0);

	signal command_counter: std_logic_vector(15 downto 0);
	signal start_command: boolean;
	signal i2cm_command, i2cm_command_reg: std_logic_vector(31 downto 0);


	constant Z32: std_logic_vector(31 downto 0) := (others => '0');

begin
	-------------------------------------------------------------------------------
	-- AFB side 
	-------------------------------------------------------------------------------

	afb_command_available <= (AFB_BUS_REQUEST_PIPE_write_req(0) = '1');
	afb_ready_for_response <= (AFB_BUS_RESPONSE_pipe_read_req(0) = '1');
	afb_address <= AFB_BUS_REQUEST_PIPE_write_data(67 downto 32);
	afb_wdata <= AFB_BUS_REQUEST_PIPE_write_data(31 downto 0);
	afb_write_bar <= AFB_BUS_REQUEST_PIPE_write_data(72);
	reg_id <= unsigned(afb_address(3 downto 2));


	-- AFB state machine.
	process(clk, reset, 
			afb_fsm_state, 
			afb_command_available, 
			afb_ready_for_response,
			afb_write_bar, 
			reg_id)
		variable next_fsm_state_var: AfbFsmState;
		variable req_ack_var: std_logic;
		variable resp_ack_var: std_logic;
		variable update_regs_var: boolean;
		variable start_command_var : boolean;
		variable next_command_counter_var : integer range 0 to (2**16)-1;
		variable next_afb_write_bar_reg_var: std_logic;
		variable next_reg_id_reg_var: unsigned(1 downto 0);
		variable afb_exec_var : boolean;
	begin
		next_fsm_state_var := afb_fsm_state;

		req_ack_var := '0'; 
		resp_ack_var := '0';

		afb_exec_var := false;
		update_regs_var := false;
		start_command_var := false;

		next_afb_write_bar_reg_var := afb_write_bar_reg;
		next_reg_id_reg_var := reg_id_reg;
		
		case afb_fsm_state is 
			when AFB_IDLE =>
				req_ack_var := '1';
				if(afb_command_available) then
					next_reg_id_reg_var := reg_id;
					afb_exec_var := true;
					if(afb_write_bar = '0') then
						update_regs_var := true;
						if(reg_id = "01") then
							start_command_var := true;
						end if;
					end if;
					next_fsm_state_var := AFB_WAIT;
				end if;
			when AFB_WAIT => 
				resp_ack_var := '1';
				if(afb_ready_for_response) then
					next_fsm_state_var := AFB_IDLE;
				end if;
		end case;

		AFB_BUS_REQUEST_pipe_write_ack(0) <= req_ack_var;
		AFB_BUS_RESPONSE_pipe_read_ack(0) <= resp_ack_var;
		start_command <= start_command_var;
		update_regs <= update_regs_var;
		afb_exec <= afb_exec_var;


		if(clk'event and (clk = '1') ) then
			if(reset = '1') then
				afb_fsm_state <= AFB_IDLE;
				afb_write_bar_reg <= '0';
				reg_id_reg <= "00";
			else
				afb_fsm_state <= next_fsm_state_var;
				afb_write_bar_reg <= next_afb_write_bar_reg_var;
				reg_id_reg <= next_reg_id_reg_var;
			end if;
		end if;
	end process;

	process(clk, reset, fsm_state,  update_regs, afb_exec, afb_wdata, reg_id, status_register)
	begin
		if(clk'event and (clk = '1')) then
			if(reset = '1') then
				clock_divide_count_register <= 256;
				command_register <= (others => '0');
				status_register  <= (others => '0');
			else 
				if (update_regs) then
				    if(afb_write_bar = '0') then
					if(reg_id = "00") then
						clock_divide_count_register <= to_integer(unsigned(afb_wdata)); 
					elsif (reg_id = "01") then
						command_register <= afb_wdata;
					end if;
				    end if;
				end if;
				
				-- status register keeps getting updated.
				if (afb_exec) then 
					status_register(31 downto 11) <= (others => '0');
	
					if(fsm_state = IDLE) then
							status_register(10) <=  '1';
					else 
						status_register(10) <=  '0';
					end if;
	
					status_register (9)  <= i2cm_ack_error;
					status_register (8)  <= i2cm_busy;
					status_register (7 downto 0) <= i2cm_rdata_reg (7 downto 0);

				end if;
			end if;
		end if;
	end process;

	AFB_BUS_RESPONSE_pipe_read_data(32) <= '0';
	AFB_BUS_RESPONSE_pipe_read_data(31 downto 0) <= 
		status_register when (reg_id_reg = "10") else
			command_register when 	(reg_id_reg = "01") else
				std_logic_vector(to_unsigned(clock_divide_count_register,32))
					 when (reg_id_reg = "00") else
								Z32;
	

	-------------------------------------------------------------------------------
	-- I2C side... get start command from above
	-------------------------------------------------------------------------------

	i2cm_command <= AFB_BUS_REQUEST_PIPE_write_data(31 downto 0);
	i2cm_device_addr  <= i2cm_command_reg (22 downto 16);
	i2cm_register_addr  <= i2cm_command_reg (15 downto 8);
	i2cm_wdata <= i2cm_command_reg (7 downto 0);
	i2cm_rwbar <= i2cm_command_reg (31);
	i2cm_send_addr <= (i2cm_command_reg (30) = '1');
	i2cm_send_wdata <= (i2cm_command_reg (29) = '1') and (i2cm_rwbar = '0');
	
	-- state machine.
	process(clk, reset, fsm_state, start_command, i2cm_command, reg_id, i2cm_busy,
			i2cm_register_addr, i2cm_wdata, i2cm_rwbar)

		variable next_fsm_state_var : RunFsmState;
		variable enable_i2cm_var: std_logic;
		variable latch_i2cm_rdata_var: boolean;
		variable latch_cmd_var: boolean;
		variable i2cm_active_wdata_var : std_logic_vector(7 downto 0);
		variable i2cm_active_rwbar_var: std_logic;
	begin
		next_fsm_state_var   := fsm_state;
		enable_i2cm_var      := '0';
		latch_i2cm_rdata_var := false;
		latch_cmd_var := false;
		i2cm_active_wdata_var := (others => '0');
		i2cm_active_rwbar_var := '1';

		case fsm_state is
			when IDLE =>
				if (start_command) then
					latch_cmd_var   := true;
					next_fsm_state_var := I2CM_ADDRESS_CYCLE;
				end if;
			when I2CM_ADDRESS_CYCLE =>
				if(i2cm_send_addr) then 
					enable_i2cm_var := '1';
					i2cm_active_wdata_var := i2cm_register_addr;
					i2cm_active_rwbar_var := '0';

					if(i2cm_busy = '1') then
						next_fsm_state_var := I2CM_ADDRESS_CYCLE_COMPLETE;
					end if;
				elsif i2cm_send_wdata then 
					next_fsm_state_var := I2CM_WDATA_CYCLE;
				elsif  (i2cm_rwbar = '1') then  
					next_fsm_state_var := I2CM_RDATA_CYCLE;
				else
					next_fsm_state_var := IDLE;
				end if;
			when I2CM_ADDRESS_CYCLE_COMPLETE =>
				if(i2cm_send_wdata) then 

					enable_i2cm_var := '1';
					i2cm_active_wdata_var := i2cm_wdata;
					i2cm_active_rwbar_var := '0';
		
					if(i2cm_busy = '0') then
						next_fsm_state_var := I2CM_WDATA_CYCLE;
					end if;	

				elsif (i2cm_rwbar = '1') then 
					enable_i2cm_var := '1';
					if(i2cm_busy = '0') then
						next_fsm_state_var := I2CM_RDATA_CYCLE;
					end if;
				else
					next_fsm_state_var := IDLE;
				end if;
			when I2CM_RDATA_CYCLE =>
					enable_i2cm_var := '1';
					if(i2cm_busy = '1') then
						next_fsm_state_var := I2CM_RDATA_CYCLE_COMPLETE;
					end if;
			when I2CM_RDATA_CYCLE_COMPLETE =>
					if(i2cm_busy = '0') then
						next_fsm_state_var := IDLE;
						latch_i2cm_rdata_var := true;
					end if;
			when I2CM_WDATA_CYCLE =>
				if (not i2cm_send_addr) then 
					enable_i2cm_var := '1';
				end if;

				i2cm_active_rwbar_var := '0';
				i2cm_active_wdata_var := i2cm_wdata;

				if(i2cm_busy = '1') then
					next_fsm_state_var := I2CM_WDATA_CYCLE_COMPLETE;
				end if;

			when I2CM_WDATA_CYCLE_COMPLETE =>
				if(i2cm_busy = '0') then
					next_fsm_state_var := IDLE;
				end if;
		end case;

		i2cm_ena <= enable_i2cm_var;
		i2cm_active_wdata <= i2cm_active_wdata_var;
		i2cm_active_rwbar <= i2cm_active_rwbar_var;
		latch_i2cm_rdata <= latch_i2cm_rdata_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= IDLE;
			else
				fsm_state <= next_fsm_state_var;
				if(latch_cmd_var) then
					i2cm_command_reg <= i2cm_command;
				end if;
			end if;
		end if;
	end process;
	reset_n <= not reset;

	-- latch i2cm information....
	process(clk, reset)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				i2cm_rdata_reg <= (others => '0');
			else 
				if (latch_i2cm_rdata) then
					i2cm_rdata_reg <= i2cm_rdata;
				end if;
			end if;
		end if;
	end process;


	i2cm_inst:
		i2c_master port map
			(
    				clock_divide_count => clock_divide_count_register,
    				clk       => clk, 
    				reset_n   => reset_n,
    				ena       => i2cm_ena, 
    				addr      => i2cm_device_addr,
    				rw        => i2cm_active_rwbar,
    				data_wr   => i2cm_active_wdata,
    				busy      => i2cm_busy,
    				data_rd   => i2cm_rdata,
    				ack_error => i2cm_ack_error,
    				sda_in    => sda_in(0), 
    				sda_pull_down       => sda_pull_down(0), 
    				scl_in    => scl_in(0),
    				scl_pull_down    => scl_pull_down(0)
			);

end MixedBeh;
--###############################
--# Project Name : I2C slave
--# File         : i2cslave.vhd
--# Project      : i2c slave for FPGA
--# Engineer     : Philippe THIRION
--# Modification History
--###############################

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity I2CSLAVE is
	generic(
		DEVICE 		: std_logic_vector(7 downto 0) := x"38"
	);
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		SDA_IN		: in	std_logic;
		SCL_IN		: in	std_logic;
		SDA_OUT		: out	std_logic;
		SCL_OUT		: out	std_logic;
		ADDRESS		: out	std_logic_vector(7 downto 0);
		DATA_OUT	: out	std_logic_vector(7 downto 0);
		DATA_IN		: in	std_logic_vector(7 downto 0);
		WR			: out	std_logic;
		RD			: out	std_logic;
        	READ_DONE   : out   std_logic
	);
end I2CSLAVE;

architecture rtl of I2CSLAVE is

	type tstate is ( S_IDLE, S_START, S_SHIFTIN, S_RW, S_SENDACK, S_SENDACK2, S_SENDNACK,
		S_ADDRESS, S_WRITE, S_SHIFTOUT, S_READ, S_WAITACK
	);

	type toperation is (OP_READ, OP_WRITE);
	
	signal state : tstate;
	signal next_state : tstate;
	signal operation : toperation;

	signal rising_scl, falling_scl : std_logic;
	signal address_i : std_logic_vector(7 downto 0);
	signal next_address : std_logic_vector(7 downto 0);
	signal counter : integer range 0 to 7;
	signal start_cond : std_logic;
	signal stop_cond  : std_logic;
	signal sda_q, sda_qq, sda_qqq : std_logic;
	signal scl_q, scl_qq, scl_qqq : std_logic;
	signal shiftreg : std_logic_vector(7 downto 0);
	signal sda: std_logic;
	signal address_incr : std_logic;
	signal rd_d : std_logic;
    signal read_data_done : std_logic;
begin

	ADDRESS <= address_i;
	
	next_address <= (others=>'0') when (address_i = x"FF") else
		std_logic_vector(to_unsigned(to_integer(unsigned( address_i )) + 1, 8));
	
	S_RSY: process(MCLK,nRST)
	begin
		if (nRST = '0') then
			sda_q <= '1';
			sda_qq <= '1';
			sda_qqq <= '1';
			scl_q <= '1';
			scl_qq <= '1';
			scl_qqq <= '1';
		elsif (MCLK'event and MCLK='1') then
			sda_q <= SDA_IN;
			sda_qq <= sda_q;
			sda_qqq <= sda_qq;
			scl_q <= SCL_IN;
			scl_qq <= scl_q;
			scl_qqq <= scl_qq;
		end if;
	end process S_RSY;

	rising_scl <= scl_qq and not scl_qqq;
	falling_scl <= not scl_qq and scl_qqq;
		
	START_BIT: process(MCLK,nRST)
	begin
		if (nRST = '0') then
			start_cond <= '0';
		elsif (MCLK'event and MCLK='1') then
			if (sda_qqq = '1' and sda_qq = '0' and scl_qq = '1') then
				start_cond <= '1';
			else	
				start_cond <= '0';
			end if;
		end if;
	end process START_BIT;
	
	STOP_BIT: process(MCLK,nRST)
	begin
		if (nRST = '0') then
			stop_cond <= '0';
		elsif (MCLK'event and MCLK='1') then
			if (sda_qqq = '0' and sda_qq = '1' and scl_qq = '1') then
				stop_cond <= '1';
			else	
				stop_cond <= '0';
			end if;
		end if;
	end process STOP_BIT;
	
	sda <= sda_qq;
	
	RD_DELAY: process(MCLK, nRST)
	begin
		if (nRST = '0') then
			RD <= '0';
		elsif (MCLK'event and MCLK='1') then
			RD <= rd_d;
		end if;
	end process RD_DELAY;

	OTO: process(MCLK, nRST)
	begin
		if (nRST = '0') then
			state <= S_IDLE;
			SDA_OUT <= '1';
			SCL_OUT <= '1';
			WR <= '0';
			rd_d <= '0';
			address_i <= (others=>'0');
			DATA_OUT <= (others=>'0');
			shiftreg <= (others=>'0');
            		read_data_done <= '0';
		elsif (MCLK'event and MCLK='1') then
			if (stop_cond = '1') then
				state <= S_IDLE;
				SDA_OUT <= '1';
				SCL_OUT <= '1';
				operation <= OP_READ;
				WR <= '0';
				rd_d <= '0';
				address_incr <= '0';
			elsif(start_cond = '1') then
				state <= S_START;
				SDA_OUT <= '1';
				SCL_OUT <= '1';
				operation <= OP_READ;
				WR <= '0';
				rd_d <= '0';
				address_incr <= '0';
			elsif(state = S_IDLE) then
				state <= S_IDLE;
				SDA_OUT <= '1';
				SCL_OUT <= '1';
				operation <= OP_READ;
				WR <= '0';
				rd_d <= '0';
				address_incr <= '0';
			elsif(state = S_START) then
				shiftreg <= (others=>'0');
				state <= S_SHIFTIN;
				next_state <= S_RW;
				counter <= 6;
			elsif(state = S_SHIFTIN) then
				if (rising_scl = '1') then
					shiftreg(7 downto 1) <= shiftreg(6 downto 0);
					shiftreg(0) <= sda;
					if (counter = 0) then
						state <= next_state;
						counter <= 7;
					else
						counter <= counter - 1;
					end if;
				end if;
			elsif(state = S_RW) then
				if (rising_scl = '1') then
					if (shiftreg = DEVICE) then
						state <= S_SENDACK;
						if (sda = '1') then
							operation <= OP_READ;
							-- next_state <= S_READ; -- no needed
							rd_d <= '1';
						else
							operation <= OP_WRITE;
							next_state <= S_ADDRESS;
							address_incr <= '0';
						end if;
					else
						state <= S_SENDNACK;
					end if;
				end if;
			elsif(state = S_SENDACK) then
				WR <= '0';
				rd_d <= '0';
				if (falling_scl = '1') then
					SDA_OUT <= '0';
					counter <= 7;
					if (operation= OP_WRITE) then
						state <= S_SENDACK2;
					else -- OP_READ
						state <= S_SHIFTOUT;
						shiftreg <= DATA_IN;
						read_data_done <= '1';
					end if;
				end if;
			elsif(state = S_SENDACK2) then
				if (falling_scl = '1') then
					SDA_OUT <= '1';
					state <= S_SHIFTIN;
					shiftreg <= (others=>'0');
					if (address_incr = '1') then
						address_i <= next_address;
					end if;
				end if;
			elsif(state = S_SENDNACK) then
				if (falling_scl = '1') then
					SDA_OUT <= '1';
					state <= S_IDLE;
				end if;
			elsif(state = S_ADDRESS) then
				address_i <= shiftreg;
				next_state <= S_WRITE;
				state <= S_SENDACK;
				address_incr <= '0';
			elsif(state = S_WRITE) then
				DATA_OUT <= shiftreg;
				next_state <= S_WRITE;
				state <= S_SENDACK;
				WR <= '1';
				address_incr <= '1';
			elsif(state = S_SHIFTOUT) then
                read_data_done <= '0';
				if (falling_scl = '1') then
					SDA_OUT <= shiftreg(7);
					shiftreg(7 downto 1) <= shiftreg(6 downto 0);
					shiftreg(0) <= '1';
					if (counter = 0) then
						state <= S_READ;
						address_i <= next_address;
						rd_d <= '1';
					else
						counter <= counter - 1;
					end if;
				end if;
			elsif(state = S_READ) then
				rd_d <= '0';
				if (falling_scl = '1') then
					SDA_OUT <= '1';
					state <= S_WAITACK;
				end if;
			elsif(state = S_WAITACK) then
				if (rising_scl = '1') then
					if (sda = '0') then
						state <= S_SHIFTOUT;
						counter <= 7;
						shiftreg <= DATA_IN;
                        read_data_done <= '1';
					else
						state <= S_IDLE;
					end if;
				end if;
			end if;
		end if;
	end process OTO;
					
    READ_DONE <= read_data_done;

end rtl;
--###############################
--# Project Name : I2C Slave
--# File         : i2cdemo.vhd
--# Project      : ic2 slave + Single port RAM 256 * 8 (ALTERA compatible)
--# Engineer     : Philippe THIRION
--# Modification History
--###############################

library IEEE;
use IEEE.std_logic_1164.all;

entity I2CSLAVEMEM is
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		SCL_IN		: in	std_logic;
		SDA_IN		: in	std_logic;
		SCL_OUT		: out	std_logic;
		SDA_OUT		: out	std_logic
	);
end I2CSLAVEMEM;

architecture rtl of I2CSLAVEMEM is
-- COMPONENTS --
	component I2CSLAVE
		generic( DEVICE: std_logic_vector(7 downto 0));
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			SDA_IN		: in	std_logic;
			SCL_IN		: in	std_logic;
			SDA_OUT		: out	std_logic;
			SCL_OUT		: out	std_logic;
			ADDRESS		: out	std_logic_vector(7 downto 0);
			DATA_OUT	: out	std_logic_vector(7 downto 0);
			DATA_IN		: in	std_logic_vector(7 downto 0);
			WR			: out	std_logic;
			RD			: out	std_logic;
        		READ_DONE   : out   std_logic
		);
	end component;
	
	component sp256x8
		port(
			address		: in	std_logic_vector(7 downto 0);
			clk		: in	std_logic;
			reset		: in    std_logic;
			data		: in	std_logic_vector(7 downto 0);
			wren		: in	std_logic;
			q			: out	std_logic_vector(7 downto 0)
		);
	end component;
	
	-- SIGNALS --
	signal ADDRESS		: std_logic_vector(7 downto 0);
	signal DATA_OUT		: std_logic_vector(7 downto 0);
	signal DATA_IN		: std_logic_vector(7 downto 0);
	signal WR		: std_logic;
	signal RD		: std_logic;
	signal READ_DONE	: std_logic;

	signal q		: std_logic_vector(7 downto 0);
	signal BUFFER8		: std_logic_vector(7 downto 0);

	signal reset: std_logic;
begin
	reset <= not nRST;
	-- PORT MAP --
	I_RAM : sp256x8
		port map (
			address	=> ADDRESS,
			clk		=> MCLK,
			reset		=> reset,
			data		=> DATA_OUT,
			wren		=> WR,
			q		=> q
		);
	I_I2CITF : I2CSLAVE
		generic map (DEVICE => x"38")
		port map (
			MCLK		=> MCLK,
			nRST		=> nRST,
			SDA_IN		=> SDA_IN,
			SCL_IN		=> SCL_IN,
			SDA_OUT		=> SDA_OUT,
			SCL_OUT		=> SCL_OUT,
			ADDRESS		=> ADDRESS,
			DATA_OUT	=> DATA_OUT,
			DATA_IN		=> DATA_IN,
			WR		=> WR,
			RD		=> RD,
			READ_DONE 	=> READ_DONE
		);
	
	B8 : process(MCLK,nRST)
	begin
		if (nRST = '0') then
			BUFFER8 <= (others => '0');
		elsif (MCLK'event and MCLK='1') then
			if (RD = '1') then
				BUFFER8 <= q;
			end if;
		end if;
	end process B8;

	DATA_IN <= BUFFER8;

end rtl;
--###############################
--# Project Name : I2C Slave
--# File         : ALTERA compatible
--# Project      : VHDL RAM model
--# Engineer     : Philippe THIRION
--# Modification History
--###############################
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sp256x8 is
	port(
		address		: in	std_logic_vector(7 downto 0);
		clk		: in	std_logic;
		reset		: in    std_logic;
		data		: in	std_logic_vector(7 downto 0);
		wren		: in	std_logic;
		q		    : out	std_logic_vector(7 downto 0)
	);
end sp256x8;

architecture rtl of sp256x8 is

	type memory is array(0 to 255) of std_logic_vector(7 downto 0);
	signal mem : memory;

begin
	RAM : process(clk)
	begin
		if (clk'event and clk='1') then
			if (wren = '0') then
				q <= mem(to_integer(unsigned(address)));
			else
				mem(to_integer(unsigned(address))) <= data;
				q <= data;  -- ????
			end if;
		end if;
	end process RAM;
end rtl;
