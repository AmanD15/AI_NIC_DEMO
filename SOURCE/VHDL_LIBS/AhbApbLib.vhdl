library ieee;
use ieee.std_logic_1164.all;

package AhbApbLibComponents is

  component afb_ahb_lite_master is -- 
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
  end component afb_ahb_lite_master;
  component ahblite_controller is
	port (
		-- connections to AFB-AHB bridge
		AFB_TO_AHB_COMMAND_pipe_write_req: in  std_logic_vector(0 downto 0);
		AFB_TO_AHB_COMMAND_pipe_write_ack: out std_logic_vector(0 downto 0);
		AFB_TO_AHB_COMMAND_pipe_write_data: in std_logic_vector(72 downto 0);
		-- 
		AHB_TO_AFB_RESPONSE_pipe_read_req: in  std_logic_vector(0 downto 0);
		AHB_TO_AFB_RESPONSE_pipe_read_ack: out std_logic_vector(0 downto 0);
		AHB_TO_AFB_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
		-- AHB bus signals
		HADDR: out std_logic_vector(35 downto 0);
		HTRANS: out std_logic_vector(1 downto 0); -- non-sequential, sequential, idle, busy
		HWRITE: out std_logic_vector(0 downto 0); -- when '1' its a write.
		HSIZE: out std_logic_vector(2 downto 0); -- transfer size in bytes.
		HBURST: out std_logic_vector(2 downto 0); -- burst size.
		HMASTLOCK: out std_logic_vector(0 downto 0); -- locked transaction.. for swap etc.
		HPROT: out std_logic_vector(3 downto 0); -- protection bits..
		HWDATA: out std_logic_vector(31 downto 0); -- write data.
		HRDATA: in std_logic_vector(31 downto 0); -- read data.
		HREADY: in std_logic_vector(0 downto 0); -- slave ready.
		HRESP: in std_logic_vector(1 downto 0); -- okay, error, retry, split (slave responses).
		SYS_CLK: out std_logic_vector(0 downto 0);
		-- clock, reset.
		clk: in std_logic;
		reset: in std_logic 
	     );
   end component ahblite_controller;
   component afb_ahb_bridge is -- 
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

   component ajit_apb_master is
	port (
		-- AJIT system bus
		ajit_to_env_write_req: in  std_logic;
		ajit_to_env_write_ack: out std_logic;
		ajit_to_env_addr: in std_logic_vector(31 downto 0);
		ajit_to_env_data: in std_logic_vector(31 downto 0);
		ajit_to_env_read_write_bar: in std_logic;
		-- top-bit error, rest data.
		env_to_ajit_error : out std_logic;
		env_to_ajit_read_data : out std_logic_vector(31 downto 0);
		env_to_ajit_read_req: in std_logic;
		env_to_ajit_read_ack: out std_logic;
		-- APB bus signals
		PRESETn: out std_logic;
		PCLK: out std_logic;
		PADDR: out std_logic_vector(31 downto 0);
		PWRITE: out std_logic; -- when '1' its a write.
		PWDATA: out std_logic_vector(31 downto 0); -- write data.
		PRDATA: in std_logic_vector(31 downto 0); -- read data.
		PREADY: in std_logic; -- slave ready.
		PENABLE: out std_logic; -- enable..
		PSLVERR: in std_logic; -- error from slave.
		PSEL : out std_logic; -- slave select 
		-- clock, reset.
		clk: in std_logic;
		reset: in std_logic 
	     );
   end component ajit_apb_master;

   component ajit_ahb_lite_master is
	port (
		-- AJIT system bus
		ajit_to_env_write_req: in  std_logic;
		ajit_to_env_write_ack: out std_logic;
		ajit_to_env_addr: in std_logic_vector(35 downto 0);
		ajit_to_env_data: in std_logic_vector(31 downto 0);
		ajit_to_env_transfer_size: in std_logic_vector(2 downto 0);
		ajit_to_env_read_write_bar: in std_logic;
		ajit_to_env_lock: in std_logic;
		-- top-bit error, rest data.
		env_to_ajit_error : out std_logic;
		env_to_ajit_read_data : out std_logic_vector(31 downto 0);
		env_to_ajit_read_req: in std_logic;
		env_to_ajit_read_ack: out std_logic;
		-- AHB bus signals
		HADDR: out std_logic_vector(35 downto 0);
		HTRANS: out std_logic_vector(1 downto 0); -- non-sequential, sequential, idle, busy
		HWRITE: out std_logic; -- when '1' its a write.
		HSIZE: out std_logic_vector(2 downto 0); -- transfer size in bytes.
		HBURST: out std_logic_vector(2 downto 0); -- burst size.
		HMASTLOCK: out std_logic; -- locked transaction.. for swap etc.
		HPROT: out std_logic_vector(3 downto 0); -- protection bits..
		HWDATA: out std_logic_vector(31 downto 0); -- write data.
		HRDATA: in std_logic_vector(31 downto 0); -- read data.
		HREADY: in std_logic; -- slave ready.
		HRESP: in std_logic_vector(1 downto 0); -- okay, error, retry, split (slave responses).
		-- clock, reset.
		clk: in std_logic;
		reset: in std_logic 
	     );
	end component ajit_ahb_lite_master;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.Types.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;
library AhbApbLib;
use AhbApbLib.AhbApbLibComponents.all;

entity ahblite_controller is
	port (
		-- connections to AFB-AHB bridge
		AFB_TO_AHB_COMMAND_pipe_write_req: in  std_logic_vector(0 downto 0);
		AFB_TO_AHB_COMMAND_pipe_write_ack: out std_logic_vector(0 downto 0);
		AFB_TO_AHB_COMMAND_pipe_write_data: in std_logic_vector(72 downto 0);
		-- 
		AHB_TO_AFB_RESPONSE_pipe_read_req: in  std_logic_vector(0 downto 0);
		AHB_TO_AFB_RESPONSE_pipe_read_ack: out std_logic_vector(0 downto 0);
		AHB_TO_AFB_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
		-- AHB bus signals
		HADDR: out std_logic_vector(35 downto 0);
		HTRANS: out std_logic_vector(1 downto 0); -- non-sequential, sequential, idle, busy
		HWRITE: out std_logic_vector(0 downto 0); -- when '1' its a write.
		HSIZE: out std_logic_vector(2 downto 0); -- transfer size in bytes.
		HBURST: out std_logic_vector(2 downto 0); -- burst size.
		HMASTLOCK: out std_logic_vector(0 downto 0); -- locked transaction.. for swap etc.
		HPROT: out std_logic_vector(3 downto 0); -- protection bits..
		HWDATA: out std_logic_vector(31 downto 0); -- write data.
		HRDATA: in std_logic_vector(31 downto 0); -- read data.
		HREADY: in std_logic_vector(0 downto 0); -- slave ready.
		HRESP: in std_logic_vector(1 downto 0); -- okay, error, retry, split (slave responses).
		SYS_CLK: out std_logic_vector(0 downto 0);
		-- clock, reset.
		clk: in std_logic;
		reset: in std_logic 
	     );
end entity ahblite_controller;


architecture struct_arch of ahblite_controller is

	signal ajit_to_env_addr: std_logic_vector(35 downto 0);
	signal ajit_to_env_write_data: std_logic_vector(31 downto 0);
	signal ajit_to_env_read_write_bar: std_logic;
	signal ajit_to_env_transfer_size: std_logic_vector(2 downto 0);
	signal ajit_to_env_lock: std_logic;
	signal ajit_to_env_write_req: std_logic;
	signal ajit_to_env_write_ack: std_logic;

	signal env_to_ajit_read_data: std_logic_vector(31 downto 0);
	signal env_to_ajit_error: std_logic;
	signal env_to_ajit_read_req: std_logic;
	signal env_to_ajit_read_ack: std_logic;
	
