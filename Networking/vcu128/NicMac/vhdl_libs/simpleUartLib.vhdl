library ieee;
use ieee.std_logic_1164.all;

package uartPackage is
	function constGcd(x,y: integer) return integer;


  component baudGen
    port (
      clr       : in  std_logic;
      clk       : in  std_logic;
      baudFreq  : in  std_logic_vector(11 downto 0);
      baudLimit : in  std_logic_vector(15 downto 0);
      ce16      : out std_logic);
  end component;

  component uartTx
    port (
      clr : in  std_logic;
      clk : in  std_logic;
      ce16 : in  std_logic;
      txData : in  std_logic_vector(7 downto 0);
      newTxData : in  std_logic;
      serOut : out  std_logic;
      txBusy : out  std_logic);
  end component;

  component uartRx
    port (
      clr       : in  std_logic;
      clk       : in  std_logic;
      ce16      : in  std_logic;
      serIn     : in  std_logic;
      rxData    : out std_logic_vector(7 downto 0);
      newRxData : out std_logic);
  end component;

  component uartTopBase
    port ( clr       : in  std_logic;
           clk       : in  std_logic;
           serIn     : in  std_logic;
           txData    : in  std_logic_vector(7 downto 0);
           newTxData : in  std_logic;
           baudFreq  : in  std_logic_vector(11 downto 0);
           baudLimit : in  std_logic_vector(15 downto 0);
           serOut    : out std_logic;
           txBusy    : out std_logic;
           rxData    : out std_logic_vector(7 downto 0);
           newRxData : out std_logic;
           baudClk   : out std_logic);
  end component;

  component uartBridge
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

  component uartTopGenericEasilyConfigurable is
  generic (
         	baud_rate  : integer:= 115200;
         	clock_frequency : integer := 100000000);
  port ( -- global signals
         reset     : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
         -- uart serial signals
         serIn     : in  std_logic;                     -- serial data input
         serOut    : out std_logic;                     -- serial data output
         -- pipe signals for tx/rx.
	 uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	 uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	 uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	 uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0));
  end component;

  component uartTopGenericConfigurable is
  generic (
         	-- baudFreq = 16 * baudRate / gcd(clkFreq, 16 * baudRate)
		--   For example if clock frequency is 100MHz and 
		--   baud-rate is 9600, then gcd(16*9600,10^8) is
		--   3200.  So Baud-frequency will be 16*9600/3200 = 48
         	baudFreq  : integer:= 48;
         	-- baudLimit = clkFreq / gcd(clkFreq, 16 * baudRate) - baudFreq
		--   For example if clock frequency is 100MHz and
		--   baud-rate is 9600, the gcd is 3200.  So 
		--   baudLimit = 31202.
         	baudLimit : integer := 31202);
  port ( -- global signals
         reset     : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
         -- uart serial signals
         serIn     : in  std_logic;                     -- serial data input
         serOut    : out std_logic;                     -- serial data output
         -- pipe signals for tx/rx.
	 uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	 uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	 uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	 uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0));
  end component;

  component uartTopPortConfigurable is
  port ( -- global signals
         reset     : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
         -- software reset.
         soft_reset: in std_logic;
         -- uart serial signals
         serIn     : in  std_logic;                     -- serial data input
         serOut    : out std_logic;                     -- serial data output
         -- pipe signals for tx/rx.
	 uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	 uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	 uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	 uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0);
         -- baudFreq = 16 * baudRate / gcd(clkFreq, 16 * baudRate)
	 --   For example if clock frequency is 100MHz and 
	 --   baud-rate is 9600, then gcd(16*9600,10^8) is
	 --   3200.  So Baud-frequency will be 16*9600/3200 = 48
         baudFreq  : in std_logic_vector(11 downto 0);
         -- baudLimit = clkFreq / gcd(clkFreq, 16 * baudRate) - baudFreq
	 --   For example if clock frequency is 100MHz and
	 --   baud-rate is 9600, the gcd is 3200.  So 
	 --   baudLimit = 31202.
        baudLimit : in std_logic_vector(15 downto 0));
  end component;

  -- clock frequency for AJIT platform is 100 MHz.
  constant clock_frequency :integer := 100000000; -- 100 MHz.

  -- baudFreq = 16 * baudRate / gcd(clkFreq, 16 * baudRate)
  --   For example if clock frequency is 100MHz and 
  --   baud-rate is 9600, then gcd(16*9600,10^8) is
  --   6400.  So Baud-frequency will be 16*9600/6400 = 24
  constant uart_baudFreq_9600  : integer := 24;     -- assumes clk frequency = 100MHz.

  -- baudLimit = clkFreq / gcd(clkFreq, 16 * baudRate) - baudFreq
  --   For example if clock frequency is 100MHz and
  --   baud-rate is 9600, the gcd is 6400.  So 
  --   baudLimit = 15601.
  constant uart_baudLimit_9600 : integer := 15601;  -- assumes clk frequency = 100MHz.

  --  16*115200/gcd(100000000,16*115200) = 16*115200/6400 = 115200/400 = 288.
  constant uart_baudFreq_115200  : integer := 288;
  --  100000000/gcd(100000000,16*115200)  - 288 = 100000000/6400 - 288 = 
  constant uart_baudLimit_115200 : integer := 15337; 

