library ieee;
use ieee.std_logic_1164.all;

package SpiMasterLibComponents is

   ------------------------------------------------------------------------------------------------------------------
   -- SPI
   ------------------------------------------------------------------------------------------------------------------
   component spi_master is
    port (
    --+ CPU Interface Signals
    clk                : in  std_logic;
    reset              : in  std_logic;
    cs                 : in  std_logic;
    rw                 : in  std_logic;
    addr               : in  std_logic_vector(1 downto 0);
    data_in            : in  std_logic_vector(7 downto 0);
    data_out           : out std_logic_vector(7 downto 0);
    irq                : out std_logic;
    done	       : out std_logic;  -- added to indicate complete of transfer MPD
    --+ SPI Interface Signals
    spi_miso           : in  std_logic;
    spi_mosi           : out std_logic;
    spi_clk            : out std_logic;
    spi_cs_n           : out std_logic_vector(7 downto 0)
    );
   end component;
   component spi_pipe_master_bridge is
	port (
		--
		-- unused  read/write-bar address data 
		--   5       1               2      8
		--
		master_in_data_pipe_write_data: in  std_logic_vector(15 downto 0);
		master_in_data_pipe_write_req:  in  std_logic_vector(0 downto 0);
		master_in_data_pipe_write_ack:  out std_logic_vector(0 downto 0);
		--
		-- response data 
		--
		master_out_data_pipe_read_data: out  std_logic_vector(7 downto 0);
		master_out_data_pipe_read_req:  in  std_logic_vector(0 downto 0);
		master_out_data_pipe_read_ack:  out std_logic_vector(0 downto 0);
		-- spi-master side.
		cs_to_spi_master: out std_logic;
		rw_to_spi_master: out std_logic;
		addr_to_spi_master: out std_logic_vector(1 downto 0);
		data_to_spi_master: out std_logic_vector(7 downto 0);
		data_from_spi_master: in std_logic_vector(7 downto 0);
		irq_from_spi_master: in std_logic;
		done_from_spi_master: in std_logic;
		-- clk, reset
		clk, reset: in std_logic
	     );
   end component;
   component spi_master_stub is
	port (
		--
		-- unused  read/write-bar address data 
		--   5       1               2      8
		--
		master_in_data_pipe_write_data: in  std_logic_vector(15 downto 0);
		master_in_data_pipe_write_req:  in  std_logic_vector(0 downto 0);
		master_in_data_pipe_write_ack:  out std_logic_vector(0 downto 0);
		--
		-- response data 
		--
		master_out_data_pipe_read_data: out  std_logic_vector(7 downto 0);
		master_out_data_pipe_read_req:  in  std_logic_vector(0 downto 0);
		master_out_data_pipe_read_ack:  out std_logic_vector(0 downto 0);
		-- spi-master side.
		spi_miso: in std_logic_vector(0 downto 0);
		spi_mosi: out std_logic_vector(0 downto 0);
		spi_clk: out std_logic_vector(0 downto 0);
		spi_cs_n: out std_logic_vector(7 downto 0);
		clk, reset: in std_logic
	     );
   end component;
   component spi_slave_pipe_bridge is
	generic (ignore_zero_rx_data: boolean := true; tristate_miso_flag : boolean := true);
	port (
		-- SPI interface
		spi_mosi: in std_logic;   -- master-out-slave-in
		spi_miso: out std_logic;  -- master-in-slave-out
		spi_ss_bar: in std_logic; -- slave-select active low
		spi_clk  : in std_logic;  -- spi-clk
		-- pipe interface
		-- output pipe
		out_data_pipe_read_data: out std_logic_vector(7 downto 0);
		out_data_pipe_read_req : in std_logic_vector(0 downto 0);
		out_data_pipe_read_ack : out std_logic_vector(0 downto 0);
		-- input pipe	
		in_data_pipe_write_data: in std_logic_vector(7 downto 0);
		in_data_pipe_write_req : in std_logic_vector(0 downto 0);
		in_data_pipe_write_ack : out std_logic_vector(0 downto 0);
		--
		clk, reset: in std_logic	
	     );
    end component spi_slave_pipe_bridge;
    component spi_slave_binary_pipe_bridge is
	port (
		-- SPI interface
		spi_mosi: in std_logic;   -- master-out-slave-in
		spi_miso: out std_logic;  -- master-in-slave-out
		spi_ss_bar: in std_logic; -- slave-select active low
		spi_clk  : in std_logic;  -- spi-clk
		-- pipe interface
		-- output pipe
		out_data_pipe_read_data: out std_logic_vector(7 downto 0);
		out_data_pipe_read_req : in std_logic_vector(0 downto 0);
		out_data_pipe_read_ack : out std_logic_vector(0 downto 0);
		-- input pipe	
		in_data_pipe_write_data: in std_logic_vector(7 downto 0);
		in_data_pipe_write_req : in std_logic_vector(0 downto 0);
		in_data_pipe_write_ack : out std_logic_vector(0 downto 0);
		--
		clk, reset: in std_logic	
	     );
    end component spi_slave_binary_pipe_bridge;
    component spi_slave_pipe_bridge_simplified is
	generic (tristate_miso_flag : boolean := true);
	port (
		-- SPI interface
		spi_mosi: in std_logic;   -- master-out-slave-in
		spi_miso: out std_logic;  -- master-in-slave-out
		spi_ss_bar: in std_logic; -- slave-select active low
		spi_clk  : in std_logic;  -- spi-clk
		-- pipe interface
		-- output pipe
		out_data_pipe_read_data: out std_logic_vector(7 downto 0);
		out_data_pipe_read_req : in std_logic_vector(0 downto 0);
		out_data_pipe_read_ack : out std_logic_vector(0 downto 0);
		-- input pipe	
		in_data_pipe_write_data: in std_logic_vector(7 downto 0);
		in_data_pipe_write_req : in std_logic_vector(0 downto 0);
		in_data_pipe_write_ack : out std_logic_vector(0 downto 0);
		--
		clk, reset: in std_logic	
	     );
    end component spi_slave_pipe_bridge_simplified;

    component spi_byte_ram is
	generic (addr_width_in_bytes: integer := 2; 
			-- to model a big ram with fewer internal memory locations.
			internal_addr_width: integer := 16;
			use_write_enable_control: boolean := false);
	port (CS_L: in std_logic_vector(0 downto 0);
			SPI_MISO: out std_logic_vector(0 downto 0);
			SPI_MOSI: in std_logic_vector(0 downto 0);
			SPI_CLK: in std_logic_vector(0 downto 0);
			clk, reset: in std_logic);
    end component spi_byte_ram;
  
    component spi_bootrom  is
	port (CS_L: in std_logic;
			SPI_MASTER_MISO: out std_logic_vector(0 downto 0);
			SPI_MASTER_MOSI: in std_logic_vector(0 downto 0);
			SPI_MASTER_CLK: in std_logic_vector(0 downto 0);
			clk, reset: in std_logic);
    end component spi_bootrom;

    component spi_gpio is
	port (CS_L: in std_logic;
			SPI_MASTER_MISO: out std_logic_vector(0 downto 0);
			SPI_MASTER_MOSI: in std_logic_vector(0 downto 0);
			SPI_MASTER_CLK: in std_logic_vector(0 downto 0);
			GPIO_IN: in std_logic_vector (7 downto 0);
			GPIO_OUT: out std_logic_vector (7 downto 0);
			clk, reset: in std_logic);
    end component spi_gpio;

    component spi_ping is
	port (CS_L: in std_logic;
			SPI_MASTER_MISO: out std_logic_vector(0 downto 0);
			SPI_MASTER_MOSI: in std_logic_vector(0 downto 0);
			SPI_MASTER_CLK: in std_logic_vector(0 downto 0);
			clk, reset: in std_logic);
    end component spi_ping;

    component spi_byte_ram_with_init is
	generic (	mmap_file_name: string;
			addr_width_in_bytes: integer := 3; 
			-- to model a big ram with fewer internal memory locations.
			internal_addr_width: integer := 24;
			use_write_enable_control: boolean := false);
	port (CS_L: in std_logic_vector(0 downto 0);
			SPI_MISO: out std_logic_vector(0 downto 0);
			SPI_MOSI: in std_logic_vector(0 downto 0);
			SPI_CLK: in std_logic_vector(0 downto 0);
			clk, reset: in std_logic);
   end component spi_byte_ram_with_init;

end package;
library ieee;
use ieee.std_logic_1164.all;

entity spi_master_stub is
	port (
		--
		-- unused  read/write-bar address data 
		--   5       1               2      8
		--
		master_in_data_pipe_write_data: in  std_logic_vector(15 downto 0);
		master_in_data_pipe_write_req:  in  std_logic_vector(0 downto 0);
		master_in_data_pipe_write_ack:  out std_logic_vector(0 downto 0);
		--
		-- response data 
		--
		master_out_data_pipe_read_data: out  std_logic_vector(7 downto 0);
		master_out_data_pipe_read_req:  in  std_logic_vector(0 downto 0);
		master_out_data_pipe_read_ack:  out std_logic_vector(0 downto 0);
		-- spi-master side.
		spi_miso: in std_logic_vector(0 downto 0);
		spi_mosi: out std_logic_vector(0 downto 0);
		spi_clk: out std_logic_vector(0 downto 0);
		spi_cs_n: out std_logic_vector(7 downto 0);
		clk, reset: in std_logic
	     );
end entity;