begin
	SYS_CLK(0) <= clk;

	-- AHB -> AFB
	AHB_TO_AFB_RESPONSE_pipe_read_data (31 downto 0)   <= env_to_ajit_read_data;
	AHB_TO_AFB_RESPONSE_pipe_read_data (32)   <= env_to_ajit_error;

	AHB_TO_AFB_RESPONSE_pipe_read_ack(0)  <= env_to_ajit_read_ack;
	env_to_ajit_read_req <= AHB_TO_AFB_RESPONSE_pipe_read_req(0);

	-- AFB -> AHB
	ajit_to_env_write_data <= AFB_TO_AHB_COMMAND_pipe_write_data(31 downto 0);
	ajit_to_env_addr <= AFB_TO_AHB_COMMAND_pipe_write_data(67 downto 32);
	ajit_to_env_transfer_size <= AFB_TO_AHB_COMMAND_pipe_write_data(70 downto 68);
	ajit_to_env_read_write_bar <= AFB_TO_AHB_COMMAND_pipe_write_data(71);
	ajit_to_env_lock <= AFB_TO_AHB_COMMAND_pipe_write_data(72);

	ajit_to_env_write_req  <= AFB_TO_AHB_COMMAND_pipe_write_req(0);
	AFB_TO_AHB_COMMAND_pipe_write_ack(0) <= ajit_to_env_write_ack;

	ahbCtrl: ajit_ahb_lite_master 
			port map (
				-- AJIT system bus
				ajit_to_env_write_req => ajit_to_env_write_req,
				ajit_to_env_write_ack => ajit_to_env_write_ack,
				ajit_to_env_addr => ajit_to_env_addr,
				ajit_to_env_data => ajit_to_env_write_data,
				ajit_to_env_transfer_size => ajit_to_env_transfer_size,
				ajit_to_env_read_write_bar => ajit_to_env_read_write_bar,
				ajit_to_env_lock => ajit_to_env_lock,
				-- top-bit error, rest data.,
				env_to_ajit_error  => env_to_ajit_error ,
				env_to_ajit_read_data  => env_to_ajit_read_data ,
				env_to_ajit_read_req => env_to_ajit_read_req,
				env_to_ajit_read_ack => env_to_ajit_read_ack,
				-- AHB bus signals,
				HADDR => HADDR,
				HTRANS => HTRANS,
				HWRITE => HWRITE(0),
				HSIZE => HSIZE,
				HBURST => HBURST,
				HMASTLOCK => HMASTLOCK(0),
				HPROT => HPROT,
				HWDATA => HWDATA,
				HRDATA => HRDATA,
				HREADY => HREADY(0),
				HRESP => HRESP,
				-- clock, reset.
				clk  => clk ,
				reset  => reset 
				);
	
end struct_arch;

