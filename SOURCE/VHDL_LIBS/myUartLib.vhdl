library ieee;
use ieee.std_logic_1164.all;

package myUartPackage is
  component myUartTx
    port (
      reset : in  std_logic;
      clk : in  std_logic;
      clock_ticks_per_bit: in std_logic_vector(31 downto 0);
      txData : in  std_logic_vector(7 downto 0);
      newTxData : in  std_logic;
      serOut : out  std_logic;
      txBusy : out  std_logic);
  end component;

  component myUartRx
    port (
      reset       : in  std_logic;
      clk       : in  std_logic;
      clock_ticks_per_bit: in std_logic_vector(31 downto 0);
      serIn     : in  std_logic;
      rxData    : out std_logic_vector(7 downto 0);
      newRxData : out std_logic);
  end component;

  component myUartTopBase
    port ( reset       : in  std_logic;
           clk       : in  std_logic;
      	   clock_ticks_per_bit: in std_logic_vector(31 downto 0);
           serIn     : in  std_logic;
           txData    : in  std_logic_vector(7 downto 0);
           newTxData : in  std_logic;
           serOut    : out std_logic;
           txBusy    : out std_logic;
           rxData    : out std_logic_vector(7 downto 0);
           newRxData : out std_logic);
  end component;

  component myUartBridge
    port ( reset     : in  std_logic;
           clk       : in  std_logic;
 	   -- from uartTopBase
           txData    : out  std_logic_vector(7 downto 0);
           newTxData : out  std_logic;
           txBusy    : in std_logic;
           rxData    : in std_logic_vector(7 downto 0);
           newRxData : in std_logic;
	   -- Pipe interfaces
	   uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	   uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	   uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	   uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	   uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	   uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0)
           );
  end component;

  component myUartTop is
  port ( -- global signals
         reset     : in  std_logic;                     -- global reset input
         soft_reset     : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
         -- uart serial signals
         serIn     : in  std_logic;                     -- serial data input
         serOut    : out std_logic;                     -- serial data output
	 -- ticks per bit
	 clock_ticks_per_bit: in std_logic_vector(31 downto 0);
         -- pipe signals for tx/rx.
	 uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	 uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	 uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	 uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0));
  end component myUartTop;

  component mySelfTuningUart is
	port (clk, reset: in std_logic; 

		UART_RX: in std_logic_vector(0 downto 0); 
		UART_TX: out std_logic_vector(0 downto 0);

		TX_to_CONSOLE_pipe_write_data: in std_logic_vector(7 downto 0);
		TX_to_CONSOLE_pipe_write_req:  in std_logic_vector(0 downto 0);
		TX_to_CONSOLE_pipe_write_ack:  out std_logic_vector(0 downto 0);

		CONSOLE_to_RX_pipe_read_data : out std_logic_vector(7 downto 0);
		CONSOLE_to_RX_pipe_read_req :  in std_logic_vector(0 downto 0);
		CONSOLE_to_RX_pipe_read_ack :  out std_logic_vector(0 downto 0));
   end component mySelfTuningUart;

   component myUartSynchronizer is
	port (
			clk, reset: in std_logic;
			Rx_in: in std_logic;
			Rx_out: out std_logic;
			reset_uart: out std_logic;
			clock_ticks_per_bit: out std_logic_vector(31 downto 0)
	     );
   end component myUartSynchronizer;

end myUartPackage;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library myUartLib;
use myUartLib.myUartPackage.all;

entity mySelfTuningUart is
	port (clk, reset: in std_logic; 

		UART_RX: in std_logic_vector(0 downto 0); 
		UART_TX: out std_logic_vector(0 downto 0);

		TX_to_CONSOLE_pipe_write_data: in std_logic_vector(7 downto 0);
		TX_to_CONSOLE_pipe_write_req:  in std_logic_vector(0 downto 0);
		TX_to_CONSOLE_pipe_write_ack:  out std_logic_vector(0 downto 0);

		CONSOLE_to_RX_pipe_read_data : out std_logic_vector(7 downto 0);
		CONSOLE_to_RX_pipe_read_req :  in std_logic_vector(0 downto 0);
		CONSOLE_to_RX_pipe_read_ack :  out std_logic_vector(0 downto 0));