architecture Struct of spi_master_stub is
	
	-- signals to connect to master.
	signal cs: std_logic;
	signal rw: std_logic;
	signal addr: std_logic_vector(1 downto 0);
	signal data_in: std_logic_vector(7 downto 0);
	signal data_out: std_logic_vector(7 downto 0);
	signal irq: std_logic;
	signal done: std_logic;

	component spi_pipe_master_bridge is
	  port (
		--
		-- unused  read/write-bar address data 
		--   5       1               2      8
		--
		master_in_data_pipe_write_data: in  std_logic_vector(15 downto 0);
		master_in_data_pipe_write_req:  in  std_logic_vector(0 downto 0);
		master_in_data_pipe_write_ack:  out std_logic_vector(0 downto 0);
		--
		-- response data 
		--
		master_out_data_pipe_read_data: out  std_logic_vector(7 downto 0);
		master_out_data_pipe_read_req:  in  std_logic_vector(0 downto 0);
		master_out_data_pipe_read_ack:  out std_logic_vector(0 downto 0);
		-- spi-master side.
		cs_to_spi_master: out std_logic;
		rw_to_spi_master: out std_logic;
		addr_to_spi_master: out std_logic_vector(1 downto 0);
		data_to_spi_master: out std_logic_vector(7 downto 0);
		data_from_spi_master: in std_logic_vector(7 downto 0);
		irq_from_spi_master: in std_logic;
		done_from_spi_master: in std_logic;
		-- clk, reset
		clk, reset: in std_logic
	     );
	end component;
	component spi_master is
  	  port (
    	  	--+ CPU Interface Signals
    		clk                : in  std_logic;
    		reset              : in  std_logic;
    		cs                 : in  std_logic;
    		rw                 : in  std_logic;
    		addr               : in  std_logic_vector(1 downto 0);
    		data_in            : in  std_logic_vector(7 downto 0);
    		data_out           : out std_logic_vector(7 downto 0);
    		irq                : out std_logic;
    		done	       : out std_logic;  -- added to indicate complete of transfer MPD
    		--+ SPI Interface Signals
    		spi_miso           : in  std_logic;
    		spi_mosi           : out std_logic;
    		spi_clk            : out std_logic;
    		spi_cs_n           : out std_logic_vector(7 downto 0)
    		);
        end component;

begin

	bridgeInst: spi_pipe_master_bridge 
		port map (
				master_in_data_pipe_write_data => master_in_data_pipe_write_data,
				master_in_data_pipe_write_req => master_in_data_pipe_write_req,
				master_in_data_pipe_write_ack => master_in_data_pipe_write_ack,
				master_out_data_pipe_read_data => master_out_data_pipe_read_data,
				master_out_data_pipe_read_req => master_out_data_pipe_read_req,
				master_out_data_pipe_read_ack => master_out_data_pipe_read_ack,
				cs_to_spi_master => cs,
				rw_to_spi_master => rw,
				addr_to_spi_master => addr,
				data_to_spi_master => data_in,
				data_from_spi_master => data_out,
				irq_from_spi_master => irq,
				done_from_spi_master => done,
				clk => clk, reset => reset 
			);

	spiMaster: spi_master
		port map (
    				clk => clk,
    				reset => reset,
    				cs => cs,
    				rw => rw,
    				addr => addr,
    				data_in => data_in,
    				data_out => data_out,
    				irq => irq,
    				done => done,
    				--+ SPI Interface Signals
    				spi_miso => spi_miso(0),
    				spi_mosi => spi_mosi(0),
    				spi_clk => spi_clk(0),
    				spi_cs_n => spi_cs_n
			);

end Struct;
--===========================================================================--
--                                                                           --
--             Synthesizable Serial Peripheral Interface Master              --
--                                                                           --
--===========================================================================--
--
--  File name      : spi-master.vhd
--
--  Entity name    : spi-master
--
--  Purpose        : Implements a SPI Master Controller
--
--  Dependencies   : ieee.std_logic_1164
--                   ieee.std_logic_unsigned
--
--  Author         : Hans Huebner
--
--  Email          : hans at the domain huebner.org
--
--  Web            : http://opencores.org/project,system09
--
--  Description    : This core implements a SPI master interface.
--                   Transfer size is 4, 8, 12 or 16 bits.
--                   The SPI clock is 0 when idle, sampled on
--                   the rising edge of the SPI clock.
--                   The SPI clock is derived from the bus clock input
--                   divided by 2, 4, 8 or 16.
--
--                   clk, reset, cs, rw, addr, data_in, data_out and irq
--                   represent the System09 bus interface.
--                   spi_clk, spi_mosi, spi_miso and spi_cs_n are the
--                   standard SPI signals meant to be routed off-chip.
--
--                   The SPI core provides for four register addresses
--                   that the CPU can read or writen to:
--
--                   Base + $00 -> DL: Data Low LSB
--                   Base + $01 -> DH: Data High MSB
--                   Base + $02 -> CS: Command/Status
--                   Base + $03 -> CO: Config
--
--                   CS: Write bits:
--
--                   CS[0]   START : Start transfer
--                   CS[1]   END   : Deselect device after transfer
--                                   (or immediately if START = '0')
--                   CS[2]   IRQEN : Generate IRQ at end of transfer
--                   CS[6:4] SPIAD : SPI device address
--
--                   CS: Read bits
--
--                   CS[0]   BUSY  : Currently transmitting data
--
--                   CO: Write bits
--
--                   CO[3:0] DIVIDE: SPI clock divisor,
--				(27/11/2016 MPD: modified from 2 to 4 bits to provide more range for division).
--                                   0000=clk/2,
--                                   0001=clk/4,
--                                   0010=clk/8,
--                                   0011=clk/16
--                                   0100=clk/32
--                                   0101=clk/64
--                                   0110=clk/128
--                                   0111=clk/256
--                                   1000=clk/1024
--                                   1001=clk/2048
--                                   1010=clk/4096
--                                   1011=clk/8192
--                                   1100=clk/16384
--                                   1101=clk/32768
--                                   1110=clk/65536
--                                   1111=clk/131072
--                   CO[5:4] LENGTH: Transfer length,
--                                   00= 4 bits,
--                                   01= 8 bits,
--                                   10=12 bits,
--                                   11=16 bits
--
--  Copyright (C) 2009 - 2010 Hans Huebner
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
--
--===========================================================================--
--                                                                           --
--                              Revision  History                            --
--                                                                           --
--===========================================================================--
--
-- Version  Author        Date               Description
--
-- 0.1      Hans Huebner  23 February 2009   SPI bus master for System09
-- 0.2      John Kent     16 June 2010       Added GPL notice
--
-- 26+/11/2016: modified by Madhav P. Desai (MPD), since we will be 
-- 		using only the rising edges of clock
--

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

--* @brief Synthesizable Serial Peripheral Interface Master
--*
--*
--* @author Hans Huebner and John E. Kent
--* @version 0.2 from 16 June 2010

entity spi_master is
  port (
    --+ CPU Interface Signals
    clk                : in  std_logic;
    reset              : in  std_logic;
    cs                 : in  std_logic;
    rw                 : in  std_logic;
    addr               : in  std_logic_vector(1 downto 0);
    data_in            : in  std_logic_vector(7 downto 0);
    data_out           : out std_logic_vector(7 downto 0);
    irq                : out std_logic;
    done	       : out std_logic;  -- added to indicate complete of transfer MPD
    --+ SPI Interface Signals
    spi_miso           : in  std_logic;
    spi_mosi           : out std_logic;
    spi_clk            : out std_logic;
    spi_cs_n           : out std_logic_vector(7 downto 0)
    );
end;

--* @brief Implements a SPI Master Controller
--*
--* This core implements a SPI master interface.
--* Transfer size is 4, 8, 12 or 16 bits.
--* The SPI clock is 0 when idle, sampled on
--* the rising edge of the SPI clock.
--* The SPI clock is derived from the bus clock input
--* divided by 2, 4, 8 or 16. (note: added division upto 1024: MPD 27/11/2016)

architecture rtl of spi_master is

  --* State type of the SPI transfer state machine
  type   state_type is (s_idle, s_running);
  signal state           : state_type;
  -- Shift register
  signal shift_reg       : std_logic_vector(15 downto 0);
  -- Buffer to hold data to be sent
  signal spi_data_buf    : std_logic_vector(15 downto 0);
  -- Start transmission flag
  signal start           : std_logic;
  -- Number of bits transfered
  signal count           : std_logic_vector(3 downto 0);
  -- Buffered SPI clock
  signal spi_clk_buf     : std_logic;
  -- Buffered SPI clock output
  signal spi_clk_out     : std_logic;
  -- Previous SPI clock state
  signal prev_spi_clk    : std_logic;
  -- Number of clk cycles-1 in this SPI clock period
  signal spi_clk_count   : std_logic_vector(14 downto 0); -- changed by MPD 27/11/2016
  -- SPI clock divisor
  signal spi_clk_divide  : std_logic_vector(3 downto 0);
  -- SPI transfer length
  signal transfer_length : std_logic_vector(1 downto 0);
  -- Flag to indicate that the SPI slave should be deselected after the current
  -- transfer
  signal deselect        : std_logic;
  -- Flag to indicate that an IRQ should be generated at the end of a transfer
  signal irq_enable      : std_logic;
  -- Internal chip select signal, will be demultiplexed through the cs_mux
  signal spi_cs          : std_logic;
  -- Current SPI device address
  signal spi_addr        : std_logic_vector(2 downto 0);