end uartPackage;

package body uartPackage is
 	-- assumption: x,y are > 0
	function constGcd(x,y: integer) return integer is
                variable ret_var: integer;
                variable temp_var: integer;
        begin
                if (x = y) then
                        ret_var := x;
                elsif ((x = 1) or (y = 1)) then
                        ret_var := 1;
                elsif (x > y) then
                        temp_var := (x rem y);
			if(temp_var = 0) then
				ret_var := y;
			else
                        	ret_var  := constGcd (y, temp_var);
			end if;
                else
                        temp_var := (y rem x);
			if(temp_var = 0) then
				ret_var := x;
			else
                        	ret_var  := constGcd (x, temp_var);
			end if;
                end if;
                return ret_var;
        end constGcd;

end uartPackage;
-----------------------------------------------------------------------------------------
-- baud rate generator for uart 
--
-- this module has been changed to receive the baud rate dividing counter from registers.
-- the two registers should be calculated as follows:
-- first register:
--              baud_freq = 16*baud_rate / gcd(global_clock_freq, 16*baud_rate)
-- second register:
--              baud_limit = (global_clock_freq / gcd(global_clock_freq, 16*baud_rate)) - baud_freq 
--
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity baudGen is
  port ( clr       : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
         -- baudFreq = 16 * baudRate / gcd(clkFreq, 16 * baudRate)
         baudFreq  : in  std_logic_vector(11 downto 0); -- baud rate setting registers - see header description
         -- baudLimit = clkFreq / gcd(clkFreq, 16 * baudRate) - baudFreq
         baudLimit : in  std_logic_vector(15 downto 0); -- baud rate setting registers - see header description
         ce16      : out std_logic);                    -- baud rate multiplyed by 16
end baudGen;

architecture Behavioral of baudGen is
  signal counter : std_logic_vector(15 downto 0);
begin
    -- baud divider counter
    -- clock divider output
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          counter <= (others => '0');
          ce16 <= '0';
	elsif (counter >= baudLimit) then
            counter <= std_logic_vector(unsigned(counter) - unsigned(baudLimit));
            ce16 <= '1';
        else
            counter <= std_logic_vector(unsigned(counter) + unsigned(baudFreq));
            ce16 <= '0';
        end if;
      end if;
    end process;

end Behavioral;
library ieee;
use ieee.std_logic_1164.all;

  
entity uartBridge is
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
end entity uartBridge;