-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package afb_ahb_bridge_global_package is -- 
  constant default_mem_pool_base_address : std_logic_vector(0 downto 0) := "0";
  component afb_ahb_bridge is -- 
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
end package afb_ahb_bridge_global_package;
-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
library AhbApbLib;
use AhbApbLib.afb_ahb_bridge_global_package.all;
entity afb_ahb_bridge_daemon is -- 
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
end entity afb_ahb_bridge_daemon;
architecture afb_ahb_bridge_daemon_arch of afb_ahb_bridge_daemon is -- 
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
  signal afb_ahb_bridge_daemon_CP_9_start: Boolean;
  signal afb_ahb_bridge_daemon_CP_9_symbol: Boolean;
  -- volatile/operator module components. 
  component create_ahb_commands_Volatile is -- 
    port ( -- 
      mem_adapter_command : in  std_logic_vector(73 downto 0);
      command_to_ahb : out  std_logic_vector(72 downto 0)-- 
    );
    -- 
  end component; 
  -- links between control-path and data-path
  signal do_while_stmt_401_branch_req_0 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_404_inst_req_0 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_404_inst_ack_0 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_404_inst_req_1 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_404_inst_ack_1 : boolean;
  signal WPIPE_AFB_TO_AHB_COMMAND_446_inst_req_0 : boolean;
  signal WPIPE_AFB_TO_AHB_COMMAND_446_inst_ack_0 : boolean;
  signal WPIPE_AFB_TO_AHB_COMMAND_446_inst_req_1 : boolean;
  signal WPIPE_AFB_TO_AHB_COMMAND_446_inst_ack_1 : boolean;
  signal RPIPE_AHB_TO_AFB_RESPONSE_450_inst_req_0 : boolean;
  signal RPIPE_AHB_TO_AFB_RESPONSE_450_inst_ack_0 : boolean;
  signal RPIPE_AHB_TO_AFB_RESPONSE_450_inst_req_1 : boolean;
  signal RPIPE_AHB_TO_AFB_RESPONSE_450_inst_ack_1 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_465_inst_req_0 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_465_inst_ack_0 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_465_inst_req_1 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_465_inst_ack_1 : boolean;
  signal do_while_stmt_401_branch_ack_0 : boolean;
  signal do_while_stmt_401_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "afb_ahb_bridge_daemon_input_buffer", -- 
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
  afb_ahb_bridge_daemon_CP_9_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "afb_ahb_bridge_daemon_out_buffer", -- 
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
    preds <= afb_ahb_bridge_daemon_CP_9_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
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
    preds <= afb_ahb_bridge_daemon_CP_9_start & tag_ilock_write_ack_symbol;
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
    preds <= afb_ahb_bridge_daemon_CP_9_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  afb_ahb_bridge_daemon_CP_9: Block -- control-path 
    signal afb_ahb_bridge_daemon_CP_9_elements: BooleanArray(28 downto 0);
    -- 
  begin -- 
    afb_ahb_bridge_daemon_CP_9_elements(0) <= afb_ahb_bridge_daemon_CP_9_start;
    afb_ahb_bridge_daemon_CP_9_symbol <= afb_ahb_bridge_daemon_CP_9_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_400/$entry
      -- CP-element group 0: 	 branch_block_stmt_400/branch_block_stmt_400__entry__
      -- CP-element group 0: 	 branch_block_stmt_400/do_while_stmt_401__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	28 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_400/$exit
      -- CP-element group 1: 	 branch_block_stmt_400/branch_block_stmt_400__exit__
      -- CP-element group 1: 	 branch_block_stmt_400/do_while_stmt_401__exit__
      -- 
    afb_ahb_bridge_daemon_CP_9_elements(1) <= afb_ahb_bridge_daemon_CP_9_elements(28);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_400/do_while_stmt_401/$entry
      -- CP-element group 2: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401__entry__
      -- 
    afb_ahb_bridge_daemon_CP_9_elements(2) <= afb_ahb_bridge_daemon_CP_9_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	28 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401__exit__
      -- 
    -- Element group afb_ahb_bridge_daemon_CP_9_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_400/do_while_stmt_401/loop_back
      -- 
    -- Element group afb_ahb_bridge_daemon_CP_9_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	24 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	26 
    -- CP-element group 5: 	27 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_400/do_while_stmt_401/condition_done
      -- CP-element group 5: 	 branch_block_stmt_400/do_while_stmt_401/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_400/do_while_stmt_401/loop_taken/$entry
      -- 
    afb_ahb_bridge_daemon_CP_9_elements(5) <= afb_ahb_bridge_daemon_CP_9_elements(24);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	25 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_400/do_while_stmt_401/loop_body_done
      -- 
    afb_ahb_bridge_daemon_CP_9_elements(6) <= afb_ahb_bridge_daemon_CP_9_elements(25);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/back_edge_to_loop_body
      -- 
    afb_ahb_bridge_daemon_CP_9_elements(7) <= afb_ahb_bridge_daemon_CP_9_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/first_time_through_loop_body
      -- 
    afb_ahb_bridge_daemon_CP_9_elements(8) <= afb_ahb_bridge_daemon_CP_9_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	17 
    -- CP-element group 9: 	24 
    -- CP-element group 9: 	10 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/loop_body_start
      -- 
    -- Element group afb_ahb_bridge_daemon_CP_9_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	9 
    -- CP-element group 10: marked-predecessors 
    -- CP-element group 10: 	13 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	12 
    -- CP-element group 10:  members (3) 
      -- CP-element group 10: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_sample_start_
      -- CP-element group 10: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_Sample/$entry
      -- CP-element group 10: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_Sample/rr
      -- 
    rr_42_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_42_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_ahb_bridge_daemon_CP_9_elements(10), ack => RPIPE_AFB_BUS_REQUEST_404_inst_req_0); -- 
    afb_ahb_bridge_daemon_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 41) := "afb_ahb_bridge_daemon_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_ahb_bridge_daemon_CP_9_elements(9) & afb_ahb_bridge_daemon_CP_9_elements(13);
      gj_afb_ahb_bridge_daemon_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_ahb_bridge_daemon_CP_9_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	12 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	15 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_update_start_
      -- CP-element group 11: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_Update/$entry
      -- CP-element group 11: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_Update/cr
      -- 
    cr_47_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_47_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_ahb_bridge_daemon_CP_9_elements(11), ack => RPIPE_AFB_BUS_REQUEST_404_inst_req_1); -- 
    afb_ahb_bridge_daemon_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 41) := "afb_ahb_bridge_daemon_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_ahb_bridge_daemon_CP_9_elements(12) & afb_ahb_bridge_daemon_CP_9_elements(15);
      gj_afb_ahb_bridge_daemon_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_ahb_bridge_daemon_CP_9_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  transition  input  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	10 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	11 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_Sample/$exit
      -- CP-element group 12: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_Sample/ra
      -- 
    ra_43_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_BUS_REQUEST_404_inst_ack_0, ack => afb_ahb_bridge_daemon_CP_9_elements(12)); -- 
    -- CP-element group 13:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	14 
    -- CP-element group 13: marked-successors 
    -- CP-element group 13: 	10 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_update_completed_
      -- CP-element group 13: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_Update/$exit
      -- CP-element group 13: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AFB_BUS_REQUEST_404_Update/ca
      -- 
    ca_48_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_BUS_REQUEST_404_inst_ack_1, ack => afb_ahb_bridge_daemon_CP_9_elements(13)); -- 
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	13 
    -- CP-element group 14: marked-predecessors 
    -- CP-element group 14: 	16 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	15 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_sample_start_
      -- CP-element group 14: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_Sample/$entry
      -- CP-element group 14: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_Sample/req
      -- 
    req_56_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_56_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_ahb_bridge_daemon_CP_9_elements(14), ack => WPIPE_AFB_TO_AHB_COMMAND_446_inst_req_0); -- 
    afb_ahb_bridge_daemon_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 41) := "afb_ahb_bridge_daemon_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_ahb_bridge_daemon_CP_9_elements(13) & afb_ahb_bridge_daemon_CP_9_elements(16);
      gj_afb_ahb_bridge_daemon_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_ahb_bridge_daemon_CP_9_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	14 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	16 
    -- CP-element group 15: marked-successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (6) 
      -- CP-element group 15: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_update_start_
      -- CP-element group 15: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_Sample/$exit
      -- CP-element group 15: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_Sample/ack
      -- CP-element group 15: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_Update/$entry
      -- CP-element group 15: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_Update/req
      -- 
    ack_57_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_TO_AHB_COMMAND_446_inst_ack_0, ack => afb_ahb_bridge_daemon_CP_9_elements(15)); -- 
    req_61_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_61_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_ahb_bridge_daemon_CP_9_elements(15), ack => WPIPE_AFB_TO_AHB_COMMAND_446_inst_req_1); -- 
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	15 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	25 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	14 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_Update/$exit
      -- CP-element group 16: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_TO_AHB_COMMAND_446_Update/ack
      -- 
    ack_62_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_TO_AHB_COMMAND_446_inst_ack_1, ack => afb_ahb_bridge_daemon_CP_9_elements(16)); -- 
    -- CP-element group 17:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	9 
    -- CP-element group 17: marked-predecessors 
    -- CP-element group 17: 	20 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_sample_start_
      -- CP-element group 17: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_Sample/$entry
      -- CP-element group 17: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_Sample/rr
      -- 
    rr_70_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_70_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_ahb_bridge_daemon_CP_9_elements(17), ack => RPIPE_AHB_TO_AFB_RESPONSE_450_inst_req_0); -- 
    afb_ahb_bridge_daemon_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 41) := "afb_ahb_bridge_daemon_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_ahb_bridge_daemon_CP_9_elements(9) & afb_ahb_bridge_daemon_CP_9_elements(20);
      gj_afb_ahb_bridge_daemon_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_ahb_bridge_daemon_CP_9_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	19 
    -- CP-element group 18: marked-predecessors 
    -- CP-element group 18: 	22 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	20 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_update_start_
      -- CP-element group 18: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_Update/$entry
      -- CP-element group 18: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_Update/cr
      -- 
    cr_75_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_75_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_ahb_bridge_daemon_CP_9_elements(18), ack => RPIPE_AHB_TO_AFB_RESPONSE_450_inst_req_1); -- 
    afb_ahb_bridge_daemon_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 41) := "afb_ahb_bridge_daemon_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_ahb_bridge_daemon_CP_9_elements(19) & afb_ahb_bridge_daemon_CP_9_elements(22);
      gj_afb_ahb_bridge_daemon_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_ahb_bridge_daemon_CP_9_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	18 
    -- CP-element group 19:  members (3) 
      -- CP-element group 19: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_sample_completed_
      -- CP-element group 19: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_Sample/$exit
      -- CP-element group 19: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_Sample/ra
      -- 
    ra_71_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AHB_TO_AFB_RESPONSE_450_inst_ack_0, ack => afb_ahb_bridge_daemon_CP_9_elements(19)); -- 
    -- CP-element group 20:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	18 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	21 
    -- CP-element group 20: marked-successors 
    -- CP-element group 20: 	17 
    -- CP-element group 20:  members (3) 
      -- CP-element group 20: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_Update/$exit
      -- CP-element group 20: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/RPIPE_AHB_TO_AFB_RESPONSE_450_Update/ca
      -- 
    ca_76_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AHB_TO_AFB_RESPONSE_450_inst_ack_1, ack => afb_ahb_bridge_daemon_CP_9_elements(20)); -- 
    -- CP-element group 21:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	20 
    -- CP-element group 21: marked-predecessors 
    -- CP-element group 21: 	23 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	22 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_sample_start_
      -- CP-element group 21: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_Sample/$entry
      -- CP-element group 21: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_Sample/req
      -- 
    req_84_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_84_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_ahb_bridge_daemon_CP_9_elements(21), ack => WPIPE_AFB_BUS_RESPONSE_465_inst_req_0); -- 
    afb_ahb_bridge_daemon_cp_element_group_21: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 41) := "afb_ahb_bridge_daemon_cp_element_group_21"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_ahb_bridge_daemon_CP_9_elements(20) & afb_ahb_bridge_daemon_CP_9_elements(23);
      gj_afb_ahb_bridge_daemon_cp_element_group_21 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_ahb_bridge_daemon_CP_9_elements(21), clk => clk, reset => reset); --
    end block;
    -- CP-element group 22:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	21 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	23 
    -- CP-element group 22: marked-successors 
    -- CP-element group 22: 	18 
    -- CP-element group 22:  members (6) 
      -- CP-element group 22: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_sample_completed_
      -- CP-element group 22: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_update_start_
      -- CP-element group 22: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_Sample/$exit
      -- CP-element group 22: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_Sample/ack
      -- CP-element group 22: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_Update/$entry
      -- CP-element group 22: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_Update/req
      -- 
    ack_85_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_BUS_RESPONSE_465_inst_ack_0, ack => afb_ahb_bridge_daemon_CP_9_elements(22)); -- 
    req_89_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_89_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_ahb_bridge_daemon_CP_9_elements(22), ack => WPIPE_AFB_BUS_RESPONSE_465_inst_req_1); -- 
    -- CP-element group 23:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	22 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	25 
    -- CP-element group 23: marked-successors 
    -- CP-element group 23: 	21 
    -- CP-element group 23:  members (3) 
      -- CP-element group 23: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_update_completed_
      -- CP-element group 23: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_Update/$exit
      -- CP-element group 23: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/WPIPE_AFB_BUS_RESPONSE_465_Update/ack
      -- 
    ack_90_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_BUS_RESPONSE_465_inst_ack_1, ack => afb_ahb_bridge_daemon_CP_9_elements(23)); -- 
    -- CP-element group 24:  transition  output  delay-element  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	9 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	5 
    -- CP-element group 24:  members (2) 
      -- CP-element group 24: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/condition_evaluated
      -- CP-element group 24: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/loop_body_delay_to_condition_start
      -- 
    condition_evaluated_33_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_33_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_ahb_bridge_daemon_CP_9_elements(24), ack => do_while_stmt_401_branch_req_0); -- 
    -- Element group afb_ahb_bridge_daemon_CP_9_elements(24) is a control-delay.
    cp_element_24_delay: control_delay_element  generic map(name => " 24_delay", delay_value => 1)  port map(req => afb_ahb_bridge_daemon_CP_9_elements(9), ack => afb_ahb_bridge_daemon_CP_9_elements(24), clk => clk, reset =>reset);
    -- CP-element group 25:  join  transition  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	16 
    -- CP-element group 25: 	23 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	6 
    -- CP-element group 25:  members (1) 
      -- CP-element group 25: 	 branch_block_stmt_400/do_while_stmt_401/do_while_stmt_401_loop_body/$exit
      -- 
    afb_ahb_bridge_daemon_cp_element_group_25: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 41) := "afb_ahb_bridge_daemon_cp_element_group_25"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_ahb_bridge_daemon_CP_9_elements(16) & afb_ahb_bridge_daemon_CP_9_elements(23);
      gj_afb_ahb_bridge_daemon_cp_element_group_25 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_ahb_bridge_daemon_CP_9_elements(25), clk => clk, reset => reset); --
    end block;
    -- CP-element group 26:  transition  input  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	5 
    -- CP-element group 26: successors 
    -- CP-element group 26:  members (2) 
      -- CP-element group 26: 	 branch_block_stmt_400/do_while_stmt_401/loop_exit/$exit
      -- CP-element group 26: 	 branch_block_stmt_400/do_while_stmt_401/loop_exit/ack
      -- 
    ack_95_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 26_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_401_branch_ack_0, ack => afb_ahb_bridge_daemon_CP_9_elements(26)); -- 
    -- CP-element group 27:  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	5 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (2) 
      -- CP-element group 27: 	 branch_block_stmt_400/do_while_stmt_401/loop_taken/$exit
      -- CP-element group 27: 	 branch_block_stmt_400/do_while_stmt_401/loop_taken/ack
      -- 
    ack_99_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_401_branch_ack_1, ack => afb_ahb_bridge_daemon_CP_9_elements(27)); -- 
    -- CP-element group 28:  transition  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	3 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	1 
    -- CP-element group 28:  members (1) 
      -- CP-element group 28: 	 branch_block_stmt_400/do_while_stmt_401/$exit
      -- 
    afb_ahb_bridge_daemon_CP_9_elements(28) <= afb_ahb_bridge_daemon_CP_9_elements(3);
    afb_ahb_bridge_daemon_do_while_stmt_401_terminator_100: loop_terminator -- 
      generic map (name => " afb_ahb_bridge_daemon_do_while_stmt_401_terminator_100", max_iterations_in_flight =>15) 
      port map(loop_body_exit => afb_ahb_bridge_daemon_CP_9_elements(6),loop_continue => afb_ahb_bridge_daemon_CP_9_elements(27),loop_terminate => afb_ahb_bridge_daemon_CP_9_elements(26),loop_back => afb_ahb_bridge_daemon_CP_9_elements(4),loop_exit => afb_ahb_bridge_daemon_CP_9_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_34_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= afb_ahb_bridge_daemon_CP_9_elements(7);
        preds(1)  <= afb_ahb_bridge_daemon_CP_9_elements(8);
        entry_tmerge_34 : transition_merge -- 
          generic map(name => " entry_tmerge_34")
          port map (preds => preds, symbol_out => afb_ahb_bridge_daemon_CP_9_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u1_u2_435_wire : std_logic_vector(1 downto 0);
    signal CONCAT_u2_u6_437_wire : std_logic_vector(5 downto 0);
    signal CONCAT_u36_u68_440_wire : std_logic_vector(67 downto 0);
    signal access_error_455 : std_logic_vector(0 downto 0);
    signal addr36_421 : std_logic_vector(35 downto 0);
    signal ahb_command_445 : std_logic_vector(72 downto 0);
    signal ahb_response_451 : std_logic_vector(32 downto 0);
    signal byte_mask_417 : std_logic_vector(3 downto 0);
    signal command_405 : std_logic_vector(73 downto 0);
    signal data_out_mem_459 : std_logic_vector(31 downto 0);
    signal konst_469_wire_constant : std_logic_vector(0 downto 0);
    signal lock_flag_409 : std_logic_vector(0 downto 0);
    signal read_write_bar_413 : std_logic_vector(0 downto 0);
    signal to_afb_464 : std_logic_vector(32 downto 0);
    signal to_mem_adapter_442 : std_logic_vector(73 downto 0);
    signal wdata_32_425 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    konst_469_wire_constant <= "1";
    -- flow-through slice operator slice_408_inst
    lock_flag_409 <= command_405(73 downto 73);
    -- flow-through slice operator slice_412_inst
    read_write_bar_413 <= command_405(72 downto 72);
    -- flow-through slice operator slice_416_inst
    byte_mask_417 <= command_405(71 downto 68);
    -- flow-through slice operator slice_420_inst
    addr36_421 <= command_405(67 downto 32);
    -- flow-through slice operator slice_424_inst
    wdata_32_425 <= command_405(31 downto 0);
    -- flow-through slice operator slice_454_inst
    access_error_455 <= ahb_response_451(32 downto 32);
    -- flow-through slice operator slice_458_inst
    data_out_mem_459 <= ahb_response_451(31 downto 0);
    do_while_stmt_401_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_469_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_401_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_401_branch_req_0,
          ack0 => do_while_stmt_401_branch_ack_0,
          ack1 => do_while_stmt_401_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- flow through binary operator CONCAT_u1_u2_435_inst
    process(lock_flag_409, read_write_bar_413) -- 
      variable tmp_var : std_logic_vector(1 downto 0); -- 
    begin -- 
      ApConcat_proc(lock_flag_409, read_write_bar_413, tmp_var);
      CONCAT_u1_u2_435_wire <= tmp_var; --
    end process;
    -- flow through binary operator CONCAT_u1_u33_463_inst
    process(access_error_455, data_out_mem_459) -- 
      variable tmp_var : std_logic_vector(32 downto 0); -- 
    begin -- 
      ApConcat_proc(access_error_455, data_out_mem_459, tmp_var);
      to_afb_464 <= tmp_var; --
    end process;
    -- flow through binary operator CONCAT_u2_u6_437_inst
    process(CONCAT_u1_u2_435_wire, byte_mask_417) -- 
      variable tmp_var : std_logic_vector(5 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u1_u2_435_wire, byte_mask_417, tmp_var);
      CONCAT_u2_u6_437_wire <= tmp_var; --
    end process;
    -- flow through binary operator CONCAT_u36_u68_440_inst
    process(addr36_421, wdata_32_425) -- 
      variable tmp_var : std_logic_vector(67 downto 0); -- 
    begin -- 
      ApConcat_proc(addr36_421, wdata_32_425, tmp_var);
      CONCAT_u36_u68_440_wire <= tmp_var; --
    end process;
    -- flow through binary operator CONCAT_u6_u74_441_inst
    process(CONCAT_u2_u6_437_wire, CONCAT_u36_u68_440_wire) -- 
      variable tmp_var : std_logic_vector(73 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u2_u6_437_wire, CONCAT_u36_u68_440_wire, tmp_var);
      to_mem_adapter_442 <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_AFB_BUS_REQUEST_404_inst 
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
      reqL_unguarded(0) <= RPIPE_AFB_BUS_REQUEST_404_inst_req_0;
      RPIPE_AFB_BUS_REQUEST_404_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_BUS_REQUEST_404_inst_req_1;
      RPIPE_AFB_BUS_REQUEST_404_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      command_405 <= data_out(73 downto 0);
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
    -- shared inport operator group (1) : RPIPE_AHB_TO_AFB_RESPONSE_450_inst 
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
      reqL_unguarded(0) <= RPIPE_AHB_TO_AFB_RESPONSE_450_inst_req_0;
      RPIPE_AHB_TO_AFB_RESPONSE_450_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AHB_TO_AFB_RESPONSE_450_inst_req_1;
      RPIPE_AHB_TO_AFB_RESPONSE_450_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      ahb_response_451 <= data_out(32 downto 0);
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
    -- shared outport operator group (0) : WPIPE_AFB_BUS_RESPONSE_465_inst 
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
      sample_req_unguarded(0) <= WPIPE_AFB_BUS_RESPONSE_465_inst_req_0;
      WPIPE_AFB_BUS_RESPONSE_465_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_BUS_RESPONSE_465_inst_req_1;
      WPIPE_AFB_BUS_RESPONSE_465_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= to_afb_464;
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
    -- shared outport operator group (1) : WPIPE_AFB_TO_AHB_COMMAND_446_inst 
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
      sample_req_unguarded(0) <= WPIPE_AFB_TO_AHB_COMMAND_446_inst_req_0;
      WPIPE_AFB_TO_AHB_COMMAND_446_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_TO_AHB_COMMAND_446_inst_req_1;
      WPIPE_AFB_TO_AHB_COMMAND_446_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= ahb_command_445;
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
    volatile_operator_create_ahb_commands_530: create_ahb_commands_Volatile port map(mem_adapter_command => to_mem_adapter_442, command_to_ahb => ahb_command_445); 
    -- 
  end Block; -- data_path
  -- 
end afb_ahb_bridge_daemon_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
library AhbApbLib;
use AhbApbLib.afb_ahb_bridge_global_package.all;
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
    signal CONCAT_u1_u2_386_wire : std_logic_vector(1 downto 0);
    signal CONCAT_u2_u5_388_wire : std_logic_vector(4 downto 0);
    signal CONCAT_u36_u68_395_wire : std_logic_vector(67 downto 0);
    signal MUX_394_wire : std_logic_vector(31 downto 0);
    signal addr_365 : std_logic_vector(35 downto 0);
    signal addr_with_byte_offset_382 : std_logic_vector(35 downto 0);
    signal ahb_transfer_size_375 : std_logic_vector(2 downto 0);
    signal bmask_360 : std_logic_vector(3 downto 0);
    signal byte_offset_372 : std_logic_vector(1 downto 0);
    signal lock_flag_352 : std_logic_vector(0 downto 0);
    signal rw_356 : std_logic_vector(0 downto 0);
    signal slice_379_wire : std_logic_vector(33 downto 0);
    signal type_cast_392_wire_constant : std_logic_vector(31 downto 0);
    signal write_data_369 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    type_cast_392_wire_constant <= "00000000000000000000000000000000";
    -- flow-through select operator MUX_394_inst
    MUX_394_wire <= type_cast_392_wire_constant when (rw_356(0) /=  '0') else write_data_369;
    -- flow-through slice operator slice_351_inst
    lock_flag_352 <= mem_adapter_command_buffer(73 downto 73);
    -- flow-through slice operator slice_355_inst
    rw_356 <= mem_adapter_command_buffer(72 downto 72);
    -- flow-through slice operator slice_359_inst
    bmask_360 <= mem_adapter_command_buffer(71 downto 68);
    -- flow-through slice operator slice_364_inst
    addr_365 <= mem_adapter_command_buffer(67 downto 32);
    -- flow-through slice operator slice_368_inst
    write_data_369 <= mem_adapter_command_buffer(31 downto 0);
    -- flow-through slice operator slice_379_inst
    slice_379_wire <= addr_365(35 downto 2);
    -- flow through binary operator CONCAT_u1_u2_386_inst
    process(lock_flag_352, rw_356) -- 
      variable tmp_var : std_logic_vector(1 downto 0); -- 
    begin -- 
      ApConcat_proc(lock_flag_352, rw_356, tmp_var);
      CONCAT_u1_u2_386_wire <= tmp_var; --
    end process;
    -- flow through binary operator CONCAT_u2_u5_388_inst
    process(CONCAT_u1_u2_386_wire, ahb_transfer_size_375) -- 
      variable tmp_var : std_logic_vector(4 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u1_u2_386_wire, ahb_transfer_size_375, tmp_var);
      CONCAT_u2_u5_388_wire <= tmp_var; --
    end process;
    -- flow through binary operator CONCAT_u34_u36_381_inst
    process(slice_379_wire, byte_offset_372) -- 
      variable tmp_var : std_logic_vector(35 downto 0); -- 
    begin -- 
      ApConcat_proc(slice_379_wire, byte_offset_372, tmp_var);
      addr_with_byte_offset_382 <= tmp_var; --
    end process;
    -- flow through binary operator CONCAT_u36_u68_395_inst
    process(addr_with_byte_offset_382, MUX_394_wire) -- 
      variable tmp_var : std_logic_vector(67 downto 0); -- 
    begin -- 
      ApConcat_proc(addr_with_byte_offset_382, MUX_394_wire, tmp_var);
      CONCAT_u36_u68_395_wire <= tmp_var; --
    end process;
    -- flow through binary operator CONCAT_u5_u73_396_inst
    process(CONCAT_u2_u5_388_wire, CONCAT_u36_u68_395_wire) -- 
      variable tmp_var : std_logic_vector(72 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u2_u5_388_wire, CONCAT_u36_u68_395_wire, tmp_var);
      command_to_ahb_buffer <= tmp_var; --
    end process;
    volatile_operator_get_byte_offset_397: get_byte_offset_Volatile port map(bmask => bmask_360, byte_offset => byte_offset_372); 
    volatile_operator_get_ahb_hsize_398: get_ahb_hsize_Volatile port map(bmask => bmask_360, t_size => ahb_transfer_size_375); 
    -- 
  end Block; -- data_path
  -- 
end create_ahb_commands_Volatile_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
library AhbApbLib;
use AhbApbLib.afb_ahb_bridge_global_package.all;
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
    signal EQ_u4_u1_283_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_290_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_298_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_305_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_314_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_321_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_329_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_336_wire : std_logic_vector(0 downto 0);
    signal MUX_287_wire : std_logic_vector(2 downto 0);
    signal MUX_294_wire : std_logic_vector(2 downto 0);
    signal MUX_302_wire : std_logic_vector(2 downto 0);
    signal MUX_309_wire : std_logic_vector(2 downto 0);
    signal MUX_318_wire : std_logic_vector(2 downto 0);
    signal MUX_325_wire : std_logic_vector(2 downto 0);
    signal MUX_333_wire : std_logic_vector(2 downto 0);
    signal MUX_340_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_295_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_310_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_311_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_326_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_341_wire : std_logic_vector(2 downto 0);
    signal OR_u3_u3_342_wire : std_logic_vector(2 downto 0);
    signal konst_282_wire_constant : std_logic_vector(3 downto 0);
    signal konst_286_wire_constant : std_logic_vector(2 downto 0);
    signal konst_289_wire_constant : std_logic_vector(3 downto 0);
    signal konst_293_wire_constant : std_logic_vector(2 downto 0);
    signal konst_297_wire_constant : std_logic_vector(3 downto 0);
    signal konst_301_wire_constant : std_logic_vector(2 downto 0);
    signal konst_304_wire_constant : std_logic_vector(3 downto 0);
    signal konst_308_wire_constant : std_logic_vector(2 downto 0);
    signal konst_313_wire_constant : std_logic_vector(3 downto 0);
    signal konst_317_wire_constant : std_logic_vector(2 downto 0);
    signal konst_320_wire_constant : std_logic_vector(3 downto 0);
    signal konst_324_wire_constant : std_logic_vector(2 downto 0);
    signal konst_328_wire_constant : std_logic_vector(3 downto 0);
    signal konst_332_wire_constant : std_logic_vector(2 downto 0);
    signal konst_335_wire_constant : std_logic_vector(3 downto 0);
    signal konst_339_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_285_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_292_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_300_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_307_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_316_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_323_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_331_wire_constant : std_logic_vector(2 downto 0);
    signal type_cast_338_wire_constant : std_logic_vector(2 downto 0);
    -- 
  begin -- 
    konst_282_wire_constant <= "0001";
    konst_286_wire_constant <= "000";
    konst_289_wire_constant <= "0010";
    konst_293_wire_constant <= "000";
    konst_297_wire_constant <= "0100";
    konst_301_wire_constant <= "000";
    konst_304_wire_constant <= "1000";
    konst_308_wire_constant <= "000";
    konst_313_wire_constant <= "0011";
    konst_317_wire_constant <= "000";
    konst_320_wire_constant <= "0110";
    konst_324_wire_constant <= "000";
    konst_328_wire_constant <= "1100";
    konst_332_wire_constant <= "000";
    konst_335_wire_constant <= "1111";
    konst_339_wire_constant <= "000";
    type_cast_285_wire_constant <= "000";
    type_cast_292_wire_constant <= "000";
    type_cast_300_wire_constant <= "000";
    type_cast_307_wire_constant <= "000";
    type_cast_316_wire_constant <= "001";
    type_cast_323_wire_constant <= "001";
    type_cast_331_wire_constant <= "001";
    type_cast_338_wire_constant <= "010";
    -- flow-through select operator MUX_287_inst
    MUX_287_wire <= type_cast_285_wire_constant when (EQ_u4_u1_283_wire(0) /=  '0') else konst_286_wire_constant;
    -- flow-through select operator MUX_294_inst
    MUX_294_wire <= type_cast_292_wire_constant when (EQ_u4_u1_290_wire(0) /=  '0') else konst_293_wire_constant;
    -- flow-through select operator MUX_302_inst
    MUX_302_wire <= type_cast_300_wire_constant when (EQ_u4_u1_298_wire(0) /=  '0') else konst_301_wire_constant;
    -- flow-through select operator MUX_309_inst
    MUX_309_wire <= type_cast_307_wire_constant when (EQ_u4_u1_305_wire(0) /=  '0') else konst_308_wire_constant;
    -- flow-through select operator MUX_318_inst
    MUX_318_wire <= type_cast_316_wire_constant when (EQ_u4_u1_314_wire(0) /=  '0') else konst_317_wire_constant;
    -- flow-through select operator MUX_325_inst
    MUX_325_wire <= type_cast_323_wire_constant when (EQ_u4_u1_321_wire(0) /=  '0') else konst_324_wire_constant;
    -- flow-through select operator MUX_333_inst
    MUX_333_wire <= type_cast_331_wire_constant when (EQ_u4_u1_329_wire(0) /=  '0') else konst_332_wire_constant;
    -- flow-through select operator MUX_340_inst
    MUX_340_wire <= type_cast_338_wire_constant when (EQ_u4_u1_336_wire(0) /=  '0') else konst_339_wire_constant;
    -- flow through binary operator EQ_u4_u1_283_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_282_wire_constant, tmp_var);
      EQ_u4_u1_283_wire <= tmp_var; --
    end process;
    -- flow through binary operator EQ_u4_u1_290_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_289_wire_constant, tmp_var);
      EQ_u4_u1_290_wire <= tmp_var; --
    end process;
    -- flow through binary operator EQ_u4_u1_298_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_297_wire_constant, tmp_var);
      EQ_u4_u1_298_wire <= tmp_var; --
    end process;
    -- flow through binary operator EQ_u4_u1_305_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_304_wire_constant, tmp_var);
      EQ_u4_u1_305_wire <= tmp_var; --
    end process;
    -- flow through binary operator EQ_u4_u1_314_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_313_wire_constant, tmp_var);
      EQ_u4_u1_314_wire <= tmp_var; --
    end process;
    -- flow through binary operator EQ_u4_u1_321_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_320_wire_constant, tmp_var);
      EQ_u4_u1_321_wire <= tmp_var; --
    end process;
    -- flow through binary operator EQ_u4_u1_329_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_328_wire_constant, tmp_var);
      EQ_u4_u1_329_wire <= tmp_var; --
    end process;
    -- flow through binary operator EQ_u4_u1_336_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(bmask_buffer, konst_335_wire_constant, tmp_var);
      EQ_u4_u1_336_wire <= tmp_var; --
    end process;
    -- flow through binary operator OR_u3_u3_295_inst
    OR_u3_u3_295_wire <= (MUX_287_wire or MUX_294_wire);
    -- flow through binary operator OR_u3_u3_310_inst
    OR_u3_u3_310_wire <= (MUX_302_wire or MUX_309_wire);
    -- flow through binary operator OR_u3_u3_311_inst
    OR_u3_u3_311_wire <= (OR_u3_u3_295_wire or OR_u3_u3_310_wire);
    -- flow through binary operator OR_u3_u3_326_inst
    OR_u3_u3_326_wire <= (MUX_318_wire or MUX_325_wire);
    -- flow through binary operator OR_u3_u3_341_inst
    OR_u3_u3_341_wire <= (MUX_333_wire or MUX_340_wire);
    -- flow through binary operator OR_u3_u3_342_inst
    OR_u3_u3_342_wire <= (OR_u3_u3_326_wire or OR_u3_u3_341_wire);
    -- flow through binary operator OR_u3_u3_343_inst
    t_size_buffer <= (OR_u3_u3_311_wire or OR_u3_u3_342_wire);
    -- 
  end Block; -- data_path
  -- 