begin

  --* Read CPU bus into internal registers
  cpu_write : process(clk, reset)
  begin
    -- elsif falling_edge(clk) then
    if rising_edge(clk) then 
      if reset = '1' then
         deselect        <= '0';
         irq_enable      <= '0';
         start           <= '0';
         spi_clk_divide  <= "0011"; -- divide by 16 is the default.
         transfer_length <= "01";   -- byte transfer is the default.
         spi_data_buf    <= (others => '0');
      else 
         -------------
         start <= '0';
         if cs = '1' and rw = '0' then
           case addr is
             when "00" =>
               spi_data_buf(7 downto 0) <= data_in;
             when "01" =>
               spi_data_buf(15 downto 8) <= data_in;
             when "10" =>
               start      <= data_in(0);
               deselect   <= data_in(1);
               irq_enable <= data_in(2);
               spi_addr   <= data_in(6 downto 4);
             when "11" =>
               spi_clk_divide  <= data_in(3 downto 0);
               transfer_length <= data_in(5 downto 4);
             when others =>
               null;
           end case;
         end if; -- cs and write.
      end if; -- reset
    end if; -- rising edge of clock
  end process;

  --* Provide data for the CPU to read
  cpu_read : process(shift_reg, addr, state, deselect, start)
  begin
    data_out <= (others => '0');
    case addr is
      when "00" =>
        data_out <= shift_reg(7 downto 0);
      when "01" =>
        data_out <= shift_reg(15 downto 8);
      when "10" =>
        if state = s_idle then
          data_out(0) <= '0';
        else
          data_out(0) <= '1';
        end if;
        data_out(1) <= deselect;
      when others =>
        null;
    end case;
  end process;

  spi_cs_n <= "11111110" when spi_addr = "000" and spi_cs = '1' else
              "11111101" when spi_addr = "001" and spi_cs = '1' else
              "11111011" when spi_addr = "010" and spi_cs = '1' else
              "11110111" when spi_addr = "011" and spi_cs = '1' else
              "11101111" when spi_addr = "100" and spi_cs = '1' else
              "11011111" when spi_addr = "101" and spi_cs = '1' else
              "10111111" when spi_addr = "110" and spi_cs = '1' else
              "01111111" when spi_addr = "111" and spi_cs = '1' else
              "11111111";

  --* SPI transfer state machine
  spi_proc : process(clk, reset)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        count        <= (others => '0');
        shift_reg    <= (others => '0');
        prev_spi_clk <= '0';
        spi_clk_out  <= '0';
        spi_cs       <= '0';
        state        <= s_idle;
      -- irq          <= 'Z';
        irq          <= '0';  -- 27/11/2016 MPD: AJIT cpu will not use 'Z' internally.
        done         <= '0';
      else
        prev_spi_clk <= spi_clk_buf;
        -- irq          <= 'Z';
        irq          <= '0'; -- 27/11/2016 MPD: AJIT cpu will not use 'Z' internally.
        done         <= '0';
        case state is
          when s_idle =>
            if start = '1' then
              count     <= (others => '0');
              shift_reg <= spi_data_buf;
              spi_cs    <= '1';
              state     <= s_running;
            elsif deselect = '1' then
              spi_cs <= '0';
            end if;
          when s_running =>
            if prev_spi_clk = '1' and spi_clk_buf = '0' then
	      -- sample on falling edge of spi-clk.
              spi_clk_out <= '0';
              count       <= std_logic_vector(unsigned(count) + "0001");
              shift_reg   <= shift_reg(14 downto 0) & spi_miso;
              if ((count = "0011" and transfer_length = "00")
                    or (count = "0111" and transfer_length = "01")
                  or (count = "1011" and transfer_length = "10")
                  or (count = "1111" and transfer_length = "11")) then
                if deselect = '1' then
                  spi_cs <= '0';
                end if;
                if irq_enable = '1' then
                  irq <= '1';
                end if;
      	        done         <= '1';
                state <= s_idle;
              end if;
            elsif prev_spi_clk = '0' and spi_clk_buf = '1' then
              spi_clk_out <= '1';
            end if;
          when others =>
            null;
        end case;
      end if;  -- reset 
    end if; -- rising edge of clk
  end process;

  --* Generate SPI clock
  spi_clock_gen : process(clk, reset)
  begin
    -- elsif falling_edge(clk) then
    if rising_edge(clk) then
      if reset = '1' then
        spi_clk_count <= (others => '0');
        spi_clk_buf   <= '0';
      elsif state = s_running then
        if ((spi_clk_divide = "0000")
            or (spi_clk_divide = "0001" and spi_clk_count = "000000000000001")
            or (spi_clk_divide = "0010" and spi_clk_count = "000000000000011")
            or (spi_clk_divide = "0011" and spi_clk_count = "000000000000111")
            or (spi_clk_divide = "0100" and spi_clk_count = "000000000001111")
            or (spi_clk_divide = "0101" and spi_clk_count = "000000000011111")
            or (spi_clk_divide = "0110" and spi_clk_count = "000000000111111")
            or (spi_clk_divide = "0111" and spi_clk_count = "000000001111111")
            or (spi_clk_divide = "1000" and spi_clk_count = "000000011111111")
            or (spi_clk_divide = "1001" and spi_clk_count = "000000111111111")
            or (spi_clk_divide = "1010" and spi_clk_count = "000001111111111")
            or (spi_clk_divide = "1011" and spi_clk_count = "000011111111111")
            or (spi_clk_divide = "1100" and spi_clk_count = "000111111111111")
            or (spi_clk_divide = "1101" and spi_clk_count = "001111111111111")
            or (spi_clk_divide = "1110" and spi_clk_count = "011111111111111")
            or (spi_clk_divide = "1111" and spi_clk_count = "111111111111111")
	   ) 
	then
          spi_clk_buf <= not spi_clk_buf;
          spi_clk_count <= (others => '0');
        else
          spi_clk_count <= std_logic_vector(unsigned(spi_clk_count) + 1);
        end if;
      else
        spi_clk_buf <= '0';
      end if;
    end if; -- rising edge of clk.
  end process;

  spi_mosi_mux : process(shift_reg, transfer_length)
  begin
    case transfer_length is
    when "00" =>
      spi_mosi <= shift_reg(3);
    when "01" =>
      spi_mosi <= shift_reg(7);
    when "10" =>
      spi_mosi <= shift_reg(11);
    when "11" =>
      spi_mosi <= shift_reg(15);
    when others =>
      null;
    end case;
  end process;

  spi_clk  <= spi_clk_out;

end rtl;

--Generated on 19 Apr 2015 21:43:41 with VHDocL V0.2.5-13-g713cf52 
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

--
-- a bridge between a pipe interface and an spi-master
--
--  The pipe interface is used to access the spi-master
--  by sending a command/data pair on the input pipe "in_data".
--
--  Each command is eventually responded to by writing a
--  return value on the output pipe "master_out_data". 
--
--  The SPI master does generate an irq, but we will ignore
--  it.  The interrupt should be generated at a higher level.
--   (for example after reading the output pipe).
--
-- Madhav Desai 27/11/2016
--
entity spi_pipe_master_bridge is
	port (
		--
		-- unused  read/write-bar address data 
		--   5       1               2      8
		--
		master_in_data_pipe_write_data: in  std_logic_vector(15 downto 0);
		master_in_data_pipe_write_req:  in  std_logic_vector(0 downto 0);
		master_in_data_pipe_write_ack:  out std_logic_vector(0 downto 0);
		--
		-- response data 
		--
		master_out_data_pipe_read_data: out  std_logic_vector(7 downto 0);
		master_out_data_pipe_read_req:  in  std_logic_vector(0 downto 0);
		master_out_data_pipe_read_ack:  out std_logic_vector(0 downto 0);
		-- spi-master side.
		cs_to_spi_master: out std_logic;
		rw_to_spi_master: out std_logic;
		addr_to_spi_master: out std_logic_vector(1 downto 0);
		data_to_spi_master: out std_logic_vector(7 downto 0);
		data_from_spi_master: in std_logic_vector(7 downto 0);
		irq_from_spi_master: in std_logic;
		done_from_spi_master: in std_logic;
		-- clk, reset
		clk, reset: in std_logic
	     );
end entity;

architecture Behave of spi_pipe_master_bridge is
	signal start_transfer: std_logic;

	signal cs, rw: std_logic;
	signal addr: std_logic_vector(1 downto 0);
	signal data_in: std_logic_vector(7 downto 0);

	type BridgeState is (Idle, WriteData, WaitForDone, WaitOnPipe);
	signal fsm_state: BridgeState;

	signal master_in_datareg: std_logic_vector( 15 downto 0);

	signal master_spi_rw: std_logic;
	signal master_spi_reg_addr : std_logic_vector(1 downto 0);
	signal master_spi_data: std_logic_vector(7 downto 0);


	signal q_data_in, q_data_out : std_logic_vector (7 downto 0);
	signal q_push_req, q_push_ack, q_pop_req, q_pop_ack: std_logic;
	
begin

	master_out_data_pipe_read_data <= q_data_out;
	q_pop_req <= master_out_data_pipe_read_req(0);
	master_out_data_pipe_read_ack(0) <= q_pop_ack;

	queueInst: QueueBase 
			generic map (name => "SPI-MASTER-OUT-QUEUE", data_width => 8, queue_depth => 8)
			port map (
					clk => clk, reset => reset,
					data_in => q_data_in, data_out => q_data_out,
					push_req => q_push_req, push_ack => q_push_ack,	
					pop_req => q_pop_req, pop_ack => q_pop_ack	
				);

	master_spi_data <= master_in_datareg(7 downto 0);
	master_spi_reg_addr   <= master_in_datareg(9 downto 8);
	master_spi_rw   <= master_in_datareg(10);


	process(clk,reset,fsm_state, 
			master_in_data_pipe_write_req, 
			master_in_data_pipe_write_data, 
			master_in_datareg,
			data_from_spi_master,
			q_push_ack, 
			master_spi_data,
			master_spi_reg_addr,
			master_spi_rw,
			done_from_spi_master)
		variable next_fsm_state : BridgeState;
		variable master_in_data_pipe_write_ack_var : std_logic;
		variable cs_var, rw_var: std_logic;
		variable addr_var: std_logic_vector(1 downto 0);
		variable data_in_var: std_logic_vector(7 downto 0);
		variable next_master_in_datareg_var: std_logic_vector(15 downto 0);
		variable q_data_in_var : std_logic_vector(7 downto 0);
		variable q_push_req_var : std_logic;
	begin
		cs_var := '0'; 
		rw_var := '0';
		addr_var := master_spi_reg_addr;
		data_in_var := master_spi_data;
		next_fsm_state := fsm_state;
		master_in_data_pipe_write_ack_var := '0';
		next_master_in_datareg_var := master_in_datareg;
		q_data_in_var := (others => '0');
		q_push_req_var := '0';

		case fsm_state is
			when Idle =>
				-- listen on in-data pipe and register the
				-- data.
				master_in_data_pipe_write_ack_var := '1';
				if(master_in_data_pipe_write_req(0) = '1') then
					next_master_in_datareg_var := master_in_data_pipe_write_data;
					next_fsm_state := WriteData;
				end if;
			when WriteData =>
				-- do the write/read to the master.
				cs_var := '1'; 
				rw_var := master_spi_rw; 
				if((master_spi_rw = '0') and (master_spi_reg_addr = "10") and
						(master_spi_data(0) = '1')) then
					next_fsm_state := WaitForDone;
				else
					next_fsm_state := WaitOnPipe;
				end if;
			when WaitForDone => 
				-- if it is a transfer, wait for the done..
				if(done_from_spi_master = '1') then
					next_fsm_state := WaitOnPipe;
				end if;
			when WaitOnPipe =>
				-- wait to write to master data-out pipe.
				q_data_in_var := data_from_spi_master;
				q_push_req_var := '1';
				if(q_push_ack = '1') then
					next_fsm_state := idle;
				end if;
		end case;

		-- Mealy outputs..
		master_in_data_pipe_write_ack(0) <= master_in_data_pipe_write_ack_var;
		q_data_in <= q_data_in_var;
		q_push_req <= q_push_req_var;
		cs_to_spi_master <= cs_var;
		rw_to_spi_master <= rw_var;
		addr_to_spi_master <= addr_var;
		data_to_spi_master <= data_in_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= idle;	
				master_in_datareg <= (others => '0');
			else
				fsm_state <= next_fsm_state;
				master_in_datareg <= next_master_in_datareg_var;
			end if;
		end if;
	end process;
		