architecture Behave of uartBridge is
	type TxFsmState is (IDLE, BUSY);
	signal tx_fsm_state: TxFsmState;
	signal tx_register : std_logic_vector(7 downto 0);

	type RxFsmState is (EMPTY, FULL);
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
			when IDLE => 
				if((txBusy='0') and (uart_tx_pipe_write_req(0) = '1')) then
					next_tx_fsm_state := BUSY;
					tx_latch_var := '1';
				end if;
			when BUSY =>
				newTxData_var := '1';
				if(txBusy = '0') then
					next_tx_fsm_state := IDLE;
				end if;
		end case;

		uart_tx_pipe_write_ack(0) <= tx_latch_var;
		newTxData <= newTxData_var;

		if (clk'event and clk = '1') then
			if(reset = '1') then
				tx_fsm_state <= IDLE;
			else
				tx_fsm_state <= next_tx_fsm_state;
			end if;
				
			if(tx_latch_var = '1') then
				tx_register <= uart_tx_pipe_write_data;
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
				rx_fsm_state <= EMPTY;
			else
				rx_fsm_state <= next_rx_fsm_state;
			end if;

			if(rx_latch_var = '1') then
				rx_register <= rxData;
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

entity uartRx is
  port ( clr       : in  std_logic;                    -- global reset input
         clk       : in  std_logic;                    -- global clock input
         ce16      : in  std_logic;                    -- baud rate multiplyed by 16 - generated by baud module
         serIn     : in  std_logic;                    -- serial data input
         rxData    : out std_logic_vector(7 downto 0); -- data byte received
         newRxData : out std_logic);                   -- signs that a new byte was received
end uartRx;

architecture Behavioral of uartRx is

  signal ce1      : std_logic;                    -- clock enable at bit rate
  signal ce1Mid   : std_logic;                    -- clock enable at the middle of each bit - used to sample data
  signal inSync   : std_logic_vector(1 downto 0);
  signal count16  : std_logic_vector(3 downto 0);
  signal rxBusy   : std_logic;
  signal bitCount : std_logic_vector(3 downto 0);
  signal dataBuf  : std_logic_vector(7 downto 0);

  begin
    -- input async input is sampled twice
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          inSync <= (others => '1');
        else
          inSync <= inSync(0) & serIn;
        end if;
      end if;
    end process;
    -- a counter to count 16 pulses of ce_16 to generate the ce_1 and ce_1_mid pulses.
    -- this counter is used to detect the start bit while the receiver is not receiving and
    -- signs the sampling cycle during reception.
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          count16 <= (others => '0');
        elsif (ce16 = '1') then
            if ((rxBusy = '1') or (inSync(1) = '0')) then
              count16 <= std_logic_vector(unsigned(count16) + 1);
            else
              count16 <= (others => '0');
            end if;
        end if;
      end if;
    end process;

    -- receiving busy flag
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          rxBusy <= '0';
        elsif ((rxBusy = '0') and (ce1Mid = '1')) then
            rxBusy <= '1';
        elsif ((rxBusy = '1') and (bitCount = "1000") and (ce1Mid = '1')) then
            rxBusy <= '0';
        end if;
      end if;
    end process;
    -- bit counter
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          bitCount <= (others => '0');
        elsif (rxBusy = '0') then
            bitCount <= (others => '0');
        elsif ((rxBusy = '1') and (ce1Mid = '1')) then
            bitCount <= std_logic_vector(unsigned(bitCount) + 1);
        end if;
      end if;
    end process;
    -- data buffer shift register
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
           dataBuf <= (others => '0');
        elsif ((rxBusy = '1') and (ce1Mid = '1')) then
          dataBuf <= inSync(1) & dataBuf(7 downto 1);
        end if;
      end if;
    end process;
    -- data output and flag
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          rxData <= (others => '0');
          newRxData <= '0';
        elsif ((rxBusy = '1') and (bitCount = "1000") and (ce1 = '1')) then
          rxData <= dataBuf;
          newRxData <= '1';
        else
          newRxData <= '0';
        end if;
      end if;
    end process;
    -- ce_1 pulse indicating expected end of current bit
    ce1 <= '1' when ((count16 = "1111") and (ce16 = '1')) else '0';
    -- ce_1_mid pulse indication the sampling clock cycle of the current data bit
    ce1Mid <= '1' when ((count16 = "0111") and (ce16 = '1')) else '0';
  end Behavioral;
-----------------------------------------------------------------------------------------
-- uart top level module  
--
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.uartPackage.all;

entity uartTopBase is
  port ( -- global signals
         clr       : in  std_logic;                     -- global reset input
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
         -- baud rate configuration register - see baudGen.vhd for details
         baudFreq  : in  std_logic_vector(11 downto 0); -- baud rate setting registers - see header description
         baudLimit : in  std_logic_vector(15 downto 0); -- baud rate setting registers - see header description
         baudClk   : out std_logic);                    -- 
end uartTopBase;

architecture Behavioral of uartTopBase is

  signal ce16 : std_logic; -- clock enable at bit rate

  begin
    -- baud rate generator module
    bg : baudGen
      port map (
        clr => clr,
        clk => clk,
        baudFreq => baudFreq,
        baudLimit => baudLimit,
        ce16 => ce16);
    -- uart receiver
    ut : uartTx
      port map (
        clr => clr,
        clk => clk,
        ce16 => ce16,
        txData => txData,
        newTxData => newTxData,
        serOut => serOut,
        txBusy => txBusy);
    -- uart transmitter
    ur : uartRx
      port map (
        clr => clr,
        clk => clk,
        ce16 => ce16,
        serIn => serIn,
        rxData => rxData,
        newRxData => newRxData);
    baudClk <= ce16;
  end Behavioral;
-----------------------------------------------------------------------------------------
-- uart top level module  
--
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.uartPackage.all;


entity uartTopGenericConfigurable is
  generic (
         	-- baudFreq = 16 * baudRate / gcd(clkFreq, 16 * baudRate)
		--   For example if clock frequency is 100MHz and 
		--   baud-rate is 9600, then gcd(16*9600,10^8) is
		--   6400.  So Baud-frequency will be 16*9600/6400 = 24
         	baudFreq  : integer:= 24;
         	-- baudLimit = clkFreq / gcd(clkFreq, 16 * baudRate) - baudFreq
		--   For example if clock frequency is 100MHz and
		--   baud-rate is 9600, the gcd is 6400.  So 
		--   baudLimit = 15601.
         	baudLimit : integer := 15601);
  port ( -- global signals
         reset     : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
         -- uart serial signals
         serIn     : in  std_logic;                     -- serial data input
         serOut    : out std_logic;                     -- serial data output
         -- pipe signals for tx/rx.
	 uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	 uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	 uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	 uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0));