end get_ahb_hsize_Volatile_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
library AhbApbLib;
use AhbApbLib.afb_ahb_bridge_global_package.all;
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
    signal BITSEL_u4_u1_250_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u4_u1_255_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u4_u1_260_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u4_u1_265_wire : std_logic_vector(0 downto 0);
    signal MUX_270_wire : std_logic_vector(1 downto 0);
    signal MUX_271_wire : std_logic_vector(1 downto 0);
    signal MUX_272_wire : std_logic_vector(1 downto 0);
    signal konst_249_wire_constant : std_logic_vector(3 downto 0);
    signal konst_254_wire_constant : std_logic_vector(3 downto 0);
    signal konst_259_wire_constant : std_logic_vector(3 downto 0);
    signal konst_264_wire_constant : std_logic_vector(3 downto 0);
    signal type_cast_252_wire_constant : std_logic_vector(1 downto 0);
    signal type_cast_257_wire_constant : std_logic_vector(1 downto 0);
    signal type_cast_262_wire_constant : std_logic_vector(1 downto 0);
    signal type_cast_267_wire_constant : std_logic_vector(1 downto 0);
    signal type_cast_269_wire_constant : std_logic_vector(1 downto 0);
    -- 
  begin -- 
    konst_249_wire_constant <= "0011";
    konst_254_wire_constant <= "0010";
    konst_259_wire_constant <= "0001";
    konst_264_wire_constant <= "0000";
    type_cast_252_wire_constant <= "00";
    type_cast_257_wire_constant <= "01";
    type_cast_262_wire_constant <= "10";
    type_cast_267_wire_constant <= "11";
    type_cast_269_wire_constant <= "00";
    -- flow-through select operator MUX_270_inst
    MUX_270_wire <= type_cast_267_wire_constant when (BITSEL_u4_u1_265_wire(0) /=  '0') else type_cast_269_wire_constant;
    -- flow-through select operator MUX_271_inst
    MUX_271_wire <= type_cast_262_wire_constant when (BITSEL_u4_u1_260_wire(0) /=  '0') else MUX_270_wire;
    -- flow-through select operator MUX_272_inst
    MUX_272_wire <= type_cast_257_wire_constant when (BITSEL_u4_u1_255_wire(0) /=  '0') else MUX_271_wire;
    -- flow-through select operator MUX_273_inst
    byte_offset_buffer <= type_cast_252_wire_constant when (BITSEL_u4_u1_250_wire(0) /=  '0') else MUX_272_wire;
    -- flow through binary operator BITSEL_u4_u1_250_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(bmask_buffer, konst_249_wire_constant, tmp_var);
      BITSEL_u4_u1_250_wire <= tmp_var; --
    end process;
    -- flow through binary operator BITSEL_u4_u1_255_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(bmask_buffer, konst_254_wire_constant, tmp_var);
      BITSEL_u4_u1_255_wire <= tmp_var; --
    end process;
    -- flow through binary operator BITSEL_u4_u1_260_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(bmask_buffer, konst_259_wire_constant, tmp_var);
      BITSEL_u4_u1_260_wire <= tmp_var; --
    end process;
    -- flow through binary operator BITSEL_u4_u1_265_inst
    process(bmask_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(bmask_buffer, konst_264_wire_constant, tmp_var);
      BITSEL_u4_u1_265_wire <= tmp_var; --
    end process;
    -- 
  end Block; -- data_path
  -- 
end get_byte_offset_Volatile_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
library AhbApbLib;
use AhbApbLib.afb_ahb_bridge_global_package.all;
entity afb_ahb_bridge is  -- system 
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
architecture afb_ahb_bridge_arch  of afb_ahb_bridge is -- system-architecture 
  -- interface signals to connect to memory space memory_space_1
  -- declarations related to module afb_ahb_bridge_daemon
  component afb_ahb_bridge_daemon is -- 
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
  -- argument signals for module afb_ahb_bridge_daemon
  signal afb_ahb_bridge_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal afb_ahb_bridge_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal afb_ahb_bridge_daemon_start_req : std_logic;
  signal afb_ahb_bridge_daemon_start_ack : std_logic;
  signal afb_ahb_bridge_daemon_fin_req   : std_logic;
  signal afb_ahb_bridge_daemon_fin_ack : std_logic;
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
  -- module afb_ahb_bridge_daemon
  afb_ahb_bridge_daemon_instance:afb_ahb_bridge_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => afb_ahb_bridge_daemon_start_req,
      start_ack => afb_ahb_bridge_daemon_start_ack,
      fin_req => afb_ahb_bridge_daemon_fin_req,
      fin_ack => afb_ahb_bridge_daemon_fin_ack,
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
      tag_in => afb_ahb_bridge_daemon_tag_in,
      tag_out => afb_ahb_bridge_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  afb_ahb_bridge_daemon_tag_in <= (others => '0');
  afb_ahb_bridge_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => afb_ahb_bridge_daemon_start_req, start_ack => afb_ahb_bridge_daemon_start_ack,  fin_req => afb_ahb_bridge_daemon_fin_req,  fin_ack => afb_ahb_bridge_daemon_fin_ack);
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
end afb_ahb_bridge_arch;
library ieee;
use ieee.std_logic_1164.all;
package afb_ahb_lite_master_Type_Package is -- 
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
library AhbApbLib;
use AhbApbLib.afb_ahb_lite_master_Type_Package.all;
--<<<<<
-->>>>>
library AhbApbLib;
library AhbApbLib;
--<<<<<
entity afb_ahb_lite_master is -- 
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
end entity afb_ahb_lite_master;
architecture struct of afb_ahb_lite_master is -- 
  signal hsys_tie_low, hsys_tie_high: std_logic;
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
  component afb_ahb_bridge is -- 
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
  for bridge_inst :  afb_ahb_bridge -- 
    use entity AhbApbLib.afb_ahb_bridge; -- 
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
  for ctrl_inst :  ahblite_controller -- 
    use entity AhbApbLib.ahblite_controller; -- 
  --<<<<<
  -- 