end entity mySelfTuningUart;


architecture Struct of mySelfTuningUart is

        signal clock_ticks_per_bit  : std_logic_vector(31 downto 0);
	signal reset_uart: std_logic;
	signal UART_RX_SYNCH: std_logic_vector (0 downto 0);
begin
	-------------------------------------------------------
	-- estimate clock ticks per bit 
	-------------------------------------------------------
	dut: myUartSynchronizer
		port map (clk  => clk , reset => reset, Rx_in => UART_RX(0),
				Rx_out => UART_RX_SYNCH(0),
				clock_ticks_per_bit => clock_ticks_per_bit,
				reset_uart => reset_uart);



	-------------------------------------------------------
	-- The UART!
	-------------------------------------------------------
	uart_inst: myUartTop
		port map (
				reset => reset,
				soft_reset => reset_uart,
				clk => clk,
				serIn     => UART_RX_SYNCH(0),	
				serOut    => UART_TX(0),	
				clock_ticks_per_bit => clock_ticks_per_bit,
	 			uart_rx_pipe_read_data => CONSOLE_to_RX_pipe_read_data,
	 			uart_rx_pipe_read_req => CONSOLE_to_RX_pipe_read_req,
	 			uart_rx_pipe_read_ack => CONSOLE_to_RX_pipe_read_ack,
	 			uart_tx_pipe_write_data => TX_to_CONSOLE_pipe_write_data,
	 			uart_tx_pipe_write_req => TX_to_CONSOLE_pipe_write_req,
	 			uart_tx_pipe_write_ack => TX_to_CONSOLE_pipe_write_ack
			);
end Struct;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- the source UART is expected to send a value 0x80
-- to the uart synchronizer.   Thus, the synchronizer
-- sees a low-going pulse of duration 8/known-baud-rate.
-- (including one start bit).
--
-- Note: this means that the sender sends 0x80 to the 
--       uart to synchronize.
--
--
-- The synchronizer counts the number of clock-cycles in
-- the low-going pulse, and uses that to generate a real-time
-- clock from the uart signal.
--
entity myUartSynchronizer is
	port (
			clk, reset: in std_logic;
			Rx_in: in std_logic;
			Rx_out: out std_logic;
			reset_uart: out std_logic;
			clock_ticks_per_bit: out std_logic_vector(31 downto 0)
	     );
end entity myUartSynchronizer;


architecture Behave of myUartSynchronizer is

	signal start_time, end_time, counter : integer := 0;

	signal saved_rx_in: std_logic_vector (1 downto 0);
	signal rx_rising, rx_falling: boolean;

	type FsmState is (RT_HIGH, RT_LOW, RT_DONE);

	signal fsm_state: FsmState;
	signal clock_ticks_per_half_bit: integer;
	signal clock_ticks_per_8bits_slv, clock_ticks_per_half_bit_slv : std_logic_vector (31 downto 0);

	signal run_rt: boolean;
	signal delta_t: integer;
			
	constant Z3 : std_logic_vector(2 downto 0) := (others => '0');
	constant Z4 : std_logic_vector(3 downto 0) := (others => '0');

begin

	--
	-- do not forward to uart unless initial estimate
	-- is completed.
	--
	process(clk) 
	begin
		if rising_edge(clk) then
			saved_rx_in <= saved_rx_in(0) & Rx_in;
		end if;
	end process;

	Rx_out <= Rx_in when run_rt else '1';
	reset_uart <= '0' when run_rt else '1';

	rx_rising   <= (saved_rx_in(1) = '0') and (saved_rx_in(0) = '1');
	rx_falling  <= (saved_rx_in(1) = '1') and (saved_rx_in(0) = '0');

	process(clk, reset, rx_rising, rx_falling, Rx_in, fsm_state, counter)
		variable next_fsm_state: FsmState;
		variable run_rt_var: boolean;
		variable next_counter_var: integer;
	begin
		next_fsm_state := fsm_state;
		run_rt_var := false;
		next_counter_var := counter;

		case fsm_state is
			when RT_HIGH =>
				if(rx_falling) then
					next_fsm_state := RT_LOW;
				end if;
			when RT_LOW =>
				next_counter_var := counter + 1;
				if(rx_rising) then
					next_fsm_state := RT_DONE;
				end if;
			when RT_DONE =>
				run_rt_var := true;
				next_fsm_state := RT_DONE;
		end case;
		
		run_rt <= run_rt_var;
		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= RT_HIGH;
				counter <= 0;
			else
				fsm_state <= next_fsm_state;
				counter <= next_counter_var;
			end if;
		end if;
	end process;

	clock_ticks_per_8bits_slv <= std_logic_vector(to_unsigned(counter,32));
	clock_ticks_per_half_bit_slv   <= Z4 & std_logic_vector(clock_ticks_per_8bits_slv(31 downto 4));
	clock_ticks_per_bit  	       <= Z3 & std_logic_vector(clock_ticks_per_8bits_slv(31 downto 3));
	clock_ticks_per_half_bit       <= to_integer(unsigned(clock_ticks_per_half_bit_slv));
	