end uartTopGenericConfigurable;

architecture Struct of uartTopGenericConfigurable is

  signal soft_reset: std_logic;
  signal ce16 : std_logic; -- clock enable at bit rate
  signal baudFreq_sig  : std_logic_vector(11 downto 0); -- baud rate setting registers - see header description
  signal baudLimit_sig : std_logic_vector(15 downto 0); -- baud rate setting registers - see header description
  signal baudClk   : std_logic;                    -- 
        
  signal txData    : std_logic_vector(7 downto 0);  -- data byte to transmit
  signal newTxData : std_logic;                     -- asserted to indicate that there is a new data byte for transmission
  signal txBusy    : std_logic;                     -- signs that transmitter is busy
  signal rxData    : std_logic_vector(7 downto 0);  -- data byte received
  signal newRxData : std_logic;                     -- signs that a new byte was received
begin

  baudFreq_sig  <= std_logic_vector(to_unsigned(baudFreq,12));
  baudLimit_sig <= std_logic_vector(to_unsigned(baudLimit,16));

  soft_reset <= '0';

   baseInst: uartTopPortConfigurable
      port map ( 
			reset     => reset,
           		clk       => clk,
                        soft_reset => soft_reset,
           		serIn     => serIn,    
           		serOut    => serOut,   
           		baudFreq  => baudFreq_sig, 
           		baudLimit => baudLimit_sig,
	   		uart_rx_pipe_read_data=> uart_rx_pipe_read_data,
	   		uart_rx_pipe_read_req=> uart_rx_pipe_read_req,
	   		uart_rx_pipe_read_ack=> uart_rx_pipe_read_ack,
	   		uart_tx_pipe_write_data=> uart_tx_pipe_write_data,
	   		uart_tx_pipe_write_req=> uart_tx_pipe_write_req,
	   		uart_tx_pipe_write_ack=> uart_tx_pipe_write_ack
           		);