begin -- 
  hsys_tie_low  <= '0';
  hsys_tie_high <= '1';
  bridge_inst: afb_ahb_bridge
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
    clk => clk,  reset => reset
    ); -- 
  ctrl_inst: ahblite_controller
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
    clk => clk,  reset => reset
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
      clk => clk, reset => reset -- 
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
      clk => clk, reset => reset -- 
    ); -- 
  -- 
end struct;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.Types.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity ajit_ahb_lite_master is
	port (
		-- AJIT system bus
		ajit_to_env_write_req: in  std_logic;
		ajit_to_env_write_ack: out std_logic;
		ajit_to_env_addr: in std_logic_vector(35 downto 0);
		ajit_to_env_data: in std_logic_vector(31 downto 0);
		ajit_to_env_transfer_size: in std_logic_vector(2 downto 0);
		ajit_to_env_read_write_bar: in std_logic;
		ajit_to_env_lock: in std_logic;
		-- top-bit error, rest data.
		env_to_ajit_error : out std_logic;
		env_to_ajit_read_data : out std_logic_vector(31 downto 0);
		env_to_ajit_read_req: in std_logic;
		env_to_ajit_read_ack: out std_logic;
		-- AHB bus signals
		HADDR: out std_logic_vector(35 downto 0);
		HTRANS: out std_logic_vector(1 downto 0); -- non-sequential, sequential, idle, busy
		HWRITE: out std_logic; -- when '1' its a write.
		HSIZE: out std_logic_vector(2 downto 0); -- transfer size in bytes.
		HBURST: out std_logic_vector(2 downto 0); -- burst size.
		HMASTLOCK: out std_logic; -- locked transaction.. for swap etc.
		HPROT: out std_logic_vector(3 downto 0); -- protection bits..
		HWDATA: out std_logic_vector(31 downto 0); -- write data.
		HRDATA: in std_logic_vector(31 downto 0); -- read data.
		HREADY: in std_logic; -- slave ready.
		HRESP: in std_logic_vector(1 downto 0); -- okay, error, retry, split (slave responses).
		-- clock, reset.
		clk: in std_logic;
		reset: in std_logic 
	     );