end Behave;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.BaseComponents.all;


--
-- SPI-slave to pipe bridge.
--    incoming byte on spi-data on mosi is written out to
--    out_data_pipe.
--       note: incoming byte is written to out-data-pipe only
--             if it is not a null.
--
--    incoming byte on in_data_pipe is shifted out
--    on miso.
--
--
entity spi_slave_pipe_bridge is
	generic (ignore_zero_rx_data: boolean := true; tristate_miso_flag : boolean := true);
	port (
		-- SPI interface
		spi_mosi: in std_logic;   -- master-out-slave-in
		spi_miso: out std_logic;  -- master-in-slave-out
		spi_ss_bar: in std_logic; -- slave-select active low
		spi_clk  : in std_logic;  -- spi-clk
		-- pipe interface
		out_data_pipe_read_data: out std_logic_vector(7 downto 0);
		out_data_pipe_read_req : in std_logic_vector(0 downto 0);
		out_data_pipe_read_ack : out std_logic_vector(0 downto 0);
		-- input pipe: if the internal queue is full, writes
		-- will be blocked.
		in_data_pipe_write_data: in std_logic_vector(7 downto 0);
		in_data_pipe_write_req : in std_logic_vector(0 downto 0);
		in_data_pipe_write_ack : out std_logic_vector(0 downto 0);
		--
		clk, reset: in std_logic	
	     );
end entity spi_slave_pipe_bridge;


architecture Behave of spi_slave_pipe_bridge is


	signal spi_clk_rising_edge, spi_clk_falling_edge: Boolean;
	signal last_spi_clk, spi_clk_d, spi_clk_d_d: std_logic;
	signal mosi_d, mosi_d_d: std_logic;
	signal spi_ss_bar_d, spi_ss_bar_d_d: std_logic;

	signal in_data_count : integer range 0 to 7;
	signal shift_completed : Boolean;

	type RxState is (RxIdle, RxWaitOnPipe);
	signal rx_state: RxState;
	signal rx_status: std_logic_vector(1 downto 0);
	signal rx_register: std_logic_vector(7 downto 0);
	constant ZERO_8: std_logic_vector(7 downto 0) := (others => '0');

	type TxState is (TxIdle, TxWaitOnPipe);
	signal tx_state: TxState;
	signal tx_status: std_logic_vector(1 downto 0);
	signal tx_register: std_logic_vector(7 downto 0);

	signal rx_queue_data_in, rx_queue_data_out: std_logic_vector(7 downto 0);
	signal rx_queue_push_req, rx_queue_push_ack, rx_queue_pop_req, rx_queue_pop_ack: std_logic;	

	signal tx_queue_data_in, tx_queue_data_out: std_logic_vector(7 downto 0);
	signal tx_queue_push_req, tx_queue_push_ack, tx_queue_pop_req, tx_queue_pop_ack: std_logic;	
begin
	rxQ: QueueBase generic map (name => "spiRxQueue", queue_depth => 8, data_width => 8)
				port map (clk => clk, reset => reset,
						data_in => rx_queue_data_in,
						data_out => rx_queue_data_out,
						push_req => rx_queue_push_req,
						push_ack => rx_queue_push_ack,
						pop_req => rx_queue_pop_req,
						pop_ack => rx_queue_pop_ack);
	txQ: QueueBase generic map (name => "spiTxQueue", queue_depth => 16, data_width => 8)
				port map (clk => clk, reset => reset,
						data_in => tx_queue_data_in,
						data_out => tx_queue_data_out,
						push_req => tx_queue_push_req,
						push_ack => tx_queue_push_ack,
						pop_req => tx_queue_pop_req,
						pop_ack => tx_queue_pop_ack);
				
	tx_queue_data_in <=  in_data_pipe_write_data;
	tx_queue_push_req <= in_data_pipe_write_req(0);
	in_data_pipe_write_ack(0) <= tx_queue_push_ack; 

	
	-- synchronization.. use double buffering..
	process(clk,reset)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				last_spi_clk <= '0';
				spi_clk_d <= '0';
				spi_clk_d_d <= '0';
				mosi_d <= '0';
				mosi_d_d <= '0';
				spi_ss_bar_d <= '1';
				spi_ss_bar_d_d <= '1';
			else
				last_spi_clk <= spi_clk_d_d;
				spi_clk_d <= spi_clk;
				spi_clk_d_d <= spi_clk_d;
				mosi_d <= spi_mosi;
				mosi_d_d <= mosi_d;
				spi_ss_bar_d <= spi_ss_bar;
				spi_ss_bar_d_d <= spi_ss_bar_d;
			end if;
		end if;
	end process;

	-- assumption: clk is 4X+ faster than SPI-clk.
	spi_clk_rising_edge <= (last_spi_clk = '0') and (spi_clk_d_d = '1');
	spi_clk_falling_edge <= (last_spi_clk = '1') and (spi_clk_d_d = '0');

	-- scan-in: sample on rising edge.
	--		always read 8 bits
	process(clk,reset)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then 
				in_data_count <= 0;
				rx_register <= (others => '0');
			elsif(spi_ss_bar_d_d = '0') then
				if(spi_clk_falling_edge) then
					shift_completed <= false;
				end if;
				if(spi_clk_rising_edge) then 
				-- reads on rising edge
					if(in_data_count < 7) then
						in_data_count <= in_data_count + 1;
					else
					   in_data_count <= 0;
					   shift_completed <= true;
					end if;
					rx_register <= rx_register (6 downto 0) & mosi_d_d;
				end if;
			end if;
		end if;
	end process;

	-- no flow control on rx-side..
	rx_queue_data_in <= rx_register;
	rx_queue_push_req <= '1' when (((not ignore_zero_rx_data) or (rx_register /= ZERO_8)) and shift_completed and spi_clk_falling_edge) else '0';
	out_data_pipe_read_data <= rx_queue_data_out;
	rx_queue_pop_req <= out_data_pipe_read_req(0);
	out_data_pipe_read_ack(0) <= rx_queue_pop_ack;

	
	
	-- transmit side logic: on synch (shift completed)
	process(clk, reset, shift_completed)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				tx_register <= (others => '0');
			elsif (shift_completed and spi_clk_falling_edge) then
				if(tx_queue_pop_ack = '1') then
					tx_register <= tx_queue_data_out;
				else
					tx_register <= (others => '0');
				end if;
			elsif(spi_clk_falling_edge) then
					tx_register <= tx_register(6 downto 0) & '0';
			end if;
		end if;
	end process;
	tx_queue_pop_req <= '1' when (shift_completed and spi_clk_falling_edge) else '0';

	Zgen: if tristate_miso_flag generate
		-- miso: tristated if not selected.
		spi_miso <= tx_register(7) when spi_ss_bar_d_d = '0' else 'Z';
	end generate Zgen;
	noZgen: if (not tristate_miso_flag) generate
		-- drive to '0' if not selected (wired-and)
		spi_miso <= tx_register(7) when spi_ss_bar_d_d = '0' else '0';
	end generate noZgen;

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.BaseComponents.all;


--
-- SPI-slave to pipe bridge.
--   Expects a command word followed by (optional) data.
--   If the command word is a read, then either a status-word
--   or data from in_data_pipe is returned as the second
--   byte (following the response to the command).  If the command word is
--   a write, the second byte after the command is forwarded
--   to out_data_pipe.
--
--
entity spi_slave_pipe_bridge_simplified is
	generic (tristate_miso_flag : boolean := true);
	port (
		-- SPI interface
		spi_mosi: in std_logic;   -- master-out-slave-in
		spi_miso: out std_logic;  -- master-in-slave-out
		spi_ss_bar: in std_logic; -- slave-select active low
		spi_clk  : in std_logic;  -- spi-clk
		-- pipe interface
		out_data_pipe_read_data: out std_logic_vector(7 downto 0);
		out_data_pipe_read_req : in std_logic_vector(0 downto 0);
		out_data_pipe_read_ack : out std_logic_vector(0 downto 0);
		-- input pipe: if the internal queue is full, writes
		-- will be blocked.
		in_data_pipe_write_data: in std_logic_vector(7 downto 0);
		in_data_pipe_write_req : in std_logic_vector(0 downto 0);
		in_data_pipe_write_ack : out std_logic_vector(0 downto 0);
		--
		clk, reset: in std_logic	
	     );
end entity spi_slave_pipe_bridge_simplified;