end Struct;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.uartPackage.all;


entity uartTopGenericEasilyConfigurable is
  generic (
         	baud_rate  : integer:= 115200;
         	clock_frequency : integer := 100000000);
  port ( -- global signals
         reset     : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
         -- uart serial signals
         serIn     : in  std_logic;                     -- serial data input
         serOut    : out std_logic;                     -- serial data output
         -- pipe signals for tx/rx.
	 uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	 uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	 uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	 uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0));
end uartTopGenericEasilyConfigurable;

architecture Struct of uartTopGenericEasilyConfigurable is

  signal soft_reset: std_logic;
  signal ce16 : std_logic; -- clock enable at bit rate

  constant gcd_int : integer := constGcd(clock_frequency, 16*baud_rate);

  constant baudFreq_int : integer := (16*baud_rate)/gcd_int;
  constant baudLimit_int : integer := (clock_frequency/gcd_int) - baudFreq_int;

  signal baudFreq_sig  : std_logic_vector(11 downto 0); -- baud rate setting registers - see header description
  signal baudLimit_sig : std_logic_vector(15 downto 0); -- baud rate setting registers - see header description

  signal baudClk   : std_logic;                    -- 
        
  signal txData    : std_logic_vector(7 downto 0);  -- data byte to transmit
  signal newTxData : std_logic;                     -- asserted to indicate that there is a new data byte for transmission
  signal txBusy    : std_logic;                     -- signs that transmitter is busy
  signal rxData    : std_logic_vector(7 downto 0);  -- data byte received
  signal newRxData : std_logic;                     -- signs that a new byte was received
begin

  baudFreq_sig  <= std_logic_vector(to_unsigned(baudFreq_int,12));
  baudLimit_sig <= std_logic_vector(to_unsigned(baudLimit_int,16));

  soft_reset <= '0';

  baseInst: uartTopPortConfigurable
      port map ( 
			reset     => reset,
           		clk       => clk,
                        soft_reset => soft_reset,
           		serIn     => serIn,    
           		serOut    => serOut,   
           		baudFreq  => baudFreq_sig, 
           		baudLimit => baudLimit_sig,
	   		uart_rx_pipe_read_data=> uart_rx_pipe_read_data,
	   		uart_rx_pipe_read_req=> uart_rx_pipe_read_req,
	   		uart_rx_pipe_read_ack=> uart_rx_pipe_read_ack,
	   		uart_tx_pipe_write_data=> uart_tx_pipe_write_data,
	   		uart_tx_pipe_write_req=> uart_tx_pipe_write_req,
	   		uart_tx_pipe_write_ack=> uart_tx_pipe_write_ack
           		);
end Struct;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.uartPackage.all;


entity uartTopPortConfigurable is
  port ( -- global signals
         reset     : in  std_logic;                     -- global reset input
         clk       : in  std_logic;                     -- global clock input
	 -- software reset
         soft_reset: in std_logic;
         -- uart serial signals
         serIn     : in  std_logic;                     -- serial data input
         serOut    : out std_logic;                     -- serial data output
         -- pipe signals for tx/rx.
	 uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	 uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	 uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	 uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	 uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0);
         -- baudFreq = 16 * baudRate / gcd(clkFreq, 16 * baudRate)
	 --   For example if clock frequency is 100MHz and 
	 --   baud-rate is 9600, then gcd(16*9600,10^8) is
	 --   6400.  So Baud-frequency will be 16*9600/6400 = 24
         baudFreq  : in std_logic_vector(11 downto 0);
         -- baudLimit = clkFreq / gcd(clkFreq, 16 * baudRate) - baudFreq
	 --   For example if clock frequency is 100MHz and
	 --   baud-rate is 9600, the gcd is 6400.  So 
	 --   baudLimit = 15601.
        baudLimit : in std_logic_vector(15 downto 0));