end entity ajit_ahb_lite_master;


architecture Behave of ajit_ahb_lite_master is

	constant HTRANS_IDLE : std_logic_vector(1 downto 0) := "00";
	constant HTRANS_BUSY : std_logic_vector(1 downto 0) := "01";
	constant HTRANS_NONSEQ : std_logic_vector(1 downto 0) := "10";
	constant HTRANS_SEQ : std_logic_vector(1 downto 0) := "11";
	constant HSIZE_1   : std_logic_vector(2 downto 0)  := "000"; -- 1-byte transfer
	constant HSIZE_2   : std_logic_vector(2 downto 0)  := "001"; -- 2-byte transfer
	constant HSIZE_4   : std_logic_vector(2 downto 0)  := "010"; -- 4-byte transfer
	constant HSIZE_8   : std_logic_vector(2 downto 0)  := "011"; -- 8-byte transfer

	constant HBURST_SINGLE   : std_logic_vector(2 downto 0)  := "000"; -- 8-byte transfer
	constant SLAVE_RESPONSE_OK   : std_logic_vector(1 downto 0)  := "00"; -- OK
	constant SLAVE_RESPONSE_ERROR   : std_logic_vector(1 downto 0)  := "01"; -- Error
		

	signal latch_request, latch_hrdata: std_logic;
	signal ajit_to_env_addr_d: std_logic_vector(35 downto 0);
	signal ajit_to_env_data_d, HRDATA_d: std_logic_vector(31 downto 0);
	signal ajit_to_env_transfer_size_d: std_logic_vector(2 downto 0);
	signal ajit_to_env_read_write_bar_d: std_logic;
	signal ajit_to_env_lock_d: std_logic;


	type FsmState is (ReadyState, RequestSentState,ErrorState, WaitOnOutpipeState);
	signal fsm_state: FsmState;

	signal oqueue_data_in: std_logic_vector(32 downto 0);
	signal oqueue_push_req: std_logic;
	signal oqueue_push_ack: std_logic;
	signal oqueue_data_out: std_logic_vector(32 downto 0);
	signal oqueue_pop_req: std_logic;
	signal oqueue_pop_ack: std_logic;

