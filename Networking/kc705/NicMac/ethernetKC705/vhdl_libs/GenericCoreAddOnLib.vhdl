library ieee;
use ieee.std_logic_1164.all;

package GenericCoreAddOnPackage is
 component afb_splitter is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_HIGH_REQUEST_pipe_read_data: out std_logic_vector(73 downto 0);
    AFB_HIGH_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_HIGH_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
    AFB_HIGH_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
    AFB_HIGH_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_HIGH_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_LOW_REQUEST_pipe_read_data: out std_logic_vector(73 downto 0);
    AFB_LOW_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_LOW_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
    AFB_LOW_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
    AFB_LOW_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_LOW_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_SPLITTER_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_SPLITTER_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_SPLITTER_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_SPLITTER_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_SPLITTER_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_SPLITTER_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    MIN_ADDR_HIGH_ADDR_SPACE: in std_logic_vector(35 downto 0);
    MAX_ADDR_HIGH_ADDR_SPACE: in std_logic_vector(35 downto 0);
    MIN_ADDR_LOW_ADDR_SPACE : in std_logic_vector(35 downto 0);
    MAX_ADDR_LOW_ADDR_SPACE : in std_logic_vector(35 downto 0));
  -- 
 end component afb_splitter; 

 
 component afb_ahb_bridge is -- 
  port( -- 
    AFB_BUS_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
    AFB_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
    AFB_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
    HRDATA : in std_logic_vector(31 downto 0);
    HREADY : in std_logic_vector(0 downto 0);
    HRESP : in std_logic_vector(1 downto 0);
    AFB_BUS_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
    AFB_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    AFB_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    HADDR : out std_logic_vector(35 downto 0);
    HBURST : out std_logic_vector(2 downto 0);
    HMASTLOCK : out std_logic_vector(0 downto 0);
    HPROT : out std_logic_vector(3 downto 0);
    HSIZE : out std_logic_vector(2 downto 0);
    HTRANS : out std_logic_vector(1 downto 0);
    HWDATA : out std_logic_vector(31 downto 0);
    HWRITE : out std_logic_vector(0 downto 0);
    SYS_CLK : out std_logic_vector(0 downto 0);
    clk, reset: in std_logic 
    -- 
  );
 end component afb_ahb_bridge;

 component ahb_sram_stub is -- 
    generic(addr_width: integer := 10);
    port( -- 
      HADDR : in std_logic_vector(35 downto 0);
      HMASTLOCK : in std_logic_vector(0 downto 0); -- ignored
      HPROT : in std_logic_vector(3 downto 0);  -- ignored
      HBURST : in std_logic_vector(2 downto 0);  -- ignored
      HSIZE : in std_logic_vector(2 downto 0);	-- not ignored... byte masking for writes..
      HTRANS : in std_logic_vector(1 downto 0); -- should be NONSEQ or SEQ to indicate transfer
      HWDATA : in std_logic_vector(31 downto 0); 
      HWRITE : in std_logic_vector(0 downto 0); -- "1" implies write
      HRDATA : out std_logic_vector(31 downto 0); 
      HREADY : out std_logic_vector(0 downto 0); -- always "1".
      HRESP : out std_logic_vector(1 downto 0); -- always "00"
      SYS_CLK : in std_logic_vector(0 downto 0); -- work on this clock.
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;

  component apb_sram_stub is -- 
    generic (addr_width: integer := 10; number_of_wait_states: integer := 0);
    port( -- 
      PADDR   : in std_logic_vector(31 downto 0);
      PWDATA  : in std_logic_vector(31 downto 0); 
      PWRITE  : in std_logic_vector(0 downto 0); -- "1" implies write
      PENABLE : in std_logic_vector(0 downto 0); -- always "1".
      PSEL    : in std_logic_vector(0 downto 0); -- always "1".
      PRDATA  : out std_logic_vector(31 downto 0); 
      PREADY  : out std_logic_vector(0 downto 0); -- always "1".
      PSLVERR : out std_logic_vector(0 downto 0); -- always "00"
      PCLK    : in std_logic_vector(0 downto 0); -- work on this clock.
      PRESETn : in std_logic_vector(0 downto 0);
      clk, reset: in std_logic);
  end component;

  component afb_apb_controller is
	port (
		-- connections to AFB bus
		AFB_TO_APB_REQUEST_PIPE_write_req: in  std_logic_vector(0 downto 0);
		AFB_TO_APB_REQUEST_PIPE_write_ack: out std_logic_vector(0 downto 0);
		AFB_TO_APB_REQUEST_PIPE_write_data: in std_logic_vector(73 downto 0);
		-- 
		APB_TO_AFB_RESPONSE_pipe_read_req: in  std_logic_vector(0 downto 0);
		APB_TO_AFB_RESPONSE_pipe_read_ack: out std_logic_vector(0 downto 0);
		APB_TO_AFB_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
		-- APB bus signals
		--   Note: PSELx is omitted..  should be generated out of the address	
		--         by attaching a decoder...
		PCLK: out std_logic_vector(0 downto 0);
		PRESETn: out std_logic_vector(0 downto 0);
		PADDR: out std_logic_vector(31 downto 0);
		PWRITE: out std_logic_vector(0 downto 0); -- when '1' its a write.
		PWDATA: out std_logic_vector(31 downto 0); -- write data.
		PRDATA: in std_logic_vector(31 downto 0); -- read data.
		PREADY: in std_logic_vector(0 downto 0); -- slave ready.
		PENABLE: out std_logic_vector(0 downto 0); -- second cycle..
		PSLVERR: in std_logic_vector(0 downto 0); -- slave error.
		PSEL: out std_logic_vector(0 downto 0); -- slave select..
		-- clock, reset.
		clk: in std_logic;
		reset: in std_logic 
	     );
   end component afb_apb_controller;

  component acb_sram_stub is -- 
    generic(addr_width: integer := 10);
    port( -- 
      CORE_BUS_REQUEST_PIPE_WRITE_DATA : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_PIPE_WRITE_REQ : in std_logic_vector(0 downto 0);
      CORE_BUS_REQUEST_PIPE_WRITE_ACK : out std_logic_vector(0 downto 0);
      CORE_BUS_RESPONSE_PIPE_READ_DATA : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_PIPE_READ_REQ : in std_logic_vector(0 downto 0);
      CORE_BUS_RESPONSE_PIPE_READ_ACK : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;

  component afb_sram_stub is -- 
    generic(addr_width: integer := 10);
    port( -- 
      AFB_SRAM_COMMAND_PIPE_WRITE_DATA : in std_logic_vector(73 downto 0);
      AFB_SRAM_COMMAND_PIPE_WRITE_REQ : in std_logic_vector(0 downto 0);
      AFB_SRAM_COMMAND_PIPE_WRITE_ACK : out std_logic_vector(0 downto 0);
      AFB_SRAM_RESPONSE_PIPE_READ_DATA : out std_logic_vector(32 downto 0);
      AFB_SRAM_RESPONSE_PIPE_READ_REQ : in std_logic_vector(0 downto 0);
      AFB_SRAM_RESPONSE_PIPE_READ_ACK : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;

  component afb_spi_master is -- 
  port( -- 
    AFB_SPI_MASTER_COMMAND_pipe_write_data : in std_logic_vector(73 downto 0);
    AFB_SPI_MASTER_COMMAND_pipe_write_req  : in std_logic_vector(0  downto 0);
    AFB_SPI_MASTER_COMMAND_pipe_write_ack  : out std_logic_vector(0  downto 0);
    AFB_SPI_MASTER_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
    AFB_SPI_MASTER_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    AFB_SPI_MASTER_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    spi_miso : in std_logic_vector(0 downto 0);
    spi_clk : out std_logic_vector(0 downto 0);
    spi_cs_n : out std_logic_vector(7 downto 0);
    spi_mosi : out std_logic_vector(0 downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
  end component afb_spi_master;

  component afb_spi_flash_controller is -- 
    port( -- 
      -- AFB command interface
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      -- AFB response interface
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      -- SPI master signals (to flash)
      spi_mosi : out std_logic_vector(0 downto 0);
      spi_clk : out std_logic_vector(0 downto 0);
      spi_cs_n : out std_logic_vector(7 downto 0);
      spi_miso : in std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
  end component afb_spi_flash_controller;

  component afb_gpio is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      AFB_GPIO_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_GPIO_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_GPIO_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
      GPIO_AFB_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
      GPIO_AFB_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      GPIO_AFB_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      GPIO_DIN: in std_logic_vector(31 downto 0);
      GPIO_DOUT: out std_logic_vector(31 downto 0)); -- 
  end component afb_gpio;

  -- mux two requesters into 1.
  component afb_mux is -- 
    port (--
      clk : in std_logic;
      reset : in std_logic;
      AFB_BUS_REQUEST_pipe_read_data: out std_logic_vector(73 downto 0);
      AFB_BUS_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_REQUEST_0_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_REQUEST_0_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_REQUEST_0_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_REQUEST_1_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_REQUEST_1_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_REQUEST_1_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_RESPONSE_0_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_RESPONSE_0_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_RESPONSE_0_pipe_read_ack : out std_logic_vector(0 downto 0);
      AFB_RESPONSE_1_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_RESPONSE_1_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_RESPONSE_1_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;

  component configurable_uart is
	port (clk, reset: in std_logic;
		UART_RX: in std_logic_vector(0 downto 0);	
		UART_TX: out std_logic_vector(0 downto 0);	

		TX_to_CONSOLE_pipe_write_data: in std_logic_vector(7 downto 0);
		TX_to_CONSOLE_pipe_write_req:  in std_logic_vector(0 downto 0);
		TX_to_CONSOLE_pipe_write_ack:  out std_logic_vector(0 downto 0);

		CONSOLE_to_RX_pipe_read_data : out std_logic_vector(7 downto 0);
		CONSOLE_to_RX_pipe_read_req :  in std_logic_vector(0 downto 0);
		CONSOLE_to_RX_pipe_read_ack :  out std_logic_vector(0 downto 0);

		CONFIG_UART_BAUD_CONTROL_WORD: in std_logic_vector(31 downto 0)
	);
   end component configurable_uart;


end package GenericCoreAddOnPackage;

-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package afb_ahb_fifo_bridge_global_package is -- 
  constant default_mem_pool_base_address : std_logic_vector(0 downto 0) := "0";
  component afb_ahb_fifo_bridge is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      AFB_BUS_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_BUS_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      AFB_TO_AHB_COMMAND_pipe_read_data: out std_logic_vector(72 downto 0);
      AFB_TO_AHB_COMMAND_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_TO_AHB_COMMAND_pipe_read_ack : out std_logic_vector(0 downto 0);
      AHB_TO_AFB_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
      AHB_TO_AFB_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
      AHB_TO_AFB_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  -- 
end package afb_ahb_fifo_bridge_global_package;
-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_ahb_fifo_bridge_global_package.all;
entity afb_to_ahb_bridge_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    AFB_BUS_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
    AHB_TO_AFB_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
    AHB_TO_AFB_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AHB_TO_AFB_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
    AFB_BUS_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
    AFB_TO_AHB_COMMAND_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_TO_AHB_COMMAND_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_TO_AHB_COMMAND_pipe_write_data : out  std_logic_vector(72 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity afb_to_ahb_bridge_daemon;
architecture afb_to_ahb_bridge_daemon_arch of afb_to_ahb_bridge_daemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal afb_to_ahb_bridge_daemon_CP_9_start: Boolean;
  signal afb_to_ahb_bridge_daemon_CP_9_symbol: Boolean;
  -- volatile/operator module components. 
  component create_ahb_commands_Volatile is -- 
    port ( -- 
      mem_adapter_command : in  std_logic_vector(73 downto 0);
      command_to_ahb : out  std_logic_vector(72 downto 0)-- 
    );
    -- 
  end component; 
  -- links between control-path and data-path
  signal do_while_stmt_359_branch_req_0 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_362_inst_req_0 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_362_inst_ack_0 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_362_inst_req_1 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_362_inst_ack_1 : boolean;
  signal WPIPE_AFB_TO_AHB_COMMAND_404_inst_req_0 : boolean;
  signal WPIPE_AFB_TO_AHB_COMMAND_404_inst_ack_0 : boolean;
  signal WPIPE_AFB_TO_AHB_COMMAND_404_inst_req_1 : boolean;
  signal WPIPE_AFB_TO_AHB_COMMAND_404_inst_ack_1 : boolean;
  signal RPIPE_AHB_TO_AFB_RESPONSE_408_inst_req_0 : boolean;
  signal RPIPE_AHB_TO_AFB_RESPONSE_408_inst_ack_0 : boolean;
  signal RPIPE_AHB_TO_AFB_RESPONSE_408_inst_req_1 : boolean;
  signal RPIPE_AHB_TO_AFB_RESPONSE_408_inst_ack_1 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_426_inst_req_0 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_426_inst_ack_0 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_426_inst_req_1 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_426_inst_ack_1 : boolean;
  signal do_while_stmt_359_branch_ack_0 : boolean;
  signal do_while_stmt_359_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "afb_to_ahb_bridge_daemon_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  afb_to_ahb_bridge_daemon_CP_9_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "afb_to_ahb_bridge_daemon_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= afb_to_ahb_bridge_daemon_CP_9_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= afb_to_ahb_bridge_daemon_CP_9_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= afb_to_ahb_bridge_daemon_CP_9_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  afb_to_ahb_bridge_daemon_CP_9: Block -- control-path 
    signal afb_to_ahb_bridge_daemon_CP_9_elements: BooleanArray(28 downto 0);
    -- 
  begin -- 
    afb_to_ahb_bridge_daemon_CP_9_elements(0) <= afb_to_ahb_bridge_daemon_CP_9_start;
    afb_to_ahb_bridge_daemon_CP_9_symbol <= afb_to_ahb_bridge_daemon_CP_9_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_358/$entry
      -- CP-element group 0: 	 branch_block_stmt_358/branch_block_stmt_358__entry__
      -- CP-element group 0: 	 branch_block_stmt_358/do_while_stmt_359__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	28 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_358/$exit
      -- CP-element group 1: 	 branch_block_stmt_358/branch_block_stmt_358__exit__
      -- CP-element group 1: 	 branch_block_stmt_358/do_while_stmt_359__exit__
      -- 
    afb_to_ahb_bridge_daemon_CP_9_elements(1) <= afb_to_ahb_bridge_daemon_CP_9_elements(28);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_358/do_while_stmt_359/$entry
      -- CP-element group 2: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359__entry__
      -- 
    afb_to_ahb_bridge_daemon_CP_9_elements(2) <= afb_to_ahb_bridge_daemon_CP_9_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	28 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359__exit__
      -- 
    -- Element group afb_to_ahb_bridge_daemon_CP_9_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_358/do_while_stmt_359/loop_back
      -- 
    -- Element group afb_to_ahb_bridge_daemon_CP_9_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	24 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	26 
    -- CP-element group 5: 	27 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_358/do_while_stmt_359/condition_done
      -- CP-element group 5: 	 branch_block_stmt_358/do_while_stmt_359/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_358/do_while_stmt_359/loop_taken/$entry
      -- 
    afb_to_ahb_bridge_daemon_CP_9_elements(5) <= afb_to_ahb_bridge_daemon_CP_9_elements(24);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	25 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_358/do_while_stmt_359/loop_body_done
      -- 
    afb_to_ahb_bridge_daemon_CP_9_elements(6) <= afb_to_ahb_bridge_daemon_CP_9_elements(25);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/back_edge_to_loop_body
      -- 
    afb_to_ahb_bridge_daemon_CP_9_elements(7) <= afb_to_ahb_bridge_daemon_CP_9_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/first_time_through_loop_body
      -- 
    afb_to_ahb_bridge_daemon_CP_9_elements(8) <= afb_to_ahb_bridge_daemon_CP_9_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	17 
    -- CP-element group 9: 	24 
    -- CP-element group 9: 	10 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/loop_body_start
      -- 
    -- Element group afb_to_ahb_bridge_daemon_CP_9_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	9 
    -- CP-element group 10: marked-predecessors 
    -- CP-element group 10: 	13 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	12 
    -- CP-element group 10:  members (3) 
      -- CP-element group 10: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_sample_start_
      -- CP-element group 10: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_Sample/$entry
      -- CP-element group 10: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_Sample/rr
      -- 
    rr_42_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_42_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_ahb_bridge_daemon_CP_9_elements(10), ack => RPIPE_AFB_BUS_REQUEST_362_inst_req_0); -- 
    afb_to_ahb_bridge_daemon_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 44) := "afb_to_ahb_bridge_daemon_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_ahb_bridge_daemon_CP_9_elements(9) & afb_to_ahb_bridge_daemon_CP_9_elements(13);
      gj_afb_to_ahb_bridge_daemon_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_ahb_bridge_daemon_CP_9_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	12 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	15 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_update_start_
      -- CP-element group 11: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_Update/$entry
      -- CP-element group 11: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_Update/cr
      -- 
    cr_47_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_47_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_ahb_bridge_daemon_CP_9_elements(11), ack => RPIPE_AFB_BUS_REQUEST_362_inst_req_1); -- 
    afb_to_ahb_bridge_daemon_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 44) := "afb_to_ahb_bridge_daemon_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_ahb_bridge_daemon_CP_9_elements(12) & afb_to_ahb_bridge_daemon_CP_9_elements(15);
      gj_afb_to_ahb_bridge_daemon_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_ahb_bridge_daemon_CP_9_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  transition  input  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	10 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	11 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_Sample/$exit
      -- CP-element group 12: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_Sample/ra
      -- 
    ra_43_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_BUS_REQUEST_362_inst_ack_0, ack => afb_to_ahb_bridge_daemon_CP_9_elements(12)); -- 
    -- CP-element group 13:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	14 
    -- CP-element group 13: marked-successors 
    -- CP-element group 13: 	10 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_update_completed_
      -- CP-element group 13: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_Update/$exit
      -- CP-element group 13: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AFB_BUS_REQUEST_362_Update/ca
      -- 
    ca_48_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_BUS_REQUEST_362_inst_ack_1, ack => afb_to_ahb_bridge_daemon_CP_9_elements(13)); -- 
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	13 
    -- CP-element group 14: marked-predecessors 
    -- CP-element group 14: 	16 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	15 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_sample_start_
      -- CP-element group 14: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_Sample/$entry
      -- CP-element group 14: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_Sample/req
      -- 
    req_56_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_56_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_ahb_bridge_daemon_CP_9_elements(14), ack => WPIPE_AFB_TO_AHB_COMMAND_404_inst_req_0); -- 
    afb_to_ahb_bridge_daemon_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 44) := "afb_to_ahb_bridge_daemon_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_ahb_bridge_daemon_CP_9_elements(13) & afb_to_ahb_bridge_daemon_CP_9_elements(16);
      gj_afb_to_ahb_bridge_daemon_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_ahb_bridge_daemon_CP_9_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	14 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	16 
    -- CP-element group 15: marked-successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (6) 
      -- CP-element group 15: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_update_start_
      -- CP-element group 15: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_Sample/$exit
      -- CP-element group 15: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_Sample/ack
      -- CP-element group 15: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_Update/$entry
      -- CP-element group 15: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_Update/req
      -- 
    ack_57_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_TO_AHB_COMMAND_404_inst_ack_0, ack => afb_to_ahb_bridge_daemon_CP_9_elements(15)); -- 
    req_61_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_61_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_ahb_bridge_daemon_CP_9_elements(15), ack => WPIPE_AFB_TO_AHB_COMMAND_404_inst_req_1); -- 
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	15 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	25 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	14 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_Update/$exit
      -- CP-element group 16: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_TO_AHB_COMMAND_404_Update/ack
      -- 
    ack_62_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_TO_AHB_COMMAND_404_inst_ack_1, ack => afb_to_ahb_bridge_daemon_CP_9_elements(16)); -- 
    -- CP-element group 17:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	9 
    -- CP-element group 17: marked-predecessors 
    -- CP-element group 17: 	20 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_sample_start_
      -- CP-element group 17: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_Sample/$entry
      -- CP-element group 17: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_Sample/rr
      -- 
    rr_70_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_70_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_ahb_bridge_daemon_CP_9_elements(17), ack => RPIPE_AHB_TO_AFB_RESPONSE_408_inst_req_0); -- 
    afb_to_ahb_bridge_daemon_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 44) := "afb_to_ahb_bridge_daemon_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_ahb_bridge_daemon_CP_9_elements(9) & afb_to_ahb_bridge_daemon_CP_9_elements(20);
      gj_afb_to_ahb_bridge_daemon_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_ahb_bridge_daemon_CP_9_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	19 
    -- CP-element group 18: marked-predecessors 
    -- CP-element group 18: 	22 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	20 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_update_start_
      -- CP-element group 18: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_Update/$entry
      -- CP-element group 18: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_Update/cr
      -- 
    cr_75_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_75_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_ahb_bridge_daemon_CP_9_elements(18), ack => RPIPE_AHB_TO_AFB_RESPONSE_408_inst_req_1); -- 
    afb_to_ahb_bridge_daemon_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 44) := "afb_to_ahb_bridge_daemon_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_ahb_bridge_daemon_CP_9_elements(19) & afb_to_ahb_bridge_daemon_CP_9_elements(22);
      gj_afb_to_ahb_bridge_daemon_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_ahb_bridge_daemon_CP_9_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	18 
    -- CP-element group 19:  members (3) 
      -- CP-element group 19: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_sample_completed_
      -- CP-element group 19: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_Sample/$exit
      -- CP-element group 19: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_Sample/ra
      -- 
    ra_71_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AHB_TO_AFB_RESPONSE_408_inst_ack_0, ack => afb_to_ahb_bridge_daemon_CP_9_elements(19)); -- 
    -- CP-element group 20:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	18 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	21 
    -- CP-element group 20: marked-successors 
    -- CP-element group 20: 	17 
    -- CP-element group 20:  members (3) 
      -- CP-element group 20: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_Update/$exit
      -- CP-element group 20: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_408_Update/ca
      -- 
    ca_76_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AHB_TO_AFB_RESPONSE_408_inst_ack_1, ack => afb_to_ahb_bridge_daemon_CP_9_elements(20)); -- 
    -- CP-element group 21:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	20 
    -- CP-element group 21: marked-predecessors 
    -- CP-element group 21: 	23 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	22 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_sample_start_
      -- CP-element group 21: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_Sample/$entry
      -- CP-element group 21: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_Sample/req
      -- 
    req_84_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_84_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_ahb_bridge_daemon_CP_9_elements(21), ack => WPIPE_AFB_BUS_RESPONSE_426_inst_req_0); -- 
    afb_to_ahb_bridge_daemon_cp_element_group_21: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 44) := "afb_to_ahb_bridge_daemon_cp_element_group_21"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_ahb_bridge_daemon_CP_9_elements(20) & afb_to_ahb_bridge_daemon_CP_9_elements(23);
      gj_afb_to_ahb_bridge_daemon_cp_element_group_21 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_ahb_bridge_daemon_CP_9_elements(21), clk => clk, reset => reset); --
    end block;
    -- CP-element group 22:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	21 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	23 
    -- CP-element group 22: marked-successors 
    -- CP-element group 22: 	18 
    -- CP-element group 22:  members (6) 
      -- CP-element group 22: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_sample_completed_
      -- CP-element group 22: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_update_start_
      -- CP-element group 22: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_Sample/$exit
      -- CP-element group 22: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_Sample/ack
      -- CP-element group 22: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_Update/$entry
      -- CP-element group 22: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_Update/req
      -- 
    ack_85_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_BUS_RESPONSE_426_inst_ack_0, ack => afb_to_ahb_bridge_daemon_CP_9_elements(22)); -- 
    req_89_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_89_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_ahb_bridge_daemon_CP_9_elements(22), ack => WPIPE_AFB_BUS_RESPONSE_426_inst_req_1); -- 
    -- CP-element group 23:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	22 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	25 
    -- CP-element group 23: marked-successors 
    -- CP-element group 23: 	21 
    -- CP-element group 23:  members (3) 
      -- CP-element group 23: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_update_completed_
      -- CP-element group 23: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_Update/$exit
      -- CP-element group 23: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/WPIPE_AFB_BUS_RESPONSE_426_Update/ack
      -- 
    ack_90_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_BUS_RESPONSE_426_inst_ack_1, ack => afb_to_ahb_bridge_daemon_CP_9_elements(23)); -- 
    -- CP-element group 24:  transition  output  delay-element  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	9 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	5 
    -- CP-element group 24:  members (2) 
      -- CP-element group 24: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/condition_evaluated
      -- CP-element group 24: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/loop_body_delay_to_condition_start
      -- 
    condition_evaluated_33_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_33_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_ahb_bridge_daemon_CP_9_elements(24), ack => do_while_stmt_359_branch_req_0); -- 
    -- Element group afb_to_ahb_bridge_daemon_CP_9_elements(24) is a control-delay.
    cp_element_24_delay: control_delay_element  generic map(name => " 24_delay", delay_value => 1)  port map(req => afb_to_ahb_bridge_daemon_CP_9_elements(9), ack => afb_to_ahb_bridge_daemon_CP_9_elements(24), clk => clk, reset =>reset);
    -- CP-element group 25:  join  transition  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	23 
    -- CP-element group 25: 	16 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	6 
    -- CP-element group 25:  members (1) 
      -- CP-element group 25: 	 branch_block_stmt_358/do_while_stmt_359/do_while_stmt_359_loop_body/$exit
      -- 
    afb_to_ahb_bridge_daemon_cp_element_group_25: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 44) := "afb_to_ahb_bridge_daemon_cp_element_group_25"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_ahb_bridge_daemon_CP_9_elements(23) & afb_to_ahb_bridge_daemon_CP_9_elements(16);
      gj_afb_to_ahb_bridge_daemon_cp_element_group_25 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_ahb_bridge_daemon_CP_9_elements(25), clk => clk, reset => reset); --
    end block;
    -- CP-element group 26:  transition  input  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	5 
    -- CP-element group 26: successors 
    -- CP-element group 26:  members (2) 
      -- CP-element group 26: 	 branch_block_stmt_358/do_while_stmt_359/loop_exit/$exit
      -- CP-element group 26: 	 branch_block_stmt_358/do_while_stmt_359/loop_exit/ack
      -- 
    ack_95_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 26_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_359_branch_ack_0, ack => afb_to_ahb_bridge_daemon_CP_9_elements(26)); -- 
    -- CP-element group 27:  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	5 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (2) 
      -- CP-element group 27: 	 branch_block_stmt_358/do_while_stmt_359/loop_taken/$exit
      -- CP-element group 27: 	 branch_block_stmt_358/do_while_stmt_359/loop_taken/ack
      -- 
    ack_99_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_359_branch_ack_1, ack => afb_to_ahb_bridge_daemon_CP_9_elements(27)); -- 
    -- CP-element group 28:  transition  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	3 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	1 
    -- CP-element group 28:  members (1) 
      -- CP-element group 28: 	 branch_block_stmt_358/do_while_stmt_359/$exit
      -- 
    afb_to_ahb_bridge_daemon_CP_9_elements(28) <= afb_to_ahb_bridge_daemon_CP_9_elements(3);
    afb_to_ahb_bridge_daemon_do_while_stmt_359_terminator_100: loop_terminator -- 
      generic map (name => " afb_to_ahb_bridge_daemon_do_while_stmt_359_terminator_100", max_iterations_in_flight =>15) 
      port map(loop_body_exit => afb_to_ahb_bridge_daemon_CP_9_elements(6),loop_continue => afb_to_ahb_bridge_daemon_CP_9_elements(27),loop_terminate => afb_to_ahb_bridge_daemon_CP_9_elements(26),loop_back => afb_to_ahb_bridge_daemon_CP_9_elements(4),loop_exit => afb_to_ahb_bridge_daemon_CP_9_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_34_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= afb_to_ahb_bridge_daemon_CP_9_elements(7);
        preds(1)  <= afb_to_ahb_bridge_daemon_CP_9_elements(8);
        entry_tmerge_34 : transition_merge -- 
          generic map(name => " entry_tmerge_34")
          port map (preds => preds, symbol_out => afb_to_ahb_bridge_daemon_CP_9_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u1_u2_393_wire : std_logic_vector(1 downto 0);
    signal CONCAT_u2_u6_395_wire : std_logic_vector(5 downto 0);
    signal CONCAT_u36_u68_398_wire : std_logic_vector(67 downto 0);
    signal access_error_416 : std_logic_vector(0 downto 0);
    signal addr36_379 : std_logic_vector(35 downto 0);
    signal ahb_command_403 : std_logic_vector(72 downto 0);
    signal ahb_response_409 : std_logic_vector(32 downto 0);
    signal byte_mask_375 : std_logic_vector(3 downto 0);
    signal command_363 : std_logic_vector(73 downto 0);
    signal data_out_mem_420 : std_logic_vector(31 downto 0);
    signal konst_430_wire_constant : std_logic_vector(0 downto 0);
    signal lock_flag_367 : std_logic_vector(0 downto 0);
    signal read_write_bar_371 : std_logic_vector(0 downto 0);
    signal to_afb_425 : std_logic_vector(32 downto 0);
    signal to_mem_adapter_400 : std_logic_vector(73 downto 0);
    signal wdata_32_383 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    konst_430_wire_constant <= "1";
    -- flow-through slice operator slice_366_inst
    lock_flag_367 <= command_363(73 downto 73);
    -- flow-through slice operator slice_370_inst
    read_write_bar_371 <= command_363(72 downto 72);
    -- flow-through slice operator slice_374_inst
    byte_mask_375 <= command_363(71 downto 68);
    -- flow-through slice operator slice_378_inst
    addr36_379 <= command_363(67 downto 32);
    -- flow-through slice operator slice_382_inst
    wdata_32_383 <= command_363(31 downto 0);
    -- flow-through slice operator slice_415_inst
    access_error_416 <= ahb_response_409(32 downto 32);
    -- flow-through slice operator slice_419_inst
    data_out_mem_420 <= ahb_response_409(31 downto 0);
    do_while_stmt_359_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_430_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_359_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_359_branch_req_0,
          ack0 => do_while_stmt_359_branch_ack_0,
          ack1 => do_while_stmt_359_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator CONCAT_u1_u2_393_inst
    process(lock_flag_367, read_write_bar_371) -- 
      variable tmp_var : std_logic_vector(1 downto 0); -- 
    begin -- 
      ApConcat_proc(lock_flag_367, read_write_bar_371, tmp_var);
      CONCAT_u1_u2_393_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u1_u33_424_inst
    process(access_error_416, data_out_mem_420) -- 
      variable tmp_var : std_logic_vector(32 downto 0); -- 
    begin -- 
      ApConcat_proc(access_error_416, data_out_mem_420, tmp_var);
      to_afb_425 <= tmp_var; --
    end process;
    -- binary operator CONCAT_u2_u6_395_inst
    process(CONCAT_u1_u2_393_wire, byte_mask_375) -- 
      variable tmp_var : std_logic_vector(5 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u1_u2_393_wire, byte_mask_375, tmp_var);
      CONCAT_u2_u6_395_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u36_u68_398_inst
    process(addr36_379, wdata_32_383) -- 
      variable tmp_var : std_logic_vector(67 downto 0); -- 
    begin -- 
      ApConcat_proc(addr36_379, wdata_32_383, tmp_var);
      CONCAT_u36_u68_398_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u6_u74_399_inst
    process(CONCAT_u2_u6_395_wire, CONCAT_u36_u68_398_wire) -- 
      variable tmp_var : std_logic_vector(73 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u2_u6_395_wire, CONCAT_u36_u68_398_wire, tmp_var);
      to_mem_adapter_400 <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_AFB_BUS_REQUEST_362_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_BUS_REQUEST_362_inst_req_0;
      RPIPE_AFB_BUS_REQUEST_362_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_BUS_REQUEST_362_inst_req_1;
      RPIPE_AFB_BUS_REQUEST_362_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      command_363 <= data_out(73 downto 0);
      AFB_BUS_REQUEST_read_0_gI: SplitGuardInterface generic map(name => "AFB_BUS_REQUEST_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_BUS_REQUEST_read_0: InputPortRevised -- 
        generic map ( name => "AFB_BUS_REQUEST_read_0", data_width => 74,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => AFB_BUS_REQUEST_pipe_read_req(0),
          oack => AFB_BUS_REQUEST_pipe_read_ack(0),
          odata => AFB_BUS_REQUEST_pipe_read_data(73 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared inport operator group (1) : RPIPE_AHB_TO_AFB_RESPONSE_408_inst 
    InportGroup_1: Block -- 
      signal data_out: std_logic_vector(32 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AHB_TO_AFB_RESPONSE_408_inst_req_0;
      RPIPE_AHB_TO_AFB_RESPONSE_408_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AHB_TO_AFB_RESPONSE_408_inst_req_1;
      RPIPE_AHB_TO_AFB_RESPONSE_408_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      ahb_response_409 <= data_out(32 downto 0);
      AHB_TO_AFB_RESPONSE_read_1_gI: SplitGuardInterface generic map(name => "AHB_TO_AFB_RESPONSE_read_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AHB_TO_AFB_RESPONSE_read_1: InputPort_P2P -- 
        generic map ( name => "AHB_TO_AFB_RESPONSE_read_1", data_width => 33,    bypass_flag => false,   	nonblocking_read_flag => false,  barrier_flag => false,   queue_depth =>  2)
        port map (-- 
          sample_req => reqL(0) , 
          sample_ack => ackL(0), 
          update_req => reqR(0), 
          update_ack => ackR(0), 
          data => data_out, 
          oreq => AHB_TO_AFB_RESPONSE_pipe_read_req(0),
          oack => AHB_TO_AFB_RESPONSE_pipe_read_ack(0),
          odata => AHB_TO_AFB_RESPONSE_pipe_read_data(32 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 1
    -- shared outport operator group (0) : WPIPE_AFB_BUS_RESPONSE_426_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(32 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_BUS_RESPONSE_426_inst_req_0;
      WPIPE_AFB_BUS_RESPONSE_426_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_BUS_RESPONSE_426_inst_req_1;
      WPIPE_AFB_BUS_RESPONSE_426_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= to_afb_425;
      AFB_BUS_RESPONSE_write_0_gI: SplitGuardInterface generic map(name => "AFB_BUS_RESPONSE_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_BUS_RESPONSE_write_0: OutputPortRevised -- 
        generic map ( name => "AFB_BUS_RESPONSE", data_width => 33, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_BUS_RESPONSE_pipe_write_req(0),
          oack => AFB_BUS_RESPONSE_pipe_write_ack(0),
          odata => AFB_BUS_RESPONSE_pipe_write_data(32 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared outport operator group (1) : WPIPE_AFB_TO_AHB_COMMAND_404_inst 
    OutportGroup_1: Block -- 
      signal data_in: std_logic_vector(72 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_TO_AHB_COMMAND_404_inst_req_0;
      WPIPE_AFB_TO_AHB_COMMAND_404_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_TO_AHB_COMMAND_404_inst_req_1;
      WPIPE_AFB_TO_AHB_COMMAND_404_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= ahb_command_403;
      AFB_TO_AHB_COMMAND_write_1_gI: SplitGuardInterface generic map(name => "AFB_TO_AHB_COMMAND_write_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_TO_AHB_COMMAND_write_1: OutputPortRevised -- 
        generic map ( name => "AFB_TO_AHB_COMMAND", data_width => 73, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_TO_AHB_COMMAND_pipe_write_req(0),
          oack => AFB_TO_AHB_COMMAND_pipe_write_ack(0),
          odata => AFB_TO_AHB_COMMAND_pipe_write_data(72 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
    volatile_operator_create_ahb_commands_490: create_ahb_commands_Volatile port map(mem_adapter_command => to_mem_adapter_400, command_to_ahb => ahb_command_403); 
    -- 
  end Block; -- data_path
  -- 
end afb_to_ahb_bridge_daemon_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_ahb_fifo_bridge_global_package.all;
entity create_ahb_commands_Volatile is -- 
  port ( -- 
    mem_adapter_command : in  std_logic_vector(73 downto 0);
    command_to_ahb : out  std_logic_vector(72 downto 0)-- 
  );
  -- 
end entity create_ahb_commands_Volatile;
architecture create_ahb_commands_Volatile_arch of create_ahb_commands_Volatile is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector(74-1 downto 0);
  signal default_zero_sig: std_logic;
  -- input port buffer signals
  signal mem_adapter_command_buffer :  std_logic_vector(73 downto 0);
  -- output port buffer signals
  signal command_to_ahb_buffer :  std_logic_vector(72 downto 0);
  -- volatile/operator module components. 
  component get_byte_offset_Volatile is -- 
    port ( -- 
      bmask : in  std_logic_vector(3 downto 0);
      byte_offset : out  std_logic_vector(1 downto 0)-- 
    );
    -- 
  end component; 
  component get_ahb_hsize_Volatile is -- 
    port ( -- 
      bmask : in  std_logic_vector(3 downto 0);
      t_size : out  std_logic_vector(2 downto 0)-- 
    );
    -- 
  end component; 
  -- 
begin --  
  -- input handling ------------------------------------------------
  mem_adapter_command_buffer <= mem_adapter_command;
  -- output handling  -------------------------------------------------------
  command_to_ahb <= command_to_ahb_buffer;
  -- the control path --------------------------------------------------
  default_zero_sig <= '0';
  -- volatile module, no control path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u1_u2_344_wire : std_logic_vector(1 downto 0);
    signal CONCAT_u2_u5_346_wire : std_logic_vector(4 downto 0);
    signal CONCAT_u36_u68_353_wire : std_logic_vector(67 downto 0);
    signal MUX_352_wire : std_logic_vector(31 downto 0);
    signal addr_323 : std_logic_vector(35 downto 0);
    signal addr_with_byte_offset_340 : std_logic_vector(35 downto 0);
    signal ahb_transfer_size_333 : std_logic_vector(2 downto 0);
    signal bmask_318 : std_logic_vector(3 downto 0);
    signal byte_offset_330 : std_logic_vector(1 downto 0);
    signal lock_flag_310 : std_logic_vector(0 downto 0);
    signal rw_314 : std_logic_vector(0 downto 0);
    signal slice_337_wire : std_logic_vector(33 downto 0);
    signal type_cast_350_wire_constant : std_logic_vector(31 downto 0);
    signal write_data_327 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    type_cast_350_wire_constant <= "00000000000000000000000000000000";
    -- flow-through select operator MUX_352_inst
    MUX_352_wire <= type_cast_350_wire_constant when (rw_314(0) /=  '0') else write_data_327;
    -- flow-through slice operator slice_309_inst
    lock_flag_310 <= mem_adapter_command_buffer(73 downto 73);
    -- flow-through slice operator slice_313_inst
    rw_314 <= mem_adapter_command_buffer(72 downto 72);
    -- flow-through slice operator slice_317_inst
    bmask_318 <= mem_adapter_command_buffer(71 downto 68);
    -- flow-through slice operator slice_322_inst
    addr_323 <= mem_adapter_command_buffer(67 downto 32);
    -- flow-through slice operator slice_326_inst
    write_data_327 <= mem_adapter_command_buffer(31 downto 0);
    -- flow-through slice operator slice_337_inst
    slice_337_wire <= addr_323(35 downto 2);
    -- binary operator CONCAT_u1_u2_344_inst
    process(lock_flag_310, rw_314) -- 
      variable tmp_var : std_logic_vector(1 downto 0); -- 
    begin -- 
      ApConcat_proc(lock_flag_310, rw_314, tmp_var);
      CONCAT_u1_u2_344_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u2_u5_346_inst
    process(CONCAT_u1_u2_344_wire, ahb_transfer_size_333) -- 
      variable tmp_var : std_logic_vector(4 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u1_u2_344_wire, ahb_transfer_size_333, tmp_var);
      CONCAT_u2_u5_346_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u34_u36_339_inst
    process(slice_337_wire, byte_offset_330) -- 
      variable tmp_var : std_logic_vector(35 downto 0); -- 
    begin -- 
      ApConcat_proc(slice_337_wire, byte_offset_330, tmp_var);
      addr_with_byte_offset_340 <= tmp_var; --
    end process;
    -- binary operator CONCAT_u36_u68_353_inst
    process(addr_with_byte_offset_340, MUX_352_wire) -- 
      variable tmp_var : std_logic_vector(67 downto 0); -- 
    begin -- 
      ApConcat_proc(addr_with_byte_offset_340, MUX_352_wire, tmp_var);
      CONCAT_u36_u68_353_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u5_u73_354_inst
    process(CONCAT_u2_u5_346_wire, CONCAT_u36_u68_353_wire) -- 
      variable tmp_var : std_logic_vector(72 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u2_u5_346_wire, CONCAT_u36_u68_353_wire, tmp_var);
      command_to_ahb_buffer <= tmp_var; --
    end process;
    volatile_operator_get_byte_offset_357: get_byte_offset_Volatile port map(bmask => bmask_318, byte_offset => byte_offset_330); 
    volatile_operator_get_ahb_hsize_358: get_ahb_hsize_Volatile port map(bmask => bmask_318, t_size => ahb_transfer_size_333); 
    -- 
  end Block; -- data_path
  -- 
end create_ahb_commands_Volatile_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_ahb_fifo_bridge_global_package.all;
entity get_ahb_hsize_Volatile is -- 
  port ( -- 
    bmask : in  std_logic_vector(3 downto 0);
    t_size : out  std_logic_vector(2 downto 0)-- 
  );
  -- 
end entity get_ahb_hsize_Volatile;
architecture get_ahb_hsize_Volatile_arch of get_ahb_hsize_Volatile is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector(4-1 downto 0);
  signal default_zero_sig: std_logic;
  -- input port buffer signals
  signal bmask_buffer :  std_logic_vector(3 downto 0);
  -- output port buffer signals
  signal t_size_buffer :  std_logic_vector(2 downto 0);
  -- volatile/operator module components. 
  -- 
begin --  
  -- input handling ------------------------------------------------
  bmask_buffer <= bmask;
  -- output handling  -------------------------------------------------------
  t_size <= t_size_buffer;
  -- the control path --------------------------------------------------
  default_zero_sig <= '0';
  -- volatile module, no control path
  -- the data path
  data_path: Block -- 
    signal EQ_u4_u1_241_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_248_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_256_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_263_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_272_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_279_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_287_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_294_wire : std_logic_vector(0 downto 0);
    signal MUX_245_wire : std_logic_vector(2 downto 0);
    signal MUX_252_wire : std_logic_vector(2 downto 0);
    signal MUX_260_wire : std_logic_vector(2 downto 0);
    signal MUX_267_wire : std_logic_vector(2 downto 0);
    signal MUX_276_wire : std_logic_vector(2 downto 0);
    signal MUX_283_wire : std_logic_vector(2 downto 0);
    signal MUX_291_wire : std_logic_vector(2 downto 0);
    signal MUX_298_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_253_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_268_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_269_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_284_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_299_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_300_wire : std_logic_vector(2 downto 0);
    signal konst_240_wire_constant : std_logic_vector(3 downto 0);
    signal konst_244_wire_constant : std_logic_vector(2 downto 0);
    signal konst_247_wire_constant : std_logic_vector(3 downto 0);
    signal konst_251_wire_constant : std_logic_vector(2 downto 0);
    signal konst_255_wire_constant : std_logic_vector(3 downto 0);
    signal konst_259_wire_constant : std_logic_vector(2 downto 0);
    signal konst_262_wire_constant : std_logic_vector(3 downto 0);
    signal konst_266_wire_constant : std_logic_vector(2 downto 0);
    signal konst_271_wire_constant : std_logic_vector(3 downto 0);
    signal konst_275_wire_constant : std_logic_vector(2 downto 0);
    signal konst_278_wire_constant : std_logic_vector(3 downto 0);
    signal konst_282_wire_constant : std_logic_vector(2 downto 0);
    signal konst_286_wire_constant : std_logic_vector(3 downto 0);
    signal konst_290_wire_constant : std_logic_vector(2 downto 0);
    signal konst_293_wire_constant : std_logic_vector(3 downto 0);
    signal konst_297_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_243_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_250_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_258_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_265_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_274_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_281_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_289_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_296_wire_constant : std_logic_vector(2 downto 0);
    -- 
  begin -- 
    konst_240_wire_constant <= "0001";
    konst_244_wire_constant <= "000";
    konst_247_wire_constant <= "0010";
    konst_251_wire_constant <= "000";
    konst_255_wire_constant <= "0100";
    konst_259_wire_constant <= "000";
    konst_262_wire_constant <= "1000";
    konst_266_wire_constant <= "000";
    konst_271_wire_constant <= "0011";
    konst_275_wire_constant <= "000";
    konst_278_wire_constant <= "0110";
    konst_282_wire_constant <= "000";
    konst_286_wire_constant <= "1100";
    konst_290_wire_constant <= "000";
    konst_293_wire_constant <= "1111";
    konst_297_wire_constant <= "000";
    type_cast_243_wire_constant <= "000";
    type_cast_250_wire_constant <= "000";
    type_cast_258_wire_constant <= "000";
    type_cast_265_wire_constant <= "000";
    type_cast_274_wire_constant <= "001";
    type_cast_281_wire_constant <= "001";
    type_cast_289_wire_constant <= "001";
    type_cast_296_wire_constant <= "010";
    -- flow-through select operator MUX_245_inst
    MUX_245_wire <= type_cast_243_wire_constant when (EQ_u4_u1_241_wire(0) /=  '0') else konst_244_wire_constant;
    -- flow-through select operator MUX_252_inst
    MUX_252_wire <= type_cast_250_wire_constant when (EQ_u4_u1_248_wire(0) /=  '0') else konst_251_wire_constant;
    -- flow-through select operator MUX_260_inst
    MUX_260_wire <= type_cast_258_wire_constant when (EQ_u4_u1_256_wire(0) /=  '0') else konst_259_wire_constant;
    -- flow-through select operator MUX_267_inst
    MUX_267_wire <= type_cast_265_wire_constant when (EQ_u4_u1_263_wire(0) /=  '0') else konst_266_wire_constant;
    -- flow-through select operator MUX_276_inst
    MUX_276_wire <= type_cast_274_wire_constant when (EQ_u4_u1_272_wire(0) /=  '0') else konst_275_wire_constant;
    -- flow-through select operator MUX_283_inst
    MUX_283_wire <= type_cast_281_wire_constant when (EQ_u4_u1_279_wire(0) /=  '0') else konst_282_wire_constant;
    -- flow-through select operator MUX_291_inst
    MUX_291_wire <= type_cast_289_wire_constant when (EQ_u4_u1_287_wire(0) /=  '0') else konst_290_wire_constant;
    -- flow-through select operator MUX_298_inst
    MUX_298_wire <= type_cast_296_wire_constant when (EQ_u4_u1_294_wire(0) /=  '0') else konst_297_wire_constant;
    -- binary operator EQ_u4_u1_241_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_240_wire_constant, tmp_var);
      EQ_u4_u1_241_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_248_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_247_wire_constant, tmp_var);
      EQ_u4_u1_248_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_256_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_255_wire_constant, tmp_var);
      EQ_u4_u1_256_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_263_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_262_wire_constant, tmp_var);
      EQ_u4_u1_263_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_272_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_271_wire_constant, tmp_var);
      EQ_u4_u1_272_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_279_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_278_wire_constant, tmp_var);
      EQ_u4_u1_279_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_287_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_286_wire_constant, tmp_var);
      EQ_u4_u1_287_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_294_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_293_wire_constant, tmp_var);
      EQ_u4_u1_294_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_253_inst
    process(MUX_245_wire, MUX_252_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_245_wire, MUX_252_wire, tmp_var);
      OR_u3_u3_253_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_268_inst
    process(MUX_260_wire, MUX_267_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_260_wire, MUX_267_wire, tmp_var);
      OR_u3_u3_268_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_269_inst
    process(OR_u3_u3_253_wire, OR_u3_u3_268_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u3_u3_253_wire, OR_u3_u3_268_wire, tmp_var);
      OR_u3_u3_269_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_284_inst
    process(MUX_276_wire, MUX_283_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_276_wire, MUX_283_wire, tmp_var);
      OR_u3_u3_284_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_299_inst
    process(MUX_291_wire, MUX_298_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_291_wire, MUX_298_wire, tmp_var);
      OR_u3_u3_299_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_300_inst
    process(OR_u3_u3_284_wire, OR_u3_u3_299_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u3_u3_284_wire, OR_u3_u3_299_wire, tmp_var);
      OR_u3_u3_300_wire <= tmp_var; --
    end process;
    -- binary operator OR_u3_u3_301_inst
    process(OR_u3_u3_269_wire, OR_u3_u3_300_wire) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u3_u3_269_wire, OR_u3_u3_300_wire, tmp_var);
      t_size_buffer <= tmp_var; --
    end process;
    -- 
  end Block; -- data_path
  -- 
end get_ahb_hsize_Volatile_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_ahb_fifo_bridge_global_package.all;
entity get_byte_offset_Volatile is -- 
  port ( -- 
    bmask : in  std_logic_vector(3 downto 0);
    byte_offset : out  std_logic_vector(1 downto 0)-- 
  );
  -- 
end entity get_byte_offset_Volatile;
architecture get_byte_offset_Volatile_arch of get_byte_offset_Volatile is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector(4-1 downto 0);
  signal default_zero_sig: std_logic;
  -- input port buffer signals
  signal bmask_buffer :  std_logic_vector(3 downto 0);
  -- output port buffer signals
  signal byte_offset_buffer :  std_logic_vector(1 downto 0);
  -- volatile/operator module components. 
  -- 
begin --  
  -- input handling ------------------------------------------------
  bmask_buffer <= bmask;
  -- output handling  -------------------------------------------------------
  byte_offset <= byte_offset_buffer;
  -- the control path --------------------------------------------------
  default_zero_sig <= '0';
  -- volatile module, no control path
  -- the data path
  data_path: Block -- 
    signal BITSEL_u4_u1_208_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u4_u1_213_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u4_u1_218_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u4_u1_223_wire : std_logic_vector(0 downto 0);
    signal MUX_228_wire : std_logic_vector(1 downto 0);
    signal MUX_229_wire : std_logic_vector(1 downto 0);
    signal MUX_230_wire : std_logic_vector(1 downto 0);
    signal konst_207_wire_constant : std_logic_vector(3 downto 0);
    signal konst_212_wire_constant : std_logic_vector(3 downto 0);
    signal konst_217_wire_constant : std_logic_vector(3 downto 0);
    signal konst_222_wire_constant : std_logic_vector(3 downto 0);
    signal type_cast_210_wire_constant : std_logic_vector(1 downto 0);
    signal type_cast_215_wire_constant : std_logic_vector(1 downto 0);
    signal type_cast_220_wire_constant : std_logic_vector(1 downto 0);
    signal type_cast_225_wire_constant : std_logic_vector(1 downto 0);
    signal type_cast_227_wire_constant : std_logic_vector(1 downto 0);
    -- 
  begin -- 
    konst_207_wire_constant <= "0011";
    konst_212_wire_constant <= "0010";
    konst_217_wire_constant <= "0001";
    konst_222_wire_constant <= "0000";
    type_cast_210_wire_constant <= "00";
    type_cast_215_wire_constant <= "01";
    type_cast_220_wire_constant <= "10";
    type_cast_225_wire_constant <= "11";
    type_cast_227_wire_constant <= "00";
    -- flow-through select operator MUX_228_inst
    MUX_228_wire <= type_cast_225_wire_constant when (BITSEL_u4_u1_223_wire(0) /=  '0') else type_cast_227_wire_constant;
    -- flow-through select operator MUX_229_inst
    MUX_229_wire <= type_cast_220_wire_constant when (BITSEL_u4_u1_218_wire(0) /=  '0') else MUX_228_wire;
    -- flow-through select operator MUX_230_inst
    MUX_230_wire <= type_cast_215_wire_constant when (BITSEL_u4_u1_213_wire(0) /=  '0') else MUX_229_wire;
    -- flow-through select operator MUX_231_inst
    byte_offset_buffer <= type_cast_210_wire_constant when (BITSEL_u4_u1_208_wire(0) /=  '0') else MUX_230_wire;
    -- binary operator BITSEL_u4_u1_208_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(bmask_buffer, konst_207_wire_constant, tmp_var);
      BITSEL_u4_u1_208_wire <= tmp_var; --
    end process;
    -- binary operator BITSEL_u4_u1_213_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(bmask_buffer, konst_212_wire_constant, tmp_var);
      BITSEL_u4_u1_213_wire <= tmp_var; --
    end process;
    -- binary operator BITSEL_u4_u1_218_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(bmask_buffer, konst_217_wire_constant, tmp_var);
      BITSEL_u4_u1_218_wire <= tmp_var; --
    end process;
    -- binary operator BITSEL_u4_u1_223_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(bmask_buffer, konst_222_wire_constant, tmp_var);
      BITSEL_u4_u1_223_wire <= tmp_var; --
    end process;
    -- 
  end Block; -- data_path
  -- 
end get_byte_offset_Volatile_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_ahb_fifo_bridge_global_package.all;
entity afb_ahb_fifo_bridge is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_BUS_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_BUS_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_BUS_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    AFB_TO_AHB_COMMAND_pipe_read_data: out std_logic_vector(72 downto 0);
    AFB_TO_AHB_COMMAND_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_TO_AHB_COMMAND_pipe_read_ack : out std_logic_vector(0 downto 0);
    AHB_TO_AFB_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
    AHB_TO_AFB_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
    AHB_TO_AFB_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture afb_ahb_fifo_bridge_arch  of afb_ahb_fifo_bridge is -- system-architecture 
  -- interface signals to connect to memory space memory_space_1
  -- declarations related to module afb_to_ahb_bridge_daemon
  component afb_to_ahb_bridge_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      AFB_BUS_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
      AHB_TO_AFB_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
      AHB_TO_AFB_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AHB_TO_AFB_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
      AFB_TO_AHB_COMMAND_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_TO_AHB_COMMAND_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_TO_AHB_COMMAND_pipe_write_data : out  std_logic_vector(72 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module afb_to_ahb_bridge_daemon
  signal afb_to_ahb_bridge_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal afb_to_ahb_bridge_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal afb_to_ahb_bridge_daemon_start_req : std_logic;
  signal afb_to_ahb_bridge_daemon_start_ack : std_logic;
  signal afb_to_ahb_bridge_daemon_fin_req   : std_logic;
  signal afb_to_ahb_bridge_daemon_fin_ack : std_logic;
  -- declarations related to module create_ahb_commands
  -- declarations related to module get_ahb_hsize
  -- declarations related to module get_byte_offset
  -- aggregate signals for read from pipe AFB_BUS_REQUEST
  signal AFB_BUS_REQUEST_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_BUS_REQUEST_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_BUS_REQUEST_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe AFB_BUS_RESPONSE
  signal AFB_BUS_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_BUS_RESPONSE_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_BUS_RESPONSE_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe AFB_TO_AHB_COMMAND
  signal AFB_TO_AHB_COMMAND_pipe_write_data: std_logic_vector(72 downto 0);
  signal AFB_TO_AHB_COMMAND_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_TO_AHB_COMMAND_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe AHB_TO_AFB_RESPONSE
  signal AHB_TO_AFB_RESPONSE_pipe_read_data: std_logic_vector(32 downto 0);
  signal AHB_TO_AFB_RESPONSE_pipe_read_req: std_logic_vector(0 downto 0);
  signal AHB_TO_AFB_RESPONSE_pipe_read_ack: std_logic_vector(0 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module afb_to_ahb_bridge_daemon
  afb_to_ahb_bridge_daemon_instance:afb_to_ahb_bridge_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => afb_to_ahb_bridge_daemon_start_req,
      start_ack => afb_to_ahb_bridge_daemon_start_ack,
      fin_req => afb_to_ahb_bridge_daemon_fin_req,
      fin_ack => afb_to_ahb_bridge_daemon_fin_ack,
      clk => clk,
      reset => reset,
      AFB_BUS_REQUEST_pipe_read_req => AFB_BUS_REQUEST_pipe_read_req(0 downto 0),
      AFB_BUS_REQUEST_pipe_read_ack => AFB_BUS_REQUEST_pipe_read_ack(0 downto 0),
      AFB_BUS_REQUEST_pipe_read_data => AFB_BUS_REQUEST_pipe_read_data(73 downto 0),
      AHB_TO_AFB_RESPONSE_pipe_read_req => AHB_TO_AFB_RESPONSE_pipe_read_req(0 downto 0),
      AHB_TO_AFB_RESPONSE_pipe_read_ack => AHB_TO_AFB_RESPONSE_pipe_read_ack(0 downto 0),
      AHB_TO_AFB_RESPONSE_pipe_read_data => AHB_TO_AFB_RESPONSE_pipe_read_data(32 downto 0),
      AFB_BUS_RESPONSE_pipe_write_req => AFB_BUS_RESPONSE_pipe_write_req(0 downto 0),
      AFB_BUS_RESPONSE_pipe_write_ack => AFB_BUS_RESPONSE_pipe_write_ack(0 downto 0),
      AFB_BUS_RESPONSE_pipe_write_data => AFB_BUS_RESPONSE_pipe_write_data(32 downto 0),
      AFB_TO_AHB_COMMAND_pipe_write_req => AFB_TO_AHB_COMMAND_pipe_write_req(0 downto 0),
      AFB_TO_AHB_COMMAND_pipe_write_ack => AFB_TO_AHB_COMMAND_pipe_write_ack(0 downto 0),
      AFB_TO_AHB_COMMAND_pipe_write_data => AFB_TO_AHB_COMMAND_pipe_write_data(72 downto 0),
      tag_in => afb_to_ahb_bridge_daemon_tag_in,
      tag_out => afb_to_ahb_bridge_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  afb_to_ahb_bridge_daemon_tag_in <= (others => '0');
  afb_to_ahb_bridge_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => afb_to_ahb_bridge_daemon_start_req, start_ack => afb_to_ahb_bridge_daemon_start_ack,  fin_req => afb_to_ahb_bridge_daemon_fin_req,  fin_ack => afb_to_ahb_bridge_daemon_fin_ack);
  AFB_BUS_REQUEST_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_BUS_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_BUS_REQUEST_pipe_read_req,
      read_ack => AFB_BUS_REQUEST_pipe_read_ack,
      read_data => AFB_BUS_REQUEST_pipe_read_data,
      write_req => AFB_BUS_REQUEST_pipe_write_req,
      write_ack => AFB_BUS_REQUEST_pipe_write_ack,
      write_data => AFB_BUS_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_BUS_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_BUS_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_BUS_RESPONSE_pipe_read_req,
      read_ack => AFB_BUS_RESPONSE_pipe_read_ack,
      read_data => AFB_BUS_RESPONSE_pipe_read_data,
      write_req => AFB_BUS_RESPONSE_pipe_write_req,
      write_ack => AFB_BUS_RESPONSE_pipe_write_ack,
      write_data => AFB_BUS_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_TO_AHB_COMMAND_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_TO_AHB_COMMAND",
      num_reads => 1,
      num_writes => 1,
      data_width => 73,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_TO_AHB_COMMAND_pipe_read_req,
      read_ack => AFB_TO_AHB_COMMAND_pipe_read_ack,
      read_data => AFB_TO_AHB_COMMAND_pipe_read_data,
      write_req => AFB_TO_AHB_COMMAND_pipe_write_req,
      write_ack => AFB_TO_AHB_COMMAND_pipe_write_ack,
      write_data => AFB_TO_AHB_COMMAND_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AHB_TO_AFB_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AHB_TO_AFB_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AHB_TO_AFB_RESPONSE_pipe_read_req,
      read_ack => AHB_TO_AFB_RESPONSE_pipe_read_ack,
      read_data => AHB_TO_AFB_RESPONSE_pipe_read_data,
      write_req => AHB_TO_AFB_RESPONSE_pipe_write_req,
      write_ack => AHB_TO_AFB_RESPONSE_pipe_write_ack,
      write_data => AHB_TO_AFB_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- gated clock generators 
  -- 
end afb_ahb_fifo_bridge_arch;
library ieee;
use ieee.std_logic_1164.all;
package afb_ahb_bridge_Type_Package is -- 
  -- 
end package;
library ahir;
use ahir.BaseComponents.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-->>>>>
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_ahb_bridge_Type_Package.all;
--<<<<<
-->>>>>
library GenericCoreAddOnLib;
library GenericCoreAddOnLib;
--<<<<<
entity afb_ahb_bridge is -- 
  port( -- 
    AFB_BUS_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
    AFB_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
    AFB_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
    HRDATA : in std_logic_vector(31 downto 0);
    HREADY : in std_logic_vector(0 downto 0);
    HRESP : in std_logic_vector(1 downto 0);
    AFB_BUS_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
    AFB_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    AFB_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    HADDR : out std_logic_vector(35 downto 0);
    HBURST : out std_logic_vector(2 downto 0);
    HMASTLOCK : out std_logic_vector(0 downto 0);
    HPROT : out std_logic_vector(3 downto 0);
    HSIZE : out std_logic_vector(2 downto 0);
    HTRANS : out std_logic_vector(1 downto 0);
    HWDATA : out std_logic_vector(31 downto 0);
    HWRITE : out std_logic_vector(0 downto 0);
    SYS_CLK : out std_logic_vector(0 downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
end entity afb_ahb_bridge;
architecture struct of afb_ahb_bridge is -- 
  signal AFB_TO_AHB_COMMAND_pipe_write_data: std_logic_vector(72 downto 0);
  signal AFB_TO_AHB_COMMAND_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_TO_AHB_COMMAND_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_TO_AHB_COMMAND_pipe_read_data: std_logic_vector(72 downto 0);
  signal AFB_TO_AHB_COMMAND_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_TO_AHB_COMMAND_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AHB_TO_AFB_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal AHB_TO_AFB_RESPONSE_pipe_write_req : std_logic_vector(0  downto 0);
  signal AHB_TO_AFB_RESPONSE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AHB_TO_AFB_RESPONSE_pipe_read_data: std_logic_vector(32 downto 0);
  signal AHB_TO_AFB_RESPONSE_pipe_read_req : std_logic_vector(0  downto 0);
  signal AHB_TO_AFB_RESPONSE_pipe_read_ack : std_logic_vector(0  downto 0);
  component afb_ahb_fifo_bridge is -- 
    port( -- 
      AFB_BUS_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
      AFB_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AHB_TO_AFB_RESPONSE_pipe_write_data : in std_logic_vector(32 downto 0);
      AHB_TO_AFB_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      AHB_TO_AFB_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_BUS_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      AFB_TO_AHB_COMMAND_pipe_read_data : out std_logic_vector(72 downto 0);
      AFB_TO_AHB_COMMAND_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_TO_AHB_COMMAND_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for afb_ahb_inst :  afb_ahb_fifo_bridge -- 
    use entity GenericCoreAddOnLib.afb_ahb_fifo_bridge; -- 
  --<<<<<
  component ahblite_controller is -- 
    port( -- 
      AFB_TO_AHB_COMMAND_pipe_write_data : in std_logic_vector(72 downto 0);
      AFB_TO_AHB_COMMAND_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_TO_AHB_COMMAND_pipe_write_ack  : out std_logic_vector(0  downto 0);
      HRDATA : in std_logic_vector(31 downto 0);
      HREADY : in std_logic_vector(0 downto 0);
      HRESP : in std_logic_vector(1 downto 0);
      AHB_TO_AFB_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
      AHB_TO_AFB_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      AHB_TO_AFB_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      HADDR : out std_logic_vector(35 downto 0);
      HBURST : out std_logic_vector(2 downto 0);
      HMASTLOCK : out std_logic_vector(0 downto 0);
      HPROT : out std_logic_vector(3 downto 0);
      HSIZE : out std_logic_vector(2 downto 0);
      HTRANS : out std_logic_vector(1 downto 0);
      HWDATA : out std_logic_vector(31 downto 0);
      HWRITE : out std_logic_vector(0 downto 0);
      SYS_CLK : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for ahblite_controller_inst :  ahblite_controller -- 
    use entity GenericCoreAddOnLib.ahblite_controller; -- 
  --<<<<<
  -- 
begin -- 
  afb_ahb_inst: afb_ahb_fifo_bridge
  port map ( --
    AFB_BUS_REQUEST_pipe_write_data => AFB_BUS_REQUEST_pipe_write_data,
    AFB_BUS_REQUEST_pipe_write_req => AFB_BUS_REQUEST_pipe_write_req,
    AFB_BUS_REQUEST_pipe_write_ack => AFB_BUS_REQUEST_pipe_write_ack,
    AFB_BUS_RESPONSE_pipe_read_data => AFB_BUS_RESPONSE_pipe_read_data,
    AFB_BUS_RESPONSE_pipe_read_req => AFB_BUS_RESPONSE_pipe_read_req,
    AFB_BUS_RESPONSE_pipe_read_ack => AFB_BUS_RESPONSE_pipe_read_ack,
    AFB_TO_AHB_COMMAND_pipe_read_data => AFB_TO_AHB_COMMAND_pipe_write_data,
    AFB_TO_AHB_COMMAND_pipe_read_req => AFB_TO_AHB_COMMAND_pipe_write_ack,
    AFB_TO_AHB_COMMAND_pipe_read_ack => AFB_TO_AHB_COMMAND_pipe_write_req,
    AHB_TO_AFB_RESPONSE_pipe_write_data => AHB_TO_AFB_RESPONSE_pipe_read_data,
    AHB_TO_AFB_RESPONSE_pipe_write_req => AHB_TO_AFB_RESPONSE_pipe_read_ack,
    AHB_TO_AFB_RESPONSE_pipe_write_ack => AHB_TO_AFB_RESPONSE_pipe_read_req,
    clk => clk, reset => reset 
    ); -- 
  ahblite_controller_inst: ahblite_controller
  port map ( --
    AFB_TO_AHB_COMMAND_pipe_write_data => AFB_TO_AHB_COMMAND_pipe_read_data,
    AFB_TO_AHB_COMMAND_pipe_write_req => AFB_TO_AHB_COMMAND_pipe_read_ack,
    AFB_TO_AHB_COMMAND_pipe_write_ack => AFB_TO_AHB_COMMAND_pipe_read_req,
    AHB_TO_AFB_RESPONSE_pipe_read_data => AHB_TO_AFB_RESPONSE_pipe_write_data,
    AHB_TO_AFB_RESPONSE_pipe_read_req => AHB_TO_AFB_RESPONSE_pipe_write_ack,
    AHB_TO_AFB_RESPONSE_pipe_read_ack => AHB_TO_AFB_RESPONSE_pipe_write_req,
    HADDR => HADDR,
    HBURST => HBURST,
    HMASTLOCK => HMASTLOCK,
    HPROT => HPROT,
    HRDATA => HRDATA,
    HREADY => HREADY,
    HRESP => HRESP,
    HSIZE => HSIZE,
    HTRANS => HTRANS,
    HWDATA => HWDATA,
    HWRITE => HWRITE,
    SYS_CLK => SYS_CLK,
    clk => clk, reset => reset 
    ); -- 
  -- pipe AFB_TO_AHB_COMMAND depth set to 0 since it is a P2P pipe.
  AFB_TO_AHB_COMMAND_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe AFB_TO_AHB_COMMAND",
      num_reads => 1,
      num_writes => 1,
      data_width => 73,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_TO_AHB_COMMAND_pipe_read_req,
      read_ack => AFB_TO_AHB_COMMAND_pipe_read_ack,
      read_data => AFB_TO_AHB_COMMAND_pipe_read_data,
      write_req => AFB_TO_AHB_COMMAND_pipe_write_req,
      write_ack => AFB_TO_AHB_COMMAND_pipe_write_ack,
      write_data => AFB_TO_AHB_COMMAND_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- pipe AHB_TO_AFB_RESPONSE depth set to 0 since it is a P2P pipe.
  AHB_TO_AFB_RESPONSE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe AHB_TO_AFB_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AHB_TO_AFB_RESPONSE_pipe_read_req,
      read_ack => AHB_TO_AFB_RESPONSE_pipe_read_ack,
      read_data => AHB_TO_AFB_RESPONSE_pipe_read_data,
      write_req => AHB_TO_AFB_RESPONSE_pipe_write_req,
      write_ack => AHB_TO_AFB_RESPONSE_pipe_write_ack,
      write_data => AHB_TO_AFB_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end struct;

library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.utilities.all;

entity acb_sram_stub is -- 
    generic(addr_width: integer := 10);
    port( -- 
      CORE_BUS_REQUEST_PIPE_WRITE_DATA : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_PIPE_WRITE_REQ : in std_logic_vector(0 downto 0);
      CORE_BUS_REQUEST_PIPE_WRITE_ACK : out std_logic_vector(0 downto 0);
      CORE_BUS_RESPONSE_PIPE_READ_DATA : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_PIPE_READ_REQ : in std_logic_vector(0 downto 0);
      CORE_BUS_RESPONSE_PIPE_READ_ACK : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
end entity;


--
-- a simple interface.. serves single requests.. back to back is ok.
--
architecture Mixed of acb_sram_stub is

	type FsmState is (IdleState, AccessDoneState, WaitOnAcbState);
	signal fsm_state : FsmState;

	signal addr_to_sram: std_logic_vector(addr_width-1 downto 0);
	signal data_to_sram: std_logic_vector(63 downto 0);
	signal byte_mask_to_sram: std_logic_vector(7 downto 0);
	signal read_write_bar: std_logic_vector(0 downto 0);
	signal read_write_bar_reg: std_logic_vector(0 downto 0);

	signal read_data_from_sram: std_logic_vector(63 downto 0);
	signal read_data_from_sram_reg: std_logic_vector(63 downto 0);

	signal latch_response: boolean;	
	signal latch_command: boolean;	
	signal acb_has_command, acb_accepts_response: boolean;

	signal bb_enables: std_logic_vector(7 downto 0);

	signal enable: std_logic;
begin 
	data_to_sram <= CORE_BUS_REQUEST_PIPE_WRITE_DATA(63 downto 0);
	addr_to_sram <= CORE_BUS_REQUEST_PIPE_WRITE_DATA((64 + addr_width)-1 downto 64);
	byte_mask_to_sram <= CORE_BUS_REQUEST_PIPE_WRITE_DATA((64 + 36 + 8)-1 downto 64+36);
	read_write_bar <= CORE_BUS_REQUEST_PIPE_WRITE_DATA((64 + 36 + 8 + 1)-1 downto 64+36+8);

	acb_has_command <= (CORE_BUS_REQUEST_PIPE_WRITE_REQ(0) = '1');
	acb_accepts_response <= (CORE_BUS_RESPONSE_PIPE_READ_REQ(0) = '1');

	process(clk,reset,latch_response)
	begin
		if(clk'event and clk = '1') then
			if(latch_command) then
				read_write_bar_reg <= read_write_bar;
			end if;
			if(latch_response) then
				read_data_from_sram_reg <= read_data_from_sram;
			end if;
		end if;
	end process;



	process(clk, reset, fsm_state, read_write_bar, byte_mask_to_sram, addr_to_sram, data_to_sram,
				acb_has_command, acb_accepts_response)
		variable next_fsm_state_var: FsmState;
		variable enable_var: std_logic;
		variable write_ack_var, read_ack_var: std_logic;
		variable response_val_var : std_logic_vector(64 downto 0);
		variable latch_response_var: boolean;
		variable latch_command_var: boolean;
	begin
		enable_var := '0';
		read_ack_var := '0';
		write_ack_var := '0';
		next_fsm_state_var := fsm_state;

		latch_response_var := false;
		latch_command_var := false;
		response_val_var := (others => '0');

		case fsm_state is
			when IdleState =>
				write_ack_var := '1';
				if (acb_has_command) then
					next_fsm_state_var := AccessDoneState;
					enable_var := '1';
					latch_command_var := true;
				end if;
			when AccessDoneState =>
				read_ack_var := '1';
				if(read_write_bar_reg(0) = '1') then
					response_val_var (63 downto 0):=  read_data_from_sram;
				end if;
				if(acb_accepts_response) then
					write_ack_var := '1';
					if(acb_has_command) then
						enable_var := '1';
						latch_command_var := true;
					else
						next_fsm_state_var := IdleState;
					end if;
				else
					latch_response_var := true;
					next_fsm_state_var := WaitOnAcbState;
				end if;
			when WaitOnAcbState =>
				read_ack_var := '1';
				if(read_write_bar_reg(0) = '1') then
					response_val_var (63 downto 0):=  read_data_from_sram_reg;
				end if;
				if(acb_accepts_response) then
					write_ack_var := '1';
					if(acb_has_command) then
						enable_var := '1';
						latch_command_var := true;
						next_fsm_state_var := AccessDoneState;
					else
						next_fsm_state_var := IdleState;
					end if;
				end if;
		end case;

		enable <= enable_var;

		CORE_BUS_REQUEST_PIPE_WRITE_ACK(0) <= write_ack_var;
		CORE_BUS_RESPONSE_PIPE_READ_ACK(0) <= read_ack_var;
		CORE_BUS_RESPONSE_PIPE_READ_DATA <= response_val_var;

		latch_response <= latch_response_var;
		latch_command <= latch_command_var;
		
		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= IdleState;
			else
				fsm_state <= next_fsm_state_var;
			end if;
		end if;
	end process;

	-- 8 banks.
	bbGen: for B in 0 to 7 generate 

	   bb_enables(B) <= enable when ((read_write_bar(0) = '1')  or (byte_mask_to_sram(B) = '1')) else '0';

	   bb: base_bank 
		generic map (name => "SRAM-STUB-BASE-BANK-" & Convert_To_String(B), 
						g_addr_width => addr_width-3, 
								g_data_width => 8)
		port map (
				datain => data_to_sram ((8*(B+1))-1 downto 8*B),
				dataout => read_data_from_sram((8*(B+1))-1 downto 8*B),
				addrin => addr_to_sram(addr_width-1 downto 3),
				enable => bb_enables(B),
				writebar => read_write_bar(0),
				clk => clk,
				reset => reset);
       end generate bbGen;

end Mixed;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.utilities.all;

entity afb_sram_stub is -- 
    generic(addr_width: integer := 10);
    port( -- 
      AFB_SRAM_COMMAND_PIPE_WRITE_DATA : in std_logic_vector(73 downto 0);
      AFB_SRAM_COMMAND_PIPE_WRITE_REQ : in std_logic_vector(0 downto 0);
      AFB_SRAM_COMMAND_PIPE_WRITE_ACK : out std_logic_vector(0 downto 0);
      AFB_SRAM_RESPONSE_PIPE_READ_DATA : out std_logic_vector(32 downto 0);
      AFB_SRAM_RESPONSE_PIPE_READ_REQ : in std_logic_vector(0 downto 0);
      AFB_SRAM_RESPONSE_PIPE_READ_ACK : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
end entity;


--
-- a simple interface.. serves single requests.. back to back is ok.
--
architecture Mixed of afb_sram_stub is

	type FsmState is (IdleState, AccessDoneState, WaitOnAfbState);
	signal fsm_state : FsmState;

	signal addr_to_sram: std_logic_vector(addr_width-1 downto 0);
	signal data_to_sram: std_logic_vector(31 downto 0);
	signal byte_mask_to_sram: std_logic_vector(3 downto 0);
	signal read_write_bar: std_logic_vector(0 downto 0);
	signal read_write_bar_reg: std_logic_vector(0 downto 0);

	signal read_data_from_sram: std_logic_vector(31 downto 0);
	signal read_data_from_sram_reg: std_logic_vector(31 downto 0);

	signal latch_response: boolean;	
	signal latch_command: boolean;	
	signal afb_has_command, afb_accepts_response: boolean;

	signal bb_enables: std_logic_vector(3 downto 0);

	signal enable: std_logic;
begin 
	data_to_sram <= AFB_SRAM_COMMAND_PIPE_WRITE_DATA(31 downto 0);
	addr_to_sram <= AFB_SRAM_COMMAND_PIPE_WRITE_DATA((32 + addr_width)-1 downto 32);
	byte_mask_to_sram <= AFB_SRAM_COMMAND_PIPE_WRITE_DATA((32 + 36 + 4)-1 downto 32+36);
	read_write_bar <= AFB_SRAM_COMMAND_PIPE_WRITE_DATA((32 + 36 + 4 + 1)-1 downto 32+36+4);

	afb_has_command <= (AFB_SRAM_COMMAND_PIPE_WRITE_REQ(0) = '1');
	afb_accepts_response <= (AFB_SRAM_RESPONSE_PIPE_READ_REQ(0) = '1');

	process(clk,reset,latch_response)
	begin
		if(clk'event and clk = '1') then
			if(latch_command) then
				read_write_bar_reg <= read_write_bar;
			end if;
			if(latch_response) then
				read_data_from_sram_reg <= read_data_from_sram;
			end if;
		end if;
	end process;



	process(clk, reset, fsm_state, read_write_bar, byte_mask_to_sram, addr_to_sram, data_to_sram,
				afb_has_command, afb_accepts_response)
		variable next_fsm_state_var: FsmState;
		variable enable_var: std_logic;
		variable write_ack_var, read_ack_var: std_logic;
		variable response_val_var : std_logic_vector(32 downto 0);
		variable latch_response_var: boolean;
		variable latch_command_var: boolean;
	begin
		enable_var := '0';
		read_ack_var := '0';
		write_ack_var := '0';
		next_fsm_state_var := fsm_state;

		latch_response_var := false;
		latch_command_var := false;
		response_val_var := (others => '0');

		case fsm_state is
			when IdleState =>
				write_ack_var := '1';
				if (afb_has_command) then
					next_fsm_state_var := AccessDoneState;
					enable_var := '1';
					latch_command_var := true;
				end if;
			when AccessDoneState =>
				read_ack_var := '1';
				if(read_write_bar_reg(0) = '1') then
					response_val_var (31 downto 0):=  read_data_from_sram;
				end if;
				if(afb_accepts_response) then
					write_ack_var := '1';
					if(afb_has_command) then
						enable_var := '1';
						latch_command_var := true;
					else
						next_fsm_state_var := IdleState;
					end if;
				else
					latch_response_var := true;
					next_fsm_state_var := WaitOnAfbState;
				end if;
			when WaitOnAfbState =>
				read_ack_var := '1';
				if(read_write_bar_reg(0) = '1') then
					response_val_var (31 downto 0):=  read_data_from_sram_reg;
				end if;
				if(afb_accepts_response) then
					write_ack_var := '1';
					if(afb_has_command) then
						enable_var := '1';
						latch_command_var := true;
						next_fsm_state_var := AccessDoneState;
					else
						next_fsm_state_var := IdleState;
					end if;
				end if;
		end case;

		enable <= enable_var;

		AFB_SRAM_COMMAND_PIPE_WRITE_ACK(0) <= write_ack_var;
		AFB_SRAM_RESPONSE_PIPE_READ_ACK(0) <= read_ack_var;
		AFB_SRAM_RESPONSE_PIPE_READ_DATA <= response_val_var;

		latch_response <= latch_response_var;
		latch_command <= latch_command_var;
		
		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= IdleState;
			else
				fsm_state <= next_fsm_state_var;
			end if;
		end if;
	end process;

	bb_enables(0) <= enable when ((read_write_bar(0) = '1')  or (byte_mask_to_sram(0) = '1')) else '0';
	bb_enables(1) <= enable when ((read_write_bar(0) = '1')  or (byte_mask_to_sram(1) = '1')) else '0';
	bb_enables(2) <= enable when ((read_write_bar(0) = '1')  or (byte_mask_to_sram(2) = '1')) else '0';
	bb_enables(3) <= enable when ((read_write_bar(0) = '1')  or (byte_mask_to_sram(3) = '1')) else '0';

	-- 4 banks.
	bbGen: for B in 0 to 3 generate 
	   bb: base_bank 
		generic map (name => "SRAM-STUB-BASE-BANK-" & Convert_To_String(B), 
						g_addr_width => addr_width-2, 
								g_data_width => 8)
		port map (
				datain => data_to_sram ((8*(B+1))-1 downto 8*B),
				dataout => read_data_from_sram((8*(B+1))-1 downto 8*B),
				addrin => addr_to_sram(addr_width-1 downto 2),
				enable => bb_enables(B),
				writebar => read_write_bar(0),
				clk => clk,
				reset => reset);
       end generate bbGen;

end Mixed;
-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package afb_splitter_global_package is -- 
  constant ASI_AJIT_BRIDGE_CONFIG : std_logic_vector(7 downto 0) := "00110000";
  constant ASI_BLOCK_COPY : std_logic_vector(7 downto 0) := "00010111";
  constant ASI_BLOCK_FILL : std_logic_vector(7 downto 0) := "00011111";
  constant ASI_CACHE_DATA_I : std_logic_vector(7 downto 0) := "00001101";
  constant ASI_CACHE_DATA_I_D : std_logic_vector(7 downto 0) := "00001111";
  constant ASI_CACHE_TAG_I : std_logic_vector(7 downto 0) := "00001100";
  constant ASI_CACHE_TAG_I_D : std_logic_vector(7 downto 0) := "00001110";
  constant ASI_FLUSH_I_CONTEXT : std_logic_vector(7 downto 0) := "00011011";
  constant ASI_FLUSH_I_D_CONTEXT : std_logic_vector(7 downto 0) := "00010011";
  constant ASI_FLUSH_I_D_PAGE : std_logic_vector(7 downto 0) := "00010000";
  constant ASI_FLUSH_I_D_REGION : std_logic_vector(7 downto 0) := "00010010";
  constant ASI_FLUSH_I_D_SEGMENT : std_logic_vector(7 downto 0) := "00010001";
  constant ASI_FLUSH_I_D_USER : std_logic_vector(7 downto 0) := "00010100";
  constant ASI_FLUSH_I_PAGE : std_logic_vector(7 downto 0) := "00011000";
  constant ASI_FLUSH_I_REGION : std_logic_vector(7 downto 0) := "00011010";
  constant ASI_FLUSH_I_SEGMENT : std_logic_vector(7 downto 0) := "00011001";
  constant ASI_FLUSH_I_USER : std_logic_vector(7 downto 0) := "00011100";
  constant ASI_MMU_DIAGNOSTIC_I : std_logic_vector(7 downto 0) := "00000101";
  constant ASI_MMU_DIAGNOSTIC_IO : std_logic_vector(7 downto 0) := "00000111";
  constant ASI_MMU_DIAGNOSTIC_I_D : std_logic_vector(7 downto 0) := "00000110";
  constant ASI_MMU_FLUSH_PROBE : std_logic_vector(7 downto 0) := "00000011";
  constant ASI_MMU_REGISTER : std_logic_vector(7 downto 0) := "00000100";
  constant ASI_SUPERVISOR_DATA : std_logic_vector(7 downto 0) := "00001011";
  constant ASI_SUPERVISOR_INSTRUCTION : std_logic_vector(7 downto 0) := "00001001";
  constant ASI_USER_DATA : std_logic_vector(7 downto 0) := "00001010";
  constant ASI_USER_INSTRUCTION : std_logic_vector(7 downto 0) := "00001000";
  constant CACHE_ARRAY_NOP : std_logic_vector(2 downto 0) := "011";
  constant CACHE_ARRAY_PASS_THROUGH : std_logic_vector(2 downto 0) := "100";
  constant CACHE_ARRAY_READ_DWORD : std_logic_vector(2 downto 0) := "001";
  constant CACHE_ARRAY_WRITE_DWORD : std_logic_vector(2 downto 0) := "010";
  constant CACHE_TAG_CLEAR_ALL : std_logic_vector(2 downto 0) := "100";
  constant CACHE_TAG_CLEAR_LINE : std_logic_vector(2 downto 0) := "011";
  constant CACHE_TAG_INSERT : std_logic_vector(2 downto 0) := "010";
  constant CACHE_TAG_LOOKUP : std_logic_vector(2 downto 0) := "001";
  constant CACHE_TAG_NOP : std_logic_vector(2 downto 0) := "101";
  constant DEBUG_MODE_MASK : std_logic_vector(7 downto 0) := "00000010";
  constant FOUR_3 : std_logic_vector(2 downto 0) := "100";
  constant GDB_DBG_CONNECT : std_logic_vector(7 downto 0) := "00001110";
  constant GDB_DBG_CONTINUE : std_logic_vector(7 downto 0) := "00010000";
  constant GDB_DBG_DETACH : std_logic_vector(7 downto 0) := "00001111";
  constant GDB_DBG_KILL : std_logic_vector(7 downto 0) := "00010011";
  constant GDB_DBG_READ_CONTROL_REG : std_logic_vector(7 downto 0) := "00001101";
  constant GDB_DBG_READ_CPUNIT_REG : std_logic_vector(7 downto 0) := "00010001";
  constant GDB_DBG_READ_FPUNIT_REG : std_logic_vector(7 downto 0) := "00000011";
  constant GDB_DBG_READ_INIT_NPC : std_logic_vector(7 downto 0) := "00011101";
  constant GDB_DBG_READ_INIT_PC : std_logic_vector(7 downto 0) := "00011100";
  constant GDB_DBG_READ_INIT_PSR : std_logic_vector(7 downto 0) := "00011110";
  constant GDB_DBG_READ_IUNIT_REG : std_logic_vector(7 downto 0) := "00000001";
  constant GDB_DBG_READ_MEM : std_logic_vector(7 downto 0) := "00000110";
  constant GDB_DBG_READ_MODE : std_logic_vector(7 downto 0) := "00011111";
  constant GDB_DBG_REMOVE_BREAK_POINT : std_logic_vector(7 downto 0) := "00001001";
  constant GDB_DBG_REMOVE_WATCH_POINT : std_logic_vector(7 downto 0) := "00001011";
  constant GDB_DBG_SET_BREAK_POINT : std_logic_vector(7 downto 0) := "00001000";
  constant GDB_DBG_SET_WATCH_POINT : std_logic_vector(7 downto 0) := "00001010";
  constant GDB_DBG_WRITE_CONTROL_REG : std_logic_vector(7 downto 0) := "00010100";
  constant GDB_DBG_WRITE_CPUNIT_REG : std_logic_vector(7 downto 0) := "00010010";
  constant GDB_DBG_WRITE_FPUNIT_REG : std_logic_vector(7 downto 0) := "00000100";
  constant GDB_DBG_WRITE_INIT_NPC : std_logic_vector(7 downto 0) := "00011010";
  constant GDB_DBG_WRITE_INIT_PC : std_logic_vector(7 downto 0) := "00011001";
  constant GDB_DBG_WRITE_INIT_PSR : std_logic_vector(7 downto 0) := "00011011";
  constant GDB_DBG_WRITE_IUNIT_REG : std_logic_vector(7 downto 0) := "00000010";
  constant GDB_DBG_WRITE_MEM : std_logic_vector(7 downto 0) := "00000111";
  constant GDB_DBG_WRITE_RESET : std_logic_vector(7 downto 0) := "00011000";
  constant HARD_RESET_MASK : std_logic_vector(7 downto 0) := "00000001";
  constant KILL_STREAM_MASK : std_logic_vector(7 downto 0) := "10000000";
  constant KILL_THREAD_MASK : std_logic_vector(7 downto 0) := "10000000";
  constant LOGGER_ACTIVE_MASK : std_logic_vector(7 downto 0) := "00001000";
  constant MMU_PASS_THROUGH_HLIMIT : std_logic_vector(7 downto 0) := "00101111";
  constant MMU_PASS_THROUGH_LLIMIT : std_logic_vector(7 downto 0) := "00100000";
  constant MMU_READ_DWORD : std_logic_vector(7 downto 0) := "00000010";
  constant MMU_READ_LINE : std_logic_vector(7 downto 0) := "00000011";
  constant MMU_WRITE_DWORD : std_logic_vector(7 downto 0) := "00000001";
  constant MMU_WRITE_DWORD_AND_READ_LINE : std_logic_vector(7 downto 0) := "00000111";
  constant MMU_WRITE_DWORD_NO_RESPONSE : std_logic_vector(7 downto 0) := "00000101";
  constant MMU_WRITE_FSR : std_logic_vector(7 downto 0) := "00000100";
  constant NEW_STREAM_MASK : std_logic_vector(7 downto 0) := "10000000";
  constant NEW_THREAD_MASK : std_logic_vector(7 downto 0) := "10000000";
  constant NPC_RESET_VALUE : std_logic_vector(31 downto 0) := "00000000000000000000000000000100";
  constant NWINDOWS : std_logic_vector(31 downto 0) := "00000000000000000000000000001000";
  constant NWINDOWS_MOD_MASK_32 : std_logic_vector(31 downto 0) := "00000000000000000000000000000111";
  constant NWINDOWS_MOD_MASK_5 : std_logic_vector(4 downto 0) := "00111";
  constant NWINDOWSx16 : std_logic_vector(31 downto 0) := "00000000000000000000000010000000";
  constant NWINDOWSx16_MOD_MASK_32 : std_logic_vector(31 downto 0) := "00000000000000000000000001111111";
  constant NWINDOWSx2 : std_logic_vector(31 downto 0) := "00000000000000000000000000010000";
  constant ONE_1 : std_logic_vector(0 downto 0) := "1";
  constant ONE_10 : std_logic_vector(9 downto 0) := "0000000001";
  constant ONE_11 : std_logic_vector(10 downto 0) := "00000000001";
  constant ONE_12 : std_logic_vector(11 downto 0) := "000000000001";
  constant ONE_128 : std_logic_vector(127 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
  constant ONE_13 : std_logic_vector(12 downto 0) := "0000000000001";
  constant ONE_14 : std_logic_vector(13 downto 0) := "00000000000001";
  constant ONE_16 : std_logic_vector(15 downto 0) := "0000000000000001";
  constant ONE_17 : std_logic_vector(16 downto 0) := "00000000000000001";
  constant ONE_18 : std_logic_vector(17 downto 0) := "000000000000000001";
  constant ONE_19 : std_logic_vector(18 downto 0) := "0000000000000000001";
  constant ONE_2 : std_logic_vector(1 downto 0) := "01";
  constant ONE_20 : std_logic_vector(19 downto 0) := "00000000000000000001";
  constant ONE_23 : std_logic_vector(22 downto 0) := "00000000000000000000001";
  constant ONE_24 : std_logic_vector(23 downto 0) := "000000000000000000000001";
  constant ONE_25 : std_logic_vector(24 downto 0) := "0000000000000000000000001";
  constant ONE_256 : std_logic_vector(255 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
  constant ONE_29 : std_logic_vector(28 downto 0) := "00000000000000000000000000001";
  constant ONE_3 : std_logic_vector(2 downto 0) := "001";
  constant ONE_31 : std_logic_vector(30 downto 0) := "0000000000000000000000000000001";
  constant ONE_32 : std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
  constant ONE_36 : std_logic_vector(35 downto 0) := "000000000000000000000000000000000001";
  constant ONE_4 : std_logic_vector(3 downto 0) := "0001";
  constant ONE_48 : std_logic_vector(47 downto 0) := "000000000000000000000000000000000000000000000001";
  constant ONE_5 : std_logic_vector(4 downto 0) := "00001";
  constant ONE_52 : std_logic_vector(51 downto 0) := "0000000000000000000000000000000000000000000000000001";
  constant ONE_6 : std_logic_vector(5 downto 0) := "000001";
  constant ONE_62 : std_logic_vector(61 downto 0) := "00000000000000000000000000000000000000000000000000000000000001";
  constant ONE_63 : std_logic_vector(62 downto 0) := "000000000000000000000000000000000000000000000000000000000000001";
  constant ONE_64 : std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
  constant ONE_7 : std_logic_vector(6 downto 0) := "0000001";
  constant ONE_8 : std_logic_vector(7 downto 0) := "00000001";
  constant ONE_9 : std_logic_vector(8 downto 0) := "000000001";
  constant PC_RESET_VALUE : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
  constant PROCESSOR_ERROR_MODE : std_logic_vector(1 downto 0) := "11";
  constant PROCESSOR_EXECUTE_MODE : std_logic_vector(1 downto 0) := "10";
  constant PROCESSOR_RESET_MODE : std_logic_vector(1 downto 0) := "01";
  constant PROCESSOR_UNDEFINED_MODE : std_logic_vector(1 downto 0) := "00";
  constant PSR_RESET_VALUE : std_logic_vector(31 downto 0) := "00000000000000000001000011000000";
  constant REQUEST_TYPE_BRIDGE_CONFIG_READ : std_logic_vector(3 downto 0) := "1001";
  constant REQUEST_TYPE_BRIDGE_CONFIG_WRITE : std_logic_vector(3 downto 0) := "1000";
  constant REQUEST_TYPE_CCU_CACHE_READ : std_logic_vector(3 downto 0) := "0101";
  constant REQUEST_TYPE_CCU_CACHE_WRITE : std_logic_vector(3 downto 0) := "0110";
  constant REQUEST_TYPE_IFETCH : std_logic_vector(3 downto 0) := "0000";
  constant REQUEST_TYPE_NOP : std_logic_vector(3 downto 0) := "0111";
  constant REQUEST_TYPE_READ : std_logic_vector(3 downto 0) := "0001";
  constant REQUEST_TYPE_STBAR : std_logic_vector(3 downto 0) := "0011";
  constant REQUEST_TYPE_WRFSRFAR : std_logic_vector(3 downto 0) := "0100";
  constant REQUEST_TYPE_WRITE : std_logic_vector(3 downto 0) := "0010";
  constant SINGLE_STEP_MASK : std_logic_vector(7 downto 0) := "00000100";
  constant THREE_2 : std_logic_vector(1 downto 0) := "11";
  constant THREE_3 : std_logic_vector(2 downto 0) := "011";
  constant TRACE_ON : std_logic_vector(0 downto 0) := "1";
  constant TWO_2 : std_logic_vector(1 downto 0) := "10";
  constant TWO_3 : std_logic_vector(2 downto 0) := "010";
  constant WIM_MASK : std_logic_vector(31 downto 0) := "00000000000000000000000011111111";
  constant ZERO_1 : std_logic_vector(0 downto 0) := "0";
  constant ZERO_10 : std_logic_vector(9 downto 0) := "0000000000";
  constant ZERO_11 : std_logic_vector(10 downto 0) := "00000000000";
  constant ZERO_12 : std_logic_vector(11 downto 0) := "000000000000";
  constant ZERO_128 : std_logic_vector(127 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  constant ZERO_13 : std_logic_vector(12 downto 0) := "0000000000000";
  constant ZERO_14 : std_logic_vector(13 downto 0) := "00000000000000";
  constant ZERO_16 : std_logic_vector(15 downto 0) := "0000000000000000";
  constant ZERO_17 : std_logic_vector(16 downto 0) := "00000000000000000";
  constant ZERO_18 : std_logic_vector(17 downto 0) := "000000000000000000";
  constant ZERO_19 : std_logic_vector(18 downto 0) := "0000000000000000000";
  constant ZERO_2 : std_logic_vector(1 downto 0) := "00";
  constant ZERO_20 : std_logic_vector(19 downto 0) := "00000000000000000000";
  constant ZERO_23 : std_logic_vector(22 downto 0) := "00000000000000000000000";
  constant ZERO_24 : std_logic_vector(23 downto 0) := "000000000000000000000000";
  constant ZERO_25 : std_logic_vector(24 downto 0) := "0000000000000000000000000";
  constant ZERO_256 : std_logic_vector(255 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  constant ZERO_29 : std_logic_vector(28 downto 0) := "00000000000000000000000000000";
  constant ZERO_3 : std_logic_vector(2 downto 0) := "000";
  constant ZERO_31 : std_logic_vector(30 downto 0) := "0000000000000000000000000000000";
  constant ZERO_32 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
  constant ZERO_36 : std_logic_vector(35 downto 0) := "000000000000000000000000000000000000";
  constant ZERO_4 : std_logic_vector(3 downto 0) := "0000";
  constant ZERO_48 : std_logic_vector(47 downto 0) := "000000000000000000000000000000000000000000000000";
  constant ZERO_5 : std_logic_vector(4 downto 0) := "00000";
  constant ZERO_52 : std_logic_vector(51 downto 0) := "0000000000000000000000000000000000000000000000000000";
  constant ZERO_6 : std_logic_vector(5 downto 0) := "000000";
  constant ZERO_62 : std_logic_vector(61 downto 0) := "00000000000000000000000000000000000000000000000000000000000000";
  constant ZERO_63 : std_logic_vector(62 downto 0) := "000000000000000000000000000000000000000000000000000000000000000";
  constant ZERO_64 : std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  constant ZERO_7 : std_logic_vector(6 downto 0) := "0000000";
  constant ZERO_8 : std_logic_vector(7 downto 0) := "00000000";
  constant ZERO_9 : std_logic_vector(8 downto 0) := "000000000";
  constant default_mem_pool_base_address : std_logic_vector(0 downto 0) := "0";
  component afb_splitter is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      AFB_HIGH_REQUEST_pipe_read_data: out std_logic_vector(73 downto 0);
      AFB_HIGH_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_HIGH_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
      AFB_HIGH_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
      AFB_HIGH_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_HIGH_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_LOW_REQUEST_pipe_read_data: out std_logic_vector(73 downto 0);
      AFB_LOW_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_LOW_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
      AFB_LOW_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
      AFB_LOW_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_LOW_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_SPLITTER_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_SPLITTER_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_SPLITTER_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_SPLITTER_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_SPLITTER_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_SPLITTER_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      MAX_ADDR_HIGH_ADDR_SPACE: in std_logic_vector(35 downto 0);
      MAX_ADDR_LOW_ADDR_SPACE: in std_logic_vector(35 downto 0);
      MIN_ADDR_HIGH_ADDR_SPACE: in std_logic_vector(35 downto 0);
      MIN_ADDR_LOW_ADDR_SPACE: in std_logic_vector(35 downto 0)); -- 
    -- 
  end component;
  -- 
end package afb_splitter_global_package;
-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_splitter_global_package.all;
entity afb_splitter_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    AFB_SPLITTER_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_SPLITTER_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_SPLITTER_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
    AFB_HIGH_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_HIGH_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_HIGH_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
    AFB_LOW_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_LOW_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_LOW_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
    MAX_ADDR_HIGH_ADDR_SPACE : in std_logic_vector(35 downto 0);
    MAX_ADDR_LOW_ADDR_SPACE : in std_logic_vector(35 downto 0);
    MIN_ADDR_HIGH_ADDR_SPACE : in std_logic_vector(35 downto 0);
    MIN_ADDR_LOW_ADDR_SPACE : in std_logic_vector(35 downto 0);
    AFB_HIGH_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_HIGH_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_HIGH_REQUEST_pipe_write_data : out  std_logic_vector(73 downto 0);
    AFB_SPLITTER_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_SPLITTER_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_SPLITTER_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
    AFB_LOW_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_LOW_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_LOW_REQUEST_pipe_write_data : out  std_logic_vector(73 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity afb_splitter_daemon;
architecture afb_splitter_daemon_arch of afb_splitter_daemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal afb_splitter_daemon_CP_0_start: Boolean;
  signal afb_splitter_daemon_CP_0_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal RPIPE_AFB_SPLITTER_REQUEST_820_inst_req_1 : boolean;
  signal RPIPE_AFB_SPLITTER_REQUEST_820_inst_ack_1 : boolean;
  signal WPIPE_AFB_HIGH_REQUEST_878_inst_req_0 : boolean;
  signal WPIPE_AFB_HIGH_REQUEST_878_inst_ack_0 : boolean;
  signal WPIPE_AFB_HIGH_REQUEST_878_inst_req_1 : boolean;
  signal WPIPE_AFB_HIGH_REQUEST_878_inst_ack_1 : boolean;
  signal do_while_stmt_817_branch_req_0 : boolean;
  signal RPIPE_AFB_SPLITTER_REQUEST_820_inst_req_0 : boolean;
  signal RPIPE_AFB_SPLITTER_REQUEST_820_inst_ack_0 : boolean;
  signal W_do_high_905_delayed_8_0_881_inst_req_0 : boolean;
  signal W_do_high_905_delayed_8_0_881_inst_ack_0 : boolean;
  signal W_do_high_905_delayed_8_0_881_inst_req_1 : boolean;
  signal W_do_high_905_delayed_8_0_881_inst_ack_1 : boolean;
  signal RPIPE_AFB_HIGH_RESPONSE_886_inst_req_0 : boolean;
  signal RPIPE_AFB_HIGH_RESPONSE_886_inst_ack_0 : boolean;
  signal RPIPE_AFB_HIGH_RESPONSE_886_inst_req_1 : boolean;
  signal RPIPE_AFB_HIGH_RESPONSE_886_inst_ack_1 : boolean;
  signal WPIPE_AFB_LOW_REQUEST_895_inst_req_0 : boolean;
  signal WPIPE_AFB_LOW_REQUEST_895_inst_ack_0 : boolean;
  signal WPIPE_AFB_LOW_REQUEST_895_inst_req_1 : boolean;
  signal WPIPE_AFB_LOW_REQUEST_895_inst_ack_1 : boolean;
  signal W_do_low_919_delayed_8_0_898_inst_req_0 : boolean;
  signal W_do_low_919_delayed_8_0_898_inst_ack_0 : boolean;
  signal W_do_low_919_delayed_8_0_898_inst_req_1 : boolean;
  signal W_do_low_919_delayed_8_0_898_inst_ack_1 : boolean;
  signal RPIPE_AFB_LOW_RESPONSE_903_inst_req_0 : boolean;
  signal RPIPE_AFB_LOW_RESPONSE_903_inst_ack_0 : boolean;
  signal RPIPE_AFB_LOW_RESPONSE_903_inst_req_1 : boolean;
  signal RPIPE_AFB_LOW_RESPONSE_903_inst_ack_1 : boolean;
  signal W_is_error_929_delayed_9_0_910_inst_req_0 : boolean;
  signal W_is_error_929_delayed_9_0_910_inst_ack_0 : boolean;
  signal W_is_error_929_delayed_9_0_910_inst_req_1 : boolean;
  signal W_is_error_929_delayed_9_0_910_inst_ack_1 : boolean;
  signal W_is_high_addr_931_delayed_9_0_913_inst_req_0 : boolean;
  signal W_is_high_addr_931_delayed_9_0_913_inst_ack_0 : boolean;
  signal W_is_high_addr_931_delayed_9_0_913_inst_req_1 : boolean;
  signal W_is_high_addr_931_delayed_9_0_913_inst_ack_1 : boolean;
  signal W_is_low_addr_933_delayed_9_0_916_inst_req_0 : boolean;
  signal W_is_low_addr_933_delayed_9_0_916_inst_ack_0 : boolean;
  signal W_is_low_addr_933_delayed_9_0_916_inst_req_1 : boolean;
  signal W_is_low_addr_933_delayed_9_0_916_inst_ack_1 : boolean;
  signal WPIPE_AFB_SPLITTER_RESPONSE_931_inst_req_0 : boolean;
  signal WPIPE_AFB_SPLITTER_RESPONSE_931_inst_ack_0 : boolean;
  signal WPIPE_AFB_SPLITTER_RESPONSE_931_inst_req_1 : boolean;
  signal WPIPE_AFB_SPLITTER_RESPONSE_931_inst_ack_1 : boolean;
  signal do_while_stmt_817_branch_ack_0 : boolean;
  signal do_while_stmt_817_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "afb_splitter_daemon_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  afb_splitter_daemon_CP_0_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "afb_splitter_daemon_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= afb_splitter_daemon_CP_0_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= afb_splitter_daemon_CP_0_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= afb_splitter_daemon_CP_0_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  afb_splitter_daemon_CP_0: Block -- control-path 
    signal afb_splitter_daemon_CP_0_elements: BooleanArray(55 downto 0);
    -- 
  begin -- 
    afb_splitter_daemon_CP_0_elements(0) <= afb_splitter_daemon_CP_0_start;
    afb_splitter_daemon_CP_0_symbol <= afb_splitter_daemon_CP_0_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_816/$entry
      -- CP-element group 0: 	 branch_block_stmt_816/branch_block_stmt_816__entry__
      -- CP-element group 0: 	 branch_block_stmt_816/do_while_stmt_817__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	55 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_816/$exit
      -- CP-element group 1: 	 branch_block_stmt_816/branch_block_stmt_816__exit__
      -- CP-element group 1: 	 branch_block_stmt_816/do_while_stmt_817__exit__
      -- 
    afb_splitter_daemon_CP_0_elements(1) <= afb_splitter_daemon_CP_0_elements(55);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_816/do_while_stmt_817/$entry
      -- CP-element group 2: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817__entry__
      -- 
    afb_splitter_daemon_CP_0_elements(2) <= afb_splitter_daemon_CP_0_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	55 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817__exit__
      -- 
    -- Element group afb_splitter_daemon_CP_0_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_816/do_while_stmt_817/loop_back
      -- 
    -- Element group afb_splitter_daemon_CP_0_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	51 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	53 
    -- CP-element group 5: 	54 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_816/do_while_stmt_817/condition_done
      -- CP-element group 5: 	 branch_block_stmt_816/do_while_stmt_817/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_816/do_while_stmt_817/loop_taken/$entry
      -- 
    afb_splitter_daemon_CP_0_elements(5) <= afb_splitter_daemon_CP_0_elements(51);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	52 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_816/do_while_stmt_817/loop_body_done
      -- 
    afb_splitter_daemon_CP_0_elements(6) <= afb_splitter_daemon_CP_0_elements(52);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/back_edge_to_loop_body
      -- 
    afb_splitter_daemon_CP_0_elements(7) <= afb_splitter_daemon_CP_0_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/first_time_through_loop_body
      -- 
    afb_splitter_daemon_CP_0_elements(8) <= afb_splitter_daemon_CP_0_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	10 
    -- CP-element group 9: 	21 
    -- CP-element group 9: 	32 
    -- CP-element group 9: 	51 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/loop_body_start
      -- 
    -- Element group afb_splitter_daemon_CP_0_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	9 
    -- CP-element group 10: marked-predecessors 
    -- CP-element group 10: 	13 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	12 
    -- CP-element group 10:  members (3) 
      -- CP-element group 10: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_sample_start_
      -- CP-element group 10: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_Sample/$entry
      -- CP-element group 10: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_Sample/rr
      -- 
    rr_33_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_33_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(10), ack => RPIPE_AFB_SPLITTER_REQUEST_820_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(9) & afb_splitter_daemon_CP_0_elements(13);
      gj_afb_splitter_daemon_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	12 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	15 
    -- CP-element group 11: 	19 
    -- CP-element group 11: 	26 
    -- CP-element group 11: 	30 
    -- CP-element group 11: 	38 
    -- CP-element group 11: 	42 
    -- CP-element group 11: 	46 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_Update/$entry
      -- CP-element group 11: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_Update/cr
      -- CP-element group 11: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_update_start_
      -- 
    cr_38_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_38_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(11), ack => RPIPE_AFB_SPLITTER_REQUEST_820_inst_req_1); -- 
    afb_splitter_daemon_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 7) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1);
      constant place_markings: IntegerArray(0 to 7)  := (0 => 0,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1);
      constant place_delays: IntegerArray(0 to 7) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 8); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(12) & afb_splitter_daemon_CP_0_elements(15) & afb_splitter_daemon_CP_0_elements(19) & afb_splitter_daemon_CP_0_elements(26) & afb_splitter_daemon_CP_0_elements(30) & afb_splitter_daemon_CP_0_elements(38) & afb_splitter_daemon_CP_0_elements(42) & afb_splitter_daemon_CP_0_elements(46);
      gj_afb_splitter_daemon_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 8, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  transition  input  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	10 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	11 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_Sample/$exit
      -- CP-element group 12: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_Sample/ra
      -- 
    ra_34_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_SPLITTER_REQUEST_820_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(12)); -- 
    -- CP-element group 13:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	14 
    -- CP-element group 13: 	17 
    -- CP-element group 13: 	25 
    -- CP-element group 13: 	28 
    -- CP-element group 13: 	36 
    -- CP-element group 13: 	40 
    -- CP-element group 13: 	44 
    -- CP-element group 13: marked-successors 
    -- CP-element group 13: 	10 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_Update/$exit
      -- CP-element group 13: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_Update/ca
      -- CP-element group 13: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_SPLITTER_REQUEST_820_update_completed_
      -- 
    ca_39_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_SPLITTER_REQUEST_820_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(13)); -- 
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	13 
    -- CP-element group 14: marked-predecessors 
    -- CP-element group 14: 	16 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	15 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_sample_start_
      -- CP-element group 14: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_Sample/$entry
      -- CP-element group 14: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_Sample/req
      -- 
    req_47_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_47_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(14), ack => WPIPE_AFB_HIGH_REQUEST_878_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(13) & afb_splitter_daemon_CP_0_elements(16);
      gj_afb_splitter_daemon_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	14 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	16 
    -- CP-element group 15: marked-successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (6) 
      -- CP-element group 15: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_update_start_
      -- CP-element group 15: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_Sample/$exit
      -- CP-element group 15: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_Sample/ack
      -- CP-element group 15: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_Update/$entry
      -- CP-element group 15: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_Update/req
      -- 
    ack_48_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_HIGH_REQUEST_878_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(15)); -- 
    req_52_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_52_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(15), ack => WPIPE_AFB_HIGH_REQUEST_878_inst_req_1); -- 
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	15 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	52 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	14 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_Update/$exit
      -- CP-element group 16: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_HIGH_REQUEST_878_Update/ack
      -- 
    ack_53_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_HIGH_REQUEST_878_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(16)); -- 
    -- CP-element group 17:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	13 
    -- CP-element group 17: marked-predecessors 
    -- CP-element group 17: 	19 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_sample_start_
      -- CP-element group 17: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_Sample/$entry
      -- CP-element group 17: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_Sample/req
      -- 
    req_61_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_61_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(17), ack => W_do_high_905_delayed_8_0_881_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(13) & afb_splitter_daemon_CP_0_elements(19);
      gj_afb_splitter_daemon_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: marked-predecessors 
    -- CP-element group 18: 	22 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	20 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_update_start_
      -- CP-element group 18: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_Update/$entry
      -- CP-element group 18: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_Update/req
      -- 
    req_66_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_66_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(18), ack => W_do_high_905_delayed_8_0_881_inst_req_1); -- 
    afb_splitter_daemon_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_splitter_daemon_CP_0_elements(22);
      gj_afb_splitter_daemon_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: marked-successors 
    -- CP-element group 19: 	11 
    -- CP-element group 19: 	17 
    -- CP-element group 19:  members (3) 
      -- CP-element group 19: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_sample_completed_
      -- CP-element group 19: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_Sample/$exit
      -- CP-element group 19: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_Sample/ack
      -- 
    ack_62_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_high_905_delayed_8_0_881_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(19)); -- 
    -- CP-element group 20:  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	18 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	22 
    -- CP-element group 20:  members (3) 
      -- CP-element group 20: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_Update/$exit
      -- CP-element group 20: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_883_Update/ack
      -- 
    ack_67_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_high_905_delayed_8_0_881_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(20)); -- 
    -- CP-element group 21:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	9 
    -- CP-element group 21: marked-predecessors 
    -- CP-element group 21: 	24 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	23 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_sample_start_
      -- CP-element group 21: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_Sample/$entry
      -- CP-element group 21: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_Sample/rr
      -- 
    rr_75_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_75_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(21), ack => RPIPE_AFB_HIGH_RESPONSE_886_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_21: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_21"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(9) & afb_splitter_daemon_CP_0_elements(24);
      gj_afb_splitter_daemon_cp_element_group_21 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(21), clk => clk, reset => reset); --
    end block;
    -- CP-element group 22:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	20 
    -- CP-element group 22: 	23 
    -- CP-element group 22: marked-predecessors 
    -- CP-element group 22: 	49 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	24 
    -- CP-element group 22: marked-successors 
    -- CP-element group 22: 	18 
    -- CP-element group 22:  members (3) 
      -- CP-element group 22: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_update_start_
      -- CP-element group 22: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_Update/$entry
      -- CP-element group 22: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_Update/cr
      -- 
    cr_80_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_80_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(22), ack => RPIPE_AFB_HIGH_RESPONSE_886_inst_req_1); -- 
    afb_splitter_daemon_cp_element_group_22: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_22"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(20) & afb_splitter_daemon_CP_0_elements(23) & afb_splitter_daemon_CP_0_elements(49);
      gj_afb_splitter_daemon_cp_element_group_22 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(22), clk => clk, reset => reset); --
    end block;
    -- CP-element group 23:  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	21 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	22 
    -- CP-element group 23:  members (3) 
      -- CP-element group 23: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_sample_completed_
      -- CP-element group 23: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_Sample/$exit
      -- CP-element group 23: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_Sample/ra
      -- 
    ra_76_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_HIGH_RESPONSE_886_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(23)); -- 
    -- CP-element group 24:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	22 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	48 
    -- CP-element group 24: marked-successors 
    -- CP-element group 24: 	21 
    -- CP-element group 24:  members (3) 
      -- CP-element group 24: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_update_completed_
      -- CP-element group 24: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_Update/$exit
      -- CP-element group 24: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_HIGH_RESPONSE_886_Update/ca
      -- 
    ca_81_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 24_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_HIGH_RESPONSE_886_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(24)); -- 
    -- CP-element group 25:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	13 
    -- CP-element group 25: marked-predecessors 
    -- CP-element group 25: 	27 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	26 
    -- CP-element group 25:  members (3) 
      -- CP-element group 25: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_sample_start_
      -- CP-element group 25: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_Sample/$entry
      -- CP-element group 25: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_Sample/req
      -- 
    req_89_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_89_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(25), ack => WPIPE_AFB_LOW_REQUEST_895_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_25: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_25"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(13) & afb_splitter_daemon_CP_0_elements(27);
      gj_afb_splitter_daemon_cp_element_group_25 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(25), clk => clk, reset => reset); --
    end block;
    -- CP-element group 26:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	25 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	27 
    -- CP-element group 26: marked-successors 
    -- CP-element group 26: 	11 
    -- CP-element group 26:  members (6) 
      -- CP-element group 26: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_sample_completed_
      -- CP-element group 26: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_update_start_
      -- CP-element group 26: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_Sample/$exit
      -- CP-element group 26: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_Sample/ack
      -- CP-element group 26: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_Update/$entry
      -- CP-element group 26: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_Update/req
      -- 
    ack_90_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 26_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_LOW_REQUEST_895_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(26)); -- 
    req_94_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_94_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(26), ack => WPIPE_AFB_LOW_REQUEST_895_inst_req_1); -- 
    -- CP-element group 27:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	26 
    -- CP-element group 27: successors 
    -- CP-element group 27: 	52 
    -- CP-element group 27: marked-successors 
    -- CP-element group 27: 	25 
    -- CP-element group 27:  members (3) 
      -- CP-element group 27: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_update_completed_
      -- CP-element group 27: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_Update/$exit
      -- CP-element group 27: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_LOW_REQUEST_895_Update/ack
      -- 
    ack_95_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_LOW_REQUEST_895_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(27)); -- 
    -- CP-element group 28:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	13 
    -- CP-element group 28: marked-predecessors 
    -- CP-element group 28: 	30 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	30 
    -- CP-element group 28:  members (3) 
      -- CP-element group 28: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_sample_start_
      -- CP-element group 28: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_Sample/$entry
      -- CP-element group 28: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_Sample/req
      -- 
    req_103_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_103_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(28), ack => W_do_low_919_delayed_8_0_898_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_28: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_28"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(13) & afb_splitter_daemon_CP_0_elements(30);
      gj_afb_splitter_daemon_cp_element_group_28 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(28), clk => clk, reset => reset); --
    end block;
    -- CP-element group 29:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: marked-predecessors 
    -- CP-element group 29: 	33 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (3) 
      -- CP-element group 29: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_update_start_
      -- CP-element group 29: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_Update/$entry
      -- CP-element group 29: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_Update/req
      -- 
    req_108_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_108_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(29), ack => W_do_low_919_delayed_8_0_898_inst_req_1); -- 
    afb_splitter_daemon_cp_element_group_29: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_29"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_splitter_daemon_CP_0_elements(33);
      gj_afb_splitter_daemon_cp_element_group_29 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(29), clk => clk, reset => reset); --
    end block;
    -- CP-element group 30:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: 	28 
    -- CP-element group 30: successors 
    -- CP-element group 30: marked-successors 
    -- CP-element group 30: 	11 
    -- CP-element group 30: 	28 
    -- CP-element group 30:  members (3) 
      -- CP-element group 30: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_sample_completed_
      -- CP-element group 30: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_Sample/$exit
      -- CP-element group 30: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_Sample/ack
      -- 
    ack_104_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 30_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_low_919_delayed_8_0_898_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(30)); -- 
    -- CP-element group 31:  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31: 	33 
    -- CP-element group 31:  members (3) 
      -- CP-element group 31: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_update_completed_
      -- CP-element group 31: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_Update/$exit
      -- CP-element group 31: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_900_Update/ack
      -- 
    ack_109_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 31_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_low_919_delayed_8_0_898_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(31)); -- 
    -- CP-element group 32:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	9 
    -- CP-element group 32: marked-predecessors 
    -- CP-element group 32: 	35 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	34 
    -- CP-element group 32:  members (3) 
      -- CP-element group 32: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_sample_start_
      -- CP-element group 32: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_Sample/$entry
      -- CP-element group 32: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_Sample/rr
      -- 
    rr_117_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_117_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(32), ack => RPIPE_AFB_LOW_RESPONSE_903_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_32: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_32"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(9) & afb_splitter_daemon_CP_0_elements(35);
      gj_afb_splitter_daemon_cp_element_group_32 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(32), clk => clk, reset => reset); --
    end block;
    -- CP-element group 33:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	31 
    -- CP-element group 33: 	34 
    -- CP-element group 33: marked-predecessors 
    -- CP-element group 33: 	49 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	35 
    -- CP-element group 33: marked-successors 
    -- CP-element group 33: 	29 
    -- CP-element group 33:  members (3) 
      -- CP-element group 33: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_update_start_
      -- CP-element group 33: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_Update/$entry
      -- CP-element group 33: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_Update/cr
      -- 
    cr_122_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_122_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(33), ack => RPIPE_AFB_LOW_RESPONSE_903_inst_req_1); -- 
    afb_splitter_daemon_cp_element_group_33: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_33"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(31) & afb_splitter_daemon_CP_0_elements(34) & afb_splitter_daemon_CP_0_elements(49);
      gj_afb_splitter_daemon_cp_element_group_33 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(33), clk => clk, reset => reset); --
    end block;
    -- CP-element group 34:  transition  input  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	32 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	33 
    -- CP-element group 34:  members (3) 
      -- CP-element group 34: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_sample_completed_
      -- CP-element group 34: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_Sample/$exit
      -- CP-element group 34: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_Sample/ra
      -- 
    ra_118_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 34_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_LOW_RESPONSE_903_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(34)); -- 
    -- CP-element group 35:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	33 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	48 
    -- CP-element group 35: marked-successors 
    -- CP-element group 35: 	32 
    -- CP-element group 35:  members (3) 
      -- CP-element group 35: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_update_completed_
      -- CP-element group 35: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_Update/$exit
      -- CP-element group 35: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/RPIPE_AFB_LOW_RESPONSE_903_Update/ca
      -- 
    ca_123_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 35_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_LOW_RESPONSE_903_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(35)); -- 
    -- CP-element group 36:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	13 
    -- CP-element group 36: marked-predecessors 
    -- CP-element group 36: 	38 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	38 
    -- CP-element group 36:  members (3) 
      -- CP-element group 36: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_sample_start_
      -- CP-element group 36: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_Sample/$entry
      -- CP-element group 36: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_Sample/req
      -- 
    req_131_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_131_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(36), ack => W_is_error_929_delayed_9_0_910_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_36: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_36"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(13) & afb_splitter_daemon_CP_0_elements(38);
      gj_afb_splitter_daemon_cp_element_group_36 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(36), clk => clk, reset => reset); --
    end block;
    -- CP-element group 37:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: marked-predecessors 
    -- CP-element group 37: 	49 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	39 
    -- CP-element group 37:  members (3) 
      -- CP-element group 37: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_update_start_
      -- CP-element group 37: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_Update/$entry
      -- CP-element group 37: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_Update/req
      -- 
    req_136_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_136_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(37), ack => W_is_error_929_delayed_9_0_910_inst_req_1); -- 
    afb_splitter_daemon_cp_element_group_37: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_37"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_splitter_daemon_CP_0_elements(49);
      gj_afb_splitter_daemon_cp_element_group_37 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(37), clk => clk, reset => reset); --
    end block;
    -- CP-element group 38:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	36 
    -- CP-element group 38: successors 
    -- CP-element group 38: marked-successors 
    -- CP-element group 38: 	11 
    -- CP-element group 38: 	36 
    -- CP-element group 38:  members (3) 
      -- CP-element group 38: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_sample_completed_
      -- CP-element group 38: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_Sample/$exit
      -- CP-element group 38: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_Sample/ack
      -- 
    ack_132_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 38_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_is_error_929_delayed_9_0_910_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(38)); -- 
    -- CP-element group 39:  transition  input  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	37 
    -- CP-element group 39: successors 
    -- CP-element group 39: 	48 
    -- CP-element group 39:  members (3) 
      -- CP-element group 39: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_update_completed_
      -- CP-element group 39: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_Update/$exit
      -- CP-element group 39: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_912_Update/ack
      -- 
    ack_137_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 39_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_is_error_929_delayed_9_0_910_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(39)); -- 
    -- CP-element group 40:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: 	13 
    -- CP-element group 40: marked-predecessors 
    -- CP-element group 40: 	42 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	42 
    -- CP-element group 40:  members (3) 
      -- CP-element group 40: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_sample_start_
      -- CP-element group 40: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_Sample/$entry
      -- CP-element group 40: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_Sample/req
      -- 
    req_145_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_145_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(40), ack => W_is_high_addr_931_delayed_9_0_913_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_40: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_40"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(13) & afb_splitter_daemon_CP_0_elements(42);
      gj_afb_splitter_daemon_cp_element_group_40 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(40), clk => clk, reset => reset); --
    end block;
    -- CP-element group 41:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: marked-predecessors 
    -- CP-element group 41: 	49 
    -- CP-element group 41: successors 
    -- CP-element group 41: 	43 
    -- CP-element group 41:  members (3) 
      -- CP-element group 41: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_update_start_
      -- CP-element group 41: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_Update/$entry
      -- CP-element group 41: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_Update/req
      -- 
    req_150_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_150_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(41), ack => W_is_high_addr_931_delayed_9_0_913_inst_req_1); -- 
    afb_splitter_daemon_cp_element_group_41: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_41"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_splitter_daemon_CP_0_elements(49);
      gj_afb_splitter_daemon_cp_element_group_41 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(41), clk => clk, reset => reset); --
    end block;
    -- CP-element group 42:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: 	40 
    -- CP-element group 42: successors 
    -- CP-element group 42: marked-successors 
    -- CP-element group 42: 	11 
    -- CP-element group 42: 	40 
    -- CP-element group 42:  members (3) 
      -- CP-element group 42: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_sample_completed_
      -- CP-element group 42: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_Sample/$exit
      -- CP-element group 42: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_Sample/ack
      -- 
    ack_146_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 42_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_is_high_addr_931_delayed_9_0_913_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(42)); -- 
    -- CP-element group 43:  transition  input  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: 	41 
    -- CP-element group 43: successors 
    -- CP-element group 43: 	48 
    -- CP-element group 43:  members (3) 
      -- CP-element group 43: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_update_completed_
      -- CP-element group 43: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_Update/$exit
      -- CP-element group 43: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_915_Update/ack
      -- 
    ack_151_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 43_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_is_high_addr_931_delayed_9_0_913_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(43)); -- 
    -- CP-element group 44:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: 	13 
    -- CP-element group 44: marked-predecessors 
    -- CP-element group 44: 	46 
    -- CP-element group 44: successors 
    -- CP-element group 44: 	46 
    -- CP-element group 44:  members (3) 
      -- CP-element group 44: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_sample_start_
      -- CP-element group 44: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_Sample/$entry
      -- CP-element group 44: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_Sample/req
      -- 
    req_159_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_159_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(44), ack => W_is_low_addr_933_delayed_9_0_916_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_44: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_44"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(13) & afb_splitter_daemon_CP_0_elements(46);
      gj_afb_splitter_daemon_cp_element_group_44 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(44), clk => clk, reset => reset); --
    end block;
    -- CP-element group 45:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: marked-predecessors 
    -- CP-element group 45: 	49 
    -- CP-element group 45: successors 
    -- CP-element group 45: 	47 
    -- CP-element group 45:  members (3) 
      -- CP-element group 45: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_update_start_
      -- CP-element group 45: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_Update/$entry
      -- CP-element group 45: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_Update/req
      -- 
    req_164_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_164_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(45), ack => W_is_low_addr_933_delayed_9_0_916_inst_req_1); -- 
    afb_splitter_daemon_cp_element_group_45: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_45"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_splitter_daemon_CP_0_elements(49);
      gj_afb_splitter_daemon_cp_element_group_45 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(45), clk => clk, reset => reset); --
    end block;
    -- CP-element group 46:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: 	44 
    -- CP-element group 46: successors 
    -- CP-element group 46: marked-successors 
    -- CP-element group 46: 	11 
    -- CP-element group 46: 	44 
    -- CP-element group 46:  members (3) 
      -- CP-element group 46: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_sample_completed_
      -- CP-element group 46: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_Sample/$exit
      -- CP-element group 46: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_Sample/ack
      -- 
    ack_160_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 46_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_is_low_addr_933_delayed_9_0_916_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(46)); -- 
    -- CP-element group 47:  transition  input  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: 	45 
    -- CP-element group 47: successors 
    -- CP-element group 47: 	48 
    -- CP-element group 47:  members (3) 
      -- CP-element group 47: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_update_completed_
      -- CP-element group 47: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_Update/$exit
      -- CP-element group 47: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/assign_stmt_918_Update/ack
      -- 
    ack_165_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 47_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_is_low_addr_933_delayed_9_0_916_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(47)); -- 
    -- CP-element group 48:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: 	24 
    -- CP-element group 48: 	35 
    -- CP-element group 48: 	39 
    -- CP-element group 48: 	43 
    -- CP-element group 48: 	47 
    -- CP-element group 48: marked-predecessors 
    -- CP-element group 48: 	50 
    -- CP-element group 48: successors 
    -- CP-element group 48: 	49 
    -- CP-element group 48:  members (3) 
      -- CP-element group 48: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_sample_start_
      -- CP-element group 48: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_Sample/$entry
      -- CP-element group 48: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_Sample/req
      -- 
    req_173_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_173_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(48), ack => WPIPE_AFB_SPLITTER_RESPONSE_931_inst_req_0); -- 
    afb_splitter_daemon_cp_element_group_48: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_48"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(24) & afb_splitter_daemon_CP_0_elements(35) & afb_splitter_daemon_CP_0_elements(39) & afb_splitter_daemon_CP_0_elements(43) & afb_splitter_daemon_CP_0_elements(47) & afb_splitter_daemon_CP_0_elements(50);
      gj_afb_splitter_daemon_cp_element_group_48 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(48), clk => clk, reset => reset); --
    end block;
    -- CP-element group 49:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: 	48 
    -- CP-element group 49: successors 
    -- CP-element group 49: 	50 
    -- CP-element group 49: marked-successors 
    -- CP-element group 49: 	22 
    -- CP-element group 49: 	33 
    -- CP-element group 49: 	37 
    -- CP-element group 49: 	41 
    -- CP-element group 49: 	45 
    -- CP-element group 49:  members (6) 
      -- CP-element group 49: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_sample_completed_
      -- CP-element group 49: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_update_start_
      -- CP-element group 49: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_Sample/$exit
      -- CP-element group 49: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_Sample/ack
      -- CP-element group 49: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_Update/$entry
      -- CP-element group 49: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_Update/req
      -- 
    ack_174_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 49_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_SPLITTER_RESPONSE_931_inst_ack_0, ack => afb_splitter_daemon_CP_0_elements(49)); -- 
    req_178_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_178_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(49), ack => WPIPE_AFB_SPLITTER_RESPONSE_931_inst_req_1); -- 
    -- CP-element group 50:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: 	49 
    -- CP-element group 50: successors 
    -- CP-element group 50: 	52 
    -- CP-element group 50: marked-successors 
    -- CP-element group 50: 	48 
    -- CP-element group 50:  members (3) 
      -- CP-element group 50: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_update_completed_
      -- CP-element group 50: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_Update/$exit
      -- CP-element group 50: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/WPIPE_AFB_SPLITTER_RESPONSE_931_Update/ack
      -- 
    ack_179_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 50_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_SPLITTER_RESPONSE_931_inst_ack_1, ack => afb_splitter_daemon_CP_0_elements(50)); -- 
    -- CP-element group 51:  transition  output  delay-element  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: 	9 
    -- CP-element group 51: successors 
    -- CP-element group 51: 	5 
    -- CP-element group 51:  members (2) 
      -- CP-element group 51: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/condition_evaluated
      -- CP-element group 51: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/loop_body_delay_to_condition_start
      -- 
    condition_evaluated_24_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_24_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_splitter_daemon_CP_0_elements(51), ack => do_while_stmt_817_branch_req_0); -- 
    -- Element group afb_splitter_daemon_CP_0_elements(51) is a control-delay.
    cp_element_51_delay: control_delay_element  generic map(name => " 51_delay", delay_value => 1)  port map(req => afb_splitter_daemon_CP_0_elements(9), ack => afb_splitter_daemon_CP_0_elements(51), clk => clk, reset =>reset);
    -- CP-element group 52:  join  transition  bypass  pipeline-parent 
    -- CP-element group 52: predecessors 
    -- CP-element group 52: 	16 
    -- CP-element group 52: 	27 
    -- CP-element group 52: 	50 
    -- CP-element group 52: successors 
    -- CP-element group 52: 	6 
    -- CP-element group 52:  members (1) 
      -- CP-element group 52: 	 branch_block_stmt_816/do_while_stmt_817/do_while_stmt_817_loop_body/$exit
      -- 
    afb_splitter_daemon_cp_element_group_52: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 15,2 => 15);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 39) := "afb_splitter_daemon_cp_element_group_52"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_splitter_daemon_CP_0_elements(16) & afb_splitter_daemon_CP_0_elements(27) & afb_splitter_daemon_CP_0_elements(50);
      gj_afb_splitter_daemon_cp_element_group_52 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(52), clk => clk, reset => reset); --
    end block;
    -- CP-element group 53:  transition  input  bypass  pipeline-parent 
    -- CP-element group 53: predecessors 
    -- CP-element group 53: 	5 
    -- CP-element group 53: successors 
    -- CP-element group 53:  members (2) 
      -- CP-element group 53: 	 branch_block_stmt_816/do_while_stmt_817/loop_exit/$exit
      -- CP-element group 53: 	 branch_block_stmt_816/do_while_stmt_817/loop_exit/ack
      -- 
    ack_184_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 53_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_817_branch_ack_0, ack => afb_splitter_daemon_CP_0_elements(53)); -- 
    -- CP-element group 54:  transition  input  bypass  pipeline-parent 
    -- CP-element group 54: predecessors 
    -- CP-element group 54: 	5 
    -- CP-element group 54: successors 
    -- CP-element group 54:  members (2) 
      -- CP-element group 54: 	 branch_block_stmt_816/do_while_stmt_817/loop_taken/$exit
      -- CP-element group 54: 	 branch_block_stmt_816/do_while_stmt_817/loop_taken/ack
      -- 
    ack_188_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 54_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_817_branch_ack_1, ack => afb_splitter_daemon_CP_0_elements(54)); -- 
    -- CP-element group 55:  transition  bypass  pipeline-parent 
    -- CP-element group 55: predecessors 
    -- CP-element group 55: 	3 
    -- CP-element group 55: successors 
    -- CP-element group 55: 	1 
    -- CP-element group 55:  members (1) 
      -- CP-element group 55: 	 branch_block_stmt_816/do_while_stmt_817/$exit
      -- 
    afb_splitter_daemon_CP_0_elements(55) <= afb_splitter_daemon_CP_0_elements(3);
    afb_splitter_daemon_do_while_stmt_817_terminator_189: loop_terminator -- 
      generic map (name => " afb_splitter_daemon_do_while_stmt_817_terminator_189", max_iterations_in_flight =>15) 
      port map(loop_body_exit => afb_splitter_daemon_CP_0_elements(6),loop_continue => afb_splitter_daemon_CP_0_elements(54),loop_terminate => afb_splitter_daemon_CP_0_elements(53),loop_back => afb_splitter_daemon_CP_0_elements(4),loop_exit => afb_splitter_daemon_CP_0_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_25_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= afb_splitter_daemon_CP_0_elements(7);
        preds(1)  <= afb_splitter_daemon_CP_0_elements(8);
        entry_tmerge_25 : transition_merge -- 
          generic map(name => " entry_tmerge_25")
          port map (preds => preds, symbol_out => afb_splitter_daemon_CP_0_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal MUX_927_wire : std_logic_vector(32 downto 0);
    signal MUX_928_wire : std_logic_vector(32 downto 0);
    signal NOT_u1_u1_874_wire : std_logic_vector(0 downto 0);
    signal NOT_u1_u1_891_wire : std_logic_vector(0 downto 0);
    signal RPIPE_MAX_ADDR_HIGH_ADDR_SPACE_853_wire : std_logic_vector(35 downto 0);
    signal RPIPE_MAX_ADDR_LOW_ADDR_SPACE_862_wire : std_logic_vector(35 downto 0);
    signal RPIPE_MIN_ADDR_HIGH_ADDR_SPACE_850_wire : std_logic_vector(35 downto 0);
    signal RPIPE_MIN_ADDR_LOW_ADDR_SPACE_859_wire : std_logic_vector(35 downto 0);
    signal UGE_u36_u1_851_wire : std_logic_vector(0 downto 0);
    signal UGE_u36_u1_860_wire : std_logic_vector(0 downto 0);
    signal ULE_u36_u1_854_wire : std_logic_vector(0 downto 0);
    signal ULE_u36_u1_863_wire : std_logic_vector(0 downto 0);
    signal addr36_837 : std_logic_vector(35 downto 0);
    signal byte_mask_833 : std_logic_vector(3 downto 0);
    signal command_821 : std_logic_vector(73 downto 0);
    signal do_high_876 : std_logic_vector(0 downto 0);
    signal do_high_905_delayed_8_0_883 : std_logic_vector(0 downto 0);
    signal do_low_893 : std_logic_vector(0 downto 0);
    signal do_low_919_delayed_8_0_900 : std_logic_vector(0 downto 0);
    signal error_response_909 : std_logic_vector(32 downto 0);
    signal final_response_930 : std_logic_vector(32 downto 0);
    signal high_response_887 : std_logic_vector(32 downto 0);
    signal is_error_870 : std_logic_vector(0 downto 0);
    signal is_error_929_delayed_9_0_912 : std_logic_vector(0 downto 0);
    signal is_high_addr_856 : std_logic_vector(0 downto 0);
    signal is_high_addr_931_delayed_9_0_915 : std_logic_vector(0 downto 0);
    signal is_low_addr_865 : std_logic_vector(0 downto 0);
    signal is_low_addr_933_delayed_9_0_918 : std_logic_vector(0 downto 0);
    signal konst_926_wire_constant : std_logic_vector(32 downto 0);
    signal konst_935_wire_constant : std_logic_vector(0 downto 0);
    signal lock_flag_825 : std_logic_vector(0 downto 0);
    signal low_response_904 : std_logic_vector(32 downto 0);
    signal read_write_bar_829 : std_logic_vector(0 downto 0);
    signal wdata_32_841 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    error_response_909 <= "100000000000000000000000000000000";
    konst_926_wire_constant <= "000000000000000000000000000000000";
    konst_935_wire_constant <= "1";
    -- flow-through select operator MUX_927_inst
    MUX_927_wire <= low_response_904 when (is_low_addr_933_delayed_9_0_918(0) /=  '0') else konst_926_wire_constant;
    -- flow-through select operator MUX_928_inst
    MUX_928_wire <= high_response_887 when (is_high_addr_931_delayed_9_0_915(0) /=  '0') else MUX_927_wire;
    -- flow-through select operator MUX_929_inst
    final_response_930 <= error_response_909 when (is_error_929_delayed_9_0_912(0) /=  '0') else MUX_928_wire;
    -- flow-through slice operator slice_824_inst
    lock_flag_825 <= command_821(73 downto 73);
    -- flow-through slice operator slice_828_inst
    read_write_bar_829 <= command_821(72 downto 72);
    -- flow-through slice operator slice_832_inst
    byte_mask_833 <= command_821(71 downto 68);
    -- flow-through slice operator slice_836_inst
    addr36_837 <= command_821(67 downto 32);
    -- flow-through slice operator slice_840_inst
    wdata_32_841 <= command_821(31 downto 0);
    W_do_high_905_delayed_8_0_881_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_do_high_905_delayed_8_0_881_inst_req_0;
      W_do_high_905_delayed_8_0_881_inst_ack_0<= wack(0);
      rreq(0) <= W_do_high_905_delayed_8_0_881_inst_req_1;
      W_do_high_905_delayed_8_0_881_inst_ack_1<= rack(0);
      W_do_high_905_delayed_8_0_881_inst : InterlockBuffer generic map ( -- 
        name => "W_do_high_905_delayed_8_0_881_inst",
        buffer_size => 8,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => do_high_876,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => do_high_905_delayed_8_0_883,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_do_low_919_delayed_8_0_898_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_do_low_919_delayed_8_0_898_inst_req_0;
      W_do_low_919_delayed_8_0_898_inst_ack_0<= wack(0);
      rreq(0) <= W_do_low_919_delayed_8_0_898_inst_req_1;
      W_do_low_919_delayed_8_0_898_inst_ack_1<= rack(0);
      W_do_low_919_delayed_8_0_898_inst : InterlockBuffer generic map ( -- 
        name => "W_do_low_919_delayed_8_0_898_inst",
        buffer_size => 8,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => do_low_893,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => do_low_919_delayed_8_0_900,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_is_error_929_delayed_9_0_910_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_is_error_929_delayed_9_0_910_inst_req_0;
      W_is_error_929_delayed_9_0_910_inst_ack_0<= wack(0);
      rreq(0) <= W_is_error_929_delayed_9_0_910_inst_req_1;
      W_is_error_929_delayed_9_0_910_inst_ack_1<= rack(0);
      W_is_error_929_delayed_9_0_910_inst : InterlockBuffer generic map ( -- 
        name => "W_is_error_929_delayed_9_0_910_inst",
        buffer_size => 9,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => is_error_870,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => is_error_929_delayed_9_0_912,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_is_high_addr_931_delayed_9_0_913_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_is_high_addr_931_delayed_9_0_913_inst_req_0;
      W_is_high_addr_931_delayed_9_0_913_inst_ack_0<= wack(0);
      rreq(0) <= W_is_high_addr_931_delayed_9_0_913_inst_req_1;
      W_is_high_addr_931_delayed_9_0_913_inst_ack_1<= rack(0);
      W_is_high_addr_931_delayed_9_0_913_inst : InterlockBuffer generic map ( -- 
        name => "W_is_high_addr_931_delayed_9_0_913_inst",
        buffer_size => 9,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => is_high_addr_856,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => is_high_addr_931_delayed_9_0_915,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_is_low_addr_933_delayed_9_0_916_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_is_low_addr_933_delayed_9_0_916_inst_req_0;
      W_is_low_addr_933_delayed_9_0_916_inst_ack_0<= wack(0);
      rreq(0) <= W_is_low_addr_933_delayed_9_0_916_inst_req_1;
      W_is_low_addr_933_delayed_9_0_916_inst_ack_1<= rack(0);
      W_is_low_addr_933_delayed_9_0_916_inst : InterlockBuffer generic map ( -- 
        name => "W_is_low_addr_933_delayed_9_0_916_inst",
        buffer_size => 9,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => is_low_addr_865,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => is_low_addr_933_delayed_9_0_918,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    do_while_stmt_817_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_935_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_817_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_817_branch_req_0,
          ack0 => do_while_stmt_817_branch_ack_0,
          ack1 => do_while_stmt_817_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator AND_u1_u1_855_inst
    process(UGE_u36_u1_851_wire, ULE_u36_u1_854_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(UGE_u36_u1_851_wire, ULE_u36_u1_854_wire, tmp_var);
      is_high_addr_856 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_864_inst
    process(UGE_u36_u1_860_wire, ULE_u36_u1_863_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(UGE_u36_u1_860_wire, ULE_u36_u1_863_wire, tmp_var);
      is_low_addr_865 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_875_inst
    process(is_high_addr_856, NOT_u1_u1_874_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(is_high_addr_856, NOT_u1_u1_874_wire, tmp_var);
      do_high_876 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_892_inst
    process(is_low_addr_865, NOT_u1_u1_891_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(is_low_addr_865, NOT_u1_u1_891_wire, tmp_var);
      do_low_893 <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_869_inst
    process(is_high_addr_856, is_low_addr_865) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(is_high_addr_856, is_low_addr_865, tmp_var);
      is_error_870 <= tmp_var; --
    end process;
    -- unary operator NOT_u1_u1_874_inst
    process(is_error_870) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", is_error_870, tmp_var);
      NOT_u1_u1_874_wire <= tmp_var; -- 
    end process;
    -- unary operator NOT_u1_u1_891_inst
    process(is_error_870) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", is_error_870, tmp_var);
      NOT_u1_u1_891_wire <= tmp_var; -- 
    end process;
    -- binary operator UGE_u36_u1_851_inst
    process(addr36_837, RPIPE_MIN_ADDR_HIGH_ADDR_SPACE_850_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUge_proc(addr36_837, RPIPE_MIN_ADDR_HIGH_ADDR_SPACE_850_wire, tmp_var);
      UGE_u36_u1_851_wire <= tmp_var; --
    end process;
    -- binary operator UGE_u36_u1_860_inst
    process(addr36_837, RPIPE_MIN_ADDR_LOW_ADDR_SPACE_859_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUge_proc(addr36_837, RPIPE_MIN_ADDR_LOW_ADDR_SPACE_859_wire, tmp_var);
      UGE_u36_u1_860_wire <= tmp_var; --
    end process;
    -- binary operator ULE_u36_u1_854_inst
    process(addr36_837, RPIPE_MAX_ADDR_HIGH_ADDR_SPACE_853_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUle_proc(addr36_837, RPIPE_MAX_ADDR_HIGH_ADDR_SPACE_853_wire, tmp_var);
      ULE_u36_u1_854_wire <= tmp_var; --
    end process;
    -- binary operator ULE_u36_u1_863_inst
    process(addr36_837, RPIPE_MAX_ADDR_LOW_ADDR_SPACE_862_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUle_proc(addr36_837, RPIPE_MAX_ADDR_LOW_ADDR_SPACE_862_wire, tmp_var);
      ULE_u36_u1_863_wire <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_AFB_HIGH_RESPONSE_886_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(32 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_HIGH_RESPONSE_886_inst_req_0;
      RPIPE_AFB_HIGH_RESPONSE_886_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_HIGH_RESPONSE_886_inst_req_1;
      RPIPE_AFB_HIGH_RESPONSE_886_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= do_high_905_delayed_8_0_883(0);
      high_response_887 <= data_out(32 downto 0);
      AFB_HIGH_RESPONSE_read_0_gI: SplitGuardInterface generic map(name => "AFB_HIGH_RESPONSE_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_HIGH_RESPONSE_read_0: InputPort_P2P -- 
        generic map ( name => "AFB_HIGH_RESPONSE_read_0", data_width => 33,    bypass_flag => false,   	nonblocking_read_flag => false,  barrier_flag => false,   queue_depth =>  2)
        port map (-- 
          sample_req => reqL(0) , 
          sample_ack => ackL(0), 
          update_req => reqR(0), 
          update_ack => ackR(0), 
          data => data_out, 
          oreq => AFB_HIGH_RESPONSE_pipe_read_req(0),
          oack => AFB_HIGH_RESPONSE_pipe_read_ack(0),
          odata => AFB_HIGH_RESPONSE_pipe_read_data(32 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared inport operator group (1) : RPIPE_AFB_LOW_RESPONSE_903_inst 
    InportGroup_1: Block -- 
      signal data_out: std_logic_vector(32 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_LOW_RESPONSE_903_inst_req_0;
      RPIPE_AFB_LOW_RESPONSE_903_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_LOW_RESPONSE_903_inst_req_1;
      RPIPE_AFB_LOW_RESPONSE_903_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= do_low_919_delayed_8_0_900(0);
      low_response_904 <= data_out(32 downto 0);
      AFB_LOW_RESPONSE_read_1_gI: SplitGuardInterface generic map(name => "AFB_LOW_RESPONSE_read_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_LOW_RESPONSE_read_1: InputPort_P2P -- 
        generic map ( name => "AFB_LOW_RESPONSE_read_1", data_width => 33,    bypass_flag => false,   	nonblocking_read_flag => false,  barrier_flag => false,   queue_depth =>  2)
        port map (-- 
          sample_req => reqL(0) , 
          sample_ack => ackL(0), 
          update_req => reqR(0), 
          update_ack => ackR(0), 
          data => data_out, 
          oreq => AFB_LOW_RESPONSE_pipe_read_req(0),
          oack => AFB_LOW_RESPONSE_pipe_read_ack(0),
          odata => AFB_LOW_RESPONSE_pipe_read_data(32 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 1
    -- shared inport operator group (2) : RPIPE_AFB_SPLITTER_REQUEST_820_inst 
    InportGroup_2: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_SPLITTER_REQUEST_820_inst_req_0;
      RPIPE_AFB_SPLITTER_REQUEST_820_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_SPLITTER_REQUEST_820_inst_req_1;
      RPIPE_AFB_SPLITTER_REQUEST_820_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      command_821 <= data_out(73 downto 0);
      AFB_SPLITTER_REQUEST_read_2_gI: SplitGuardInterface generic map(name => "AFB_SPLITTER_REQUEST_read_2_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_SPLITTER_REQUEST_read_2: InputPort_P2P -- 
        generic map ( name => "AFB_SPLITTER_REQUEST_read_2", data_width => 74,    bypass_flag => false,   	nonblocking_read_flag => false,  barrier_flag => false,   queue_depth =>  2)
        port map (-- 
          sample_req => reqL(0) , 
          sample_ack => ackL(0), 
          update_req => reqR(0), 
          update_ack => ackR(0), 
          data => data_out, 
          oreq => AFB_SPLITTER_REQUEST_pipe_read_req(0),
          oack => AFB_SPLITTER_REQUEST_pipe_read_ack(0),
          odata => AFB_SPLITTER_REQUEST_pipe_read_data(73 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 2
    -- read from input-signal MAX_ADDR_HIGH_ADDR_SPACE
    RPIPE_MAX_ADDR_HIGH_ADDR_SPACE_853_wire <= MAX_ADDR_HIGH_ADDR_SPACE;
    -- read from input-signal MAX_ADDR_LOW_ADDR_SPACE
    RPIPE_MAX_ADDR_LOW_ADDR_SPACE_862_wire <= MAX_ADDR_LOW_ADDR_SPACE;
    -- read from input-signal MIN_ADDR_HIGH_ADDR_SPACE
    RPIPE_MIN_ADDR_HIGH_ADDR_SPACE_850_wire <= MIN_ADDR_HIGH_ADDR_SPACE;
    -- read from input-signal MIN_ADDR_LOW_ADDR_SPACE
    RPIPE_MIN_ADDR_LOW_ADDR_SPACE_859_wire <= MIN_ADDR_LOW_ADDR_SPACE;
    -- shared outport operator group (0) : WPIPE_AFB_HIGH_REQUEST_878_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(73 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_HIGH_REQUEST_878_inst_req_0;
      WPIPE_AFB_HIGH_REQUEST_878_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_HIGH_REQUEST_878_inst_req_1;
      WPIPE_AFB_HIGH_REQUEST_878_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= do_high_876(0);
      data_in <= command_821;
      AFB_HIGH_REQUEST_write_0_gI: SplitGuardInterface generic map(name => "AFB_HIGH_REQUEST_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_HIGH_REQUEST_write_0: OutputPortRevised -- 
        generic map ( name => "AFB_HIGH_REQUEST", data_width => 74, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_HIGH_REQUEST_pipe_write_req(0),
          oack => AFB_HIGH_REQUEST_pipe_write_ack(0),
          odata => AFB_HIGH_REQUEST_pipe_write_data(73 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared outport operator group (1) : WPIPE_AFB_LOW_REQUEST_895_inst 
    OutportGroup_1: Block -- 
      signal data_in: std_logic_vector(73 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_LOW_REQUEST_895_inst_req_0;
      WPIPE_AFB_LOW_REQUEST_895_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_LOW_REQUEST_895_inst_req_1;
      WPIPE_AFB_LOW_REQUEST_895_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= do_low_893(0);
      data_in <= command_821;
      AFB_LOW_REQUEST_write_1_gI: SplitGuardInterface generic map(name => "AFB_LOW_REQUEST_write_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_LOW_REQUEST_write_1: OutputPortRevised -- 
        generic map ( name => "AFB_LOW_REQUEST", data_width => 74, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_LOW_REQUEST_pipe_write_req(0),
          oack => AFB_LOW_REQUEST_pipe_write_ack(0),
          odata => AFB_LOW_REQUEST_pipe_write_data(73 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
    -- shared outport operator group (2) : WPIPE_AFB_SPLITTER_RESPONSE_931_inst 
    OutportGroup_2: Block -- 
      signal data_in: std_logic_vector(32 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_SPLITTER_RESPONSE_931_inst_req_0;
      WPIPE_AFB_SPLITTER_RESPONSE_931_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_SPLITTER_RESPONSE_931_inst_req_1;
      WPIPE_AFB_SPLITTER_RESPONSE_931_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= final_response_930;
      AFB_SPLITTER_RESPONSE_write_2_gI: SplitGuardInterface generic map(name => "AFB_SPLITTER_RESPONSE_write_2_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_SPLITTER_RESPONSE_write_2: OutputPortRevised -- 
        generic map ( name => "AFB_SPLITTER_RESPONSE", data_width => 33, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_SPLITTER_RESPONSE_pipe_write_req(0),
          oack => AFB_SPLITTER_RESPONSE_pipe_write_ack(0),
          odata => AFB_SPLITTER_RESPONSE_pipe_write_data(32 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 2
    -- 
  end Block; -- data_path
  -- 
end afb_splitter_daemon_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_splitter_global_package.all;
entity afb_splitter is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_HIGH_REQUEST_pipe_read_data: out std_logic_vector(73 downto 0);
    AFB_HIGH_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_HIGH_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
    AFB_HIGH_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
    AFB_HIGH_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_HIGH_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_LOW_REQUEST_pipe_read_data: out std_logic_vector(73 downto 0);
    AFB_LOW_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_LOW_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
    AFB_LOW_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
    AFB_LOW_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_LOW_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_SPLITTER_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_SPLITTER_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_SPLITTER_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_SPLITTER_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_SPLITTER_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_SPLITTER_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    MAX_ADDR_HIGH_ADDR_SPACE: in std_logic_vector(35 downto 0);
    MAX_ADDR_LOW_ADDR_SPACE: in std_logic_vector(35 downto 0);
    MIN_ADDR_HIGH_ADDR_SPACE: in std_logic_vector(35 downto 0);
    MIN_ADDR_LOW_ADDR_SPACE: in std_logic_vector(35 downto 0)); -- 
  -- 
end entity; 
architecture afb_splitter_arch  of afb_splitter is -- system-architecture 
  -- interface signals to connect to memory space memory_space_1
  -- declarations related to module afb_splitter_daemon
  component afb_splitter_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      AFB_SPLITTER_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_SPLITTER_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_SPLITTER_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
      AFB_HIGH_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_HIGH_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_HIGH_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
      AFB_LOW_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_LOW_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_LOW_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
      MAX_ADDR_HIGH_ADDR_SPACE : in std_logic_vector(35 downto 0);
      MAX_ADDR_LOW_ADDR_SPACE : in std_logic_vector(35 downto 0);
      MIN_ADDR_HIGH_ADDR_SPACE : in std_logic_vector(35 downto 0);
      MIN_ADDR_LOW_ADDR_SPACE : in std_logic_vector(35 downto 0);
      AFB_HIGH_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_HIGH_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_HIGH_REQUEST_pipe_write_data : out  std_logic_vector(73 downto 0);
      AFB_SPLITTER_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_SPLITTER_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_SPLITTER_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
      AFB_LOW_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_LOW_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_LOW_REQUEST_pipe_write_data : out  std_logic_vector(73 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module afb_splitter_daemon
  signal afb_splitter_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal afb_splitter_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal afb_splitter_daemon_start_req : std_logic;
  signal afb_splitter_daemon_start_ack : std_logic;
  signal afb_splitter_daemon_fin_req   : std_logic;
  signal afb_splitter_daemon_fin_ack : std_logic;
  -- aggregate signals for write to pipe AFB_HIGH_REQUEST
  signal AFB_HIGH_REQUEST_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_HIGH_REQUEST_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_HIGH_REQUEST_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe AFB_HIGH_RESPONSE
  signal AFB_HIGH_RESPONSE_pipe_read_data: std_logic_vector(32 downto 0);
  signal AFB_HIGH_RESPONSE_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_HIGH_RESPONSE_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe AFB_LOW_REQUEST
  signal AFB_LOW_REQUEST_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_LOW_REQUEST_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_LOW_REQUEST_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe AFB_LOW_RESPONSE
  signal AFB_LOW_RESPONSE_pipe_read_data: std_logic_vector(32 downto 0);
  signal AFB_LOW_RESPONSE_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_LOW_RESPONSE_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe AFB_SPLITTER_REQUEST
  signal AFB_SPLITTER_REQUEST_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_SPLITTER_REQUEST_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_SPLITTER_REQUEST_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe AFB_SPLITTER_RESPONSE
  signal AFB_SPLITTER_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_SPLITTER_RESPONSE_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_SPLITTER_RESPONSE_pipe_write_ack: std_logic_vector(0 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module afb_splitter_daemon
  afb_splitter_daemon_instance:afb_splitter_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => afb_splitter_daemon_start_req,
      start_ack => afb_splitter_daemon_start_ack,
      fin_req => afb_splitter_daemon_fin_req,
      fin_ack => afb_splitter_daemon_fin_ack,
      clk => clk,
      reset => reset,
      AFB_SPLITTER_REQUEST_pipe_read_req => AFB_SPLITTER_REQUEST_pipe_read_req(0 downto 0),
      AFB_SPLITTER_REQUEST_pipe_read_ack => AFB_SPLITTER_REQUEST_pipe_read_ack(0 downto 0),
      AFB_SPLITTER_REQUEST_pipe_read_data => AFB_SPLITTER_REQUEST_pipe_read_data(73 downto 0),
      AFB_HIGH_RESPONSE_pipe_read_req => AFB_HIGH_RESPONSE_pipe_read_req(0 downto 0),
      AFB_HIGH_RESPONSE_pipe_read_ack => AFB_HIGH_RESPONSE_pipe_read_ack(0 downto 0),
      AFB_HIGH_RESPONSE_pipe_read_data => AFB_HIGH_RESPONSE_pipe_read_data(32 downto 0),
      AFB_LOW_RESPONSE_pipe_read_req => AFB_LOW_RESPONSE_pipe_read_req(0 downto 0),
      AFB_LOW_RESPONSE_pipe_read_ack => AFB_LOW_RESPONSE_pipe_read_ack(0 downto 0),
      AFB_LOW_RESPONSE_pipe_read_data => AFB_LOW_RESPONSE_pipe_read_data(32 downto 0),
      MAX_ADDR_HIGH_ADDR_SPACE => MAX_ADDR_HIGH_ADDR_SPACE,
      MAX_ADDR_LOW_ADDR_SPACE => MAX_ADDR_LOW_ADDR_SPACE,
      MIN_ADDR_HIGH_ADDR_SPACE => MIN_ADDR_HIGH_ADDR_SPACE,
      MIN_ADDR_LOW_ADDR_SPACE => MIN_ADDR_LOW_ADDR_SPACE,
      AFB_HIGH_REQUEST_pipe_write_req => AFB_HIGH_REQUEST_pipe_write_req(0 downto 0),
      AFB_HIGH_REQUEST_pipe_write_ack => AFB_HIGH_REQUEST_pipe_write_ack(0 downto 0),
      AFB_HIGH_REQUEST_pipe_write_data => AFB_HIGH_REQUEST_pipe_write_data(73 downto 0),
      AFB_SPLITTER_RESPONSE_pipe_write_req => AFB_SPLITTER_RESPONSE_pipe_write_req(0 downto 0),
      AFB_SPLITTER_RESPONSE_pipe_write_ack => AFB_SPLITTER_RESPONSE_pipe_write_ack(0 downto 0),
      AFB_SPLITTER_RESPONSE_pipe_write_data => AFB_SPLITTER_RESPONSE_pipe_write_data(32 downto 0),
      AFB_LOW_REQUEST_pipe_write_req => AFB_LOW_REQUEST_pipe_write_req(0 downto 0),
      AFB_LOW_REQUEST_pipe_write_ack => AFB_LOW_REQUEST_pipe_write_ack(0 downto 0),
      AFB_LOW_REQUEST_pipe_write_data => AFB_LOW_REQUEST_pipe_write_data(73 downto 0),
      tag_in => afb_splitter_daemon_tag_in,
      tag_out => afb_splitter_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  afb_splitter_daemon_tag_in <= (others => '0');
  afb_splitter_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => afb_splitter_daemon_start_req, start_ack => afb_splitter_daemon_start_ack,  fin_req => afb_splitter_daemon_fin_req,  fin_ack => afb_splitter_daemon_fin_ack);
  AFB_HIGH_REQUEST_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_HIGH_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_HIGH_REQUEST_pipe_read_req,
      read_ack => AFB_HIGH_REQUEST_pipe_read_ack,
      read_data => AFB_HIGH_REQUEST_pipe_read_data,
      write_req => AFB_HIGH_REQUEST_pipe_write_req,
      write_ack => AFB_HIGH_REQUEST_pipe_write_ack,
      write_data => AFB_HIGH_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_HIGH_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_HIGH_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_HIGH_RESPONSE_pipe_read_req,
      read_ack => AFB_HIGH_RESPONSE_pipe_read_ack,
      read_data => AFB_HIGH_RESPONSE_pipe_read_data,
      write_req => AFB_HIGH_RESPONSE_pipe_write_req,
      write_ack => AFB_HIGH_RESPONSE_pipe_write_ack,
      write_data => AFB_HIGH_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_LOW_REQUEST_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_LOW_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_LOW_REQUEST_pipe_read_req,
      read_ack => AFB_LOW_REQUEST_pipe_read_ack,
      read_data => AFB_LOW_REQUEST_pipe_read_data,
      write_req => AFB_LOW_REQUEST_pipe_write_req,
      write_ack => AFB_LOW_REQUEST_pipe_write_ack,
      write_data => AFB_LOW_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_LOW_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_LOW_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_LOW_RESPONSE_pipe_read_req,
      read_ack => AFB_LOW_RESPONSE_pipe_read_ack,
      read_data => AFB_LOW_RESPONSE_pipe_read_data,
      write_req => AFB_LOW_RESPONSE_pipe_write_req,
      write_ack => AFB_LOW_RESPONSE_pipe_write_ack,
      write_data => AFB_LOW_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_SPLITTER_REQUEST_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_SPLITTER_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_SPLITTER_REQUEST_pipe_read_req,
      read_ack => AFB_SPLITTER_REQUEST_pipe_read_ack,
      read_data => AFB_SPLITTER_REQUEST_pipe_read_data,
      write_req => AFB_SPLITTER_REQUEST_pipe_write_req,
      write_ack => AFB_SPLITTER_REQUEST_pipe_write_ack,
      write_data => AFB_SPLITTER_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_SPLITTER_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_SPLITTER_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_SPLITTER_RESPONSE_pipe_read_req,
      read_ack => AFB_SPLITTER_RESPONSE_pipe_read_ack,
      read_data => AFB_SPLITTER_RESPONSE_pipe_read_data,
      write_req => AFB_SPLITTER_RESPONSE_pipe_write_req,
      write_ack => AFB_SPLITTER_RESPONSE_pipe_write_ack,
      write_data => AFB_SPLITTER_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- input signal-pipe MAX_ADDR_HIGH_ADDR_SPACE accessed directly. 
  -- input signal-pipe MAX_ADDR_LOW_ADDR_SPACE accessed directly. 
  -- input signal-pipe MIN_ADDR_HIGH_ADDR_SPACE accessed directly. 
  -- input signal-pipe MIN_ADDR_LOW_ADDR_SPACE accessed directly. 
  -- gated clock generators 
  -- 
end afb_splitter_arch;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.utilities.all;

entity ahb_sram_stub is -- 
    generic (addr_width: integer := 8);
    port( -- 
      HADDR : in std_logic_vector(35 downto 0);
      HMASTLOCK : in std_logic_vector(0 downto 0); -- ignored
      HPROT : in std_logic_vector(3 downto 0);  -- ignored
      HBURST : in std_logic_vector(2 downto 0);  -- ignored
      HSIZE : in std_logic_vector(2 downto 0);	-- not ignored... byte masking for writes..
      HTRANS : in std_logic_vector(1 downto 0); -- should be NONSEQ or SEQ to indicate transfer
      HWDATA : in std_logic_vector(31 downto 0); 
      HWRITE : in std_logic_vector(0 downto 0); -- "1" implies write
      HRDATA : out std_logic_vector(31 downto 0); 
      HREADY : out std_logic_vector(0 downto 0); -- always "1".
      HRESP : out std_logic_vector(1 downto 0); -- always "00"
      SYS_CLK : in std_logic_vector(0 downto 0); -- work on this clock.
      clk, reset: in std_logic 
      -- 
    );
    --
end entity;


--
-- a simple interface.. serves single/burst requests..
--   it is assumed that the host never goes into a busy cycle.
--
architecture Mixed of ahb_sram_stub is
	
	constant SLAVE_RESPONSE_OK   : std_logic_vector(1 downto 0)  := "00"; -- OK
	constant SLAVE_RESPONSE_ERROR   : std_logic_vector(1 downto 0)  := "01"; -- Error

	signal datain, dataout, dataout_reg, HRDATA_SIG : std_logic_vector(31 downto 0);
	signal addrin, addr_reg: std_logic_vector(addr_width-1 downto 0);
	signal enable, writebar : std_logic; 
	signal bb_enables: std_logic_vector(3 downto 0);

	signal SCLK : std_logic;

	type FsmState is (IdleState, WriteState, ReadWaitState);
	signal fsm_state : FsmState;

	signal address_overflow: std_logic;

	constant HTRANS_IDLE : std_logic_vector(1 downto 0) := "00";
        constant HTRANS_BUSY : std_logic_vector(1 downto 0) := "01";
        constant HTRANS_NONSEQ : std_logic_vector(1 downto 0) := "10";
        constant HTRANS_SEQ : std_logic_vector(1 downto 0) := "11";


        constant ZREST : std_logic_vector (35 downto addr_width) := (others => '0');
        constant ALLONES_32 : std_logic_vector (31 downto 0) := (others => '1');

	signal access_size, HSIZE_reg: std_logic_vector(2 downto 0);	
	signal byte_offset: std_logic_vector(1 downto 0);


	signal address_greater_than_max: std_logic;
	signal enable_reg: std_logic;

begin 
	SCLK <= SYS_CLK(0);

	-- HRDATA <= dataout when enable_reg <= '1' else (others => '0');
	HRDATA <= dataout;

	address_greater_than_max <= '1' when  (HADDR (35 downto addr_width) /= ZREST) else '0';


	process(SCLK, reset, fsm_state, HTRANS, HWRITE, HADDR, HWDATA, HSIZE, address_greater_than_max)
		variable next_fsm_state_var: FsmState;
		variable enable_var, writebar_var: std_logic;
		variable next_addr_reg_var, addr_var : std_logic_vector(addr_width-1 downto 0);
		variable hready_var: std_logic;
		variable next_hresp_var : std_logic_vector(1 downto 0);
		variable next_address_overflow_var: std_logic;
		variable access_size_var, next_HSIZE_reg_var : std_logic_vector(2 downto 0);
	begin
		next_addr_reg_var := addr_reg;
		next_fsm_state_var := fsm_state;
		enable_var := '0';
		hready_var := '0';
		next_hresp_var  := SLAVE_RESPONSE_OK;
		next_address_overflow_var := '0';
		access_size_var := "010"; -- word-access.
		next_HSIZE_reg_var := HSIZE_reg; -- word-access.
		addr_var := (others => '0');
		writebar_var := '1';

		case fsm_state is
			when IdleState =>
				hready_var := '1';
				if((HTRANS = HTRANS_NONSEQ)  or (HTRANS = HTRANS_SEQ)) then
					next_addr_reg_var  := HADDR(addr_width-1 downto 0);
					next_HSIZE_reg_var := HSIZE;
					access_size_var := HSIZE;

					if(HWRITE(0) = '1') then
						-- latch the address and serve the write.
						-- The data for the write arrives in the next
						-- cycle (as per AHB-lite specification).
						next_fsm_state_var := WriteState;
					else 
						-- no need to latch the address, serve
						-- the read.
						addr_var :=  HADDR(addr_width-1 downto 0);
						enable_var := '1';
				
						-- out of range read, do not do the write.
						if(address_greater_than_max = '1') then
							next_address_overflow_var := '1';
						end if;

					end if;
				end if;
			when WriteState =>

				enable_var := '1'; -- if address overflows, wrap around!
				writebar_var := '0';
				hready_var := '1';

				-- address arrived in the previous cycle..
				addr_var := addr_reg;
				-- arrived in the previous cycle..
				access_size_var := HSIZE_reg;
				
				---------------------------------------------------------
				-- data is expected now (see assignment to data below)
				---------------------------------------------------------

				if((HTRANS = HTRANS_NONSEQ)  or (HTRANS = HTRANS_SEQ)) then

					-- new transfer may be available..
					next_addr_reg_var  := HADDR(addr_width-1 downto 0);
					next_HSIZE_reg_var := HSIZE;

					if(address_greater_than_max = '1') then 
						next_address_overflow_var := '1';
					end if;
					if(HWRITE(0) = '1') then
						-- latch the address and serve the write.
						next_fsm_state_var := WriteState;
					else 
						next_fsm_state_var := ReadWaitState;
					end if;
				else
					next_fsm_state_var := IdleState;
				end if;
			when ReadWaitState =>
				hready_var := '0'; -- wait.
				addr_var := addr_reg;
				access_size_var := HSIZE_reg;
				enable_var := '1';
				next_fsm_state_var := IdleState;
		end case;

		addrin <= addr_var;
		enable <= enable_var;
		writebar <= writebar_var;

		-- As per AHB-lite specification..
		-- write is initiated in the next cycle
		-- after the request is made.
		datain <= HWDATA;

		HREADY(0) <= hready_var;
		access_size <= access_size_var;
		
		if(SCLK'event and SCLK = '1') then
			if(reset = '1') then
				fsm_state <= IdleState;
				addr_reg <= (others => '0');
				HRESP <= SLAVE_RESPONSE_OK;
				address_overflow <= '0';
				HSIZE_reg <= "010";
				enable_reg <= '0';
			else
				fsm_state <= next_fsm_state_var;
				addr_reg <= next_addr_reg_var;
				HRESP <= next_hresp_var;
				address_overflow <= next_address_overflow_var;
				HSIZE_reg <= next_HSIZE_reg_var;
				enable_reg <= enable_var;
			end if;
		end if;
	end process;

	byte_offset <= addrin ( 1 downto 0);

	-- least-significant byte.
	bb_enables(0) <= enable when 
				(writebar = '1') 
					or
				(((byte_offset = "11")  and (access_size = "000"))
					or
				 ((byte_offset = "10")  and (access_size = "001"))
					or
				 ((byte_offset = "00")  and (access_size = "010")))
				else '0';

	bb_enables(1) <= enable when 
				(writebar = '1') 
					or
				(((byte_offset = "10")  and ((access_size = "000") or (access_size = "001")))
					or
				 (access_size = "010"))
				else '0';
	bb_enables(2) <= enable when 
				(writebar = '1') 
					or
				(((byte_offset = "01")  and (access_size = "000"))
					or
				 ((byte_offset = "00")  and (access_size = "001"))
					or
				 (access_size = "010"))
				else '0';

	-- most significant byte.
	bb_enables(3) <= enable when (writebar = '1') or (byte_offset = "00") or (access_size = "010") else '0';


	-- 4 banks.
	bbGen: for B in 0 to 3 generate 

	   bb: base_bank 
		generic map (name => "SRAM-STUB-BASE-BANK-" & Convert_To_String(B), 
						g_addr_width => addr_width-2, 
								g_data_width => 8)
		port map (
				datain => datain ((8*(B+1))-1 downto 8*B),
				dataout => dataout((8*(B+1))-1 downto 8*B),
				addrin => addrin(addr_width-1 downto 2),
				enable => bb_enables(B),
				writebar => writebar,
				clk => SCLK,
				reset => reset);
       end generate bbGen;

end Mixed;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.utilities.all;

-- 32-bit  apb memory... 
entity apb_sram_stub is -- 
    generic (addr_width: integer := 16; number_of_wait_states: integer := 2);
    port( -- 
      PADDR   : in std_logic_vector(31 downto 0);
      PWDATA  : in std_logic_vector(31 downto 0); 
      PWRITE  : in std_logic_vector(0 downto 0); -- "1" implies write
      PENABLE : in std_logic_vector(0 downto 0); -- always "1".
      PSEL    : in std_logic_vector(0 downto 0); -- always "1".
      PRDATA  : out std_logic_vector(31 downto 0); 
      PREADY  : out std_logic_vector(0 downto 0); -- always "1".
      PSLVERR : out std_logic_vector(0 downto 0); -- always "00"
      PCLK    : in std_logic_vector(0 downto 0); -- work on this clock.
      PRESETn : in std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
end entity;


--
-- a simple interface.. serves single/burst requests..
--   it is assumed that the host never goes into a busy cycle.
--
architecture Mixed of apb_sram_stub is
	
	signal datain, dataout, dataout_reg, HRDATA_SIG : std_logic_vector(31 downto 0);
	signal addrin: std_logic_vector(addr_width-1 downto 0);
	signal enable, writebar : std_logic; 

	type FsmState is (IdleState, WaitState, AccessState, DoneState);
	signal fsm_state : FsmState;
	signal wait_counter: integer range 0 to number_of_wait_states;

	signal SCLK : std_logic;
	signal PRESET, pslverr_reg: std_logic;
begin 
	SCLK <= PCLK(0);
	PRESET <= not PRESETn(0);

	PRDATA <= dataout;
	PSLVERR(0) <= pslverr_reg;

	process(SCLK, PRESET, PSEL,
			fsm_state, PWRITE, PADDR, PWDATA, PENABLE)
		variable next_fsm_state_var: FsmState;
		variable enable_var, writebar_var: std_logic;
		variable addr_var : std_logic_vector(addr_width-1 downto 0);
		variable pready_var: std_logic;
		variable next_wait_counter_var : integer range 0 to number_of_wait_states;
		variable next_pslverr_var: std_logic;
	begin
		next_fsm_state_var := fsm_state;
		enable_var := '0';
		pready_var := '0';
		writebar_var := '1';
		next_wait_counter_var := wait_counter;
		addr_var :=  PADDR(addr_width-1 downto 0);
		next_pslverr_var := pslverr_reg;

		case fsm_state is
			when IdleState =>
				if(PSEL(0) = '1') then
					next_pslverr_var := '0';

					if(next_wait_counter_var = 0) then 
						next_fsm_state_var := AccessState;
					else
						next_fsm_state_var := WaitState;
					end if;
				end if;
			when WaitState =>
				if(PENABLE(0) = '0') then
					next_pslverr_var := '1';
				end if;

				if(next_wait_counter_var = 0) then
					next_fsm_state_var := AccessState;
				else
					next_wait_counter_var := next_wait_counter_var - 1;
				end if;
			when AccessState =>
				if(PENABLE(0) = '0') then
					next_pslverr_var := '1';
				end if;

				enable_var := '1';
				writebar_var := not PWRITE(0);
				next_fsm_state_var := DoneState;
			when DoneState => 
				if(PENABLE(0) = '0') then
					next_pslverr_var := '1';
				end if;

				pready_var := '1';
				next_fsm_state_var := IdleState;
		
		end case;

		-- to take care of the clock...
		addrin <= addr_var after 1 ns;
		enable <= enable_var after 1 ns;
		writebar <= writebar_var after 1 ns;
		datain <= PWDATA after 1 ns;
		PREADY(0) <= pready_var after 1 ns;
		
		if(SCLK'event and SCLK = '1') then
			if(PRESET = '1') then
				fsm_state <= IdleState;
				wait_counter <= number_of_wait_states;
				pslverr_reg <= '0';
			else
				fsm_state <= next_fsm_state_var;
				wait_counter <= next_wait_counter_var;
				pslverr_reg <= next_pslverr_var;
			end if;
		end if;
	end process;

	bb: base_bank 
		generic map (name => "APB-SRAM-BB",
				g_addr_width => addr_width-2, 
				g_data_width => 32)
		port map (
				datain => datain,
				dataout => dataout,
				addrin => addrin(addr_width-1 downto 2),
				enable => enable,
				writebar => writebar,
				clk => SCLK,
				reset => PRESET);

end Mixed;
-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package afb_spi_bridge_global_package is -- 
  constant default_mem_pool_base_address : std_logic_vector(0 downto 0) := "0";
  component afb_spi_bridge is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      AFB_SPI_MASTER_COMMAND_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_SPI_MASTER_COMMAND_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_SPI_MASTER_COMMAND_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_SPI_MASTER_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_SPI_MASTER_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_SPI_MASTER_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      master_in_data_pipe_read_data: out std_logic_vector(15 downto 0);
      master_in_data_pipe_read_req : in std_logic_vector(0 downto 0);
      master_in_data_pipe_read_ack : out std_logic_vector(0 downto 0);
      master_out_data_pipe_write_data: in std_logic_vector(7 downto 0);
      master_out_data_pipe_write_req : in std_logic_vector(0 downto 0);
      master_out_data_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  -- 
end package afb_spi_bridge_global_package;
-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_spi_bridge_global_package.all;
entity afb_spi_bridge_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    AFB_SPI_MASTER_COMMAND_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_SPI_MASTER_COMMAND_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_SPI_MASTER_COMMAND_pipe_read_data : in   std_logic_vector(73 downto 0);
    master_out_data_pipe_read_req : out  std_logic_vector(0 downto 0);
    master_out_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
    master_out_data_pipe_read_data : in   std_logic_vector(7 downto 0);
    AFB_SPI_MASTER_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_SPI_MASTER_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_SPI_MASTER_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
    master_in_data_pipe_write_req : out  std_logic_vector(0 downto 0);
    master_in_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
    master_in_data_pipe_write_data : out  std_logic_vector(15 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity afb_spi_bridge_daemon;
architecture afb_spi_bridge_daemon_arch of afb_spi_bridge_daemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal afb_spi_bridge_daemon_CP_0_start: Boolean;
  signal afb_spi_bridge_daemon_CP_0_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal RPIPE_master_out_data_311_inst_req_1 : boolean;
  signal RPIPE_master_out_data_311_inst_ack_1 : boolean;
  signal RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_req_0 : boolean;
  signal RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_ack_0 : boolean;
  signal RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_req_1 : boolean;
  signal RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_ack_1 : boolean;
  signal WPIPE_master_in_data_307_inst_req_0 : boolean;
  signal WPIPE_master_in_data_307_inst_ack_0 : boolean;
  signal WPIPE_master_in_data_307_inst_req_1 : boolean;
  signal WPIPE_master_in_data_307_inst_ack_1 : boolean;
  signal RPIPE_master_out_data_311_inst_req_0 : boolean;
  signal RPIPE_master_out_data_311_inst_ack_0 : boolean;
  signal CONCAT_u25_u33_318_inst_req_0 : boolean;
  signal CONCAT_u25_u33_318_inst_ack_0 : boolean;
  signal CONCAT_u25_u33_318_inst_req_1 : boolean;
  signal CONCAT_u25_u33_318_inst_ack_1 : boolean;
  signal WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_req_0 : boolean;
  signal WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_ack_0 : boolean;
  signal WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_req_1 : boolean;
  signal WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "afb_spi_bridge_daemon_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  afb_spi_bridge_daemon_CP_0_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "afb_spi_bridge_daemon_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= afb_spi_bridge_daemon_CP_0_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= afb_spi_bridge_daemon_CP_0_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= afb_spi_bridge_daemon_CP_0_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  afb_spi_bridge_daemon_CP_0: Block -- control-path 
    signal afb_spi_bridge_daemon_CP_0_elements: BooleanArray(11 downto 0);
    -- 
  begin -- 
    afb_spi_bridge_daemon_CP_0_elements(0) <= afb_spi_bridge_daemon_CP_0_start;
    afb_spi_bridge_daemon_CP_0_symbol <= afb_spi_bridge_daemon_CP_0_elements(11);
    -- CP-element group 0:  fork  transition  output  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	8 
    -- CP-element group 0: 	5 
    -- CP-element group 0: 	1 
    -- CP-element group 0:  members (11) 
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_update_start_
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/$entry
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_sample_start_
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_Sample/rr
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_sample_start_
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_Sample/rr
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_Update/$entry
      -- CP-element group 0: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_Update/cr
      -- 
    rr_13_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_13_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(0), ack => RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_req_0); -- 
    rr_41_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_41_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(0), ack => RPIPE_master_out_data_311_inst_req_0); -- 
    cr_60_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_60_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(0), ack => CONCAT_u25_u33_318_inst_req_1); -- 
    -- CP-element group 1:  transition  input  output  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	0 
    -- CP-element group 1: successors 
    -- CP-element group 1: 	2 
    -- CP-element group 1:  members (6) 
      -- CP-element group 1: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_sample_completed_
      -- CP-element group 1: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_update_start_
      -- CP-element group 1: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_Sample/$exit
      -- CP-element group 1: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_Sample/ra
      -- CP-element group 1: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_Update/$entry
      -- CP-element group 1: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_Update/cr
      -- 
    ra_14_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 1_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_ack_0, ack => afb_spi_bridge_daemon_CP_0_elements(1)); -- 
    cr_18_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_18_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(1), ack => RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_req_1); -- 
    -- CP-element group 2:  transition  input  output  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	1 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	3 
    -- CP-element group 2:  members (6) 
      -- CP-element group 2: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_update_completed_
      -- CP-element group 2: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_Update/$exit
      -- CP-element group 2: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_AFB_SPI_MASTER_COMMAND_274_Update/ca
      -- CP-element group 2: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_sample_start_
      -- CP-element group 2: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_Sample/$entry
      -- CP-element group 2: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_Sample/req
      -- 
    ca_19_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 2_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_ack_1, ack => afb_spi_bridge_daemon_CP_0_elements(2)); -- 
    req_27_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_27_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(2), ack => WPIPE_master_in_data_307_inst_req_0); -- 
    -- CP-element group 3:  transition  input  output  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	2 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	4 
    -- CP-element group 3:  members (6) 
      -- CP-element group 3: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_sample_completed_
      -- CP-element group 3: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_update_start_
      -- CP-element group 3: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_Sample/$exit
      -- CP-element group 3: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_Sample/ack
      -- CP-element group 3: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_Update/$entry
      -- CP-element group 3: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_Update/req
      -- 
    ack_28_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_master_in_data_307_inst_ack_0, ack => afb_spi_bridge_daemon_CP_0_elements(3)); -- 
    req_32_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_32_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(3), ack => WPIPE_master_in_data_307_inst_req_1); -- 
    -- CP-element group 4:  transition  input  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	3 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	11 
    -- CP-element group 4:  members (3) 
      -- CP-element group 4: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_update_completed_
      -- CP-element group 4: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_Update/$exit
      -- CP-element group 4: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_master_in_data_307_Update/ack
      -- 
    ack_33_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_master_in_data_307_inst_ack_1, ack => afb_spi_bridge_daemon_CP_0_elements(4)); -- 
    -- CP-element group 5:  transition  input  output  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	0 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	6 
    -- CP-element group 5:  members (6) 
      -- CP-element group 5: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_Update/$entry
      -- CP-element group 5: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_Update/cr
      -- CP-element group 5: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_sample_completed_
      -- CP-element group 5: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_update_start_
      -- CP-element group 5: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_Sample/$exit
      -- CP-element group 5: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_Sample/ra
      -- 
    ra_42_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_master_out_data_311_inst_ack_0, ack => afb_spi_bridge_daemon_CP_0_elements(5)); -- 
    cr_46_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_46_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(5), ack => RPIPE_master_out_data_311_inst_req_1); -- 
    -- CP-element group 6:  transition  input  output  bypass 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	5 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	7 
    -- CP-element group 6:  members (6) 
      -- CP-element group 6: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_Update/$exit
      -- CP-element group 6: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_Update/ca
      -- CP-element group 6: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_sample_start_
      -- CP-element group 6: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_Sample/$entry
      -- CP-element group 6: 	 assign_stmt_275_to_assign_stmt_322/RPIPE_master_out_data_311_update_completed_
      -- CP-element group 6: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_Sample/rr
      -- 
    ca_47_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 6_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_master_out_data_311_inst_ack_1, ack => afb_spi_bridge_daemon_CP_0_elements(6)); -- 
    rr_55_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_55_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(6), ack => CONCAT_u25_u33_318_inst_req_0); -- 
    -- CP-element group 7:  transition  input  bypass 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	6 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (3) 
      -- CP-element group 7: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_sample_completed_
      -- CP-element group 7: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_Sample/$exit
      -- CP-element group 7: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_Sample/ra
      -- 
    ra_56_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 7_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u25_u33_318_inst_ack_0, ack => afb_spi_bridge_daemon_CP_0_elements(7)); -- 
    -- CP-element group 8:  transition  input  output  bypass 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	0 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	9 
    -- CP-element group 8:  members (6) 
      -- CP-element group 8: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_update_completed_
      -- CP-element group 8: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_Update/$exit
      -- CP-element group 8: 	 assign_stmt_275_to_assign_stmt_322/CONCAT_u25_u33_318_Update/ca
      -- CP-element group 8: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_sample_start_
      -- CP-element group 8: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_Sample/$entry
      -- CP-element group 8: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_Sample/req
      -- 
    ca_61_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 8_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u25_u33_318_inst_ack_1, ack => afb_spi_bridge_daemon_CP_0_elements(8)); -- 
    req_69_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_69_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(8), ack => WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_req_0); -- 
    -- CP-element group 9:  transition  input  output  bypass 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	8 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	10 
    -- CP-element group 9:  members (6) 
      -- CP-element group 9: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_sample_completed_
      -- CP-element group 9: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_update_start_
      -- CP-element group 9: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_Sample/$exit
      -- CP-element group 9: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_Sample/ack
      -- CP-element group 9: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_Update/$entry
      -- CP-element group 9: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_Update/req
      -- 
    ack_70_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 9_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_ack_0, ack => afb_spi_bridge_daemon_CP_0_elements(9)); -- 
    req_74_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_74_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_spi_bridge_daemon_CP_0_elements(9), ack => WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_req_1); -- 
    -- CP-element group 10:  transition  input  bypass 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	9 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	11 
    -- CP-element group 10:  members (3) 
      -- CP-element group 10: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_update_completed_
      -- CP-element group 10: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_Update/$exit
      -- CP-element group 10: 	 assign_stmt_275_to_assign_stmt_322/WPIPE_AFB_SPI_MASTER_RESPONSE_320_Update/ack
      -- 
    ack_75_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 10_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_ack_1, ack => afb_spi_bridge_daemon_CP_0_elements(10)); -- 
    -- CP-element group 11:  join  transition  bypass 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	4 
    -- CP-element group 11: 	10 
    -- CP-element group 11: successors 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 $exit
      -- CP-element group 11: 	 assign_stmt_275_to_assign_stmt_322/$exit
      -- 
    afb_spi_bridge_daemon_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 41) := "afb_spi_bridge_daemon_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_spi_bridge_daemon_CP_0_elements(4) & afb_spi_bridge_daemon_CP_0_elements(10);
      gj_afb_spi_bridge_daemon_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_spi_bridge_daemon_CP_0_elements(11), clk => clk, reset => reset); --
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u2_u10_304_wire : std_logic_vector(9 downto 0);
    signal CONCAT_u5_u6_301_wire : std_logic_vector(5 downto 0);
    signal afb_cmd_275 : std_logic_vector(73 downto 0);
    signal phy_addr_283 : std_logic_vector(35 downto 0);
    signal reg_id_291 : std_logic_vector(1 downto 0);
    signal rwbar_279 : std_logic_vector(0 downto 0);
    signal spi_cmd_306 : std_logic_vector(15 downto 0);
    signal spi_response_312 : std_logic_vector(7 downto 0);
    signal spi_wdata_295 : std_logic_vector(7 downto 0);
    signal to_afb_319 : std_logic_vector(32 downto 0);
    signal type_cast_299_wire_constant : std_logic_vector(4 downto 0);
    signal type_cast_316_wire_constant : std_logic_vector(24 downto 0);
    signal wdata_287 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    type_cast_299_wire_constant <= "00000";
    type_cast_316_wire_constant <= "0000000000000000000000000";
    -- flow-through slice operator slice_278_inst
    rwbar_279 <= afb_cmd_275(72 downto 72);
    -- flow-through slice operator slice_282_inst
    phy_addr_283 <= afb_cmd_275(67 downto 32);
    -- flow-through slice operator slice_286_inst
    wdata_287 <= afb_cmd_275(31 downto 0);
    -- flow-through slice operator slice_290_inst
    reg_id_291 <= phy_addr_283(3 downto 2);
    -- flow-through slice operator slice_294_inst
    spi_wdata_295 <= wdata_287(7 downto 0);
    -- shared split operator group (0) : CONCAT_u25_u33_318_inst 
    ApConcat_group_0: Block -- 
      signal data_in: std_logic_vector(32 downto 0);
      signal data_out: std_logic_vector(32 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= type_cast_316_wire_constant & spi_response_312;
      to_afb_319 <= data_out(32 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= CONCAT_u25_u33_318_inst_req_0;
      CONCAT_u25_u33_318_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= CONCAT_u25_u33_318_inst_req_1;
      CONCAT_u25_u33_318_inst_ack_1 <= ackR_unguarded(0);
      ApConcat_group_0_gI: SplitGuardInterface generic map(name => "ApConcat_group_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApConcat",
          name => "ApConcat_group_0",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 25,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 8, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 33,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          full_rate  => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 0
    -- binary operator CONCAT_u2_u10_304_inst
    process(reg_id_291, spi_wdata_295) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      ApConcat_proc(reg_id_291, spi_wdata_295, tmp_var);
      CONCAT_u2_u10_304_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u5_u6_301_inst
    process(type_cast_299_wire_constant, rwbar_279) -- 
      variable tmp_var : std_logic_vector(5 downto 0); -- 
    begin -- 
      ApConcat_proc(type_cast_299_wire_constant, rwbar_279, tmp_var);
      CONCAT_u5_u6_301_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u6_u16_305_inst
    process(CONCAT_u5_u6_301_wire, CONCAT_u2_u10_304_wire) -- 
      variable tmp_var : std_logic_vector(15 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u5_u6_301_wire, CONCAT_u2_u10_304_wire, tmp_var);
      spi_cmd_306 <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_AFB_SPI_MASTER_COMMAND_274_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_req_0;
      RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_req_1;
      RPIPE_AFB_SPI_MASTER_COMMAND_274_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      afb_cmd_275 <= data_out(73 downto 0);
      AFB_SPI_MASTER_COMMAND_read_0_gI: SplitGuardInterface generic map(name => "AFB_SPI_MASTER_COMMAND_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_SPI_MASTER_COMMAND_read_0: InputPortRevised -- 
        generic map ( name => "AFB_SPI_MASTER_COMMAND_read_0", data_width => 74,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => AFB_SPI_MASTER_COMMAND_pipe_read_req(0),
          oack => AFB_SPI_MASTER_COMMAND_pipe_read_ack(0),
          odata => AFB_SPI_MASTER_COMMAND_pipe_read_data(73 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared inport operator group (1) : RPIPE_master_out_data_311_inst 
    InportGroup_1: Block -- 
      signal data_out: std_logic_vector(7 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_master_out_data_311_inst_req_0;
      RPIPE_master_out_data_311_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_master_out_data_311_inst_req_1;
      RPIPE_master_out_data_311_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      spi_response_312 <= data_out(7 downto 0);
      master_out_data_read_1_gI: SplitGuardInterface generic map(name => "master_out_data_read_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      master_out_data_read_1: InputPortRevised -- 
        generic map ( name => "master_out_data_read_1", data_width => 8,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => master_out_data_pipe_read_req(0),
          oack => master_out_data_pipe_read_ack(0),
          odata => master_out_data_pipe_read_data(7 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 1
    -- shared outport operator group (0) : WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(32 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_req_0;
      WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_req_1;
      WPIPE_AFB_SPI_MASTER_RESPONSE_320_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= to_afb_319;
      AFB_SPI_MASTER_RESPONSE_write_0_gI: SplitGuardInterface generic map(name => "AFB_SPI_MASTER_RESPONSE_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_SPI_MASTER_RESPONSE_write_0: OutputPortRevised -- 
        generic map ( name => "AFB_SPI_MASTER_RESPONSE", data_width => 33, num_reqs => 1, input_buffering => inBUFs, full_rate => false,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_SPI_MASTER_RESPONSE_pipe_write_req(0),
          oack => AFB_SPI_MASTER_RESPONSE_pipe_write_ack(0),
          odata => AFB_SPI_MASTER_RESPONSE_pipe_write_data(32 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared outport operator group (1) : WPIPE_master_in_data_307_inst 
    OutportGroup_1: Block -- 
      signal data_in: std_logic_vector(15 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_master_in_data_307_inst_req_0;
      WPIPE_master_in_data_307_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_master_in_data_307_inst_req_1;
      WPIPE_master_in_data_307_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= spi_cmd_306;
      master_in_data_write_1_gI: SplitGuardInterface generic map(name => "master_in_data_write_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      master_in_data_write_1: OutputPortRevised -- 
        generic map ( name => "master_in_data", data_width => 16, num_reqs => 1, input_buffering => inBUFs, full_rate => false,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => master_in_data_pipe_write_req(0),
          oack => master_in_data_pipe_write_ack(0),
          odata => master_in_data_pipe_write_data(15 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
    -- 
  end Block; -- data_path
  -- 
end afb_spi_bridge_daemon_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_spi_bridge_global_package.all;
entity afb_spi_bridge is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_SPI_MASTER_COMMAND_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_SPI_MASTER_COMMAND_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_SPI_MASTER_COMMAND_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_SPI_MASTER_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_SPI_MASTER_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_SPI_MASTER_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    master_in_data_pipe_read_data: out std_logic_vector(15 downto 0);
    master_in_data_pipe_read_req : in std_logic_vector(0 downto 0);
    master_in_data_pipe_read_ack : out std_logic_vector(0 downto 0);
    master_out_data_pipe_write_data: in std_logic_vector(7 downto 0);
    master_out_data_pipe_write_req : in std_logic_vector(0 downto 0);
    master_out_data_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture afb_spi_bridge_arch  of afb_spi_bridge is -- system-architecture 
  -- interface signals to connect to memory space memory_space_1
  -- declarations related to module afb_spi_bridge_daemon
  component afb_spi_bridge_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      AFB_SPI_MASTER_COMMAND_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_SPI_MASTER_COMMAND_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_SPI_MASTER_COMMAND_pipe_read_data : in   std_logic_vector(73 downto 0);
      master_out_data_pipe_read_req : out  std_logic_vector(0 downto 0);
      master_out_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
      master_out_data_pipe_read_data : in   std_logic_vector(7 downto 0);
      AFB_SPI_MASTER_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_SPI_MASTER_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_SPI_MASTER_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
      master_in_data_pipe_write_req : out  std_logic_vector(0 downto 0);
      master_in_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
      master_in_data_pipe_write_data : out  std_logic_vector(15 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module afb_spi_bridge_daemon
  signal afb_spi_bridge_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal afb_spi_bridge_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal afb_spi_bridge_daemon_start_req : std_logic;
  signal afb_spi_bridge_daemon_start_ack : std_logic;
  signal afb_spi_bridge_daemon_fin_req   : std_logic;
  signal afb_spi_bridge_daemon_fin_ack : std_logic;
  -- aggregate signals for read from pipe AFB_SPI_MASTER_COMMAND
  signal AFB_SPI_MASTER_COMMAND_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_SPI_MASTER_COMMAND_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_SPI_MASTER_COMMAND_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe AFB_SPI_MASTER_RESPONSE
  signal AFB_SPI_MASTER_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_SPI_MASTER_RESPONSE_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_SPI_MASTER_RESPONSE_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe master_in_data
  signal master_in_data_pipe_write_data: std_logic_vector(15 downto 0);
  signal master_in_data_pipe_write_req: std_logic_vector(0 downto 0);
  signal master_in_data_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe master_out_data
  signal master_out_data_pipe_read_data: std_logic_vector(7 downto 0);
  signal master_out_data_pipe_read_req: std_logic_vector(0 downto 0);
  signal master_out_data_pipe_read_ack: std_logic_vector(0 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module afb_spi_bridge_daemon
  afb_spi_bridge_daemon_instance:afb_spi_bridge_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => afb_spi_bridge_daemon_start_req,
      start_ack => afb_spi_bridge_daemon_start_ack,
      fin_req => afb_spi_bridge_daemon_fin_req,
      fin_ack => afb_spi_bridge_daemon_fin_ack,
      clk => clk,
      reset => reset,
      AFB_SPI_MASTER_COMMAND_pipe_read_req => AFB_SPI_MASTER_COMMAND_pipe_read_req(0 downto 0),
      AFB_SPI_MASTER_COMMAND_pipe_read_ack => AFB_SPI_MASTER_COMMAND_pipe_read_ack(0 downto 0),
      AFB_SPI_MASTER_COMMAND_pipe_read_data => AFB_SPI_MASTER_COMMAND_pipe_read_data(73 downto 0),
      master_out_data_pipe_read_req => master_out_data_pipe_read_req(0 downto 0),
      master_out_data_pipe_read_ack => master_out_data_pipe_read_ack(0 downto 0),
      master_out_data_pipe_read_data => master_out_data_pipe_read_data(7 downto 0),
      AFB_SPI_MASTER_RESPONSE_pipe_write_req => AFB_SPI_MASTER_RESPONSE_pipe_write_req(0 downto 0),
      AFB_SPI_MASTER_RESPONSE_pipe_write_ack => AFB_SPI_MASTER_RESPONSE_pipe_write_ack(0 downto 0),
      AFB_SPI_MASTER_RESPONSE_pipe_write_data => AFB_SPI_MASTER_RESPONSE_pipe_write_data(32 downto 0),
      master_in_data_pipe_write_req => master_in_data_pipe_write_req(0 downto 0),
      master_in_data_pipe_write_ack => master_in_data_pipe_write_ack(0 downto 0),
      master_in_data_pipe_write_data => master_in_data_pipe_write_data(15 downto 0),
      tag_in => afb_spi_bridge_daemon_tag_in,
      tag_out => afb_spi_bridge_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  afb_spi_bridge_daemon_tag_in <= (others => '0');
  afb_spi_bridge_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => afb_spi_bridge_daemon_start_req, start_ack => afb_spi_bridge_daemon_start_ack,  fin_req => afb_spi_bridge_daemon_fin_req,  fin_ack => afb_spi_bridge_daemon_fin_ack);
  AFB_SPI_MASTER_COMMAND_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_SPI_MASTER_COMMAND",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_SPI_MASTER_COMMAND_pipe_read_req,
      read_ack => AFB_SPI_MASTER_COMMAND_pipe_read_ack,
      read_data => AFB_SPI_MASTER_COMMAND_pipe_read_data,
      write_req => AFB_SPI_MASTER_COMMAND_pipe_write_req,
      write_ack => AFB_SPI_MASTER_COMMAND_pipe_write_ack,
      write_data => AFB_SPI_MASTER_COMMAND_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_SPI_MASTER_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_SPI_MASTER_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_SPI_MASTER_RESPONSE_pipe_read_req,
      read_ack => AFB_SPI_MASTER_RESPONSE_pipe_read_ack,
      read_data => AFB_SPI_MASTER_RESPONSE_pipe_read_data,
      write_req => AFB_SPI_MASTER_RESPONSE_pipe_write_req,
      write_ack => AFB_SPI_MASTER_RESPONSE_pipe_write_ack,
      write_data => AFB_SPI_MASTER_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  master_in_data_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe master_in_data",
      num_reads => 1,
      num_writes => 1,
      data_width => 16,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => master_in_data_pipe_read_req,
      read_ack => master_in_data_pipe_read_ack,
      read_data => master_in_data_pipe_read_data,
      write_req => master_in_data_pipe_write_req,
      write_ack => master_in_data_pipe_write_ack,
      write_data => master_in_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  master_out_data_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe master_out_data",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => master_out_data_pipe_read_req,
      read_ack => master_out_data_pipe_read_ack,
      read_data => master_out_data_pipe_read_data,
      write_req => master_out_data_pipe_write_req,
      write_ack => master_out_data_pipe_write_ack,
      write_data => master_out_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- gated clock generators 
  -- 
end afb_spi_bridge_arch;
library ieee;
use ieee.std_logic_1164.all;
package afb_spi_master_Type_Package is -- 
  -- 
end package;
-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package frontend_global_package is -- 
  constant ONE_3 : std_logic_vector(2 downto 0) := "001";
  constant ZERO_1 : std_logic_vector(0 downto 0) := "0";
  constant ZERO_2 : std_logic_vector(1 downto 0) := "00";
  constant ZERO_3 : std_logic_vector(2 downto 0) := "000";
  constant command_value : std_logic_vector(7 downto 0) := "00010000";
  constant default_mem_pool_base_address : std_logic_vector(0 downto 0) := "0";
  constant desel_start : std_logic_vector(1 downto 0) := "11";
  constant no_desel_start : std_logic_vector(1 downto 0) := "01";
  component frontend is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_read_data: out std_logic_vector(15 downto 0);
      spi_master_stub_command_pipe_read_req : in std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_read_ack : out std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_write_data: in std_logic_vector(7 downto 0);
      spi_master_stub_response_pipe_write_req : in std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  -- 
end package frontend_global_package;
-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.frontend_global_package.all;
entity fetchFromSpiFlash is -- 
  generic (tag_length : integer); 
  port ( -- 
    addr_24 : in  std_logic_vector(23 downto 0);
    ret_byte : out  std_logic_vector(7 downto 0);
    sendByteOverSpi_call_reqs : out  std_logic_vector(0 downto 0);
    sendByteOverSpi_call_acks : in   std_logic_vector(0 downto 0);
    sendByteOverSpi_call_data : out  std_logic_vector(12 downto 0);
    sendByteOverSpi_call_tag  :  out  std_logic_vector(2 downto 0);
    sendByteOverSpi_return_reqs : out  std_logic_vector(0 downto 0);
    sendByteOverSpi_return_acks : in   std_logic_vector(0 downto 0);
    sendByteOverSpi_return_tag :  in   std_logic_vector(2 downto 0);
    recvByteOverSpi_call_reqs : out  std_logic_vector(0 downto 0);
    recvByteOverSpi_call_acks : in   std_logic_vector(0 downto 0);
    recvByteOverSpi_call_data : out  std_logic_vector(4 downto 0);
    recvByteOverSpi_call_tag  :  out  std_logic_vector(0 downto 0);
    recvByteOverSpi_return_reqs : out  std_logic_vector(0 downto 0);
    recvByteOverSpi_return_acks : in   std_logic_vector(0 downto 0);
    recvByteOverSpi_return_data : in   std_logic_vector(7 downto 0);
    recvByteOverSpi_return_tag :  in   std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity fetchFromSpiFlash;
architecture fetchFromSpiFlash_arch of fetchFromSpiFlash is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 24)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 8)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  signal addr_24_buffer :  std_logic_vector(23 downto 0);
  signal addr_24_update_enable: Boolean;
  -- output port buffer signals
  signal ret_byte_buffer :  std_logic_vector(7 downto 0);
  signal ret_byte_update_enable: Boolean;
  signal fetchFromSpiFlash_CP_369_start: Boolean;
  signal fetchFromSpiFlash_CP_369_symbol: Boolean;
  -- volatile/operator module components. 
  component sendByteOverSpi is -- 
    generic (tag_length : integer); 
    port ( -- 
      dev_id : in  std_logic_vector(2 downto 0);
      byte_to_send : in  std_logic_vector(7 downto 0);
      deselect_start : in  std_logic_vector(1 downto 0);
      spi_master_stub_response_pipe_read_req : out  std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_read_ack : in   std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_read_data : in   std_logic_vector(7 downto 0);
      spi_master_stub_command_pipe_write_req : out  std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_write_ack : in   std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_write_data : out  std_logic_vector(15 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  component recvByteOverSpi is -- 
    generic (tag_length : integer); 
    port ( -- 
      dev_id : in  std_logic_vector(2 downto 0);
      deselect_start : in  std_logic_vector(1 downto 0);
      received_byte : out  std_logic_vector(7 downto 0);
      spi_master_stub_response_pipe_read_req : out  std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_read_ack : in   std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_read_data : in   std_logic_vector(7 downto 0);
      spi_master_stub_command_pipe_write_req : out  std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_write_ack : in   std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_write_data : out  std_logic_vector(15 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- links between control-path and data-path
  signal call_stmt_187_call_req_0 : boolean;
  signal call_stmt_187_call_ack_0 : boolean;
  signal call_stmt_187_call_req_1 : boolean;
  signal call_stmt_187_call_ack_1 : boolean;
  signal call_stmt_191_call_req_0 : boolean;
  signal call_stmt_191_call_ack_0 : boolean;
  signal call_stmt_191_call_req_1 : boolean;
  signal call_stmt_191_call_ack_1 : boolean;
  signal call_stmt_195_call_req_0 : boolean;
  signal call_stmt_195_call_ack_0 : boolean;
  signal call_stmt_195_call_req_1 : boolean;
  signal call_stmt_195_call_ack_1 : boolean;
  signal call_stmt_199_call_req_0 : boolean;
  signal call_stmt_199_call_ack_0 : boolean;
  signal call_stmt_199_call_req_1 : boolean;
  signal call_stmt_199_call_ack_1 : boolean;
  signal call_stmt_203_call_req_0 : boolean;
  signal call_stmt_203_call_ack_0 : boolean;
  signal call_stmt_203_call_req_1 : boolean;
  signal call_stmt_203_call_ack_1 : boolean;
  signal W_ret_byte_204_inst_req_0 : boolean;
  signal W_ret_byte_204_inst_ack_0 : boolean;
  signal W_ret_byte_204_inst_req_1 : boolean;
  signal W_ret_byte_204_inst_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "fetchFromSpiFlash_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 24) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(23 downto 0) <= addr_24;
  addr_24_buffer <= in_buffer_data_out(23 downto 0);
  in_buffer_data_in(tag_length + 23 downto 24) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 23 downto 24);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  fetchFromSpiFlash_CP_369_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "fetchFromSpiFlash_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 8) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(7 downto 0) <= ret_byte_buffer;
  ret_byte <= out_buffer_data_out(7 downto 0);
  out_buffer_data_in(tag_length + 7 downto 8) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length + 7 downto 8);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= fetchFromSpiFlash_CP_369_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= fetchFromSpiFlash_CP_369_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= fetchFromSpiFlash_CP_369_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  fetchFromSpiFlash_CP_369: Block -- control-path 
    signal fetchFromSpiFlash_CP_369_elements: BooleanArray(14 downto 0);
    -- 
  begin -- 
    fetchFromSpiFlash_CP_369_elements(0) <= fetchFromSpiFlash_CP_369_start;
    fetchFromSpiFlash_CP_369_symbol <= fetchFromSpiFlash_CP_369_elements(14);
    -- CP-element group 0:  fork  transition  output  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	3 
    -- CP-element group 0: 	6 
    -- CP-element group 0: 	10 
    -- CP-element group 0: 	4 
    -- CP-element group 0: 	5 
    -- CP-element group 0: 	1 
    -- CP-element group 0: 	2 
    -- CP-element group 0: 	7 
    -- CP-element group 0: 	13 
    -- CP-element group 0: 	8 
    -- CP-element group 0:  members (32) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_sample_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_update_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_Sample/crr
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_Update/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_Update/ccr
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_sample_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_update_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_Sample/crr
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_Update/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_Update/ccr
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_sample_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_update_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_Sample/crr
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_Update/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_Update/ccr
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_sample_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_update_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_Sample/crr
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_Update/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_Update/ccr
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_update_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_Update/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_Update/ccr
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_update_start_
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_Update/$entry
      -- CP-element group 0: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_Update/req
      -- 
    crr_396_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_396_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => call_stmt_191_call_req_0); -- 
    ccr_429_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_429_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => call_stmt_199_call_req_1); -- 
    ccr_415_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_415_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => call_stmt_195_call_req_1); -- 
    crr_424_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_424_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => call_stmt_199_call_req_0); -- 
    ccr_401_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_401_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => call_stmt_191_call_req_1); -- 
    crr_382_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_382_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => call_stmt_187_call_req_0); -- 
    ccr_443_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_443_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => call_stmt_203_call_req_1); -- 
    req_458_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_458_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => W_ret_byte_204_inst_req_1); -- 
    ccr_387_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_387_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => call_stmt_187_call_req_1); -- 
    crr_410_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_410_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(0), ack => call_stmt_195_call_req_0); -- 
    -- CP-element group 1:  transition  input  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	0 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (3) 
      -- CP-element group 1: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_sample_completed_
      -- CP-element group 1: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_Sample/$exit
      -- CP-element group 1: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_Sample/cra
      -- 
    cra_383_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 1_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_187_call_ack_0, ack => fetchFromSpiFlash_CP_369_elements(1)); -- 
    -- CP-element group 2:  transition  input  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	14 
    -- CP-element group 2:  members (3) 
      -- CP-element group 2: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_update_completed_
      -- CP-element group 2: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_Update/$exit
      -- CP-element group 2: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_187_Update/cca
      -- 
    cca_388_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 2_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_187_call_ack_1, ack => fetchFromSpiFlash_CP_369_elements(2)); -- 
    -- CP-element group 3:  transition  input  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	0 
    -- CP-element group 3: successors 
    -- CP-element group 3:  members (3) 
      -- CP-element group 3: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_sample_completed_
      -- CP-element group 3: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_Sample/$exit
      -- CP-element group 3: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_Sample/cra
      -- 
    cra_397_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_191_call_ack_0, ack => fetchFromSpiFlash_CP_369_elements(3)); -- 
    -- CP-element group 4:  transition  input  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	0 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	14 
    -- CP-element group 4:  members (3) 
      -- CP-element group 4: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_update_completed_
      -- CP-element group 4: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_Update/$exit
      -- CP-element group 4: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_191_Update/cca
      -- 
    cca_402_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_191_call_ack_1, ack => fetchFromSpiFlash_CP_369_elements(4)); -- 
    -- CP-element group 5:  transition  input  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	0 
    -- CP-element group 5: successors 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_sample_completed_
      -- CP-element group 5: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_Sample/$exit
      -- CP-element group 5: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_Sample/cra
      -- 
    cra_411_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_195_call_ack_0, ack => fetchFromSpiFlash_CP_369_elements(5)); -- 
    -- CP-element group 6:  transition  input  bypass 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	0 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	14 
    -- CP-element group 6:  members (3) 
      -- CP-element group 6: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_update_completed_
      -- CP-element group 6: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_Update/$exit
      -- CP-element group 6: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_195_Update/cca
      -- 
    cca_416_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 6_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_195_call_ack_1, ack => fetchFromSpiFlash_CP_369_elements(6)); -- 
    -- CP-element group 7:  transition  input  bypass 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	0 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (3) 
      -- CP-element group 7: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_sample_completed_
      -- CP-element group 7: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_Sample/$exit
      -- CP-element group 7: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_Sample/cra
      -- 
    cra_425_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 7_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_199_call_ack_0, ack => fetchFromSpiFlash_CP_369_elements(7)); -- 
    -- CP-element group 8:  transition  input  bypass 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	0 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	11 
    -- CP-element group 8:  members (3) 
      -- CP-element group 8: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_update_completed_
      -- CP-element group 8: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_Update/$exit
      -- CP-element group 8: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_199_Update/cca
      -- 
    cca_430_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 8_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_199_call_ack_1, ack => fetchFromSpiFlash_CP_369_elements(8)); -- 
    -- CP-element group 9:  transition  input  bypass 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	11 
    -- CP-element group 9: successors 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_sample_completed_
      -- CP-element group 9: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_Sample/$exit
      -- CP-element group 9: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_Sample/cra
      -- 
    cra_439_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 9_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_203_call_ack_0, ack => fetchFromSpiFlash_CP_369_elements(9)); -- 
    -- CP-element group 10:  transition  input  output  bypass 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	0 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	12 
    -- CP-element group 10:  members (6) 
      -- CP-element group 10: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_update_completed_
      -- CP-element group 10: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_Update/$exit
      -- CP-element group 10: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_Update/cca
      -- CP-element group 10: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_sample_start_
      -- CP-element group 10: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_Sample/$entry
      -- CP-element group 10: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_Sample/req
      -- 
    cca_444_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 10_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_203_call_ack_1, ack => fetchFromSpiFlash_CP_369_elements(10)); -- 
    req_453_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_453_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(10), ack => W_ret_byte_204_inst_req_0); -- 
    -- CP-element group 11:  transition  output  delay-element  bypass 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	8 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	9 
    -- CP-element group 11:  members (4) 
      -- CP-element group 11: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_sample_start_
      -- CP-element group 11: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_Sample/$entry
      -- CP-element group 11: 	 assign_stmt_168_to_assign_stmt_206/call_stmt_203_Sample/crr
      -- CP-element group 11: 	 assign_stmt_168_to_assign_stmt_206/synch_call_stmt_203_sample_start__call_stmt_199_sample_completed_
      -- 
    crr_438_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_438_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => fetchFromSpiFlash_CP_369_elements(11), ack => call_stmt_203_call_req_0); -- 
    -- Element group fetchFromSpiFlash_CP_369_elements(11) is a control-delay.
    cp_element_11_delay: control_delay_element  generic map(name => " 11_delay", delay_value => 1)  port map(req => fetchFromSpiFlash_CP_369_elements(8), ack => fetchFromSpiFlash_CP_369_elements(11), clk => clk, reset =>reset);
    -- CP-element group 12:  transition  input  bypass 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	10 
    -- CP-element group 12: successors 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_sample_completed_
      -- CP-element group 12: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_Sample/$exit
      -- CP-element group 12: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_Sample/ack
      -- 
    ack_454_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_ret_byte_204_inst_ack_0, ack => fetchFromSpiFlash_CP_369_elements(12)); -- 
    -- CP-element group 13:  transition  input  bypass 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	0 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	14 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_update_completed_
      -- CP-element group 13: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_Update/$exit
      -- CP-element group 13: 	 assign_stmt_168_to_assign_stmt_206/assign_stmt_206_Update/ack
      -- 
    ack_459_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_ret_byte_204_inst_ack_1, ack => fetchFromSpiFlash_CP_369_elements(13)); -- 
    -- CP-element group 14:  join  transition  bypass 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	6 
    -- CP-element group 14: 	4 
    -- CP-element group 14: 	2 
    -- CP-element group 14: 	13 
    -- CP-element group 14: successors 
    -- CP-element group 14:  members (2) 
      -- CP-element group 14: 	 $exit
      -- CP-element group 14: 	 assign_stmt_168_to_assign_stmt_206/$exit
      -- 
    fetchFromSpiFlash_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 1,2 => 1,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 37) := "fetchFromSpiFlash_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= fetchFromSpiFlash_CP_369_elements(6) & fetchFromSpiFlash_CP_369_elements(4) & fetchFromSpiFlash_CP_369_elements(2) & fetchFromSpiFlash_CP_369_elements(13);
      gj_fetchFromSpiFlash_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => fetchFromSpiFlash_CP_369_elements(14), clk => clk, reset => reset); --
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal R_desel_start_201_wire_constant : std_logic_vector(1 downto 0);
    signal R_no_desel_start_186_wire_constant : std_logic_vector(1 downto 0);
    signal R_no_desel_start_190_wire_constant : std_logic_vector(1 downto 0);
    signal R_no_desel_start_194_wire_constant : std_logic_vector(1 downto 0);
    signal R_no_desel_start_198_wire_constant : std_logic_vector(1 downto 0);
    signal b0_176 : std_logic_vector(7 downto 0);
    signal b1_172 : std_logic_vector(7 downto 0);
    signal b2_168 : std_logic_vector(7 downto 0);
    signal device_id_183 : std_logic_vector(2 downto 0);
    signal read_cmd_180 : std_logic_vector(7 downto 0);
    signal received_byte_203 : std_logic_vector(7 downto 0);
    -- 
  begin -- 
    R_desel_start_201_wire_constant <= "11";
    R_no_desel_start_186_wire_constant <= "01";
    R_no_desel_start_190_wire_constant <= "01";
    R_no_desel_start_194_wire_constant <= "01";
    R_no_desel_start_198_wire_constant <= "01";
    device_id_183 <= "000";
    read_cmd_180 <= "00000011";
    -- flow-through slice operator slice_167_inst
    b2_168 <= addr_24_buffer(23 downto 16);
    -- flow-through slice operator slice_171_inst
    b1_172 <= addr_24_buffer(15 downto 8);
    -- flow-through slice operator slice_175_inst
    b0_176 <= addr_24_buffer(7 downto 0);
    W_ret_byte_204_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_ret_byte_204_inst_req_0;
      W_ret_byte_204_inst_ack_0<= wack(0);
      rreq(0) <= W_ret_byte_204_inst_req_1;
      W_ret_byte_204_inst_ack_1<= rack(0);
      W_ret_byte_204_inst : InterlockBuffer generic map ( -- 
        name => "W_ret_byte_204_inst",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 8,
        out_data_width => 8,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => received_byte_203,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => ret_byte_buffer,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- shared call operator group (0) : call_stmt_187_call call_stmt_191_call call_stmt_195_call call_stmt_199_call 
    sendByteOverSpi_call_group_0: Block -- 
      signal data_in: std_logic_vector(51 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 3 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 3 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 3 downto 0);
      signal guard_vector : std_logic_vector( 3 downto 0);
      constant inBUFs : IntegerArray(3 downto 0) := (3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant outBUFs: IntegerArray(3 downto 0) := (others => 1);
      constant guardFlags : BooleanArray(3 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false);
      constant guardBuffering: IntegerArray(3 downto 0)  := (0 => 2, 1 => 2, 2 => 2, 3 => 2);
      -- 
    begin -- 
      reqL_unguarded(3) <= call_stmt_187_call_req_0;
      reqL_unguarded(2) <= call_stmt_191_call_req_0;
      reqL_unguarded(1) <= call_stmt_195_call_req_0;
      reqL_unguarded(0) <= call_stmt_199_call_req_0;
      call_stmt_187_call_ack_0 <= ackL_unguarded(3);
      call_stmt_191_call_ack_0 <= ackL_unguarded(2);
      call_stmt_195_call_ack_0 <= ackL_unguarded(1);
      call_stmt_199_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(3) <= call_stmt_187_call_req_1;
      reqR_unguarded(2) <= call_stmt_191_call_req_1;
      reqR_unguarded(1) <= call_stmt_195_call_req_1;
      reqR_unguarded(0) <= call_stmt_199_call_req_1;
      call_stmt_187_call_ack_1 <= ackR_unguarded(3);
      call_stmt_191_call_ack_1 <= ackR_unguarded(2);
      call_stmt_195_call_ack_1 <= ackR_unguarded(1);
      call_stmt_199_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      sendByteOverSpi_call_group_0_accessRegulator_0: access_regulator_base generic map (name => "sendByteOverSpi_call_group_0_accessRegulator_0", num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      sendByteOverSpi_call_group_0_accessRegulator_1: access_regulator_base generic map (name => "sendByteOverSpi_call_group_0_accessRegulator_1", num_slots => 1) -- 
        port map (req => reqL_unregulated(1), -- 
          ack => ackL_unregulated(1),
          regulated_req => reqL(1),
          regulated_ack => ackL(1),
          release_req => reqR(1),
          release_ack => ackR(1),
          clk => clk, reset => reset); -- 
      sendByteOverSpi_call_group_0_accessRegulator_2: access_regulator_base generic map (name => "sendByteOverSpi_call_group_0_accessRegulator_2", num_slots => 1) -- 
        port map (req => reqL_unregulated(2), -- 
          ack => ackL_unregulated(2),
          regulated_req => reqL(2),
          regulated_ack => ackL(2),
          release_req => reqR(2),
          release_ack => ackR(2),
          clk => clk, reset => reset); -- 
      sendByteOverSpi_call_group_0_accessRegulator_3: access_regulator_base generic map (name => "sendByteOverSpi_call_group_0_accessRegulator_3", num_slots => 1) -- 
        port map (req => reqL_unregulated(3), -- 
          ack => ackL_unregulated(3),
          regulated_req => reqL(3),
          regulated_ack => ackL(3),
          release_req => reqR(3),
          release_ack => ackR(3),
          clk => clk, reset => reset); -- 
      sendByteOverSpi_call_group_0_gI: SplitGuardInterface generic map(name => "sendByteOverSpi_call_group_0_gI", nreqs => 4, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= device_id_183 & read_cmd_180 & R_no_desel_start_186_wire_constant & device_id_183 & b2_168 & R_no_desel_start_190_wire_constant & device_id_183 & b1_172 & R_no_desel_start_194_wire_constant & device_id_183 & b0_176 & R_no_desel_start_198_wire_constant;
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 52,
        owidth => 13,
        buffering => inBUFs,
        full_rate =>  false,
        twidth => 3,
        nreqs => 4,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => sendByteOverSpi_call_reqs(0),
          ackR => sendByteOverSpi_call_acks(0),
          dataR => sendByteOverSpi_call_data(12 downto 0),
          tagR => sendByteOverSpi_call_tag(2 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseNoData -- 
        generic map ( -- 
          detailed_buffering_per_output => outBUFs, 
          twidth => 3,
          name => "OutputDemuxBaseNoData",
          nreqs => 4) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          reqL => sendByteOverSpi_return_acks(0), -- cross-over
          ackL => sendByteOverSpi_return_reqs(0), -- cross-over
          tagL => sendByteOverSpi_return_tag(2 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- shared call operator group (1) : call_stmt_203_call 
    recvByteOverSpi_call_group_1: Block -- 
      signal data_in: std_logic_vector(4 downto 0);
      signal data_out: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_203_call_req_0;
      call_stmt_203_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_203_call_req_1;
      call_stmt_203_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      recvByteOverSpi_call_group_1_gI: SplitGuardInterface generic map(name => "recvByteOverSpi_call_group_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= device_id_183 & R_desel_start_201_wire_constant;
      received_byte_203 <= data_out(7 downto 0);
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 5,
        owidth => 5,
        buffering => inBUFs,
        full_rate =>  false,
        twidth => 1,
        nreqs => 1,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => recvByteOverSpi_call_reqs(0),
          ackR => recvByteOverSpi_call_acks(0),
          dataR => recvByteOverSpi_call_data(4 downto 0),
          tagR => recvByteOverSpi_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 8,
          owidth => 8,
          detailed_buffering_per_output => outBUFs, 
          full_rate => false, 
          twidth => 1,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => recvByteOverSpi_return_acks(0), -- cross-over
          ackL => recvByteOverSpi_return_reqs(0), -- cross-over
          dataL => recvByteOverSpi_return_data(7 downto 0),
          tagL => recvByteOverSpi_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 1
    -- 
  end Block; -- data_path
  -- 
end fetchFromSpiFlash_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.frontend_global_package.all;
entity frontend_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
    fetchFromSpiFlash_call_reqs : out  std_logic_vector(0 downto 0);
    fetchFromSpiFlash_call_acks : in   std_logic_vector(0 downto 0);
    fetchFromSpiFlash_call_data : out  std_logic_vector(23 downto 0);
    fetchFromSpiFlash_call_tag  :  out  std_logic_vector(2 downto 0);
    fetchFromSpiFlash_return_reqs : out  std_logic_vector(0 downto 0);
    fetchFromSpiFlash_return_acks : in   std_logic_vector(0 downto 0);
    fetchFromSpiFlash_return_data : in   std_logic_vector(7 downto 0);
    fetchFromSpiFlash_return_tag :  in   std_logic_vector(2 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity frontend_daemon;
architecture frontend_daemon_arch of frontend_daemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal frontend_daemon_CP_460_start: Boolean;
  signal frontend_daemon_CP_460_symbol: Boolean;
  -- volatile/operator module components. 
  component fetchFromSpiFlash is -- 
    generic (tag_length : integer); 
    port ( -- 
      addr_24 : in  std_logic_vector(23 downto 0);
      ret_byte : out  std_logic_vector(7 downto 0);
      sendByteOverSpi_call_reqs : out  std_logic_vector(0 downto 0);
      sendByteOverSpi_call_acks : in   std_logic_vector(0 downto 0);
      sendByteOverSpi_call_data : out  std_logic_vector(12 downto 0);
      sendByteOverSpi_call_tag  :  out  std_logic_vector(2 downto 0);
      sendByteOverSpi_return_reqs : out  std_logic_vector(0 downto 0);
      sendByteOverSpi_return_acks : in   std_logic_vector(0 downto 0);
      sendByteOverSpi_return_tag :  in   std_logic_vector(2 downto 0);
      recvByteOverSpi_call_reqs : out  std_logic_vector(0 downto 0);
      recvByteOverSpi_call_acks : in   std_logic_vector(0 downto 0);
      recvByteOverSpi_call_data : out  std_logic_vector(4 downto 0);
      recvByteOverSpi_call_tag  :  out  std_logic_vector(0 downto 0);
      recvByteOverSpi_return_reqs : out  std_logic_vector(0 downto 0);
      recvByteOverSpi_return_acks : in   std_logic_vector(0 downto 0);
      recvByteOverSpi_return_data : in   std_logic_vector(7 downto 0);
      recvByteOverSpi_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- links between control-path and data-path
  signal WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_ack_1 : boolean;
  signal WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_req_1 : boolean;
  signal RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_req_0 : boolean;
  signal RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_ack_0 : boolean;
  signal RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_req_1 : boolean;
  signal RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_ack_1 : boolean;
  signal if_stmt_248_branch_req_0 : boolean;
  signal if_stmt_248_branch_ack_1 : boolean;
  signal WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_ack_0 : boolean;
  signal if_stmt_248_branch_ack_0 : boolean;
  signal WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_req_0 : boolean;
  signal if_stmt_250_branch_req_0 : boolean;
  signal MUX_303_inst_ack_1 : boolean;
  signal if_stmt_250_branch_ack_1 : boolean;
  signal MUX_303_inst_req_1 : boolean;
  signal if_stmt_250_branch_ack_0 : boolean;
  signal call_stmt_256_call_req_0 : boolean;
  signal call_stmt_256_call_ack_0 : boolean;
  signal call_stmt_256_call_req_1 : boolean;
  signal call_stmt_256_call_ack_1 : boolean;
  signal if_stmt_258_branch_req_0 : boolean;
  signal if_stmt_258_branch_ack_1 : boolean;
  signal if_stmt_258_branch_ack_0 : boolean;
  signal call_stmt_264_call_req_0 : boolean;
  signal call_stmt_264_call_ack_0 : boolean;
  signal call_stmt_264_call_req_1 : boolean;
  signal call_stmt_264_call_ack_1 : boolean;
  signal if_stmt_266_branch_req_0 : boolean;
  signal if_stmt_266_branch_ack_1 : boolean;
  signal if_stmt_266_branch_ack_0 : boolean;
  signal call_stmt_272_call_req_0 : boolean;
  signal call_stmt_272_call_ack_0 : boolean;
  signal call_stmt_272_call_req_1 : boolean;
  signal call_stmt_272_call_ack_1 : boolean;
  signal if_stmt_274_branch_req_0 : boolean;
  signal if_stmt_274_branch_ack_1 : boolean;
  signal if_stmt_274_branch_ack_0 : boolean;
  signal call_stmt_278_call_req_0 : boolean;
  signal call_stmt_278_call_ack_0 : boolean;
  signal call_stmt_278_call_req_1 : boolean;
  signal call_stmt_278_call_ack_1 : boolean;
  signal MUX_303_inst_req_0 : boolean;
  signal MUX_303_inst_ack_0 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "frontend_daemon_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  frontend_daemon_CP_460_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "frontend_daemon_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= frontend_daemon_CP_460_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= frontend_daemon_CP_460_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= frontend_daemon_CP_460_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  frontend_daemon_CP_460: Block -- control-path 
    signal frontend_daemon_CP_460_elements: BooleanArray(31 downto 0);
    -- 
  begin -- 
    frontend_daemon_CP_460_elements(0) <= frontend_daemon_CP_460_start;
    frontend_daemon_CP_460_symbol <= frontend_daemon_CP_460_elements(1);
    -- CP-element group 0:  branch  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	31 
    -- CP-element group 0:  members (7) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_209/$entry
      -- CP-element group 0: 	 branch_block_stmt_209/branch_block_stmt_209__entry__
      -- CP-element group 0: 	 branch_block_stmt_209/merge_stmt_210__entry__
      -- CP-element group 0: 	 branch_block_stmt_209/merge_stmt_210_dead_link/$entry
      -- CP-element group 0: 	 branch_block_stmt_209/merge_stmt_210__entry___PhiReq/$exit
      -- CP-element group 0: 	 branch_block_stmt_209/merge_stmt_210__entry___PhiReq/$entry
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (3) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_209/$exit
      -- CP-element group 1: 	 branch_block_stmt_209/branch_block_stmt_209__exit__
      -- 
    frontend_daemon_CP_460_elements(1) <= false; 
    -- CP-element group 2:  merge  fork  transition  place  output  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	10 
    -- CP-element group 2: 	6 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	27 
    -- CP-element group 2: 	28 
    -- CP-element group 2:  members (9) 
      -- CP-element group 2: 	 branch_block_stmt_209/if_stmt_248__exit__
      -- CP-element group 2: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313__entry__
      -- CP-element group 2: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_complete/req
      -- CP-element group 2: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_complete/$entry
      -- CP-element group 2: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/$entry
      -- CP-element group 2: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_sample_start_
      -- CP-element group 2: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_update_start_
      -- CP-element group 2: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_start/$entry
      -- CP-element group 2: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_start/req
      -- 
    req_678_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_678_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(2), ack => MUX_303_inst_req_1); -- 
    req_673_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_673_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(2), ack => MUX_303_inst_req_0); -- 
    frontend_daemon_CP_460_elements(2) <= OrReduce(frontend_daemon_CP_460_elements(10) & frontend_daemon_CP_460_elements(6));
    -- CP-element group 3:  transition  input  output  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	31 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	4 
    -- CP-element group 3:  members (6) 
      -- CP-element group 3: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_sample_completed_
      -- CP-element group 3: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_update_start_
      -- CP-element group 3: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_Sample/$exit
      -- CP-element group 3: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_Sample/ra
      -- CP-element group 3: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_Update/$entry
      -- CP-element group 3: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_Update/cr
      -- 
    ra_488_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_ack_0, ack => frontend_daemon_CP_460_elements(3)); -- 
    cr_492_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_492_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(3), ack => RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_req_1); -- 
    -- CP-element group 4:  branch  transition  place  input  output  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	3 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	5 
    -- CP-element group 4: 	6 
    -- CP-element group 4:  members (13) 
      -- CP-element group 4: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247__exit__
      -- CP-element group 4: 	 branch_block_stmt_209/if_stmt_248__entry__
      -- CP-element group 4: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/$exit
      -- CP-element group 4: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_update_completed_
      -- CP-element group 4: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_Update/$exit
      -- CP-element group 4: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_Update/ca
      -- CP-element group 4: 	 branch_block_stmt_209/if_stmt_248_dead_link/$entry
      -- CP-element group 4: 	 branch_block_stmt_209/if_stmt_248_eval_test/$entry
      -- CP-element group 4: 	 branch_block_stmt_209/if_stmt_248_eval_test/$exit
      -- CP-element group 4: 	 branch_block_stmt_209/if_stmt_248_eval_test/branch_req
      -- CP-element group 4: 	 branch_block_stmt_209/R_read_write_bar_249_place
      -- CP-element group 4: 	 branch_block_stmt_209/if_stmt_248_if_link/$entry
      -- CP-element group 4: 	 branch_block_stmt_209/if_stmt_248_else_link/$entry
      -- 
    ca_493_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_ack_1, ack => frontend_daemon_CP_460_elements(4)); -- 
    branch_req_501_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " branch_req_501_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(4), ack => if_stmt_248_branch_req_0); -- 
    -- CP-element group 5:  branch  transition  place  input  output  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	4 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	11 
    -- CP-element group 5: 	12 
    -- CP-element group 5:  members (10) 
      -- CP-element group 5: 	 branch_block_stmt_209/if_stmt_248_if_link/$exit
      -- CP-element group 5: 	 branch_block_stmt_209/if_stmt_248_if_link/if_choice_transition
      -- CP-element group 5: 	 branch_block_stmt_209/if_stmt_250__entry__
      -- CP-element group 5: 	 branch_block_stmt_209/if_stmt_250_dead_link/$entry
      -- CP-element group 5: 	 branch_block_stmt_209/if_stmt_250_eval_test/$entry
      -- CP-element group 5: 	 branch_block_stmt_209/if_stmt_250_eval_test/$exit
      -- CP-element group 5: 	 branch_block_stmt_209/if_stmt_250_eval_test/branch_req
      -- CP-element group 5: 	 branch_block_stmt_209/R_b3_251_place
      -- CP-element group 5: 	 branch_block_stmt_209/if_stmt_250_if_link/$entry
      -- CP-element group 5: 	 branch_block_stmt_209/if_stmt_250_else_link/$entry
      -- 
    if_choice_transition_506_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_248_branch_ack_1, ack => frontend_daemon_CP_460_elements(5)); -- 
    branch_req_526_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " branch_req_526_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(5), ack => if_stmt_250_branch_req_0); -- 
    -- CP-element group 6:  transition  input  bypass 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	4 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	2 
    -- CP-element group 6:  members (2) 
      -- CP-element group 6: 	 branch_block_stmt_209/if_stmt_248_else_link/$exit
      -- CP-element group 6: 	 branch_block_stmt_209/if_stmt_248_else_link/else_choice_transition
      -- 
    else_choice_transition_510_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 6_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_248_branch_ack_0, ack => frontend_daemon_CP_460_elements(6)); -- 
    -- CP-element group 7:  merge  branch  transition  place  output  bypass 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	14 
    -- CP-element group 7: 	12 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	16 
    -- CP-element group 7: 	15 
    -- CP-element group 7:  members (9) 
      -- CP-element group 7: 	 branch_block_stmt_209/if_stmt_250__exit__
      -- CP-element group 7: 	 branch_block_stmt_209/if_stmt_258__entry__
      -- CP-element group 7: 	 branch_block_stmt_209/if_stmt_258_dead_link/$entry
      -- CP-element group 7: 	 branch_block_stmt_209/if_stmt_258_eval_test/$entry
      -- CP-element group 7: 	 branch_block_stmt_209/if_stmt_258_eval_test/$exit
      -- CP-element group 7: 	 branch_block_stmt_209/if_stmt_258_eval_test/branch_req
      -- CP-element group 7: 	 branch_block_stmt_209/R_b2_259_place
      -- CP-element group 7: 	 branch_block_stmt_209/if_stmt_258_if_link/$entry
      -- CP-element group 7: 	 branch_block_stmt_209/if_stmt_258_else_link/$entry
      -- 
    branch_req_562_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " branch_req_562_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(7), ack => if_stmt_258_branch_req_0); -- 
    frontend_daemon_CP_460_elements(7) <= OrReduce(frontend_daemon_CP_460_elements(14) & frontend_daemon_CP_460_elements(12));
    -- CP-element group 8:  merge  branch  transition  place  output  bypass 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	18 
    -- CP-element group 8: 	16 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	19 
    -- CP-element group 8: 	20 
    -- CP-element group 8:  members (9) 
      -- CP-element group 8: 	 branch_block_stmt_209/if_stmt_258__exit__
      -- CP-element group 8: 	 branch_block_stmt_209/if_stmt_266__entry__
      -- CP-element group 8: 	 branch_block_stmt_209/if_stmt_266_dead_link/$entry
      -- CP-element group 8: 	 branch_block_stmt_209/if_stmt_266_eval_test/$entry
      -- CP-element group 8: 	 branch_block_stmt_209/if_stmt_266_eval_test/$exit
      -- CP-element group 8: 	 branch_block_stmt_209/if_stmt_266_eval_test/branch_req
      -- CP-element group 8: 	 branch_block_stmt_209/R_b1_267_place
      -- CP-element group 8: 	 branch_block_stmt_209/if_stmt_266_if_link/$entry
      -- CP-element group 8: 	 branch_block_stmt_209/if_stmt_266_else_link/$entry
      -- 
    branch_req_598_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " branch_req_598_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(8), ack => if_stmt_266_branch_req_0); -- 
    frontend_daemon_CP_460_elements(8) <= OrReduce(frontend_daemon_CP_460_elements(18) & frontend_daemon_CP_460_elements(16));
    -- CP-element group 9:  merge  branch  transition  place  output  bypass 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	20 
    -- CP-element group 9: 	22 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	23 
    -- CP-element group 9: 	24 
    -- CP-element group 9:  members (9) 
      -- CP-element group 9: 	 branch_block_stmt_209/if_stmt_266__exit__
      -- CP-element group 9: 	 branch_block_stmt_209/if_stmt_274__entry__
      -- CP-element group 9: 	 branch_block_stmt_209/if_stmt_274_dead_link/$entry
      -- CP-element group 9: 	 branch_block_stmt_209/if_stmt_274_eval_test/$entry
      -- CP-element group 9: 	 branch_block_stmt_209/if_stmt_274_eval_test/$exit
      -- CP-element group 9: 	 branch_block_stmt_209/if_stmt_274_eval_test/branch_req
      -- CP-element group 9: 	 branch_block_stmt_209/R_b0_275_place
      -- CP-element group 9: 	 branch_block_stmt_209/if_stmt_274_if_link/$entry
      -- CP-element group 9: 	 branch_block_stmt_209/if_stmt_274_else_link/$entry
      -- 
    branch_req_634_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " branch_req_634_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(9), ack => if_stmt_274_branch_req_0); -- 
    frontend_daemon_CP_460_elements(9) <= OrReduce(frontend_daemon_CP_460_elements(20) & frontend_daemon_CP_460_elements(22));
    -- CP-element group 10:  merge  place  bypass 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	24 
    -- CP-element group 10: 	26 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	2 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_209/if_stmt_274__exit__
      -- 
    frontend_daemon_CP_460_elements(10) <= OrReduce(frontend_daemon_CP_460_elements(24) & frontend_daemon_CP_460_elements(26));
    -- CP-element group 11:  fork  transition  place  input  output  bypass 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	5 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	14 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (10) 
      -- CP-element group 11: 	 branch_block_stmt_209/if_stmt_250_if_link/$exit
      -- CP-element group 11: 	 branch_block_stmt_209/if_stmt_250_if_link/if_choice_transition
      -- CP-element group 11: 	 branch_block_stmt_209/call_stmt_256__entry__
      -- CP-element group 11: 	 branch_block_stmt_209/call_stmt_256/$entry
      -- CP-element group 11: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_sample_start_
      -- CP-element group 11: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_update_start_
      -- CP-element group 11: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_Sample/$entry
      -- CP-element group 11: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_Sample/crr
      -- CP-element group 11: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_Update/$entry
      -- CP-element group 11: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_Update/ccr
      -- 
    if_choice_transition_531_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 11_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_250_branch_ack_1, ack => frontend_daemon_CP_460_elements(11)); -- 
    crr_548_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_548_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(11), ack => call_stmt_256_call_req_0); -- 
    ccr_553_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_553_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(11), ack => call_stmt_256_call_req_1); -- 
    -- CP-element group 12:  transition  input  bypass 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	5 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	7 
    -- CP-element group 12:  members (2) 
      -- CP-element group 12: 	 branch_block_stmt_209/if_stmt_250_else_link/$exit
      -- CP-element group 12: 	 branch_block_stmt_209/if_stmt_250_else_link/else_choice_transition
      -- 
    else_choice_transition_535_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_250_branch_ack_0, ack => frontend_daemon_CP_460_elements(12)); -- 
    -- CP-element group 13:  transition  input  bypass 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: successors 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_sample_completed_
      -- CP-element group 13: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_Sample/$exit
      -- CP-element group 13: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_Sample/cra
      -- 
    cra_549_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_256_call_ack_0, ack => frontend_daemon_CP_460_elements(13)); -- 
    -- CP-element group 14:  transition  place  input  bypass 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	11 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	7 
    -- CP-element group 14:  members (5) 
      -- CP-element group 14: 	 branch_block_stmt_209/call_stmt_256__exit__
      -- CP-element group 14: 	 branch_block_stmt_209/call_stmt_256/$exit
      -- CP-element group 14: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_update_completed_
      -- CP-element group 14: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_Update/$exit
      -- CP-element group 14: 	 branch_block_stmt_209/call_stmt_256/call_stmt_256_Update/cca
      -- 
    cca_554_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 14_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_256_call_ack_1, ack => frontend_daemon_CP_460_elements(14)); -- 
    -- CP-element group 15:  fork  transition  place  input  output  bypass 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	7 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	18 
    -- CP-element group 15: 	17 
    -- CP-element group 15:  members (10) 
      -- CP-element group 15: 	 branch_block_stmt_209/if_stmt_258_if_link/$exit
      -- CP-element group 15: 	 branch_block_stmt_209/if_stmt_258_if_link/if_choice_transition
      -- CP-element group 15: 	 branch_block_stmt_209/call_stmt_264__entry__
      -- CP-element group 15: 	 branch_block_stmt_209/call_stmt_264/$entry
      -- CP-element group 15: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_sample_start_
      -- CP-element group 15: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_update_start_
      -- CP-element group 15: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_Sample/$entry
      -- CP-element group 15: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_Sample/crr
      -- CP-element group 15: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_Update/$entry
      -- CP-element group 15: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_Update/ccr
      -- 
    if_choice_transition_567_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_258_branch_ack_1, ack => frontend_daemon_CP_460_elements(15)); -- 
    crr_584_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_584_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(15), ack => call_stmt_264_call_req_0); -- 
    ccr_589_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_589_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(15), ack => call_stmt_264_call_req_1); -- 
    -- CP-element group 16:  transition  input  bypass 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	7 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	8 
    -- CP-element group 16:  members (2) 
      -- CP-element group 16: 	 branch_block_stmt_209/if_stmt_258_else_link/$exit
      -- CP-element group 16: 	 branch_block_stmt_209/if_stmt_258_else_link/else_choice_transition
      -- 
    else_choice_transition_571_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_258_branch_ack_0, ack => frontend_daemon_CP_460_elements(16)); -- 
    -- CP-element group 17:  transition  input  bypass 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	15 
    -- CP-element group 17: successors 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_sample_completed_
      -- CP-element group 17: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_Sample/$exit
      -- CP-element group 17: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_Sample/cra
      -- 
    cra_585_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 17_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_264_call_ack_0, ack => frontend_daemon_CP_460_elements(17)); -- 
    -- CP-element group 18:  transition  place  input  bypass 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	15 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	8 
    -- CP-element group 18:  members (5) 
      -- CP-element group 18: 	 branch_block_stmt_209/call_stmt_264__exit__
      -- CP-element group 18: 	 branch_block_stmt_209/call_stmt_264/$exit
      -- CP-element group 18: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_update_completed_
      -- CP-element group 18: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_Update/$exit
      -- CP-element group 18: 	 branch_block_stmt_209/call_stmt_264/call_stmt_264_Update/cca
      -- 
    cca_590_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 18_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_264_call_ack_1, ack => frontend_daemon_CP_460_elements(18)); -- 
    -- CP-element group 19:  fork  transition  place  input  output  bypass 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	8 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	21 
    -- CP-element group 19: 	22 
    -- CP-element group 19:  members (10) 
      -- CP-element group 19: 	 branch_block_stmt_209/if_stmt_266_if_link/$exit
      -- CP-element group 19: 	 branch_block_stmt_209/if_stmt_266_if_link/if_choice_transition
      -- CP-element group 19: 	 branch_block_stmt_209/call_stmt_272__entry__
      -- CP-element group 19: 	 branch_block_stmt_209/call_stmt_272/$entry
      -- CP-element group 19: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_sample_start_
      -- CP-element group 19: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_update_start_
      -- CP-element group 19: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_Sample/$entry
      -- CP-element group 19: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_Sample/crr
      -- CP-element group 19: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_Update/$entry
      -- CP-element group 19: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_Update/ccr
      -- 
    if_choice_transition_603_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_266_branch_ack_1, ack => frontend_daemon_CP_460_elements(19)); -- 
    crr_620_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_620_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(19), ack => call_stmt_272_call_req_0); -- 
    ccr_625_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_625_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(19), ack => call_stmt_272_call_req_1); -- 
    -- CP-element group 20:  transition  input  bypass 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	8 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	9 
    -- CP-element group 20:  members (2) 
      -- CP-element group 20: 	 branch_block_stmt_209/if_stmt_266_else_link/$exit
      -- CP-element group 20: 	 branch_block_stmt_209/if_stmt_266_else_link/else_choice_transition
      -- 
    else_choice_transition_607_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_266_branch_ack_0, ack => frontend_daemon_CP_460_elements(20)); -- 
    -- CP-element group 21:  transition  input  bypass 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	19 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_sample_completed_
      -- CP-element group 21: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_Sample/$exit
      -- CP-element group 21: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_Sample/cra
      -- 
    cra_621_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 21_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_272_call_ack_0, ack => frontend_daemon_CP_460_elements(21)); -- 
    -- CP-element group 22:  transition  place  input  bypass 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	19 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	9 
    -- CP-element group 22:  members (5) 
      -- CP-element group 22: 	 branch_block_stmt_209/call_stmt_272__exit__
      -- CP-element group 22: 	 branch_block_stmt_209/call_stmt_272/$exit
      -- CP-element group 22: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_update_completed_
      -- CP-element group 22: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_Update/$exit
      -- CP-element group 22: 	 branch_block_stmt_209/call_stmt_272/call_stmt_272_Update/cca
      -- 
    cca_626_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_272_call_ack_1, ack => frontend_daemon_CP_460_elements(22)); -- 
    -- CP-element group 23:  fork  transition  place  input  output  bypass 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	9 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	25 
    -- CP-element group 23: 	26 
    -- CP-element group 23:  members (10) 
      -- CP-element group 23: 	 branch_block_stmt_209/if_stmt_274_if_link/$exit
      -- CP-element group 23: 	 branch_block_stmt_209/if_stmt_274_if_link/if_choice_transition
      -- CP-element group 23: 	 branch_block_stmt_209/call_stmt_278__entry__
      -- CP-element group 23: 	 branch_block_stmt_209/call_stmt_278/$entry
      -- CP-element group 23: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_sample_start_
      -- CP-element group 23: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_update_start_
      -- CP-element group 23: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_Sample/$entry
      -- CP-element group 23: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_Sample/crr
      -- CP-element group 23: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_Update/$entry
      -- CP-element group 23: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_Update/ccr
      -- 
    if_choice_transition_639_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_274_branch_ack_1, ack => frontend_daemon_CP_460_elements(23)); -- 
    crr_656_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_656_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(23), ack => call_stmt_278_call_req_0); -- 
    ccr_661_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_661_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(23), ack => call_stmt_278_call_req_1); -- 
    -- CP-element group 24:  transition  input  bypass 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	9 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	10 
    -- CP-element group 24:  members (2) 
      -- CP-element group 24: 	 branch_block_stmt_209/if_stmt_274_else_link/$exit
      -- CP-element group 24: 	 branch_block_stmt_209/if_stmt_274_else_link/else_choice_transition
      -- 
    else_choice_transition_643_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 24_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_274_branch_ack_0, ack => frontend_daemon_CP_460_elements(24)); -- 
    -- CP-element group 25:  transition  input  bypass 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	23 
    -- CP-element group 25: successors 
    -- CP-element group 25:  members (3) 
      -- CP-element group 25: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_sample_completed_
      -- CP-element group 25: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_Sample/$exit
      -- CP-element group 25: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_Sample/cra
      -- 
    cra_657_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 25_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_278_call_ack_0, ack => frontend_daemon_CP_460_elements(25)); -- 
    -- CP-element group 26:  transition  place  input  bypass 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	23 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	10 
    -- CP-element group 26:  members (5) 
      -- CP-element group 26: 	 branch_block_stmt_209/call_stmt_278__exit__
      -- CP-element group 26: 	 branch_block_stmt_209/call_stmt_278/$exit
      -- CP-element group 26: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_update_completed_
      -- CP-element group 26: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_Update/$exit
      -- CP-element group 26: 	 branch_block_stmt_209/call_stmt_278/call_stmt_278_Update/cca
      -- 
    cca_662_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 26_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_278_call_ack_1, ack => frontend_daemon_CP_460_elements(26)); -- 
    -- CP-element group 27:  transition  input  bypass 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	2 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (3) 
      -- CP-element group 27: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_sample_completed_
      -- CP-element group 27: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_start/$exit
      -- CP-element group 27: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_start/ack
      -- 
    ack_674_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_303_inst_ack_0, ack => frontend_daemon_CP_460_elements(27)); -- 
    -- CP-element group 28:  transition  input  output  bypass 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	2 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	29 
    -- CP-element group 28:  members (6) 
      -- CP-element group 28: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_Sample/$entry
      -- CP-element group 28: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_sample_start_
      -- CP-element group 28: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_Sample/req
      -- CP-element group 28: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_complete/ack
      -- CP-element group 28: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_complete/$exit
      -- CP-element group 28: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/MUX_303_update_completed_
      -- 
    ack_679_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 28_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_303_inst_ack_1, ack => frontend_daemon_CP_460_elements(28)); -- 
    req_687_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_687_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(28), ack => WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_req_0); -- 
    -- CP-element group 29:  transition  input  output  bypass 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	28 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	30 
    -- CP-element group 29:  members (6) 
      -- CP-element group 29: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_Sample/$exit
      -- CP-element group 29: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_Update/req
      -- CP-element group 29: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_update_start_
      -- CP-element group 29: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_sample_completed_
      -- CP-element group 29: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_Update/$entry
      -- CP-element group 29: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_Sample/ack
      -- 
    ack_688_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 29_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_ack_0, ack => frontend_daemon_CP_460_elements(29)); -- 
    req_692_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_692_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(29), ack => WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_req_1); -- 
    -- CP-element group 30:  transition  place  input  bypass 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: 	29 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	31 
    -- CP-element group 30:  members (8) 
      -- CP-element group 30: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_Update/ack
      -- CP-element group 30: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_Update/$exit
      -- CP-element group 30: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_update_completed_
      -- CP-element group 30: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313__exit__
      -- CP-element group 30: 	 branch_block_stmt_209/loopback
      -- CP-element group 30: 	 branch_block_stmt_209/loopback_PhiReq/$exit
      -- CP-element group 30: 	 branch_block_stmt_209/loopback_PhiReq/$entry
      -- CP-element group 30: 	 branch_block_stmt_209/assign_stmt_304_to_assign_stmt_313/$exit
      -- 
    ack_693_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 30_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_ack_1, ack => frontend_daemon_CP_460_elements(30)); -- 
    -- CP-element group 31:  merge  transition  place  output  bypass 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	0 
    -- CP-element group 31: 	30 
    -- CP-element group 31: successors 
    -- CP-element group 31: 	3 
    -- CP-element group 31:  members (10) 
      -- CP-element group 31: 	 branch_block_stmt_209/merge_stmt_210_PhiAck/dummy
      -- CP-element group 31: 	 branch_block_stmt_209/merge_stmt_210__exit__
      -- CP-element group 31: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247__entry__
      -- CP-element group 31: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/$entry
      -- CP-element group 31: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_sample_start_
      -- CP-element group 31: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_Sample/$entry
      -- CP-element group 31: 	 branch_block_stmt_209/assign_stmt_213_to_assign_stmt_247/RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_Sample/rr
      -- CP-element group 31: 	 branch_block_stmt_209/merge_stmt_210_PhiAck/$exit
      -- CP-element group 31: 	 branch_block_stmt_209/merge_stmt_210_PhiAck/$entry
      -- CP-element group 31: 	 branch_block_stmt_209/merge_stmt_210_PhiReqMerge
      -- 
    rr_487_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_487_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => frontend_daemon_CP_460_elements(31), ack => RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_req_0); -- 
    frontend_daemon_CP_460_elements(31) <= OrReduce(frontend_daemon_CP_460_elements(0) & frontend_daemon_CP_460_elements(30));
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal ADD_u24_u24_254_wire : std_logic_vector(23 downto 0);
    signal ADD_u24_u24_262_wire : std_logic_vector(23 downto 0);
    signal ADD_u24_u24_270_wire : std_logic_vector(23 downto 0);
    signal CONCAT_u16_u32_301_wire : std_logic_vector(31 downto 0);
    signal CONCAT_u8_u16_291_wire : std_logic_vector(15 downto 0);
    signal CONCAT_u8_u16_300_wire : std_logic_vector(15 downto 0);
    signal MUX_286_wire : std_logic_vector(7 downto 0);
    signal MUX_290_wire : std_logic_vector(7 downto 0);
    signal MUX_295_wire : std_logic_vector(7 downto 0);
    signal MUX_299_wire : std_logic_vector(7 downto 0);
    signal addr_24_247 : std_logic_vector(23 downto 0);
    signal addr_36_227 : std_logic_vector(35 downto 0);
    signal afb_command_213 : std_logic_vector(73 downto 0);
    signal b0_231 : std_logic_vector(0 downto 0);
    signal b1_235 : std_logic_vector(0 downto 0);
    signal b2_239 : std_logic_vector(0 downto 0);
    signal b3_243 : std_logic_vector(0 downto 0);
    signal byte_mask_222 : std_logic_vector(3 downto 0);
    signal d0_278 : std_logic_vector(7 downto 0);
    signal d1_272 : std_logic_vector(7 downto 0);
    signal d2_264 : std_logic_vector(7 downto 0);
    signal d3_256 : std_logic_vector(7 downto 0);
    signal konst_253_wire_constant : std_logic_vector(23 downto 0);
    signal konst_261_wire_constant : std_logic_vector(23 downto 0);
    signal konst_269_wire_constant : std_logic_vector(23 downto 0);
    signal konst_285_wire_constant : std_logic_vector(7 downto 0);
    signal konst_289_wire_constant : std_logic_vector(7 downto 0);
    signal konst_294_wire_constant : std_logic_vector(7 downto 0);
    signal konst_298_wire_constant : std_logic_vector(7 downto 0);
    signal konst_302_wire_constant : std_logic_vector(31 downto 0);
    signal read_write_bar_217 : std_logic_vector(0 downto 0);
    signal resp_310 : std_logic_vector(32 downto 0);
    signal ret_read_data_304 : std_logic_vector(31 downto 0);
    signal type_cast_307_wire_constant : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    konst_253_wire_constant <= "000000000000000000000011";
    konst_261_wire_constant <= "000000000000000000000010";
    konst_269_wire_constant <= "000000000000000000000001";
    konst_285_wire_constant <= "00000000";
    konst_289_wire_constant <= "00000000";
    konst_294_wire_constant <= "00000000";
    konst_298_wire_constant <= "00000000";
    konst_302_wire_constant <= "00000000000000000000000000000000";
    type_cast_307_wire_constant <= "0";
    -- flow-through select operator MUX_286_inst
    MUX_286_wire <= d0_278 when (b0_231(0) /=  '0') else konst_285_wire_constant;
    -- flow-through select operator MUX_290_inst
    MUX_290_wire <= d1_272 when (b1_235(0) /=  '0') else konst_289_wire_constant;
    -- flow-through select operator MUX_295_inst
    MUX_295_wire <= d2_264 when (b2_239(0) /=  '0') else konst_294_wire_constant;
    -- flow-through select operator MUX_299_inst
    MUX_299_wire <= d3_256 when (b3_243(0) /=  '0') else konst_298_wire_constant;
    MUX_303_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= MUX_303_inst_req_0;
      MUX_303_inst_ack_0<= sample_ack(0);
      update_req(0) <= MUX_303_inst_req_1;
      MUX_303_inst_ack_1<= update_ack(0);
      MUX_303_inst: SelectSplitProtocol generic map(name => "MUX_303_inst", data_width => 32, buffering => 1, flow_through => false, full_rate => false) -- 
        port map( x => CONCAT_u16_u32_301_wire, y => konst_302_wire_constant, sel => read_write_bar_217, z => ret_read_data_304, sample_req => sample_req(0), sample_ack => sample_ack(0), update_req => update_req(0), update_ack => update_ack(0), clk => clk, reset => reset); -- 
      -- 
    end block;
    -- flow-through slice operator slice_216_inst
    read_write_bar_217 <= afb_command_213(72 downto 72);
    -- flow-through slice operator slice_221_inst
    byte_mask_222 <= afb_command_213(71 downto 68);
    -- flow-through slice operator slice_226_inst
    addr_36_227 <= afb_command_213(67 downto 32);
    -- flow-through slice operator slice_230_inst
    b0_231 <= byte_mask_222(3 downto 3);
    -- flow-through slice operator slice_234_inst
    b1_235 <= byte_mask_222(2 downto 2);
    -- flow-through slice operator slice_238_inst
    b2_239 <= byte_mask_222(1 downto 1);
    -- flow-through slice operator slice_242_inst
    b3_243 <= byte_mask_222(0 downto 0);
    -- flow-through slice operator slice_246_inst
    addr_24_247 <= addr_36_227(23 downto 0);
    if_stmt_248_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= read_write_bar_217;
      branch_instance: BranchBase -- 
        generic map( name => "if_stmt_248_branch", condition_width => 1,  bypass_flag => false)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_248_branch_req_0,
          ack0 => if_stmt_248_branch_ack_0,
          ack1 => if_stmt_248_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_250_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= b3_243;
      branch_instance: BranchBase -- 
        generic map( name => "if_stmt_250_branch", condition_width => 1,  bypass_flag => false)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_250_branch_req_0,
          ack0 => if_stmt_250_branch_ack_0,
          ack1 => if_stmt_250_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_258_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= b2_239;
      branch_instance: BranchBase -- 
        generic map( name => "if_stmt_258_branch", condition_width => 1,  bypass_flag => false)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_258_branch_req_0,
          ack0 => if_stmt_258_branch_ack_0,
          ack1 => if_stmt_258_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_266_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= b1_235;
      branch_instance: BranchBase -- 
        generic map( name => "if_stmt_266_branch", condition_width => 1,  bypass_flag => false)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_266_branch_req_0,
          ack0 => if_stmt_266_branch_ack_0,
          ack1 => if_stmt_266_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_274_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= b0_231;
      branch_instance: BranchBase -- 
        generic map( name => "if_stmt_274_branch", condition_width => 1,  bypass_flag => false)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_274_branch_req_0,
          ack0 => if_stmt_274_branch_ack_0,
          ack1 => if_stmt_274_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator ADD_u24_u24_254_inst
    process(addr_24_247) -- 
      variable tmp_var : std_logic_vector(23 downto 0); -- 
    begin -- 
      ApIntAdd_proc(addr_24_247, konst_253_wire_constant, tmp_var);
      ADD_u24_u24_254_wire <= tmp_var; --
    end process;
    -- binary operator ADD_u24_u24_262_inst
    process(addr_24_247) -- 
      variable tmp_var : std_logic_vector(23 downto 0); -- 
    begin -- 
      ApIntAdd_proc(addr_24_247, konst_261_wire_constant, tmp_var);
      ADD_u24_u24_262_wire <= tmp_var; --
    end process;
    -- binary operator ADD_u24_u24_270_inst
    process(addr_24_247) -- 
      variable tmp_var : std_logic_vector(23 downto 0); -- 
    begin -- 
      ApIntAdd_proc(addr_24_247, konst_269_wire_constant, tmp_var);
      ADD_u24_u24_270_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u16_u32_301_inst
    process(CONCAT_u8_u16_291_wire, CONCAT_u8_u16_300_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u8_u16_291_wire, CONCAT_u8_u16_300_wire, tmp_var);
      CONCAT_u16_u32_301_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u1_u33_309_inst
    process(type_cast_307_wire_constant, ret_read_data_304) -- 
      variable tmp_var : std_logic_vector(32 downto 0); -- 
    begin -- 
      ApConcat_proc(type_cast_307_wire_constant, ret_read_data_304, tmp_var);
      resp_310 <= tmp_var; --
    end process;
    -- binary operator CONCAT_u8_u16_291_inst
    process(MUX_286_wire, MUX_290_wire) -- 
      variable tmp_var : std_logic_vector(15 downto 0); -- 
    begin -- 
      ApConcat_proc(MUX_286_wire, MUX_290_wire, tmp_var);
      CONCAT_u8_u16_291_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u8_u16_300_inst
    process(MUX_295_wire, MUX_299_wire) -- 
      variable tmp_var : std_logic_vector(15 downto 0); -- 
    begin -- 
      ApConcat_proc(MUX_295_wire, MUX_299_wire, tmp_var);
      CONCAT_u8_u16_300_wire <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_req_0;
      RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_req_1;
      RPIPE_AFB_SPI_FLASH_CTRL_REQUEST_212_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      afb_command_213 <= data_out(73 downto 0);
      AFB_SPI_FLASH_CTRL_REQUEST_read_0_gI: SplitGuardInterface generic map(name => "AFB_SPI_FLASH_CTRL_REQUEST_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_SPI_FLASH_CTRL_REQUEST_read_0: InputPortRevised -- 
        generic map ( name => "AFB_SPI_FLASH_CTRL_REQUEST_read_0", data_width => 74,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_req(0),
          oack => AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_ack(0),
          odata => AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_data(73 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(32 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_req_0;
      WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_req_1;
      WPIPE_AFB_SPI_FLASH_CTRL_RESPONSE_311_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= resp_310;
      AFB_SPI_FLASH_CTRL_RESPONSE_write_0_gI: SplitGuardInterface generic map(name => "AFB_SPI_FLASH_CTRL_RESPONSE_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_SPI_FLASH_CTRL_RESPONSE_write_0: OutputPortRevised -- 
        generic map ( name => "AFB_SPI_FLASH_CTRL_RESPONSE", data_width => 33, num_reqs => 1, input_buffering => inBUFs, full_rate => false,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_req(0),
          oack => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_ack(0),
          odata => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_data(32 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared call operator group (0) : call_stmt_278_call call_stmt_272_call call_stmt_264_call call_stmt_256_call 
    fetchFromSpiFlash_call_group_0: Block -- 
      signal data_in: std_logic_vector(95 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 3 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 3 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 3 downto 0);
      signal guard_vector : std_logic_vector( 3 downto 0);
      constant inBUFs : IntegerArray(3 downto 0) := (3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant outBUFs : IntegerArray(3 downto 0) := (3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(3 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false);
      constant guardBuffering: IntegerArray(3 downto 0)  := (0 => 2, 1 => 2, 2 => 2, 3 => 2);
      -- 
    begin -- 
      reqL_unguarded(3) <= call_stmt_278_call_req_0;
      reqL_unguarded(2) <= call_stmt_272_call_req_0;
      reqL_unguarded(1) <= call_stmt_264_call_req_0;
      reqL_unguarded(0) <= call_stmt_256_call_req_0;
      call_stmt_278_call_ack_0 <= ackL_unguarded(3);
      call_stmt_272_call_ack_0 <= ackL_unguarded(2);
      call_stmt_264_call_ack_0 <= ackL_unguarded(1);
      call_stmt_256_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(3) <= call_stmt_278_call_req_1;
      reqR_unguarded(2) <= call_stmt_272_call_req_1;
      reqR_unguarded(1) <= call_stmt_264_call_req_1;
      reqR_unguarded(0) <= call_stmt_256_call_req_1;
      call_stmt_278_call_ack_1 <= ackR_unguarded(3);
      call_stmt_272_call_ack_1 <= ackR_unguarded(2);
      call_stmt_264_call_ack_1 <= ackR_unguarded(1);
      call_stmt_256_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      fetchFromSpiFlash_call_group_0_accessRegulator_0: access_regulator_base generic map (name => "fetchFromSpiFlash_call_group_0_accessRegulator_0", num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      fetchFromSpiFlash_call_group_0_accessRegulator_1: access_regulator_base generic map (name => "fetchFromSpiFlash_call_group_0_accessRegulator_1", num_slots => 1) -- 
        port map (req => reqL_unregulated(1), -- 
          ack => ackL_unregulated(1),
          regulated_req => reqL(1),
          regulated_ack => ackL(1),
          release_req => reqR(1),
          release_ack => ackR(1),
          clk => clk, reset => reset); -- 
      fetchFromSpiFlash_call_group_0_accessRegulator_2: access_regulator_base generic map (name => "fetchFromSpiFlash_call_group_0_accessRegulator_2", num_slots => 1) -- 
        port map (req => reqL_unregulated(2), -- 
          ack => ackL_unregulated(2),
          regulated_req => reqL(2),
          regulated_ack => ackL(2),
          release_req => reqR(2),
          release_ack => ackR(2),
          clk => clk, reset => reset); -- 
      fetchFromSpiFlash_call_group_0_accessRegulator_3: access_regulator_base generic map (name => "fetchFromSpiFlash_call_group_0_accessRegulator_3", num_slots => 1) -- 
        port map (req => reqL_unregulated(3), -- 
          ack => ackL_unregulated(3),
          regulated_req => reqL(3),
          regulated_ack => ackL(3),
          release_req => reqR(3),
          release_ack => ackR(3),
          clk => clk, reset => reset); -- 
      fetchFromSpiFlash_call_group_0_gI: SplitGuardInterface generic map(name => "fetchFromSpiFlash_call_group_0_gI", nreqs => 4, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= addr_24_247 & ADD_u24_u24_270_wire & ADD_u24_u24_262_wire & ADD_u24_u24_254_wire;
      d0_278 <= data_out(31 downto 24);
      d1_272 <= data_out(23 downto 16);
      d2_264 <= data_out(15 downto 8);
      d3_256 <= data_out(7 downto 0);
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 96,
        owidth => 24,
        buffering => inBUFs,
        full_rate =>  false,
        twidth => 3,
        nreqs => 4,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => fetchFromSpiFlash_call_reqs(0),
          ackR => fetchFromSpiFlash_call_acks(0),
          dataR => fetchFromSpiFlash_call_data(23 downto 0),
          tagR => fetchFromSpiFlash_call_tag(2 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 8,
          owidth => 32,
          detailed_buffering_per_output => outBUFs, 
          full_rate => false, 
          twidth => 3,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 4) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => fetchFromSpiFlash_return_acks(0), -- cross-over
          ackL => fetchFromSpiFlash_return_reqs(0), -- cross-over
          dataL => fetchFromSpiFlash_return_data(7 downto 0),
          tagL => fetchFromSpiFlash_return_tag(2 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- 
  end Block; -- data_path
  -- 
end frontend_daemon_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.frontend_global_package.all;
entity recvByteOverSpi is -- 
  generic (tag_length : integer); 
  port ( -- 
    dev_id : in  std_logic_vector(2 downto 0);
    deselect_start : in  std_logic_vector(1 downto 0);
    received_byte : out  std_logic_vector(7 downto 0);
    spi_master_stub_response_pipe_read_req : out  std_logic_vector(0 downto 0);
    spi_master_stub_response_pipe_read_ack : in   std_logic_vector(0 downto 0);
    spi_master_stub_response_pipe_read_data : in   std_logic_vector(7 downto 0);
    spi_master_stub_command_pipe_write_req : out  std_logic_vector(0 downto 0);
    spi_master_stub_command_pipe_write_ack : in   std_logic_vector(0 downto 0);
    spi_master_stub_command_pipe_write_data : out  std_logic_vector(15 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity recvByteOverSpi;
architecture recvByteOverSpi_arch of recvByteOverSpi is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 5)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 8)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  signal dev_id_buffer :  std_logic_vector(2 downto 0);
  signal dev_id_update_enable: Boolean;
  signal deselect_start_buffer :  std_logic_vector(1 downto 0);
  signal deselect_start_update_enable: Boolean;
  -- output port buffer signals
  signal received_byte_buffer :  std_logic_vector(7 downto 0);
  signal received_byte_update_enable: Boolean;
  signal recvByteOverSpi_CP_186_start: Boolean;
  signal recvByteOverSpi_CP_186_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal WPIPE_spi_master_stub_command_114_inst_req_1 : boolean;
  signal WPIPE_spi_master_stub_command_114_inst_ack_1 : boolean;
  signal WPIPE_spi_master_stub_command_108_inst_req_0 : boolean;
  signal WPIPE_spi_master_stub_command_108_inst_ack_0 : boolean;
  signal WPIPE_spi_master_stub_command_108_inst_req_1 : boolean;
  signal WPIPE_spi_master_stub_command_108_inst_ack_1 : boolean;
  signal RPIPE_spi_master_stub_response_112_inst_req_0 : boolean;
  signal RPIPE_spi_master_stub_response_112_inst_ack_0 : boolean;
  signal RPIPE_spi_master_stub_response_112_inst_req_1 : boolean;
  signal RPIPE_spi_master_stub_response_112_inst_ack_1 : boolean;
  signal CONCAT_u13_u16_124_inst_req_0 : boolean;
  signal CONCAT_u13_u16_124_inst_ack_0 : boolean;
  signal CONCAT_u13_u16_124_inst_req_1 : boolean;
  signal CONCAT_u13_u16_124_inst_ack_1 : boolean;
  signal WPIPE_spi_master_stub_command_114_inst_req_0 : boolean;
  signal WPIPE_spi_master_stub_command_114_inst_ack_0 : boolean;
  signal RPIPE_spi_master_stub_response_127_inst_req_0 : boolean;
  signal RPIPE_spi_master_stub_response_127_inst_ack_0 : boolean;
  signal RPIPE_spi_master_stub_response_127_inst_req_1 : boolean;
  signal RPIPE_spi_master_stub_response_127_inst_ack_1 : boolean;
  signal WPIPE_spi_master_stub_command_131_inst_req_0 : boolean;
  signal WPIPE_spi_master_stub_command_131_inst_ack_0 : boolean;
  signal WPIPE_spi_master_stub_command_131_inst_req_1 : boolean;
  signal WPIPE_spi_master_stub_command_131_inst_ack_1 : boolean;
  signal RPIPE_spi_master_stub_response_139_inst_req_0 : boolean;
  signal RPIPE_spi_master_stub_response_139_inst_ack_0 : boolean;
  signal RPIPE_spi_master_stub_response_139_inst_req_1 : boolean;
  signal RPIPE_spi_master_stub_response_139_inst_ack_1 : boolean;
  signal if_stmt_145_branch_req_0 : boolean;
  signal if_stmt_145_branch_ack_1 : boolean;
  signal if_stmt_145_branch_ack_0 : boolean;
  signal WPIPE_spi_master_stub_command_150_inst_req_0 : boolean;
  signal WPIPE_spi_master_stub_command_150_inst_ack_0 : boolean;
  signal WPIPE_spi_master_stub_command_150_inst_req_1 : boolean;
  signal WPIPE_spi_master_stub_command_150_inst_ack_1 : boolean;
  signal RPIPE_spi_master_stub_response_158_inst_req_0 : boolean;
  signal RPIPE_spi_master_stub_response_158_inst_ack_0 : boolean;
  signal RPIPE_spi_master_stub_response_158_inst_req_1 : boolean;
  signal RPIPE_spi_master_stub_response_158_inst_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "recvByteOverSpi_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 5) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(2 downto 0) <= dev_id;
  dev_id_buffer <= in_buffer_data_out(2 downto 0);
  in_buffer_data_in(4 downto 3) <= deselect_start;
  deselect_start_buffer <= in_buffer_data_out(4 downto 3);
  in_buffer_data_in(tag_length + 4 downto 5) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 4 downto 5);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  recvByteOverSpi_CP_186_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "recvByteOverSpi_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 8) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(7 downto 0) <= received_byte_buffer;
  received_byte <= out_buffer_data_out(7 downto 0);
  out_buffer_data_in(tag_length + 7 downto 8) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length + 7 downto 8);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= recvByteOverSpi_CP_186_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= recvByteOverSpi_CP_186_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= recvByteOverSpi_CP_186_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  recvByteOverSpi_CP_186: Block -- control-path 
    signal recvByteOverSpi_CP_186_elements: BooleanArray(25 downto 0);
    -- 
  begin -- 
    recvByteOverSpi_CP_186_elements(0) <= recvByteOverSpi_CP_186_start;
    recvByteOverSpi_CP_186_symbol <= recvByteOverSpi_CP_186_elements(25);
    -- CP-element group 0:  fork  transition  output  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	1 
    -- CP-element group 0: 	3 
    -- CP-element group 0: 	5 
    -- CP-element group 0: 	6 
    -- CP-element group 0:  members (14) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/$entry
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_sample_start_
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_Sample/req
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_sample_start_
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_Sample/rr
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_sample_start_
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_update_start_
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_Sample/rr
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_Update/$entry
      -- CP-element group 0: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_Update/cr
      -- 
    req_199_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_199_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(0), ack => WPIPE_spi_master_stub_command_108_inst_req_0); -- 
    rr_213_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_213_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(0), ack => RPIPE_spi_master_stub_response_112_inst_req_0); -- 
    rr_227_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_227_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(0), ack => CONCAT_u13_u16_124_inst_req_0); -- 
    cr_232_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_232_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(0), ack => CONCAT_u13_u16_124_inst_req_1); -- 
    -- CP-element group 1:  transition  input  output  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	0 
    -- CP-element group 1: successors 
    -- CP-element group 1: 	2 
    -- CP-element group 1:  members (6) 
      -- CP-element group 1: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_sample_completed_
      -- CP-element group 1: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_update_start_
      -- CP-element group 1: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_Sample/$exit
      -- CP-element group 1: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_Sample/ack
      -- CP-element group 1: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_Update/$entry
      -- CP-element group 1: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_Update/req
      -- 
    ack_200_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 1_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_108_inst_ack_0, ack => recvByteOverSpi_CP_186_elements(1)); -- 
    req_204_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_204_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(1), ack => WPIPE_spi_master_stub_command_108_inst_req_1); -- 
    -- CP-element group 2:  transition  input  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	1 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	7 
    -- CP-element group 2:  members (3) 
      -- CP-element group 2: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_update_completed_
      -- CP-element group 2: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_Update/$exit
      -- CP-element group 2: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_108_Update/ack
      -- 
    ack_205_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 2_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_108_inst_ack_1, ack => recvByteOverSpi_CP_186_elements(2)); -- 
    -- CP-element group 3:  transition  input  output  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	0 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	4 
    -- CP-element group 3:  members (6) 
      -- CP-element group 3: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_sample_completed_
      -- CP-element group 3: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_update_start_
      -- CP-element group 3: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_Sample/$exit
      -- CP-element group 3: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_Sample/ra
      -- CP-element group 3: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_Update/$entry
      -- CP-element group 3: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_Update/cr
      -- 
    ra_214_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_112_inst_ack_0, ack => recvByteOverSpi_CP_186_elements(3)); -- 
    cr_218_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_218_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(3), ack => RPIPE_spi_master_stub_response_112_inst_req_1); -- 
    -- CP-element group 4:  fork  transition  input  output  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	3 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4: 	10 
    -- CP-element group 4:  members (7) 
      -- CP-element group 4: 	 assign_stmt_110_to_assign_stmt_128/synch_WPIPE_spi_master_stub_command_114_sample_start__RPIPE_spi_master_stub_response_112_update_completed_
      -- CP-element group 4: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_sample_start_
      -- CP-element group 4: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_update_completed_
      -- CP-element group 4: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_Update/$exit
      -- CP-element group 4: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_112_Update/ca
      -- CP-element group 4: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_Sample/$entry
      -- CP-element group 4: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_Sample/rr
      -- 
    ca_219_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_112_inst_ack_1, ack => recvByteOverSpi_CP_186_elements(4)); -- 
    rr_256_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_256_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(4), ack => RPIPE_spi_master_stub_response_127_inst_req_0); -- 
    -- CP-element group 5:  transition  input  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	0 
    -- CP-element group 5: successors 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_sample_completed_
      -- CP-element group 5: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_Sample/$exit
      -- CP-element group 5: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_Sample/ra
      -- 
    ra_228_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u13_u16_124_inst_ack_0, ack => recvByteOverSpi_CP_186_elements(5)); -- 
    -- CP-element group 6:  transition  input  bypass 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	0 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	7 
    -- CP-element group 6:  members (3) 
      -- CP-element group 6: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_update_completed_
      -- CP-element group 6: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_Update/$exit
      -- CP-element group 6: 	 assign_stmt_110_to_assign_stmt_128/CONCAT_u13_u16_124_Update/ca
      -- 
    ca_233_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 6_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u13_u16_124_inst_ack_1, ack => recvByteOverSpi_CP_186_elements(6)); -- 
    -- CP-element group 7:  join  transition  output  bypass 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	2 
    -- CP-element group 7: 	4 
    -- CP-element group 7: 	6 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	8 
    -- CP-element group 7:  members (3) 
      -- CP-element group 7: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_sample_start_
      -- CP-element group 7: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_Sample/$entry
      -- CP-element group 7: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_Sample/req
      -- 
    req_241_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_241_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(7), ack => WPIPE_spi_master_stub_command_114_inst_req_0); -- 
    recvByteOverSpi_cp_element_group_7: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 34) := "recvByteOverSpi_cp_element_group_7"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= recvByteOverSpi_CP_186_elements(2) & recvByteOverSpi_CP_186_elements(4) & recvByteOverSpi_CP_186_elements(6);
      gj_recvByteOverSpi_cp_element_group_7 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => recvByteOverSpi_CP_186_elements(7), clk => clk, reset => reset); --
    end block;
    -- CP-element group 8:  transition  input  output  bypass 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	7 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	9 
    -- CP-element group 8:  members (6) 
      -- CP-element group 8: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_Update/req
      -- CP-element group 8: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_sample_completed_
      -- CP-element group 8: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_update_start_
      -- CP-element group 8: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_Sample/$exit
      -- CP-element group 8: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_Sample/ack
      -- CP-element group 8: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_Update/$entry
      -- 
    ack_242_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 8_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_114_inst_ack_0, ack => recvByteOverSpi_CP_186_elements(8)); -- 
    req_246_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_246_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(8), ack => WPIPE_spi_master_stub_command_114_inst_req_1); -- 
    -- CP-element group 9:  transition  input  bypass 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	8 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	12 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_Update/ack
      -- CP-element group 9: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_update_completed_
      -- CP-element group 9: 	 assign_stmt_110_to_assign_stmt_128/WPIPE_spi_master_stub_command_114_Update/$exit
      -- 
    ack_247_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 9_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_114_inst_ack_1, ack => recvByteOverSpi_CP_186_elements(9)); -- 
    -- CP-element group 10:  transition  input  output  bypass 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	4 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	11 
    -- CP-element group 10:  members (6) 
      -- CP-element group 10: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_sample_completed_
      -- CP-element group 10: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_update_start_
      -- CP-element group 10: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_Sample/$exit
      -- CP-element group 10: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_Sample/ra
      -- CP-element group 10: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_Update/$entry
      -- CP-element group 10: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_Update/cr
      -- 
    ra_257_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 10_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_127_inst_ack_0, ack => recvByteOverSpi_CP_186_elements(10)); -- 
    cr_261_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_261_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(10), ack => RPIPE_spi_master_stub_response_127_inst_req_1); -- 
    -- CP-element group 11:  transition  input  bypass 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	10 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	12 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_update_completed_
      -- CP-element group 11: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_Update/$exit
      -- CP-element group 11: 	 assign_stmt_110_to_assign_stmt_128/RPIPE_spi_master_stub_response_127_Update/ca
      -- 
    ca_262_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 11_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_127_inst_ack_1, ack => recvByteOverSpi_CP_186_elements(11)); -- 
    -- CP-element group 12:  branch  join  transition  place  bypass 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	9 
    -- CP-element group 12: 	11 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	20 
    -- CP-element group 12:  members (7) 
      -- CP-element group 12: 	 assign_stmt_110_to_assign_stmt_128/$exit
      -- CP-element group 12: 	 branch_block_stmt_129/$entry
      -- CP-element group 12: 	 branch_block_stmt_129/branch_block_stmt_129__entry__
      -- CP-element group 12: 	 branch_block_stmt_129/merge_stmt_130__entry__
      -- CP-element group 12: 	 branch_block_stmt_129/merge_stmt_130_dead_link/$entry
      -- CP-element group 12: 	 branch_block_stmt_129/merge_stmt_130__entry___PhiReq/$entry
      -- CP-element group 12: 	 branch_block_stmt_129/merge_stmt_130__entry___PhiReq/$exit
      -- 
    recvByteOverSpi_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "recvByteOverSpi_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= recvByteOverSpi_CP_186_elements(9) & recvByteOverSpi_CP_186_elements(11);
      gj_recvByteOverSpi_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => recvByteOverSpi_CP_186_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  transition  input  output  bypass 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	20 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	14 
    -- CP-element group 13:  members (6) 
      -- CP-element group 13: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_sample_completed_
      -- CP-element group 13: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_update_start_
      -- CP-element group 13: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_Sample/$exit
      -- CP-element group 13: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_Sample/ack
      -- CP-element group 13: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_Update/$entry
      -- CP-element group 13: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_Update/req
      -- 
    ack_285_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_131_inst_ack_0, ack => recvByteOverSpi_CP_186_elements(13)); -- 
    req_289_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_289_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(13), ack => WPIPE_spi_master_stub_command_131_inst_req_1); -- 
    -- CP-element group 14:  transition  input  bypass 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	13 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	17 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_update_completed_
      -- CP-element group 14: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_Update/$exit
      -- CP-element group 14: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_Update/ack
      -- 
    ack_290_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 14_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_131_inst_ack_1, ack => recvByteOverSpi_CP_186_elements(14)); -- 
    -- CP-element group 15:  transition  input  output  bypass 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	20 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	16 
    -- CP-element group 15:  members (6) 
      -- CP-element group 15: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_update_start_
      -- CP-element group 15: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_Sample/$exit
      -- CP-element group 15: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_Sample/ra
      -- CP-element group 15: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_Update/$entry
      -- CP-element group 15: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_Update/cr
      -- 
    ra_299_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_139_inst_ack_0, ack => recvByteOverSpi_CP_186_elements(15)); -- 
    cr_303_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_303_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(15), ack => RPIPE_spi_master_stub_response_139_inst_req_1); -- 
    -- CP-element group 16:  transition  input  bypass 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	15 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	17 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_Update/$exit
      -- CP-element group 16: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_Update/ca
      -- 
    ca_304_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_139_inst_ack_1, ack => recvByteOverSpi_CP_186_elements(16)); -- 
    -- CP-element group 17:  branch  join  transition  place  output  bypass 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	14 
    -- CP-element group 17: 	16 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	18 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (10) 
      -- CP-element group 17: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144__exit__
      -- CP-element group 17: 	 branch_block_stmt_129/if_stmt_145__entry__
      -- CP-element group 17: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/$exit
      -- CP-element group 17: 	 branch_block_stmt_129/if_stmt_145_dead_link/$entry
      -- CP-element group 17: 	 branch_block_stmt_129/if_stmt_145_eval_test/$entry
      -- CP-element group 17: 	 branch_block_stmt_129/if_stmt_145_eval_test/$exit
      -- CP-element group 17: 	 branch_block_stmt_129/if_stmt_145_eval_test/branch_req
      -- CP-element group 17: 	 branch_block_stmt_129/R_busy_146_place
      -- CP-element group 17: 	 branch_block_stmt_129/if_stmt_145_if_link/$entry
      -- CP-element group 17: 	 branch_block_stmt_129/if_stmt_145_else_link/$entry
      -- 
    branch_req_312_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " branch_req_312_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(17), ack => if_stmt_145_branch_req_0); -- 
    recvByteOverSpi_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "recvByteOverSpi_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= recvByteOverSpi_CP_186_elements(14) & recvByteOverSpi_CP_186_elements(16);
      gj_recvByteOverSpi_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => recvByteOverSpi_CP_186_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  transition  place  input  bypass 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	17 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	20 
    -- CP-element group 18:  members (5) 
      -- CP-element group 18: 	 branch_block_stmt_129/if_stmt_145_if_link/$exit
      -- CP-element group 18: 	 branch_block_stmt_129/if_stmt_145_if_link/if_choice_transition
      -- CP-element group 18: 	 branch_block_stmt_129/loopback
      -- CP-element group 18: 	 branch_block_stmt_129/loopback_PhiReq/$entry
      -- CP-element group 18: 	 branch_block_stmt_129/loopback_PhiReq/$exit
      -- 
    if_choice_transition_317_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 18_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_145_branch_ack_1, ack => recvByteOverSpi_CP_186_elements(18)); -- 
    -- CP-element group 19:  merge  fork  transition  place  input  output  bypass 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	21 
    -- CP-element group 19: 	23 
    -- CP-element group 19:  members (12) 
      -- CP-element group 19: 	 branch_block_stmt_129/$exit
      -- CP-element group 19: 	 branch_block_stmt_129/branch_block_stmt_129__exit__
      -- CP-element group 19: 	 branch_block_stmt_129/if_stmt_145__exit__
      -- CP-element group 19: 	 branch_block_stmt_129/if_stmt_145_else_link/$exit
      -- CP-element group 19: 	 branch_block_stmt_129/if_stmt_145_else_link/else_choice_transition
      -- CP-element group 19: 	 assign_stmt_156_to_assign_stmt_159/$entry
      -- CP-element group 19: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_sample_start_
      -- CP-element group 19: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_Sample/$entry
      -- CP-element group 19: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_Sample/req
      -- CP-element group 19: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_sample_start_
      -- CP-element group 19: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_Sample/$entry
      -- CP-element group 19: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_Sample/rr
      -- 
    else_choice_transition_321_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_145_branch_ack_0, ack => recvByteOverSpi_CP_186_elements(19)); -- 
    req_348_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_348_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(19), ack => WPIPE_spi_master_stub_command_150_inst_req_0); -- 
    rr_362_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_362_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(19), ack => RPIPE_spi_master_stub_response_158_inst_req_0); -- 
    -- CP-element group 20:  merge  fork  transition  place  output  bypass 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	12 
    -- CP-element group 20: 	18 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	13 
    -- CP-element group 20: 	15 
    -- CP-element group 20:  members (13) 
      -- CP-element group 20: 	 branch_block_stmt_129/merge_stmt_130__exit__
      -- CP-element group 20: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144__entry__
      -- CP-element group 20: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/$entry
      -- CP-element group 20: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_sample_start_
      -- CP-element group 20: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_Sample/$entry
      -- CP-element group 20: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/WPIPE_spi_master_stub_command_131_Sample/req
      -- CP-element group 20: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_sample_start_
      -- CP-element group 20: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_Sample/$entry
      -- CP-element group 20: 	 branch_block_stmt_129/assign_stmt_137_to_assign_stmt_144/RPIPE_spi_master_stub_response_139_Sample/rr
      -- CP-element group 20: 	 branch_block_stmt_129/merge_stmt_130_PhiReqMerge
      -- CP-element group 20: 	 branch_block_stmt_129/merge_stmt_130_PhiAck/$entry
      -- CP-element group 20: 	 branch_block_stmt_129/merge_stmt_130_PhiAck/$exit
      -- CP-element group 20: 	 branch_block_stmt_129/merge_stmt_130_PhiAck/dummy
      -- 
    req_284_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_284_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(20), ack => WPIPE_spi_master_stub_command_131_inst_req_0); -- 
    rr_298_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_298_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(20), ack => RPIPE_spi_master_stub_response_139_inst_req_0); -- 
    recvByteOverSpi_CP_186_elements(20) <= OrReduce(recvByteOverSpi_CP_186_elements(12) & recvByteOverSpi_CP_186_elements(18));
    -- CP-element group 21:  transition  input  output  bypass 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	19 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	22 
    -- CP-element group 21:  members (6) 
      -- CP-element group 21: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_sample_completed_
      -- CP-element group 21: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_update_start_
      -- CP-element group 21: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_Sample/$exit
      -- CP-element group 21: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_Sample/ack
      -- CP-element group 21: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_Update/$entry
      -- CP-element group 21: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_Update/req
      -- 
    ack_349_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 21_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_150_inst_ack_0, ack => recvByteOverSpi_CP_186_elements(21)); -- 
    req_353_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_353_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(21), ack => WPIPE_spi_master_stub_command_150_inst_req_1); -- 
    -- CP-element group 22:  transition  input  bypass 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	21 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	25 
    -- CP-element group 22:  members (3) 
      -- CP-element group 22: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_update_completed_
      -- CP-element group 22: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_Update/$exit
      -- CP-element group 22: 	 assign_stmt_156_to_assign_stmt_159/WPIPE_spi_master_stub_command_150_Update/ack
      -- 
    ack_354_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_150_inst_ack_1, ack => recvByteOverSpi_CP_186_elements(22)); -- 
    -- CP-element group 23:  transition  input  output  bypass 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	19 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	24 
    -- CP-element group 23:  members (6) 
      -- CP-element group 23: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_sample_completed_
      -- CP-element group 23: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_update_start_
      -- CP-element group 23: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_Sample/$exit
      -- CP-element group 23: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_Sample/ra
      -- CP-element group 23: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_Update/$entry
      -- CP-element group 23: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_Update/cr
      -- 
    ra_363_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_158_inst_ack_0, ack => recvByteOverSpi_CP_186_elements(23)); -- 
    cr_367_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_367_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => recvByteOverSpi_CP_186_elements(23), ack => RPIPE_spi_master_stub_response_158_inst_req_1); -- 
    -- CP-element group 24:  transition  input  bypass 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	23 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	25 
    -- CP-element group 24:  members (3) 
      -- CP-element group 24: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_update_completed_
      -- CP-element group 24: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_Update/$exit
      -- CP-element group 24: 	 assign_stmt_156_to_assign_stmt_159/RPIPE_spi_master_stub_response_158_Update/ca
      -- 
    ca_368_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 24_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_158_inst_ack_1, ack => recvByteOverSpi_CP_186_elements(24)); -- 
    -- CP-element group 25:  join  transition  bypass 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	22 
    -- CP-element group 25: 	24 
    -- CP-element group 25: successors 
    -- CP-element group 25:  members (2) 
      -- CP-element group 25: 	 $exit
      -- CP-element group 25: 	 assign_stmt_156_to_assign_stmt_159/$exit
      -- 
    recvByteOverSpi_cp_element_group_25: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "recvByteOverSpi_cp_element_group_25"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= recvByteOverSpi_CP_186_elements(22) & recvByteOverSpi_CP_186_elements(24);
      gj_recvByteOverSpi_cp_element_group_25 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => recvByteOverSpi_CP_186_elements(25), clk => clk, reset => reset); --
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u10_u13_120_wire : std_logic_vector(12 downto 0);
    signal CONCAT_u13_u16_124_wire : std_logic_vector(15 downto 0);
    signal CONCAT_u1_u3_123_wire : std_logic_vector(2 downto 0);
    signal CONCAT_u8_u10_118_wire_constant : std_logic_vector(9 downto 0);
    signal CONCAT_u8_u16_136_wire_constant : std_logic_vector(15 downto 0);
    signal CONCAT_u8_u16_155_wire_constant : std_logic_vector(15 downto 0);
    signal R_ZERO_1_121_wire_constant : std_logic_vector(0 downto 0);
    signal busy_144 : std_logic_vector(0 downto 0);
    signal cmd_reg_read_140 : std_logic_vector(7 downto 0);
    signal ign_resp_1_113 : std_logic_vector(7 downto 0);
    signal ign_resp_2_128 : std_logic_vector(7 downto 0);
    signal konst_109_wire_constant : std_logic_vector(15 downto 0);
    -- 
  begin -- 
    CONCAT_u8_u10_118_wire_constant <= "0000001000";
    CONCAT_u8_u16_136_wire_constant <= "0000011000000000";
    CONCAT_u8_u16_155_wire_constant <= "0000010000000000";
    R_ZERO_1_121_wire_constant <= "0";
    konst_109_wire_constant <= "0000000000000000";
    -- flow-through slice operator slice_143_inst
    busy_144 <= cmd_reg_read_140(0 downto 0);
    if_stmt_145_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= busy_144;
      branch_instance: BranchBase -- 
        generic map( name => "if_stmt_145_branch", condition_width => 1,  bypass_flag => false)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_145_branch_req_0,
          ack0 => if_stmt_145_branch_ack_0,
          ack1 => if_stmt_145_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator CONCAT_u10_u13_120_inst
    process(CONCAT_u8_u10_118_wire_constant, dev_id_buffer) -- 
      variable tmp_var : std_logic_vector(12 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u8_u10_118_wire_constant, dev_id_buffer, tmp_var);
      CONCAT_u10_u13_120_wire <= tmp_var; --
    end process;
    -- shared split operator group (1) : CONCAT_u13_u16_124_inst 
    ApConcat_group_1: Block -- 
      signal data_in: std_logic_vector(15 downto 0);
      signal data_out: std_logic_vector(15 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= CONCAT_u10_u13_120_wire & CONCAT_u1_u3_123_wire;
      CONCAT_u13_u16_124_wire <= data_out(15 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= CONCAT_u13_u16_124_inst_req_0;
      CONCAT_u13_u16_124_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= CONCAT_u13_u16_124_inst_req_1;
      CONCAT_u13_u16_124_inst_ack_1 <= ackR_unguarded(0);
      ApConcat_group_1_gI: SplitGuardInterface generic map(name => "ApConcat_group_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApConcat",
          name => "ApConcat_group_1",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 13,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 3, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 16,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          full_rate  => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 1
    -- binary operator CONCAT_u1_u3_123_inst
    process(R_ZERO_1_121_wire_constant, deselect_start_buffer) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApConcat_proc(R_ZERO_1_121_wire_constant, deselect_start_buffer, tmp_var);
      CONCAT_u1_u3_123_wire <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_spi_master_stub_response_112_inst RPIPE_spi_master_stub_response_127_inst RPIPE_spi_master_stub_response_139_inst RPIPE_spi_master_stub_response_158_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 3 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 3 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 3 downto 0);
      signal guard_vector : std_logic_vector( 3 downto 0);
      constant outBUFs : IntegerArray(3 downto 0) := (3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(3 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false);
      constant guardBuffering: IntegerArray(3 downto 0)  := (0 => 2, 1 => 2, 2 => 2, 3 => 2);
      -- 
    begin -- 
      reqL_unguarded(3) <= RPIPE_spi_master_stub_response_112_inst_req_0;
      reqL_unguarded(2) <= RPIPE_spi_master_stub_response_127_inst_req_0;
      reqL_unguarded(1) <= RPIPE_spi_master_stub_response_139_inst_req_0;
      reqL_unguarded(0) <= RPIPE_spi_master_stub_response_158_inst_req_0;
      RPIPE_spi_master_stub_response_112_inst_ack_0 <= ackL_unguarded(3);
      RPIPE_spi_master_stub_response_127_inst_ack_0 <= ackL_unguarded(2);
      RPIPE_spi_master_stub_response_139_inst_ack_0 <= ackL_unguarded(1);
      RPIPE_spi_master_stub_response_158_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(3) <= RPIPE_spi_master_stub_response_112_inst_req_1;
      reqR_unguarded(2) <= RPIPE_spi_master_stub_response_127_inst_req_1;
      reqR_unguarded(1) <= RPIPE_spi_master_stub_response_139_inst_req_1;
      reqR_unguarded(0) <= RPIPE_spi_master_stub_response_158_inst_req_1;
      RPIPE_spi_master_stub_response_112_inst_ack_1 <= ackR_unguarded(3);
      RPIPE_spi_master_stub_response_127_inst_ack_1 <= ackR_unguarded(2);
      RPIPE_spi_master_stub_response_139_inst_ack_1 <= ackR_unguarded(1);
      RPIPE_spi_master_stub_response_158_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      ign_resp_1_113 <= data_out(31 downto 24);
      ign_resp_2_128 <= data_out(23 downto 16);
      cmd_reg_read_140 <= data_out(15 downto 8);
      received_byte_buffer <= data_out(7 downto 0);
      spi_master_stub_response_read_0_gI: SplitGuardInterface generic map(name => "spi_master_stub_response_read_0_gI", nreqs => 4, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      spi_master_stub_response_read_0: InputPortRevised -- 
        generic map ( name => "spi_master_stub_response_read_0", data_width => 8,  num_reqs => 4,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => spi_master_stub_response_pipe_read_req(0),
          oack => spi_master_stub_response_pipe_read_ack(0),
          odata => spi_master_stub_response_pipe_read_data(7 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_spi_master_stub_command_108_inst WPIPE_spi_master_stub_command_114_inst WPIPE_spi_master_stub_command_131_inst WPIPE_spi_master_stub_command_150_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal sample_req, sample_ack : BooleanArray( 3 downto 0);
      signal update_req, update_ack : BooleanArray( 3 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 3 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 3 downto 0);
      signal guard_vector : std_logic_vector( 3 downto 0);
      constant inBUFs : IntegerArray(3 downto 0) := (3 => 0, 2 => 0, 1 => 0, 0 => 0);
      constant guardFlags : BooleanArray(3 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false);
      constant guardBuffering: IntegerArray(3 downto 0)  := (0 => 2, 1 => 2, 2 => 2, 3 => 2);
      -- 
    begin -- 
      sample_req_unguarded(3) <= WPIPE_spi_master_stub_command_108_inst_req_0;
      sample_req_unguarded(2) <= WPIPE_spi_master_stub_command_114_inst_req_0;
      sample_req_unguarded(1) <= WPIPE_spi_master_stub_command_131_inst_req_0;
      sample_req_unguarded(0) <= WPIPE_spi_master_stub_command_150_inst_req_0;
      WPIPE_spi_master_stub_command_108_inst_ack_0 <= sample_ack_unguarded(3);
      WPIPE_spi_master_stub_command_114_inst_ack_0 <= sample_ack_unguarded(2);
      WPIPE_spi_master_stub_command_131_inst_ack_0 <= sample_ack_unguarded(1);
      WPIPE_spi_master_stub_command_150_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(3) <= WPIPE_spi_master_stub_command_108_inst_req_1;
      update_req_unguarded(2) <= WPIPE_spi_master_stub_command_114_inst_req_1;
      update_req_unguarded(1) <= WPIPE_spi_master_stub_command_131_inst_req_1;
      update_req_unguarded(0) <= WPIPE_spi_master_stub_command_150_inst_req_1;
      WPIPE_spi_master_stub_command_108_inst_ack_1 <= update_ack_unguarded(3);
      WPIPE_spi_master_stub_command_114_inst_ack_1 <= update_ack_unguarded(2);
      WPIPE_spi_master_stub_command_131_inst_ack_1 <= update_ack_unguarded(1);
      WPIPE_spi_master_stub_command_150_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      data_in <= konst_109_wire_constant & CONCAT_u13_u16_124_wire & CONCAT_u8_u16_136_wire_constant & CONCAT_u8_u16_155_wire_constant;
      spi_master_stub_command_write_0_gI: SplitGuardInterface generic map(name => "spi_master_stub_command_write_0_gI", nreqs => 4, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      spi_master_stub_command_write_0: OutputPortRevised -- 
        generic map ( name => "spi_master_stub_command", data_width => 16, num_reqs => 4, input_buffering => inBUFs, full_rate => false,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => spi_master_stub_command_pipe_write_req(0),
          oack => spi_master_stub_command_pipe_write_ack(0),
          odata => spi_master_stub_command_pipe_write_data(15 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end recvByteOverSpi_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.frontend_global_package.all;
entity sendByteOverSpi is -- 
  generic (tag_length : integer); 
  port ( -- 
    dev_id : in  std_logic_vector(2 downto 0);
    byte_to_send : in  std_logic_vector(7 downto 0);
    deselect_start : in  std_logic_vector(1 downto 0);
    spi_master_stub_response_pipe_read_req : out  std_logic_vector(0 downto 0);
    spi_master_stub_response_pipe_read_ack : in   std_logic_vector(0 downto 0);
    spi_master_stub_response_pipe_read_data : in   std_logic_vector(7 downto 0);
    spi_master_stub_command_pipe_write_req : out  std_logic_vector(0 downto 0);
    spi_master_stub_command_pipe_write_ack : in   std_logic_vector(0 downto 0);
    spi_master_stub_command_pipe_write_data : out  std_logic_vector(15 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity sendByteOverSpi;
architecture sendByteOverSpi_arch of sendByteOverSpi is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 13)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  signal dev_id_buffer :  std_logic_vector(2 downto 0);
  signal dev_id_update_enable: Boolean;
  signal byte_to_send_buffer :  std_logic_vector(7 downto 0);
  signal byte_to_send_update_enable: Boolean;
  signal deselect_start_buffer :  std_logic_vector(1 downto 0);
  signal deselect_start_update_enable: Boolean;
  -- output port buffer signals
  signal sendByteOverSpi_CP_20_start: Boolean;
  signal sendByteOverSpi_CP_20_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal CONCAT_u8_u16_62_inst_req_0 : boolean;
  signal CONCAT_u8_u16_62_inst_ack_0 : boolean;
  signal CONCAT_u8_u16_62_inst_req_1 : boolean;
  signal CONCAT_u8_u16_62_inst_ack_1 : boolean;
  signal WPIPE_spi_master_stub_command_58_inst_req_0 : boolean;
  signal WPIPE_spi_master_stub_command_58_inst_ack_0 : boolean;
  signal WPIPE_spi_master_stub_command_58_inst_req_1 : boolean;
  signal WPIPE_spi_master_stub_command_58_inst_ack_1 : boolean;
  signal RPIPE_spi_master_stub_response_65_inst_req_0 : boolean;
  signal RPIPE_spi_master_stub_response_65_inst_ack_0 : boolean;
  signal RPIPE_spi_master_stub_response_65_inst_req_1 : boolean;
  signal RPIPE_spi_master_stub_response_65_inst_ack_1 : boolean;
  signal CONCAT_u13_u16_77_inst_req_0 : boolean;
  signal CONCAT_u13_u16_77_inst_ack_0 : boolean;
  signal CONCAT_u13_u16_77_inst_req_1 : boolean;
  signal CONCAT_u13_u16_77_inst_ack_1 : boolean;
  signal WPIPE_spi_master_stub_command_67_inst_req_0 : boolean;
  signal WPIPE_spi_master_stub_command_67_inst_ack_0 : boolean;
  signal WPIPE_spi_master_stub_command_67_inst_req_1 : boolean;
  signal WPIPE_spi_master_stub_command_67_inst_ack_1 : boolean;
  signal RPIPE_spi_master_stub_response_80_inst_req_0 : boolean;
  signal RPIPE_spi_master_stub_response_80_inst_ack_0 : boolean;
  signal RPIPE_spi_master_stub_response_80_inst_req_1 : boolean;
  signal RPIPE_spi_master_stub_response_80_inst_ack_1 : boolean;
  signal WPIPE_spi_master_stub_command_84_inst_req_0 : boolean;
  signal WPIPE_spi_master_stub_command_84_inst_ack_0 : boolean;
  signal WPIPE_spi_master_stub_command_84_inst_req_1 : boolean;
  signal WPIPE_spi_master_stub_command_84_inst_ack_1 : boolean;
  signal RPIPE_spi_master_stub_response_92_inst_req_0 : boolean;
  signal RPIPE_spi_master_stub_response_92_inst_ack_0 : boolean;
  signal RPIPE_spi_master_stub_response_92_inst_req_1 : boolean;
  signal RPIPE_spi_master_stub_response_92_inst_ack_1 : boolean;
  signal if_stmt_98_branch_req_0 : boolean;
  signal if_stmt_98_branch_ack_1 : boolean;
  signal if_stmt_98_branch_ack_0 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "sendByteOverSpi_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 13) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(2 downto 0) <= dev_id;
  dev_id_buffer <= in_buffer_data_out(2 downto 0);
  in_buffer_data_in(10 downto 3) <= byte_to_send;
  byte_to_send_buffer <= in_buffer_data_out(10 downto 3);
  in_buffer_data_in(12 downto 11) <= deselect_start;
  deselect_start_buffer <= in_buffer_data_out(12 downto 11);
  in_buffer_data_in(tag_length + 12 downto 13) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 12 downto 13);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  sendByteOverSpi_CP_20_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "sendByteOverSpi_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= sendByteOverSpi_CP_20_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= sendByteOverSpi_CP_20_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= sendByteOverSpi_CP_20_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  sendByteOverSpi_CP_20: Block -- control-path 
    signal sendByteOverSpi_CP_20_elements: BooleanArray(22 downto 0);
    -- 
  begin -- 
    sendByteOverSpi_CP_20_elements(0) <= sendByteOverSpi_CP_20_start;
    sendByteOverSpi_CP_20_symbol <= sendByteOverSpi_CP_20_elements(21);
    -- CP-element group 0:  fork  transition  output  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	1 
    -- CP-element group 0: 	2 
    -- CP-element group 0: 	5 
    -- CP-element group 0: 	7 
    -- CP-element group 0: 	8 
    -- CP-element group 0:  members (17) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/$entry
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_sample_start_
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_update_start_
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_Sample/rr
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_Update/$entry
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_Update/cr
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_sample_start_
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_Sample/rr
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_sample_start_
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_update_start_
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_Sample/rr
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_Update/$entry
      -- CP-element group 0: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_Update/cr
      -- 
    rr_33_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_33_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(0), ack => CONCAT_u8_u16_62_inst_req_0); -- 
    cr_38_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_38_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(0), ack => CONCAT_u8_u16_62_inst_req_1); -- 
    rr_61_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_61_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(0), ack => RPIPE_spi_master_stub_response_65_inst_req_0); -- 
    rr_75_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_75_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(0), ack => CONCAT_u13_u16_77_inst_req_0); -- 
    cr_80_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_80_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(0), ack => CONCAT_u13_u16_77_inst_req_1); -- 
    -- CP-element group 1:  transition  input  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	0 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (3) 
      -- CP-element group 1: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_sample_completed_
      -- CP-element group 1: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_Sample/$exit
      -- CP-element group 1: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_Sample/ra
      -- 
    ra_34_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 1_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u8_u16_62_inst_ack_0, ack => sendByteOverSpi_CP_20_elements(1)); -- 
    -- CP-element group 2:  transition  input  output  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	3 
    -- CP-element group 2:  members (6) 
      -- CP-element group 2: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_update_completed_
      -- CP-element group 2: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_Update/$exit
      -- CP-element group 2: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u8_u16_62_Update/ca
      -- CP-element group 2: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_sample_start_
      -- CP-element group 2: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_Sample/$entry
      -- CP-element group 2: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_Sample/req
      -- 
    ca_39_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 2_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u8_u16_62_inst_ack_1, ack => sendByteOverSpi_CP_20_elements(2)); -- 
    req_47_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_47_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(2), ack => WPIPE_spi_master_stub_command_58_inst_req_0); -- 
    -- CP-element group 3:  transition  input  output  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	2 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	4 
    -- CP-element group 3:  members (6) 
      -- CP-element group 3: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_sample_completed_
      -- CP-element group 3: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_update_start_
      -- CP-element group 3: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_Sample/$exit
      -- CP-element group 3: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_Sample/ack
      -- CP-element group 3: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_Update/$entry
      -- CP-element group 3: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_Update/req
      -- 
    ack_48_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_58_inst_ack_0, ack => sendByteOverSpi_CP_20_elements(3)); -- 
    req_52_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_52_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(3), ack => WPIPE_spi_master_stub_command_58_inst_req_1); -- 
    -- CP-element group 4:  transition  input  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	3 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	9 
    -- CP-element group 4:  members (3) 
      -- CP-element group 4: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_update_completed_
      -- CP-element group 4: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_Update/$exit
      -- CP-element group 4: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_58_Update/ack
      -- 
    ack_53_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_58_inst_ack_1, ack => sendByteOverSpi_CP_20_elements(4)); -- 
    -- CP-element group 5:  transition  input  output  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	0 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	6 
    -- CP-element group 5:  members (6) 
      -- CP-element group 5: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_sample_completed_
      -- CP-element group 5: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_update_start_
      -- CP-element group 5: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_Sample/$exit
      -- CP-element group 5: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_Sample/ra
      -- CP-element group 5: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_Update/$entry
      -- CP-element group 5: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_Update/cr
      -- 
    ra_62_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_65_inst_ack_0, ack => sendByteOverSpi_CP_20_elements(5)); -- 
    cr_66_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_66_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(5), ack => RPIPE_spi_master_stub_response_65_inst_req_1); -- 
    -- CP-element group 6:  fork  transition  input  output  bypass 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	5 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	9 
    -- CP-element group 6: 	12 
    -- CP-element group 6:  members (7) 
      -- CP-element group 6: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_update_completed_
      -- CP-element group 6: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_Update/$exit
      -- CP-element group 6: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_65_Update/ca
      -- CP-element group 6: 	 assign_stmt_63_to_assign_stmt_81/synch_WPIPE_spi_master_stub_command_67_sample_start__RPIPE_spi_master_stub_response_65_update_completed_
      -- CP-element group 6: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_sample_start_
      -- CP-element group 6: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_Sample/$entry
      -- CP-element group 6: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_Sample/rr
      -- 
    ca_67_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 6_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_65_inst_ack_1, ack => sendByteOverSpi_CP_20_elements(6)); -- 
    rr_104_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_104_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(6), ack => RPIPE_spi_master_stub_response_80_inst_req_0); -- 
    -- CP-element group 7:  transition  input  bypass 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	0 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (3) 
      -- CP-element group 7: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_sample_completed_
      -- CP-element group 7: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_Sample/$exit
      -- CP-element group 7: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_Sample/ra
      -- 
    ra_76_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 7_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u13_u16_77_inst_ack_0, ack => sendByteOverSpi_CP_20_elements(7)); -- 
    -- CP-element group 8:  transition  input  bypass 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	0 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	9 
    -- CP-element group 8:  members (3) 
      -- CP-element group 8: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_update_completed_
      -- CP-element group 8: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_Update/$exit
      -- CP-element group 8: 	 assign_stmt_63_to_assign_stmt_81/CONCAT_u13_u16_77_Update/ca
      -- 
    ca_81_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 8_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u13_u16_77_inst_ack_1, ack => sendByteOverSpi_CP_20_elements(8)); -- 
    -- CP-element group 9:  join  transition  output  bypass 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	4 
    -- CP-element group 9: 	6 
    -- CP-element group 9: 	8 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	10 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_sample_start_
      -- CP-element group 9: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_Sample/$entry
      -- CP-element group 9: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_Sample/req
      -- 
    req_89_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_89_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(9), ack => WPIPE_spi_master_stub_command_67_inst_req_0); -- 
    sendByteOverSpi_cp_element_group_9: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 34) := "sendByteOverSpi_cp_element_group_9"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= sendByteOverSpi_CP_20_elements(4) & sendByteOverSpi_CP_20_elements(6) & sendByteOverSpi_CP_20_elements(8);
      gj_sendByteOverSpi_cp_element_group_9 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => sendByteOverSpi_CP_20_elements(9), clk => clk, reset => reset); --
    end block;
    -- CP-element group 10:  transition  input  output  bypass 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	9 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	11 
    -- CP-element group 10:  members (6) 
      -- CP-element group 10: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_sample_completed_
      -- CP-element group 10: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_update_start_
      -- CP-element group 10: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_Sample/$exit
      -- CP-element group 10: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_Sample/ack
      -- CP-element group 10: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_Update/$entry
      -- CP-element group 10: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_Update/req
      -- 
    ack_90_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 10_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_67_inst_ack_0, ack => sendByteOverSpi_CP_20_elements(10)); -- 
    req_94_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_94_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(10), ack => WPIPE_spi_master_stub_command_67_inst_req_1); -- 
    -- CP-element group 11:  transition  input  bypass 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	10 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	14 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_update_completed_
      -- CP-element group 11: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_Update/$exit
      -- CP-element group 11: 	 assign_stmt_63_to_assign_stmt_81/WPIPE_spi_master_stub_command_67_Update/ack
      -- 
    ack_95_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 11_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_67_inst_ack_1, ack => sendByteOverSpi_CP_20_elements(11)); -- 
    -- CP-element group 12:  transition  input  output  bypass 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	6 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	13 
    -- CP-element group 12:  members (6) 
      -- CP-element group 12: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_sample_completed_
      -- CP-element group 12: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_update_start_
      -- CP-element group 12: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_Sample/$exit
      -- CP-element group 12: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_Sample/ra
      -- CP-element group 12: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_Update/$entry
      -- CP-element group 12: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_Update/cr
      -- 
    ra_105_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_80_inst_ack_0, ack => sendByteOverSpi_CP_20_elements(12)); -- 
    cr_109_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_109_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(12), ack => RPIPE_spi_master_stub_response_80_inst_req_1); -- 
    -- CP-element group 13:  transition  input  bypass 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	12 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	14 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_update_completed_
      -- CP-element group 13: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_Update/$exit
      -- CP-element group 13: 	 assign_stmt_63_to_assign_stmt_81/RPIPE_spi_master_stub_response_80_Update/ca
      -- 
    ca_110_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_80_inst_ack_1, ack => sendByteOverSpi_CP_20_elements(13)); -- 
    -- CP-element group 14:  branch  join  transition  place  bypass 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	11 
    -- CP-element group 14: 	13 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	22 
    -- CP-element group 14:  members (7) 
      -- CP-element group 14: 	 assign_stmt_63_to_assign_stmt_81/$exit
      -- CP-element group 14: 	 branch_block_stmt_82/$entry
      -- CP-element group 14: 	 branch_block_stmt_82/branch_block_stmt_82__entry__
      -- CP-element group 14: 	 branch_block_stmt_82/merge_stmt_83__entry__
      -- CP-element group 14: 	 branch_block_stmt_82/merge_stmt_83_dead_link/$entry
      -- CP-element group 14: 	 branch_block_stmt_82/merge_stmt_83__entry___PhiReq/$entry
      -- CP-element group 14: 	 branch_block_stmt_82/merge_stmt_83__entry___PhiReq/$exit
      -- 
    sendByteOverSpi_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "sendByteOverSpi_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= sendByteOverSpi_CP_20_elements(11) & sendByteOverSpi_CP_20_elements(13);
      gj_sendByteOverSpi_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => sendByteOverSpi_CP_20_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  transition  input  output  bypass 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	22 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	16 
    -- CP-element group 15:  members (6) 
      -- CP-element group 15: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_update_start_
      -- CP-element group 15: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_Sample/$exit
      -- CP-element group 15: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_Sample/ack
      -- CP-element group 15: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_Update/$entry
      -- CP-element group 15: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_Update/req
      -- 
    ack_133_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_84_inst_ack_0, ack => sendByteOverSpi_CP_20_elements(15)); -- 
    req_137_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_137_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(15), ack => WPIPE_spi_master_stub_command_84_inst_req_1); -- 
    -- CP-element group 16:  transition  input  bypass 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	15 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	19 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_Update/$exit
      -- CP-element group 16: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_Update/ack
      -- 
    ack_138_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_spi_master_stub_command_84_inst_ack_1, ack => sendByteOverSpi_CP_20_elements(16)); -- 
    -- CP-element group 17:  transition  input  output  bypass 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	22 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	18 
    -- CP-element group 17:  members (6) 
      -- CP-element group 17: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_sample_completed_
      -- CP-element group 17: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_update_start_
      -- CP-element group 17: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_Sample/$exit
      -- CP-element group 17: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_Sample/ra
      -- CP-element group 17: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_Update/$entry
      -- CP-element group 17: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_Update/cr
      -- 
    ra_147_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 17_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_92_inst_ack_0, ack => sendByteOverSpi_CP_20_elements(17)); -- 
    cr_151_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_151_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(17), ack => RPIPE_spi_master_stub_response_92_inst_req_1); -- 
    -- CP-element group 18:  transition  input  bypass 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	17 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	19 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_update_completed_
      -- CP-element group 18: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_Update/$exit
      -- CP-element group 18: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_Update/ca
      -- 
    ca_152_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 18_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_spi_master_stub_response_92_inst_ack_1, ack => sendByteOverSpi_CP_20_elements(18)); -- 
    -- CP-element group 19:  branch  join  transition  place  output  bypass 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	16 
    -- CP-element group 19: 	18 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	20 
    -- CP-element group 19: 	21 
    -- CP-element group 19:  members (10) 
      -- CP-element group 19: 	 branch_block_stmt_82/if_stmt_98_dead_link/$entry
      -- CP-element group 19: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97__exit__
      -- CP-element group 19: 	 branch_block_stmt_82/if_stmt_98__entry__
      -- CP-element group 19: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/$exit
      -- CP-element group 19: 	 branch_block_stmt_82/if_stmt_98_eval_test/$entry
      -- CP-element group 19: 	 branch_block_stmt_82/if_stmt_98_eval_test/$exit
      -- CP-element group 19: 	 branch_block_stmt_82/if_stmt_98_eval_test/branch_req
      -- CP-element group 19: 	 branch_block_stmt_82/R_busy_99_place
      -- CP-element group 19: 	 branch_block_stmt_82/if_stmt_98_if_link/$entry
      -- CP-element group 19: 	 branch_block_stmt_82/if_stmt_98_else_link/$entry
      -- 
    branch_req_160_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " branch_req_160_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(19), ack => if_stmt_98_branch_req_0); -- 
    sendByteOverSpi_cp_element_group_19: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "sendByteOverSpi_cp_element_group_19"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= sendByteOverSpi_CP_20_elements(16) & sendByteOverSpi_CP_20_elements(18);
      gj_sendByteOverSpi_cp_element_group_19 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => sendByteOverSpi_CP_20_elements(19), clk => clk, reset => reset); --
    end block;
    -- CP-element group 20:  transition  place  input  bypass 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	19 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	22 
    -- CP-element group 20:  members (5) 
      -- CP-element group 20: 	 branch_block_stmt_82/if_stmt_98_if_link/$exit
      -- CP-element group 20: 	 branch_block_stmt_82/if_stmt_98_if_link/if_choice_transition
      -- CP-element group 20: 	 branch_block_stmt_82/loopback
      -- CP-element group 20: 	 branch_block_stmt_82/loopback_PhiReq/$entry
      -- CP-element group 20: 	 branch_block_stmt_82/loopback_PhiReq/$exit
      -- 
    if_choice_transition_165_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_98_branch_ack_1, ack => sendByteOverSpi_CP_20_elements(20)); -- 
    -- CP-element group 21:  merge  transition  place  input  bypass 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	19 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (6) 
      -- CP-element group 21: 	 $exit
      -- CP-element group 21: 	 branch_block_stmt_82/$exit
      -- CP-element group 21: 	 branch_block_stmt_82/branch_block_stmt_82__exit__
      -- CP-element group 21: 	 branch_block_stmt_82/if_stmt_98__exit__
      -- CP-element group 21: 	 branch_block_stmt_82/if_stmt_98_else_link/$exit
      -- CP-element group 21: 	 branch_block_stmt_82/if_stmt_98_else_link/else_choice_transition
      -- 
    else_choice_transition_169_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 21_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_98_branch_ack_0, ack => sendByteOverSpi_CP_20_elements(21)); -- 
    -- CP-element group 22:  merge  fork  transition  place  output  bypass 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	14 
    -- CP-element group 22: 	20 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	15 
    -- CP-element group 22: 	17 
    -- CP-element group 22:  members (13) 
      -- CP-element group 22: 	 branch_block_stmt_82/merge_stmt_83__exit__
      -- CP-element group 22: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97__entry__
      -- CP-element group 22: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/$entry
      -- CP-element group 22: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_sample_start_
      -- CP-element group 22: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_Sample/$entry
      -- CP-element group 22: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/WPIPE_spi_master_stub_command_84_Sample/req
      -- CP-element group 22: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_sample_start_
      -- CP-element group 22: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_Sample/$entry
      -- CP-element group 22: 	 branch_block_stmt_82/assign_stmt_90_to_assign_stmt_97/RPIPE_spi_master_stub_response_92_Sample/rr
      -- CP-element group 22: 	 branch_block_stmt_82/merge_stmt_83_PhiReqMerge
      -- CP-element group 22: 	 branch_block_stmt_82/merge_stmt_83_PhiAck/$entry
      -- CP-element group 22: 	 branch_block_stmt_82/merge_stmt_83_PhiAck/$exit
      -- CP-element group 22: 	 branch_block_stmt_82/merge_stmt_83_PhiAck/dummy
      -- 
    req_132_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_132_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(22), ack => WPIPE_spi_master_stub_command_84_inst_req_0); -- 
    rr_146_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_146_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendByteOverSpi_CP_20_elements(22), ack => RPIPE_spi_master_stub_response_92_inst_req_0); -- 
    sendByteOverSpi_CP_20_elements(22) <= OrReduce(sendByteOverSpi_CP_20_elements(14) & sendByteOverSpi_CP_20_elements(20));
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u10_u13_73_wire : std_logic_vector(12 downto 0);
    signal CONCAT_u13_u16_77_wire : std_logic_vector(15 downto 0);
    signal CONCAT_u1_u3_76_wire : std_logic_vector(2 downto 0);
    signal CONCAT_u8_u10_71_wire_constant : std_logic_vector(9 downto 0);
    signal CONCAT_u8_u16_62_wire : std_logic_vector(15 downto 0);
    signal CONCAT_u8_u16_89_wire_constant : std_logic_vector(15 downto 0);
    signal R_ZERO_1_74_wire_constant : std_logic_vector(0 downto 0);
    signal busy_97 : std_logic_vector(0 downto 0);
    signal cmd_reg_read_93 : std_logic_vector(7 downto 0);
    signal ign_resp_1_66 : std_logic_vector(7 downto 0);
    signal ign_resp_2_81 : std_logic_vector(7 downto 0);
    signal type_cast_60_wire_constant : std_logic_vector(7 downto 0);
    -- 
  begin -- 
    CONCAT_u8_u10_71_wire_constant <= "0000001000";
    CONCAT_u8_u16_89_wire_constant <= "0000011000000000";
    R_ZERO_1_74_wire_constant <= "0";
    type_cast_60_wire_constant <= "00000000";
    -- flow-through slice operator slice_96_inst
    busy_97 <= cmd_reg_read_93(0 downto 0);
    if_stmt_98_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= busy_97;
      branch_instance: BranchBase -- 
        generic map( name => "if_stmt_98_branch", condition_width => 1,  bypass_flag => false)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_98_branch_req_0,
          ack0 => if_stmt_98_branch_ack_0,
          ack1 => if_stmt_98_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator CONCAT_u10_u13_73_inst
    process(CONCAT_u8_u10_71_wire_constant, dev_id_buffer) -- 
      variable tmp_var : std_logic_vector(12 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u8_u10_71_wire_constant, dev_id_buffer, tmp_var);
      CONCAT_u10_u13_73_wire <= tmp_var; --
    end process;
    -- shared split operator group (1) : CONCAT_u13_u16_77_inst 
    ApConcat_group_1: Block -- 
      signal data_in: std_logic_vector(15 downto 0);
      signal data_out: std_logic_vector(15 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= CONCAT_u10_u13_73_wire & CONCAT_u1_u3_76_wire;
      CONCAT_u13_u16_77_wire <= data_out(15 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= CONCAT_u13_u16_77_inst_req_0;
      CONCAT_u13_u16_77_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= CONCAT_u13_u16_77_inst_req_1;
      CONCAT_u13_u16_77_inst_ack_1 <= ackR_unguarded(0);
      ApConcat_group_1_gI: SplitGuardInterface generic map(name => "ApConcat_group_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApConcat",
          name => "ApConcat_group_1",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 13,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 3, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 16,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          full_rate  => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 1
    -- binary operator CONCAT_u1_u3_76_inst
    process(R_ZERO_1_74_wire_constant, deselect_start_buffer) -- 
      variable tmp_var : std_logic_vector(2 downto 0); -- 
    begin -- 
      ApConcat_proc(R_ZERO_1_74_wire_constant, deselect_start_buffer, tmp_var);
      CONCAT_u1_u3_76_wire <= tmp_var; --
    end process;
    -- shared split operator group (3) : CONCAT_u8_u16_62_inst 
    ApConcat_group_3: Block -- 
      signal data_in: std_logic_vector(15 downto 0);
      signal data_out: std_logic_vector(15 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= type_cast_60_wire_constant & byte_to_send_buffer;
      CONCAT_u8_u16_62_wire <= data_out(15 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= CONCAT_u8_u16_62_inst_req_0;
      CONCAT_u8_u16_62_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= CONCAT_u8_u16_62_inst_req_1;
      CONCAT_u8_u16_62_inst_ack_1 <= ackR_unguarded(0);
      ApConcat_group_3_gI: SplitGuardInterface generic map(name => "ApConcat_group_3_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApConcat",
          name => "ApConcat_group_3",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 8, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 16,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          full_rate  => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 3
    -- shared inport operator group (0) : RPIPE_spi_master_stub_response_65_inst RPIPE_spi_master_stub_response_80_inst RPIPE_spi_master_stub_response_92_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(23 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 2 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 2 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 2 downto 0);
      signal guard_vector : std_logic_vector( 2 downto 0);
      constant outBUFs : IntegerArray(2 downto 0) := (2 => 1, 1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(2 downto 0) := (0 => false, 1 => false, 2 => false);
      constant guardBuffering: IntegerArray(2 downto 0)  := (0 => 2, 1 => 2, 2 => 2);
      -- 
    begin -- 
      reqL_unguarded(2) <= RPIPE_spi_master_stub_response_65_inst_req_0;
      reqL_unguarded(1) <= RPIPE_spi_master_stub_response_80_inst_req_0;
      reqL_unguarded(0) <= RPIPE_spi_master_stub_response_92_inst_req_0;
      RPIPE_spi_master_stub_response_65_inst_ack_0 <= ackL_unguarded(2);
      RPIPE_spi_master_stub_response_80_inst_ack_0 <= ackL_unguarded(1);
      RPIPE_spi_master_stub_response_92_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(2) <= RPIPE_spi_master_stub_response_65_inst_req_1;
      reqR_unguarded(1) <= RPIPE_spi_master_stub_response_80_inst_req_1;
      reqR_unguarded(0) <= RPIPE_spi_master_stub_response_92_inst_req_1;
      RPIPE_spi_master_stub_response_65_inst_ack_1 <= ackR_unguarded(2);
      RPIPE_spi_master_stub_response_80_inst_ack_1 <= ackR_unguarded(1);
      RPIPE_spi_master_stub_response_92_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      ign_resp_1_66 <= data_out(23 downto 16);
      ign_resp_2_81 <= data_out(15 downto 8);
      cmd_reg_read_93 <= data_out(7 downto 0);
      spi_master_stub_response_read_0_gI: SplitGuardInterface generic map(name => "spi_master_stub_response_read_0_gI", nreqs => 3, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      spi_master_stub_response_read_0: InputPortRevised -- 
        generic map ( name => "spi_master_stub_response_read_0", data_width => 8,  num_reqs => 3,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => spi_master_stub_response_pipe_read_req(0),
          oack => spi_master_stub_response_pipe_read_ack(0),
          odata => spi_master_stub_response_pipe_read_data(7 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_spi_master_stub_command_58_inst WPIPE_spi_master_stub_command_67_inst WPIPE_spi_master_stub_command_84_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(47 downto 0);
      signal sample_req, sample_ack : BooleanArray( 2 downto 0);
      signal update_req, update_ack : BooleanArray( 2 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 2 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 2 downto 0);
      signal guard_vector : std_logic_vector( 2 downto 0);
      constant inBUFs : IntegerArray(2 downto 0) := (2 => 0, 1 => 0, 0 => 0);
      constant guardFlags : BooleanArray(2 downto 0) := (0 => false, 1 => false, 2 => false);
      constant guardBuffering: IntegerArray(2 downto 0)  := (0 => 2, 1 => 2, 2 => 2);
      -- 
    begin -- 
      sample_req_unguarded(2) <= WPIPE_spi_master_stub_command_58_inst_req_0;
      sample_req_unguarded(1) <= WPIPE_spi_master_stub_command_67_inst_req_0;
      sample_req_unguarded(0) <= WPIPE_spi_master_stub_command_84_inst_req_0;
      WPIPE_spi_master_stub_command_58_inst_ack_0 <= sample_ack_unguarded(2);
      WPIPE_spi_master_stub_command_67_inst_ack_0 <= sample_ack_unguarded(1);
      WPIPE_spi_master_stub_command_84_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(2) <= WPIPE_spi_master_stub_command_58_inst_req_1;
      update_req_unguarded(1) <= WPIPE_spi_master_stub_command_67_inst_req_1;
      update_req_unguarded(0) <= WPIPE_spi_master_stub_command_84_inst_req_1;
      WPIPE_spi_master_stub_command_58_inst_ack_1 <= update_ack_unguarded(2);
      WPIPE_spi_master_stub_command_67_inst_ack_1 <= update_ack_unguarded(1);
      WPIPE_spi_master_stub_command_84_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      data_in <= CONCAT_u8_u16_62_wire & CONCAT_u13_u16_77_wire & CONCAT_u8_u16_89_wire_constant;
      spi_master_stub_command_write_0_gI: SplitGuardInterface generic map(name => "spi_master_stub_command_write_0_gI", nreqs => 3, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      spi_master_stub_command_write_0: OutputPortRevised -- 
        generic map ( name => "spi_master_stub_command", data_width => 16, num_reqs => 3, input_buffering => inBUFs, full_rate => false,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => spi_master_stub_command_pipe_write_req(0),
          oack => spi_master_stub_command_pipe_write_ack(0),
          odata => spi_master_stub_command_pipe_write_data(15 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end sendByteOverSpi_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.frontend_global_package.all;
entity frontend is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    spi_master_stub_command_pipe_read_data: out std_logic_vector(15 downto 0);
    spi_master_stub_command_pipe_read_req : in std_logic_vector(0 downto 0);
    spi_master_stub_command_pipe_read_ack : out std_logic_vector(0 downto 0);
    spi_master_stub_response_pipe_write_data: in std_logic_vector(7 downto 0);
    spi_master_stub_response_pipe_write_req : in std_logic_vector(0 downto 0);
    spi_master_stub_response_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture frontend_arch  of frontend is -- system-architecture 
  -- interface signals to connect to memory space memory_space_1
  -- declarations related to module fetchFromSpiFlash
  component fetchFromSpiFlash is -- 
    generic (tag_length : integer); 
    port ( -- 
      addr_24 : in  std_logic_vector(23 downto 0);
      ret_byte : out  std_logic_vector(7 downto 0);
      sendByteOverSpi_call_reqs : out  std_logic_vector(0 downto 0);
      sendByteOverSpi_call_acks : in   std_logic_vector(0 downto 0);
      sendByteOverSpi_call_data : out  std_logic_vector(12 downto 0);
      sendByteOverSpi_call_tag  :  out  std_logic_vector(2 downto 0);
      sendByteOverSpi_return_reqs : out  std_logic_vector(0 downto 0);
      sendByteOverSpi_return_acks : in   std_logic_vector(0 downto 0);
      sendByteOverSpi_return_tag :  in   std_logic_vector(2 downto 0);
      recvByteOverSpi_call_reqs : out  std_logic_vector(0 downto 0);
      recvByteOverSpi_call_acks : in   std_logic_vector(0 downto 0);
      recvByteOverSpi_call_data : out  std_logic_vector(4 downto 0);
      recvByteOverSpi_call_tag  :  out  std_logic_vector(0 downto 0);
      recvByteOverSpi_return_reqs : out  std_logic_vector(0 downto 0);
      recvByteOverSpi_return_acks : in   std_logic_vector(0 downto 0);
      recvByteOverSpi_return_data : in   std_logic_vector(7 downto 0);
      recvByteOverSpi_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module fetchFromSpiFlash
  signal fetchFromSpiFlash_addr_24 :  std_logic_vector(23 downto 0);
  signal fetchFromSpiFlash_ret_byte :  std_logic_vector(7 downto 0);
  signal fetchFromSpiFlash_in_args    : std_logic_vector(23 downto 0);
  signal fetchFromSpiFlash_out_args   : std_logic_vector(7 downto 0);
  signal fetchFromSpiFlash_tag_in    : std_logic_vector(3 downto 0) := (others => '0');
  signal fetchFromSpiFlash_tag_out   : std_logic_vector(3 downto 0);
  signal fetchFromSpiFlash_start_req : std_logic;
  signal fetchFromSpiFlash_start_ack : std_logic;
  signal fetchFromSpiFlash_fin_req   : std_logic;
  signal fetchFromSpiFlash_fin_ack : std_logic;
  -- caller side aggregated signals for module fetchFromSpiFlash
  signal fetchFromSpiFlash_call_reqs: std_logic_vector(0 downto 0);
  signal fetchFromSpiFlash_call_acks: std_logic_vector(0 downto 0);
  signal fetchFromSpiFlash_return_reqs: std_logic_vector(0 downto 0);
  signal fetchFromSpiFlash_return_acks: std_logic_vector(0 downto 0);
  signal fetchFromSpiFlash_call_data: std_logic_vector(23 downto 0);
  signal fetchFromSpiFlash_call_tag: std_logic_vector(2 downto 0);
  signal fetchFromSpiFlash_return_data: std_logic_vector(7 downto 0);
  signal fetchFromSpiFlash_return_tag: std_logic_vector(2 downto 0);
  -- declarations related to module frontend_daemon
  component frontend_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
      fetchFromSpiFlash_call_reqs : out  std_logic_vector(0 downto 0);
      fetchFromSpiFlash_call_acks : in   std_logic_vector(0 downto 0);
      fetchFromSpiFlash_call_data : out  std_logic_vector(23 downto 0);
      fetchFromSpiFlash_call_tag  :  out  std_logic_vector(2 downto 0);
      fetchFromSpiFlash_return_reqs : out  std_logic_vector(0 downto 0);
      fetchFromSpiFlash_return_acks : in   std_logic_vector(0 downto 0);
      fetchFromSpiFlash_return_data : in   std_logic_vector(7 downto 0);
      fetchFromSpiFlash_return_tag :  in   std_logic_vector(2 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module frontend_daemon
  signal frontend_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal frontend_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal frontend_daemon_start_req : std_logic;
  signal frontend_daemon_start_ack : std_logic;
  signal frontend_daemon_fin_req   : std_logic;
  signal frontend_daemon_fin_ack : std_logic;
  -- declarations related to module recvByteOverSpi
  component recvByteOverSpi is -- 
    generic (tag_length : integer); 
    port ( -- 
      dev_id : in  std_logic_vector(2 downto 0);
      deselect_start : in  std_logic_vector(1 downto 0);
      received_byte : out  std_logic_vector(7 downto 0);
      spi_master_stub_response_pipe_read_req : out  std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_read_ack : in   std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_read_data : in   std_logic_vector(7 downto 0);
      spi_master_stub_command_pipe_write_req : out  std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_write_ack : in   std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_write_data : out  std_logic_vector(15 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module recvByteOverSpi
  signal recvByteOverSpi_dev_id :  std_logic_vector(2 downto 0);
  signal recvByteOverSpi_deselect_start :  std_logic_vector(1 downto 0);
  signal recvByteOverSpi_received_byte :  std_logic_vector(7 downto 0);
  signal recvByteOverSpi_in_args    : std_logic_vector(4 downto 0);
  signal recvByteOverSpi_out_args   : std_logic_vector(7 downto 0);
  signal recvByteOverSpi_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal recvByteOverSpi_tag_out   : std_logic_vector(1 downto 0);
  signal recvByteOverSpi_start_req : std_logic;
  signal recvByteOverSpi_start_ack : std_logic;
  signal recvByteOverSpi_fin_req   : std_logic;
  signal recvByteOverSpi_fin_ack : std_logic;
  -- caller side aggregated signals for module recvByteOverSpi
  signal recvByteOverSpi_call_reqs: std_logic_vector(0 downto 0);
  signal recvByteOverSpi_call_acks: std_logic_vector(0 downto 0);
  signal recvByteOverSpi_return_reqs: std_logic_vector(0 downto 0);
  signal recvByteOverSpi_return_acks: std_logic_vector(0 downto 0);
  signal recvByteOverSpi_call_data: std_logic_vector(4 downto 0);
  signal recvByteOverSpi_call_tag: std_logic_vector(0 downto 0);
  signal recvByteOverSpi_return_data: std_logic_vector(7 downto 0);
  signal recvByteOverSpi_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module sendByteOverSpi
  component sendByteOverSpi is -- 
    generic (tag_length : integer); 
    port ( -- 
      dev_id : in  std_logic_vector(2 downto 0);
      byte_to_send : in  std_logic_vector(7 downto 0);
      deselect_start : in  std_logic_vector(1 downto 0);
      spi_master_stub_response_pipe_read_req : out  std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_read_ack : in   std_logic_vector(0 downto 0);
      spi_master_stub_response_pipe_read_data : in   std_logic_vector(7 downto 0);
      spi_master_stub_command_pipe_write_req : out  std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_write_ack : in   std_logic_vector(0 downto 0);
      spi_master_stub_command_pipe_write_data : out  std_logic_vector(15 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module sendByteOverSpi
  signal sendByteOverSpi_dev_id :  std_logic_vector(2 downto 0);
  signal sendByteOverSpi_byte_to_send :  std_logic_vector(7 downto 0);
  signal sendByteOverSpi_deselect_start :  std_logic_vector(1 downto 0);
  signal sendByteOverSpi_in_args    : std_logic_vector(12 downto 0);
  signal sendByteOverSpi_tag_in    : std_logic_vector(3 downto 0) := (others => '0');
  signal sendByteOverSpi_tag_out   : std_logic_vector(3 downto 0);
  signal sendByteOverSpi_start_req : std_logic;
  signal sendByteOverSpi_start_ack : std_logic;
  signal sendByteOverSpi_fin_req   : std_logic;
  signal sendByteOverSpi_fin_ack : std_logic;
  -- caller side aggregated signals for module sendByteOverSpi
  signal sendByteOverSpi_call_reqs: std_logic_vector(0 downto 0);
  signal sendByteOverSpi_call_acks: std_logic_vector(0 downto 0);
  signal sendByteOverSpi_return_reqs: std_logic_vector(0 downto 0);
  signal sendByteOverSpi_return_acks: std_logic_vector(0 downto 0);
  signal sendByteOverSpi_call_data: std_logic_vector(12 downto 0);
  signal sendByteOverSpi_call_tag: std_logic_vector(2 downto 0);
  signal sendByteOverSpi_return_tag: std_logic_vector(2 downto 0);
  -- aggregate signals for read from pipe AFB_SPI_FLASH_CTRL_REQUEST
  signal AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe AFB_SPI_FLASH_CTRL_RESPONSE
  signal AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe spi_master_stub_command
  signal spi_master_stub_command_pipe_write_data: std_logic_vector(31 downto 0);
  signal spi_master_stub_command_pipe_write_req: std_logic_vector(1 downto 0);
  signal spi_master_stub_command_pipe_write_ack: std_logic_vector(1 downto 0);
  -- aggregate signals for read from pipe spi_master_stub_response
  signal spi_master_stub_response_pipe_read_data: std_logic_vector(15 downto 0);
  signal spi_master_stub_response_pipe_read_req: std_logic_vector(1 downto 0);
  signal spi_master_stub_response_pipe_read_ack: std_logic_vector(1 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module fetchFromSpiFlash
  fetchFromSpiFlash_addr_24 <= fetchFromSpiFlash_in_args(23 downto 0);
  fetchFromSpiFlash_out_args <= fetchFromSpiFlash_ret_byte ;
  -- call arbiter for module fetchFromSpiFlash
  fetchFromSpiFlash_arbiter: SplitCallArbiter -- 
    generic map( --
      name => "SplitCallArbiter", num_reqs => 1,
      call_data_width => 24,
      return_data_width => 8,
      callee_tag_length => 1,
      caller_tag_length => 3--
    )
    port map(-- 
      call_reqs => fetchFromSpiFlash_call_reqs,
      call_acks => fetchFromSpiFlash_call_acks,
      return_reqs => fetchFromSpiFlash_return_reqs,
      return_acks => fetchFromSpiFlash_return_acks,
      call_data  => fetchFromSpiFlash_call_data,
      call_tag  => fetchFromSpiFlash_call_tag,
      return_tag  => fetchFromSpiFlash_return_tag,
      call_mtag => fetchFromSpiFlash_tag_in,
      return_mtag => fetchFromSpiFlash_tag_out,
      return_data =>fetchFromSpiFlash_return_data,
      call_mreq => fetchFromSpiFlash_start_req,
      call_mack => fetchFromSpiFlash_start_ack,
      return_mreq => fetchFromSpiFlash_fin_req,
      return_mack => fetchFromSpiFlash_fin_ack,
      call_mdata => fetchFromSpiFlash_in_args,
      return_mdata => fetchFromSpiFlash_out_args,
      clk => clk, 
      reset => reset --
    ); --
  fetchFromSpiFlash_instance:fetchFromSpiFlash-- 
    generic map(tag_length => 4)
    port map(-- 
      addr_24 => fetchFromSpiFlash_addr_24,
      ret_byte => fetchFromSpiFlash_ret_byte,
      start_req => fetchFromSpiFlash_start_req,
      start_ack => fetchFromSpiFlash_start_ack,
      fin_req => fetchFromSpiFlash_fin_req,
      fin_ack => fetchFromSpiFlash_fin_ack,
      clk => clk,
      reset => reset,
      sendByteOverSpi_call_reqs => sendByteOverSpi_call_reqs(0 downto 0),
      sendByteOverSpi_call_acks => sendByteOverSpi_call_acks(0 downto 0),
      sendByteOverSpi_call_data => sendByteOverSpi_call_data(12 downto 0),
      sendByteOverSpi_call_tag => sendByteOverSpi_call_tag(2 downto 0),
      sendByteOverSpi_return_reqs => sendByteOverSpi_return_reqs(0 downto 0),
      sendByteOverSpi_return_acks => sendByteOverSpi_return_acks(0 downto 0),
      sendByteOverSpi_return_tag => sendByteOverSpi_return_tag(2 downto 0),
      recvByteOverSpi_call_reqs => recvByteOverSpi_call_reqs(0 downto 0),
      recvByteOverSpi_call_acks => recvByteOverSpi_call_acks(0 downto 0),
      recvByteOverSpi_call_data => recvByteOverSpi_call_data(4 downto 0),
      recvByteOverSpi_call_tag => recvByteOverSpi_call_tag(0 downto 0),
      recvByteOverSpi_return_reqs => recvByteOverSpi_return_reqs(0 downto 0),
      recvByteOverSpi_return_acks => recvByteOverSpi_return_acks(0 downto 0),
      recvByteOverSpi_return_data => recvByteOverSpi_return_data(7 downto 0),
      recvByteOverSpi_return_tag => recvByteOverSpi_return_tag(0 downto 0),
      tag_in => fetchFromSpiFlash_tag_in,
      tag_out => fetchFromSpiFlash_tag_out-- 
    ); -- 
  -- module frontend_daemon
  frontend_daemon_instance:frontend_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => frontend_daemon_start_req,
      start_ack => frontend_daemon_start_ack,
      fin_req => frontend_daemon_fin_req,
      fin_ack => frontend_daemon_fin_ack,
      clk => clk,
      reset => reset,
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_req => AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_req(0 downto 0),
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_ack => AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_ack(0 downto 0),
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_data => AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_data(73 downto 0),
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_req => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_req(0 downto 0),
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_ack => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_ack(0 downto 0),
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_data => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_data(32 downto 0),
      fetchFromSpiFlash_call_reqs => fetchFromSpiFlash_call_reqs(0 downto 0),
      fetchFromSpiFlash_call_acks => fetchFromSpiFlash_call_acks(0 downto 0),
      fetchFromSpiFlash_call_data => fetchFromSpiFlash_call_data(23 downto 0),
      fetchFromSpiFlash_call_tag => fetchFromSpiFlash_call_tag(2 downto 0),
      fetchFromSpiFlash_return_reqs => fetchFromSpiFlash_return_reqs(0 downto 0),
      fetchFromSpiFlash_return_acks => fetchFromSpiFlash_return_acks(0 downto 0),
      fetchFromSpiFlash_return_data => fetchFromSpiFlash_return_data(7 downto 0),
      fetchFromSpiFlash_return_tag => fetchFromSpiFlash_return_tag(2 downto 0),
      tag_in => frontend_daemon_tag_in,
      tag_out => frontend_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  frontend_daemon_tag_in <= (others => '0');
  frontend_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => frontend_daemon_start_req, start_ack => frontend_daemon_start_ack,  fin_req => frontend_daemon_fin_req,  fin_ack => frontend_daemon_fin_ack);
  -- module recvByteOverSpi
  recvByteOverSpi_dev_id <= recvByteOverSpi_in_args(4 downto 2);
  recvByteOverSpi_deselect_start <= recvByteOverSpi_in_args(1 downto 0);
  recvByteOverSpi_out_args <= recvByteOverSpi_received_byte ;
  -- call arbiter for module recvByteOverSpi
  recvByteOverSpi_arbiter: SplitCallArbiter -- 
    generic map( --
      name => "SplitCallArbiter", num_reqs => 1,
      call_data_width => 5,
      return_data_width => 8,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => recvByteOverSpi_call_reqs,
      call_acks => recvByteOverSpi_call_acks,
      return_reqs => recvByteOverSpi_return_reqs,
      return_acks => recvByteOverSpi_return_acks,
      call_data  => recvByteOverSpi_call_data,
      call_tag  => recvByteOverSpi_call_tag,
      return_tag  => recvByteOverSpi_return_tag,
      call_mtag => recvByteOverSpi_tag_in,
      return_mtag => recvByteOverSpi_tag_out,
      return_data =>recvByteOverSpi_return_data,
      call_mreq => recvByteOverSpi_start_req,
      call_mack => recvByteOverSpi_start_ack,
      return_mreq => recvByteOverSpi_fin_req,
      return_mack => recvByteOverSpi_fin_ack,
      call_mdata => recvByteOverSpi_in_args,
      return_mdata => recvByteOverSpi_out_args,
      clk => clk, 
      reset => reset --
    ); --
  recvByteOverSpi_instance:recvByteOverSpi-- 
    generic map(tag_length => 2)
    port map(-- 
      dev_id => recvByteOverSpi_dev_id,
      deselect_start => recvByteOverSpi_deselect_start,
      received_byte => recvByteOverSpi_received_byte,
      start_req => recvByteOverSpi_start_req,
      start_ack => recvByteOverSpi_start_ack,
      fin_req => recvByteOverSpi_fin_req,
      fin_ack => recvByteOverSpi_fin_ack,
      clk => clk,
      reset => reset,
      spi_master_stub_response_pipe_read_req => spi_master_stub_response_pipe_read_req(0 downto 0),
      spi_master_stub_response_pipe_read_ack => spi_master_stub_response_pipe_read_ack(0 downto 0),
      spi_master_stub_response_pipe_read_data => spi_master_stub_response_pipe_read_data(7 downto 0),
      spi_master_stub_command_pipe_write_req => spi_master_stub_command_pipe_write_req(0 downto 0),
      spi_master_stub_command_pipe_write_ack => spi_master_stub_command_pipe_write_ack(0 downto 0),
      spi_master_stub_command_pipe_write_data => spi_master_stub_command_pipe_write_data(15 downto 0),
      tag_in => recvByteOverSpi_tag_in,
      tag_out => recvByteOverSpi_tag_out-- 
    ); -- 
  -- module sendByteOverSpi
  sendByteOverSpi_dev_id <= sendByteOverSpi_in_args(12 downto 10);
  sendByteOverSpi_byte_to_send <= sendByteOverSpi_in_args(9 downto 2);
  sendByteOverSpi_deselect_start <= sendByteOverSpi_in_args(1 downto 0);
  -- call arbiter for module sendByteOverSpi
  sendByteOverSpi_arbiter: SplitCallArbiterNoOutargs -- 
    generic map( --
      name => "SplitCallArbiterNoOutargs", num_reqs => 1,
      call_data_width => 13,
      callee_tag_length => 1,
      caller_tag_length => 3--
    )
    port map(-- 
      call_reqs => sendByteOverSpi_call_reqs,
      call_acks => sendByteOverSpi_call_acks,
      return_reqs => sendByteOverSpi_return_reqs,
      return_acks => sendByteOverSpi_return_acks,
      call_data  => sendByteOverSpi_call_data,
      call_tag  => sendByteOverSpi_call_tag,
      return_tag  => sendByteOverSpi_return_tag,
      call_mtag => sendByteOverSpi_tag_in,
      return_mtag => sendByteOverSpi_tag_out,
      call_mreq => sendByteOverSpi_start_req,
      call_mack => sendByteOverSpi_start_ack,
      return_mreq => sendByteOverSpi_fin_req,
      return_mack => sendByteOverSpi_fin_ack,
      call_mdata => sendByteOverSpi_in_args,
      clk => clk, 
      reset => reset --
    ); --
  sendByteOverSpi_instance:sendByteOverSpi-- 
    generic map(tag_length => 4)
    port map(-- 
      dev_id => sendByteOverSpi_dev_id,
      byte_to_send => sendByteOverSpi_byte_to_send,
      deselect_start => sendByteOverSpi_deselect_start,
      start_req => sendByteOverSpi_start_req,
      start_ack => sendByteOverSpi_start_ack,
      fin_req => sendByteOverSpi_fin_req,
      fin_ack => sendByteOverSpi_fin_ack,
      clk => clk,
      reset => reset,
      spi_master_stub_response_pipe_read_req => spi_master_stub_response_pipe_read_req(1 downto 1),
      spi_master_stub_response_pipe_read_ack => spi_master_stub_response_pipe_read_ack(1 downto 1),
      spi_master_stub_response_pipe_read_data => spi_master_stub_response_pipe_read_data(15 downto 8),
      spi_master_stub_command_pipe_write_req => spi_master_stub_command_pipe_write_req(1 downto 1),
      spi_master_stub_command_pipe_write_ack => spi_master_stub_command_pipe_write_ack(1 downto 1),
      spi_master_stub_command_pipe_write_data => spi_master_stub_command_pipe_write_data(31 downto 16),
      tag_in => sendByteOverSpi_tag_in,
      tag_out => sendByteOverSpi_tag_out-- 
    ); -- 
  AFB_SPI_FLASH_CTRL_REQUEST_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_SPI_FLASH_CTRL_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_req,
      read_ack => AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_ack,
      read_data => AFB_SPI_FLASH_CTRL_REQUEST_pipe_read_data,
      write_req => AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_req,
      write_ack => AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_ack,
      write_data => AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_SPI_FLASH_CTRL_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_SPI_FLASH_CTRL_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_req,
      read_ack => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_ack,
      read_data => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_data,
      write_req => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_req,
      write_ack => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_ack,
      write_data => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  spi_master_stub_command_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe spi_master_stub_command",
      num_reads => 1,
      num_writes => 2,
      data_width => 16,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => spi_master_stub_command_pipe_read_req,
      read_ack => spi_master_stub_command_pipe_read_ack,
      read_data => spi_master_stub_command_pipe_read_data,
      write_req => spi_master_stub_command_pipe_write_req,
      write_ack => spi_master_stub_command_pipe_write_ack,
      write_data => spi_master_stub_command_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  spi_master_stub_response_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe spi_master_stub_response",
      num_reads => 2,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => spi_master_stub_response_pipe_read_req,
      read_ack => spi_master_stub_response_pipe_read_ack,
      read_data => spi_master_stub_response_pipe_read_data,
      write_req => spi_master_stub_response_pipe_write_req,
      write_ack => spi_master_stub_response_pipe_write_ack,
      write_data => spi_master_stub_response_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- gated clock generators 
  -- 
end frontend_arch;
library ieee;
use ieee.std_logic_1164.all;
package afb_spi_flash_controller_Type_Package is -- 
  -- 
end package;
library ahir;
use ahir.BaseComponents.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-->>>>>
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_spi_flash_controller_Type_Package.all;
--<<<<<
-->>>>>
library GenericCoreAddOnLib;
library AjitCustom;
--<<<<<
entity afb_spi_flash_controller is -- 
  port( -- 
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
    spi_miso : in std_logic_vector(0 downto 0);
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    spi_clk : out std_logic_vector(0 downto 0);
    spi_cs_n : out std_logic_vector(7 downto 0);
    spi_mosi : out std_logic_vector(0 downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
end entity afb_spi_flash_controller;
architecture struct of afb_spi_flash_controller is -- 
  signal spi_master_stub_command_pipe_write_data: std_logic_vector(15 downto 0);
  signal spi_master_stub_command_pipe_write_req : std_logic_vector(0  downto 0);
  signal spi_master_stub_command_pipe_write_ack : std_logic_vector(0  downto 0);
  signal spi_master_stub_command_pipe_read_data: std_logic_vector(15 downto 0);
  signal spi_master_stub_command_pipe_read_req : std_logic_vector(0  downto 0);
  signal spi_master_stub_command_pipe_read_ack : std_logic_vector(0  downto 0);
  signal spi_master_stub_response_pipe_write_data: std_logic_vector(7 downto 0);
  signal spi_master_stub_response_pipe_write_req : std_logic_vector(0  downto 0);
  signal spi_master_stub_response_pipe_write_ack : std_logic_vector(0  downto 0);
  signal spi_master_stub_response_pipe_read_data: std_logic_vector(7 downto 0);
  signal spi_master_stub_response_pipe_read_req : std_logic_vector(0  downto 0);
  signal spi_master_stub_response_pipe_read_ack : std_logic_vector(0  downto 0);
  component frontend is -- 
    port( -- 
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      spi_master_stub_response_pipe_write_data : in std_logic_vector(7 downto 0);
      spi_master_stub_response_pipe_write_req  : in std_logic_vector(0  downto 0);
      spi_master_stub_response_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      spi_master_stub_command_pipe_read_data : out std_logic_vector(15 downto 0);
      spi_master_stub_command_pipe_read_req  : in std_logic_vector(0  downto 0);
      spi_master_stub_command_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for frontend_inst :  frontend -- 
    use entity GenericCoreAddOnLib.frontend; -- 
  --<<<<<
  component spi_master_stub is -- 
    port( -- 
      master_in_data_pipe_write_data : in std_logic_vector(15 downto 0);
      master_in_data_pipe_write_req  : in std_logic_vector(0  downto 0);
      master_in_data_pipe_write_ack  : out std_logic_vector(0  downto 0);
      spi_miso : in std_logic_vector(0 downto 0);
      master_out_data_pipe_read_data : out std_logic_vector(7 downto 0);
      master_out_data_pipe_read_req  : in std_logic_vector(0  downto 0);
      master_out_data_pipe_read_ack  : out std_logic_vector(0  downto 0);
      spi_clk : out std_logic_vector(0 downto 0);
      spi_cs_n : out std_logic_vector(7 downto 0);
      spi_mosi : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for stub_inst :  spi_master_stub -- 
    use entity AjitCustom.spi_master_stub; -- 
  --<<<<<
  -- 
begin -- 
  frontend_inst: frontend
  port map ( --
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_data => AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_data,
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_req => AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_req,
    AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_ack => AFB_SPI_FLASH_CTRL_REQUEST_pipe_write_ack,
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_data => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_data,
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_req => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_req,
    AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_ack => AFB_SPI_FLASH_CTRL_RESPONSE_pipe_read_ack,
    spi_master_stub_command_pipe_read_data => spi_master_stub_command_pipe_write_data,
    spi_master_stub_command_pipe_read_req => spi_master_stub_command_pipe_write_ack,
    spi_master_stub_command_pipe_read_ack => spi_master_stub_command_pipe_write_req,
    spi_master_stub_response_pipe_write_data => spi_master_stub_response_pipe_read_data,
    spi_master_stub_response_pipe_write_req => spi_master_stub_response_pipe_read_ack,
    spi_master_stub_response_pipe_write_ack => spi_master_stub_response_pipe_read_req,
    clk => clk, reset => reset 
    ); -- 
  stub_inst: spi_master_stub
  port map ( --
    master_in_data_pipe_write_data => spi_master_stub_command_pipe_read_data,
    master_in_data_pipe_write_req => spi_master_stub_command_pipe_read_ack,
    master_in_data_pipe_write_ack => spi_master_stub_command_pipe_read_req,
    master_out_data_pipe_read_data => spi_master_stub_response_pipe_write_data,
    master_out_data_pipe_read_req => spi_master_stub_response_pipe_write_ack,
    master_out_data_pipe_read_ack => spi_master_stub_response_pipe_write_req,
    spi_clk => spi_clk,
    spi_cs_n => spi_cs_n,
    spi_miso => spi_miso,
    spi_mosi => spi_mosi,
    clk => clk, reset => reset 
    ); -- 
  spi_master_stub_command_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe spi_master_stub_command",
      num_reads => 1,
      num_writes => 1,
      data_width => 16,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1 --
    )
    port map( -- 
      read_req => spi_master_stub_command_pipe_read_req,
      read_ack => spi_master_stub_command_pipe_read_ack,
      read_data => spi_master_stub_command_pipe_read_data,
      write_req => spi_master_stub_command_pipe_write_req,
      write_ack => spi_master_stub_command_pipe_write_ack,
      write_data => spi_master_stub_command_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  spi_master_stub_response_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe spi_master_stub_response",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 1 --
    )
    port map( -- 
      read_req => spi_master_stub_response_pipe_read_req,
      read_ack => spi_master_stub_response_pipe_read_ack,
      read_data => spi_master_stub_response_pipe_read_data,
      write_req => spi_master_stub_response_pipe_write_req,
      write_ack => spi_master_stub_response_pipe_write_ack,
      write_data => spi_master_stub_response_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end struct;
-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package afb_gpio_global_package is -- 
  constant default_mem_pool_base_address : std_logic_vector(0 downto 0) := "0";
  component afb_gpio is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      AFB_GPIO_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_GPIO_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_GPIO_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
      GPIO_AFB_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
      GPIO_AFB_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      GPIO_AFB_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      GPIO_DIN: in std_logic_vector(31 downto 0);
      GPIO_DOUT: out std_logic_vector(31 downto 0)); -- 
    -- 
  end component;
  -- 
end package afb_gpio_global_package;
-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_gpio_global_package.all;
entity afb_gpio_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    AFB_GPIO_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_GPIO_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_GPIO_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
    GPIO_DIN : in std_logic_vector(31 downto 0);
    GPIO_AFB_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
    GPIO_AFB_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
    GPIO_AFB_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
    GPIO_DOUT_pipe_write_req : out  std_logic_vector(0 downto 0);
    GPIO_DOUT_pipe_write_ack : in   std_logic_vector(0 downto 0);
    GPIO_DOUT_pipe_write_data : out  std_logic_vector(31 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity afb_gpio_daemon;
architecture afb_gpio_daemon_arch of afb_gpio_daemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal afb_gpio_daemon_CP_0_start: Boolean;
  signal afb_gpio_daemon_CP_0_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal phi_stmt_270_req_1 : boolean;
  signal phi_stmt_270_ack_0 : boolean;
  signal do_while_stmt_268_branch_req_0 : boolean;
  signal phi_stmt_270_req_0 : boolean;
  signal RPIPE_AFB_GPIO_REQUEST_272_inst_req_0 : boolean;
  signal RPIPE_AFB_GPIO_REQUEST_272_inst_ack_0 : boolean;
  signal RPIPE_AFB_GPIO_REQUEST_272_inst_req_1 : boolean;
  signal RPIPE_AFB_GPIO_REQUEST_272_inst_ack_1 : boolean;
  signal phi_stmt_274_req_0 : boolean;
  signal phi_stmt_274_req_1 : boolean;
  signal phi_stmt_274_ack_0 : boolean;
  signal next_write_reg_321_276_buf_req_0 : boolean;
  signal next_write_reg_321_276_buf_ack_0 : boolean;
  signal next_write_reg_321_276_buf_req_1 : boolean;
  signal next_write_reg_321_276_buf_ack_1 : boolean;
  signal phi_stmt_279_req_0 : boolean;
  signal phi_stmt_279_req_1 : boolean;
  signal phi_stmt_279_ack_0 : boolean;
  signal WPIPE_GPIO_DOUT_322_inst_req_0 : boolean;
  signal WPIPE_GPIO_DOUT_322_inst_ack_0 : boolean;
  signal WPIPE_GPIO_DOUT_322_inst_req_1 : boolean;
  signal WPIPE_GPIO_DOUT_322_inst_ack_1 : boolean;
  signal WPIPE_GPIO_AFB_RESPONSE_343_inst_req_0 : boolean;
  signal WPIPE_GPIO_AFB_RESPONSE_343_inst_ack_0 : boolean;
  signal WPIPE_GPIO_AFB_RESPONSE_343_inst_req_1 : boolean;
  signal WPIPE_GPIO_AFB_RESPONSE_343_inst_ack_1 : boolean;
  signal do_while_stmt_268_branch_ack_0 : boolean;
  signal do_while_stmt_268_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "afb_gpio_daemon_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  afb_gpio_daemon_CP_0_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "afb_gpio_daemon_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= afb_gpio_daemon_CP_0_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= afb_gpio_daemon_CP_0_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= afb_gpio_daemon_CP_0_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  afb_gpio_daemon_CP_0: Block -- control-path 
    signal afb_gpio_daemon_CP_0_elements: BooleanArray(82 downto 0);
    -- 
  begin -- 
    afb_gpio_daemon_CP_0_elements(0) <= afb_gpio_daemon_CP_0_start;
    afb_gpio_daemon_CP_0_symbol <= afb_gpio_daemon_CP_0_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_267/$entry
      -- CP-element group 0: 	 branch_block_stmt_267/branch_block_stmt_267__entry__
      -- CP-element group 0: 	 branch_block_stmt_267/do_while_stmt_268__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	82 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_267/$exit
      -- CP-element group 1: 	 branch_block_stmt_267/branch_block_stmt_267__exit__
      -- CP-element group 1: 	 branch_block_stmt_267/do_while_stmt_268__exit__
      -- 
    afb_gpio_daemon_CP_0_elements(1) <= afb_gpio_daemon_CP_0_elements(82);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_267/do_while_stmt_268/$entry
      -- CP-element group 2: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268__entry__
      -- 
    afb_gpio_daemon_CP_0_elements(2) <= afb_gpio_daemon_CP_0_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	82 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268__exit__
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_267/do_while_stmt_268/loop_back
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	81 
    -- CP-element group 5: 	80 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_267/do_while_stmt_268/condition_done
      -- CP-element group 5: 	 branch_block_stmt_267/do_while_stmt_268/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_267/do_while_stmt_268/loop_taken/$entry
      -- 
    afb_gpio_daemon_CP_0_elements(5) <= afb_gpio_daemon_CP_0_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	79 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_267/do_while_stmt_268/loop_body_done
      -- 
    afb_gpio_daemon_CP_0_elements(6) <= afb_gpio_daemon_CP_0_elements(79);
    -- CP-element group 7:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	59 
    -- CP-element group 7: 	42 
    -- CP-element group 7: 	21 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/back_edge_to_loop_body
      -- 
    afb_gpio_daemon_CP_0_elements(7) <= afb_gpio_daemon_CP_0_elements(4);
    -- CP-element group 8:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	61 
    -- CP-element group 8: 	23 
    -- CP-element group 8: 	44 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/first_time_through_loop_body
      -- 
    afb_gpio_daemon_CP_0_elements(8) <= afb_gpio_daemon_CP_0_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	56 
    -- CP-element group 9: 	55 
    -- CP-element group 9: 	78 
    -- CP-element group 9: 	37 
    -- CP-element group 9: 	36 
    -- CP-element group 9: 	16 
    -- CP-element group 9: 	15 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/loop_body_start
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	14 
    -- CP-element group 10: 	78 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/condition_evaluated
      -- 
    condition_evaluated_24_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_24_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(10), ack => do_while_stmt_268_branch_req_0); -- 
    afb_gpio_daemon_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(14) & afb_gpio_daemon_CP_0_elements(78);
      gj_afb_gpio_daemon_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	55 
    -- CP-element group 11: 	36 
    -- CP-element group 11: 	15 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	14 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	38 
    -- CP-element group 11: 	17 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/aggregated_phi_sample_req
      -- CP-element group 11: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_sample_start__ps
      -- 
    afb_gpio_daemon_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 15,1 => 15,2 => 15,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(55) & afb_gpio_daemon_CP_0_elements(36) & afb_gpio_daemon_CP_0_elements(15) & afb_gpio_daemon_CP_0_elements(14);
      gj_afb_gpio_daemon_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	57 
    -- CP-element group 12: 	39 
    -- CP-element group 12: 	18 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	79 
    -- CP-element group 12: marked-successors 
    -- CP-element group 12: 	55 
    -- CP-element group 12: 	36 
    -- CP-element group 12: 	15 
    -- CP-element group 12:  members (4) 
      -- CP-element group 12: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/aggregated_phi_sample_ack
      -- CP-element group 12: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_sample_completed_
      -- 
    afb_gpio_daemon_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 15,2 => 15);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(57) & afb_gpio_daemon_CP_0_elements(39) & afb_gpio_daemon_CP_0_elements(18);
      gj_afb_gpio_daemon_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	56 
    -- CP-element group 13: 	37 
    -- CP-element group 13: 	16 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	19 
    -- CP-element group 13: 	40 
    -- CP-element group 13:  members (2) 
      -- CP-element group 13: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/aggregated_phi_update_req
      -- CP-element group 13: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_update_start__ps
      -- 
    afb_gpio_daemon_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 15,2 => 15);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(56) & afb_gpio_daemon_CP_0_elements(37) & afb_gpio_daemon_CP_0_elements(16);
      gj_afb_gpio_daemon_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	58 
    -- CP-element group 14: 	41 
    -- CP-element group 14: 	20 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	10 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	11 
    -- CP-element group 14:  members (1) 
      -- CP-element group 14: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/aggregated_phi_update_ack
      -- 
    afb_gpio_daemon_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 15,2 => 15);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(58) & afb_gpio_daemon_CP_0_elements(41) & afb_gpio_daemon_CP_0_elements(20);
      gj_afb_gpio_daemon_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	9 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	12 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (1) 
      -- CP-element group 15: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_sample_start_
      -- 
    afb_gpio_daemon_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(9) & afb_gpio_daemon_CP_0_elements(12);
      gj_afb_gpio_daemon_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  join  transition  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	9 
    -- CP-element group 16: marked-predecessors 
    -- CP-element group 16: 	76 
    -- CP-element group 16: 	73 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (1) 
      -- CP-element group 16: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_update_start_
      -- 
    afb_gpio_daemon_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(9) & afb_gpio_daemon_CP_0_elements(76) & afb_gpio_daemon_CP_0_elements(73);
      gj_afb_gpio_daemon_cp_element_group_16 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	11 
    -- CP-element group 17: successors 
    -- CP-element group 17:  members (1) 
      -- CP-element group 17: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_sample_start__ps
      -- 
    afb_gpio_daemon_CP_0_elements(17) <= afb_gpio_daemon_CP_0_elements(11);
    -- CP-element group 18:  join  transition  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	12 
    -- CP-element group 18:  members (1) 
      -- CP-element group 18: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_sample_completed__ps
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(18) is bound as output of CP function.
    -- CP-element group 19:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	13 
    -- CP-element group 19: successors 
    -- CP-element group 19:  members (1) 
      -- CP-element group 19: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_update_start__ps
      -- 
    afb_gpio_daemon_CP_0_elements(19) <= afb_gpio_daemon_CP_0_elements(13);
    -- CP-element group 20:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	14 
    -- CP-element group 20: 	72 
    -- CP-element group 20: 	75 
    -- CP-element group 20:  members (2) 
      -- CP-element group 20: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_update_completed__ps
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(20) is bound as output of CP function.
    -- CP-element group 21:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	7 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (1) 
      -- CP-element group 21: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_loopback_trigger
      -- 
    afb_gpio_daemon_CP_0_elements(21) <= afb_gpio_daemon_CP_0_elements(7);
    -- CP-element group 22:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: successors 
    -- CP-element group 22:  members (2) 
      -- CP-element group 22: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_loopback_sample_req
      -- CP-element group 22: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_loopback_sample_req_ps
      -- 
    phi_stmt_270_loopback_sample_req_39_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_270_loopback_sample_req_39_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(22), ack => phi_stmt_270_req_0); -- 
    -- Element group afb_gpio_daemon_CP_0_elements(22) is bound as output of CP function.
    -- CP-element group 23:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	8 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (1) 
      -- CP-element group 23: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_entry_trigger
      -- 
    afb_gpio_daemon_CP_0_elements(23) <= afb_gpio_daemon_CP_0_elements(8);
    -- CP-element group 24:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: successors 
    -- CP-element group 24:  members (2) 
      -- CP-element group 24: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_entry_sample_req
      -- CP-element group 24: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_entry_sample_req_ps
      -- 
    phi_stmt_270_entry_sample_req_42_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_270_entry_sample_req_42_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(24), ack => phi_stmt_270_req_1); -- 
    -- Element group afb_gpio_daemon_CP_0_elements(24) is bound as output of CP function.
    -- CP-element group 25:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: successors 
    -- CP-element group 25:  members (2) 
      -- CP-element group 25: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_phi_mux_ack
      -- CP-element group 25: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_270_phi_mux_ack_ps
      -- 
    phi_stmt_270_phi_mux_ack_45_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 25_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_270_ack_0, ack => afb_gpio_daemon_CP_0_elements(25)); -- 
    -- CP-element group 26:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	28 
    -- CP-element group 26:  members (1) 
      -- CP-element group 26: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_sample_start__ps
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(26) is bound as output of CP function.
    -- CP-element group 27:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: successors 
    -- CP-element group 27: 	29 
    -- CP-element group 27:  members (1) 
      -- CP-element group 27: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_update_start__ps
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(27) is bound as output of CP function.
    -- CP-element group 28:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	26 
    -- CP-element group 28: marked-predecessors 
    -- CP-element group 28: 	31 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	30 
    -- CP-element group 28:  members (3) 
      -- CP-element group 28: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_sample_start_
      -- CP-element group 28: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_Sample/$entry
      -- CP-element group 28: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_Sample/rr
      -- 
    rr_58_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_58_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(28), ack => RPIPE_AFB_GPIO_REQUEST_272_inst_req_0); -- 
    afb_gpio_daemon_cp_element_group_28: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_28"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(26) & afb_gpio_daemon_CP_0_elements(31);
      gj_afb_gpio_daemon_cp_element_group_28 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(28), clk => clk, reset => reset); --
    end block;
    -- CP-element group 29:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	30 
    -- CP-element group 29: 	27 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (3) 
      -- CP-element group 29: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_update_start_
      -- CP-element group 29: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_Update/$entry
      -- CP-element group 29: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_Update/cr
      -- 
    cr_63_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_63_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(29), ack => RPIPE_AFB_GPIO_REQUEST_272_inst_req_1); -- 
    afb_gpio_daemon_cp_element_group_29: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_29"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(30) & afb_gpio_daemon_CP_0_elements(27);
      gj_afb_gpio_daemon_cp_element_group_29 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(29), clk => clk, reset => reset); --
    end block;
    -- CP-element group 30:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: 	28 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	29 
    -- CP-element group 30:  members (4) 
      -- CP-element group 30: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_sample_completed__ps
      -- CP-element group 30: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_sample_completed_
      -- CP-element group 30: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_Sample/$exit
      -- CP-element group 30: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_Sample/ra
      -- 
    ra_59_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 30_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_GPIO_REQUEST_272_inst_ack_0, ack => afb_gpio_daemon_CP_0_elements(30)); -- 
    -- CP-element group 31:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31: marked-successors 
    -- CP-element group 31: 	28 
    -- CP-element group 31:  members (4) 
      -- CP-element group 31: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_update_completed__ps
      -- CP-element group 31: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_update_completed_
      -- CP-element group 31: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_Update/$exit
      -- CP-element group 31: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/RPIPE_AFB_GPIO_REQUEST_272_Update/ca
      -- 
    ca_64_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 31_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_GPIO_REQUEST_272_inst_ack_1, ack => afb_gpio_daemon_CP_0_elements(31)); -- 
    -- CP-element group 32:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: successors 
    -- CP-element group 32:  members (4) 
      -- CP-element group 32: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/konst_273_sample_start__ps
      -- CP-element group 32: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/konst_273_sample_completed__ps
      -- CP-element group 32: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/konst_273_sample_start_
      -- CP-element group 32: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/konst_273_sample_completed_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(32) is bound as output of CP function.
    -- CP-element group 33:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	35 
    -- CP-element group 33:  members (2) 
      -- CP-element group 33: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/konst_273_update_start__ps
      -- CP-element group 33: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/konst_273_update_start_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(33) is bound as output of CP function.
    -- CP-element group 34:  join  transition  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	35 
    -- CP-element group 34: successors 
    -- CP-element group 34:  members (1) 
      -- CP-element group 34: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/konst_273_update_completed__ps
      -- 
    afb_gpio_daemon_CP_0_elements(34) <= afb_gpio_daemon_CP_0_elements(35);
    -- CP-element group 35:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	33 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	34 
    -- CP-element group 35:  members (1) 
      -- CP-element group 35: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/konst_273_update_completed_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(35) is a control-delay.
    cp_element_35_delay: control_delay_element  generic map(name => " 35_delay", delay_value => 1)  port map(req => afb_gpio_daemon_CP_0_elements(33), ack => afb_gpio_daemon_CP_0_elements(35), clk => clk, reset =>reset);
    -- CP-element group 36:  join  transition  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	9 
    -- CP-element group 36: marked-predecessors 
    -- CP-element group 36: 	12 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	11 
    -- CP-element group 36:  members (1) 
      -- CP-element group 36: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_sample_start_
      -- 
    afb_gpio_daemon_cp_element_group_36: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_36"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(9) & afb_gpio_daemon_CP_0_elements(12);
      gj_afb_gpio_daemon_cp_element_group_36 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(36), clk => clk, reset => reset); --
    end block;
    -- CP-element group 37:  join  transition  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	9 
    -- CP-element group 37: marked-predecessors 
    -- CP-element group 37: 	76 
    -- CP-element group 37: 	73 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	13 
    -- CP-element group 37:  members (1) 
      -- CP-element group 37: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_update_start_
      -- 
    afb_gpio_daemon_cp_element_group_37: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_37"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(9) & afb_gpio_daemon_CP_0_elements(76) & afb_gpio_daemon_CP_0_elements(73);
      gj_afb_gpio_daemon_cp_element_group_37 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(37), clk => clk, reset => reset); --
    end block;
    -- CP-element group 38:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	11 
    -- CP-element group 38: successors 
    -- CP-element group 38:  members (1) 
      -- CP-element group 38: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_sample_start__ps
      -- 
    afb_gpio_daemon_CP_0_elements(38) <= afb_gpio_daemon_CP_0_elements(11);
    -- CP-element group 39:  join  transition  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: successors 
    -- CP-element group 39: 	12 
    -- CP-element group 39:  members (1) 
      -- CP-element group 39: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_sample_completed__ps
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(39) is bound as output of CP function.
    -- CP-element group 40:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: 	13 
    -- CP-element group 40: successors 
    -- CP-element group 40:  members (1) 
      -- CP-element group 40: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_update_start__ps
      -- 
    afb_gpio_daemon_CP_0_elements(40) <= afb_gpio_daemon_CP_0_elements(13);
    -- CP-element group 41:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: successors 
    -- CP-element group 41: 	14 
    -- CP-element group 41: 	72 
    -- CP-element group 41: 	75 
    -- CP-element group 41:  members (2) 
      -- CP-element group 41: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_update_completed_
      -- CP-element group 41: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_update_completed__ps
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(41) is bound as output of CP function.
    -- CP-element group 42:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: 	7 
    -- CP-element group 42: successors 
    -- CP-element group 42:  members (1) 
      -- CP-element group 42: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_loopback_trigger
      -- 
    afb_gpio_daemon_CP_0_elements(42) <= afb_gpio_daemon_CP_0_elements(7);
    -- CP-element group 43:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: successors 
    -- CP-element group 43:  members (2) 
      -- CP-element group 43: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_loopback_sample_req
      -- CP-element group 43: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_loopback_sample_req_ps
      -- 
    phi_stmt_274_loopback_sample_req_83_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_274_loopback_sample_req_83_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(43), ack => phi_stmt_274_req_0); -- 
    -- Element group afb_gpio_daemon_CP_0_elements(43) is bound as output of CP function.
    -- CP-element group 44:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: 	8 
    -- CP-element group 44: successors 
    -- CP-element group 44:  members (1) 
      -- CP-element group 44: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_entry_trigger
      -- 
    afb_gpio_daemon_CP_0_elements(44) <= afb_gpio_daemon_CP_0_elements(8);
    -- CP-element group 45:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: successors 
    -- CP-element group 45:  members (2) 
      -- CP-element group 45: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_entry_sample_req
      -- CP-element group 45: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_entry_sample_req_ps
      -- 
    phi_stmt_274_entry_sample_req_86_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_274_entry_sample_req_86_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(45), ack => phi_stmt_274_req_1); -- 
    -- Element group afb_gpio_daemon_CP_0_elements(45) is bound as output of CP function.
    -- CP-element group 46:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: successors 
    -- CP-element group 46:  members (2) 
      -- CP-element group 46: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_phi_mux_ack
      -- CP-element group 46: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_274_phi_mux_ack_ps
      -- 
    phi_stmt_274_phi_mux_ack_89_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 46_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_274_ack_0, ack => afb_gpio_daemon_CP_0_elements(46)); -- 
    -- CP-element group 47:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: successors 
    -- CP-element group 47: 	49 
    -- CP-element group 47:  members (4) 
      -- CP-element group 47: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_sample_start__ps
      -- CP-element group 47: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_sample_start_
      -- CP-element group 47: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_Sample/$entry
      -- CP-element group 47: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_Sample/req
      -- 
    req_102_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_102_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(47), ack => next_write_reg_321_276_buf_req_0); -- 
    -- Element group afb_gpio_daemon_CP_0_elements(47) is bound as output of CP function.
    -- CP-element group 48:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: successors 
    -- CP-element group 48: 	50 
    -- CP-element group 48:  members (4) 
      -- CP-element group 48: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_update_start__ps
      -- CP-element group 48: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_update_start_
      -- CP-element group 48: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_Update/$entry
      -- CP-element group 48: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_Update/req
      -- 
    req_107_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_107_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(48), ack => next_write_reg_321_276_buf_req_1); -- 
    -- Element group afb_gpio_daemon_CP_0_elements(48) is bound as output of CP function.
    -- CP-element group 49:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: 	47 
    -- CP-element group 49: successors 
    -- CP-element group 49:  members (4) 
      -- CP-element group 49: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_sample_completed__ps
      -- CP-element group 49: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_sample_completed_
      -- CP-element group 49: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_Sample/$exit
      -- CP-element group 49: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_Sample/ack
      -- 
    ack_103_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 49_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => next_write_reg_321_276_buf_ack_0, ack => afb_gpio_daemon_CP_0_elements(49)); -- 
    -- CP-element group 50:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: 	48 
    -- CP-element group 50: successors 
    -- CP-element group 50:  members (4) 
      -- CP-element group 50: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_update_completed__ps
      -- CP-element group 50: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_update_completed_
      -- CP-element group 50: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_Update/$exit
      -- CP-element group 50: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/R_next_write_reg_276_Update/ack
      -- 
    ack_108_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 50_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => next_write_reg_321_276_buf_ack_1, ack => afb_gpio_daemon_CP_0_elements(50)); -- 
    -- CP-element group 51:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: successors 
    -- CP-element group 51:  members (4) 
      -- CP-element group 51: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_278_sample_start__ps
      -- CP-element group 51: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_278_sample_completed__ps
      -- CP-element group 51: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_278_sample_start_
      -- CP-element group 51: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_278_sample_completed_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(51) is bound as output of CP function.
    -- CP-element group 52:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 52: predecessors 
    -- CP-element group 52: successors 
    -- CP-element group 52: 	54 
    -- CP-element group 52:  members (2) 
      -- CP-element group 52: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_278_update_start__ps
      -- CP-element group 52: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_278_update_start_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(52) is bound as output of CP function.
    -- CP-element group 53:  join  transition  bypass  pipeline-parent 
    -- CP-element group 53: predecessors 
    -- CP-element group 53: 	54 
    -- CP-element group 53: successors 
    -- CP-element group 53:  members (1) 
      -- CP-element group 53: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_278_update_completed__ps
      -- 
    afb_gpio_daemon_CP_0_elements(53) <= afb_gpio_daemon_CP_0_elements(54);
    -- CP-element group 54:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 54: predecessors 
    -- CP-element group 54: 	52 
    -- CP-element group 54: successors 
    -- CP-element group 54: 	53 
    -- CP-element group 54:  members (1) 
      -- CP-element group 54: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_278_update_completed_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(54) is a control-delay.
    cp_element_54_delay: control_delay_element  generic map(name => " 54_delay", delay_value => 1)  port map(req => afb_gpio_daemon_CP_0_elements(52), ack => afb_gpio_daemon_CP_0_elements(54), clk => clk, reset =>reset);
    -- CP-element group 55:  join  transition  bypass  pipeline-parent 
    -- CP-element group 55: predecessors 
    -- CP-element group 55: 	9 
    -- CP-element group 55: marked-predecessors 
    -- CP-element group 55: 	12 
    -- CP-element group 55: successors 
    -- CP-element group 55: 	11 
    -- CP-element group 55:  members (1) 
      -- CP-element group 55: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_sample_start_
      -- 
    afb_gpio_daemon_cp_element_group_55: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_55"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(9) & afb_gpio_daemon_CP_0_elements(12);
      gj_afb_gpio_daemon_cp_element_group_55 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(55), clk => clk, reset => reset); --
    end block;
    -- CP-element group 56:  join  transition  bypass  pipeline-parent 
    -- CP-element group 56: predecessors 
    -- CP-element group 56: 	9 
    -- CP-element group 56: marked-predecessors 
    -- CP-element group 56: 	76 
    -- CP-element group 56: 	73 
    -- CP-element group 56: successors 
    -- CP-element group 56: 	13 
    -- CP-element group 56:  members (1) 
      -- CP-element group 56: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_update_start_
      -- 
    afb_gpio_daemon_cp_element_group_56: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_56"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(9) & afb_gpio_daemon_CP_0_elements(76) & afb_gpio_daemon_CP_0_elements(73);
      gj_afb_gpio_daemon_cp_element_group_56 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(56), clk => clk, reset => reset); --
    end block;
    -- CP-element group 57:  join  transition  bypass  pipeline-parent 
    -- CP-element group 57: predecessors 
    -- CP-element group 57: successors 
    -- CP-element group 57: 	12 
    -- CP-element group 57:  members (1) 
      -- CP-element group 57: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_sample_completed__ps
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(57) is bound as output of CP function.
    -- CP-element group 58:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 58: predecessors 
    -- CP-element group 58: successors 
    -- CP-element group 58: 	14 
    -- CP-element group 58: 	72 
    -- CP-element group 58: 	75 
    -- CP-element group 58:  members (2) 
      -- CP-element group 58: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_update_completed_
      -- CP-element group 58: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_update_completed__ps
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(58) is bound as output of CP function.
    -- CP-element group 59:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 59: predecessors 
    -- CP-element group 59: 	7 
    -- CP-element group 59: successors 
    -- CP-element group 59:  members (1) 
      -- CP-element group 59: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_loopback_trigger
      -- 
    afb_gpio_daemon_CP_0_elements(59) <= afb_gpio_daemon_CP_0_elements(7);
    -- CP-element group 60:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 60: predecessors 
    -- CP-element group 60: successors 
    -- CP-element group 60:  members (2) 
      -- CP-element group 60: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_loopback_sample_req
      -- CP-element group 60: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_loopback_sample_req_ps
      -- 
    phi_stmt_279_loopback_sample_req_127_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_279_loopback_sample_req_127_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(60), ack => phi_stmt_279_req_0); -- 
    -- Element group afb_gpio_daemon_CP_0_elements(60) is bound as output of CP function.
    -- CP-element group 61:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 61: predecessors 
    -- CP-element group 61: 	8 
    -- CP-element group 61: successors 
    -- CP-element group 61:  members (1) 
      -- CP-element group 61: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_entry_trigger
      -- 
    afb_gpio_daemon_CP_0_elements(61) <= afb_gpio_daemon_CP_0_elements(8);
    -- CP-element group 62:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 62: predecessors 
    -- CP-element group 62: successors 
    -- CP-element group 62:  members (2) 
      -- CP-element group 62: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_entry_sample_req
      -- CP-element group 62: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_entry_sample_req_ps
      -- 
    phi_stmt_279_entry_sample_req_130_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_279_entry_sample_req_130_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(62), ack => phi_stmt_279_req_1); -- 
    -- Element group afb_gpio_daemon_CP_0_elements(62) is bound as output of CP function.
    -- CP-element group 63:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 63: predecessors 
    -- CP-element group 63: successors 
    -- CP-element group 63:  members (2) 
      -- CP-element group 63: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_phi_mux_ack
      -- CP-element group 63: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/phi_stmt_279_phi_mux_ack_ps
      -- 
    phi_stmt_279_phi_mux_ack_133_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 63_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_279_ack_0, ack => afb_gpio_daemon_CP_0_elements(63)); -- 
    -- CP-element group 64:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 64: predecessors 
    -- CP-element group 64: successors 
    -- CP-element group 64:  members (4) 
      -- CP-element group 64: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_282_sample_start__ps
      -- CP-element group 64: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_282_sample_completed__ps
      -- CP-element group 64: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_282_sample_start_
      -- CP-element group 64: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_282_sample_completed_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(64) is bound as output of CP function.
    -- CP-element group 65:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 65: predecessors 
    -- CP-element group 65: successors 
    -- CP-element group 65: 	67 
    -- CP-element group 65:  members (2) 
      -- CP-element group 65: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_282_update_start__ps
      -- CP-element group 65: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_282_update_start_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(65) is bound as output of CP function.
    -- CP-element group 66:  join  transition  bypass  pipeline-parent 
    -- CP-element group 66: predecessors 
    -- CP-element group 66: 	67 
    -- CP-element group 66: successors 
    -- CP-element group 66:  members (1) 
      -- CP-element group 66: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_282_update_completed__ps
      -- 
    afb_gpio_daemon_CP_0_elements(66) <= afb_gpio_daemon_CP_0_elements(67);
    -- CP-element group 67:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 67: predecessors 
    -- CP-element group 67: 	65 
    -- CP-element group 67: successors 
    -- CP-element group 67: 	66 
    -- CP-element group 67:  members (1) 
      -- CP-element group 67: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_282_update_completed_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(67) is a control-delay.
    cp_element_67_delay: control_delay_element  generic map(name => " 67_delay", delay_value => 1)  port map(req => afb_gpio_daemon_CP_0_elements(65), ack => afb_gpio_daemon_CP_0_elements(67), clk => clk, reset =>reset);
    -- CP-element group 68:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 68: predecessors 
    -- CP-element group 68: successors 
    -- CP-element group 68:  members (4) 
      -- CP-element group 68: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_284_sample_start__ps
      -- CP-element group 68: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_284_sample_completed__ps
      -- CP-element group 68: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_284_sample_start_
      -- CP-element group 68: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_284_sample_completed_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(68) is bound as output of CP function.
    -- CP-element group 69:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 69: predecessors 
    -- CP-element group 69: successors 
    -- CP-element group 69: 	71 
    -- CP-element group 69:  members (2) 
      -- CP-element group 69: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_284_update_start__ps
      -- CP-element group 69: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_284_update_start_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(69) is bound as output of CP function.
    -- CP-element group 70:  join  transition  bypass  pipeline-parent 
    -- CP-element group 70: predecessors 
    -- CP-element group 70: 	71 
    -- CP-element group 70: successors 
    -- CP-element group 70:  members (1) 
      -- CP-element group 70: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_284_update_completed__ps
      -- 
    afb_gpio_daemon_CP_0_elements(70) <= afb_gpio_daemon_CP_0_elements(71);
    -- CP-element group 71:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 71: predecessors 
    -- CP-element group 71: 	69 
    -- CP-element group 71: successors 
    -- CP-element group 71: 	70 
    -- CP-element group 71:  members (1) 
      -- CP-element group 71: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/type_cast_284_update_completed_
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(71) is a control-delay.
    cp_element_71_delay: control_delay_element  generic map(name => " 71_delay", delay_value => 1)  port map(req => afb_gpio_daemon_CP_0_elements(69), ack => afb_gpio_daemon_CP_0_elements(71), clk => clk, reset =>reset);
    -- CP-element group 72:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 72: predecessors 
    -- CP-element group 72: 	58 
    -- CP-element group 72: 	41 
    -- CP-element group 72: 	20 
    -- CP-element group 72: marked-predecessors 
    -- CP-element group 72: 	74 
    -- CP-element group 72: successors 
    -- CP-element group 72: 	73 
    -- CP-element group 72:  members (3) 
      -- CP-element group 72: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_sample_start_
      -- CP-element group 72: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_Sample/$entry
      -- CP-element group 72: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_Sample/req
      -- 
    req_159_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_159_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(72), ack => WPIPE_GPIO_DOUT_322_inst_req_0); -- 
    afb_gpio_daemon_cp_element_group_72: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 15,1 => 15,2 => 15,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_72"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(58) & afb_gpio_daemon_CP_0_elements(41) & afb_gpio_daemon_CP_0_elements(20) & afb_gpio_daemon_CP_0_elements(74);
      gj_afb_gpio_daemon_cp_element_group_72 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(72), clk => clk, reset => reset); --
    end block;
    -- CP-element group 73:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 73: predecessors 
    -- CP-element group 73: 	72 
    -- CP-element group 73: successors 
    -- CP-element group 73: 	74 
    -- CP-element group 73: marked-successors 
    -- CP-element group 73: 	56 
    -- CP-element group 73: 	37 
    -- CP-element group 73: 	16 
    -- CP-element group 73:  members (6) 
      -- CP-element group 73: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_sample_completed_
      -- CP-element group 73: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_update_start_
      -- CP-element group 73: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_Sample/$exit
      -- CP-element group 73: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_Sample/ack
      -- CP-element group 73: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_Update/$entry
      -- CP-element group 73: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_Update/req
      -- 
    ack_160_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 73_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_GPIO_DOUT_322_inst_ack_0, ack => afb_gpio_daemon_CP_0_elements(73)); -- 
    req_164_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_164_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(73), ack => WPIPE_GPIO_DOUT_322_inst_req_1); -- 
    -- CP-element group 74:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 74: predecessors 
    -- CP-element group 74: 	73 
    -- CP-element group 74: successors 
    -- CP-element group 74: 	79 
    -- CP-element group 74: marked-successors 
    -- CP-element group 74: 	72 
    -- CP-element group 74:  members (3) 
      -- CP-element group 74: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_update_completed_
      -- CP-element group 74: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_Update/$exit
      -- CP-element group 74: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_DOUT_322_Update/ack
      -- 
    ack_165_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 74_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_GPIO_DOUT_322_inst_ack_1, ack => afb_gpio_daemon_CP_0_elements(74)); -- 
    -- CP-element group 75:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 75: predecessors 
    -- CP-element group 75: 	58 
    -- CP-element group 75: 	41 
    -- CP-element group 75: 	20 
    -- CP-element group 75: marked-predecessors 
    -- CP-element group 75: 	77 
    -- CP-element group 75: successors 
    -- CP-element group 75: 	76 
    -- CP-element group 75:  members (3) 
      -- CP-element group 75: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_sample_start_
      -- CP-element group 75: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_Sample/$entry
      -- CP-element group 75: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_Sample/req
      -- 
    req_173_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_173_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(75), ack => WPIPE_GPIO_AFB_RESPONSE_343_inst_req_0); -- 
    afb_gpio_daemon_cp_element_group_75: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 15,1 => 15,2 => 15,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_75"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(58) & afb_gpio_daemon_CP_0_elements(41) & afb_gpio_daemon_CP_0_elements(20) & afb_gpio_daemon_CP_0_elements(77);
      gj_afb_gpio_daemon_cp_element_group_75 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(75), clk => clk, reset => reset); --
    end block;
    -- CP-element group 76:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 76: predecessors 
    -- CP-element group 76: 	75 
    -- CP-element group 76: successors 
    -- CP-element group 76: 	77 
    -- CP-element group 76: marked-successors 
    -- CP-element group 76: 	56 
    -- CP-element group 76: 	37 
    -- CP-element group 76: 	16 
    -- CP-element group 76:  members (6) 
      -- CP-element group 76: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_sample_completed_
      -- CP-element group 76: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_update_start_
      -- CP-element group 76: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_Sample/$exit
      -- CP-element group 76: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_Sample/ack
      -- CP-element group 76: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_Update/$entry
      -- CP-element group 76: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_Update/req
      -- 
    ack_174_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 76_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_GPIO_AFB_RESPONSE_343_inst_ack_0, ack => afb_gpio_daemon_CP_0_elements(76)); -- 
    req_178_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_178_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_gpio_daemon_CP_0_elements(76), ack => WPIPE_GPIO_AFB_RESPONSE_343_inst_req_1); -- 
    -- CP-element group 77:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 77: predecessors 
    -- CP-element group 77: 	76 
    -- CP-element group 77: successors 
    -- CP-element group 77: 	79 
    -- CP-element group 77: marked-successors 
    -- CP-element group 77: 	75 
    -- CP-element group 77:  members (3) 
      -- CP-element group 77: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_update_completed_
      -- CP-element group 77: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_Update/$exit
      -- CP-element group 77: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/WPIPE_GPIO_AFB_RESPONSE_343_Update/ack
      -- 
    ack_179_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 77_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_GPIO_AFB_RESPONSE_343_inst_ack_1, ack => afb_gpio_daemon_CP_0_elements(77)); -- 
    -- CP-element group 78:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 78: predecessors 
    -- CP-element group 78: 	9 
    -- CP-element group 78: successors 
    -- CP-element group 78: 	10 
    -- CP-element group 78:  members (1) 
      -- CP-element group 78: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group afb_gpio_daemon_CP_0_elements(78) is a control-delay.
    cp_element_78_delay: control_delay_element  generic map(name => " 78_delay", delay_value => 1)  port map(req => afb_gpio_daemon_CP_0_elements(9), ack => afb_gpio_daemon_CP_0_elements(78), clk => clk, reset =>reset);
    -- CP-element group 79:  join  transition  bypass  pipeline-parent 
    -- CP-element group 79: predecessors 
    -- CP-element group 79: 	12 
    -- CP-element group 79: 	77 
    -- CP-element group 79: 	74 
    -- CP-element group 79: successors 
    -- CP-element group 79: 	6 
    -- CP-element group 79:  members (1) 
      -- CP-element group 79: 	 branch_block_stmt_267/do_while_stmt_268/do_while_stmt_268_loop_body/$exit
      -- 
    afb_gpio_daemon_cp_element_group_79: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 15,2 => 15);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 35) := "afb_gpio_daemon_cp_element_group_79"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_gpio_daemon_CP_0_elements(12) & afb_gpio_daemon_CP_0_elements(77) & afb_gpio_daemon_CP_0_elements(74);
      gj_afb_gpio_daemon_cp_element_group_79 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(79), clk => clk, reset => reset); --
    end block;
    -- CP-element group 80:  transition  input  bypass  pipeline-parent 
    -- CP-element group 80: predecessors 
    -- CP-element group 80: 	5 
    -- CP-element group 80: successors 
    -- CP-element group 80:  members (2) 
      -- CP-element group 80: 	 branch_block_stmt_267/do_while_stmt_268/loop_exit/$exit
      -- CP-element group 80: 	 branch_block_stmt_267/do_while_stmt_268/loop_exit/ack
      -- 
    ack_184_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 80_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_268_branch_ack_0, ack => afb_gpio_daemon_CP_0_elements(80)); -- 
    -- CP-element group 81:  transition  input  bypass  pipeline-parent 
    -- CP-element group 81: predecessors 
    -- CP-element group 81: 	5 
    -- CP-element group 81: successors 
    -- CP-element group 81:  members (2) 
      -- CP-element group 81: 	 branch_block_stmt_267/do_while_stmt_268/loop_taken/$exit
      -- CP-element group 81: 	 branch_block_stmt_267/do_while_stmt_268/loop_taken/ack
      -- 
    ack_188_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 81_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_268_branch_ack_1, ack => afb_gpio_daemon_CP_0_elements(81)); -- 
    -- CP-element group 82:  transition  bypass  pipeline-parent 
    -- CP-element group 82: predecessors 
    -- CP-element group 82: 	3 
    -- CP-element group 82: successors 
    -- CP-element group 82: 	1 
    -- CP-element group 82:  members (1) 
      -- CP-element group 82: 	 branch_block_stmt_267/do_while_stmt_268/$exit
      -- 
    afb_gpio_daemon_CP_0_elements(82) <= afb_gpio_daemon_CP_0_elements(3);
    afb_gpio_daemon_do_while_stmt_268_terminator_189: loop_terminator -- 
      generic map (name => " afb_gpio_daemon_do_while_stmt_268_terminator_189", max_iterations_in_flight =>15) 
      port map(loop_body_exit => afb_gpio_daemon_CP_0_elements(6),loop_continue => afb_gpio_daemon_CP_0_elements(81),loop_terminate => afb_gpio_daemon_CP_0_elements(80),loop_back => afb_gpio_daemon_CP_0_elements(4),loop_exit => afb_gpio_daemon_CP_0_elements(3),clk => clk, reset => reset); -- 
    phi_stmt_270_phi_seq_73_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= afb_gpio_daemon_CP_0_elements(21);
      afb_gpio_daemon_CP_0_elements(26)<= src_sample_reqs(0);
      src_sample_acks(0)  <= afb_gpio_daemon_CP_0_elements(30);
      afb_gpio_daemon_CP_0_elements(27)<= src_update_reqs(0);
      src_update_acks(0)  <= afb_gpio_daemon_CP_0_elements(31);
      afb_gpio_daemon_CP_0_elements(22) <= phi_mux_reqs(0);
      triggers(1)  <= afb_gpio_daemon_CP_0_elements(23);
      afb_gpio_daemon_CP_0_elements(32)<= src_sample_reqs(1);
      src_sample_acks(1)  <= afb_gpio_daemon_CP_0_elements(32);
      afb_gpio_daemon_CP_0_elements(33)<= src_update_reqs(1);
      src_update_acks(1)  <= afb_gpio_daemon_CP_0_elements(34);
      afb_gpio_daemon_CP_0_elements(24) <= phi_mux_reqs(1);
      phi_stmt_270_phi_seq_73 : phi_sequencer_v2-- 
        generic map (place_capacity => 15, ntriggers => 2, name => "phi_stmt_270_phi_seq_73") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => afb_gpio_daemon_CP_0_elements(17), 
          phi_sample_ack => afb_gpio_daemon_CP_0_elements(18), 
          phi_update_req => afb_gpio_daemon_CP_0_elements(19), 
          phi_update_ack => afb_gpio_daemon_CP_0_elements(20), 
          phi_mux_ack => afb_gpio_daemon_CP_0_elements(25), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_274_phi_seq_117_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= afb_gpio_daemon_CP_0_elements(42);
      afb_gpio_daemon_CP_0_elements(47)<= src_sample_reqs(0);
      src_sample_acks(0)  <= afb_gpio_daemon_CP_0_elements(49);
      afb_gpio_daemon_CP_0_elements(48)<= src_update_reqs(0);
      src_update_acks(0)  <= afb_gpio_daemon_CP_0_elements(50);
      afb_gpio_daemon_CP_0_elements(43) <= phi_mux_reqs(0);
      triggers(1)  <= afb_gpio_daemon_CP_0_elements(44);
      afb_gpio_daemon_CP_0_elements(51)<= src_sample_reqs(1);
      src_sample_acks(1)  <= afb_gpio_daemon_CP_0_elements(51);
      afb_gpio_daemon_CP_0_elements(52)<= src_update_reqs(1);
      src_update_acks(1)  <= afb_gpio_daemon_CP_0_elements(53);
      afb_gpio_daemon_CP_0_elements(45) <= phi_mux_reqs(1);
      phi_stmt_274_phi_seq_117 : phi_sequencer_v2-- 
        generic map (place_capacity => 15, ntriggers => 2, name => "phi_stmt_274_phi_seq_117") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => afb_gpio_daemon_CP_0_elements(38), 
          phi_sample_ack => afb_gpio_daemon_CP_0_elements(39), 
          phi_update_req => afb_gpio_daemon_CP_0_elements(40), 
          phi_update_ack => afb_gpio_daemon_CP_0_elements(41), 
          phi_mux_ack => afb_gpio_daemon_CP_0_elements(46), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_279_phi_seq_151_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= afb_gpio_daemon_CP_0_elements(59);
      afb_gpio_daemon_CP_0_elements(64)<= src_sample_reqs(0);
      src_sample_acks(0)  <= afb_gpio_daemon_CP_0_elements(64);
      afb_gpio_daemon_CP_0_elements(65)<= src_update_reqs(0);
      src_update_acks(0)  <= afb_gpio_daemon_CP_0_elements(66);
      afb_gpio_daemon_CP_0_elements(60) <= phi_mux_reqs(0);
      triggers(1)  <= afb_gpio_daemon_CP_0_elements(61);
      afb_gpio_daemon_CP_0_elements(68)<= src_sample_reqs(1);
      src_sample_acks(1)  <= afb_gpio_daemon_CP_0_elements(68);
      afb_gpio_daemon_CP_0_elements(69)<= src_update_reqs(1);
      src_update_acks(1)  <= afb_gpio_daemon_CP_0_elements(70);
      afb_gpio_daemon_CP_0_elements(62) <= phi_mux_reqs(1);
      phi_stmt_279_phi_seq_151 : phi_sequencer_v2-- 
        generic map (place_capacity => 15, ntriggers => 2, name => "phi_stmt_279_phi_seq_151") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => afb_gpio_daemon_CP_0_elements(11), 
          phi_sample_ack => afb_gpio_daemon_CP_0_elements(57), 
          phi_update_req => afb_gpio_daemon_CP_0_elements(13), 
          phi_update_ack => afb_gpio_daemon_CP_0_elements(58), 
          phi_mux_ack => afb_gpio_daemon_CP_0_elements(63), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_25_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= afb_gpio_daemon_CP_0_elements(7);
        preds(1)  <= afb_gpio_daemon_CP_0_elements(8);
        entry_tmerge_25 : transition_merge -- 
          generic map(name => " entry_tmerge_25")
          port map (preds => preds, symbol_out => afb_gpio_daemon_CP_0_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal AND_u1_u1_317_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u36_u1_315_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u36_u1_329_wire : std_logic_vector(0 downto 0);
    signal MUX_332_wire : std_logic_vector(31 downto 0);
    signal NOT_u1_u1_300_wire : std_logic_vector(0 downto 0);
    signal NOT_u1_u1_302_wire : std_logic_vector(0 downto 0);
    signal NOT_u1_u1_307_wire : std_logic_vector(0 downto 0);
    signal NOT_u1_u1_316_wire : std_logic_vector(0 downto 0);
    signal RPIPE_AFB_GPIO_REQUEST_272_wire : std_logic_vector(73 downto 0);
    signal RPIPE_GPIO_DIN_330_wire : std_logic_vector(31 downto 0);
    signal addr36_293 : std_logic_vector(35 downto 0);
    signal command_270 : std_logic_vector(73 downto 0);
    signal first_time_279 : std_logic_vector(0 downto 0);
    signal konst_273_wire_constant : std_logic_vector(73 downto 0);
    signal konst_314_wire_constant : std_logic_vector(35 downto 0);
    signal konst_328_wire_constant : std_logic_vector(35 downto 0);
    signal konst_333_wire_constant : std_logic_vector(31 downto 0);
    signal konst_347_wire_constant : std_logic_vector(0 downto 0);
    signal next_write_reg_321 : std_logic_vector(31 downto 0);
    signal next_write_reg_321_276_buffered : std_logic_vector(31 downto 0);
    signal read_data_335 : std_logic_vector(31 downto 0);
    signal read_flag_310 : std_logic_vector(0 downto 0);
    signal read_write_bar_289 : std_logic_vector(0 downto 0);
    signal resp_data_341 : std_logic_vector(32 downto 0);
    signal type_cast_278_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_282_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_284_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_338_wire_constant : std_logic_vector(0 downto 0);
    signal wdata_32_297 : std_logic_vector(31 downto 0);
    signal write_flag_304 : std_logic_vector(0 downto 0);
    signal write_reg_274 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    konst_273_wire_constant <= "00000000000000000000000000000000000000000000000000000000000000000000000000";
    konst_314_wire_constant <= "000000000000000000000000000000000010";
    konst_328_wire_constant <= "000000000000000000000000000000000010";
    konst_333_wire_constant <= "00000000000000000000000000000000";
    konst_347_wire_constant <= "1";
    type_cast_278_wire_constant <= "00000000000000000000000000000000";
    type_cast_282_wire_constant <= "1";
    type_cast_284_wire_constant <= "0";
    type_cast_338_wire_constant <= "0";
    phi_stmt_270: Block -- phi operator 
      signal idata: std_logic_vector(147 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= RPIPE_AFB_GPIO_REQUEST_272_wire & konst_273_wire_constant;
      req <= phi_stmt_270_req_0 & phi_stmt_270_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_270",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 74) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_270_ack_0,
          idata => idata,
          odata => command_270,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_270
    phi_stmt_274: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= next_write_reg_321_276_buffered & type_cast_278_wire_constant;
      req <= phi_stmt_274_req_0 & phi_stmt_274_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_274",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_274_ack_0,
          idata => idata,
          odata => write_reg_274,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_274
    phi_stmt_279: Block -- phi operator 
      signal idata: std_logic_vector(1 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_282_wire_constant & type_cast_284_wire_constant;
      req <= phi_stmt_279_req_0 & phi_stmt_279_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_279",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 1) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_279_ack_0,
          idata => idata,
          odata => first_time_279,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_279
    -- flow-through select operator MUX_320_inst
    next_write_reg_321 <= wdata_32_297 when (AND_u1_u1_317_wire(0) /=  '0') else write_reg_274;
    -- flow-through select operator MUX_332_inst
    MUX_332_wire <= RPIPE_GPIO_DIN_330_wire when (BITSEL_u36_u1_329_wire(0) /=  '0') else write_reg_274;
    -- flow-through select operator MUX_334_inst
    read_data_335 <= MUX_332_wire when (read_flag_310(0) /=  '0') else konst_333_wire_constant;
    -- flow-through slice operator slice_288_inst
    read_write_bar_289 <= command_270(72 downto 72);
    -- flow-through slice operator slice_292_inst
    addr36_293 <= command_270(67 downto 32);
    -- flow-through slice operator slice_296_inst
    wdata_32_297 <= command_270(31 downto 0);
    next_write_reg_321_276_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= next_write_reg_321_276_buf_req_0;
      next_write_reg_321_276_buf_ack_0<= wack(0);
      rreq(0) <= next_write_reg_321_276_buf_req_1;
      next_write_reg_321_276_buf_ack_1<= rack(0);
      next_write_reg_321_276_buf : InterlockBuffer generic map ( -- 
        name => "next_write_reg_321_276_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 32,
        out_data_width => 32,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => next_write_reg_321,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => next_write_reg_321_276_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    do_while_stmt_268_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_347_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_268_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_268_branch_req_0,
          ack0 => do_while_stmt_268_branch_ack_0,
          ack1 => do_while_stmt_268_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator AND_u1_u1_303_inst
    process(NOT_u1_u1_300_wire, NOT_u1_u1_302_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(NOT_u1_u1_300_wire, NOT_u1_u1_302_wire, tmp_var);
      write_flag_304 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_309_inst
    process(NOT_u1_u1_307_wire, read_write_bar_289) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(NOT_u1_u1_307_wire, read_write_bar_289, tmp_var);
      read_flag_310 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_317_inst
    process(write_flag_304, NOT_u1_u1_316_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(write_flag_304, NOT_u1_u1_316_wire, tmp_var);
      AND_u1_u1_317_wire <= tmp_var; --
    end process;
    -- binary operator BITSEL_u36_u1_315_inst
    process(addr36_293) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(addr36_293, konst_314_wire_constant, tmp_var);
      BITSEL_u36_u1_315_wire <= tmp_var; --
    end process;
    -- binary operator BITSEL_u36_u1_329_inst
    process(addr36_293) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(addr36_293, konst_328_wire_constant, tmp_var);
      BITSEL_u36_u1_329_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u1_u33_340_inst
    process(type_cast_338_wire_constant, read_data_335) -- 
      variable tmp_var : std_logic_vector(32 downto 0); -- 
    begin -- 
      ApConcat_proc(type_cast_338_wire_constant, read_data_335, tmp_var);
      resp_data_341 <= tmp_var; --
    end process;
    -- unary operator NOT_u1_u1_300_inst
    process(first_time_279) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", first_time_279, tmp_var);
      NOT_u1_u1_300_wire <= tmp_var; -- 
    end process;
    -- unary operator NOT_u1_u1_302_inst
    process(read_write_bar_289) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", read_write_bar_289, tmp_var);
      NOT_u1_u1_302_wire <= tmp_var; -- 
    end process;
    -- unary operator NOT_u1_u1_307_inst
    process(first_time_279) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", first_time_279, tmp_var);
      NOT_u1_u1_307_wire <= tmp_var; -- 
    end process;
    -- unary operator NOT_u1_u1_316_inst
    process(BITSEL_u36_u1_315_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", BITSEL_u36_u1_315_wire, tmp_var);
      NOT_u1_u1_316_wire <= tmp_var; -- 
    end process;
    -- shared inport operator group (0) : RPIPE_AFB_GPIO_REQUEST_272_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_GPIO_REQUEST_272_inst_req_0;
      RPIPE_AFB_GPIO_REQUEST_272_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_GPIO_REQUEST_272_inst_req_1;
      RPIPE_AFB_GPIO_REQUEST_272_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      RPIPE_AFB_GPIO_REQUEST_272_wire <= data_out(73 downto 0);
      AFB_GPIO_REQUEST_read_0_gI: SplitGuardInterface generic map(name => "AFB_GPIO_REQUEST_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_GPIO_REQUEST_read_0: InputPortRevised -- 
        generic map ( name => "AFB_GPIO_REQUEST_read_0", data_width => 74,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => AFB_GPIO_REQUEST_pipe_read_req(0),
          oack => AFB_GPIO_REQUEST_pipe_read_ack(0),
          odata => AFB_GPIO_REQUEST_pipe_read_data(73 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- read from input-signal GPIO_DIN
    RPIPE_GPIO_DIN_330_wire <= GPIO_DIN;
    -- shared outport operator group (0) : WPIPE_GPIO_AFB_RESPONSE_343_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(32 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_GPIO_AFB_RESPONSE_343_inst_req_0;
      WPIPE_GPIO_AFB_RESPONSE_343_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_GPIO_AFB_RESPONSE_343_inst_req_1;
      WPIPE_GPIO_AFB_RESPONSE_343_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  not first_time_279(0);
      data_in <= resp_data_341;
      GPIO_AFB_RESPONSE_write_0_gI: SplitGuardInterface generic map(name => "GPIO_AFB_RESPONSE_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      GPIO_AFB_RESPONSE_write_0: OutputPortRevised -- 
        generic map ( name => "GPIO_AFB_RESPONSE", data_width => 33, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => GPIO_AFB_RESPONSE_pipe_write_req(0),
          oack => GPIO_AFB_RESPONSE_pipe_write_ack(0),
          odata => GPIO_AFB_RESPONSE_pipe_write_data(32 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared outport operator group (1) : WPIPE_GPIO_DOUT_322_inst 
    OutportGroup_1: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_GPIO_DOUT_322_inst_req_0;
      WPIPE_GPIO_DOUT_322_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_GPIO_DOUT_322_inst_req_1;
      WPIPE_GPIO_DOUT_322_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= next_write_reg_321;
      GPIO_DOUT_write_1_gI: SplitGuardInterface generic map(name => "GPIO_DOUT_write_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      GPIO_DOUT_write_1: OutputPortRevised -- 
        generic map ( name => "GPIO_DOUT", data_width => 32, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => GPIO_DOUT_pipe_write_req(0),
          oack => GPIO_DOUT_pipe_write_ack(0),
          odata => GPIO_DOUT_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
    -- 
  end Block; -- data_path
  -- 
end afb_gpio_daemon_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_gpio_global_package.all;
entity afb_gpio is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_GPIO_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_GPIO_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_GPIO_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    GPIO_AFB_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    GPIO_AFB_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    GPIO_AFB_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    GPIO_DIN: in std_logic_vector(31 downto 0);
    GPIO_DOUT: out std_logic_vector(31 downto 0)); -- 
  -- 
end entity; 
architecture afb_gpio_arch  of afb_gpio is -- system-architecture 
  -- interface signals to connect to memory space memory_space_1
  -- declarations related to module afb_gpio_daemon
  component afb_gpio_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      AFB_GPIO_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_GPIO_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_GPIO_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
      GPIO_DIN : in std_logic_vector(31 downto 0);
      GPIO_AFB_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
      GPIO_AFB_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
      GPIO_AFB_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
      GPIO_DOUT_pipe_write_req : out  std_logic_vector(0 downto 0);
      GPIO_DOUT_pipe_write_ack : in   std_logic_vector(0 downto 0);
      GPIO_DOUT_pipe_write_data : out  std_logic_vector(31 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module afb_gpio_daemon
  signal afb_gpio_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal afb_gpio_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal afb_gpio_daemon_start_req : std_logic;
  signal afb_gpio_daemon_start_ack : std_logic;
  signal afb_gpio_daemon_fin_req   : std_logic;
  signal afb_gpio_daemon_fin_ack : std_logic;
  -- aggregate signals for read from pipe AFB_GPIO_REQUEST
  signal AFB_GPIO_REQUEST_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_GPIO_REQUEST_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_GPIO_REQUEST_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe GPIO_AFB_RESPONSE
  signal GPIO_AFB_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal GPIO_AFB_RESPONSE_pipe_write_req: std_logic_vector(0 downto 0);
  signal GPIO_AFB_RESPONSE_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe GPIO_DOUT
  signal GPIO_DOUT_pipe_write_data: std_logic_vector(31 downto 0);
  signal GPIO_DOUT_pipe_write_req: std_logic_vector(0 downto 0);
  signal GPIO_DOUT_pipe_write_ack: std_logic_vector(0 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module afb_gpio_daemon
  afb_gpio_daemon_instance:afb_gpio_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => afb_gpio_daemon_start_req,
      start_ack => afb_gpio_daemon_start_ack,
      fin_req => afb_gpio_daemon_fin_req,
      fin_ack => afb_gpio_daemon_fin_ack,
      clk => clk,
      reset => reset,
      AFB_GPIO_REQUEST_pipe_read_req => AFB_GPIO_REQUEST_pipe_read_req(0 downto 0),
      AFB_GPIO_REQUEST_pipe_read_ack => AFB_GPIO_REQUEST_pipe_read_ack(0 downto 0),
      AFB_GPIO_REQUEST_pipe_read_data => AFB_GPIO_REQUEST_pipe_read_data(73 downto 0),
      GPIO_DIN => GPIO_DIN,
      GPIO_AFB_RESPONSE_pipe_write_req => GPIO_AFB_RESPONSE_pipe_write_req(0 downto 0),
      GPIO_AFB_RESPONSE_pipe_write_ack => GPIO_AFB_RESPONSE_pipe_write_ack(0 downto 0),
      GPIO_AFB_RESPONSE_pipe_write_data => GPIO_AFB_RESPONSE_pipe_write_data(32 downto 0),
      GPIO_DOUT_pipe_write_req => GPIO_DOUT_pipe_write_req(0 downto 0),
      GPIO_DOUT_pipe_write_ack => GPIO_DOUT_pipe_write_ack(0 downto 0),
      GPIO_DOUT_pipe_write_data => GPIO_DOUT_pipe_write_data(31 downto 0),
      tag_in => afb_gpio_daemon_tag_in,
      tag_out => afb_gpio_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  afb_gpio_daemon_tag_in <= (others => '0');
  afb_gpio_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => afb_gpio_daemon_start_req, start_ack => afb_gpio_daemon_start_ack,  fin_req => afb_gpio_daemon_fin_req,  fin_ack => afb_gpio_daemon_fin_ack);
  AFB_GPIO_REQUEST_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_GPIO_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_GPIO_REQUEST_pipe_read_req,
      read_ack => AFB_GPIO_REQUEST_pipe_read_ack,
      read_data => AFB_GPIO_REQUEST_pipe_read_data,
      write_req => AFB_GPIO_REQUEST_pipe_write_req,
      write_ack => AFB_GPIO_REQUEST_pipe_write_ack,
      write_data => AFB_GPIO_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  GPIO_AFB_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe GPIO_AFB_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => GPIO_AFB_RESPONSE_pipe_read_req,
      read_ack => GPIO_AFB_RESPONSE_pipe_read_ack,
      read_data => GPIO_AFB_RESPONSE_pipe_read_data,
      write_req => GPIO_AFB_RESPONSE_pipe_write_req,
      write_ack => GPIO_AFB_RESPONSE_pipe_write_ack,
      write_data => GPIO_AFB_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- input signal-pipe GPIO_DIN accessed directly. 
  GPIO_DOUT_Signal: SignalBase -- 
    generic map( -- 
      name => "pipe GPIO_DOUT",
      volatile_flag => false,
      num_writes => 1,
      data_width => 32 --
    ) 
    port map( -- 
      read_data => GPIO_DOUT,
      write_req => GPIO_DOUT_pipe_write_req,
      write_ack => GPIO_DOUT_pipe_write_ack,
      write_data => GPIO_DOUT_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- gated clock generators 
  -- 
end afb_gpio_arch;
-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package afb_mux_global_package is -- 
  constant default_mem_pool_base_address : std_logic_vector(0 downto 0) := "0";
  component afb_mux is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      AFB_BUS_REQUEST_pipe_read_data: out std_logic_vector(73 downto 0);
      AFB_BUS_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_REQUEST_0_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_REQUEST_0_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_REQUEST_0_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_REQUEST_1_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_REQUEST_1_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_REQUEST_1_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_RESPONSE_0_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_RESPONSE_0_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_RESPONSE_0_pipe_read_ack : out std_logic_vector(0 downto 0);
      AFB_RESPONSE_1_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_RESPONSE_1_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_RESPONSE_1_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  -- 
end package afb_mux_global_package;
-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_mux_global_package.all;
entity accessAfbMain is -- 
  generic (tag_length : integer); 
  port ( -- 
    req : in  std_logic_vector(73 downto 0);
    resp : out  std_logic_vector(32 downto 0);
    AFB_BUS_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
    AFB_BUS_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_write_data : out  std_logic_vector(73 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity accessAfbMain;
architecture accessAfbMain_arch of accessAfbMain is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 74)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 33)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  signal req_buffer :  std_logic_vector(73 downto 0);
  signal req_update_enable: Boolean;
  -- output port buffer signals
  signal resp_buffer :  std_logic_vector(32 downto 0);
  signal resp_update_enable: Boolean;
  signal accessAfbMain_CP_0_start: Boolean;
  signal accessAfbMain_CP_0_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal WPIPE_AFB_BUS_REQUEST_149_inst_req_0 : boolean;
  signal WPIPE_AFB_BUS_REQUEST_149_inst_ack_0 : boolean;
  signal WPIPE_AFB_BUS_REQUEST_149_inst_req_1 : boolean;
  signal WPIPE_AFB_BUS_REQUEST_149_inst_ack_1 : boolean;
  signal RPIPE_AFB_BUS_RESPONSE_153_inst_req_0 : boolean;
  signal RPIPE_AFB_BUS_RESPONSE_153_inst_ack_0 : boolean;
  signal RPIPE_AFB_BUS_RESPONSE_153_inst_req_1 : boolean;
  signal RPIPE_AFB_BUS_RESPONSE_153_inst_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "accessAfbMain_input_buffer", -- 
      buffer_size => 0,
      bypass_flag => true,
      data_width => tag_length + 74) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(73 downto 0) <= req;
  req_buffer <= in_buffer_data_out(73 downto 0);
  in_buffer_data_in(tag_length + 73 downto 74) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 73 downto 74);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 1,2 => 15);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 15);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= req_update_enable & in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  accessAfbMain_CP_0_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "accessAfbMain_out_buffer", -- 
      buffer_size => 0,
      full_rate => false,
      data_width => tag_length + 33) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(32 downto 0) <= resp_buffer;
  resp <= out_buffer_data_out(32 downto 0);
  out_buffer_data_in(tag_length + 32 downto 33) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length + 32 downto 33);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 1,2 => 15);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= accessAfbMain_CP_0_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  resp_update_enable_join: block -- 
    constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
    constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
    constant place_delays: IntegerArray(0 to 0) := (0 => 0);
    constant joinName: string(1 to 23) := "resp_update_enable_join"; 
    signal preds: BooleanArray(1 to 1); -- 
  begin -- 
    preds(1) <= out_buffer_write_ack_symbol;
    gj_resp_update_enable_join : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => resp_update_enable, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 15,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= accessAfbMain_CP_0_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 15,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= accessAfbMain_CP_0_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  accessAfbMain_CP_0: Block -- control-path 
    signal accessAfbMain_CP_0_elements: BooleanArray(14 downto 0);
    -- 
  begin -- 
    accessAfbMain_CP_0_elements(0) <= accessAfbMain_CP_0_start;
    accessAfbMain_CP_0_symbol <= accessAfbMain_CP_0_elements(14);
    -- CP-element group 0:  transition  bypass  pipeline-parent 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	1 
    -- CP-element group 0:  members (1) 
      -- CP-element group 0: 	 $entry
      -- 
    -- CP-element group 1:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	0 
    -- CP-element group 1: successors 
    -- CP-element group 1: 	4 
    -- CP-element group 1: 	7 
    -- CP-element group 1:  members (1) 
      -- CP-element group 1: 	 assign_stmt_151_to_assign_stmt_154/$entry
      -- 
    accessAfbMain_CP_0_elements(1) <= accessAfbMain_CP_0_elements(0);
    -- CP-element group 2:  join  transition  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: marked-predecessors 
    -- CP-element group 2: 	5 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	12 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 assign_stmt_151_to_assign_stmt_154/req_update_enable
      -- CP-element group 2: 	 assign_stmt_151_to_assign_stmt_154/req_update_enable_out
      -- 
    accessAfbMain_cp_element_group_2: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 32) := "accessAfbMain_cp_element_group_2"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= accessAfbMain_CP_0_elements(5);
      gj_accessAfbMain_cp_element_group_2 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => accessAfbMain_CP_0_elements(2), clk => clk, reset => reset); --
    end block;
    -- CP-element group 3:  transition  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	13 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	8 
    -- CP-element group 3:  members (2) 
      -- CP-element group 3: 	 assign_stmt_151_to_assign_stmt_154/resp_update_enable
      -- CP-element group 3: 	 assign_stmt_151_to_assign_stmt_154/resp_update_enable_in
      -- 
    accessAfbMain_CP_0_elements(3) <= accessAfbMain_CP_0_elements(13);
    -- CP-element group 4:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	1 
    -- CP-element group 4: marked-predecessors 
    -- CP-element group 4: 	6 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	5 
    -- CP-element group 4:  members (3) 
      -- CP-element group 4: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_sample_start_
      -- CP-element group 4: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_Sample/$entry
      -- CP-element group 4: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_Sample/req
      -- 
    req_17_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_17_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => accessAfbMain_CP_0_elements(4), ack => WPIPE_AFB_BUS_REQUEST_149_inst_req_0); -- 
    accessAfbMain_cp_element_group_4: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "accessAfbMain_cp_element_group_4"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= accessAfbMain_CP_0_elements(1) & accessAfbMain_CP_0_elements(6);
      gj_accessAfbMain_cp_element_group_4 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => accessAfbMain_CP_0_elements(4), clk => clk, reset => reset); --
    end block;
    -- CP-element group 5:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	4 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	6 
    -- CP-element group 5: marked-successors 
    -- CP-element group 5: 	2 
    -- CP-element group 5:  members (6) 
      -- CP-element group 5: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_sample_completed_
      -- CP-element group 5: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_update_start_
      -- CP-element group 5: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_Sample/$exit
      -- CP-element group 5: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_Sample/ack
      -- CP-element group 5: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_Update/$entry
      -- CP-element group 5: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_Update/req
      -- 
    ack_18_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_BUS_REQUEST_149_inst_ack_0, ack => accessAfbMain_CP_0_elements(5)); -- 
    req_22_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_22_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => accessAfbMain_CP_0_elements(5), ack => WPIPE_AFB_BUS_REQUEST_149_inst_req_1); -- 
    -- CP-element group 6:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	5 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	11 
    -- CP-element group 6: marked-successors 
    -- CP-element group 6: 	4 
    -- CP-element group 6:  members (3) 
      -- CP-element group 6: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_update_completed_
      -- CP-element group 6: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_Update/$exit
      -- CP-element group 6: 	 assign_stmt_151_to_assign_stmt_154/WPIPE_AFB_BUS_REQUEST_149_Update/ack
      -- 
    ack_23_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 6_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_BUS_REQUEST_149_inst_ack_1, ack => accessAfbMain_CP_0_elements(6)); -- 
    -- CP-element group 7:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	1 
    -- CP-element group 7: marked-predecessors 
    -- CP-element group 7: 	10 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	9 
    -- CP-element group 7:  members (3) 
      -- CP-element group 7: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_sample_start_
      -- CP-element group 7: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_Sample/$entry
      -- CP-element group 7: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_Sample/rr
      -- 
    rr_31_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_31_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => accessAfbMain_CP_0_elements(7), ack => RPIPE_AFB_BUS_RESPONSE_153_inst_req_0); -- 
    accessAfbMain_cp_element_group_7: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "accessAfbMain_cp_element_group_7"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= accessAfbMain_CP_0_elements(1) & accessAfbMain_CP_0_elements(10);
      gj_accessAfbMain_cp_element_group_7 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => accessAfbMain_CP_0_elements(7), clk => clk, reset => reset); --
    end block;
    -- CP-element group 8:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	3 
    -- CP-element group 8: 	9 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	10 
    -- CP-element group 8:  members (3) 
      -- CP-element group 8: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_update_start_
      -- CP-element group 8: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_Update/$entry
      -- CP-element group 8: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_Update/cr
      -- 
    cr_36_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_36_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => accessAfbMain_CP_0_elements(8), ack => RPIPE_AFB_BUS_RESPONSE_153_inst_req_1); -- 
    accessAfbMain_cp_element_group_8: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "accessAfbMain_cp_element_group_8"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= accessAfbMain_CP_0_elements(3) & accessAfbMain_CP_0_elements(9);
      gj_accessAfbMain_cp_element_group_8 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => accessAfbMain_CP_0_elements(8), clk => clk, reset => reset); --
    end block;
    -- CP-element group 9:  transition  input  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	7 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	8 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_sample_completed_
      -- CP-element group 9: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_Sample/$exit
      -- CP-element group 9: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_Sample/ra
      -- 
    ra_32_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 9_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_BUS_RESPONSE_153_inst_ack_0, ack => accessAfbMain_CP_0_elements(9)); -- 
    -- CP-element group 10:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	8 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	11 
    -- CP-element group 10: marked-successors 
    -- CP-element group 10: 	7 
    -- CP-element group 10:  members (3) 
      -- CP-element group 10: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_update_completed_
      -- CP-element group 10: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_Update/$exit
      -- CP-element group 10: 	 assign_stmt_151_to_assign_stmt_154/RPIPE_AFB_BUS_RESPONSE_153_Update/ca
      -- 
    ca_37_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 10_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_BUS_RESPONSE_153_inst_ack_1, ack => accessAfbMain_CP_0_elements(10)); -- 
    -- CP-element group 11:  join  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	10 
    -- CP-element group 11: 	6 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	14 
    -- CP-element group 11:  members (1) 
      -- CP-element group 11: 	 assign_stmt_151_to_assign_stmt_154/$exit
      -- 
    accessAfbMain_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 33) := "accessAfbMain_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= accessAfbMain_CP_0_elements(10) & accessAfbMain_CP_0_elements(6);
      gj_accessAfbMain_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => accessAfbMain_CP_0_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  place  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	2 
    -- CP-element group 12: successors 
    -- CP-element group 12:  members (1) 
      -- CP-element group 12: 	 req_update_enable
      -- 
    accessAfbMain_CP_0_elements(12) <= accessAfbMain_CP_0_elements(2);
    -- CP-element group 13:  place  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	3 
    -- CP-element group 13:  members (1) 
      -- CP-element group 13: 	 resp_update_enable
      -- 
    -- CP-element group 14:  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	11 
    -- CP-element group 14: successors 
    -- CP-element group 14:  members (1) 
      -- CP-element group 14: 	 $exit
      -- 
    accessAfbMain_CP_0_elements(14) <= accessAfbMain_CP_0_elements(11);
    --  hookup: inputs to control-path 
    accessAfbMain_CP_0_elements(13) <= resp_update_enable;
    -- hookup: output from control-path 
    req_update_enable <= accessAfbMain_CP_0_elements(12);
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    -- 
  begin -- 
    -- shared inport operator group (0) : RPIPE_AFB_BUS_RESPONSE_153_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(32 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_BUS_RESPONSE_153_inst_req_0;
      RPIPE_AFB_BUS_RESPONSE_153_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_BUS_RESPONSE_153_inst_req_1;
      RPIPE_AFB_BUS_RESPONSE_153_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      resp_buffer <= data_out(32 downto 0);
      AFB_BUS_RESPONSE_read_0_gI: SplitGuardInterface generic map(name => "AFB_BUS_RESPONSE_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_BUS_RESPONSE_read_0: InputPortRevised -- 
        generic map ( name => "AFB_BUS_RESPONSE_read_0", data_width => 33,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => AFB_BUS_RESPONSE_pipe_read_req(0),
          oack => AFB_BUS_RESPONSE_pipe_read_ack(0),
          odata => AFB_BUS_RESPONSE_pipe_read_data(32 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_AFB_BUS_REQUEST_149_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(73 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_BUS_REQUEST_149_inst_req_0;
      WPIPE_AFB_BUS_REQUEST_149_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_BUS_REQUEST_149_inst_req_1;
      WPIPE_AFB_BUS_REQUEST_149_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= req_buffer;
      AFB_BUS_REQUEST_write_0_gI: SplitGuardInterface generic map(name => "AFB_BUS_REQUEST_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_BUS_REQUEST_write_0: OutputPortRevised -- 
        generic map ( name => "AFB_BUS_REQUEST", data_width => 74, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_BUS_REQUEST_pipe_write_req(0),
          oack => AFB_BUS_REQUEST_pipe_write_ack(0),
          odata => AFB_BUS_REQUEST_pipe_write_data(73 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end accessAfbMain_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_mux_global_package.all;
entity listen_0_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    AFB_REQUEST_0_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_REQUEST_0_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_REQUEST_0_pipe_read_data : in   std_logic_vector(73 downto 0);
    AFB_RESPONSE_0_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_RESPONSE_0_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_RESPONSE_0_pipe_write_data : out  std_logic_vector(32 downto 0);
    accessAfbMain_call_reqs : out  std_logic_vector(0 downto 0);
    accessAfbMain_call_acks : in   std_logic_vector(0 downto 0);
    accessAfbMain_call_data : out  std_logic_vector(73 downto 0);
    accessAfbMain_call_tag  :  out  std_logic_vector(0 downto 0);
    accessAfbMain_return_reqs : out  std_logic_vector(0 downto 0);
    accessAfbMain_return_acks : in   std_logic_vector(0 downto 0);
    accessAfbMain_return_data : in   std_logic_vector(32 downto 0);
    accessAfbMain_return_tag :  in   std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity listen_0_daemon;
architecture listen_0_daemon_arch of listen_0_daemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal listen_0_daemon_CP_43_start: Boolean;
  signal listen_0_daemon_CP_43_symbol: Boolean;
  -- volatile/operator module components. 
  component accessAfbMain is -- 
    generic (tag_length : integer); 
    port ( -- 
      req : in  std_logic_vector(73 downto 0);
      resp : out  std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
      AFB_BUS_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_write_data : out  std_logic_vector(73 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- links between control-path and data-path
  signal do_while_stmt_161_branch_req_0 : boolean;
  signal RPIPE_AFB_REQUEST_0_164_inst_req_0 : boolean;
  signal RPIPE_AFB_REQUEST_0_164_inst_ack_0 : boolean;
  signal RPIPE_AFB_REQUEST_0_164_inst_req_1 : boolean;
  signal RPIPE_AFB_REQUEST_0_164_inst_ack_1 : boolean;
  signal call_stmt_168_call_req_0 : boolean;
  signal call_stmt_168_call_ack_0 : boolean;
  signal call_stmt_168_call_req_1 : boolean;
  signal call_stmt_168_call_ack_1 : boolean;
  signal WPIPE_AFB_RESPONSE_0_169_inst_req_0 : boolean;
  signal WPIPE_AFB_RESPONSE_0_169_inst_ack_0 : boolean;
  signal WPIPE_AFB_RESPONSE_0_169_inst_req_1 : boolean;
  signal WPIPE_AFB_RESPONSE_0_169_inst_ack_1 : boolean;
  signal do_while_stmt_161_branch_ack_0 : boolean;
  signal do_while_stmt_161_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "listen_0_daemon_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  listen_0_daemon_CP_43_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "listen_0_daemon_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= listen_0_daemon_CP_43_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= listen_0_daemon_CP_43_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= listen_0_daemon_CP_43_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  listen_0_daemon_CP_43: Block -- control-path 
    signal listen_0_daemon_CP_43_elements: BooleanArray(24 downto 0);
    -- 
  begin -- 
    listen_0_daemon_CP_43_elements(0) <= listen_0_daemon_CP_43_start;
    listen_0_daemon_CP_43_symbol <= listen_0_daemon_CP_43_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_160/$entry
      -- CP-element group 0: 	 branch_block_stmt_160/branch_block_stmt_160__entry__
      -- CP-element group 0: 	 branch_block_stmt_160/do_while_stmt_161__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	24 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_160/$exit
      -- CP-element group 1: 	 branch_block_stmt_160/branch_block_stmt_160__exit__
      -- CP-element group 1: 	 branch_block_stmt_160/do_while_stmt_161__exit__
      -- 
    listen_0_daemon_CP_43_elements(1) <= listen_0_daemon_CP_43_elements(24);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_160/do_while_stmt_161/$entry
      -- CP-element group 2: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161__entry__
      -- 
    listen_0_daemon_CP_43_elements(2) <= listen_0_daemon_CP_43_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	24 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161__exit__
      -- 
    -- Element group listen_0_daemon_CP_43_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_160/do_while_stmt_161/loop_back
      -- 
    -- Element group listen_0_daemon_CP_43_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	21 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	23 
    -- CP-element group 5: 	22 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_160/do_while_stmt_161/condition_done
      -- CP-element group 5: 	 branch_block_stmt_160/do_while_stmt_161/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_160/do_while_stmt_161/loop_taken/$entry
      -- 
    listen_0_daemon_CP_43_elements(5) <= listen_0_daemon_CP_43_elements(21);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	20 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_160/do_while_stmt_161/loop_body_done
      -- 
    listen_0_daemon_CP_43_elements(6) <= listen_0_daemon_CP_43_elements(20);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/back_edge_to_loop_body
      -- 
    listen_0_daemon_CP_43_elements(7) <= listen_0_daemon_CP_43_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/first_time_through_loop_body
      -- 
    listen_0_daemon_CP_43_elements(8) <= listen_0_daemon_CP_43_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	21 
    -- CP-element group 9: 	10 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/loop_body_start
      -- 
    -- Element group listen_0_daemon_CP_43_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	9 
    -- CP-element group 10: marked-predecessors 
    -- CP-element group 10: 	13 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	12 
    -- CP-element group 10:  members (3) 
      -- CP-element group 10: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_sample_start_
      -- CP-element group 10: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_Sample/$entry
      -- CP-element group 10: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_Sample/rr
      -- 
    rr_76_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_76_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_0_daemon_CP_43_elements(10), ack => RPIPE_AFB_REQUEST_0_164_inst_req_0); -- 
    listen_0_daemon_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "listen_0_daemon_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= listen_0_daemon_CP_43_elements(9) & listen_0_daemon_CP_43_elements(13);
      gj_listen_0_daemon_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_0_daemon_CP_43_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	12 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	16 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_update_start_
      -- CP-element group 11: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_Update/$entry
      -- CP-element group 11: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_Update/cr
      -- 
    cr_81_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_81_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_0_daemon_CP_43_elements(11), ack => RPIPE_AFB_REQUEST_0_164_inst_req_1); -- 
    listen_0_daemon_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "listen_0_daemon_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= listen_0_daemon_CP_43_elements(12) & listen_0_daemon_CP_43_elements(16);
      gj_listen_0_daemon_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_0_daemon_CP_43_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  transition  input  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	10 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	11 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_Sample/$exit
      -- CP-element group 12: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_Sample/ra
      -- 
    ra_77_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_REQUEST_0_164_inst_ack_0, ack => listen_0_daemon_CP_43_elements(12)); -- 
    -- CP-element group 13:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	14 
    -- CP-element group 13: marked-successors 
    -- CP-element group 13: 	10 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_update_completed_
      -- CP-element group 13: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_Update/$exit
      -- CP-element group 13: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/RPIPE_AFB_REQUEST_0_164_Update/ca
      -- 
    ca_82_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_REQUEST_0_164_inst_ack_1, ack => listen_0_daemon_CP_43_elements(13)); -- 
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	13 
    -- CP-element group 14: marked-predecessors 
    -- CP-element group 14: 	16 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	16 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_sample_start_
      -- CP-element group 14: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_Sample/$entry
      -- CP-element group 14: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_Sample/crr
      -- 
    crr_90_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_90_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_0_daemon_CP_43_elements(14), ack => call_stmt_168_call_req_0); -- 
    listen_0_daemon_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 35) := "listen_0_daemon_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= listen_0_daemon_CP_43_elements(13) & listen_0_daemon_CP_43_elements(16);
      gj_listen_0_daemon_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_0_daemon_CP_43_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	19 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	17 
    -- CP-element group 15:  members (3) 
      -- CP-element group 15: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_update_start_
      -- CP-element group 15: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_Update/$entry
      -- CP-element group 15: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_Update/ccr
      -- 
    ccr_95_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_95_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_0_daemon_CP_43_elements(15), ack => call_stmt_168_call_req_1); -- 
    listen_0_daemon_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 35) := "listen_0_daemon_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= listen_0_daemon_CP_43_elements(19);
      gj_listen_0_daemon_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_0_daemon_CP_43_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	14 
    -- CP-element group 16: successors 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	14 
    -- CP-element group 16: 	11 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_sample_completed_
      -- CP-element group 16: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_Sample/$exit
      -- CP-element group 16: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_Sample/cra
      -- 
    cra_91_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_168_call_ack_0, ack => listen_0_daemon_CP_43_elements(16)); -- 
    -- CP-element group 17:  transition  input  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	15 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	18 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_update_completed_
      -- CP-element group 17: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_Update/$exit
      -- CP-element group 17: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/call_stmt_168_Update/cca
      -- 
    cca_96_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 17_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_168_call_ack_1, ack => listen_0_daemon_CP_43_elements(17)); -- 
    -- CP-element group 18:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	17 
    -- CP-element group 18: marked-predecessors 
    -- CP-element group 18: 	20 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	19 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_sample_start_
      -- CP-element group 18: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_Sample/$entry
      -- CP-element group 18: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_Sample/req
      -- 
    req_104_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_104_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_0_daemon_CP_43_elements(18), ack => WPIPE_AFB_RESPONSE_0_169_inst_req_0); -- 
    listen_0_daemon_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "listen_0_daemon_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= listen_0_daemon_CP_43_elements(17) & listen_0_daemon_CP_43_elements(20);
      gj_listen_0_daemon_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_0_daemon_CP_43_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	18 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	20 
    -- CP-element group 19: marked-successors 
    -- CP-element group 19: 	15 
    -- CP-element group 19:  members (6) 
      -- CP-element group 19: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_sample_completed_
      -- CP-element group 19: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_update_start_
      -- CP-element group 19: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_Sample/$exit
      -- CP-element group 19: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_Sample/ack
      -- CP-element group 19: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_Update/$entry
      -- CP-element group 19: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_Update/req
      -- 
    ack_105_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_RESPONSE_0_169_inst_ack_0, ack => listen_0_daemon_CP_43_elements(19)); -- 
    req_109_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_109_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_0_daemon_CP_43_elements(19), ack => WPIPE_AFB_RESPONSE_0_169_inst_req_1); -- 
    -- CP-element group 20:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	19 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	6 
    -- CP-element group 20: marked-successors 
    -- CP-element group 20: 	18 
    -- CP-element group 20:  members (4) 
      -- CP-element group 20: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/$exit
      -- CP-element group 20: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_Update/$exit
      -- CP-element group 20: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/WPIPE_AFB_RESPONSE_0_169_Update/ack
      -- 
    ack_110_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_RESPONSE_0_169_inst_ack_1, ack => listen_0_daemon_CP_43_elements(20)); -- 
    -- CP-element group 21:  transition  output  delay-element  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	9 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	5 
    -- CP-element group 21:  members (2) 
      -- CP-element group 21: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/condition_evaluated
      -- CP-element group 21: 	 branch_block_stmt_160/do_while_stmt_161/do_while_stmt_161_loop_body/loop_body_delay_to_condition_start
      -- 
    condition_evaluated_67_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_67_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_0_daemon_CP_43_elements(21), ack => do_while_stmt_161_branch_req_0); -- 
    -- Element group listen_0_daemon_CP_43_elements(21) is a control-delay.
    cp_element_21_delay: control_delay_element  generic map(name => " 21_delay", delay_value => 1)  port map(req => listen_0_daemon_CP_43_elements(9), ack => listen_0_daemon_CP_43_elements(21), clk => clk, reset =>reset);
    -- CP-element group 22:  transition  input  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	5 
    -- CP-element group 22: successors 
    -- CP-element group 22:  members (2) 
      -- CP-element group 22: 	 branch_block_stmt_160/do_while_stmt_161/loop_exit/$exit
      -- CP-element group 22: 	 branch_block_stmt_160/do_while_stmt_161/loop_exit/ack
      -- 
    ack_115_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_161_branch_ack_0, ack => listen_0_daemon_CP_43_elements(22)); -- 
    -- CP-element group 23:  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	5 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (2) 
      -- CP-element group 23: 	 branch_block_stmt_160/do_while_stmt_161/loop_taken/$exit
      -- CP-element group 23: 	 branch_block_stmt_160/do_while_stmt_161/loop_taken/ack
      -- 
    ack_119_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_161_branch_ack_1, ack => listen_0_daemon_CP_43_elements(23)); -- 
    -- CP-element group 24:  transition  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	3 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	1 
    -- CP-element group 24:  members (1) 
      -- CP-element group 24: 	 branch_block_stmt_160/do_while_stmt_161/$exit
      -- 
    listen_0_daemon_CP_43_elements(24) <= listen_0_daemon_CP_43_elements(3);
    listen_0_daemon_do_while_stmt_161_terminator_120: loop_terminator -- 
      generic map (name => " listen_0_daemon_do_while_stmt_161_terminator_120", max_iterations_in_flight =>15) 
      port map(loop_body_exit => listen_0_daemon_CP_43_elements(6),loop_continue => listen_0_daemon_CP_43_elements(23),loop_terminate => listen_0_daemon_CP_43_elements(22),loop_back => listen_0_daemon_CP_43_elements(4),loop_exit => listen_0_daemon_CP_43_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_68_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= listen_0_daemon_CP_43_elements(7);
        preds(1)  <= listen_0_daemon_CP_43_elements(8);
        entry_tmerge_68 : transition_merge -- 
          generic map(name => " entry_tmerge_68")
          port map (preds => preds, symbol_out => listen_0_daemon_CP_43_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal konst_173_wire_constant : std_logic_vector(0 downto 0);
    signal req_165 : std_logic_vector(73 downto 0);
    signal resp_168 : std_logic_vector(32 downto 0);
    -- 
  begin -- 
    konst_173_wire_constant <= "1";
    do_while_stmt_161_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_173_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_161_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_161_branch_req_0,
          ack0 => do_while_stmt_161_branch_ack_0,
          ack1 => do_while_stmt_161_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared inport operator group (0) : RPIPE_AFB_REQUEST_0_164_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_REQUEST_0_164_inst_req_0;
      RPIPE_AFB_REQUEST_0_164_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_REQUEST_0_164_inst_req_1;
      RPIPE_AFB_REQUEST_0_164_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      req_165 <= data_out(73 downto 0);
      AFB_REQUEST_0_read_0_gI: SplitGuardInterface generic map(name => "AFB_REQUEST_0_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_REQUEST_0_read_0: InputPortRevised -- 
        generic map ( name => "AFB_REQUEST_0_read_0", data_width => 74,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => AFB_REQUEST_0_pipe_read_req(0),
          oack => AFB_REQUEST_0_pipe_read_ack(0),
          odata => AFB_REQUEST_0_pipe_read_data(73 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_AFB_RESPONSE_0_169_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(32 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_RESPONSE_0_169_inst_req_0;
      WPIPE_AFB_RESPONSE_0_169_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_RESPONSE_0_169_inst_req_1;
      WPIPE_AFB_RESPONSE_0_169_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= resp_168;
      AFB_RESPONSE_0_write_0_gI: SplitGuardInterface generic map(name => "AFB_RESPONSE_0_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_RESPONSE_0_write_0: OutputPortRevised -- 
        generic map ( name => "AFB_RESPONSE_0", data_width => 33, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_RESPONSE_0_pipe_write_req(0),
          oack => AFB_RESPONSE_0_pipe_write_ack(0),
          odata => AFB_RESPONSE_0_pipe_write_data(32 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared call operator group (0) : call_stmt_168_call 
    accessAfbMain_call_group_0: Block -- 
      signal data_in: std_logic_vector(73 downto 0);
      signal data_out: std_logic_vector(32 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 3);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_168_call_req_0;
      call_stmt_168_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_168_call_req_1;
      call_stmt_168_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      accessAfbMain_call_group_0_gI: SplitGuardInterface generic map(name => "accessAfbMain_call_group_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= req_165;
      resp_168 <= data_out(32 downto 0);
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 74,
        owidth => 74,
        buffering => inBUFs,
        full_rate =>  true,
        twidth => 1,
        nreqs => 1,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => accessAfbMain_call_reqs(0),
          ackR => accessAfbMain_call_acks(0),
          dataR => accessAfbMain_call_data(73 downto 0),
          tagR => accessAfbMain_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 33,
          owidth => 33,
          detailed_buffering_per_output => outBUFs, 
          full_rate => true, 
          twidth => 1,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => accessAfbMain_return_acks(0), -- cross-over
          ackL => accessAfbMain_return_reqs(0), -- cross-over
          dataL => accessAfbMain_return_data(32 downto 0),
          tagL => accessAfbMain_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- 
  end Block; -- data_path
  -- 
end listen_0_daemon_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_mux_global_package.all;
entity listen_1_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    AFB_REQUEST_1_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_REQUEST_1_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_REQUEST_1_pipe_read_data : in   std_logic_vector(73 downto 0);
    AFB_RESPONSE_1_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_RESPONSE_1_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_RESPONSE_1_pipe_write_data : out  std_logic_vector(32 downto 0);
    accessAfbMain_call_reqs : out  std_logic_vector(0 downto 0);
    accessAfbMain_call_acks : in   std_logic_vector(0 downto 0);
    accessAfbMain_call_data : out  std_logic_vector(73 downto 0);
    accessAfbMain_call_tag  :  out  std_logic_vector(0 downto 0);
    accessAfbMain_return_reqs : out  std_logic_vector(0 downto 0);
    accessAfbMain_return_acks : in   std_logic_vector(0 downto 0);
    accessAfbMain_return_data : in   std_logic_vector(32 downto 0);
    accessAfbMain_return_tag :  in   std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity listen_1_daemon;
architecture listen_1_daemon_arch of listen_1_daemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal listen_1_daemon_CP_121_start: Boolean;
  signal listen_1_daemon_CP_121_symbol: Boolean;
  -- volatile/operator module components. 
  component accessAfbMain is -- 
    generic (tag_length : integer); 
    port ( -- 
      req : in  std_logic_vector(73 downto 0);
      resp : out  std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
      AFB_BUS_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_write_data : out  std_logic_vector(73 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- links between control-path and data-path
  signal do_while_stmt_178_branch_req_0 : boolean;
  signal RPIPE_AFB_REQUEST_1_181_inst_req_0 : boolean;
  signal RPIPE_AFB_REQUEST_1_181_inst_ack_0 : boolean;
  signal RPIPE_AFB_REQUEST_1_181_inst_req_1 : boolean;
  signal RPIPE_AFB_REQUEST_1_181_inst_ack_1 : boolean;
  signal call_stmt_185_call_req_0 : boolean;
  signal call_stmt_185_call_ack_0 : boolean;
  signal call_stmt_185_call_req_1 : boolean;
  signal call_stmt_185_call_ack_1 : boolean;
  signal WPIPE_AFB_RESPONSE_1_186_inst_req_0 : boolean;
  signal WPIPE_AFB_RESPONSE_1_186_inst_ack_0 : boolean;
  signal WPIPE_AFB_RESPONSE_1_186_inst_req_1 : boolean;
  signal WPIPE_AFB_RESPONSE_1_186_inst_ack_1 : boolean;
  signal do_while_stmt_178_branch_ack_0 : boolean;
  signal do_while_stmt_178_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "listen_1_daemon_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  listen_1_daemon_CP_121_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "listen_1_daemon_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= listen_1_daemon_CP_121_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= listen_1_daemon_CP_121_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= listen_1_daemon_CP_121_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  listen_1_daemon_CP_121: Block -- control-path 
    signal listen_1_daemon_CP_121_elements: BooleanArray(24 downto 0);
    -- 
  begin -- 
    listen_1_daemon_CP_121_elements(0) <= listen_1_daemon_CP_121_start;
    listen_1_daemon_CP_121_symbol <= listen_1_daemon_CP_121_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_177/$entry
      -- CP-element group 0: 	 branch_block_stmt_177/branch_block_stmt_177__entry__
      -- CP-element group 0: 	 branch_block_stmt_177/do_while_stmt_178__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	24 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_177/$exit
      -- CP-element group 1: 	 branch_block_stmt_177/branch_block_stmt_177__exit__
      -- CP-element group 1: 	 branch_block_stmt_177/do_while_stmt_178__exit__
      -- 
    listen_1_daemon_CP_121_elements(1) <= listen_1_daemon_CP_121_elements(24);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_177/do_while_stmt_178/$entry
      -- CP-element group 2: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178__entry__
      -- 
    listen_1_daemon_CP_121_elements(2) <= listen_1_daemon_CP_121_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	24 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178__exit__
      -- 
    -- Element group listen_1_daemon_CP_121_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_177/do_while_stmt_178/loop_back
      -- 
    -- Element group listen_1_daemon_CP_121_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	21 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	23 
    -- CP-element group 5: 	22 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_177/do_while_stmt_178/condition_done
      -- CP-element group 5: 	 branch_block_stmt_177/do_while_stmt_178/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_177/do_while_stmt_178/loop_taken/$entry
      -- 
    listen_1_daemon_CP_121_elements(5) <= listen_1_daemon_CP_121_elements(21);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	20 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_177/do_while_stmt_178/loop_body_done
      -- 
    listen_1_daemon_CP_121_elements(6) <= listen_1_daemon_CP_121_elements(20);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/back_edge_to_loop_body
      -- 
    listen_1_daemon_CP_121_elements(7) <= listen_1_daemon_CP_121_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/first_time_through_loop_body
      -- 
    listen_1_daemon_CP_121_elements(8) <= listen_1_daemon_CP_121_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	21 
    -- CP-element group 9: 	10 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/loop_body_start
      -- 
    -- Element group listen_1_daemon_CP_121_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	9 
    -- CP-element group 10: marked-predecessors 
    -- CP-element group 10: 	13 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	12 
    -- CP-element group 10:  members (3) 
      -- CP-element group 10: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_sample_start_
      -- CP-element group 10: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_Sample/$entry
      -- CP-element group 10: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_Sample/rr
      -- 
    rr_154_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_154_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_1_daemon_CP_121_elements(10), ack => RPIPE_AFB_REQUEST_1_181_inst_req_0); -- 
    listen_1_daemon_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "listen_1_daemon_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= listen_1_daemon_CP_121_elements(9) & listen_1_daemon_CP_121_elements(13);
      gj_listen_1_daemon_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_1_daemon_CP_121_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	12 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	16 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_update_start_
      -- CP-element group 11: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_Update/$entry
      -- CP-element group 11: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_Update/cr
      -- 
    cr_159_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_159_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_1_daemon_CP_121_elements(11), ack => RPIPE_AFB_REQUEST_1_181_inst_req_1); -- 
    listen_1_daemon_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "listen_1_daemon_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= listen_1_daemon_CP_121_elements(12) & listen_1_daemon_CP_121_elements(16);
      gj_listen_1_daemon_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_1_daemon_CP_121_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  transition  input  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	10 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	11 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_Sample/$exit
      -- CP-element group 12: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_Sample/ra
      -- 
    ra_155_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_REQUEST_1_181_inst_ack_0, ack => listen_1_daemon_CP_121_elements(12)); -- 
    -- CP-element group 13:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	14 
    -- CP-element group 13: marked-successors 
    -- CP-element group 13: 	10 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_update_completed_
      -- CP-element group 13: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_Update/$exit
      -- CP-element group 13: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/RPIPE_AFB_REQUEST_1_181_Update/ca
      -- 
    ca_160_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_REQUEST_1_181_inst_ack_1, ack => listen_1_daemon_CP_121_elements(13)); -- 
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	13 
    -- CP-element group 14: marked-predecessors 
    -- CP-element group 14: 	16 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	16 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_sample_start_
      -- CP-element group 14: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_Sample/$entry
      -- CP-element group 14: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_Sample/crr
      -- 
    crr_168_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_168_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_1_daemon_CP_121_elements(14), ack => call_stmt_185_call_req_0); -- 
    listen_1_daemon_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 35) := "listen_1_daemon_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= listen_1_daemon_CP_121_elements(13) & listen_1_daemon_CP_121_elements(16);
      gj_listen_1_daemon_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_1_daemon_CP_121_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	19 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	17 
    -- CP-element group 15:  members (3) 
      -- CP-element group 15: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_update_start_
      -- CP-element group 15: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_Update/$entry
      -- CP-element group 15: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_Update/ccr
      -- 
    ccr_173_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_173_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_1_daemon_CP_121_elements(15), ack => call_stmt_185_call_req_1); -- 
    listen_1_daemon_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 35) := "listen_1_daemon_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= listen_1_daemon_CP_121_elements(19);
      gj_listen_1_daemon_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_1_daemon_CP_121_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	14 
    -- CP-element group 16: successors 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	14 
    -- CP-element group 16: 	11 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_sample_completed_
      -- CP-element group 16: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_Sample/$exit
      -- CP-element group 16: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_Sample/cra
      -- 
    cra_169_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_185_call_ack_0, ack => listen_1_daemon_CP_121_elements(16)); -- 
    -- CP-element group 17:  transition  input  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	15 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	18 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_update_completed_
      -- CP-element group 17: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_Update/$exit
      -- CP-element group 17: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/call_stmt_185_Update/cca
      -- 
    cca_174_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 17_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_185_call_ack_1, ack => listen_1_daemon_CP_121_elements(17)); -- 
    -- CP-element group 18:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	17 
    -- CP-element group 18: marked-predecessors 
    -- CP-element group 18: 	20 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	19 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_sample_start_
      -- CP-element group 18: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_Sample/$entry
      -- CP-element group 18: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_Sample/req
      -- 
    req_182_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_182_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_1_daemon_CP_121_elements(18), ack => WPIPE_AFB_RESPONSE_1_186_inst_req_0); -- 
    listen_1_daemon_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 35) := "listen_1_daemon_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= listen_1_daemon_CP_121_elements(17) & listen_1_daemon_CP_121_elements(20);
      gj_listen_1_daemon_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => listen_1_daemon_CP_121_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	18 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	20 
    -- CP-element group 19: marked-successors 
    -- CP-element group 19: 	15 
    -- CP-element group 19:  members (6) 
      -- CP-element group 19: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_sample_completed_
      -- CP-element group 19: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_update_start_
      -- CP-element group 19: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_Sample/$exit
      -- CP-element group 19: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_Sample/ack
      -- CP-element group 19: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_Update/$entry
      -- CP-element group 19: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_Update/req
      -- 
    ack_183_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_RESPONSE_1_186_inst_ack_0, ack => listen_1_daemon_CP_121_elements(19)); -- 
    req_187_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_187_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_1_daemon_CP_121_elements(19), ack => WPIPE_AFB_RESPONSE_1_186_inst_req_1); -- 
    -- CP-element group 20:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	19 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	6 
    -- CP-element group 20: marked-successors 
    -- CP-element group 20: 	18 
    -- CP-element group 20:  members (4) 
      -- CP-element group 20: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/$exit
      -- CP-element group 20: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_Update/$exit
      -- CP-element group 20: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/WPIPE_AFB_RESPONSE_1_186_Update/ack
      -- 
    ack_188_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_RESPONSE_1_186_inst_ack_1, ack => listen_1_daemon_CP_121_elements(20)); -- 
    -- CP-element group 21:  transition  output  delay-element  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	9 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	5 
    -- CP-element group 21:  members (2) 
      -- CP-element group 21: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/condition_evaluated
      -- CP-element group 21: 	 branch_block_stmt_177/do_while_stmt_178/do_while_stmt_178_loop_body/loop_body_delay_to_condition_start
      -- 
    condition_evaluated_145_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_145_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => listen_1_daemon_CP_121_elements(21), ack => do_while_stmt_178_branch_req_0); -- 
    -- Element group listen_1_daemon_CP_121_elements(21) is a control-delay.
    cp_element_21_delay: control_delay_element  generic map(name => " 21_delay", delay_value => 1)  port map(req => listen_1_daemon_CP_121_elements(9), ack => listen_1_daemon_CP_121_elements(21), clk => clk, reset =>reset);
    -- CP-element group 22:  transition  input  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	5 
    -- CP-element group 22: successors 
    -- CP-element group 22:  members (2) 
      -- CP-element group 22: 	 branch_block_stmt_177/do_while_stmt_178/loop_exit/$exit
      -- CP-element group 22: 	 branch_block_stmt_177/do_while_stmt_178/loop_exit/ack
      -- 
    ack_193_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_178_branch_ack_0, ack => listen_1_daemon_CP_121_elements(22)); -- 
    -- CP-element group 23:  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	5 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (2) 
      -- CP-element group 23: 	 branch_block_stmt_177/do_while_stmt_178/loop_taken/$exit
      -- CP-element group 23: 	 branch_block_stmt_177/do_while_stmt_178/loop_taken/ack
      -- 
    ack_197_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_178_branch_ack_1, ack => listen_1_daemon_CP_121_elements(23)); -- 
    -- CP-element group 24:  transition  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	3 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	1 
    -- CP-element group 24:  members (1) 
      -- CP-element group 24: 	 branch_block_stmt_177/do_while_stmt_178/$exit
      -- 
    listen_1_daemon_CP_121_elements(24) <= listen_1_daemon_CP_121_elements(3);
    listen_1_daemon_do_while_stmt_178_terminator_198: loop_terminator -- 
      generic map (name => " listen_1_daemon_do_while_stmt_178_terminator_198", max_iterations_in_flight =>15) 
      port map(loop_body_exit => listen_1_daemon_CP_121_elements(6),loop_continue => listen_1_daemon_CP_121_elements(23),loop_terminate => listen_1_daemon_CP_121_elements(22),loop_back => listen_1_daemon_CP_121_elements(4),loop_exit => listen_1_daemon_CP_121_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_146_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= listen_1_daemon_CP_121_elements(7);
        preds(1)  <= listen_1_daemon_CP_121_elements(8);
        entry_tmerge_146 : transition_merge -- 
          generic map(name => " entry_tmerge_146")
          port map (preds => preds, symbol_out => listen_1_daemon_CP_121_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal konst_190_wire_constant : std_logic_vector(0 downto 0);
    signal req_182 : std_logic_vector(73 downto 0);
    signal resp_185 : std_logic_vector(32 downto 0);
    -- 
  begin -- 
    konst_190_wire_constant <= "1";
    do_while_stmt_178_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_190_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_178_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_178_branch_req_0,
          ack0 => do_while_stmt_178_branch_ack_0,
          ack1 => do_while_stmt_178_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared inport operator group (0) : RPIPE_AFB_REQUEST_1_181_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_REQUEST_1_181_inst_req_0;
      RPIPE_AFB_REQUEST_1_181_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_REQUEST_1_181_inst_req_1;
      RPIPE_AFB_REQUEST_1_181_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      req_182 <= data_out(73 downto 0);
      AFB_REQUEST_1_read_0_gI: SplitGuardInterface generic map(name => "AFB_REQUEST_1_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      AFB_REQUEST_1_read_0: InputPortRevised -- 
        generic map ( name => "AFB_REQUEST_1_read_0", data_width => 74,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => AFB_REQUEST_1_pipe_read_req(0),
          oack => AFB_REQUEST_1_pipe_read_ack(0),
          odata => AFB_REQUEST_1_pipe_read_data(73 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_AFB_RESPONSE_1_186_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(32 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_AFB_RESPONSE_1_186_inst_req_0;
      WPIPE_AFB_RESPONSE_1_186_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_RESPONSE_1_186_inst_req_1;
      WPIPE_AFB_RESPONSE_1_186_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= resp_185;
      AFB_RESPONSE_1_write_0_gI: SplitGuardInterface generic map(name => "AFB_RESPONSE_1_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      AFB_RESPONSE_1_write_0: OutputPortRevised -- 
        generic map ( name => "AFB_RESPONSE_1", data_width => 33, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => AFB_RESPONSE_1_pipe_write_req(0),
          oack => AFB_RESPONSE_1_pipe_write_ack(0),
          odata => AFB_RESPONSE_1_pipe_write_data(32 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared call operator group (0) : call_stmt_185_call 
    accessAfbMain_call_group_0: Block -- 
      signal data_in: std_logic_vector(73 downto 0);
      signal data_out: std_logic_vector(32 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 3);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_185_call_req_0;
      call_stmt_185_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_185_call_req_1;
      call_stmt_185_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      accessAfbMain_call_group_0_gI: SplitGuardInterface generic map(name => "accessAfbMain_call_group_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= req_182;
      resp_185 <= data_out(32 downto 0);
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 74,
        owidth => 74,
        buffering => inBUFs,
        full_rate =>  true,
        twidth => 1,
        nreqs => 1,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => accessAfbMain_call_reqs(0),
          ackR => accessAfbMain_call_acks(0),
          dataR => accessAfbMain_call_data(73 downto 0),
          tagR => accessAfbMain_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 33,
          owidth => 33,
          detailed_buffering_per_output => outBUFs, 
          full_rate => true, 
          twidth => 1,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => accessAfbMain_return_acks(0), -- cross-over
          ackL => accessAfbMain_return_reqs(0), -- cross-over
          dataL => accessAfbMain_return_data(32 downto 0),
          tagL => accessAfbMain_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- 
  end Block; -- data_path
  -- 
end listen_1_daemon_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library GenericCoreAddOnLib;
use GenericCoreAddOnLib.afb_mux_global_package.all;
entity afb_mux is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_BUS_REQUEST_pipe_read_data: out std_logic_vector(73 downto 0);
    AFB_BUS_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_write_data: in std_logic_vector(32 downto 0);
    AFB_BUS_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_REQUEST_0_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_REQUEST_0_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_REQUEST_0_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_REQUEST_1_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_REQUEST_1_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_REQUEST_1_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_RESPONSE_0_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_RESPONSE_0_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_RESPONSE_0_pipe_read_ack : out std_logic_vector(0 downto 0);
    AFB_RESPONSE_1_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_RESPONSE_1_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_RESPONSE_1_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture afb_mux_arch  of afb_mux is -- system-architecture 
  -- interface signals to connect to memory space memory_space_1
  -- declarations related to module accessAfbMain
  component accessAfbMain is -- 
    generic (tag_length : integer); 
    port ( -- 
      req : in  std_logic_vector(73 downto 0);
      resp : out  std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_data : in   std_logic_vector(32 downto 0);
      AFB_BUS_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_write_data : out  std_logic_vector(73 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module accessAfbMain
  signal accessAfbMain_req :  std_logic_vector(73 downto 0);
  signal accessAfbMain_resp :  std_logic_vector(32 downto 0);
  signal accessAfbMain_in_args    : std_logic_vector(73 downto 0);
  signal accessAfbMain_out_args   : std_logic_vector(32 downto 0);
  signal accessAfbMain_tag_in    : std_logic_vector(2 downto 0) := (others => '0');
  signal accessAfbMain_tag_out   : std_logic_vector(2 downto 0);
  signal accessAfbMain_start_req : std_logic;
  signal accessAfbMain_start_ack : std_logic;
  signal accessAfbMain_fin_req   : std_logic;
  signal accessAfbMain_fin_ack : std_logic;
  -- caller side aggregated signals for module accessAfbMain
  signal accessAfbMain_call_reqs: std_logic_vector(1 downto 0);
  signal accessAfbMain_call_acks: std_logic_vector(1 downto 0);
  signal accessAfbMain_return_reqs: std_logic_vector(1 downto 0);
  signal accessAfbMain_return_acks: std_logic_vector(1 downto 0);
  signal accessAfbMain_call_data: std_logic_vector(147 downto 0);
  signal accessAfbMain_call_tag: std_logic_vector(1 downto 0);
  signal accessAfbMain_return_data: std_logic_vector(65 downto 0);
  signal accessAfbMain_return_tag: std_logic_vector(1 downto 0);
  -- declarations related to module listen_0_daemon
  component listen_0_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      AFB_REQUEST_0_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_REQUEST_0_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_REQUEST_0_pipe_read_data : in   std_logic_vector(73 downto 0);
      AFB_RESPONSE_0_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_RESPONSE_0_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_RESPONSE_0_pipe_write_data : out  std_logic_vector(32 downto 0);
      accessAfbMain_call_reqs : out  std_logic_vector(0 downto 0);
      accessAfbMain_call_acks : in   std_logic_vector(0 downto 0);
      accessAfbMain_call_data : out  std_logic_vector(73 downto 0);
      accessAfbMain_call_tag  :  out  std_logic_vector(0 downto 0);
      accessAfbMain_return_reqs : out  std_logic_vector(0 downto 0);
      accessAfbMain_return_acks : in   std_logic_vector(0 downto 0);
      accessAfbMain_return_data : in   std_logic_vector(32 downto 0);
      accessAfbMain_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module listen_0_daemon
  signal listen_0_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal listen_0_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal listen_0_daemon_start_req : std_logic;
  signal listen_0_daemon_start_ack : std_logic;
  signal listen_0_daemon_fin_req   : std_logic;
  signal listen_0_daemon_fin_ack : std_logic;
  -- declarations related to module listen_1_daemon
  component listen_1_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      AFB_REQUEST_1_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_REQUEST_1_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_REQUEST_1_pipe_read_data : in   std_logic_vector(73 downto 0);
      AFB_RESPONSE_1_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_RESPONSE_1_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_RESPONSE_1_pipe_write_data : out  std_logic_vector(32 downto 0);
      accessAfbMain_call_reqs : out  std_logic_vector(0 downto 0);
      accessAfbMain_call_acks : in   std_logic_vector(0 downto 0);
      accessAfbMain_call_data : out  std_logic_vector(73 downto 0);
      accessAfbMain_call_tag  :  out  std_logic_vector(0 downto 0);
      accessAfbMain_return_reqs : out  std_logic_vector(0 downto 0);
      accessAfbMain_return_acks : in   std_logic_vector(0 downto 0);
      accessAfbMain_return_data : in   std_logic_vector(32 downto 0);
      accessAfbMain_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module listen_1_daemon
  signal listen_1_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal listen_1_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal listen_1_daemon_start_req : std_logic;
  signal listen_1_daemon_start_ack : std_logic;
  signal listen_1_daemon_fin_req   : std_logic;
  signal listen_1_daemon_fin_ack : std_logic;
  -- aggregate signals for write to pipe AFB_BUS_REQUEST
  signal AFB_BUS_REQUEST_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_BUS_REQUEST_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_BUS_REQUEST_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe AFB_BUS_RESPONSE
  signal AFB_BUS_RESPONSE_pipe_read_data: std_logic_vector(32 downto 0);
  signal AFB_BUS_RESPONSE_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_BUS_RESPONSE_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe AFB_REQUEST_0
  signal AFB_REQUEST_0_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_0_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_REQUEST_0_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe AFB_REQUEST_1
  signal AFB_REQUEST_1_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_1_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_REQUEST_1_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe AFB_RESPONSE_0
  signal AFB_RESPONSE_0_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_0_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_RESPONSE_0_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe AFB_RESPONSE_1
  signal AFB_RESPONSE_1_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_1_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_RESPONSE_1_pipe_write_ack: std_logic_vector(0 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module accessAfbMain
  accessAfbMain_req <= accessAfbMain_in_args(73 downto 0);
  accessAfbMain_out_args <= accessAfbMain_resp ;
  -- call arbiter for module accessAfbMain
  accessAfbMain_arbiter: SplitCallArbiter -- 
    generic map( --
      name => "SplitCallArbiter", num_reqs => 2,
      call_data_width => 74,
      return_data_width => 33,
      callee_tag_length => 2,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => accessAfbMain_call_reqs,
      call_acks => accessAfbMain_call_acks,
      return_reqs => accessAfbMain_return_reqs,
      return_acks => accessAfbMain_return_acks,
      call_data  => accessAfbMain_call_data,
      call_tag  => accessAfbMain_call_tag,
      return_tag  => accessAfbMain_return_tag,
      call_mtag => accessAfbMain_tag_in,
      return_mtag => accessAfbMain_tag_out,
      return_data =>accessAfbMain_return_data,
      call_mreq => accessAfbMain_start_req,
      call_mack => accessAfbMain_start_ack,
      return_mreq => accessAfbMain_fin_req,
      return_mack => accessAfbMain_fin_ack,
      call_mdata => accessAfbMain_in_args,
      return_mdata => accessAfbMain_out_args,
      clk => clk, 
      reset => reset --
    ); --
  accessAfbMain_instance:accessAfbMain-- 
    generic map(tag_length => 3)
    port map(-- 
      req => accessAfbMain_req,
      resp => accessAfbMain_resp,
      start_req => accessAfbMain_start_req,
      start_ack => accessAfbMain_start_ack,
      fin_req => accessAfbMain_fin_req,
      fin_ack => accessAfbMain_fin_ack,
      clk => clk,
      reset => reset,
      AFB_BUS_RESPONSE_pipe_read_req => AFB_BUS_RESPONSE_pipe_read_req(0 downto 0),
      AFB_BUS_RESPONSE_pipe_read_ack => AFB_BUS_RESPONSE_pipe_read_ack(0 downto 0),
      AFB_BUS_RESPONSE_pipe_read_data => AFB_BUS_RESPONSE_pipe_read_data(32 downto 0),
      AFB_BUS_REQUEST_pipe_write_req => AFB_BUS_REQUEST_pipe_write_req(0 downto 0),
      AFB_BUS_REQUEST_pipe_write_ack => AFB_BUS_REQUEST_pipe_write_ack(0 downto 0),
      AFB_BUS_REQUEST_pipe_write_data => AFB_BUS_REQUEST_pipe_write_data(73 downto 0),
      tag_in => accessAfbMain_tag_in,
      tag_out => accessAfbMain_tag_out-- 
    ); -- 
  -- module listen_0_daemon
  listen_0_daemon_instance:listen_0_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => listen_0_daemon_start_req,
      start_ack => listen_0_daemon_start_ack,
      fin_req => listen_0_daemon_fin_req,
      fin_ack => listen_0_daemon_fin_ack,
      clk => clk,
      reset => reset,
      AFB_REQUEST_0_pipe_read_req => AFB_REQUEST_0_pipe_read_req(0 downto 0),
      AFB_REQUEST_0_pipe_read_ack => AFB_REQUEST_0_pipe_read_ack(0 downto 0),
      AFB_REQUEST_0_pipe_read_data => AFB_REQUEST_0_pipe_read_data(73 downto 0),
      AFB_RESPONSE_0_pipe_write_req => AFB_RESPONSE_0_pipe_write_req(0 downto 0),
      AFB_RESPONSE_0_pipe_write_ack => AFB_RESPONSE_0_pipe_write_ack(0 downto 0),
      AFB_RESPONSE_0_pipe_write_data => AFB_RESPONSE_0_pipe_write_data(32 downto 0),
      accessAfbMain_call_reqs => accessAfbMain_call_reqs(0 downto 0),
      accessAfbMain_call_acks => accessAfbMain_call_acks(0 downto 0),
      accessAfbMain_call_data => accessAfbMain_call_data(73 downto 0),
      accessAfbMain_call_tag => accessAfbMain_call_tag(0 downto 0),
      accessAfbMain_return_reqs => accessAfbMain_return_reqs(0 downto 0),
      accessAfbMain_return_acks => accessAfbMain_return_acks(0 downto 0),
      accessAfbMain_return_data => accessAfbMain_return_data(32 downto 0),
      accessAfbMain_return_tag => accessAfbMain_return_tag(0 downto 0),
      tag_in => listen_0_daemon_tag_in,
      tag_out => listen_0_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  listen_0_daemon_tag_in <= (others => '0');
  listen_0_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => listen_0_daemon_start_req, start_ack => listen_0_daemon_start_ack,  fin_req => listen_0_daemon_fin_req,  fin_ack => listen_0_daemon_fin_ack);
  -- module listen_1_daemon
  listen_1_daemon_instance:listen_1_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => listen_1_daemon_start_req,
      start_ack => listen_1_daemon_start_ack,
      fin_req => listen_1_daemon_fin_req,
      fin_ack => listen_1_daemon_fin_ack,
      clk => clk,
      reset => reset,
      AFB_REQUEST_1_pipe_read_req => AFB_REQUEST_1_pipe_read_req(0 downto 0),
      AFB_REQUEST_1_pipe_read_ack => AFB_REQUEST_1_pipe_read_ack(0 downto 0),
      AFB_REQUEST_1_pipe_read_data => AFB_REQUEST_1_pipe_read_data(73 downto 0),
      AFB_RESPONSE_1_pipe_write_req => AFB_RESPONSE_1_pipe_write_req(0 downto 0),
      AFB_RESPONSE_1_pipe_write_ack => AFB_RESPONSE_1_pipe_write_ack(0 downto 0),
      AFB_RESPONSE_1_pipe_write_data => AFB_RESPONSE_1_pipe_write_data(32 downto 0),
      accessAfbMain_call_reqs => accessAfbMain_call_reqs(1 downto 1),
      accessAfbMain_call_acks => accessAfbMain_call_acks(1 downto 1),
      accessAfbMain_call_data => accessAfbMain_call_data(147 downto 74),
      accessAfbMain_call_tag => accessAfbMain_call_tag(1 downto 1),
      accessAfbMain_return_reqs => accessAfbMain_return_reqs(1 downto 1),
      accessAfbMain_return_acks => accessAfbMain_return_acks(1 downto 1),
      accessAfbMain_return_data => accessAfbMain_return_data(65 downto 33),
      accessAfbMain_return_tag => accessAfbMain_return_tag(1 downto 1),
      tag_in => listen_1_daemon_tag_in,
      tag_out => listen_1_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  listen_1_daemon_tag_in <= (others => '0');
  listen_1_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => listen_1_daemon_start_req, start_ack => listen_1_daemon_start_ack,  fin_req => listen_1_daemon_fin_req,  fin_ack => listen_1_daemon_fin_ack);
  AFB_BUS_REQUEST_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_BUS_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_BUS_REQUEST_pipe_read_req,
      read_ack => AFB_BUS_REQUEST_pipe_read_ack,
      read_data => AFB_BUS_REQUEST_pipe_read_data,
      write_req => AFB_BUS_REQUEST_pipe_write_req,
      write_ack => AFB_BUS_REQUEST_pipe_write_ack,
      write_data => AFB_BUS_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_BUS_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_BUS_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_BUS_RESPONSE_pipe_read_req,
      read_ack => AFB_BUS_RESPONSE_pipe_read_ack,
      read_data => AFB_BUS_RESPONSE_pipe_read_data,
      write_req => AFB_BUS_RESPONSE_pipe_write_req,
      write_ack => AFB_BUS_RESPONSE_pipe_write_ack,
      write_data => AFB_BUS_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_REQUEST_0_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_REQUEST_0",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_REQUEST_0_pipe_read_req,
      read_ack => AFB_REQUEST_0_pipe_read_ack,
      read_data => AFB_REQUEST_0_pipe_read_data,
      write_req => AFB_REQUEST_0_pipe_write_req,
      write_ack => AFB_REQUEST_0_pipe_write_ack,
      write_data => AFB_REQUEST_0_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_REQUEST_1_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_REQUEST_1",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_REQUEST_1_pipe_read_req,
      read_ack => AFB_REQUEST_1_pipe_read_ack,
      read_data => AFB_REQUEST_1_pipe_read_data,
      write_req => AFB_REQUEST_1_pipe_write_req,
      write_ack => AFB_REQUEST_1_pipe_write_ack,
      write_data => AFB_REQUEST_1_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_RESPONSE_0_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_RESPONSE_0",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_RESPONSE_0_pipe_read_req,
      read_ack => AFB_RESPONSE_0_pipe_read_ack,
      read_data => AFB_RESPONSE_0_pipe_read_data,
      write_req => AFB_RESPONSE_0_pipe_write_req,
      write_ack => AFB_RESPONSE_0_pipe_write_ack,
      write_data => AFB_RESPONSE_0_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  AFB_RESPONSE_1_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe AFB_RESPONSE_1",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => AFB_RESPONSE_1_pipe_read_req,
      read_ack => AFB_RESPONSE_1_pipe_read_ack,
      read_data => AFB_RESPONSE_1_pipe_read_data,
      write_req => AFB_RESPONSE_1_pipe_write_req,
      write_ack => AFB_RESPONSE_1_pipe_write_ack,
      write_data => AFB_RESPONSE_1_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- gated clock generators 
  -- 
end afb_mux_arch;
library ieee;
use ieee.std_logic_1164.all;

library simpleUartLib;
use simpleUartLib.uartPackage.all;


--
-- The baud control word is constructed as
-- [31:16] baud-limit
-- [11:0]  baud-frequency.
--
-- for more information as to how these two
-- numbers are calculated see simpleUartLib
-- documentation.
--
-- You can also use the $AJIT_PROJECT_HOME/tools/misc/bin/calculateBaudControlWord
-- utility to figure out this word.  CAREFUL: do not overflow the
-- fields.   Remember that a 1% variation in frequency is tolerable to
-- the UART.  Adjust your clock frequency to take advantage of this
-- and avoid the overflow problem.
--
entity configurable_uart is
	port (clk, reset: in std_logic;
		UART_RX: in std_logic_vector(0 downto 0);	
		UART_TX: out std_logic_vector(0 downto 0);	

		TX_to_CONSOLE_pipe_write_data: in std_logic_vector(7 downto 0);
		TX_to_CONSOLE_pipe_write_req:  in std_logic_vector(0 downto 0);
		TX_to_CONSOLE_pipe_write_ack:  out std_logic_vector(0 downto 0);

		CONSOLE_to_RX_pipe_read_data : out std_logic_vector(7 downto 0);
		CONSOLE_to_RX_pipe_read_req :  in std_logic_vector(0 downto 0);
		CONSOLE_to_RX_pipe_read_ack :  out std_logic_vector(0 downto 0);

		CONFIG_UART_BAUD_CONTROL_WORD: in std_logic_vector(31 downto 0)
	);
end entity configurable_uart;

architecture Struct of configurable_uart is
	
	-- Give it a few dozen cycles to reset.
	-- so that the configuration word is correctly
	-- set up.
	signal soft_reset: std_logic;
	signal counter: integer range 0 to 255;
	
begin

	process(clk, reset)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				counter <= 0;
				soft_reset <= '1';
			else 
				if(counter = 255) then
					soft_reset <= '0';
					counter <= 0;
				else
					counter <= counter + 1;
				end if;
			end if;
		end if;
	end process;

	uart_inst: uartTopPortConfigurable
		port map (
				reset => reset,
				clk => clk,
				soft_reset => soft_reset,
				serIn     => UART_RX(0),	
				serOut    => UART_TX(0),	
				baudFreq  =>  CONFIG_UART_BAUD_CONTROL_WORD(11 downto 0),
				baudLimit => CONFIG_UART_BAUD_CONTROL_WORD(31 downto 16),
	 			uart_rx_pipe_read_data => CONSOLE_to_RX_pipe_read_data,
	 			uart_rx_pipe_read_req => CONSOLE_to_RX_pipe_read_req,
	 			uart_rx_pipe_read_ack => CONSOLE_to_RX_pipe_read_ack,
	 			uart_tx_pipe_write_data => TX_to_CONSOLE_pipe_write_data,
	 			uart_tx_pipe_write_req => TX_to_CONSOLE_pipe_write_req,
	 			uart_tx_pipe_write_ack => TX_to_CONSOLE_pipe_write_ack
		);

end Struct;
	