end uartTopPortConfigurable;

architecture Struct of uartTopPortConfigurable is

  signal ce16 : std_logic; -- clock enable at bit rate
  signal baudClk   : std_logic;                    -- 
        
  signal txData    : std_logic_vector(7 downto 0);  -- data byte to transmit
  signal newTxData : std_logic;                     -- asserted to indicate that there is a new data byte for transmission
  signal txBusy    : std_logic;                     -- signs that transmitter is busy
  signal rxData    : std_logic_vector(7 downto 0);  -- data byte received
  signal newRxData : std_logic;                     -- signs that a new byte was received

  signal combined_reset: std_logic;
begin
  
   combined_reset <= reset or soft_reset;

   baseInst: uartTopBase
      port map ( 
			clr       => combined_reset,
           		clk       => clk,
           		serIn     => serIn,    
           		txData    => txData,   
           		newTxData => newTxData,
           		baudFreq  => baudFreq, 
           		baudLimit => baudLimit,
           		serOut    => serOut,   
           		txBusy    => txBusy,   
           		rxData    => rxData,   
           		newRxData => newRxData,
           		baudClk   => baudClk   
		);

   bridgeInst: uartBridge
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
-- uart transmit module  
--
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uartTx is
  port ( clr       : in  std_logic;                    -- global reset input
         clk       : in  std_logic;                    -- global clock input
         ce16      : in  std_logic;                    -- baud rate multiplyed by 16 - generated by baud module
         txData    : in  std_logic_vector(7 downto 0); -- data byte to transmit
         newTxData : in  std_logic;                    -- asserted to indicate that there is a new data byte for transmission
         serOut    : out std_logic;                    -- serial data output
         txBusy    : out std_logic);                   -- signs that transmitter is busy
end uartTx;

architecture Behavioral of uartTx is

  signal iTxBusy  : std_logic;
  signal ce1      : std_logic; -- clock enable at bit rate
  signal count16  : std_logic_vector(3 downto 0);
  signal bitCount : std_logic_vector(3 downto 0);
  signal dataBuf  : std_logic_vector(8 downto 0);

  begin
    -- a counter to count 16 pulses of ce_16 to generate the ce_1 pulse
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          count16 <= (others => '0');
        elsif ((iTxBusy = '1') and (ce16 = '1')) then
            count16 <= std_logic_vector(unsigned(count16) + 1);
        elsif (iTxBusy = '0') then
            count16 <= (others => '0');
        end if;
      end if;
    end process;
    -- tx_busy flag
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          iTxBusy <= '0';
        elsif ((iTxBusy = '0') and (newTxData = '1')) then
            iTxBusy <= '1';
        elsif ((iTxBusy = '1') and (bitCount = "1001") and (ce1 = '1')) then
            iTxBusy <= '0';
        end if;
      end if;
    end process;
    -- output bit counter
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          bitCount <= (others => '0');
        elsif ((iTxBusy = '1') and (ce1 = '1')) then
            bitCount <= std_logic_vector(unsigned(bitCount) + 1);
        elsif (iTxBusy = '0') then
            bitCount <= (others => '0');
        end if;
     end if;
    end process;
    -- data shift register
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          dataBuf <= (others => '0');
        elsif (iTxBusy = '0') then
            dataBuf <= txData & '0';
        elsif ((iTxBusy = '1') and (ce1 = '1')) then
            dataBuf <= '1' & dataBuf(8 downto 1);
        end if;
      end if;
    end process;
    -- output data bit
    process (clr, clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          serOut <= '1';
        elsif (iTxBusy = '1') then
            serOut <= dataBuf(0);
        else
            serOut <= '1';
        end if;
      end if;
    end process;
    -- ce_1 pulse indicating output data bit should be updated
    ce1 <= '1' when ((count16 = "1111") and (ce16 = '1')) else '0';
    txBusy <= iTxBusy;
  end Behavioral;