begin
	oqueue_pop_req <= env_to_ajit_read_req;
	env_to_ajit_read_ack  <= env_to_ajit_read_req and oqueue_pop_ack; -- ack only on req!
	env_to_ajit_read_data <= oqueue_data_out(31 downto 0);
	env_to_ajit_error <= oqueue_data_out(32);

	oQueue: QueueBase 
			generic map (name => "ahb-master-oqueue",
					queue_depth => 2,
						data_width => 33)
			port map (clk => clk, reset => reset,
					data_in => oqueue_data_in,
					  data_out => oqueue_data_out,
					    push_req => oqueue_push_req,
						push_ack => oqueue_push_ack,
						  pop_req => oqueue_pop_req,
						    pop_ack => oqueue_pop_ack);

	-- latch last request sent out
	process(clk, reset, ajit_to_env_addr, ajit_to_env_data, ajit_to_env_read_write_bar, ajit_to_env_lock, ajit_to_env_transfer_size)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				ajit_to_env_addr_d <= (others => '0');
				ajit_to_env_data_d <= (others => '0');
				ajit_to_env_read_write_bar_d <= '0';
				ajit_to_env_lock_d <= '0';
				ajit_to_env_transfer_size_d <= (others => '0');
			elsif (latch_request = '1') then
				ajit_to_env_addr_d <= ajit_to_env_addr;
				ajit_to_env_data_d <= ajit_to_env_data;
				ajit_to_env_read_write_bar_d <= ajit_to_env_read_write_bar;
				ajit_to_env_lock_d <= ajit_to_env_lock;
				ajit_to_env_transfer_size_d <= ajit_to_env_transfer_size;
			end if;
		end if;
	end process;

	-- HRDATA latch.. if outpipe is not ready.
	process(clk, reset, HRDATA)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				HRDATA_d <= (others => '0');
			elsif (latch_hrdata = '1') then
				HRDATA_d <= HRDATA;
			end if;
		end if;
	end process;

	
	
	--
	-- state machine: on error response, sends error flag back to 
	-- requester.
	--
	process(clk, reset, fsm_state,  ajit_to_env_write_req, 
					ajit_to_env_data, 
					ajit_to_env_lock, 
					ajit_to_env_addr,
					ajit_to_env_read_write_bar, 
					ajit_to_env_data_d,
					ajit_to_env_addr_d,
					ajit_to_env_lock_d, 
					ajit_to_env_transfer_size,
					oqueue_push_ack, 
					HREADY, 
					HRESP, 
					HRDATA, HRDATA_d)
		variable next_fsm_state : FsmState;
		variable latch_request_var: std_logic;
		variable HADDR_var : std_logic_vector(35 downto 0);
		variable HTRANS_var : std_logic_vector(1 downto 0);
		variable HWRITE_var : std_logic;
		variable HSIZE_var : std_logic_vector(2 downto 0);
		variable HBURST_var : std_logic_vector(2 downto 0);
		variable HPROT_var : std_logic_vector(3 downto 0);
		variable HWDATA_var: std_logic_vector(31 downto 0);
		variable HMASTLOCK_var: std_logic;
		variable ajit_to_env_write_ack_var: std_logic;

		variable oqueue_push_req_var: std_logic;
		variable oqueue_data_in_var: std_logic_vector(32 downto 0);

		variable latch_hrdata_var: std_logic;

	begin
		next_fsm_state := fsm_state;
		HTRANS_var := HTRANS_IDLE;
		HADDR_var  := (others => '0');
		HWRITE_var := '0';
		HMASTLOCK_var := '0';
		HSIZE_var := HSIZE_4;
		HBURST_var := HBURST_SINGLE;
		HPROT_var := (others => '0');
		HWDATA_var := (others => '0');
		oqueue_data_in_var := (others => '0');
		oqueue_push_req_var := '0';

		ajit_to_env_write_ack_var := '0';
		latch_hrdata_var := '0';
		latch_request_var := '0';

		case fsm_state is 
			when ReadyState =>
				if(ajit_to_env_write_req = '1') then

					-- present the address.. data is ignored.
					-- slave is required to latch this information
					-- because it is held only until the slave indicates
					-- a ready.
					HTRANS_var := 	HTRANS_NONSEQ;
					HADDR_var  :=   ajit_to_env_addr;
					HWRITE_var :=   (not ajit_to_env_read_write_bar);
					HMASTLOCK_var := ajit_to_env_lock;
					HSIZE_var := ajit_to_env_transfer_size;
		
					--
					-- data is to be presented in the next clock cycle.
					--


					if(HREADY = '1') then
						-- acknowledge the FIFO interface.
						ajit_to_env_write_ack_var := '1';
						next_fsm_state := RequestSentState;
						latch_request_var := '1';
					end if;
				end if;
			when RequestSentState => 
				-- present the write data.
				HWDATA_var := ajit_to_env_data_d;

				if(HRESP = SLAVE_RESPONSE_OK) then
				    -- slave says OK..
				    if(HREADY = '1') then
					-- slave says ready.. pick up response..
					oqueue_push_req_var := '1';
					oqueue_data_in_var := '0' & HRDATA;
					if (oqueue_push_ack = '0') then
						-- env is not ready to accept
						-- the response.. go to wait, 
						-- and latch HRDATA.
						next_fsm_state := WaitOnOutpipeState; 
						latch_hrdata_var := '1';
					elsif (ajit_to_env_write_req = '1') then

						-------------------------------------------------
						-- env is ready to accept and has
						-- a new job waiting..
						-------------------------------------------------

						ajit_to_env_write_ack_var := '1';
						latch_request_var := '1';
						HTRANS_var := 	HTRANS_NONSEQ;
						HADDR_var  :=   ajit_to_env_addr;
						HWRITE_var :=   (not ajit_to_env_read_write_bar);
						HSIZE_var := ajit_to_env_transfer_size;

						-------------------------------------------------
						-- note: write data is sent in the next cycle...
						-------------------------------------------------

						-- stay in this state...

					else    --  next request not here, go to ReadyState.
						next_fsm_state := ReadyState;
					end if;
				     end if;
				else
						next_fsm_state := ErrorState;
				end if;
			when ErrorState => 
				-- idle state on last address.
				HADDR_var  := ajit_to_env_addr_d;
				oqueue_data_in_var := (32 => '1', others => '0');
				oqueue_push_req_var := '1';
				if(oqueue_push_ack = '1') then
					next_fsm_state := ReadyState;
				end if;
			when WaitOnOutpipeState => 
				oqueue_data_in_var := '0' & HRDATA_d;
				oqueue_push_req_var := '1';
				if (oqueue_push_ack = '1') then
					next_fsm_state := ReadyState;
				end if;
		end case;

		HTRANS <= HTRANS_var;
		HADDR <= HADDR_var;
		HWRITE <= HWRITE_var;
		HMASTLOCK <= HMASTLOCK_var;
		HSIZE <= HSIZE_var;
		HBURST <= HBURST_var;
		HPROT <= HPROT_var;
		HWDATA <= HWDATA_var;

		latch_request <= latch_request_var;
		oqueue_data_in <= oqueue_data_in_var;
		oqueue_push_req  <=  oqueue_push_req_var;
		ajit_to_env_write_ack <= ajit_to_env_write_ack_var;
		latch_hrdata <= latch_hrdata_var;


		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= ReadyState;
			else
				fsm_state <= next_fsm_state;
			end if;
		end if;
	end process;

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.Types.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity ajit_apb_master is
	port (
		-- AJIT system bus
		ajit_to_env_write_req: in  std_logic;
		ajit_to_env_write_ack: out std_logic;
		ajit_to_env_addr: in std_logic_vector(31 downto 0);
		ajit_to_env_data: in std_logic_vector(31 downto 0);
		ajit_to_env_read_write_bar: in std_logic;
		-- top-bit error, rest data.
		env_to_ajit_error : out std_logic;
		env_to_ajit_read_data : out std_logic_vector(31 downto 0);
		env_to_ajit_read_req: in std_logic;
		env_to_ajit_read_ack: out std_logic;
		-- APB bus signals
		PRESETn: out std_logic;
		PCLK: out std_logic;
		PADDR: out std_logic_vector(31 downto 0);
		PWRITE: out std_logic; -- when '1' its a write.
		PWDATA: out std_logic_vector(31 downto 0); -- write data.
		PRDATA: in std_logic_vector(31 downto 0); -- read data.
		PREADY: in std_logic; -- slave ready.
		PENABLE: out std_logic; -- enable..
		PSLVERR: in std_logic; -- error from slave.
		--   Note: PSEL is by default for one slave..  For more,
		--   generate by adding a decoder outside the master.
		PSEL : out std_logic; -- slave select.
		-- clock, reset.
		clk: in std_logic;
		reset: in std_logic 
	     );