architecture Behave of spi_slave_pipe_bridge_simplified is


	signal spi_clk_rising_edge, spi_clk_falling_edge: Boolean;
	signal last_spi_clk, spi_clk_d, spi_clk_d_d: std_logic;
	signal mosi_d, mosi_d_d: std_logic;
	signal spi_ss_bar_d, spi_ss_bar_d_d: std_logic;


	type RxState is (RxIdle, RxWaitOnPipe);
	signal rx_state: RxState;
	signal rx_status: std_logic_vector(1 downto 0);
	signal rx_register: std_logic_vector(7 downto 0);
	constant ZERO_8: std_logic_vector(7 downto 0) := (others => '0');

	type TxState is (TxIdle, TxWaitOnPipe);
	signal tx_state: TxState;
	signal tx_status: std_logic_vector(1 downto 0);
	signal tx_register: std_logic_vector(7 downto 0);

	signal rx_queue_data_in, rx_queue_data_out: std_logic_vector(7 downto 0);
	signal rx_queue_push_req, rx_queue_push_ack, rx_queue_pop_req, rx_queue_pop_ack: std_logic;	

	signal tx_queue_data_in, tx_queue_data_out: std_logic_vector(7 downto 0);
	signal tx_queue_push_req, tx_queue_push_ack, tx_queue_pop_req, tx_queue_pop_ack: std_logic;	


	
	-- status word
	--    [7:4]: tx_queue_size
	--    [3:0]: rx_available_slots
	signal rx_available_slots, tx_queue_size : unsigned (3 downto 0);
	signal status_word_unsigned: unsigned (7 downto 0);

	--
	-- command word
	--  7: r/wbar
	--  6-0: address
	--     addr==0 is status word
	--     addr==1 is rx word. 
	--
	signal command_word: std_logic_vector(7 downto 0);


	type FsmState is (ReadCommand, WriteData, ShiftOut, LoadShiftOut);
	signal fsm_state: FsmState;


	signal spi_selected: Boolean;

	signal shift_in_reg, shift_out_reg: std_logic_vector (7 downto 0);

	signal shift_in_count, shift_out_count : unsigned (2 downto 0);
	signal shift_in_completed, shift_out_completed : Boolean;

	signal pushed_to_tx, pushed_to_rx, popped_from_tx, popped_from_rx: Boolean;

	signal load_shift_out_reg: Boolean;
	signal shift_out_reg_load_value: std_logic_vector(7 downto 0);