end Behave; 
library ieee;
use ieee.std_logic_1164.all;

  
entity myUartBridge is
    port ( reset     : in  std_logic;
           clk       : in  std_logic;
 	   -- from uartTopBase
           txData    : out  std_logic_vector(7 downto 0);
           newTxData : out  std_logic;
           txBusy    : in std_logic;
           rxData    : in std_logic_vector(7 downto 0);
           newRxData : in std_logic;
	   -- Pipe interfaces
	   uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	   uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	   uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	   uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	   uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	   uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0)
           );
end entity myUartBridge;


architecture Behave of myUartBridge is
	type TxFsmState is (RST, IDLE, BUSY, DONE);
	signal tx_fsm_state: TxFsmState;
	signal tx_register : std_logic_vector(7 downto 0);

	type RxFsmState is (RXRST, EMPTY, FULL);
	signal rx_fsm_state: RxFsmState;
	signal rx_register : std_logic_vector(7 downto 0);
begin

	-----------------------------------------------------------------
	-- Tx FSM
	-----------------------------------------------------------------
	process(clk, reset, tx_fsm_state, txBusy, uart_tx_pipe_write_req)
		variable tx_latch_var: std_logic;
		variable next_tx_fsm_state: TxFsmState;
		variable newTxData_var : std_logic;
	begin
		next_tx_fsm_state := tx_fsm_state;
		tx_latch_var := '0';
		newTxData_var := '0';

		case tx_fsm_state is 
			when RST =>
				if(reset = '0') then
					next_tx_fsm_state := IDLE;	
				end if;
			when IDLE => 
				if((txBusy='0') and (uart_tx_pipe_write_req(0) = '1')) then
					next_tx_fsm_state := BUSY;
					tx_latch_var := '1';
				end if;
			when BUSY =>
				newTxData_var := '1';
				next_tx_fsm_state := DONE;
			when DONE => 
				if(txBusy = '1') then
					next_tx_fsm_state := IDLE;
				end if;
		end case;

		uart_tx_pipe_write_ack(0) <= tx_latch_var;
		newTxData <= newTxData_var;

		if (clk'event and clk = '1') then
			if(reset = '1') then
				tx_fsm_state <= RST;
			else
				tx_fsm_state <= next_tx_fsm_state;
				
				if(tx_latch_var = '1') then
					tx_register <= uart_tx_pipe_write_data;
				end if;

			end if;

		end if;
	end process;
	txData <= tx_register;

	-----------------------------------------------------------------
	-- Rx FSM
	-----------------------------------------------------------------
	process(clk, reset, rx_fsm_state, newRxData, uart_rx_pipe_read_req)
		variable rx_latch_var : std_logic;
		variable next_rx_fsm_state: RxFsmState;
		variable read_ack_var : std_logic;
	begin
		next_rx_fsm_state := rx_fsm_state;
		read_ack_var := '0';
		rx_latch_var := '0';

		case rx_fsm_state is
			when RXRST =>
				if (reset = '0') then
					next_rx_fsm_state := EMPTY;
				end if;
			when EMPTY =>
				if(newRxData = '1') then
					rx_latch_var := '1';
					next_rx_fsm_state := FULL;
				end if;
			when FULL => 
				read_ack_var := '1';
				if(uart_rx_pipe_read_req(0) = '1') then
					if(newRxData = '1') then
						next_rx_fsm_state := FULL;
						rx_latch_var := '1';
					else
						next_rx_fsm_state := EMPTY;
					end if;
				-- else...
				-- Note: if newRxData becomes '1' and
				--       pipe-read-request has not arrived
				--       then the Rx-data will be lost!
				end if;
		end case;

		uart_rx_pipe_read_ack(0) <= read_ack_var;
		
		if(clk'event and clk='1') then
			if(reset = '1') then
				rx_fsm_state <= RXRST;
			else
				rx_fsm_state <= next_rx_fsm_state;
				if(rx_latch_var = '1') then
					rx_register <= rxData;
				end if;
			end if;
		end if;
	end process;
	uart_rx_pipe_read_data <= rx_register;

end Behave;

-----------------------------------------------------------------------------------------
-- uart receive module  
--
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity myUartRx is
  port ( reset       : in  std_logic;                  -- global reset input
         clk       : in  std_logic;                    -- global clock input
	 -- how many clock ticks per bit.
         clock_ticks_per_bit: std_logic_vector(31 downto 0);
         serIn     : in  std_logic;                    -- serial data input
         rxData    : out std_logic_vector(7 downto 0); -- data byte received
         newRxData : out std_logic);                   -- signs that a new byte was received
end myUartRx;

architecture Behavioral of myUartRx is
	type FsmState is (RX_RESET, RX_IDLE, RX_WAIT_HALF_BIT, RX_WAIT_BIT, RX_DONE);
	signal fsm_state : FsmState;

	signal rx_data_reg: std_logic_vector(7 downto 0);

	signal ticks_per_bit, ticks_per_half_bit: integer;
	signal active_counter: integer;

	signal serIn_falling_edge: boolean;
	signal serInSaved: std_logic_vector(1 downto 0);

	signal bit_counter: integer range 0 to 7;
begin
	ticks_per_bit <= to_integer(unsigned(clock_ticks_per_bit));
	ticks_per_half_bit <= to_integer(unsigned(clock_ticks_per_bit(31 downto 1)));

	process(clk, serIn)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				serInSaved <= (others => '0');
			else
				serInSaved <= serInSaved(0) & serIn;
			end if;
		end if;
	end process;
	serIn_falling_edge <= (serInSaved(1) = '1') and (serInSaved(0) = '0');


	--
	-- algorithm.
	-- while true loop
	--    look for start transition.
	--    advance half bit period.
	--    for I in 1 to 8 loop
	--        advance bit-period
	--	  sample-bit
	--    end loop
	--    assert newRxData (for 1 clock cycle)
	-- end loop
	--  
        -- 

	process(clk, reset, fsm_state, serIn, ticks_per_bit, ticks_per_half_bit, active_counter, serIn_falling_edge)
		variable next_fsm_state_var: FsmState;
		variable next_active_counter_var: integer;
		variable next_bit_counter_var: integer range 0 to 7;
		variable newRxData_var : std_logic;
		variable next_rx_data_reg_var : std_logic_vector(7 downto 0);
	begin
		next_fsm_state_var := fsm_state;
		next_active_counter_var := active_counter;
		next_bit_counter_var := bit_counter;
		newRxData_var := '0';
		next_rx_data_reg_var := rx_data_reg;

		case fsm_state is
			when RX_RESET =>
				if (reset = '0') then
					next_fsm_state_var := RX_IDLE;
				end if;
			when RX_IDLE =>
				if(serIn_falling_edge) then
					next_active_counter_var := ticks_per_half_bit;
					next_fsm_state_var := RX_WAIT_HALF_BIT;
					next_bit_counter_var := 0;
					next_rx_data_reg_var := (others => '0');
				end if;
			when RX_WAIT_HALF_BIT => 
				if(active_counter = 1) then
					next_active_counter_var := ticks_per_bit;
					next_fsm_state_var := RX_WAIT_BIT;
				else
					next_active_counter_var := active_counter - 1;
				end if;
			when RX_WAIT_BIT => 
				if(active_counter = 1) then
					next_rx_data_reg_var := serIn & rx_data_reg (7 downto 1);
					if(bit_counter = 7) then
						next_fsm_state_var := RX_DONE;
						next_bit_counter_var := 0;
					else
						next_active_counter_var := ticks_per_bit;
						next_bit_counter_var := bit_counter + 1;
					end if;
				else
					next_active_counter_var := active_counter - 1;
				end if;
			when RX_DONE =>
				newRxData_var := '1';
				next_active_counter_var := 0;
				next_bit_counter_var := 0;
				next_fsm_state_var := RX_IDLE;
				
		 end case;

		newRxData <= newRxData_var;

		if rising_edge(clk) then
			if(reset = '1') then
				fsm_state <= RX_RESET;
			else
				fsm_state <= next_fsm_state_var;
				rx_data_reg <= next_rx_data_reg_var;
				active_counter <= next_active_counter_var;
				bit_counter <= next_bit_counter_var;
			end if;
		end if;
					
	end process;

	RxData <= rx_data_reg;
end Behavioral;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library myUartLib;
use myUartLib.myUartPackage.all;


entity myUartTop is
  port ( -- global signals
         reset     : in  std_logic;                     -- global reset input
         soft_reset     : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
         -- uart serial signals
         serIn     : in  std_logic;                     -- serial data input
         serOut    : out std_logic;                     -- serial data output
	 -- ticks per bit
	 clock_ticks_per_bit: in std_logic_vector(31 downto 0);

         -- pipe signals for tx/rx.
	 uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	 uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	 uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	 uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0));

end myUartTop;

architecture Struct of myUartTop is

  signal ce16 : std_logic; -- clock enable at bit rate
  signal baudClk   : std_logic;                    -- 
        
  signal txData    : std_logic_vector(7 downto 0);  -- data byte to transmit
  signal newTxData : std_logic;                     -- asserted to indicate that there is a new data byte for transmission
  signal txBusy    : std_logic;                     -- signs that transmitter is busy
  signal rxData    : std_logic_vector(7 downto 0);  -- data byte received
  signal newRxData : std_logic;                     -- signs that a new byte was received
  signal combined_reset : std_logic;
begin
  
   combined_reset <= reset or soft_reset;
   baseInst: myUartTopBase
      port map ( 
			reset       => combined_reset,
           		clk       => clk,
           		serIn     => serIn,    
           		txData    => txData,   
           		newTxData => newTxData,
           		serOut    => serOut,   
           		txBusy    => txBusy,   
           		rxData    => rxData,   
           		newRxData => newRxData,
           		clock_ticks_per_bit   => clock_ticks_per_bit   
		);

   bridgeInst: myUartBridge
     port map ( 
	   reset     => combined_reset,
           clk       => clk,
           txData    => txData, 
           newTxData => newTxData,
           txBusy    => txBusy,
           rxData    => rxData,    
           newRxData => newRxData, 
	   uart_rx_pipe_read_data=> uart_rx_pipe_read_data,
	   uart_rx_pipe_read_req=> uart_rx_pipe_read_req,
	   uart_rx_pipe_read_ack=> uart_rx_pipe_read_ack,
	   uart_tx_pipe_write_data=> uart_tx_pipe_write_data,
	   uart_tx_pipe_write_req=> uart_tx_pipe_write_req,
	   uart_tx_pipe_write_ack=> uart_tx_pipe_write_ack
           );

end Struct;

-----------------------------------------------------------------------------------------
-- uart top level module  
--
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library myUartLib;
use myUartLib.myUartPackage.all;

entity myUartTopBase is
  port ( -- global signals
         reset       : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
         -- uart serial signals
         serIn     : in  std_logic;                     -- serial data input
         serOut    : out std_logic;                     -- serial data output
         -- transmit and receive internal interface signals
         txData    : in  std_logic_vector(7 downto 0);  -- data byte to transmit
         newTxData : in  std_logic;                     -- asserted to indicate that there is a new data byte for transmission
         txBusy    : out std_logic;                     -- signs that transmitter is busy
         rxData    : out std_logic_vector(7 downto 0);  -- data byte received
         newRxData : out std_logic;                     -- signs that a new byte was received
         -- clock ticks per bit.
         clock_ticks_per_bit  : in  std_logic_vector(31 downto 0) -- baud rate setting registers - see header description
	);
end myUartTopBase;

architecture Behavioral of myUartTopBase is
  begin
    ut : myUartTx
      port map (
        clk => clk,
	reset => reset,
	clock_ticks_per_bit => clock_ticks_per_bit,
        txData => txData,
        newTxData => newTxData,
        serOut => serOut,
        txBusy => txBusy);
    -- uart transmitter
    ur : myUartRx
      port map (
        clk => clk,
	reset => reset,
	clock_ticks_per_bit => clock_ticks_per_bit,
        serIn => serIn,
        rxData => rxData,
        newRxData => newRxData);
end Behavioral;
-----------------------------------------------------------------------------------------
-- uart transmit module  
--
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity myUartTx is
  port ( reset       : in  std_logic;                    -- global reset input
         clk       : in  std_logic;                    -- global clock input
         -- clock ticks per bit.
         clock_ticks_per_bit  : in  std_logic_vector(31 downto 0); -- clock cycles per bit...
         txData    : in  std_logic_vector(7 downto 0); -- data byte to transmit
         newTxData : in  std_logic;                    -- asserted to indicate that there is a new data byte for transmission
         serOut    : out std_logic;                    -- serial data output
         txBusy    : out std_logic);                   -- signs that transmitter is busy
end myUartTx;

architecture Behavioral of myUartTx is

  signal txData_reg    : std_logic_vector(7 downto 0); -- registered data byte to transmit

  type FsmState is (TX_RESET, TX_IDLE, TX_START_BIT, TX_DATA_BITS, TX_STOP_BIT);
  signal fsm_state: FsmState;

  signal bit_counter: integer range 0 to 7;
  signal tick_counter: integer;
  signal ticks_per_bit: integer;

begin

    ticks_per_bit <= to_integer(unsigned(clock_ticks_per_bit));
    --
    -- FSM: starts in idle, serOut = '1', txBusy = '0'.
    --
    process(clk, reset, fsm_state, newTxData, ticks_per_bit, bit_counter) 
	variable next_fsm_state_var: FsmState;
	variable latch_txData_var: std_logic;
	variable next_bit_counter_var: integer range 0 to 7;
	variable next_tick_counter_var: integer;
	variable serOut_var: std_logic;
	variable txBusy_var : std_logic;
    begin
	next_fsm_state_var := fsm_state;
	next_bit_counter_var := bit_counter;
	next_tick_counter_var := tick_counter;
	serOut_var := '1';
	latch_txData_var := '0';
	txBusy_var := '1';

	case fsm_state is 
		when TX_RESET =>

			if(reset = '0') then
				next_fsm_state_var := TX_IDLE;
			end if;

		when TX_IDLE =>
			txBusy_var := '0';
			if(newTxData = '1') then 
				latch_txData_var := '1';
				next_fsm_state_var := TX_START_BIT;
				next_tick_counter_var := ticks_per_bit;
			end if;
		when TX_START_BIT =>
			serOut_var := '0';
			if(tick_counter = 1) then
				next_tick_counter_var := ticks_per_bit;
				next_fsm_state_var := TX_DATA_BITS;
				next_bit_counter_var := 0;
			else
				next_tick_counter_var := tick_counter - 1;
			end if;
		when TX_DATA_BITS =>
			if(tick_counter = 1) then 
				if(bit_counter = 7) then
					next_fsm_state_var := TX_STOP_BIT;
					next_bit_counter_var := 0;
				else
					next_bit_counter_var := bit_counter + 1;
				end if;
				next_tick_counter_var := ticks_per_bit;
			else
				next_tick_counter_var := tick_counter - 1;
			end if;
			serOut_var := txData_reg(bit_counter);
		when TX_STOP_BIT =>
			serOut_var := '1';
			if(tick_counter = 1) then
				next_fsm_state_var := TX_IDLE;
			else
				next_tick_counter_var := tick_counter - 1;
			end if;
	end case;

	txBusy <= txBusy_var;

	if(rising_edge(clk)) then
		if(reset = '1') then
			fsm_state <= TX_RESET;
			bit_counter <= 0;
			tick_counter <= 0;
		else
			fsm_state <= next_fsm_state_var;
			bit_counter <= next_bit_counter_var;
			tick_counter <= next_tick_counter_var;

			if(latch_txData_var = '1') then
				txData_reg <= txData;
			end if;

			serOut <= serOut_var;

		end if;
	end if;
    end process;

end Behavioral;