end entity ajit_apb_master;


architecture Behave of ajit_apb_master is

	signal latch_request, latch_prdata: std_logic;
	signal ajit_to_env_addr_d: std_logic_vector(31 downto 0);
	signal ajit_to_env_data_d, PRDATA_d: std_logic_vector(31 downto 0);
	signal ajit_to_env_read_write_bar_d, PSLVERR_d: std_logic;


	type FsmState is (ReadyState, AccessState, WaitOnOutpipeState);
	signal fsm_state: FsmState;

	signal oqueue_data_in: std_logic_vector(32 downto 0);
	signal oqueue_push_req: std_logic;
	signal oqueue_push_ack: std_logic;
	signal oqueue_data_out: std_logic_vector(32 downto 0);
	signal oqueue_pop_req: std_logic;
	signal oqueue_pop_ack: std_logic;

begin
	oqueue_pop_req <= env_to_ajit_read_req;
	env_to_ajit_read_ack  <= env_to_ajit_read_req and oqueue_pop_ack; -- ack only on req!
	env_to_ajit_read_data <= oqueue_data_out(31 downto 0);
	env_to_ajit_error <= oqueue_data_out(32);
	

	PRESETn <= not reset;
	PCLK <= clk;

	oQueue: QueueBase 
			generic map (name => "apb-master-oqueue",
					queue_depth => 2,
						data_width => 33)
			port map (clk => clk, reset => reset,
					data_in => oqueue_data_in,
					  data_out => oqueue_data_out,
					    push_req => oqueue_push_req,
						push_ack => oqueue_push_ack,
						  pop_req => oqueue_pop_req,
						    pop_ack => oqueue_pop_ack);

	-- latch last request sent out
	process(clk, reset, ajit_to_env_addr, ajit_to_env_data, ajit_to_env_read_write_bar)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				ajit_to_env_addr_d <= (others => '0');
				ajit_to_env_data_d <= (others => '0');
				ajit_to_env_read_write_bar_d <= '0';
			elsif (latch_request = '1') then
				ajit_to_env_addr_d <= ajit_to_env_addr;
				ajit_to_env_data_d <= ajit_to_env_data;
				ajit_to_env_read_write_bar_d <= ajit_to_env_read_write_bar;
			end if;
		end if;
	end process;

	-- PRDATA latch.. if outpipe is not ready.
	process(clk, reset, PRDATA)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				PRDATA_d <= (others => '0');
				PSLVERR_d <= '0';
			elsif (latch_prdata = '1') then
				PRDATA_d <= PRDATA;
				PSLVERR_d <= PSLVERR;
			end if;
		end if;
	end process;

	
	
	--
	-- state machine: on error response, sends error flag back to 
	-- requester.
	--
	process(clk, reset, fsm_state,  ajit_to_env_write_req, 
					ajit_to_env_data, 
					ajit_to_env_addr,
					ajit_to_env_read_write_bar, 
					ajit_to_env_data_d,
					ajit_to_env_addr_d,
					oqueue_push_ack, 
					PREADY, 
					PRDATA, PRDATA_d)
		variable next_fsm_state : FsmState;
		variable latch_request_var: std_logic;
		variable PADDR_var : std_logic_vector(31 downto 0);
		variable PWRITE_var : std_logic;
		variable PWDATA_var: std_logic_vector(31 downto 0);
		variable PENABLE_var: std_logic;

		variable ajit_to_env_write_ack_var: std_logic;

		variable oqueue_push_req_var: std_logic;
		variable oqueue_data_in_var: std_logic_vector(32 downto 0);

		variable latch_prdata_var: std_logic;
		variable psel_var: std_logic;

	begin
		next_fsm_state := fsm_state;
		PADDR_var  := (others => '0');
		PWRITE_var := '0';
		PWDATA_var := (others => '0');
		PENABLE_var := '0';
		psel_var := '0';

		oqueue_data_in_var := (others => '0');
		oqueue_push_req_var := '0';

		ajit_to_env_write_ack_var := '0';
		latch_prdata_var := '0';
		latch_request_var := '0';

		case fsm_state is 
			when ReadyState =>
				ajit_to_env_write_ack_var := '1';
				if(ajit_to_env_write_req = '1') then

					-- present the address.. data is ignored.
					-- slave is required to latch this information
					-- because it is held only until the slave indicates
					-- a ready.
					PADDR_var  :=   ajit_to_env_addr;
					PWRITE_var :=   (not ajit_to_env_read_write_bar);
					PWDATA_var :=   ajit_to_env_data;
					psel_var := '1';
		
					next_fsm_state := AccessState;
					latch_request_var := '1';
				end if;
			when AccessState => 

				PADDR_var  :=   ajit_to_env_addr_d;
				PWRITE_var :=   (not ajit_to_env_read_write_bar_d);
				PWDATA_var :=   ajit_to_env_data_d;
				PENABLE_var := '1';
				psel_var := '1';
				
				-- stretch everything if PREADY = '0'...
				if(PREADY = '1') then
					next_fsm_state   := WaitOnOutpipeState;
					latch_prdata_var := '1';
				end if;

			when WaitOnOutpipeState => 

				oqueue_data_in_var :=  PSLVERR_d & PRDATA_d;
				oqueue_push_req_var := '1';
				if (oqueue_push_ack = '1') then
					next_fsm_state := ReadyState;
				end if;

		end case;

		PADDR <= PADDR_var;
		PWRITE <= PWRITE_var;
		PWDATA <= PWDATA_var;
		PSEL <= psel_var;
		PENABLE <= PENABLE_var;

		latch_request <= latch_request_var;
		oqueue_data_in <= oqueue_data_in_var;
		oqueue_push_req  <=  oqueue_push_req_var;
		ajit_to_env_write_ack <= ajit_to_env_write_ack_var;
		latch_prdata <= latch_prdata_var;


		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= ReadyState;
			else
				fsm_state <= next_fsm_state;
			end if;
		end if;
	end process;

end Behave;