begin
	rxQ: QueueBase generic map (name => "spiRxQueue", queue_depth => 8, data_width => 8)
				port map (clk => clk, reset => reset,
						data_in => rx_queue_data_in,
						data_out => rx_queue_data_out,
						push_req => rx_queue_push_req,
						push_ack => rx_queue_push_ack,
						pop_req => rx_queue_pop_req,
						pop_ack => rx_queue_pop_ack);
	rx_queue_data_in <= shift_in_reg;
	out_data_pipe_read_data <= rx_queue_data_out;
	rx_queue_pop_req <= out_data_pipe_read_req(0);
	out_data_pipe_read_ack(0) <= rx_queue_pop_ack;

	txQ: QueueBase generic map (name => "spiTxQueue", queue_depth => 16, data_width => 8)
				port map (clk => clk, reset => reset,
						data_in => tx_queue_data_in,
						data_out => tx_queue_data_out,
						push_req => tx_queue_push_req,
						push_ack => tx_queue_push_ack,
						pop_req => tx_queue_pop_req,
						pop_ack => tx_queue_pop_ack);
				
	tx_queue_data_in <=  in_data_pipe_write_data;
	tx_queue_push_req <= in_data_pipe_write_req(0);
	in_data_pipe_write_ack(0) <= tx_queue_push_ack; 

	
	-- synchronization.. use double buffering..
	process(clk,reset)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				last_spi_clk <= '0';
				spi_clk_d <= '0';
				spi_clk_d_d <= '0';
				mosi_d <= '0';
				mosi_d_d <= '0';
				spi_ss_bar_d <= '1';
				spi_ss_bar_d_d <= '1';
			else
				last_spi_clk <= spi_clk_d_d;
				spi_clk_d <= spi_clk;
				spi_clk_d_d <= spi_clk_d;
				mosi_d <= spi_mosi;
				mosi_d_d <= mosi_d;
				spi_ss_bar_d <= spi_ss_bar;
				spi_ss_bar_d_d <= spi_ss_bar_d;
			end if;
		end if;
	end process;

	-- assumption: clk is 4X+ faster than SPI-clk.
	spi_clk_rising_edge <= (last_spi_clk = '0') and (spi_clk_d_d = '1');
	spi_clk_falling_edge <= (last_spi_clk = '1') and (spi_clk_d_d = '0');
	spi_selected <= (spi_ss_bar_d_d = '0');

	status_word_unsigned <= tx_queue_size & rx_available_slots;

	-- available slots.
	pushed_to_rx   <= ((rx_queue_push_req = '1') and (rx_queue_push_ack = '1'));
	pushed_to_tx   <= ((tx_queue_push_req = '1') and (tx_queue_push_ack = '1'));
	popped_from_rx <= ((rx_queue_pop_req = '1') and (rx_queue_pop_ack = '1'));
	popped_from_tx <= ((tx_queue_pop_req = '1') and (tx_queue_pop_ack = '1'));

	process(clk, reset, pushed_to_rx, pushed_to_tx, popped_from_rx, popped_from_tx)
	begin
		if(clk'event and clk = '1') then
			if (reset = '1') then
				rx_available_slots <= to_unsigned(8,4);
				tx_queue_size      <= (others => '0');
			else
				if (pushed_to_rx and (not popped_from_rx)) then
					rx_available_slots <= rx_available_slots - 1;
				elsif ((not pushed_to_rx) and  popped_from_rx) then
					rx_available_slots <= rx_available_slots + 1;
				end if;
				if (pushed_to_tx and (not popped_from_tx)) then
					tx_queue_size <= tx_queue_size + 1;
				elsif ((not pushed_to_tx) and  popped_from_tx) then
					tx_queue_size <= tx_queue_size - 1;
				end if;
			end if;
		end if;
				
	end process;

	-- shift registers.
	process(clk, reset, mosi_d_d, shift_in_reg, spi_clk_rising_edge, spi_clk_falling_edge, spi_selected, shift_in_count)
	begin
		if (clk'event and clk = '1') then
			if((reset = '1') or (not spi_selected)) then
				shift_in_count <= (others => '0');
				shift_in_completed <= false;
			else
				if(spi_clk_rising_edge and spi_selected) then
					if(shift_in_count = 7) then
						shift_in_completed <= true;
					else
						shift_in_completed <= false;
					end if;
					shift_in_count <= shift_in_count + 1;
					shift_in_reg <= shift_in_reg (6 downto 0) & mosi_d_d;
				else
					shift_in_completed <= false;
				end if;
			end if;
		end if;
	end process;

	-- shift out register.
	process(clk,reset, load_shift_out_reg, shift_out_reg_load_value,
			shift_out_reg, spi_clk_falling_edge, spi_clk_rising_edge, spi_selected, shift_out_count)
	begin
		if(clk'event and clk = '1') then
			if((reset = '1') or (not spi_selected)) then
				shift_out_reg <= (others => '0');
				shift_out_count <= (others => '0');
				shift_out_completed <= false;
			elsif (load_shift_out_reg and spi_clk_falling_edge) then
				shift_out_reg <= shift_out_reg_load_value;
				shift_out_completed <= false;
			elsif (spi_clk_falling_edge and spi_selected) then
				if(shift_out_count = 6) then
					shift_out_completed <= true;
				else
					shift_out_completed <= false;
				end if;
				shift_out_count <= shift_in_count + 1;
				shift_out_reg <= shift_out_reg(6 downto 0) & '0';
			end if;
		end if;
	end process;



	-- State machine.
	process (clk, fsm_state, spi_clk_rising_edge, spi_clk_falling_edge, 
				spi_selected, shift_in_completed, shift_out_completed,
				tx_queue_push_ack, rx_queue_pop_req)
		variable next_fsm_state_var: FsmState;
		variable load_shift_out_reg_var : boolean;
		variable shift_out_reg_load_value_var: std_logic_vector(7 downto 0);
		variable tx_queue_pop_req_var: std_logic;
		variable rx_queue_push_req_var: std_logic;
		variable latch_rx_queue_in_reg_var: Boolean;
	begin
		next_fsm_state_var := fsm_state;
		load_shift_out_reg_var := load_shift_out_reg;
		shift_out_reg_load_value_var := shift_out_reg_load_value;
		tx_queue_pop_req_var := '0';
		rx_queue_push_req_var := '0';
		latch_rx_queue_in_reg_var := false;

		case fsm_state is 
			when ReadCommand =>
				if shift_in_completed then
					if(shift_in_reg(7)  = '1') then -- read
						load_shift_out_reg_var := true;

						if (shift_in_reg(0) = '0') then -- read-status word.
							shift_out_reg_load_value_var := std_logic_vector(status_word_unsigned);
						else
							tx_queue_pop_req_var := '1';
							if(tx_queue_pop_ack = '1') then 
								shift_out_reg_load_value_var := tx_queue_data_out; 
							end if;
						end if;


						next_fsm_state_var := LoadShiftOut;
					else -- write... read one more byte from mosi
						next_fsm_state_var := WriteData;
					end if;
				end if;
			when WriteData =>
				if shift_in_completed then
					rx_queue_push_req_var := '1';
					next_fsm_state_var := ReadCommand;
				end if;
			when LoadShiftOut =>
				-- on next falling edge, load this value.
				if(spi_clk_falling_edge) then 
					load_shift_out_reg_var := false;
					shift_out_reg_load_value_var := (others => '0');
					next_fsm_state_var     := ShiftOut;
				end if;
			when ShiftOut =>
				if shift_in_completed then
					next_fsm_state_var := ReadCommand;
				end if;
		end case;

		
		tx_queue_pop_req <= tx_queue_pop_req_var;
		rx_queue_push_req <= rx_queue_push_req_var;

		if (clk'event and clk = '1') then
			if (reset = '1') then
				fsm_state <= ReadCommand;
				load_shift_out_reg <=  false;
			else

				load_shift_out_reg <=  load_shift_out_reg_var;
				shift_out_reg_load_value <= shift_out_reg_load_value_var;

				fsm_state <= next_fsm_state_var;
			end if;
		end if;		
 	end process;
						
					

	
	
	-- transmit side logic: on synch (shift completed)
	Zgen: if tristate_miso_flag generate
		-- miso: tristated if not selected.
		spi_miso <= shift_out_reg(7) when spi_ss_bar_d_d = '0' else 'Z';
	end generate Zgen;
	noZgen: if (not tristate_miso_flag) generate
		-- drive to '0' if not selected (wired-and)
		spi_miso <= shift_out_reg(7) when spi_ss_bar_d_d = '0' else '0';
	end generate noZgen;

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library AjitCustom;
use AjitCustom.AjitCustomComponents.all;
use AjitCustom.AjitGlobalConfigurationPackage.all;

--
-- an attempt to mimic a micro-chip SPI eprom.
-- Note: only uses the op-code MICROCHIP_EEPROM_READ : $uint<8> := 3
--
entity spi_bootrom  is
	port (CS_L: in std_logic; 
			SPI_MASTER_MISO: out std_logic_vector(0 downto 0);
			SPI_MASTER_MOSI: in std_logic_vector(0 downto 0);
			SPI_MASTER_CLK: in std_logic_vector(0 downto 0);
			clk, reset: in std_logic);
end entity spi_bootrom;
			

architecture Mixed of spi_bootrom is
	signal CS_L_d, spi_master_clk_d : std_logic;


	signal rom_address: std_logic_vector(15 downto 0);
	signal rom_data_out, data_shiftreg, command_reg: std_logic_vector(7 downto 0);
	signal rom_enable: std_logic;
	signal bootrom_selected, bootrom_deselected, spi_master_clk_falling, spi_master_clk_rising : Boolean;

	type FsmState is (IdleState, CommandState, AddrState_1, AddrState_2, EnableState, ResponseState);
	signal fsm_state: FsmState;


	signal incr_counter, clear_counter: Boolean;
	signal counter_sig: unsigned(2 downto 0);

	signal MISO_REG: std_logic;

begin
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				CS_L_d <= '1';
				spi_master_clk_d   <= '0';
				counter_sig <= (others => '0');
			else
				CS_L_d <= CS_L;
				spi_master_clk_d   <= SPI_MASTER_CLK(0);
				if(clear_counter) then
					counter_sig <= (others => '0');
				elsif(incr_counter) then
					counter_sig <= counter_sig + 1;
				end if;
			end if;
		end if;
	end process;	

	bootrom_selected      	<=  (CS_L_d = '1') and (CS_L = '0');
	spi_master_clk_falling  <=  (spi_master_clk_d = '1') and (SPI_MASTER_CLK(0) = '0');

	bootrom_deselected      <=  (CS_L_d = '0') and (CS_L = '1');
	spi_master_clk_rising   <=  (spi_master_clk_d = '0') and (SPI_MASTER_CLK(0) = '1');


	
	-- FSM
	process(clk, reset, 
			fsm_state, counter_sig, 
			  SPI_MASTER_MOSI,
			 bootrom_selected, bootrom_deselected,
				rom_data_out, data_shiftreg, command_reg, spi_master_clk_falling)
		variable next_fsm_state_var : FsmState;
		variable rom_enable_var: std_logic;
		variable next_addr_var : unsigned (15 downto 0);
		variable next_data_shiftreg_var, next_command_reg_var : std_logic_vector(7 downto 0);
		variable clear_counter_var, incr_counter_var: Boolean;
		variable next_miso_var : std_logic;
	begin
		next_fsm_state_var := fsm_state;
		next_addr_var := unsigned(rom_address);
		next_command_reg_var := command_reg;
		rom_enable_var := '0';
		clear_counter_var := false;
		incr_counter_var := false;
		next_data_shiftreg_var := data_shiftreg;
		next_miso_var := MISO_REG;

		case fsm_state is
			when IdleState =>
				if(bootrom_selected) then
					clear_counter_var := true;
					next_command_reg_var := (others => '0');
					next_fsm_state_var := CommandState;
					next_addr_var := (others => '0');
				end if;
			when CommandState =>
				if(bootrom_deselected) then
					next_fsm_state_var := IdleState;
				elsif(spi_master_clk_rising) then
					-- shift in the command from lsb..
					next_command_reg_var := command_reg(6 downto 0) & SPI_MASTER_MOSI(0);
					if(counter_sig = "111") then
						-- 8-bits shifted in.
						-- check op-code
						if(next_command_reg_var = "00000011") then
							next_fsm_state_var := AddrState_1;
						else
							next_fsm_state_var := IdleState;
						end if;
						clear_counter_var := true;
					else
					   incr_counter_var := true;
					end if;
				end if;
			when AddrState_1 => -- read top-byte of address
				if(bootrom_deselected) then
					next_fsm_state_var := IdleState;
				elsif(spi_master_clk_rising) then
					next_addr_var := next_addr_var (14 downto 0) & SPI_MASTER_MOSI(0);
					if(counter_sig = "111") then
						next_fsm_state_var := AddrState_2;
						clear_counter_var := true;
					else
					   incr_counter_var := true;
					end if;
				end if;
			when AddrState_2 => -- read bottom byte of address.
				if(bootrom_deselected) then
					next_fsm_state_var := IdleState;
				elsif(spi_master_clk_rising) then
					next_addr_var := next_addr_var (14 downto 0) & SPI_MASTER_MOSI(0);
					if(counter_sig = "111") then
						next_fsm_state_var := EnableState;
						clear_counter_var := true;
					else
					   incr_counter_var := true;
					end if;
				end if;
			when EnableState => -- read a byte for each rom access.
				if(bootrom_deselected) then
					next_fsm_state_var := IdleState;
				else
					rom_enable_var := '1';
					next_fsm_state_var := ResponseState;
					clear_counter_var := true;
				end if;
			when ResponseState =>
				if(bootrom_deselected) then
					next_fsm_state_var := IdleState;
				elsif(spi_master_clk_rising) then
					if(counter_sig = "000") then
						next_miso_var := rom_data_out(7);
						next_data_shiftreg_var := rom_data_out(6 downto 0) & '0';
						incr_counter_var := true;
					else
						next_miso_var := data_shiftreg(7);
						next_data_shiftreg_var := data_shiftreg(6 downto 0) & '0';
						if(counter_sig = "111") then
							next_fsm_state_var := EnableState;
							-- increment since the burst continues..
							next_addr_var := next_addr_var + 1;
							clear_counter_var := true;
						else
							incr_counter_var := true;
						end if;
					end if;
				end if;
		end case;

		rom_enable <= rom_enable_var;
		clear_counter <= clear_counter_var;
		incr_counter <= incr_counter_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				rom_address <= (others => '0');
				fsm_state <= IdleState;
				data_shiftreg <= (others => '0');
				command_reg <= (others => '0');
				MISO_REG <= '0';
			else
				rom_address <= std_logic_vector(next_addr_var);
				fsm_state <= next_fsm_state_var;
				data_shiftreg <= next_data_shiftreg_var;
				command_reg <= next_command_reg_var;
				MISO_REG <= next_miso_var;
			end if;
		end if;
	end process;

	-- miso will be tristated if cs_l(0) /= '0'.
        useZGen: if (use_tristates_flag) generate
	  SPI_MASTER_MISO(0) <= MISO_REG when CS_L = '0' else 'Z' ;
	end generate useZGen;

	-- avoid tri-states?
        noUseZGen: if (not use_tristates_flag) generate
	  SPI_MASTER_MISO(0) <= MISO_REG when CS_L = '0' else '0' ;
	end generate noUseZGen;

	rom_instance: ajit_64kB_rom
			port map (clk => clk, en => rom_enable,
					addr => rom_address, data => rom_data_out);

end Mixed;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.BaseComponents.all;
use ahir.mem_component_pack.all;

library AjitCustom;
use AjitCustom.AjitCustomComponents.all;

entity spi_byte_ram_with_init is
	generic (	mmap_file_name: string;
			addr_width_in_bytes: integer := 3; 
			-- to model a big ram with fewer internal memory locations.
			internal_addr_width: integer := 24;
			use_write_enable_control: boolean := false);
	port (CS_L: in std_logic_vector(0 downto 0);
			SPI_MISO: out std_logic_vector(0 downto 0);
			SPI_MOSI: in std_logic_vector(0 downto 0);
			SPI_CLK: in std_logic_vector(0 downto 0);
			clk, reset: in std_logic);
end entity spi_byte_ram_with_init;
			

architecture Mixed of spi_byte_ram_with_init is
	constant addr_width_in_bits: integer := (addr_width_in_bytes*8);
	signal spi_master_clk_d : std_logic;

	signal gpio_selected, gpio_deselected: boolean;
	signal spi_master_clk_falling, spi_master_clk_rising: boolean;

	type FsmState is (INITSTATE, 
				IDLE, SELECTED, DECODE_OP_CODE, GET_ADDRESS, CONTINUE_ACCESS,
				GET_WDATA, START_MEM_ACCESS, COMPLETE_MEM_ACCESS);
	signal fsm_state : FsmState;

	signal op_code, wdata, rdata: std_logic_vector(7 downto 0);
	signal addr   : std_logic_vector((8*addr_width_in_bytes)-1 downto 0);
	signal read_write_bar: std_logic;

	signal mem_enable: std_logic;
	signal load_mem_result_into_shift_reg: boolean;

	signal init_counter, counter: integer range 0 to 255;
	signal SHIFT_REG: std_logic_vector(7 downto 0);

	signal write_enable: std_logic;
begin

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				spi_master_clk_d   <= '0';
			else
				spi_master_clk_d   <= SPI_CLK(0);
			end if;
		end if;
	end process;	

	spi_master_clk_falling  <=  (spi_master_clk_d = '1') and (SPI_CLK(0) = '0');
	spi_master_clk_rising   <=  (spi_master_clk_d = '0') and (SPI_CLK(0) = '1');


	
	-- FSM
	process(clk, reset, counter, spi_master_clk_rising, spi_master_clk_falling, fsm_state,
			op_code, addr, wdata, read_write_bar, counter, write_enable,
			SPI_MOSI, CS_L)
		variable next_fsm_state_var: FsmState;
		variable next_counter_var : integer range 0 to 255;
		variable next_op_code_var: std_logic_vector(7 downto 0);
		variable next_addr_var : std_logic_vector((addr_width_in_bytes*8)-1 downto 0);
		variable next_wdata_var: std_logic_vector(7 downto 0);
		variable next_read_write_bar_var : std_logic;
		variable load_mem_result_into_shift_reg_var: boolean;
		variable mem_enable_var : std_logic;
		variable next_write_enable_var: std_logic;
		
		variable next_init_counter_var: integer range 0 to 255;
	begin

		next_init_counter_var := init_counter;
		next_fsm_state_var := fsm_state;
		next_op_code_var := op_code;
		next_addr_var := addr;
		next_wdata_var := wdata;
		load_mem_result_into_shift_reg_var := false;
		next_read_write_bar_var := read_write_bar;
		mem_enable_var := '0';
		next_counter_var := counter;
		next_write_enable_var := write_enable;


		case fsm_state is 
			when INITSTATE =>

				next_fsm_state_var := IDLE;

			when IDLE =>
				if(CS_L(0) = '0') then 
					next_fsm_state_var := SELECTED;
					next_counter_var := 0;
				end if;
			when SELECTED =>
				-- read in the op-code
				if(CS_L(0) = '1') then
					next_fsm_state_var := IDLE;
					next_counter_var   := 0;
				elsif(spi_master_clk_rising) then
					-- read in the op-code 
					next_op_code_var := op_code(6 downto 0) & SPI_MOSI;
					next_counter_var := (counter + 1);
					if(counter = 7) then
						next_fsm_state_var := DECODE_OP_CODE;
						next_counter_var := 0;
					end if;
				end if;

			when DECODE_OP_CODE =>

				if((op_code = "00000011") or (op_code = "00000010")) then
				   	next_fsm_state_var := GET_ADDRESS;
				elsif(use_write_enable_control) then
					next_fsm_state_var := IDLE;
			        	if(op_code = "00000110") then
					    next_fsm_state_var := IDLE;
					    next_write_enable_var := '1';
				        elsif (op_code = "00000100") then
					    next_fsm_state_var := IDLE;
					    next_write_enable_var :=  '0';
					end if;
				else
				        next_fsm_state_var := IDLE;
				end if;

			when GET_ADDRESS =>
				if(CS_L(0) = '1') then
					next_fsm_state_var := IDLE;
					next_counter_var := 0;
				elsif(spi_master_clk_rising) then
					next_counter_var := (counter + 1);
					next_addr_var := addr((addr_width_in_bytes*8)-2 downto 0) & SPI_MOSI;

					if(counter = ((addr_width_in_bytes*8)-1)) then 
						next_counter_var := 0;
						if(op_code = "00000011") then -- read
							next_read_write_bar_var := '1';
							next_fsm_state_var := START_MEM_ACCESS;
						else -- write
							next_fsm_state_var := 	GET_WDATA;
						end if;
					end if;
				end if;
			when GET_WDATA =>
				if(CS_L(0) = '1') then
					next_fsm_state_var := IDLE;
					next_counter_var := 0;
				elsif(spi_master_clk_rising) then
					-- read in the address.
					next_counter_var := (counter + 1);
					next_wdata_var    := wdata(6 downto 0) & SPI_MOSI;
					if(counter = 7) then
						next_fsm_state_var := START_MEM_ACCESS;
						next_read_write_bar_var := '0';
					end if;
				end if;
			when START_MEM_ACCESS =>
				--
				-- access memory in this state
				--
				mem_enable_var := '1';
				next_fsm_state_var := COMPLETE_MEM_ACCESS;
			when COMPLETE_MEM_ACCESS =>
				-- wait in this state until you see
				-- SPI CLK falling.  At that point 
				-- The read data is latched into the
				-- shift register.
				if(spi_master_clk_falling) then
					load_mem_result_into_shift_reg_var := true;
					next_counter_var := 0;
					next_fsm_state_var := CONTINUE_ACCESS;
				end if;	

			when CONTINUE_ACCESS =>
				-- in this state, we continue collecting the
				-- write data and doing a memory access every 8 
				-- SPI cycles.
				if(CS_L(0) = '1') then
					next_fsm_state_var := IDLE;
				elsif(spi_master_clk_rising) then
					next_counter_var := (counter + 1);	
					next_wdata_var   := wdata (6 downto 0) & SPI_MOSI;
					if(counter = 7) then
						next_fsm_state_var := START_MEM_ACCESS;
						next_counter_var := 0;
						next_addr_var := std_logic_vector((unsigned(addr) + 1));
					end if;
				end if;
		end case;

		mem_enable <= mem_enable_var;
		load_mem_result_into_shift_reg <= load_mem_result_into_shift_reg_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= INITSTATE;
				counter <= 0;
				read_write_bar <= '1';
				op_code <= (others => '0');

				init_counter <= 0;
				-- write enable is zero-ed out if
				-- we wish to control writes.
				if(use_write_enable_control) then
					write_enable <= '0';
				else
					write_enable <= '1';
				end if;

			else
				fsm_state <= next_fsm_state_var;
				counter <= next_counter_var;

				-- if write-enable = '0' then writes do not happen.
				read_write_bar <= ((not next_write_enable_var) or next_read_write_bar_var);

				wdata <= next_wdata_var;
				addr <= next_addr_var;

				op_code <= next_op_code_var;
				write_enable <= next_write_enable_var;

				init_counter <= next_init_counter_var;

			end if;

		end if;

	end process;

	bb: byte_ram_with_mmap_init
		generic map (	mmap_file_name => mmap_file_name,
				g_addr_width => internal_addr_width)
		port map (
				datain => wdata,
				dataout => rdata,
				addrin => addr(internal_addr_width-1 downto 0),
				enable => mem_enable,
				writebar => read_write_bar,
				clk => clk,
				reset => reset
			);

	-- shift register.
	process(clk, reset, spi_master_clk_falling, load_mem_result_into_shift_reg)
	begin
		if(clk'event and (clk = '1')) then
			if(reset = '1') then
				SHIFT_REG <= (others => '0');
			else
				if(load_mem_result_into_shift_reg) then
					SHIFT_REG <= rdata;
				elsif(spi_master_clk_falling) then
					SHIFT_REG <= SHIFT_REG(6 downto 0) & '0';
				end if;
			end if;
		end if;
	end process;
		
        SPI_MISO(0) <= SHIFT_REG(7) when CS_L(0) = '0' else '0';
end Mixed;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.BaseComponents.all;
use ahir.mem_component_pack.all;

entity spi_byte_ram is
	generic (addr_width_in_bytes: integer := 2; 
			-- to model a big ram with fewer internal memory locations.
			internal_addr_width: integer := 16;
			use_write_enable_control: boolean := false);
	port (CS_L: in std_logic_vector(0 downto 0);
			SPI_MISO: out std_logic_vector(0 downto 0);
			SPI_MOSI: in std_logic_vector(0 downto 0);
			SPI_CLK: in std_logic_vector(0 downto 0);
			clk, reset: in std_logic);
end entity spi_byte_ram;
			

architecture Mixed of spi_byte_ram is
	constant addr_width_in_bits: integer := (addr_width_in_bytes*8);
	signal spi_master_clk_d : std_logic;

	signal gpio_selected, gpio_deselected: boolean;
	signal spi_master_clk_falling, spi_master_clk_rising: boolean;

	type FsmState is (INITSTATE, INITMEMACCESS,
				IDLE, SELECTED, DECODE_OP_CODE, GET_ADDRESS, CONTINUE_ACCESS,
				GET_WDATA, START_MEM_ACCESS, COMPLETE_MEM_ACCESS);
	signal fsm_state : FsmState;

	signal op_code, wdata, rdata: std_logic_vector(7 downto 0);
	signal addr   : std_logic_vector((8*addr_width_in_bytes)-1 downto 0);
	signal read_write_bar: std_logic;

	signal mem_enable: std_logic;
	signal load_mem_result_into_shift_reg: boolean;

	signal init_counter, counter: integer range 0 to 255;
	signal SHIFT_REG: std_logic_vector(7 downto 0);

	signal write_enable: std_logic;
begin
	

	

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				spi_master_clk_d   <= '0';
			else
				spi_master_clk_d   <= SPI_CLK(0);
			end if;
		end if;
	end process;	

	spi_master_clk_falling  <=  (spi_master_clk_d = '1') and (SPI_CLK(0) = '0');
	spi_master_clk_rising   <=  (spi_master_clk_d = '0') and (SPI_CLK(0) = '1');


	
	-- FSM
	process(clk, reset, counter, spi_master_clk_rising, spi_master_clk_falling, fsm_state,
			op_code, addr, wdata, read_write_bar, counter, write_enable,
			SPI_MOSI, CS_L)
		variable next_fsm_state_var: FsmState;
		variable next_counter_var : integer range 0 to 255;
		variable next_op_code_var: std_logic_vector(7 downto 0);
		variable next_addr_var : std_logic_vector((addr_width_in_bytes*8)-1 downto 0);
		variable next_wdata_var: std_logic_vector(7 downto 0);
		variable next_read_write_bar_var : std_logic;
		variable load_mem_result_into_shift_reg_var: boolean;
		variable mem_enable_var : std_logic;
		variable next_write_enable_var: std_logic;
		
		variable next_init_counter_var: integer range 0 to 255;
	begin

		next_init_counter_var := init_counter;
		next_fsm_state_var := fsm_state;
		next_op_code_var := op_code;
		next_addr_var := addr;
		next_wdata_var := wdata;
		load_mem_result_into_shift_reg_var := false;
		next_read_write_bar_var := read_write_bar;
		mem_enable_var := '0';
		next_counter_var := counter;
		next_write_enable_var := write_enable;


		case fsm_state is 
			when INITSTATE =>
				-- write a known value
				next_write_enable_var := '1';

				next_read_write_bar_var :=  '0';

				next_wdata_var := std_logic_vector(to_unsigned(init_counter,8));
				next_addr_var  := std_logic_vector(to_unsigned(init_counter,addr_width_in_bits));
				next_init_counter_var := 1;

				next_fsm_state_var := INITMEMACCESS;
				

			when INITMEMACCESS =>

				mem_enable_var := '1';	
				next_read_write_bar_var :=  '0';
				next_wdata_var := std_logic_vector(to_unsigned(init_counter,8));
				next_addr_var  := std_logic_vector(to_unsigned(init_counter,addr_width_in_bits));


				-- write 8 bytes.
				if(init_counter < 8) then
					next_init_counter_var := (init_counter + 1);
				else
					if(use_write_enable_control) then
						next_write_enable_var :=  '0';
					end if;
					next_fsm_state_var := IDLE;	
				end if;

			when IDLE =>
				if(CS_L(0) = '0') then 
					next_fsm_state_var := SELECTED;
					next_counter_var := 0;
				end if;
			when SELECTED =>
				-- read in the op-code
				if(CS_L(0) = '1') then
					next_fsm_state_var := IDLE;
					next_counter_var   := 0;
				elsif(spi_master_clk_rising) then
					-- read in the op-code 
					next_op_code_var := op_code(6 downto 0) & SPI_MOSI;
					next_counter_var := (counter + 1);
					if(counter = 7) then
						next_fsm_state_var := DECODE_OP_CODE;
						next_counter_var := 0;
					end if;
				end if;

			when DECODE_OP_CODE =>

				if((op_code = "00000011") or (op_code = "00000010")) then
				   	next_fsm_state_var := GET_ADDRESS;
				elsif(use_write_enable_control) then
					next_fsm_state_var := IDLE;
			        	if(op_code = "00000110") then
					    next_fsm_state_var := IDLE;
					    next_write_enable_var := '1';
				        elsif (op_code = "00000100") then
					    next_fsm_state_var := IDLE;
					    next_write_enable_var :=  '0';
					end if;
				else
				        next_fsm_state_var := IDLE;
				end if;

			when GET_ADDRESS =>
				if(CS_L(0) = '1') then
					next_fsm_state_var := IDLE;
					next_counter_var := 0;
				elsif(spi_master_clk_rising) then
					next_counter_var := (counter + 1);
					next_addr_var := addr((addr_width_in_bytes*8)-2 downto 0) & SPI_MOSI;

					if(counter = ((addr_width_in_bytes*8)-1)) then 
						next_counter_var := 0;
						if(op_code = "00000011") then -- read
							next_read_write_bar_var := '1';
							next_fsm_state_var := START_MEM_ACCESS;
						else -- write
							next_fsm_state_var := 	GET_WDATA;
						end if;
					end if;
				end if;
			when GET_WDATA =>
				if(CS_L(0) = '1') then
					next_fsm_state_var := IDLE;
					next_counter_var := 0;
				elsif(spi_master_clk_rising) then
					-- read in the address.
					next_counter_var := (counter + 1);
					next_wdata_var    := wdata(6 downto 0) & SPI_MOSI;
					if(counter = 7) then
						next_fsm_state_var := START_MEM_ACCESS;
						next_read_write_bar_var := '0';
					end if;
				end if;
			when START_MEM_ACCESS =>
				--
				-- access memory in this state
				--
				mem_enable_var := '1';
				next_fsm_state_var := COMPLETE_MEM_ACCESS;
			when COMPLETE_MEM_ACCESS =>
				-- wait in this state until you see
				-- SPI CLK falling.  At that point 
				-- The read data is latched into the
				-- shift register.
				if(spi_master_clk_falling) then
					load_mem_result_into_shift_reg_var := true;
					next_counter_var := 0;
					next_fsm_state_var := CONTINUE_ACCESS;
				end if;	

			when CONTINUE_ACCESS =>
				-- in this state, we continue collecting the
				-- write data and doing a memory access every 8 
				-- SPI cycles.
				if(CS_L(0) = '1') then
					next_fsm_state_var := IDLE;
				elsif(spi_master_clk_rising) then
					next_counter_var := (counter + 1);	
					next_wdata_var   := wdata (6 downto 0) & SPI_MOSI;
					if(counter = 7) then
						next_fsm_state_var := START_MEM_ACCESS;
						next_counter_var := 0;
						next_addr_var := std_logic_vector((unsigned(addr) + 1));
					end if;
				end if;
		end case;

		mem_enable <= mem_enable_var;
		load_mem_result_into_shift_reg <= load_mem_result_into_shift_reg_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= INITSTATE;
				counter <= 0;
				read_write_bar <= '1';
				op_code <= (others => '0');

				init_counter <= 0;
				-- write enable is zero-ed out if
				-- we wish to control writes.
				if(use_write_enable_control) then
					write_enable <= '0';
				else
					write_enable <= '1';
				end if;

			else
				fsm_state <= next_fsm_state_var;
				counter <= next_counter_var;

				-- if write-enable = '0' then writes do not happen.
				read_write_bar <= ((not next_write_enable_var) or next_read_write_bar_var);

				wdata <= next_wdata_var;
				addr <= next_addr_var;

				op_code <= next_op_code_var;
				write_enable <= next_write_enable_var;

				init_counter <= next_init_counter_var;

			end if;

		end if;

	end process;

	bb: base_bank
		generic map (name => "spi_sram_bb", 
				g_addr_width => internal_addr_width, g_data_width => 8)
		port map (
				datain => wdata,
				dataout => rdata,
				addrin => addr(internal_addr_width-1 downto 0),
				enable => mem_enable,
				writebar => read_write_bar,
				clk => clk,
				reset => reset
			);

	-- shift register.
	process(clk, reset, spi_master_clk_falling, load_mem_result_into_shift_reg)
	begin
		if(clk'event and (clk = '1')) then
			if(reset = '1') then
				SHIFT_REG <= (others => '0');
			else
				if(load_mem_result_into_shift_reg) then
					SHIFT_REG <= rdata;
				elsif(spi_master_clk_falling) then
					SHIFT_REG <= SHIFT_REG(6 downto 0) & '0';
				end if;
			end if;
		end if;
	end process;
		
        SPI_MISO(0) <= SHIFT_REG(7) when CS_L(0) = '0' else '0';
end Mixed;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library AjitCustom;
use AjitCustom.AjitCustomComponents.all;
use AjitCustom.AjitGlobalConfigurationPackage.all;

--
-- Provide 8 GPIO-IN's and 8 GPIO-OUT's.
--   (super useful for debug!)
--
entity spi_gpio is
	port (CS_L: in std_logic;
			SPI_MASTER_MISO: out std_logic_vector(0 downto 0);
			SPI_MASTER_MOSI: in std_logic_vector(0 downto 0);
			SPI_MASTER_CLK: in std_logic_vector(0 downto 0);
			GPIO_IN: in std_logic_vector (7 downto 0);
			GPIO_OUT: out std_logic_vector (7 downto 0);
			clk, reset: in std_logic);
end entity spi_gpio;
			

architecture Mixed of spi_gpio is
	signal CS_L_d, spi_master_clk_d : std_logic;
	signal GPIO_SHIFT_REG, GPIO_OUT_REG: std_logic_vector(7 downto 0);

	signal gpio_selected, gpio_deselected: boolean;
	signal spi_master_clk_falling, spi_master_clk_rising: boolean;
begin
	GPIO_OUT <= GPIO_OUT_REG;
	

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				CS_L_d <= '1';
				spi_master_clk_d   <= '0';
			else
				CS_L_d <= CS_L;
				spi_master_clk_d   <= SPI_MASTER_CLK(0);
			end if;
		end if;
	end process;	

	gpio_selected      	<=  (CS_L_d = '1') and (CS_L = '0');
	spi_master_clk_falling  <=  (spi_master_clk_d = '1') and (SPI_MASTER_CLK(0) = '0');

	gpio_deselected      <=  (CS_L_d = '0') and (CS_L = '1');
	spi_master_clk_rising   <=  (spi_master_clk_d = '0') and (SPI_MASTER_CLK(0) = '1');


	
	-- FSM
	process(clk, reset)
		variable next_gpio_shift_reg_var : std_logic_vector(7 downto 0);
		variable next_gpio_out_reg_var : std_logic_vector(7 downto 0);
	begin
		next_gpio_shift_reg_var := GPIO_SHIFT_REG;
		next_gpio_out_reg_var := GPIO_OUT_REG;
		if(gpio_selected) then
			next_gpio_shift_reg_var := GPIO_IN;
		elsif (gpio_deselected) then
			next_gpio_out_reg_var := GPIO_SHIFT_REG;
		end if;

		if(spi_master_clk_rising) then
			next_gpio_shift_reg_var := (GPIO_SHIFT_REG(6 downto 0) & SPI_MASTER_MOSI);
		end if;
		
		if(clk'event and clk = '1') then
			if(reset = '1') then
				GPIO_SHIFT_REG <= (others => '0');
				GPIO_OUT_REG <= (others => '0');
			else
				GPIO_SHIFT_REG <= next_gpio_shift_reg_var;
				GPIO_OUT_REG <= next_gpio_out_reg_var;
			end if;
		end if;
	end process;

	-- miso will be tristated if cs_l(0) /= '0'.
        useZGen: if (use_tristates_flag) generate
	  SPI_MASTER_MISO(0) <= GPIO_SHIFT_REG(7) when CS_L = '0' else 'Z';
	end generate useZGen;

	-- avoid tri-states?
        noUseZGen: if (not use_tristates_flag) generate
	  SPI_MASTER_MISO(0) <= GPIO_SHIFT_REG(7) when CS_L = '0' else '0';
	end generate noUseZGen;

end Mixed;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
-- write back the complement of what is received...
--
entity spi_ping is
	port (CS_L: in std_logic;
			SPI_MASTER_MISO: out std_logic_vector(0 downto 0);
			SPI_MASTER_MOSI: in std_logic_vector(0 downto 0);
			SPI_MASTER_CLK: in std_logic_vector(0 downto 0);
			clk, reset: in std_logic);
end entity spi_ping;
			

architecture Mixed of spi_ping is
	signal spi_master_clk_d : std_logic;
	signal spi_master_clk_falling, spi_master_clk_rising: boolean;
	signal sample_sig, update_sig: std_logic;
	signal CS_L_D : std_logic;
begin
	

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				spi_master_clk_d   <= '0';
			else
				spi_master_clk_d   <= SPI_MASTER_CLK(0);
			end if;
		end if;
	end process;	

	spi_master_clk_falling  <=  (spi_master_clk_d = '1') and (SPI_MASTER_CLK(0) = '0');
	spi_master_clk_rising   <=  (spi_master_clk_d = '0') and (SPI_MASTER_CLK(0) = '1');


	
	process(clk, reset, SPI_MASTER_MOSI, CS_L, spi_master_clk_rising, spi_master_clk_falling)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				sample_sig <= '0';
				update_sig <= '0';
				CS_L_D <= '1';
			else
				if(spi_master_clk_rising) then
			    		if(CS_L = '0') then
						sample_sig <= SPI_MASTER_MOSI(0);
					end if;
					CS_L_D <= CS_L;
				end if;

				-- complete the incoming bit.
				update_sig <= not sample_sig;
			end if;
		end if;
	end process;

	SPI_MASTER_MISO(0) <= update_sig when CS_L = '0' else '0';
end Mixed;
