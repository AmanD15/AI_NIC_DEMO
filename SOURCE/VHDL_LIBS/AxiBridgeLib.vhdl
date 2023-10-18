library ieee;
use ieee.std_logic_1164.all;

package axi_component_package  is

  -- axi bridges.
  component afb_axi_core is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_BUS_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_BUS_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_BUS_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    axi_read_address_pipe_read_data: out std_logic_vector(31 downto 0);
    axi_read_address_pipe_read_req : in std_logic_vector(0 downto 0);
    axi_read_address_pipe_read_ack : out std_logic_vector(0 downto 0);
    axi_read_data_pipe_write_data: in std_logic_vector(31 downto 0);
    axi_read_data_pipe_write_req : in std_logic_vector(0 downto 0);
    axi_read_data_pipe_write_ack : out std_logic_vector(0 downto 0);
    axi_write_address_pipe_read_data: out std_logic_vector(31 downto 0);
    axi_write_address_pipe_read_req : in std_logic_vector(0 downto 0);
    axi_write_address_pipe_read_ack : out std_logic_vector(0 downto 0);
    axi_write_data_and_byte_mask_pipe_read_data: out std_logic_vector(35 downto 0);
    axi_write_data_and_byte_mask_pipe_read_req : in std_logic_vector(0 downto 0);
    axi_write_data_and_byte_mask_pipe_read_ack : out std_logic_vector(0 downto 0);
    axi_write_status_pipe_write_data: in std_logic_vector(1 downto 0);
    axi_write_status_pipe_write_req : in std_logic_vector(0 downto 0);
    axi_write_status_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
  end component; 
  component afb_axi_lite_bridge is
        generic (ADDR_WIDTH: integer := 32);
	port (
		clk, reset: in std_logic;
                ----------------------------------------------------------------
                ----------------------------------------------------------------
		-- AXI side interface
                ----------------------------------------------------------------
                -- clock, reset to slave device
                ----------------------------------------------------------------
	        ACLK, ARESETn: out std_logic;
                ----------------------------------------------------------------
                -- read address channel
                ----------------------------------------------------------------
                ARREADY: in std_logic;
                ARVALID: out std_logic;
                ARADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
                -- tied to 000
		ARPROT:  out std_logic_vector (2 downto 0);	
                ----------------------------------------------------------------
		-- read data channel.
                ----------------------------------------------------------------
                RVALID: in std_logic;
                RREADY: out std_logic;
                RDATA:  in std_logic_vector (31 downto 0);
    		RRESP:  in std_logic_vector (1 downto 0);
                ----------------------------------------------------------------
		-- write address channel.
                ----------------------------------------------------------------
                AWREADY: in std_logic;
                AWVALID: out std_logic;
                AWADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
                -- tied to 000
		AWPROT:  out std_logic_vector (2 downto 0);	
                ----------------------------------------------------------------
		-- write data channel.
                ----------------------------------------------------------------
                WVALID: out std_logic;
                WREADY: in std_logic;
                WDATA:  out std_logic_vector (31 downto 0);
                -- byte mask.
    		WSTRB:  out std_logic_vector (3 downto 0);

                ----------------------------------------------------------------
		-- AFB side interface
                ----------------------------------------------------------------
                ----------------------------------------------------------------
        	-- AFB response side.
                ----------------------------------------------------------------
    		AFB_BUS_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
    		AFB_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    		AFB_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
                ----------------------------------------------------------------
		-- AFB request side..
                ----------------------------------------------------------------
    		AFB_BUS_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
    		AFB_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
    		AFB_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0)
	     );
  end component afb_axi_lite_bridge;

  component  afb_axi_master_lite_bridge is
        generic (ADDR_WIDTH: integer := 32);
	port (
		clk,reset: in std_logic;
                ----------------------------------------------------------------
                ----------------------------------------------------------------
		-- AXI side interface
                ----------------------------------------------------------------
                -- clock, reset to slave device
                ----------------------------------------------------------------
	        ACLK,ARESETn: out std_logic;
                ----------------------------------------------------------------
                -- read address channel
                ----------------------------------------------------------------
                ARREADY: in std_logic;
                ARVALID: out std_logic;
                ARADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
                -- tied to 000
		ARPROT:  out std_logic_vector (2 downto 0);	
                ----------------------------------------------------------------
		-- read data channel.
                ----------------------------------------------------------------
                RVALID: in std_logic;
                RREADY: out std_logic;
                RDATA:  in std_logic_vector (31 downto 0);
    		RRESP:  in std_logic_vector (1 downto 0);
                ----------------------------------------------------------------
		-- write address channel.
                ----------------------------------------------------------------
                AWREADY: in std_logic;
                AWVALID: out std_logic;
                AWADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
                -- tied to 000
		AWPROT:  out std_logic_vector (2 downto 0);	
                ----------------------------------------------------------------
		-- write data channel.
                ----------------------------------------------------------------
                WVALID: out std_logic;
                WREADY: in std_logic;
                WDATA:  out std_logic_vector (31 downto 0);
                -- byte mask.
    		WSTRB:  out std_logic_vector (3 downto 0);
                ----------------------------------------------------------------
                ----------------------------------------------------------------
                BRESP: in std_logic_vector(1 downto 0);
                BREADY: out std_logic;
                BVALID: in std_logic;
		-- AFB side interface
                ----------------------------------------------------------------
        	-- AFB response side.
                ----------------------------------------------------------------
    		AFB_BUS_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
    		AFB_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    		AFB_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
                ----------------------------------------------------------------
		-- AFB request side..
                ----------------------------------------------------------------
    		AFB_BUS_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
    		AFB_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
    		AFB_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0)
	     );
    end component afb_axi_master_lite_bridge;

end package;
-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package afb_axi_core_global_package is -- 
  constant IDLE_STATE : std_logic_vector(1 downto 0) := "00";
  constant NOACCESS : std_logic_vector(1 downto 0) := "00";
  constant READACCESS : std_logic_vector(1 downto 0) := "01";
  constant RUN_STATE : std_logic_vector(1 downto 0) := "01";
  constant WAIT_STATE : std_logic_vector(1 downto 0) := "10";
  constant WRITEACCESS : std_logic_vector(1 downto 0) := "10";
  constant ZZ1 : std_logic_vector(0 downto 0) := "0";
  component afb_axi_core is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      AFB_BUS_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_BUS_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      axi_read_address_pipe_read_data: out std_logic_vector(31 downto 0);
      axi_read_address_pipe_read_req : in std_logic_vector(0 downto 0);
      axi_read_address_pipe_read_ack : out std_logic_vector(0 downto 0);
      axi_read_data_pipe_write_data: in std_logic_vector(31 downto 0);
      axi_read_data_pipe_write_req : in std_logic_vector(0 downto 0);
      axi_read_data_pipe_write_ack : out std_logic_vector(0 downto 0);
      axi_write_address_pipe_read_data: out std_logic_vector(31 downto 0);
      axi_write_address_pipe_read_req : in std_logic_vector(0 downto 0);
      axi_write_address_pipe_read_ack : out std_logic_vector(0 downto 0);
      axi_write_data_and_byte_mask_pipe_read_data: out std_logic_vector(35 downto 0);
      axi_write_data_and_byte_mask_pipe_read_req : in std_logic_vector(0 downto 0);
      axi_write_data_and_byte_mask_pipe_read_ack : out std_logic_vector(0 downto 0);
      axi_write_status_pipe_write_data: in std_logic_vector(1 downto 0);
      axi_write_status_pipe_write_req : in std_logic_vector(0 downto 0);
      axi_write_status_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  -- 
end package afb_axi_core_global_package;
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
library AxiBridgeLib;
use AxiBridgeLib.afb_axi_core_global_package.all;
entity afb_to_axi_lite_bridge_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    AFB_BUS_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
    access_completed_lock_pipe_read_req : out  std_logic_vector(0 downto 0);
    access_completed_lock_pipe_read_ack : in   std_logic_vector(0 downto 0);
    access_completed_lock_pipe_read_data : in   std_logic_vector(0 downto 0);
    axi_write_status_pipe_read_req : out  std_logic_vector(0 downto 0);
    axi_write_status_pipe_read_ack : in   std_logic_vector(0 downto 0);
    axi_write_status_pipe_read_data : in   std_logic_vector(1 downto 0);
    axi_read_data_pipe_read_req : out  std_logic_vector(0 downto 0);
    axi_read_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
    axi_read_data_pipe_read_data : in   std_logic_vector(31 downto 0);
    access_completed_lock_pipe_write_req : out  std_logic_vector(0 downto 0);
    access_completed_lock_pipe_write_ack : in   std_logic_vector(0 downto 0);
    access_completed_lock_pipe_write_data : out  std_logic_vector(0 downto 0);
    axi_read_address_pipe_write_req : out  std_logic_vector(0 downto 0);
    axi_read_address_pipe_write_ack : in   std_logic_vector(0 downto 0);
    axi_read_address_pipe_write_data : out  std_logic_vector(31 downto 0);
    AFB_BUS_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
    axi_write_data_and_byte_mask_pipe_write_req : out  std_logic_vector(0 downto 0);
    axi_write_data_and_byte_mask_pipe_write_ack : in   std_logic_vector(0 downto 0);
    axi_write_data_and_byte_mask_pipe_write_data : out  std_logic_vector(35 downto 0);
    axi_write_address_pipe_write_req : out  std_logic_vector(0 downto 0);
    axi_write_address_pipe_write_ack : in   std_logic_vector(0 downto 0);
    axi_write_address_pipe_write_data : out  std_logic_vector(31 downto 0);
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
end entity afb_to_axi_lite_bridge_daemon;
architecture afb_to_axi_lite_bridge_daemon_arch of afb_to_axi_lite_bridge_daemon is -- 
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
  signal afb_to_axi_lite_bridge_daemon_CP_0_start: Boolean;
  signal afb_to_axi_lite_bridge_daemon_CP_0_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal phi_stmt_39_req_1 : boolean;
  signal phi_stmt_39_req_0 : boolean;
  signal do_while_stmt_37_branch_req_0 : boolean;
  signal phi_stmt_39_ack_0 : boolean;
  signal phi_stmt_51_req_1 : boolean;
  signal n_counter_74_44_buf_req_0 : boolean;
  signal n_counter_74_44_buf_ack_0 : boolean;
  signal n_counter_74_44_buf_req_1 : boolean;
  signal n_counter_74_44_buf_ack_1 : boolean;
  signal phi_stmt_45_req_0 : boolean;
  signal phi_stmt_45_req_1 : boolean;
  signal phi_stmt_45_ack_0 : boolean;
  signal RPIPE_access_completed_lock_48_inst_req_0 : boolean;
  signal RPIPE_access_completed_lock_48_inst_ack_0 : boolean;
  signal RPIPE_access_completed_lock_48_inst_req_1 : boolean;
  signal RPIPE_access_completed_lock_48_inst_ack_1 : boolean;
  signal phi_stmt_64_req_1 : boolean;
  signal phi_stmt_51_req_0 : boolean;
  signal phi_stmt_51_ack_0 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_55_inst_req_0 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_55_inst_ack_0 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_55_inst_req_1 : boolean;
  signal RPIPE_AFB_BUS_REQUEST_55_inst_ack_1 : boolean;
  signal phi_stmt_56_req_1 : boolean;
  signal phi_stmt_56_req_0 : boolean;
  signal phi_stmt_56_ack_0 : boolean;
  signal nSTATE_137_59_buf_req_0 : boolean;
  signal nSTATE_137_59_buf_ack_0 : boolean;
  signal nSTATE_137_59_buf_req_1 : boolean;
  signal nSTATE_137_59_buf_ack_1 : boolean;
  signal phi_stmt_60_req_1 : boolean;
  signal phi_stmt_60_req_0 : boolean;
  signal phi_stmt_60_ack_0 : boolean;
  signal next_last_access_type_103_63_buf_req_0 : boolean;
  signal next_last_access_type_103_63_buf_ack_0 : boolean;
  signal next_last_access_type_103_63_buf_req_1 : boolean;
  signal next_last_access_type_103_63_buf_ack_1 : boolean;
  signal phi_stmt_64_req_0 : boolean;
  signal phi_stmt_64_ack_0 : boolean;
  signal get_afb_req_153_68_buf_req_0 : boolean;
  signal get_afb_req_153_68_buf_ack_0 : boolean;
  signal get_afb_req_153_68_buf_req_1 : boolean;
  signal get_afb_req_153_68_buf_ack_1 : boolean;
  signal WPIPE_axi_read_address_169_inst_req_0 : boolean;
  signal WPIPE_axi_read_address_169_inst_ack_0 : boolean;
  signal WPIPE_axi_read_address_169_inst_req_1 : boolean;
  signal WPIPE_axi_read_address_169_inst_ack_1 : boolean;
  signal WPIPE_axi_write_address_179_inst_req_0 : boolean;
  signal WPIPE_axi_write_address_179_inst_ack_0 : boolean;
  signal WPIPE_axi_write_address_179_inst_req_1 : boolean;
  signal WPIPE_axi_write_address_179_inst_ack_1 : boolean;
  signal WPIPE_axi_write_data_and_byte_mask_188_inst_req_0 : boolean;
  signal WPIPE_axi_write_data_and_byte_mask_188_inst_ack_0 : boolean;
  signal WPIPE_axi_write_data_and_byte_mask_188_inst_req_1 : boolean;
  signal WPIPE_axi_write_data_and_byte_mask_188_inst_ack_1 : boolean;
  signal W_do_write_195_delayed_12_0_191_inst_req_0 : boolean;
  signal W_do_write_195_delayed_12_0_191_inst_ack_0 : boolean;
  signal W_do_write_195_delayed_12_0_191_inst_req_1 : boolean;
  signal W_do_write_195_delayed_12_0_191_inst_ack_1 : boolean;
  signal RPIPE_axi_write_status_196_inst_req_0 : boolean;
  signal RPIPE_axi_write_status_196_inst_ack_0 : boolean;
  signal RPIPE_axi_write_status_196_inst_req_1 : boolean;
  signal RPIPE_axi_write_status_196_inst_ack_1 : boolean;
  signal W_do_read_199_delayed_12_0_198_inst_req_0 : boolean;
  signal W_do_read_199_delayed_12_0_198_inst_ack_0 : boolean;
  signal W_do_read_199_delayed_12_0_198_inst_req_1 : boolean;
  signal W_do_read_199_delayed_12_0_198_inst_ack_1 : boolean;
  signal RPIPE_axi_read_data_203_inst_req_0 : boolean;
  signal RPIPE_axi_read_data_203_inst_ack_0 : boolean;
  signal RPIPE_axi_read_data_203_inst_req_1 : boolean;
  signal RPIPE_axi_read_data_203_inst_ack_1 : boolean;
  signal W_do_read_204_delayed_13_0_205_inst_req_0 : boolean;
  signal W_do_read_204_delayed_13_0_205_inst_ack_0 : boolean;
  signal W_do_read_204_delayed_13_0_205_inst_req_1 : boolean;
  signal W_do_read_204_delayed_13_0_205_inst_ack_1 : boolean;
  signal W_exec_cmd_212_delayed_13_0_217_inst_req_0 : boolean;
  signal W_exec_cmd_212_delayed_13_0_217_inst_ack_0 : boolean;
  signal W_exec_cmd_212_delayed_13_0_217_inst_req_1 : boolean;
  signal W_exec_cmd_212_delayed_13_0_217_inst_ack_1 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_221_inst_req_0 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_221_inst_ack_0 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_221_inst_req_1 : boolean;
  signal WPIPE_AFB_BUS_RESPONSE_221_inst_ack_1 : boolean;
  signal W_release_lock_delayed_224_inst_req_0 : boolean;
  signal W_release_lock_delayed_224_inst_ack_0 : boolean;
  signal W_release_lock_delayed_224_inst_req_1 : boolean;
  signal W_release_lock_delayed_224_inst_ack_1 : boolean;
  signal WPIPE_access_completed_lock_228_inst_req_0 : boolean;
  signal WPIPE_access_completed_lock_228_inst_ack_0 : boolean;
  signal WPIPE_access_completed_lock_228_inst_req_1 : boolean;
  signal WPIPE_access_completed_lock_228_inst_ack_1 : boolean;
  signal do_while_stmt_37_branch_ack_0 : boolean;
  signal do_while_stmt_37_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "afb_to_axi_lite_bridge_daemon_input_buffer", -- 
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
  afb_to_axi_lite_bridge_daemon_CP_0_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "afb_to_axi_lite_bridge_daemon_out_buffer", -- 
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
    preds <= afb_to_axi_lite_bridge_daemon_CP_0_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
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
    preds <= afb_to_axi_lite_bridge_daemon_CP_0_start & tag_ilock_write_ack_symbol;
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
    preds <= afb_to_axi_lite_bridge_daemon_CP_0_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  afb_to_axi_lite_bridge_daemon_CP_0: Block -- control-path 
    signal afb_to_axi_lite_bridge_daemon_CP_0_elements: BooleanArray(180 downto 0);
    -- 
  begin -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(0) <= afb_to_axi_lite_bridge_daemon_CP_0_start;
    afb_to_axi_lite_bridge_daemon_CP_0_symbol <= afb_to_axi_lite_bridge_daemon_CP_0_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 branch_block_stmt_36/do_while_stmt_37__entry__
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_36/$entry
      -- CP-element group 0: 	 branch_block_stmt_36/branch_block_stmt_36__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	180 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 branch_block_stmt_36/branch_block_stmt_36__exit__
      -- CP-element group 1: 	 branch_block_stmt_36/do_while_stmt_37__exit__
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_36/$exit
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(1) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(180);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_36/do_while_stmt_37/$entry
      -- CP-element group 2: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37__entry__
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(2) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	180 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37__exit__
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_36/do_while_stmt_37/loop_back
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	178 
    -- CP-element group 5: 	179 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_36/do_while_stmt_37/condition_done
      -- CP-element group 5: 	 branch_block_stmt_36/do_while_stmt_37/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_36/do_while_stmt_37/loop_taken/$entry
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(5) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	177 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_36/do_while_stmt_37/loop_body_done
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(6) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(177);
    -- CP-element group 7:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	118 
    -- CP-element group 7: 	99 
    -- CP-element group 7: 	20 
    -- CP-element group 7: 	39 
    -- CP-element group 7: 	60 
    -- CP-element group 7: 	81 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/back_edge_to_loop_body
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(7) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(4);
    -- CP-element group 8:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	120 
    -- CP-element group 8: 	101 
    -- CP-element group 8: 	83 
    -- CP-element group 8: 	22 
    -- CP-element group 8: 	41 
    -- CP-element group 8: 	62 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/first_time_through_loop_body
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(8) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	113 
    -- CP-element group 9: 	152 
    -- CP-element group 9: 	112 
    -- CP-element group 9: 	94 
    -- CP-element group 9: 	144 
    -- CP-element group 9: 	95 
    -- CP-element group 9: 	176 
    -- CP-element group 9: 	15 
    -- CP-element group 9: 	16 
    -- CP-element group 9: 	33 
    -- CP-element group 9: 	34 
    -- CP-element group 9: 	54 
    -- CP-element group 9: 	55 
    -- CP-element group 9: 	75 
    -- CP-element group 9: 	76 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/loop_body_start
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	176 
    -- CP-element group 10: 	14 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/condition_evaluated
      -- 
    condition_evaluated_24_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_24_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(10), ack => do_while_stmt_37_branch_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(176) & afb_to_axi_lite_bridge_daemon_CP_0_elements(14);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	112 
    -- CP-element group 11: 	94 
    -- CP-element group 11: 	15 
    -- CP-element group 11: 	33 
    -- CP-element group 11: 	54 
    -- CP-element group 11: 	75 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	14 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	114 
    -- CP-element group 11: 	17 
    -- CP-element group 11: 	35 
    -- CP-element group 11: 	56 
    -- CP-element group 11: 	77 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/aggregated_phi_sample_req
      -- CP-element group 11: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_sample_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 6) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 15,6 => 1);
      constant place_markings: IntegerArray(0 to 6)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 1);
      constant place_delays: IntegerArray(0 to 6) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 7); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(112) & afb_to_axi_lite_bridge_daemon_CP_0_elements(94) & afb_to_axi_lite_bridge_daemon_CP_0_elements(15) & afb_to_axi_lite_bridge_daemon_CP_0_elements(33) & afb_to_axi_lite_bridge_daemon_CP_0_elements(54) & afb_to_axi_lite_bridge_daemon_CP_0_elements(75) & afb_to_axi_lite_bridge_daemon_CP_0_elements(14);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 7, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	96 
    -- CP-element group 12: 	115 
    -- CP-element group 12: 	18 
    -- CP-element group 12: 	36 
    -- CP-element group 12: 	57 
    -- CP-element group 12: 	78 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	177 
    -- CP-element group 12: marked-successors 
    -- CP-element group 12: 	112 
    -- CP-element group 12: 	94 
    -- CP-element group 12: 	15 
    -- CP-element group 12: 	33 
    -- CP-element group 12: 	54 
    -- CP-element group 12: 	75 
    -- CP-element group 12:  members (7) 
      -- CP-element group 12: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/aggregated_phi_sample_ack
      -- CP-element group 12: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_sample_completed_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 15);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(96) & afb_to_axi_lite_bridge_daemon_CP_0_elements(115) & afb_to_axi_lite_bridge_daemon_CP_0_elements(18) & afb_to_axi_lite_bridge_daemon_CP_0_elements(36) & afb_to_axi_lite_bridge_daemon_CP_0_elements(57) & afb_to_axi_lite_bridge_daemon_CP_0_elements(78);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	113 
    -- CP-element group 13: 	95 
    -- CP-element group 13: 	16 
    -- CP-element group 13: 	34 
    -- CP-element group 13: 	55 
    -- CP-element group 13: 	76 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	97 
    -- CP-element group 13: 	116 
    -- CP-element group 13: 	37 
    -- CP-element group 13: 	58 
    -- CP-element group 13: 	79 
    -- CP-element group 13:  members (2) 
      -- CP-element group 13: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/aggregated_phi_update_req
      -- CP-element group 13: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_update_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 15);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(113) & afb_to_axi_lite_bridge_daemon_CP_0_elements(95) & afb_to_axi_lite_bridge_daemon_CP_0_elements(16) & afb_to_axi_lite_bridge_daemon_CP_0_elements(34) & afb_to_axi_lite_bridge_daemon_CP_0_elements(55) & afb_to_axi_lite_bridge_daemon_CP_0_elements(76);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	117 
    -- CP-element group 14: 	98 
    -- CP-element group 14: 	19 
    -- CP-element group 14: 	38 
    -- CP-element group 14: 	59 
    -- CP-element group 14: 	80 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	10 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	11 
    -- CP-element group 14:  members (1) 
      -- CP-element group 14: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/aggregated_phi_update_ack
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 15);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(117) & afb_to_axi_lite_bridge_daemon_CP_0_elements(98) & afb_to_axi_lite_bridge_daemon_CP_0_elements(19) & afb_to_axi_lite_bridge_daemon_CP_0_elements(38) & afb_to_axi_lite_bridge_daemon_CP_0_elements(59) & afb_to_axi_lite_bridge_daemon_CP_0_elements(80);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	9 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	12 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (1) 
      -- CP-element group 15: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_sample_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(12);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  join  transition  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	9 
    -- CP-element group 16: marked-predecessors 
    -- CP-element group 16: 	19 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (1) 
      -- CP-element group 16: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_update_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(19);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_16 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	11 
    -- CP-element group 17: successors 
    -- CP-element group 17:  members (1) 
      -- CP-element group 17: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_sample_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(17) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(11);
    -- CP-element group 18:  join  transition  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	12 
    -- CP-element group 18:  members (1) 
      -- CP-element group 18: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_sample_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(18) is bound as output of CP function.
    -- CP-element group 19:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	14 
    -- CP-element group 19: marked-successors 
    -- CP-element group 19: 	16 
    -- CP-element group 19:  members (2) 
      -- CP-element group 19: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_update_completed_
      -- CP-element group 19: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_update_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(19) is bound as output of CP function.
    -- CP-element group 20:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	7 
    -- CP-element group 20: successors 
    -- CP-element group 20:  members (1) 
      -- CP-element group 20: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_loopback_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(20) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(7);
    -- CP-element group 21:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (2) 
      -- CP-element group 21: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_loopback_sample_req
      -- CP-element group 21: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_loopback_sample_req_ps
      -- 
    phi_stmt_39_loopback_sample_req_39_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_39_loopback_sample_req_39_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(21), ack => phi_stmt_39_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(21) is bound as output of CP function.
    -- CP-element group 22:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	8 
    -- CP-element group 22: successors 
    -- CP-element group 22:  members (1) 
      -- CP-element group 22: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_entry_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(22) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(8);
    -- CP-element group 23:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (2) 
      -- CP-element group 23: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_entry_sample_req
      -- CP-element group 23: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_entry_sample_req_ps
      -- 
    phi_stmt_39_entry_sample_req_42_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_39_entry_sample_req_42_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(23), ack => phi_stmt_39_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(23) is bound as output of CP function.
    -- CP-element group 24:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: successors 
    -- CP-element group 24:  members (2) 
      -- CP-element group 24: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_phi_mux_ack
      -- CP-element group 24: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_39_phi_mux_ack_ps
      -- 
    phi_stmt_39_phi_mux_ack_45_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 24_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_39_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(24)); -- 
    -- CP-element group 25:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: successors 
    -- CP-element group 25:  members (4) 
      -- CP-element group 25: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_43_sample_start__ps
      -- CP-element group 25: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_43_sample_completed__ps
      -- CP-element group 25: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_43_sample_start_
      -- CP-element group 25: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_43_sample_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(25) is bound as output of CP function.
    -- CP-element group 26:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	28 
    -- CP-element group 26:  members (2) 
      -- CP-element group 26: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_43_update_start__ps
      -- CP-element group 26: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_43_update_start_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(26) is bound as output of CP function.
    -- CP-element group 27:  join  transition  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	28 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (1) 
      -- CP-element group 27: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_43_update_completed__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(27) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(28);
    -- CP-element group 28:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	26 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	27 
    -- CP-element group 28:  members (1) 
      -- CP-element group 28: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_43_update_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(28) is a control-delay.
    cp_element_28_delay: control_delay_element  generic map(name => " 28_delay", delay_value => 1)  port map(req => afb_to_axi_lite_bridge_daemon_CP_0_elements(26), ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(28), clk => clk, reset =>reset);
    -- CP-element group 29:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (4) 
      -- CP-element group 29: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_sample_start_
      -- CP-element group 29: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_sample_start__ps
      -- CP-element group 29: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_Sample/$entry
      -- CP-element group 29: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_Sample/req
      -- 
    req_66_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_66_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(29), ack => n_counter_74_44_buf_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(29) is bound as output of CP function.
    -- CP-element group 30:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	32 
    -- CP-element group 30:  members (4) 
      -- CP-element group 30: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_update_start_
      -- CP-element group 30: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_update_start__ps
      -- CP-element group 30: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_Update/$entry
      -- CP-element group 30: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_Update/req
      -- 
    req_71_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_71_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(30), ack => n_counter_74_44_buf_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(30) is bound as output of CP function.
    -- CP-element group 31:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31:  members (4) 
      -- CP-element group 31: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_sample_completed_
      -- CP-element group 31: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_sample_completed__ps
      -- CP-element group 31: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_Sample/$exit
      -- CP-element group 31: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_Sample/ack
      -- 
    ack_67_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 31_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => n_counter_74_44_buf_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(31)); -- 
    -- CP-element group 32:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	30 
    -- CP-element group 32: successors 
    -- CP-element group 32:  members (4) 
      -- CP-element group 32: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_update_completed_
      -- CP-element group 32: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_update_completed__ps
      -- CP-element group 32: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_Update/$exit
      -- CP-element group 32: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_n_counter_44_Update/ack
      -- 
    ack_72_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 32_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => n_counter_74_44_buf_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(32)); -- 
    -- CP-element group 33:  join  transition  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	9 
    -- CP-element group 33: marked-predecessors 
    -- CP-element group 33: 	12 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	11 
    -- CP-element group 33:  members (1) 
      -- CP-element group 33: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_sample_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_33: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_33"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(12);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_33 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(33), clk => clk, reset => reset); --
    end block;
    -- CP-element group 34:  join  transition  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	9 
    -- CP-element group 34: marked-predecessors 
    -- CP-element group 34: 	170 
    -- CP-element group 34: 	150 
    -- CP-element group 34: 	142 
    -- CP-element group 34: 	162 
    -- CP-element group 34: 	138 
    -- CP-element group 34: 	132 
    -- CP-element group 34: 	135 
    -- CP-element group 34: 	158 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	13 
    -- CP-element group 34:  members (1) 
      -- CP-element group 34: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_update_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_34: block -- 
      constant place_capacities: IntegerArray(0 to 8) := (0 => 15,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_markings: IntegerArray(0 to 8)  := (0 => 0,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_delays: IntegerArray(0 to 8) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0,8 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_34"; 
      signal preds: BooleanArray(1 to 9); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(170) & afb_to_axi_lite_bridge_daemon_CP_0_elements(150) & afb_to_axi_lite_bridge_daemon_CP_0_elements(142) & afb_to_axi_lite_bridge_daemon_CP_0_elements(162) & afb_to_axi_lite_bridge_daemon_CP_0_elements(138) & afb_to_axi_lite_bridge_daemon_CP_0_elements(132) & afb_to_axi_lite_bridge_daemon_CP_0_elements(135) & afb_to_axi_lite_bridge_daemon_CP_0_elements(158);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_34 : generic_join generic map(name => joinName, number_of_predecessors => 9, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(34), clk => clk, reset => reset); --
    end block;
    -- CP-element group 35:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	11 
    -- CP-element group 35: successors 
    -- CP-element group 35:  members (1) 
      -- CP-element group 35: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_sample_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(35) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(11);
    -- CP-element group 36:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	97 
    -- CP-element group 36: 	116 
    -- CP-element group 36: 	12 
    -- CP-element group 36: 	58 
    -- CP-element group 36: 	79 
    -- CP-element group 36:  members (1) 
      -- CP-element group 36: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_sample_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(36) is bound as output of CP function.
    -- CP-element group 37:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	13 
    -- CP-element group 37: successors 
    -- CP-element group 37:  members (1) 
      -- CP-element group 37: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_update_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(37) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(13);
    -- CP-element group 38:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: successors 
    -- CP-element group 38: 	148 
    -- CP-element group 38: 	168 
    -- CP-element group 38: 	134 
    -- CP-element group 38: 	140 
    -- CP-element group 38: 	160 
    -- CP-element group 38: 	137 
    -- CP-element group 38: 	156 
    -- CP-element group 38: 	131 
    -- CP-element group 38: 	14 
    -- CP-element group 38:  members (2) 
      -- CP-element group 38: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_update_completed_
      -- CP-element group 38: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_update_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(38) is bound as output of CP function.
    -- CP-element group 39:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	7 
    -- CP-element group 39: successors 
    -- CP-element group 39:  members (1) 
      -- CP-element group 39: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_loopback_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(39) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(7);
    -- CP-element group 40:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: successors 
    -- CP-element group 40:  members (2) 
      -- CP-element group 40: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_loopback_sample_req
      -- CP-element group 40: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_loopback_sample_req_ps
      -- 
    phi_stmt_45_loopback_sample_req_83_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_45_loopback_sample_req_83_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(40), ack => phi_stmt_45_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(40) is bound as output of CP function.
    -- CP-element group 41:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: 	8 
    -- CP-element group 41: successors 
    -- CP-element group 41:  members (1) 
      -- CP-element group 41: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_entry_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(41) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(8);
    -- CP-element group 42:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: successors 
    -- CP-element group 42:  members (2) 
      -- CP-element group 42: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_entry_sample_req
      -- CP-element group 42: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_entry_sample_req_ps
      -- 
    phi_stmt_45_entry_sample_req_86_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_45_entry_sample_req_86_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(42), ack => phi_stmt_45_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(42) is bound as output of CP function.
    -- CP-element group 43:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: successors 
    -- CP-element group 43:  members (2) 
      -- CP-element group 43: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_phi_mux_ack
      -- CP-element group 43: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_45_phi_mux_ack_ps
      -- 
    phi_stmt_45_phi_mux_ack_89_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 43_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_45_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(43)); -- 
    -- CP-element group 44:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: successors 
    -- CP-element group 44: 	46 
    -- CP-element group 44:  members (1) 
      -- CP-element group 44: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_sample_start__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(44) is bound as output of CP function.
    -- CP-element group 45:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: successors 
    -- CP-element group 45: 	47 
    -- CP-element group 45:  members (1) 
      -- CP-element group 45: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_update_start__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(45) is bound as output of CP function.
    -- CP-element group 46:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: 	44 
    -- CP-element group 46: marked-predecessors 
    -- CP-element group 46: 	49 
    -- CP-element group 46: successors 
    -- CP-element group 46: 	48 
    -- CP-element group 46:  members (3) 
      -- CP-element group 46: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_sample_start_
      -- CP-element group 46: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_Sample/$entry
      -- CP-element group 46: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_Sample/rr
      -- 
    rr_102_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_102_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(46), ack => RPIPE_access_completed_lock_48_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_46: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_46"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(44) & afb_to_axi_lite_bridge_daemon_CP_0_elements(49);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_46 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(46), clk => clk, reset => reset); --
    end block;
    -- CP-element group 47:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: 	45 
    -- CP-element group 47: 	48 
    -- CP-element group 47: successors 
    -- CP-element group 47: 	49 
    -- CP-element group 47:  members (3) 
      -- CP-element group 47: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_update_start_
      -- CP-element group 47: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_Update/$entry
      -- CP-element group 47: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_Update/cr
      -- 
    cr_107_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_107_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(47), ack => RPIPE_access_completed_lock_48_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_47: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_47"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(45) & afb_to_axi_lite_bridge_daemon_CP_0_elements(48);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_47 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(47), clk => clk, reset => reset); --
    end block;
    -- CP-element group 48:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: 	46 
    -- CP-element group 48: successors 
    -- CP-element group 48: 	47 
    -- CP-element group 48:  members (4) 
      -- CP-element group 48: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_sample_completed__ps
      -- CP-element group 48: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_sample_completed_
      -- CP-element group 48: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_Sample/$exit
      -- CP-element group 48: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_Sample/ra
      -- 
    ra_103_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 48_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_access_completed_lock_48_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(48)); -- 
    -- CP-element group 49:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: 	47 
    -- CP-element group 49: successors 
    -- CP-element group 49: marked-successors 
    -- CP-element group 49: 	46 
    -- CP-element group 49:  members (4) 
      -- CP-element group 49: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_update_completed__ps
      -- CP-element group 49: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_update_completed_
      -- CP-element group 49: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_Update/$exit
      -- CP-element group 49: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_access_completed_lock_48_Update/ca
      -- 
    ca_108_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 49_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_access_completed_lock_48_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(49)); -- 
    -- CP-element group 50:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: successors 
    -- CP-element group 50:  members (4) 
      -- CP-element group 50: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_50_sample_start__ps
      -- CP-element group 50: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_50_sample_completed__ps
      -- CP-element group 50: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_50_sample_start_
      -- CP-element group 50: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_50_sample_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(50) is bound as output of CP function.
    -- CP-element group 51:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: successors 
    -- CP-element group 51: 	53 
    -- CP-element group 51:  members (2) 
      -- CP-element group 51: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_50_update_start__ps
      -- CP-element group 51: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_50_update_start_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(51) is bound as output of CP function.
    -- CP-element group 52:  join  transition  bypass  pipeline-parent 
    -- CP-element group 52: predecessors 
    -- CP-element group 52: 	53 
    -- CP-element group 52: successors 
    -- CP-element group 52:  members (1) 
      -- CP-element group 52: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_50_update_completed__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(52) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(53);
    -- CP-element group 53:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 53: predecessors 
    -- CP-element group 53: 	51 
    -- CP-element group 53: successors 
    -- CP-element group 53: 	52 
    -- CP-element group 53:  members (1) 
      -- CP-element group 53: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_50_update_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(53) is a control-delay.
    cp_element_53_delay: control_delay_element  generic map(name => " 53_delay", delay_value => 1)  port map(req => afb_to_axi_lite_bridge_daemon_CP_0_elements(51), ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(53), clk => clk, reset =>reset);
    -- CP-element group 54:  join  transition  bypass  pipeline-parent 
    -- CP-element group 54: predecessors 
    -- CP-element group 54: 	9 
    -- CP-element group 54: marked-predecessors 
    -- CP-element group 54: 	12 
    -- CP-element group 54: successors 
    -- CP-element group 54: 	11 
    -- CP-element group 54:  members (1) 
      -- CP-element group 54: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_sample_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_54: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_54"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(12);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_54 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(54), clk => clk, reset => reset); --
    end block;
    -- CP-element group 55:  join  transition  bypass  pipeline-parent 
    -- CP-element group 55: predecessors 
    -- CP-element group 55: 	9 
    -- CP-element group 55: marked-predecessors 
    -- CP-element group 55: 	170 
    -- CP-element group 55: 	150 
    -- CP-element group 55: 	142 
    -- CP-element group 55: 	162 
    -- CP-element group 55: 	138 
    -- CP-element group 55: 	132 
    -- CP-element group 55: 	135 
    -- CP-element group 55: 	158 
    -- CP-element group 55: successors 
    -- CP-element group 55: 	13 
    -- CP-element group 55:  members (1) 
      -- CP-element group 55: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_update_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_55: block -- 
      constant place_capacities: IntegerArray(0 to 8) := (0 => 15,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_markings: IntegerArray(0 to 8)  := (0 => 0,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_delays: IntegerArray(0 to 8) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0,8 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_55"; 
      signal preds: BooleanArray(1 to 9); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(170) & afb_to_axi_lite_bridge_daemon_CP_0_elements(150) & afb_to_axi_lite_bridge_daemon_CP_0_elements(142) & afb_to_axi_lite_bridge_daemon_CP_0_elements(162) & afb_to_axi_lite_bridge_daemon_CP_0_elements(138) & afb_to_axi_lite_bridge_daemon_CP_0_elements(132) & afb_to_axi_lite_bridge_daemon_CP_0_elements(135) & afb_to_axi_lite_bridge_daemon_CP_0_elements(158);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_55 : generic_join generic map(name => joinName, number_of_predecessors => 9, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(55), clk => clk, reset => reset); --
    end block;
    -- CP-element group 56:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 56: predecessors 
    -- CP-element group 56: 	11 
    -- CP-element group 56: successors 
    -- CP-element group 56:  members (1) 
      -- CP-element group 56: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_sample_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(56) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(11);
    -- CP-element group 57:  join  transition  bypass  pipeline-parent 
    -- CP-element group 57: predecessors 
    -- CP-element group 57: successors 
    -- CP-element group 57: 	12 
    -- CP-element group 57:  members (1) 
      -- CP-element group 57: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_sample_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(57) is bound as output of CP function.
    -- CP-element group 58:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 58: predecessors 
    -- CP-element group 58: 	13 
    -- CP-element group 58: 	36 
    -- CP-element group 58: successors 
    -- CP-element group 58:  members (1) 
      -- CP-element group 58: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_update_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_58: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_58"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(13) & afb_to_axi_lite_bridge_daemon_CP_0_elements(36);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_58 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(58), clk => clk, reset => reset); --
    end block;
    -- CP-element group 59:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 59: predecessors 
    -- CP-element group 59: successors 
    -- CP-element group 59: 	148 
    -- CP-element group 59: 	168 
    -- CP-element group 59: 	134 
    -- CP-element group 59: 	140 
    -- CP-element group 59: 	160 
    -- CP-element group 59: 	137 
    -- CP-element group 59: 	156 
    -- CP-element group 59: 	131 
    -- CP-element group 59: 	14 
    -- CP-element group 59:  members (2) 
      -- CP-element group 59: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_update_completed_
      -- CP-element group 59: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_update_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(59) is bound as output of CP function.
    -- CP-element group 60:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 60: predecessors 
    -- CP-element group 60: 	7 
    -- CP-element group 60: successors 
    -- CP-element group 60:  members (1) 
      -- CP-element group 60: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_loopback_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(60) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(7);
    -- CP-element group 61:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 61: predecessors 
    -- CP-element group 61: successors 
    -- CP-element group 61:  members (2) 
      -- CP-element group 61: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_loopback_sample_req
      -- CP-element group 61: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_loopback_sample_req_ps
      -- 
    phi_stmt_51_loopback_sample_req_127_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_51_loopback_sample_req_127_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(61), ack => phi_stmt_51_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(61) is bound as output of CP function.
    -- CP-element group 62:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 62: predecessors 
    -- CP-element group 62: 	8 
    -- CP-element group 62: successors 
    -- CP-element group 62:  members (1) 
      -- CP-element group 62: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_entry_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(62) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(8);
    -- CP-element group 63:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 63: predecessors 
    -- CP-element group 63: successors 
    -- CP-element group 63:  members (2) 
      -- CP-element group 63: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_entry_sample_req
      -- CP-element group 63: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_entry_sample_req_ps
      -- 
    phi_stmt_51_entry_sample_req_130_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_51_entry_sample_req_130_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(63), ack => phi_stmt_51_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(63) is bound as output of CP function.
    -- CP-element group 64:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 64: predecessors 
    -- CP-element group 64: successors 
    -- CP-element group 64:  members (2) 
      -- CP-element group 64: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_phi_mux_ack
      -- CP-element group 64: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_51_phi_mux_ack_ps
      -- 
    phi_stmt_51_phi_mux_ack_133_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 64_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_51_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(64)); -- 
    -- CP-element group 65:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 65: predecessors 
    -- CP-element group 65: successors 
    -- CP-element group 65:  members (4) 
      -- CP-element group 65: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/konst_53_sample_start__ps
      -- CP-element group 65: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/konst_53_sample_completed__ps
      -- CP-element group 65: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/konst_53_sample_start_
      -- CP-element group 65: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/konst_53_sample_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(65) is bound as output of CP function.
    -- CP-element group 66:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 66: predecessors 
    -- CP-element group 66: successors 
    -- CP-element group 66: 	68 
    -- CP-element group 66:  members (2) 
      -- CP-element group 66: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/konst_53_update_start__ps
      -- CP-element group 66: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/konst_53_update_start_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(66) is bound as output of CP function.
    -- CP-element group 67:  join  transition  bypass  pipeline-parent 
    -- CP-element group 67: predecessors 
    -- CP-element group 67: 	68 
    -- CP-element group 67: successors 
    -- CP-element group 67:  members (1) 
      -- CP-element group 67: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/konst_53_update_completed__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(67) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(68);
    -- CP-element group 68:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 68: predecessors 
    -- CP-element group 68: 	66 
    -- CP-element group 68: successors 
    -- CP-element group 68: 	67 
    -- CP-element group 68:  members (1) 
      -- CP-element group 68: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/konst_53_update_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(68) is a control-delay.
    cp_element_68_delay: control_delay_element  generic map(name => " 68_delay", delay_value => 1)  port map(req => afb_to_axi_lite_bridge_daemon_CP_0_elements(66), ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(68), clk => clk, reset =>reset);
    -- CP-element group 69:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 69: predecessors 
    -- CP-element group 69: successors 
    -- CP-element group 69: 	71 
    -- CP-element group 69:  members (1) 
      -- CP-element group 69: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_sample_start__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(69) is bound as output of CP function.
    -- CP-element group 70:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 70: predecessors 
    -- CP-element group 70: successors 
    -- CP-element group 70: 	72 
    -- CP-element group 70:  members (1) 
      -- CP-element group 70: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_update_start__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(70) is bound as output of CP function.
    -- CP-element group 71:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 71: predecessors 
    -- CP-element group 71: 	69 
    -- CP-element group 71: marked-predecessors 
    -- CP-element group 71: 	74 
    -- CP-element group 71: successors 
    -- CP-element group 71: 	73 
    -- CP-element group 71:  members (3) 
      -- CP-element group 71: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_sample_start_
      -- CP-element group 71: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_Sample/$entry
      -- CP-element group 71: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_Sample/rr
      -- 
    rr_154_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_154_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(71), ack => RPIPE_AFB_BUS_REQUEST_55_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_71: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_71"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(69) & afb_to_axi_lite_bridge_daemon_CP_0_elements(74);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_71 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(71), clk => clk, reset => reset); --
    end block;
    -- CP-element group 72:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 72: predecessors 
    -- CP-element group 72: 	70 
    -- CP-element group 72: 	73 
    -- CP-element group 72: successors 
    -- CP-element group 72: 	74 
    -- CP-element group 72:  members (3) 
      -- CP-element group 72: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_update_start_
      -- CP-element group 72: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_Update/$entry
      -- CP-element group 72: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_Update/cr
      -- 
    cr_159_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_159_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(72), ack => RPIPE_AFB_BUS_REQUEST_55_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_72: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_72"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(70) & afb_to_axi_lite_bridge_daemon_CP_0_elements(73);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_72 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(72), clk => clk, reset => reset); --
    end block;
    -- CP-element group 73:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 73: predecessors 
    -- CP-element group 73: 	71 
    -- CP-element group 73: successors 
    -- CP-element group 73: 	72 
    -- CP-element group 73:  members (4) 
      -- CP-element group 73: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_sample_completed__ps
      -- CP-element group 73: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_sample_completed_
      -- CP-element group 73: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_Sample/$exit
      -- CP-element group 73: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_Sample/ra
      -- 
    ra_155_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 73_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_BUS_REQUEST_55_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(73)); -- 
    -- CP-element group 74:  join  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 74: predecessors 
    -- CP-element group 74: 	72 
    -- CP-element group 74: successors 
    -- CP-element group 74: marked-successors 
    -- CP-element group 74: 	71 
    -- CP-element group 74:  members (4) 
      -- CP-element group 74: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_update_completed__ps
      -- CP-element group 74: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_update_completed_
      -- CP-element group 74: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_Update/$exit
      -- CP-element group 74: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_AFB_BUS_REQUEST_55_Update/ca
      -- 
    ca_160_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 74_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_AFB_BUS_REQUEST_55_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(74)); -- 
    -- CP-element group 75:  join  transition  bypass  pipeline-parent 
    -- CP-element group 75: predecessors 
    -- CP-element group 75: 	9 
    -- CP-element group 75: marked-predecessors 
    -- CP-element group 75: 	12 
    -- CP-element group 75: successors 
    -- CP-element group 75: 	11 
    -- CP-element group 75:  members (1) 
      -- CP-element group 75: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_sample_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_75: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_75"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(12);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_75 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(75), clk => clk, reset => reset); --
    end block;
    -- CP-element group 76:  join  transition  bypass  pipeline-parent 
    -- CP-element group 76: predecessors 
    -- CP-element group 76: 	9 
    -- CP-element group 76: marked-predecessors 
    -- CP-element group 76: 	170 
    -- CP-element group 76: 	150 
    -- CP-element group 76: 	142 
    -- CP-element group 76: 	162 
    -- CP-element group 76: 	138 
    -- CP-element group 76: 	132 
    -- CP-element group 76: 	135 
    -- CP-element group 76: 	158 
    -- CP-element group 76: successors 
    -- CP-element group 76: 	13 
    -- CP-element group 76:  members (1) 
      -- CP-element group 76: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_update_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_76: block -- 
      constant place_capacities: IntegerArray(0 to 8) := (0 => 15,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_markings: IntegerArray(0 to 8)  := (0 => 0,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_delays: IntegerArray(0 to 8) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0,8 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_76"; 
      signal preds: BooleanArray(1 to 9); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(170) & afb_to_axi_lite_bridge_daemon_CP_0_elements(150) & afb_to_axi_lite_bridge_daemon_CP_0_elements(142) & afb_to_axi_lite_bridge_daemon_CP_0_elements(162) & afb_to_axi_lite_bridge_daemon_CP_0_elements(138) & afb_to_axi_lite_bridge_daemon_CP_0_elements(132) & afb_to_axi_lite_bridge_daemon_CP_0_elements(135) & afb_to_axi_lite_bridge_daemon_CP_0_elements(158);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_76 : generic_join generic map(name => joinName, number_of_predecessors => 9, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(76), clk => clk, reset => reset); --
    end block;
    -- CP-element group 77:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 77: predecessors 
    -- CP-element group 77: 	11 
    -- CP-element group 77: successors 
    -- CP-element group 77:  members (1) 
      -- CP-element group 77: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_sample_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(77) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(11);
    -- CP-element group 78:  join  transition  bypass  pipeline-parent 
    -- CP-element group 78: predecessors 
    -- CP-element group 78: successors 
    -- CP-element group 78: 	12 
    -- CP-element group 78:  members (1) 
      -- CP-element group 78: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_sample_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(78) is bound as output of CP function.
    -- CP-element group 79:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 79: predecessors 
    -- CP-element group 79: 	13 
    -- CP-element group 79: 	36 
    -- CP-element group 79: successors 
    -- CP-element group 79:  members (1) 
      -- CP-element group 79: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_update_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_79: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_79"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(13) & afb_to_axi_lite_bridge_daemon_CP_0_elements(36);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_79 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(79), clk => clk, reset => reset); --
    end block;
    -- CP-element group 80:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 80: predecessors 
    -- CP-element group 80: successors 
    -- CP-element group 80: 	148 
    -- CP-element group 80: 	168 
    -- CP-element group 80: 	134 
    -- CP-element group 80: 	140 
    -- CP-element group 80: 	160 
    -- CP-element group 80: 	137 
    -- CP-element group 80: 	156 
    -- CP-element group 80: 	131 
    -- CP-element group 80: 	14 
    -- CP-element group 80:  members (2) 
      -- CP-element group 80: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_update_completed_
      -- CP-element group 80: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_update_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(80) is bound as output of CP function.
    -- CP-element group 81:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 81: predecessors 
    -- CP-element group 81: 	7 
    -- CP-element group 81: successors 
    -- CP-element group 81:  members (1) 
      -- CP-element group 81: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_loopback_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(81) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(7);
    -- CP-element group 82:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 82: predecessors 
    -- CP-element group 82: successors 
    -- CP-element group 82:  members (2) 
      -- CP-element group 82: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_loopback_sample_req
      -- CP-element group 82: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_loopback_sample_req_ps
      -- 
    phi_stmt_56_loopback_sample_req_171_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_56_loopback_sample_req_171_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(82), ack => phi_stmt_56_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(82) is bound as output of CP function.
    -- CP-element group 83:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 83: predecessors 
    -- CP-element group 83: 	8 
    -- CP-element group 83: successors 
    -- CP-element group 83:  members (1) 
      -- CP-element group 83: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_entry_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(83) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(8);
    -- CP-element group 84:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 84: predecessors 
    -- CP-element group 84: successors 
    -- CP-element group 84:  members (2) 
      -- CP-element group 84: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_entry_sample_req
      -- CP-element group 84: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_entry_sample_req_ps
      -- 
    phi_stmt_56_entry_sample_req_174_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_56_entry_sample_req_174_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(84), ack => phi_stmt_56_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(84) is bound as output of CP function.
    -- CP-element group 85:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 85: predecessors 
    -- CP-element group 85: successors 
    -- CP-element group 85:  members (2) 
      -- CP-element group 85: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_phi_mux_ack_ps
      -- CP-element group 85: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_56_phi_mux_ack
      -- 
    phi_stmt_56_phi_mux_ack_177_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 85_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_56_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(85)); -- 
    -- CP-element group 86:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 86: predecessors 
    -- CP-element group 86: successors 
    -- CP-element group 86:  members (4) 
      -- CP-element group 86: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_IDLE_STATE_58_sample_start__ps
      -- CP-element group 86: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_IDLE_STATE_58_sample_completed__ps
      -- CP-element group 86: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_IDLE_STATE_58_sample_start_
      -- CP-element group 86: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_IDLE_STATE_58_sample_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(86) is bound as output of CP function.
    -- CP-element group 87:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 87: predecessors 
    -- CP-element group 87: successors 
    -- CP-element group 87: 	89 
    -- CP-element group 87:  members (2) 
      -- CP-element group 87: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_IDLE_STATE_58_update_start__ps
      -- CP-element group 87: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_IDLE_STATE_58_update_start_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(87) is bound as output of CP function.
    -- CP-element group 88:  join  transition  bypass  pipeline-parent 
    -- CP-element group 88: predecessors 
    -- CP-element group 88: 	89 
    -- CP-element group 88: successors 
    -- CP-element group 88:  members (1) 
      -- CP-element group 88: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_IDLE_STATE_58_update_completed__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(88) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(89);
    -- CP-element group 89:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 89: predecessors 
    -- CP-element group 89: 	87 
    -- CP-element group 89: successors 
    -- CP-element group 89: 	88 
    -- CP-element group 89:  members (1) 
      -- CP-element group 89: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_IDLE_STATE_58_update_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(89) is a control-delay.
    cp_element_89_delay: control_delay_element  generic map(name => " 89_delay", delay_value => 1)  port map(req => afb_to_axi_lite_bridge_daemon_CP_0_elements(87), ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(89), clk => clk, reset =>reset);
    -- CP-element group 90:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 90: predecessors 
    -- CP-element group 90: successors 
    -- CP-element group 90: 	92 
    -- CP-element group 90:  members (4) 
      -- CP-element group 90: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_sample_start__ps
      -- CP-element group 90: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_sample_start_
      -- CP-element group 90: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_Sample/$entry
      -- CP-element group 90: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_Sample/req
      -- 
    req_198_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_198_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(90), ack => nSTATE_137_59_buf_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(90) is bound as output of CP function.
    -- CP-element group 91:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 91: predecessors 
    -- CP-element group 91: successors 
    -- CP-element group 91: 	93 
    -- CP-element group 91:  members (4) 
      -- CP-element group 91: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_update_start__ps
      -- CP-element group 91: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_update_start_
      -- CP-element group 91: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_Update/$entry
      -- CP-element group 91: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_Update/req
      -- 
    req_203_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_203_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(91), ack => nSTATE_137_59_buf_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(91) is bound as output of CP function.
    -- CP-element group 92:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 92: predecessors 
    -- CP-element group 92: 	90 
    -- CP-element group 92: successors 
    -- CP-element group 92:  members (4) 
      -- CP-element group 92: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_sample_completed__ps
      -- CP-element group 92: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_sample_completed_
      -- CP-element group 92: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_Sample/$exit
      -- CP-element group 92: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_Sample/ack
      -- 
    ack_199_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 92_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nSTATE_137_59_buf_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(92)); -- 
    -- CP-element group 93:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 93: predecessors 
    -- CP-element group 93: 	91 
    -- CP-element group 93: successors 
    -- CP-element group 93:  members (4) 
      -- CP-element group 93: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_update_completed__ps
      -- CP-element group 93: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_update_completed_
      -- CP-element group 93: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_Update/$exit
      -- CP-element group 93: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_nSTATE_59_Update/ack
      -- 
    ack_204_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 93_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nSTATE_137_59_buf_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(93)); -- 
    -- CP-element group 94:  join  transition  bypass  pipeline-parent 
    -- CP-element group 94: predecessors 
    -- CP-element group 94: 	9 
    -- CP-element group 94: marked-predecessors 
    -- CP-element group 94: 	12 
    -- CP-element group 94: successors 
    -- CP-element group 94: 	11 
    -- CP-element group 94:  members (1) 
      -- CP-element group 94: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_sample_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_94: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_94"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(12);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_94 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(94), clk => clk, reset => reset); --
    end block;
    -- CP-element group 95:  join  transition  bypass  pipeline-parent 
    -- CP-element group 95: predecessors 
    -- CP-element group 95: 	9 
    -- CP-element group 95: marked-predecessors 
    -- CP-element group 95: 	170 
    -- CP-element group 95: 	150 
    -- CP-element group 95: 	142 
    -- CP-element group 95: 	162 
    -- CP-element group 95: 	138 
    -- CP-element group 95: 	132 
    -- CP-element group 95: 	135 
    -- CP-element group 95: 	158 
    -- CP-element group 95: successors 
    -- CP-element group 95: 	13 
    -- CP-element group 95:  members (1) 
      -- CP-element group 95: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_update_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_95: block -- 
      constant place_capacities: IntegerArray(0 to 8) := (0 => 15,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_markings: IntegerArray(0 to 8)  := (0 => 0,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_delays: IntegerArray(0 to 8) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0,8 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_95"; 
      signal preds: BooleanArray(1 to 9); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(170) & afb_to_axi_lite_bridge_daemon_CP_0_elements(150) & afb_to_axi_lite_bridge_daemon_CP_0_elements(142) & afb_to_axi_lite_bridge_daemon_CP_0_elements(162) & afb_to_axi_lite_bridge_daemon_CP_0_elements(138) & afb_to_axi_lite_bridge_daemon_CP_0_elements(132) & afb_to_axi_lite_bridge_daemon_CP_0_elements(135) & afb_to_axi_lite_bridge_daemon_CP_0_elements(158);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_95 : generic_join generic map(name => joinName, number_of_predecessors => 9, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(95), clk => clk, reset => reset); --
    end block;
    -- CP-element group 96:  join  transition  bypass  pipeline-parent 
    -- CP-element group 96: predecessors 
    -- CP-element group 96: successors 
    -- CP-element group 96: 	12 
    -- CP-element group 96:  members (1) 
      -- CP-element group 96: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_sample_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(96) is bound as output of CP function.
    -- CP-element group 97:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 97: predecessors 
    -- CP-element group 97: 	13 
    -- CP-element group 97: 	36 
    -- CP-element group 97: successors 
    -- CP-element group 97:  members (1) 
      -- CP-element group 97: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_update_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_97: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 49) := "afb_to_axi_lite_bridge_daemon_cp_element_group_97"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(13) & afb_to_axi_lite_bridge_daemon_CP_0_elements(36);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_97 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(97), clk => clk, reset => reset); --
    end block;
    -- CP-element group 98:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 98: predecessors 
    -- CP-element group 98: successors 
    -- CP-element group 98: 	148 
    -- CP-element group 98: 	168 
    -- CP-element group 98: 	134 
    -- CP-element group 98: 	140 
    -- CP-element group 98: 	160 
    -- CP-element group 98: 	137 
    -- CP-element group 98: 	156 
    -- CP-element group 98: 	131 
    -- CP-element group 98: 	14 
    -- CP-element group 98:  members (2) 
      -- CP-element group 98: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_update_completed_
      -- CP-element group 98: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_update_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(98) is bound as output of CP function.
    -- CP-element group 99:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 99: predecessors 
    -- CP-element group 99: 	7 
    -- CP-element group 99: successors 
    -- CP-element group 99:  members (1) 
      -- CP-element group 99: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_loopback_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(99) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(7);
    -- CP-element group 100:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 100: predecessors 
    -- CP-element group 100: successors 
    -- CP-element group 100:  members (2) 
      -- CP-element group 100: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_loopback_sample_req
      -- CP-element group 100: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_loopback_sample_req_ps
      -- 
    phi_stmt_60_loopback_sample_req_215_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_60_loopback_sample_req_215_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(100), ack => phi_stmt_60_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(100) is bound as output of CP function.
    -- CP-element group 101:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 101: predecessors 
    -- CP-element group 101: 	8 
    -- CP-element group 101: successors 
    -- CP-element group 101:  members (1) 
      -- CP-element group 101: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_entry_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(101) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(8);
    -- CP-element group 102:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 102: predecessors 
    -- CP-element group 102: successors 
    -- CP-element group 102:  members (2) 
      -- CP-element group 102: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_entry_sample_req
      -- CP-element group 102: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_entry_sample_req_ps
      -- 
    phi_stmt_60_entry_sample_req_218_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_60_entry_sample_req_218_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(102), ack => phi_stmt_60_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(102) is bound as output of CP function.
    -- CP-element group 103:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 103: predecessors 
    -- CP-element group 103: successors 
    -- CP-element group 103:  members (2) 
      -- CP-element group 103: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_phi_mux_ack
      -- CP-element group 103: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_60_phi_mux_ack_ps
      -- 
    phi_stmt_60_phi_mux_ack_221_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 103_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_60_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(103)); -- 
    -- CP-element group 104:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 104: predecessors 
    -- CP-element group 104: successors 
    -- CP-element group 104:  members (4) 
      -- CP-element group 104: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_NOACCESS_62_sample_start__ps
      -- CP-element group 104: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_NOACCESS_62_sample_completed__ps
      -- CP-element group 104: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_NOACCESS_62_sample_start_
      -- CP-element group 104: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_NOACCESS_62_sample_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(104) is bound as output of CP function.
    -- CP-element group 105:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 105: predecessors 
    -- CP-element group 105: successors 
    -- CP-element group 105: 	107 
    -- CP-element group 105:  members (2) 
      -- CP-element group 105: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_NOACCESS_62_update_start__ps
      -- CP-element group 105: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_NOACCESS_62_update_start_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(105) is bound as output of CP function.
    -- CP-element group 106:  join  transition  bypass  pipeline-parent 
    -- CP-element group 106: predecessors 
    -- CP-element group 106: 	107 
    -- CP-element group 106: successors 
    -- CP-element group 106:  members (1) 
      -- CP-element group 106: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_NOACCESS_62_update_completed__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(106) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(107);
    -- CP-element group 107:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 107: predecessors 
    -- CP-element group 107: 	105 
    -- CP-element group 107: successors 
    -- CP-element group 107: 	106 
    -- CP-element group 107:  members (1) 
      -- CP-element group 107: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_NOACCESS_62_update_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(107) is a control-delay.
    cp_element_107_delay: control_delay_element  generic map(name => " 107_delay", delay_value => 1)  port map(req => afb_to_axi_lite_bridge_daemon_CP_0_elements(105), ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(107), clk => clk, reset =>reset);
    -- CP-element group 108:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 108: predecessors 
    -- CP-element group 108: successors 
    -- CP-element group 108: 	110 
    -- CP-element group 108:  members (4) 
      -- CP-element group 108: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_sample_start__ps
      -- CP-element group 108: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_sample_start_
      -- CP-element group 108: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_Sample/$entry
      -- CP-element group 108: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_Sample/req
      -- 
    req_242_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_242_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(108), ack => next_last_access_type_103_63_buf_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(108) is bound as output of CP function.
    -- CP-element group 109:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 109: predecessors 
    -- CP-element group 109: successors 
    -- CP-element group 109: 	111 
    -- CP-element group 109:  members (4) 
      -- CP-element group 109: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_update_start__ps
      -- CP-element group 109: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_update_start_
      -- CP-element group 109: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_Update/$entry
      -- CP-element group 109: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_Update/req
      -- 
    req_247_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_247_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(109), ack => next_last_access_type_103_63_buf_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(109) is bound as output of CP function.
    -- CP-element group 110:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 110: predecessors 
    -- CP-element group 110: 	108 
    -- CP-element group 110: successors 
    -- CP-element group 110:  members (4) 
      -- CP-element group 110: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_sample_completed__ps
      -- CP-element group 110: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_sample_completed_
      -- CP-element group 110: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_Sample/$exit
      -- CP-element group 110: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_Sample/ack
      -- 
    ack_243_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 110_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => next_last_access_type_103_63_buf_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(110)); -- 
    -- CP-element group 111:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 111: predecessors 
    -- CP-element group 111: 	109 
    -- CP-element group 111: successors 
    -- CP-element group 111:  members (4) 
      -- CP-element group 111: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_update_completed__ps
      -- CP-element group 111: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_update_completed_
      -- CP-element group 111: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_Update/$exit
      -- CP-element group 111: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_next_last_access_type_63_Update/ack
      -- 
    ack_248_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 111_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => next_last_access_type_103_63_buf_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(111)); -- 
    -- CP-element group 112:  join  transition  bypass  pipeline-parent 
    -- CP-element group 112: predecessors 
    -- CP-element group 112: 	9 
    -- CP-element group 112: marked-predecessors 
    -- CP-element group 112: 	12 
    -- CP-element group 112: successors 
    -- CP-element group 112: 	11 
    -- CP-element group 112:  members (1) 
      -- CP-element group 112: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_sample_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_112: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_112"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(12);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_112 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(112), clk => clk, reset => reset); --
    end block;
    -- CP-element group 113:  join  transition  bypass  pipeline-parent 
    -- CP-element group 113: predecessors 
    -- CP-element group 113: 	9 
    -- CP-element group 113: marked-predecessors 
    -- CP-element group 113: 	170 
    -- CP-element group 113: 	150 
    -- CP-element group 113: 	142 
    -- CP-element group 113: 	162 
    -- CP-element group 113: 	138 
    -- CP-element group 113: 	132 
    -- CP-element group 113: 	135 
    -- CP-element group 113: 	158 
    -- CP-element group 113: successors 
    -- CP-element group 113: 	13 
    -- CP-element group 113:  members (1) 
      -- CP-element group 113: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_update_start_
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_113: block -- 
      constant place_capacities: IntegerArray(0 to 8) := (0 => 15,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_markings: IntegerArray(0 to 8)  := (0 => 0,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1);
      constant place_delays: IntegerArray(0 to 8) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0,8 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_113"; 
      signal preds: BooleanArray(1 to 9); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(170) & afb_to_axi_lite_bridge_daemon_CP_0_elements(150) & afb_to_axi_lite_bridge_daemon_CP_0_elements(142) & afb_to_axi_lite_bridge_daemon_CP_0_elements(162) & afb_to_axi_lite_bridge_daemon_CP_0_elements(138) & afb_to_axi_lite_bridge_daemon_CP_0_elements(132) & afb_to_axi_lite_bridge_daemon_CP_0_elements(135) & afb_to_axi_lite_bridge_daemon_CP_0_elements(158);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_113 : generic_join generic map(name => joinName, number_of_predecessors => 9, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(113), clk => clk, reset => reset); --
    end block;
    -- CP-element group 114:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 114: predecessors 
    -- CP-element group 114: 	11 
    -- CP-element group 114: successors 
    -- CP-element group 114:  members (1) 
      -- CP-element group 114: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_sample_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(114) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(11);
    -- CP-element group 115:  join  transition  bypass  pipeline-parent 
    -- CP-element group 115: predecessors 
    -- CP-element group 115: successors 
    -- CP-element group 115: 	12 
    -- CP-element group 115:  members (1) 
      -- CP-element group 115: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_sample_completed__ps
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(115) is bound as output of CP function.
    -- CP-element group 116:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 116: predecessors 
    -- CP-element group 116: 	13 
    -- CP-element group 116: 	36 
    -- CP-element group 116: successors 
    -- CP-element group 116:  members (1) 
      -- CP-element group 116: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_update_start__ps
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_116: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_116"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(13) & afb_to_axi_lite_bridge_daemon_CP_0_elements(36);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_116 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(116), clk => clk, reset => reset); --
    end block;
    -- CP-element group 117:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 117: predecessors 
    -- CP-element group 117: successors 
    -- CP-element group 117: 	148 
    -- CP-element group 117: 	168 
    -- CP-element group 117: 	134 
    -- CP-element group 117: 	140 
    -- CP-element group 117: 	160 
    -- CP-element group 117: 	137 
    -- CP-element group 117: 	156 
    -- CP-element group 117: 	131 
    -- CP-element group 117: 	14 
    -- CP-element group 117:  members (2) 
      -- CP-element group 117: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_update_completed__ps
      -- CP-element group 117: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_update_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(117) is bound as output of CP function.
    -- CP-element group 118:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 118: predecessors 
    -- CP-element group 118: 	7 
    -- CP-element group 118: successors 
    -- CP-element group 118:  members (1) 
      -- CP-element group 118: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_loopback_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(118) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(7);
    -- CP-element group 119:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 119: predecessors 
    -- CP-element group 119: successors 
    -- CP-element group 119:  members (2) 
      -- CP-element group 119: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_loopback_sample_req
      -- CP-element group 119: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_loopback_sample_req_ps
      -- 
    phi_stmt_64_loopback_sample_req_259_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_64_loopback_sample_req_259_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(119), ack => phi_stmt_64_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(119) is bound as output of CP function.
    -- CP-element group 120:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 120: predecessors 
    -- CP-element group 120: 	8 
    -- CP-element group 120: successors 
    -- CP-element group 120:  members (1) 
      -- CP-element group 120: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_entry_trigger
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(120) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(8);
    -- CP-element group 121:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 121: predecessors 
    -- CP-element group 121: successors 
    -- CP-element group 121:  members (2) 
      -- CP-element group 121: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_entry_sample_req
      -- CP-element group 121: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_entry_sample_req_ps
      -- 
    phi_stmt_64_entry_sample_req_262_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_64_entry_sample_req_262_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(121), ack => phi_stmt_64_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(121) is bound as output of CP function.
    -- CP-element group 122:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 122: predecessors 
    -- CP-element group 122: successors 
    -- CP-element group 122:  members (2) 
      -- CP-element group 122: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_phi_mux_ack
      -- CP-element group 122: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/phi_stmt_64_phi_mux_ack_ps
      -- 
    phi_stmt_64_phi_mux_ack_265_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 122_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_64_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(122)); -- 
    -- CP-element group 123:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 123: predecessors 
    -- CP-element group 123: successors 
    -- CP-element group 123:  members (4) 
      -- CP-element group 123: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_67_sample_start__ps
      -- CP-element group 123: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_67_sample_completed__ps
      -- CP-element group 123: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_67_sample_start_
      -- CP-element group 123: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_67_sample_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(123) is bound as output of CP function.
    -- CP-element group 124:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 124: predecessors 
    -- CP-element group 124: successors 
    -- CP-element group 124: 	126 
    -- CP-element group 124:  members (2) 
      -- CP-element group 124: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_67_update_start__ps
      -- CP-element group 124: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_67_update_start_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(124) is bound as output of CP function.
    -- CP-element group 125:  join  transition  bypass  pipeline-parent 
    -- CP-element group 125: predecessors 
    -- CP-element group 125: 	126 
    -- CP-element group 125: successors 
    -- CP-element group 125:  members (1) 
      -- CP-element group 125: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_67_update_completed__ps
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(125) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(126);
    -- CP-element group 126:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 126: predecessors 
    -- CP-element group 126: 	124 
    -- CP-element group 126: successors 
    -- CP-element group 126: 	125 
    -- CP-element group 126:  members (1) 
      -- CP-element group 126: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/type_cast_67_update_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(126) is a control-delay.
    cp_element_126_delay: control_delay_element  generic map(name => " 126_delay", delay_value => 1)  port map(req => afb_to_axi_lite_bridge_daemon_CP_0_elements(124), ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(126), clk => clk, reset =>reset);
    -- CP-element group 127:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 127: predecessors 
    -- CP-element group 127: successors 
    -- CP-element group 127: 	129 
    -- CP-element group 127:  members (4) 
      -- CP-element group 127: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_sample_start__ps
      -- CP-element group 127: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_sample_start_
      -- CP-element group 127: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_Sample/$entry
      -- CP-element group 127: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_Sample/req
      -- 
    req_286_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_286_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(127), ack => get_afb_req_153_68_buf_req_0); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(127) is bound as output of CP function.
    -- CP-element group 128:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 128: predecessors 
    -- CP-element group 128: successors 
    -- CP-element group 128: 	130 
    -- CP-element group 128:  members (4) 
      -- CP-element group 128: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_update_start__ps
      -- CP-element group 128: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_update_start_
      -- CP-element group 128: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_Update/$entry
      -- CP-element group 128: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_Update/req
      -- 
    req_291_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_291_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(128), ack => get_afb_req_153_68_buf_req_1); -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(128) is bound as output of CP function.
    -- CP-element group 129:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 129: predecessors 
    -- CP-element group 129: 	127 
    -- CP-element group 129: successors 
    -- CP-element group 129:  members (4) 
      -- CP-element group 129: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_sample_completed__ps
      -- CP-element group 129: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_sample_completed_
      -- CP-element group 129: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_Sample/$exit
      -- CP-element group 129: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_Sample/ack
      -- 
    ack_287_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 129_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => get_afb_req_153_68_buf_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(129)); -- 
    -- CP-element group 130:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 130: predecessors 
    -- CP-element group 130: 	128 
    -- CP-element group 130: successors 
    -- CP-element group 130:  members (4) 
      -- CP-element group 130: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_update_completed__ps
      -- CP-element group 130: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_update_completed_
      -- CP-element group 130: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_Update/$exit
      -- CP-element group 130: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/R_get_afb_req_68_Update/ack
      -- 
    ack_292_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 130_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => get_afb_req_153_68_buf_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(130)); -- 
    -- CP-element group 131:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 131: predecessors 
    -- CP-element group 131: 	117 
    -- CP-element group 131: 	98 
    -- CP-element group 131: 	38 
    -- CP-element group 131: 	59 
    -- CP-element group 131: 	80 
    -- CP-element group 131: marked-predecessors 
    -- CP-element group 131: 	133 
    -- CP-element group 131: successors 
    -- CP-element group 131: 	132 
    -- CP-element group 131:  members (3) 
      -- CP-element group 131: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_sample_start_
      -- CP-element group 131: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_Sample/$entry
      -- CP-element group 131: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_Sample/req
      -- 
    req_301_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_301_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(131), ack => WPIPE_axi_read_address_169_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_131: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_131"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(117) & afb_to_axi_lite_bridge_daemon_CP_0_elements(98) & afb_to_axi_lite_bridge_daemon_CP_0_elements(38) & afb_to_axi_lite_bridge_daemon_CP_0_elements(59) & afb_to_axi_lite_bridge_daemon_CP_0_elements(80) & afb_to_axi_lite_bridge_daemon_CP_0_elements(133);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_131 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(131), clk => clk, reset => reset); --
    end block;
    -- CP-element group 132:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 132: predecessors 
    -- CP-element group 132: 	131 
    -- CP-element group 132: successors 
    -- CP-element group 132: 	133 
    -- CP-element group 132: marked-successors 
    -- CP-element group 132: 	113 
    -- CP-element group 132: 	95 
    -- CP-element group 132: 	34 
    -- CP-element group 132: 	55 
    -- CP-element group 132: 	76 
    -- CP-element group 132:  members (6) 
      -- CP-element group 132: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_sample_completed_
      -- CP-element group 132: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_update_start_
      -- CP-element group 132: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_Sample/$exit
      -- CP-element group 132: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_Sample/ack
      -- CP-element group 132: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_Update/$entry
      -- CP-element group 132: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_Update/req
      -- 
    ack_302_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 132_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_axi_read_address_169_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(132)); -- 
    req_306_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_306_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(132), ack => WPIPE_axi_read_address_169_inst_req_1); -- 
    -- CP-element group 133:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 133: predecessors 
    -- CP-element group 133: 	132 
    -- CP-element group 133: successors 
    -- CP-element group 133: 	177 
    -- CP-element group 133: marked-successors 
    -- CP-element group 133: 	131 
    -- CP-element group 133:  members (3) 
      -- CP-element group 133: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_update_completed_
      -- CP-element group 133: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_Update/$exit
      -- CP-element group 133: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_read_address_169_Update/ack
      -- 
    ack_307_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 133_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_axi_read_address_169_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(133)); -- 
    -- CP-element group 134:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 134: predecessors 
    -- CP-element group 134: 	117 
    -- CP-element group 134: 	98 
    -- CP-element group 134: 	38 
    -- CP-element group 134: 	59 
    -- CP-element group 134: 	80 
    -- CP-element group 134: marked-predecessors 
    -- CP-element group 134: 	136 
    -- CP-element group 134: successors 
    -- CP-element group 134: 	135 
    -- CP-element group 134:  members (3) 
      -- CP-element group 134: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_sample_start_
      -- CP-element group 134: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_Sample/$entry
      -- CP-element group 134: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_Sample/req
      -- 
    req_315_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_315_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(134), ack => WPIPE_axi_write_address_179_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_134: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_134"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(117) & afb_to_axi_lite_bridge_daemon_CP_0_elements(98) & afb_to_axi_lite_bridge_daemon_CP_0_elements(38) & afb_to_axi_lite_bridge_daemon_CP_0_elements(59) & afb_to_axi_lite_bridge_daemon_CP_0_elements(80) & afb_to_axi_lite_bridge_daemon_CP_0_elements(136);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_134 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(134), clk => clk, reset => reset); --
    end block;
    -- CP-element group 135:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 135: predecessors 
    -- CP-element group 135: 	134 
    -- CP-element group 135: successors 
    -- CP-element group 135: 	136 
    -- CP-element group 135: marked-successors 
    -- CP-element group 135: 	113 
    -- CP-element group 135: 	95 
    -- CP-element group 135: 	34 
    -- CP-element group 135: 	55 
    -- CP-element group 135: 	76 
    -- CP-element group 135:  members (6) 
      -- CP-element group 135: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_sample_completed_
      -- CP-element group 135: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_update_start_
      -- CP-element group 135: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_Sample/$exit
      -- CP-element group 135: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_Sample/ack
      -- CP-element group 135: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_Update/$entry
      -- CP-element group 135: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_Update/req
      -- 
    ack_316_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 135_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_axi_write_address_179_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(135)); -- 
    req_320_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_320_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(135), ack => WPIPE_axi_write_address_179_inst_req_1); -- 
    -- CP-element group 136:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 136: predecessors 
    -- CP-element group 136: 	135 
    -- CP-element group 136: successors 
    -- CP-element group 136: 	177 
    -- CP-element group 136: marked-successors 
    -- CP-element group 136: 	134 
    -- CP-element group 136:  members (3) 
      -- CP-element group 136: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_update_completed_
      -- CP-element group 136: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_Update/$exit
      -- CP-element group 136: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_address_179_Update/ack
      -- 
    ack_321_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 136_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_axi_write_address_179_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(136)); -- 
    -- CP-element group 137:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 137: predecessors 
    -- CP-element group 137: 	117 
    -- CP-element group 137: 	98 
    -- CP-element group 137: 	38 
    -- CP-element group 137: 	59 
    -- CP-element group 137: 	80 
    -- CP-element group 137: marked-predecessors 
    -- CP-element group 137: 	139 
    -- CP-element group 137: successors 
    -- CP-element group 137: 	138 
    -- CP-element group 137:  members (3) 
      -- CP-element group 137: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_sample_start_
      -- CP-element group 137: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_Sample/$entry
      -- CP-element group 137: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_Sample/req
      -- 
    req_329_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_329_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(137), ack => WPIPE_axi_write_data_and_byte_mask_188_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_137: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_137"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(117) & afb_to_axi_lite_bridge_daemon_CP_0_elements(98) & afb_to_axi_lite_bridge_daemon_CP_0_elements(38) & afb_to_axi_lite_bridge_daemon_CP_0_elements(59) & afb_to_axi_lite_bridge_daemon_CP_0_elements(80) & afb_to_axi_lite_bridge_daemon_CP_0_elements(139);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_137 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(137), clk => clk, reset => reset); --
    end block;
    -- CP-element group 138:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 138: predecessors 
    -- CP-element group 138: 	137 
    -- CP-element group 138: successors 
    -- CP-element group 138: 	139 
    -- CP-element group 138: marked-successors 
    -- CP-element group 138: 	113 
    -- CP-element group 138: 	95 
    -- CP-element group 138: 	34 
    -- CP-element group 138: 	55 
    -- CP-element group 138: 	76 
    -- CP-element group 138:  members (6) 
      -- CP-element group 138: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_sample_completed_
      -- CP-element group 138: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_update_start_
      -- CP-element group 138: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_Sample/$exit
      -- CP-element group 138: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_Sample/ack
      -- CP-element group 138: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_Update/$entry
      -- CP-element group 138: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_Update/req
      -- 
    ack_330_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 138_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_axi_write_data_and_byte_mask_188_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(138)); -- 
    req_334_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_334_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(138), ack => WPIPE_axi_write_data_and_byte_mask_188_inst_req_1); -- 
    -- CP-element group 139:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 139: predecessors 
    -- CP-element group 139: 	138 
    -- CP-element group 139: successors 
    -- CP-element group 139: 	177 
    -- CP-element group 139: marked-successors 
    -- CP-element group 139: 	137 
    -- CP-element group 139:  members (3) 
      -- CP-element group 139: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_update_completed_
      -- CP-element group 139: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_Update/$exit
      -- CP-element group 139: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_axi_write_data_and_byte_mask_188_Update/ack
      -- 
    ack_335_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 139_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_axi_write_data_and_byte_mask_188_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(139)); -- 
    -- CP-element group 140:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 140: predecessors 
    -- CP-element group 140: 	117 
    -- CP-element group 140: 	98 
    -- CP-element group 140: 	38 
    -- CP-element group 140: 	59 
    -- CP-element group 140: 	80 
    -- CP-element group 140: marked-predecessors 
    -- CP-element group 140: 	142 
    -- CP-element group 140: successors 
    -- CP-element group 140: 	142 
    -- CP-element group 140:  members (3) 
      -- CP-element group 140: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_sample_start_
      -- CP-element group 140: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_Sample/$entry
      -- CP-element group 140: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_Sample/req
      -- 
    req_343_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_343_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(140), ack => W_do_write_195_delayed_12_0_191_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_140: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_140"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(117) & afb_to_axi_lite_bridge_daemon_CP_0_elements(98) & afb_to_axi_lite_bridge_daemon_CP_0_elements(38) & afb_to_axi_lite_bridge_daemon_CP_0_elements(59) & afb_to_axi_lite_bridge_daemon_CP_0_elements(80) & afb_to_axi_lite_bridge_daemon_CP_0_elements(142);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_140 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(140), clk => clk, reset => reset); --
    end block;
    -- CP-element group 141:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 141: predecessors 
    -- CP-element group 141: marked-predecessors 
    -- CP-element group 141: 	145 
    -- CP-element group 141: successors 
    -- CP-element group 141: 	143 
    -- CP-element group 141:  members (3) 
      -- CP-element group 141: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_update_start_
      -- CP-element group 141: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_Update/$entry
      -- CP-element group 141: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_Update/req
      -- 
    req_348_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_348_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(141), ack => W_do_write_195_delayed_12_0_191_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_141: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_141"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(145);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_141 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(141), clk => clk, reset => reset); --
    end block;
    -- CP-element group 142:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 142: predecessors 
    -- CP-element group 142: 	140 
    -- CP-element group 142: successors 
    -- CP-element group 142: marked-successors 
    -- CP-element group 142: 	113 
    -- CP-element group 142: 	140 
    -- CP-element group 142: 	95 
    -- CP-element group 142: 	34 
    -- CP-element group 142: 	55 
    -- CP-element group 142: 	76 
    -- CP-element group 142:  members (3) 
      -- CP-element group 142: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_sample_completed_
      -- CP-element group 142: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_Sample/$exit
      -- CP-element group 142: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_Sample/ack
      -- 
    ack_344_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 142_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_write_195_delayed_12_0_191_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(142)); -- 
    -- CP-element group 143:  transition  input  bypass  pipeline-parent 
    -- CP-element group 143: predecessors 
    -- CP-element group 143: 	141 
    -- CP-element group 143: successors 
    -- CP-element group 143: 	145 
    -- CP-element group 143:  members (3) 
      -- CP-element group 143: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_update_completed_
      -- CP-element group 143: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_Update/$exit
      -- CP-element group 143: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_193_Update/ack
      -- 
    ack_349_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 143_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_write_195_delayed_12_0_191_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(143)); -- 
    -- CP-element group 144:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 144: predecessors 
    -- CP-element group 144: 	9 
    -- CP-element group 144: marked-predecessors 
    -- CP-element group 144: 	147 
    -- CP-element group 144: successors 
    -- CP-element group 144: 	146 
    -- CP-element group 144:  members (3) 
      -- CP-element group 144: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_sample_start_
      -- CP-element group 144: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_Sample/$entry
      -- CP-element group 144: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_Sample/rr
      -- 
    rr_357_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_357_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(144), ack => RPIPE_axi_write_status_196_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_144: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_144"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(147);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_144 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(144), clk => clk, reset => reset); --
    end block;
    -- CP-element group 145:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 145: predecessors 
    -- CP-element group 145: 	143 
    -- CP-element group 145: 	146 
    -- CP-element group 145: marked-predecessors 
    -- CP-element group 145: 	166 
    -- CP-element group 145: successors 
    -- CP-element group 145: 	147 
    -- CP-element group 145: marked-successors 
    -- CP-element group 145: 	141 
    -- CP-element group 145:  members (3) 
      -- CP-element group 145: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_update_start_
      -- CP-element group 145: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_Update/$entry
      -- CP-element group 145: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_Update/cr
      -- 
    cr_362_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_362_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(145), ack => RPIPE_axi_write_status_196_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_145: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_145"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(143) & afb_to_axi_lite_bridge_daemon_CP_0_elements(146) & afb_to_axi_lite_bridge_daemon_CP_0_elements(166);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_145 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(145), clk => clk, reset => reset); --
    end block;
    -- CP-element group 146:  transition  input  bypass  pipeline-parent 
    -- CP-element group 146: predecessors 
    -- CP-element group 146: 	144 
    -- CP-element group 146: successors 
    -- CP-element group 146: 	145 
    -- CP-element group 146:  members (3) 
      -- CP-element group 146: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_sample_completed_
      -- CP-element group 146: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_Sample/$exit
      -- CP-element group 146: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_Sample/ra
      -- 
    ra_358_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 146_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_axi_write_status_196_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(146)); -- 
    -- CP-element group 147:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 147: predecessors 
    -- CP-element group 147: 	145 
    -- CP-element group 147: successors 
    -- CP-element group 147: 	164 
    -- CP-element group 147: marked-successors 
    -- CP-element group 147: 	144 
    -- CP-element group 147:  members (3) 
      -- CP-element group 147: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_update_completed_
      -- CP-element group 147: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_Update/$exit
      -- CP-element group 147: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_write_status_196_Update/ca
      -- 
    ca_363_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 147_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_axi_write_status_196_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(147)); -- 
    -- CP-element group 148:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 148: predecessors 
    -- CP-element group 148: 	117 
    -- CP-element group 148: 	98 
    -- CP-element group 148: 	38 
    -- CP-element group 148: 	59 
    -- CP-element group 148: 	80 
    -- CP-element group 148: marked-predecessors 
    -- CP-element group 148: 	150 
    -- CP-element group 148: successors 
    -- CP-element group 148: 	150 
    -- CP-element group 148:  members (3) 
      -- CP-element group 148: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_sample_start_
      -- CP-element group 148: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_Sample/$entry
      -- CP-element group 148: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_Sample/req
      -- 
    req_371_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_371_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(148), ack => W_do_read_199_delayed_12_0_198_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_148: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_148"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(117) & afb_to_axi_lite_bridge_daemon_CP_0_elements(98) & afb_to_axi_lite_bridge_daemon_CP_0_elements(38) & afb_to_axi_lite_bridge_daemon_CP_0_elements(59) & afb_to_axi_lite_bridge_daemon_CP_0_elements(80) & afb_to_axi_lite_bridge_daemon_CP_0_elements(150);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_148 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(148), clk => clk, reset => reset); --
    end block;
    -- CP-element group 149:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 149: predecessors 
    -- CP-element group 149: marked-predecessors 
    -- CP-element group 149: 	153 
    -- CP-element group 149: successors 
    -- CP-element group 149: 	151 
    -- CP-element group 149:  members (3) 
      -- CP-element group 149: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_update_start_
      -- CP-element group 149: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_Update/$entry
      -- CP-element group 149: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_Update/req
      -- 
    req_376_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_376_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(149), ack => W_do_read_199_delayed_12_0_198_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_149: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_149"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(153);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_149 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(149), clk => clk, reset => reset); --
    end block;
    -- CP-element group 150:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 150: predecessors 
    -- CP-element group 150: 	148 
    -- CP-element group 150: successors 
    -- CP-element group 150: marked-successors 
    -- CP-element group 150: 	113 
    -- CP-element group 150: 	148 
    -- CP-element group 150: 	95 
    -- CP-element group 150: 	34 
    -- CP-element group 150: 	55 
    -- CP-element group 150: 	76 
    -- CP-element group 150:  members (3) 
      -- CP-element group 150: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_sample_completed_
      -- CP-element group 150: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_Sample/$exit
      -- CP-element group 150: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_Sample/ack
      -- 
    ack_372_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 150_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_read_199_delayed_12_0_198_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(150)); -- 
    -- CP-element group 151:  transition  input  bypass  pipeline-parent 
    -- CP-element group 151: predecessors 
    -- CP-element group 151: 	149 
    -- CP-element group 151: successors 
    -- CP-element group 151: 	153 
    -- CP-element group 151:  members (3) 
      -- CP-element group 151: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_update_completed_
      -- CP-element group 151: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_Update/$exit
      -- CP-element group 151: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_200_Update/ack
      -- 
    ack_377_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 151_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_read_199_delayed_12_0_198_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(151)); -- 
    -- CP-element group 152:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 152: predecessors 
    -- CP-element group 152: 	9 
    -- CP-element group 152: marked-predecessors 
    -- CP-element group 152: 	155 
    -- CP-element group 152: successors 
    -- CP-element group 152: 	154 
    -- CP-element group 152:  members (3) 
      -- CP-element group 152: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_sample_start_
      -- CP-element group 152: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_Sample/$entry
      -- CP-element group 152: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_Sample/rr
      -- 
    rr_385_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_385_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(152), ack => RPIPE_axi_read_data_203_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_152: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_152"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(9) & afb_to_axi_lite_bridge_daemon_CP_0_elements(155);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_152 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(152), clk => clk, reset => reset); --
    end block;
    -- CP-element group 153:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 153: predecessors 
    -- CP-element group 153: 	151 
    -- CP-element group 153: 	154 
    -- CP-element group 153: marked-predecessors 
    -- CP-element group 153: 	166 
    -- CP-element group 153: successors 
    -- CP-element group 153: 	155 
    -- CP-element group 153: marked-successors 
    -- CP-element group 153: 	149 
    -- CP-element group 153:  members (3) 
      -- CP-element group 153: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_update_start_
      -- CP-element group 153: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_Update/$entry
      -- CP-element group 153: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_Update/cr
      -- 
    cr_390_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_390_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(153), ack => RPIPE_axi_read_data_203_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_153: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_153"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(151) & afb_to_axi_lite_bridge_daemon_CP_0_elements(154) & afb_to_axi_lite_bridge_daemon_CP_0_elements(166);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_153 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(153), clk => clk, reset => reset); --
    end block;
    -- CP-element group 154:  transition  input  bypass  pipeline-parent 
    -- CP-element group 154: predecessors 
    -- CP-element group 154: 	152 
    -- CP-element group 154: successors 
    -- CP-element group 154: 	153 
    -- CP-element group 154:  members (3) 
      -- CP-element group 154: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_sample_completed_
      -- CP-element group 154: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_Sample/$exit
      -- CP-element group 154: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_Sample/ra
      -- 
    ra_386_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 154_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_axi_read_data_203_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(154)); -- 
    -- CP-element group 155:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 155: predecessors 
    -- CP-element group 155: 	153 
    -- CP-element group 155: successors 
    -- CP-element group 155: 	164 
    -- CP-element group 155: marked-successors 
    -- CP-element group 155: 	152 
    -- CP-element group 155:  members (3) 
      -- CP-element group 155: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_update_completed_
      -- CP-element group 155: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_Update/$exit
      -- CP-element group 155: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/RPIPE_axi_read_data_203_Update/ca
      -- 
    ca_391_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 155_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_axi_read_data_203_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(155)); -- 
    -- CP-element group 156:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 156: predecessors 
    -- CP-element group 156: 	117 
    -- CP-element group 156: 	98 
    -- CP-element group 156: 	38 
    -- CP-element group 156: 	59 
    -- CP-element group 156: 	80 
    -- CP-element group 156: marked-predecessors 
    -- CP-element group 156: 	158 
    -- CP-element group 156: successors 
    -- CP-element group 156: 	158 
    -- CP-element group 156:  members (3) 
      -- CP-element group 156: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_sample_start_
      -- CP-element group 156: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_Sample/$entry
      -- CP-element group 156: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_Sample/req
      -- 
    req_399_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_399_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(156), ack => W_do_read_204_delayed_13_0_205_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_156: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_156"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(117) & afb_to_axi_lite_bridge_daemon_CP_0_elements(98) & afb_to_axi_lite_bridge_daemon_CP_0_elements(38) & afb_to_axi_lite_bridge_daemon_CP_0_elements(59) & afb_to_axi_lite_bridge_daemon_CP_0_elements(80) & afb_to_axi_lite_bridge_daemon_CP_0_elements(158);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_156 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(156), clk => clk, reset => reset); --
    end block;
    -- CP-element group 157:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 157: predecessors 
    -- CP-element group 157: marked-predecessors 
    -- CP-element group 157: 	166 
    -- CP-element group 157: successors 
    -- CP-element group 157: 	159 
    -- CP-element group 157:  members (3) 
      -- CP-element group 157: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_update_start_
      -- CP-element group 157: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_Update/$entry
      -- CP-element group 157: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_Update/req
      -- 
    req_404_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_404_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(157), ack => W_do_read_204_delayed_13_0_205_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_157: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_157"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(166);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_157 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(157), clk => clk, reset => reset); --
    end block;
    -- CP-element group 158:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 158: predecessors 
    -- CP-element group 158: 	156 
    -- CP-element group 158: successors 
    -- CP-element group 158: marked-successors 
    -- CP-element group 158: 	113 
    -- CP-element group 158: 	156 
    -- CP-element group 158: 	95 
    -- CP-element group 158: 	34 
    -- CP-element group 158: 	55 
    -- CP-element group 158: 	76 
    -- CP-element group 158:  members (3) 
      -- CP-element group 158: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_sample_completed_
      -- CP-element group 158: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_Sample/$exit
      -- CP-element group 158: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_Sample/ack
      -- 
    ack_400_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 158_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_read_204_delayed_13_0_205_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(158)); -- 
    -- CP-element group 159:  transition  input  bypass  pipeline-parent 
    -- CP-element group 159: predecessors 
    -- CP-element group 159: 	157 
    -- CP-element group 159: successors 
    -- CP-element group 159: 	164 
    -- CP-element group 159:  members (3) 
      -- CP-element group 159: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_update_completed_
      -- CP-element group 159: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_Update/$exit
      -- CP-element group 159: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_207_Update/ack
      -- 
    ack_405_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 159_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_do_read_204_delayed_13_0_205_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(159)); -- 
    -- CP-element group 160:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 160: predecessors 
    -- CP-element group 160: 	117 
    -- CP-element group 160: 	98 
    -- CP-element group 160: 	38 
    -- CP-element group 160: 	59 
    -- CP-element group 160: 	80 
    -- CP-element group 160: marked-predecessors 
    -- CP-element group 160: 	162 
    -- CP-element group 160: successors 
    -- CP-element group 160: 	162 
    -- CP-element group 160:  members (3) 
      -- CP-element group 160: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_sample_start_
      -- CP-element group 160: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_Sample/$entry
      -- CP-element group 160: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_Sample/req
      -- 
    req_413_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_413_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(160), ack => W_exec_cmd_212_delayed_13_0_217_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_160: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_160"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(117) & afb_to_axi_lite_bridge_daemon_CP_0_elements(98) & afb_to_axi_lite_bridge_daemon_CP_0_elements(38) & afb_to_axi_lite_bridge_daemon_CP_0_elements(59) & afb_to_axi_lite_bridge_daemon_CP_0_elements(80) & afb_to_axi_lite_bridge_daemon_CP_0_elements(162);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_160 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(160), clk => clk, reset => reset); --
    end block;
    -- CP-element group 161:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 161: predecessors 
    -- CP-element group 161: marked-predecessors 
    -- CP-element group 161: 	166 
    -- CP-element group 161: successors 
    -- CP-element group 161: 	163 
    -- CP-element group 161:  members (3) 
      -- CP-element group 161: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_update_start_
      -- CP-element group 161: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_Update/$entry
      -- CP-element group 161: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_Update/req
      -- 
    req_418_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_418_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(161), ack => W_exec_cmd_212_delayed_13_0_217_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_161: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_161"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(166);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_161 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(161), clk => clk, reset => reset); --
    end block;
    -- CP-element group 162:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 162: predecessors 
    -- CP-element group 162: 	160 
    -- CP-element group 162: successors 
    -- CP-element group 162: marked-successors 
    -- CP-element group 162: 	113 
    -- CP-element group 162: 	160 
    -- CP-element group 162: 	95 
    -- CP-element group 162: 	34 
    -- CP-element group 162: 	55 
    -- CP-element group 162: 	76 
    -- CP-element group 162:  members (3) 
      -- CP-element group 162: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_sample_completed_
      -- CP-element group 162: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_Sample/$exit
      -- CP-element group 162: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_Sample/ack
      -- 
    ack_414_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 162_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_exec_cmd_212_delayed_13_0_217_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(162)); -- 
    -- CP-element group 163:  transition  input  bypass  pipeline-parent 
    -- CP-element group 163: predecessors 
    -- CP-element group 163: 	161 
    -- CP-element group 163: successors 
    -- CP-element group 163: 	164 
    -- CP-element group 163:  members (3) 
      -- CP-element group 163: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_update_completed_
      -- CP-element group 163: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_Update/$exit
      -- CP-element group 163: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_219_Update/ack
      -- 
    ack_419_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 163_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_exec_cmd_212_delayed_13_0_217_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(163)); -- 
    -- CP-element group 164:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 164: predecessors 
    -- CP-element group 164: 	147 
    -- CP-element group 164: 	163 
    -- CP-element group 164: 	159 
    -- CP-element group 164: 	155 
    -- CP-element group 164: marked-predecessors 
    -- CP-element group 164: 	167 
    -- CP-element group 164: successors 
    -- CP-element group 164: 	166 
    -- CP-element group 164:  members (3) 
      -- CP-element group 164: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_sample_start_
      -- CP-element group 164: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_Sample/$entry
      -- CP-element group 164: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_Sample/req
      -- 
    req_427_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_427_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(164), ack => WPIPE_AFB_BUS_RESPONSE_221_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_164: block -- 
      constant place_capacities: IntegerArray(0 to 4) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1);
      constant place_markings: IntegerArray(0 to 4)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 1);
      constant place_delays: IntegerArray(0 to 4) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_164"; 
      signal preds: BooleanArray(1 to 5); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(147) & afb_to_axi_lite_bridge_daemon_CP_0_elements(163) & afb_to_axi_lite_bridge_daemon_CP_0_elements(159) & afb_to_axi_lite_bridge_daemon_CP_0_elements(155) & afb_to_axi_lite_bridge_daemon_CP_0_elements(167);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_164 : generic_join generic map(name => joinName, number_of_predecessors => 5, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(164), clk => clk, reset => reset); --
    end block;
    -- CP-element group 165:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 165: predecessors 
    -- CP-element group 165: 	166 
    -- CP-element group 165: marked-predecessors 
    -- CP-element group 165: 	173 
    -- CP-element group 165: successors 
    -- CP-element group 165: 	167 
    -- CP-element group 165:  members (3) 
      -- CP-element group 165: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_update_start_
      -- CP-element group 165: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_Update/$entry
      -- CP-element group 165: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_Update/req
      -- 
    req_432_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_432_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(165), ack => WPIPE_AFB_BUS_RESPONSE_221_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_165: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_165"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(166) & afb_to_axi_lite_bridge_daemon_CP_0_elements(173);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_165 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(165), clk => clk, reset => reset); --
    end block;
    -- CP-element group 166:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 166: predecessors 
    -- CP-element group 166: 	164 
    -- CP-element group 166: successors 
    -- CP-element group 166: 	165 
    -- CP-element group 166: marked-successors 
    -- CP-element group 166: 	153 
    -- CP-element group 166: 	145 
    -- CP-element group 166: 	161 
    -- CP-element group 166: 	157 
    -- CP-element group 166:  members (3) 
      -- CP-element group 166: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_sample_completed_
      -- CP-element group 166: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_Sample/$exit
      -- CP-element group 166: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_Sample/ack
      -- 
    ack_428_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 166_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_BUS_RESPONSE_221_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(166)); -- 
    -- CP-element group 167:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 167: predecessors 
    -- CP-element group 167: 	165 
    -- CP-element group 167: successors 
    -- CP-element group 167: 	175 
    -- CP-element group 167: marked-successors 
    -- CP-element group 167: 	164 
    -- CP-element group 167:  members (3) 
      -- CP-element group 167: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_update_completed_
      -- CP-element group 167: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_Update/$exit
      -- CP-element group 167: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_AFB_BUS_RESPONSE_221_Update/ack
      -- 
    ack_433_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 167_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_AFB_BUS_RESPONSE_221_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(167)); -- 
    -- CP-element group 168:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 168: predecessors 
    -- CP-element group 168: 	117 
    -- CP-element group 168: 	98 
    -- CP-element group 168: 	38 
    -- CP-element group 168: 	59 
    -- CP-element group 168: 	80 
    -- CP-element group 168: marked-predecessors 
    -- CP-element group 168: 	170 
    -- CP-element group 168: successors 
    -- CP-element group 168: 	170 
    -- CP-element group 168:  members (3) 
      -- CP-element group 168: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_sample_start_
      -- CP-element group 168: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_Sample/$entry
      -- CP-element group 168: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_Sample/req
      -- 
    req_441_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_441_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(168), ack => W_release_lock_delayed_224_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_168: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 1);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_168"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(117) & afb_to_axi_lite_bridge_daemon_CP_0_elements(98) & afb_to_axi_lite_bridge_daemon_CP_0_elements(38) & afb_to_axi_lite_bridge_daemon_CP_0_elements(59) & afb_to_axi_lite_bridge_daemon_CP_0_elements(80) & afb_to_axi_lite_bridge_daemon_CP_0_elements(170);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_168 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(168), clk => clk, reset => reset); --
    end block;
    -- CP-element group 169:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 169: predecessors 
    -- CP-element group 169: marked-predecessors 
    -- CP-element group 169: 	173 
    -- CP-element group 169: successors 
    -- CP-element group 169: 	171 
    -- CP-element group 169:  members (3) 
      -- CP-element group 169: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_update_start_
      -- CP-element group 169: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_Update/$entry
      -- CP-element group 169: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_Update/req
      -- 
    req_446_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_446_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(169), ack => W_release_lock_delayed_224_inst_req_1); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_169: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_169"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(173);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_169 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(169), clk => clk, reset => reset); --
    end block;
    -- CP-element group 170:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 170: predecessors 
    -- CP-element group 170: 	168 
    -- CP-element group 170: successors 
    -- CP-element group 170: marked-successors 
    -- CP-element group 170: 	113 
    -- CP-element group 170: 	168 
    -- CP-element group 170: 	95 
    -- CP-element group 170: 	34 
    -- CP-element group 170: 	55 
    -- CP-element group 170: 	76 
    -- CP-element group 170:  members (3) 
      -- CP-element group 170: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_sample_completed_
      -- CP-element group 170: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_Sample/$exit
      -- CP-element group 170: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_Sample/ack
      -- 
    ack_442_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 170_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_release_lock_delayed_224_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(170)); -- 
    -- CP-element group 171:  transition  input  bypass  pipeline-parent 
    -- CP-element group 171: predecessors 
    -- CP-element group 171: 	169 
    -- CP-element group 171: successors 
    -- CP-element group 171: 	172 
    -- CP-element group 171:  members (3) 
      -- CP-element group 171: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_update_completed_
      -- CP-element group 171: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_Update/$exit
      -- CP-element group 171: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/assign_stmt_226_Update/ack
      -- 
    ack_447_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 171_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_release_lock_delayed_224_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(171)); -- 
    -- CP-element group 172:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 172: predecessors 
    -- CP-element group 172: 	175 
    -- CP-element group 172: 	171 
    -- CP-element group 172: marked-predecessors 
    -- CP-element group 172: 	174 
    -- CP-element group 172: successors 
    -- CP-element group 172: 	173 
    -- CP-element group 172:  members (3) 
      -- CP-element group 172: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_sample_start_
      -- CP-element group 172: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_Sample/$entry
      -- CP-element group 172: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_Sample/req
      -- 
    req_455_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_455_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(172), ack => WPIPE_access_completed_lock_228_inst_req_0); -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_172: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_172"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(175) & afb_to_axi_lite_bridge_daemon_CP_0_elements(171) & afb_to_axi_lite_bridge_daemon_CP_0_elements(174);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_172 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(172), clk => clk, reset => reset); --
    end block;
    -- CP-element group 173:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 173: predecessors 
    -- CP-element group 173: 	172 
    -- CP-element group 173: successors 
    -- CP-element group 173: 	174 
    -- CP-element group 173: marked-successors 
    -- CP-element group 173: 	165 
    -- CP-element group 173: 	169 
    -- CP-element group 173:  members (6) 
      -- CP-element group 173: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_sample_completed_
      -- CP-element group 173: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_update_start_
      -- CP-element group 173: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_Sample/$exit
      -- CP-element group 173: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_Sample/ack
      -- CP-element group 173: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_Update/$entry
      -- CP-element group 173: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_Update/req
      -- 
    ack_456_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 173_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_access_completed_lock_228_inst_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(173)); -- 
    req_460_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_460_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => afb_to_axi_lite_bridge_daemon_CP_0_elements(173), ack => WPIPE_access_completed_lock_228_inst_req_1); -- 
    -- CP-element group 174:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 174: predecessors 
    -- CP-element group 174: 	173 
    -- CP-element group 174: successors 
    -- CP-element group 174: 	177 
    -- CP-element group 174: marked-successors 
    -- CP-element group 174: 	172 
    -- CP-element group 174:  members (3) 
      -- CP-element group 174: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_update_completed_
      -- CP-element group 174: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_Update/$exit
      -- CP-element group 174: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/WPIPE_access_completed_lock_228_Update/ack
      -- 
    ack_461_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 174_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_access_completed_lock_228_inst_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(174)); -- 
    -- CP-element group 175:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 175: predecessors 
    -- CP-element group 175: 	167 
    -- CP-element group 175: successors 
    -- CP-element group 175: 	172 
    -- CP-element group 175:  members (1) 
      -- CP-element group 175: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/synch_WPIPE_access_completed_lock_228_sample_start__WPIPE_AFB_BUS_RESPONSE_221_sample_completed_
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(175) is a control-delay.
    cp_element_175_delay: control_delay_element  generic map(name => " 175_delay", delay_value => 1)  port map(req => afb_to_axi_lite_bridge_daemon_CP_0_elements(167), ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(175), clk => clk, reset =>reset);
    -- CP-element group 176:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 176: predecessors 
    -- CP-element group 176: 	9 
    -- CP-element group 176: successors 
    -- CP-element group 176: 	10 
    -- CP-element group 176:  members (1) 
      -- CP-element group 176: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group afb_to_axi_lite_bridge_daemon_CP_0_elements(176) is a control-delay.
    cp_element_176_delay: control_delay_element  generic map(name => " 176_delay", delay_value => 1)  port map(req => afb_to_axi_lite_bridge_daemon_CP_0_elements(9), ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(176), clk => clk, reset =>reset);
    -- CP-element group 177:  join  transition  bypass  pipeline-parent 
    -- CP-element group 177: predecessors 
    -- CP-element group 177: 	174 
    -- CP-element group 177: 	133 
    -- CP-element group 177: 	139 
    -- CP-element group 177: 	136 
    -- CP-element group 177: 	12 
    -- CP-element group 177: successors 
    -- CP-element group 177: 	6 
    -- CP-element group 177:  members (1) 
      -- CP-element group 177: 	 branch_block_stmt_36/do_while_stmt_37/do_while_stmt_37_loop_body/$exit
      -- 
    afb_to_axi_lite_bridge_daemon_cp_element_group_177: block -- 
      constant place_capacities: IntegerArray(0 to 4) := (0 => 15,1 => 15,2 => 15,3 => 15,4 => 15);
      constant place_markings: IntegerArray(0 to 4)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0);
      constant place_delays: IntegerArray(0 to 4) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0);
      constant joinName: string(1 to 50) := "afb_to_axi_lite_bridge_daemon_cp_element_group_177"; 
      signal preds: BooleanArray(1 to 5); -- 
    begin -- 
      preds <= afb_to_axi_lite_bridge_daemon_CP_0_elements(174) & afb_to_axi_lite_bridge_daemon_CP_0_elements(133) & afb_to_axi_lite_bridge_daemon_CP_0_elements(139) & afb_to_axi_lite_bridge_daemon_CP_0_elements(136) & afb_to_axi_lite_bridge_daemon_CP_0_elements(12);
      gj_afb_to_axi_lite_bridge_daemon_cp_element_group_177 : generic_join generic map(name => joinName, number_of_predecessors => 5, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(177), clk => clk, reset => reset); --
    end block;
    -- CP-element group 178:  transition  input  bypass  pipeline-parent 
    -- CP-element group 178: predecessors 
    -- CP-element group 178: 	5 
    -- CP-element group 178: successors 
    -- CP-element group 178:  members (2) 
      -- CP-element group 178: 	 branch_block_stmt_36/do_while_stmt_37/loop_exit/$exit
      -- CP-element group 178: 	 branch_block_stmt_36/do_while_stmt_37/loop_exit/ack
      -- 
    ack_467_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 178_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_37_branch_ack_0, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(178)); -- 
    -- CP-element group 179:  transition  input  bypass  pipeline-parent 
    -- CP-element group 179: predecessors 
    -- CP-element group 179: 	5 
    -- CP-element group 179: successors 
    -- CP-element group 179:  members (2) 
      -- CP-element group 179: 	 branch_block_stmt_36/do_while_stmt_37/loop_taken/$exit
      -- CP-element group 179: 	 branch_block_stmt_36/do_while_stmt_37/loop_taken/ack
      -- 
    ack_471_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 179_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_37_branch_ack_1, ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(179)); -- 
    -- CP-element group 180:  transition  bypass  pipeline-parent 
    -- CP-element group 180: predecessors 
    -- CP-element group 180: 	3 
    -- CP-element group 180: successors 
    -- CP-element group 180: 	1 
    -- CP-element group 180:  members (1) 
      -- CP-element group 180: 	 branch_block_stmt_36/do_while_stmt_37/$exit
      -- 
    afb_to_axi_lite_bridge_daemon_CP_0_elements(180) <= afb_to_axi_lite_bridge_daemon_CP_0_elements(3);
    afb_to_axi_lite_bridge_daemon_do_while_stmt_37_terminator_472: loop_terminator -- 
      generic map (name => " afb_to_axi_lite_bridge_daemon_do_while_stmt_37_terminator_472", max_iterations_in_flight =>15) 
      port map(loop_body_exit => afb_to_axi_lite_bridge_daemon_CP_0_elements(6),loop_continue => afb_to_axi_lite_bridge_daemon_CP_0_elements(179),loop_terminate => afb_to_axi_lite_bridge_daemon_CP_0_elements(178),loop_back => afb_to_axi_lite_bridge_daemon_CP_0_elements(4),loop_exit => afb_to_axi_lite_bridge_daemon_CP_0_elements(3),clk => clk, reset => reset); -- 
    phi_stmt_39_phi_seq_73_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(22);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(25)<= src_sample_reqs(0);
      src_sample_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(25);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(26)<= src_update_reqs(0);
      src_update_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(27);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(23) <= phi_mux_reqs(0);
      triggers(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(20);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(29)<= src_sample_reqs(1);
      src_sample_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(31);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(30)<= src_update_reqs(1);
      src_update_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(32);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(21) <= phi_mux_reqs(1);
      phi_stmt_39_phi_seq_73 : phi_sequencer_v2-- 
        generic map (place_capacity => 15, ntriggers => 2, name => "phi_stmt_39_phi_seq_73") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(17), 
          phi_sample_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(18), 
          phi_update_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(13), 
          phi_update_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(19), 
          phi_mux_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(24), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_45_phi_seq_117_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(39);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(44)<= src_sample_reqs(0);
      src_sample_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(48);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(45)<= src_update_reqs(0);
      src_update_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(49);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(40) <= phi_mux_reqs(0);
      triggers(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(41);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(50)<= src_sample_reqs(1);
      src_sample_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(50);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(51)<= src_update_reqs(1);
      src_update_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(52);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(42) <= phi_mux_reqs(1);
      phi_stmt_45_phi_seq_117 : phi_sequencer_v2-- 
        generic map (place_capacity => 15, ntriggers => 2, name => "phi_stmt_45_phi_seq_117") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(35), 
          phi_sample_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(36), 
          phi_update_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(37), 
          phi_update_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(38), 
          phi_mux_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(43), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_51_phi_seq_161_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(62);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(65)<= src_sample_reqs(0);
      src_sample_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(65);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(66)<= src_update_reqs(0);
      src_update_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(67);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(63) <= phi_mux_reqs(0);
      triggers(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(60);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(69)<= src_sample_reqs(1);
      src_sample_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(73);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(70)<= src_update_reqs(1);
      src_update_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(74);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(61) <= phi_mux_reqs(1);
      phi_stmt_51_phi_seq_161 : phi_sequencer_v2-- 
        generic map (place_capacity => 15, ntriggers => 2, name => "phi_stmt_51_phi_seq_161") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(56), 
          phi_sample_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(57), 
          phi_update_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(58), 
          phi_update_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(59), 
          phi_mux_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(64), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_56_phi_seq_205_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(83);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(86)<= src_sample_reqs(0);
      src_sample_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(86);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(87)<= src_update_reqs(0);
      src_update_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(88);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(84) <= phi_mux_reqs(0);
      triggers(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(81);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(90)<= src_sample_reqs(1);
      src_sample_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(92);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(91)<= src_update_reqs(1);
      src_update_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(93);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(82) <= phi_mux_reqs(1);
      phi_stmt_56_phi_seq_205 : phi_sequencer_v2-- 
        generic map (place_capacity => 15, ntriggers => 2, name => "phi_stmt_56_phi_seq_205") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(77), 
          phi_sample_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(78), 
          phi_update_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(79), 
          phi_update_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(80), 
          phi_mux_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(85), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_60_phi_seq_249_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(101);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(104)<= src_sample_reqs(0);
      src_sample_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(104);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(105)<= src_update_reqs(0);
      src_update_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(106);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(102) <= phi_mux_reqs(0);
      triggers(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(99);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(108)<= src_sample_reqs(1);
      src_sample_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(110);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(109)<= src_update_reqs(1);
      src_update_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(111);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(100) <= phi_mux_reqs(1);
      phi_stmt_60_phi_seq_249 : phi_sequencer_v2-- 
        generic map (place_capacity => 15, ntriggers => 2, name => "phi_stmt_60_phi_seq_249") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(11), 
          phi_sample_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(96), 
          phi_update_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(97), 
          phi_update_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(98), 
          phi_mux_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(103), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_64_phi_seq_293_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(120);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(123)<= src_sample_reqs(0);
      src_sample_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(123);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(124)<= src_update_reqs(0);
      src_update_acks(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(125);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(121) <= phi_mux_reqs(0);
      triggers(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(118);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(127)<= src_sample_reqs(1);
      src_sample_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(129);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(128)<= src_update_reqs(1);
      src_update_acks(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(130);
      afb_to_axi_lite_bridge_daemon_CP_0_elements(119) <= phi_mux_reqs(1);
      phi_stmt_64_phi_seq_293 : phi_sequencer_v2-- 
        generic map (place_capacity => 15, ntriggers => 2, name => "phi_stmt_64_phi_seq_293") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(114), 
          phi_sample_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(115), 
          phi_update_req => afb_to_axi_lite_bridge_daemon_CP_0_elements(116), 
          phi_update_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(117), 
          phi_mux_ack => afb_to_axi_lite_bridge_daemon_CP_0_elements(122), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_25_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(7);
        preds(1)  <= afb_to_axi_lite_bridge_daemon_CP_0_elements(8);
        entry_tmerge_25 : transition_merge -- 
          generic map(name => " entry_tmerge_25")
          port map (preds => preds, symbol_out => afb_to_axi_lite_bridge_daemon_CP_0_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal AND_u1_u1_120_wire : std_logic_vector(0 downto 0);
    signal CONCAT_u1_u33_212_wire : std_logic_vector(32 downto 0);
    signal EQ_u2_u1_107_wire : std_logic_vector(0 downto 0);
    signal EQ_u2_u1_113_wire : std_logic_vector(0 downto 0);
    signal EQ_u2_u1_129_wire : std_logic_vector(0 downto 0);
    signal EQ_u2_u1_150_wire : std_logic_vector(0 downto 0);
    signal MUX_110_wire : std_logic_vector(1 downto 0);
    signal MUX_123_wire : std_logic_vector(1 downto 0);
    signal MUX_125_wire : std_logic_vector(1 downto 0);
    signal MUX_133_wire : std_logic_vector(1 downto 0);
    signal MUX_135_wire : std_logic_vector(1 downto 0);
    signal MUX_97_wire : std_logic_vector(1 downto 0);
    signal NEQ_u2_u1_116_wire : std_logic_vector(0 downto 0);
    signal NEQ_u2_u1_119_wire : std_logic_vector(0 downto 0);
    signal NEQ_u2_u1_141_wire : std_logic_vector(0 downto 0);
    signal NEQ_u2_u1_144_wire : std_logic_vector(0 downto 0);
    signal NOT_u1_u1_174_wire : std_logic_vector(0 downto 0);
    signal OR_u2_u2_126_wire : std_logic_vector(1 downto 0);
    signal RPIPE_AFB_BUS_REQUEST_55_wire : std_logic_vector(73 downto 0);
    signal RPIPE_access_completed_lock_48_wire : std_logic_vector(0 downto 0);
    signal R_IDLE_STATE_106_wire_constant : std_logic_vector(1 downto 0);
    signal R_IDLE_STATE_140_wire_constant : std_logic_vector(1 downto 0);
    signal R_IDLE_STATE_149_wire_constant : std_logic_vector(1 downto 0);
    signal R_IDLE_STATE_58_wire_constant : std_logic_vector(1 downto 0);
    signal R_NOACCESS_115_wire_constant : std_logic_vector(1 downto 0);
    signal R_NOACCESS_62_wire_constant : std_logic_vector(1 downto 0);
    signal R_READACCESS_95_wire_constant : std_logic_vector(1 downto 0);
    signal R_RUN_STATE_108_wire_constant : std_logic_vector(1 downto 0);
    signal R_RUN_STATE_112_wire_constant : std_logic_vector(1 downto 0);
    signal R_RUN_STATE_122_wire_constant : std_logic_vector(1 downto 0);
    signal R_RUN_STATE_131_wire_constant : std_logic_vector(1 downto 0);
    signal R_WAIT_STATE_121_wire_constant : std_logic_vector(1 downto 0);
    signal R_WAIT_STATE_128_wire_constant : std_logic_vector(1 downto 0);
    signal R_WAIT_STATE_132_wire_constant : std_logic_vector(1 downto 0);
    signal R_WAIT_STATE_143_wire_constant : std_logic_vector(1 downto 0);
    signal R_WAIT_STATE_156_wire_constant : std_logic_vector(1 downto 0);
    signal R_WRITEACCESS_96_wire_constant : std_logic_vector(1 downto 0);
    signal R_ZZ1_210_wire_constant : std_logic_vector(0 downto 0);
    signal STATE_56 : std_logic_vector(1 downto 0);
    signal afb_req_51 : std_logic_vector(73 downto 0);
    signal afb_req_addr_32_162 : std_logic_vector(31 downto 0);
    signal afb_req_addr_87 : std_logic_vector(35 downto 0);
    signal afb_req_byte_mask_83 : std_logic_vector(3 downto 0);
    signal afb_req_data_91 : std_logic_vector(31 downto 0);
    signal afb_req_read_78 : std_logic_vector(0 downto 0);
    signal afb_resp_216 : std_logic_vector(32 downto 0);
    signal counter_39 : std_logic_vector(7 downto 0);
    signal current_access_type_100 : std_logic_vector(1 downto 0);
    signal do_read_167 : std_logic_vector(0 downto 0);
    signal do_read_199_delayed_12_0_200 : std_logic_vector(0 downto 0);
    signal do_read_204_delayed_13_0_207 : std_logic_vector(0 downto 0);
    signal do_write_177 : std_logic_vector(0 downto 0);
    signal do_write_195_delayed_12_0_193 : std_logic_vector(0 downto 0);
    signal exec_cmd_146 : std_logic_vector(0 downto 0);
    signal exec_cmd_212_delayed_13_0_219 : std_logic_vector(0 downto 0);
    signal get_afb_req_153 : std_logic_vector(0 downto 0);
    signal get_afb_req_153_68_buffered : std_logic_vector(0 downto 0);
    signal get_afb_req_d_64 : std_logic_vector(0 downto 0);
    signal konst_109_wire_constant : std_logic_vector(1 downto 0);
    signal konst_124_wire_constant : std_logic_vector(1 downto 0);
    signal konst_134_wire_constant : std_logic_vector(1 downto 0);
    signal konst_229_wire_constant : std_logic_vector(0 downto 0);
    signal konst_232_wire_constant : std_logic_vector(0 downto 0);
    signal konst_53_wire_constant : std_logic_vector(73 downto 0);
    signal konst_72_wire_constant : std_logic_vector(7 downto 0);
    signal last_access_type_60 : std_logic_vector(1 downto 0);
    signal lock_acquired_45 : std_logic_vector(0 downto 0);
    signal nSTATE_137 : std_logic_vector(1 downto 0);
    signal nSTATE_137_59_buffered : std_logic_vector(1 downto 0);
    signal n_counter_74 : std_logic_vector(7 downto 0);
    signal n_counter_74_44_buffered : std_logic_vector(7 downto 0);
    signal next_last_access_type_103 : std_logic_vector(1 downto 0);
    signal next_last_access_type_103_63_buffered : std_logic_vector(1 downto 0);
    signal rdata_204 : std_logic_vector(31 downto 0);
    signal release_lock_158 : std_logic_vector(0 downto 0);
    signal release_lock_delayed_226 : std_logic_vector(0 downto 0);
    signal type_cast_214_wire : std_logic_vector(32 downto 0);
    signal type_cast_43_wire_constant : std_logic_vector(7 downto 0);
    signal type_cast_50_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_67_wire_constant : std_logic_vector(0 downto 0);
    signal wdata_byte_mask_186 : std_logic_vector(35 downto 0);
    signal wrrsp_axi_197 : std_logic_vector(1 downto 0);
    -- 
  begin -- 
    R_IDLE_STATE_106_wire_constant <= "00";
    R_IDLE_STATE_140_wire_constant <= "00";
    R_IDLE_STATE_149_wire_constant <= "00";
    R_IDLE_STATE_58_wire_constant <= "00";
    R_NOACCESS_115_wire_constant <= "00";
    R_NOACCESS_62_wire_constant <= "00";
    R_READACCESS_95_wire_constant <= "01";
    R_RUN_STATE_108_wire_constant <= "01";
    R_RUN_STATE_112_wire_constant <= "01";
    R_RUN_STATE_122_wire_constant <= "01";
    R_RUN_STATE_131_wire_constant <= "01";
    R_WAIT_STATE_121_wire_constant <= "10";
    R_WAIT_STATE_128_wire_constant <= "10";
    R_WAIT_STATE_132_wire_constant <= "10";
    R_WAIT_STATE_143_wire_constant <= "10";
    R_WAIT_STATE_156_wire_constant <= "10";
    R_WRITEACCESS_96_wire_constant <= "10";
    R_ZZ1_210_wire_constant <= "0";
    konst_109_wire_constant <= "00";
    konst_124_wire_constant <= "00";
    konst_134_wire_constant <= "00";
    konst_229_wire_constant <= "1";
    konst_232_wire_constant <= "1";
    konst_53_wire_constant <= "00000000000000000000000000000000000000000000000000000000000000000000000000";
    konst_72_wire_constant <= "00000001";
    type_cast_43_wire_constant <= "00000000";
    type_cast_50_wire_constant <= "1";
    type_cast_67_wire_constant <= "0";
    phi_stmt_39: Block -- phi operator 
      signal idata: std_logic_vector(15 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_43_wire_constant & n_counter_74_44_buffered;
      req <= phi_stmt_39_req_0 & phi_stmt_39_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_39",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 8) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_39_ack_0,
          idata => idata,
          odata => counter_39,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_39
    phi_stmt_45: Block -- phi operator 
      signal idata: std_logic_vector(1 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= RPIPE_access_completed_lock_48_wire & type_cast_50_wire_constant;
      req <= phi_stmt_45_req_0 & phi_stmt_45_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_45",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 1) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_45_ack_0,
          idata => idata,
          odata => lock_acquired_45,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_45
    phi_stmt_51: Block -- phi operator 
      signal idata: std_logic_vector(147 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= konst_53_wire_constant & RPIPE_AFB_BUS_REQUEST_55_wire;
      req <= phi_stmt_51_req_0 & phi_stmt_51_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_51",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 74) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_51_ack_0,
          idata => idata,
          odata => afb_req_51,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_51
    phi_stmt_56: Block -- phi operator 
      signal idata: std_logic_vector(3 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= R_IDLE_STATE_58_wire_constant & nSTATE_137_59_buffered;
      req <= phi_stmt_56_req_0 & phi_stmt_56_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_56",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 2) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_56_ack_0,
          idata => idata,
          odata => STATE_56,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_56
    phi_stmt_60: Block -- phi operator 
      signal idata: std_logic_vector(3 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= R_NOACCESS_62_wire_constant & next_last_access_type_103_63_buffered;
      req <= phi_stmt_60_req_0 & phi_stmt_60_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_60",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 2) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_60_ack_0,
          idata => idata,
          odata => last_access_type_60,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_60
    phi_stmt_64: Block -- phi operator 
      signal idata: std_logic_vector(1 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_67_wire_constant & get_afb_req_153_68_buffered;
      req <= phi_stmt_64_req_0 & phi_stmt_64_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_64",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 1) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_64_ack_0,
          idata => idata,
          odata => get_afb_req_d_64,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_64
    -- flow-through select operator MUX_110_inst
    MUX_110_wire <= R_RUN_STATE_108_wire_constant when (EQ_u2_u1_107_wire(0) /=  '0') else konst_109_wire_constant;
    -- flow-through select operator MUX_123_inst
    MUX_123_wire <= R_WAIT_STATE_121_wire_constant when (AND_u1_u1_120_wire(0) /=  '0') else R_RUN_STATE_122_wire_constant;
    -- flow-through select operator MUX_125_inst
    MUX_125_wire <= MUX_123_wire when (EQ_u2_u1_113_wire(0) /=  '0') else konst_124_wire_constant;
    -- flow-through select operator MUX_133_inst
    MUX_133_wire <= R_RUN_STATE_131_wire_constant when (lock_acquired_45(0) /=  '0') else R_WAIT_STATE_132_wire_constant;
    -- flow-through select operator MUX_135_inst
    MUX_135_wire <= MUX_133_wire when (EQ_u2_u1_129_wire(0) /=  '0') else konst_134_wire_constant;
    -- flow-through select operator MUX_215_inst
    afb_resp_216 <= CONCAT_u1_u33_212_wire when (do_read_204_delayed_13_0_207(0) /=  '0') else type_cast_214_wire;
    -- flow-through select operator MUX_97_inst
    MUX_97_wire <= R_READACCESS_95_wire_constant when (afb_req_read_78(0) /=  '0') else R_WRITEACCESS_96_wire_constant;
    -- flow-through select operator MUX_99_inst
    current_access_type_100 <= MUX_97_wire when (get_afb_req_d_64(0) /=  '0') else last_access_type_60;
    -- flow-through slice operator slice_161_inst
    afb_req_addr_32_162 <= afb_req_addr_87(31 downto 0);
    -- flow-through slice operator slice_77_inst
    afb_req_read_78 <= afb_req_51(72 downto 72);
    -- flow-through slice operator slice_82_inst
    afb_req_byte_mask_83 <= afb_req_51(71 downto 68);
    -- flow-through slice operator slice_86_inst
    afb_req_addr_87 <= afb_req_51(67 downto 32);
    -- flow-through slice operator slice_90_inst
    afb_req_data_91 <= afb_req_51(31 downto 0);
    W_do_read_199_delayed_12_0_198_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_do_read_199_delayed_12_0_198_inst_req_0;
      W_do_read_199_delayed_12_0_198_inst_ack_0<= wack(0);
      rreq(0) <= W_do_read_199_delayed_12_0_198_inst_req_1;
      W_do_read_199_delayed_12_0_198_inst_ack_1<= rack(0);
      W_do_read_199_delayed_12_0_198_inst : InterlockBuffer generic map ( -- 
        name => "W_do_read_199_delayed_12_0_198_inst",
        buffer_size => 12,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => do_read_167,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => do_read_199_delayed_12_0_200,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_do_read_204_delayed_13_0_205_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_do_read_204_delayed_13_0_205_inst_req_0;
      W_do_read_204_delayed_13_0_205_inst_ack_0<= wack(0);
      rreq(0) <= W_do_read_204_delayed_13_0_205_inst_req_1;
      W_do_read_204_delayed_13_0_205_inst_ack_1<= rack(0);
      W_do_read_204_delayed_13_0_205_inst : InterlockBuffer generic map ( -- 
        name => "W_do_read_204_delayed_13_0_205_inst",
        buffer_size => 13,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => do_read_167,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => do_read_204_delayed_13_0_207,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_do_write_195_delayed_12_0_191_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_do_write_195_delayed_12_0_191_inst_req_0;
      W_do_write_195_delayed_12_0_191_inst_ack_0<= wack(0);
      rreq(0) <= W_do_write_195_delayed_12_0_191_inst_req_1;
      W_do_write_195_delayed_12_0_191_inst_ack_1<= rack(0);
      W_do_write_195_delayed_12_0_191_inst : InterlockBuffer generic map ( -- 
        name => "W_do_write_195_delayed_12_0_191_inst",
        buffer_size => 12,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => do_write_177,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => do_write_195_delayed_12_0_193,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_exec_cmd_212_delayed_13_0_217_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_exec_cmd_212_delayed_13_0_217_inst_req_0;
      W_exec_cmd_212_delayed_13_0_217_inst_ack_0<= wack(0);
      rreq(0) <= W_exec_cmd_212_delayed_13_0_217_inst_req_1;
      W_exec_cmd_212_delayed_13_0_217_inst_ack_1<= rack(0);
      W_exec_cmd_212_delayed_13_0_217_inst : InterlockBuffer generic map ( -- 
        name => "W_exec_cmd_212_delayed_13_0_217_inst",
        buffer_size => 13,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => exec_cmd_146,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => exec_cmd_212_delayed_13_0_219,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- interlock W_next_last_access_type_101_inst
    process(current_access_type_100) -- 
      variable tmp_var : std_logic_vector(1 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 1 downto 0) := current_access_type_100(1 downto 0);
      next_last_access_type_103 <= tmp_var; -- 
    end process;
    W_release_lock_delayed_224_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_release_lock_delayed_224_inst_req_0;
      W_release_lock_delayed_224_inst_ack_0<= wack(0);
      rreq(0) <= W_release_lock_delayed_224_inst_req_1;
      W_release_lock_delayed_224_inst_ack_1<= rack(0);
      W_release_lock_delayed_224_inst : InterlockBuffer generic map ( -- 
        name => "W_release_lock_delayed_224_inst",
        buffer_size => 12,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => release_lock_158,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => release_lock_delayed_226,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    get_afb_req_153_68_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= get_afb_req_153_68_buf_req_0;
      get_afb_req_153_68_buf_ack_0<= wack(0);
      rreq(0) <= get_afb_req_153_68_buf_req_1;
      get_afb_req_153_68_buf_ack_1<= rack(0);
      get_afb_req_153_68_buf : InterlockBuffer generic map ( -- 
        name => "get_afb_req_153_68_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => get_afb_req_153,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => get_afb_req_153_68_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    nSTATE_137_59_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= nSTATE_137_59_buf_req_0;
      nSTATE_137_59_buf_ack_0<= wack(0);
      rreq(0) <= nSTATE_137_59_buf_req_1;
      nSTATE_137_59_buf_ack_1<= rack(0);
      nSTATE_137_59_buf : InterlockBuffer generic map ( -- 
        name => "nSTATE_137_59_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 2,
        out_data_width => 2,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => nSTATE_137,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => nSTATE_137_59_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    n_counter_74_44_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= n_counter_74_44_buf_req_0;
      n_counter_74_44_buf_ack_0<= wack(0);
      rreq(0) <= n_counter_74_44_buf_req_1;
      n_counter_74_44_buf_ack_1<= rack(0);
      n_counter_74_44_buf : InterlockBuffer generic map ( -- 
        name => "n_counter_74_44_buf",
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
        write_data => n_counter_74,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => n_counter_74_44_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    next_last_access_type_103_63_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= next_last_access_type_103_63_buf_req_0;
      next_last_access_type_103_63_buf_ack_0<= wack(0);
      rreq(0) <= next_last_access_type_103_63_buf_req_1;
      next_last_access_type_103_63_buf_ack_1<= rack(0);
      next_last_access_type_103_63_buf : InterlockBuffer generic map ( -- 
        name => "next_last_access_type_103_63_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 2,
        out_data_width => 2,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => next_last_access_type_103,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => next_last_access_type_103_63_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- interlock type_cast_214_inst
    process(wrrsp_axi_197) -- 
      variable tmp_var : std_logic_vector(32 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 1 downto 0) := wrrsp_axi_197(1 downto 0);
      type_cast_214_wire <= tmp_var; -- 
    end process;
    do_while_stmt_37_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_232_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_37_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_37_branch_req_0,
          ack0 => do_while_stmt_37_branch_ack_0,
          ack1 => do_while_stmt_37_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator ADD_u8_u8_73_inst
    process(counter_39) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      ApIntAdd_proc(counter_39, konst_72_wire_constant, tmp_var);
      n_counter_74 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_120_inst
    process(NEQ_u2_u1_116_wire, NEQ_u2_u1_119_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(NEQ_u2_u1_116_wire, NEQ_u2_u1_119_wire, tmp_var);
      AND_u1_u1_120_wire <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_145_inst
    process(NEQ_u2_u1_141_wire, NEQ_u2_u1_144_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(NEQ_u2_u1_141_wire, NEQ_u2_u1_144_wire, tmp_var);
      exec_cmd_146 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_166_inst
    process(afb_req_read_78, exec_cmd_146) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(afb_req_read_78, exec_cmd_146, tmp_var);
      do_read_167 <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_176_inst
    process(NOT_u1_u1_174_wire, exec_cmd_146) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(NOT_u1_u1_174_wire, exec_cmd_146, tmp_var);
      do_write_177 <= tmp_var; --
    end process;
    -- binary operator CONCAT_u1_u33_212_inst
    process(R_ZZ1_210_wire_constant, rdata_204) -- 
      variable tmp_var : std_logic_vector(32 downto 0); -- 
    begin -- 
      ApConcat_proc(R_ZZ1_210_wire_constant, rdata_204, tmp_var);
      CONCAT_u1_u33_212_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u4_u36_185_inst
    process(afb_req_byte_mask_83, afb_req_data_91) -- 
      variable tmp_var : std_logic_vector(35 downto 0); -- 
    begin -- 
      ApConcat_proc(afb_req_byte_mask_83, afb_req_data_91, tmp_var);
      wdata_byte_mask_186 <= tmp_var; --
    end process;
    -- binary operator EQ_u2_u1_107_inst
    process(STATE_56) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(STATE_56, R_IDLE_STATE_106_wire_constant, tmp_var);
      EQ_u2_u1_107_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u2_u1_113_inst
    process(STATE_56) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(STATE_56, R_RUN_STATE_112_wire_constant, tmp_var);
      EQ_u2_u1_113_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u2_u1_129_inst
    process(STATE_56) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(STATE_56, R_WAIT_STATE_128_wire_constant, tmp_var);
      EQ_u2_u1_129_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u2_u1_150_inst
    process(STATE_56) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(STATE_56, R_IDLE_STATE_149_wire_constant, tmp_var);
      EQ_u2_u1_150_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u2_u1_157_inst
    process(nSTATE_137) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(nSTATE_137, R_WAIT_STATE_156_wire_constant, tmp_var);
      release_lock_158 <= tmp_var; --
    end process;
    -- binary operator NEQ_u2_u1_116_inst
    process(last_access_type_60) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntNe_proc(last_access_type_60, R_NOACCESS_115_wire_constant, tmp_var);
      NEQ_u2_u1_116_wire <= tmp_var; --
    end process;
    -- binary operator NEQ_u2_u1_119_inst
    process(last_access_type_60, current_access_type_100) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntNe_proc(last_access_type_60, current_access_type_100, tmp_var);
      NEQ_u2_u1_119_wire <= tmp_var; --
    end process;
    -- binary operator NEQ_u2_u1_141_inst
    process(STATE_56) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntNe_proc(STATE_56, R_IDLE_STATE_140_wire_constant, tmp_var);
      NEQ_u2_u1_141_wire <= tmp_var; --
    end process;
    -- binary operator NEQ_u2_u1_144_inst
    process(nSTATE_137) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntNe_proc(nSTATE_137, R_WAIT_STATE_143_wire_constant, tmp_var);
      NEQ_u2_u1_144_wire <= tmp_var; --
    end process;
    -- unary operator NOT_u1_u1_174_inst
    process(afb_req_read_78) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", afb_req_read_78, tmp_var);
      NOT_u1_u1_174_wire <= tmp_var; -- 
    end process;
    -- binary operator OR_u1_u1_152_inst
    process(EQ_u2_u1_150_wire, exec_cmd_146) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u2_u1_150_wire, exec_cmd_146, tmp_var);
      get_afb_req_153 <= tmp_var; --
    end process;
    -- binary operator OR_u2_u2_126_inst
    process(MUX_110_wire, MUX_125_wire) -- 
      variable tmp_var : std_logic_vector(1 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_110_wire, MUX_125_wire, tmp_var);
      OR_u2_u2_126_wire <= tmp_var; --
    end process;
    -- binary operator OR_u2_u2_136_inst
    process(OR_u2_u2_126_wire, MUX_135_wire) -- 
      variable tmp_var : std_logic_vector(1 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u2_u2_126_wire, MUX_135_wire, tmp_var);
      nSTATE_137 <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_AFB_BUS_REQUEST_55_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(73 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_AFB_BUS_REQUEST_55_inst_req_0;
      RPIPE_AFB_BUS_REQUEST_55_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_AFB_BUS_REQUEST_55_inst_req_1;
      RPIPE_AFB_BUS_REQUEST_55_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= get_afb_req_153(0);
      RPIPE_AFB_BUS_REQUEST_55_wire <= data_out(73 downto 0);
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
    -- shared inport operator group (1) : RPIPE_access_completed_lock_48_inst 
    InportGroup_1: Block -- 
      signal data_out: std_logic_vector(0 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_access_completed_lock_48_inst_req_0;
      RPIPE_access_completed_lock_48_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_access_completed_lock_48_inst_req_1;
      RPIPE_access_completed_lock_48_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= release_lock_158(0);
      RPIPE_access_completed_lock_48_wire <= data_out(0 downto 0);
      access_completed_lock_read_1_gI: SplitGuardInterface generic map(name => "access_completed_lock_read_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
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
      access_completed_lock_read_1: InputPort_P2P -- 
        generic map ( name => "access_completed_lock_read_1", data_width => 1,    bypass_flag => false,   	nonblocking_read_flag => false,  barrier_flag => true,   queue_depth =>  1)
        port map (-- 
          sample_req => reqL(0) , 
          sample_ack => ackL(0), 
          update_req => reqR(0), 
          update_ack => ackR(0), 
          data => data_out, 
          oreq => access_completed_lock_pipe_read_req(0),
          oack => access_completed_lock_pipe_read_ack(0),
          odata => access_completed_lock_pipe_read_data(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 1
    -- shared inport operator group (2) : RPIPE_axi_read_data_203_inst 
    InportGroup_2: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_axi_read_data_203_inst_req_0;
      RPIPE_axi_read_data_203_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_axi_read_data_203_inst_req_1;
      RPIPE_axi_read_data_203_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= do_read_199_delayed_12_0_200(0);
      rdata_204 <= data_out(31 downto 0);
      axi_read_data_read_2_gI: SplitGuardInterface generic map(name => "axi_read_data_read_2_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
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
      axi_read_data_read_2: InputPort_P2P -- 
        generic map ( name => "axi_read_data_read_2", data_width => 32,    bypass_flag => false,   	nonblocking_read_flag => false,  barrier_flag => false,   queue_depth =>  2)
        port map (-- 
          sample_req => reqL(0) , 
          sample_ack => ackL(0), 
          update_req => reqR(0), 
          update_ack => ackR(0), 
          data => data_out, 
          oreq => axi_read_data_pipe_read_req(0),
          oack => axi_read_data_pipe_read_ack(0),
          odata => axi_read_data_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 2
    -- shared inport operator group (3) : RPIPE_axi_write_status_196_inst 
    InportGroup_3: Block -- 
      signal data_out: std_logic_vector(1 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_axi_write_status_196_inst_req_0;
      RPIPE_axi_write_status_196_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_axi_write_status_196_inst_req_1;
      RPIPE_axi_write_status_196_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= do_write_195_delayed_12_0_193(0);
      wrrsp_axi_197 <= data_out(1 downto 0);
      axi_write_status_read_3_gI: SplitGuardInterface generic map(name => "axi_write_status_read_3_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
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
      axi_write_status_read_3: InputPort_P2P -- 
        generic map ( name => "axi_write_status_read_3", data_width => 2,    bypass_flag => false,   	nonblocking_read_flag => false,  barrier_flag => false,   queue_depth =>  2)
        port map (-- 
          sample_req => reqL(0) , 
          sample_ack => ackL(0), 
          update_req => reqR(0), 
          update_ack => ackR(0), 
          data => data_out, 
          oreq => axi_write_status_pipe_read_req(0),
          oack => axi_write_status_pipe_read_ack(0),
          odata => axi_write_status_pipe_read_data(1 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 3
    -- shared outport operator group (0) : WPIPE_AFB_BUS_RESPONSE_221_inst 
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
      sample_req_unguarded(0) <= WPIPE_AFB_BUS_RESPONSE_221_inst_req_0;
      WPIPE_AFB_BUS_RESPONSE_221_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_AFB_BUS_RESPONSE_221_inst_req_1;
      WPIPE_AFB_BUS_RESPONSE_221_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= exec_cmd_212_delayed_13_0_219(0);
      data_in <= afb_resp_216;
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
    -- shared outport operator group (1) : WPIPE_access_completed_lock_228_inst 
    OutportGroup_1: Block -- 
      signal data_in: std_logic_vector(0 downto 0);
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
      sample_req_unguarded(0) <= WPIPE_access_completed_lock_228_inst_req_0;
      WPIPE_access_completed_lock_228_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_access_completed_lock_228_inst_req_1;
      WPIPE_access_completed_lock_228_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= release_lock_delayed_226(0);
      data_in <= konst_229_wire_constant;
      access_completed_lock_write_1_gI: SplitGuardInterface generic map(name => "access_completed_lock_write_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      access_completed_lock_write_1: OutputPortRevised -- 
        generic map ( name => "access_completed_lock", data_width => 1, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => access_completed_lock_pipe_write_req(0),
          oack => access_completed_lock_pipe_write_ack(0),
          odata => access_completed_lock_pipe_write_data(0 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
    -- shared outport operator group (2) : WPIPE_axi_read_address_169_inst 
    OutportGroup_2: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
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
      sample_req_unguarded(0) <= WPIPE_axi_read_address_169_inst_req_0;
      WPIPE_axi_read_address_169_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_axi_read_address_169_inst_req_1;
      WPIPE_axi_read_address_169_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= do_read_167(0);
      data_in <= afb_req_addr_32_162;
      axi_read_address_write_2_gI: SplitGuardInterface generic map(name => "axi_read_address_write_2_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      axi_read_address_write_2: OutputPortRevised -- 
        generic map ( name => "axi_read_address", data_width => 32, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => axi_read_address_pipe_write_req(0),
          oack => axi_read_address_pipe_write_ack(0),
          odata => axi_read_address_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 2
    -- shared outport operator group (3) : WPIPE_axi_write_address_179_inst 
    OutportGroup_3: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
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
      sample_req_unguarded(0) <= WPIPE_axi_write_address_179_inst_req_0;
      WPIPE_axi_write_address_179_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_axi_write_address_179_inst_req_1;
      WPIPE_axi_write_address_179_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= do_write_177(0);
      data_in <= afb_req_addr_32_162;
      axi_write_address_write_3_gI: SplitGuardInterface generic map(name => "axi_write_address_write_3_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      axi_write_address_write_3: OutputPortRevised -- 
        generic map ( name => "axi_write_address", data_width => 32, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => axi_write_address_pipe_write_req(0),
          oack => axi_write_address_pipe_write_ack(0),
          odata => axi_write_address_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 3
    -- shared outport operator group (4) : WPIPE_axi_write_data_and_byte_mask_188_inst 
    OutportGroup_4: Block -- 
      signal data_in: std_logic_vector(35 downto 0);
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
      sample_req_unguarded(0) <= WPIPE_axi_write_data_and_byte_mask_188_inst_req_0;
      WPIPE_axi_write_data_and_byte_mask_188_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_axi_write_data_and_byte_mask_188_inst_req_1;
      WPIPE_axi_write_data_and_byte_mask_188_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= do_write_177(0);
      data_in <= wdata_byte_mask_186;
      axi_write_data_and_byte_mask_write_4_gI: SplitGuardInterface generic map(name => "axi_write_data_and_byte_mask_write_4_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      axi_write_data_and_byte_mask_write_4: OutputPortRevised -- 
        generic map ( name => "axi_write_data_and_byte_mask", data_width => 36, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => axi_write_data_and_byte_mask_pipe_write_req(0),
          oack => axi_write_data_and_byte_mask_pipe_write_ack(0),
          odata => axi_write_data_and_byte_mask_pipe_write_data(35 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 4
    -- 
  end Block; -- data_path
  -- 
end afb_to_axi_lite_bridge_daemon_arch;
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
library AxiBridgeLib;
use AxiBridgeLib.afb_axi_core_global_package.all;
entity afb_axi_core is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_BUS_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_BUS_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_BUS_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_BUS_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_BUS_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    axi_read_address_pipe_read_data: out std_logic_vector(31 downto 0);
    axi_read_address_pipe_read_req : in std_logic_vector(0 downto 0);
    axi_read_address_pipe_read_ack : out std_logic_vector(0 downto 0);
    axi_read_data_pipe_write_data: in std_logic_vector(31 downto 0);
    axi_read_data_pipe_write_req : in std_logic_vector(0 downto 0);
    axi_read_data_pipe_write_ack : out std_logic_vector(0 downto 0);
    axi_write_address_pipe_read_data: out std_logic_vector(31 downto 0);
    axi_write_address_pipe_read_req : in std_logic_vector(0 downto 0);
    axi_write_address_pipe_read_ack : out std_logic_vector(0 downto 0);
    axi_write_data_and_byte_mask_pipe_read_data: out std_logic_vector(35 downto 0);
    axi_write_data_and_byte_mask_pipe_read_req : in std_logic_vector(0 downto 0);
    axi_write_data_and_byte_mask_pipe_read_ack : out std_logic_vector(0 downto 0);
    axi_write_status_pipe_write_data: in std_logic_vector(1 downto 0);
    axi_write_status_pipe_write_req : in std_logic_vector(0 downto 0);
    axi_write_status_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture afb_axi_core_arch  of afb_axi_core is -- system-architecture 
  -- declarations related to module afb_to_axi_lite_bridge_daemon
  component afb_to_axi_lite_bridge_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      AFB_BUS_REQUEST_pipe_read_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_read_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_REQUEST_pipe_read_data : in   std_logic_vector(73 downto 0);
      access_completed_lock_pipe_read_req : out  std_logic_vector(0 downto 0);
      access_completed_lock_pipe_read_ack : in   std_logic_vector(0 downto 0);
      access_completed_lock_pipe_read_data : in   std_logic_vector(0 downto 0);
      axi_write_status_pipe_read_req : out  std_logic_vector(0 downto 0);
      axi_write_status_pipe_read_ack : in   std_logic_vector(0 downto 0);
      axi_write_status_pipe_read_data : in   std_logic_vector(1 downto 0);
      axi_read_data_pipe_read_req : out  std_logic_vector(0 downto 0);
      axi_read_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
      axi_read_data_pipe_read_data : in   std_logic_vector(31 downto 0);
      access_completed_lock_pipe_write_req : out  std_logic_vector(0 downto 0);
      access_completed_lock_pipe_write_ack : in   std_logic_vector(0 downto 0);
      access_completed_lock_pipe_write_data : out  std_logic_vector(0 downto 0);
      axi_read_address_pipe_write_req : out  std_logic_vector(0 downto 0);
      axi_read_address_pipe_write_ack : in   std_logic_vector(0 downto 0);
      axi_read_address_pipe_write_data : out  std_logic_vector(31 downto 0);
      AFB_BUS_RESPONSE_pipe_write_req : out  std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_write_ack : in   std_logic_vector(0 downto 0);
      AFB_BUS_RESPONSE_pipe_write_data : out  std_logic_vector(32 downto 0);
      axi_write_data_and_byte_mask_pipe_write_req : out  std_logic_vector(0 downto 0);
      axi_write_data_and_byte_mask_pipe_write_ack : in   std_logic_vector(0 downto 0);
      axi_write_data_and_byte_mask_pipe_write_data : out  std_logic_vector(35 downto 0);
      axi_write_address_pipe_write_req : out  std_logic_vector(0 downto 0);
      axi_write_address_pipe_write_ack : in   std_logic_vector(0 downto 0);
      axi_write_address_pipe_write_data : out  std_logic_vector(31 downto 0);
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
  -- argument signals for module afb_to_axi_lite_bridge_daemon
  signal afb_to_axi_lite_bridge_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal afb_to_axi_lite_bridge_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal afb_to_axi_lite_bridge_daemon_start_req : std_logic;
  signal afb_to_axi_lite_bridge_daemon_start_ack : std_logic;
  signal afb_to_axi_lite_bridge_daemon_fin_req   : std_logic;
  signal afb_to_axi_lite_bridge_daemon_fin_ack : std_logic;
  -- aggregate signals for read from pipe AFB_BUS_REQUEST
  signal AFB_BUS_REQUEST_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_BUS_REQUEST_pipe_read_req: std_logic_vector(0 downto 0);
  signal AFB_BUS_REQUEST_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe AFB_BUS_RESPONSE
  signal AFB_BUS_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_BUS_RESPONSE_pipe_write_req: std_logic_vector(0 downto 0);
  signal AFB_BUS_RESPONSE_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe access_completed_lock
  signal access_completed_lock_pipe_write_data: std_logic_vector(0 downto 0);
  signal access_completed_lock_pipe_write_req: std_logic_vector(0 downto 0);
  signal access_completed_lock_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe access_completed_lock
  signal access_completed_lock_pipe_read_data: std_logic_vector(0 downto 0);
  signal access_completed_lock_pipe_read_req: std_logic_vector(0 downto 0);
  signal access_completed_lock_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe axi_read_address
  signal axi_read_address_pipe_write_data: std_logic_vector(31 downto 0);
  signal axi_read_address_pipe_write_req: std_logic_vector(0 downto 0);
  signal axi_read_address_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe axi_read_data
  signal axi_read_data_pipe_read_data: std_logic_vector(31 downto 0);
  signal axi_read_data_pipe_read_req: std_logic_vector(0 downto 0);
  signal axi_read_data_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe axi_write_address
  signal axi_write_address_pipe_write_data: std_logic_vector(31 downto 0);
  signal axi_write_address_pipe_write_req: std_logic_vector(0 downto 0);
  signal axi_write_address_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe axi_write_data_and_byte_mask
  signal axi_write_data_and_byte_mask_pipe_write_data: std_logic_vector(35 downto 0);
  signal axi_write_data_and_byte_mask_pipe_write_req: std_logic_vector(0 downto 0);
  signal axi_write_data_and_byte_mask_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe axi_write_status
  signal axi_write_status_pipe_read_data: std_logic_vector(1 downto 0);
  signal axi_write_status_pipe_read_req: std_logic_vector(0 downto 0);
  signal axi_write_status_pipe_read_ack: std_logic_vector(0 downto 0);
  -- 
begin -- 
  -- module afb_to_axi_lite_bridge_daemon
  afb_to_axi_lite_bridge_daemon_instance:afb_to_axi_lite_bridge_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => afb_to_axi_lite_bridge_daemon_start_req,
      start_ack => afb_to_axi_lite_bridge_daemon_start_ack,
      fin_req => afb_to_axi_lite_bridge_daemon_fin_req,
      fin_ack => afb_to_axi_lite_bridge_daemon_fin_ack,
      clk => clk,
      reset => reset,
      AFB_BUS_REQUEST_pipe_read_req => AFB_BUS_REQUEST_pipe_read_req(0 downto 0),
      AFB_BUS_REQUEST_pipe_read_ack => AFB_BUS_REQUEST_pipe_read_ack(0 downto 0),
      AFB_BUS_REQUEST_pipe_read_data => AFB_BUS_REQUEST_pipe_read_data(73 downto 0),
      access_completed_lock_pipe_read_req => access_completed_lock_pipe_read_req(0 downto 0),
      access_completed_lock_pipe_read_ack => access_completed_lock_pipe_read_ack(0 downto 0),
      access_completed_lock_pipe_read_data => access_completed_lock_pipe_read_data(0 downto 0),
      axi_write_status_pipe_read_req => axi_write_status_pipe_read_req(0 downto 0),
      axi_write_status_pipe_read_ack => axi_write_status_pipe_read_ack(0 downto 0),
      axi_write_status_pipe_read_data => axi_write_status_pipe_read_data(1 downto 0),
      axi_read_data_pipe_read_req => axi_read_data_pipe_read_req(0 downto 0),
      axi_read_data_pipe_read_ack => axi_read_data_pipe_read_ack(0 downto 0),
      axi_read_data_pipe_read_data => axi_read_data_pipe_read_data(31 downto 0),
      access_completed_lock_pipe_write_req => access_completed_lock_pipe_write_req(0 downto 0),
      access_completed_lock_pipe_write_ack => access_completed_lock_pipe_write_ack(0 downto 0),
      access_completed_lock_pipe_write_data => access_completed_lock_pipe_write_data(0 downto 0),
      axi_read_address_pipe_write_req => axi_read_address_pipe_write_req(0 downto 0),
      axi_read_address_pipe_write_ack => axi_read_address_pipe_write_ack(0 downto 0),
      axi_read_address_pipe_write_data => axi_read_address_pipe_write_data(31 downto 0),
      AFB_BUS_RESPONSE_pipe_write_req => AFB_BUS_RESPONSE_pipe_write_req(0 downto 0),
      AFB_BUS_RESPONSE_pipe_write_ack => AFB_BUS_RESPONSE_pipe_write_ack(0 downto 0),
      AFB_BUS_RESPONSE_pipe_write_data => AFB_BUS_RESPONSE_pipe_write_data(32 downto 0),
      axi_write_data_and_byte_mask_pipe_write_req => axi_write_data_and_byte_mask_pipe_write_req(0 downto 0),
      axi_write_data_and_byte_mask_pipe_write_ack => axi_write_data_and_byte_mask_pipe_write_ack(0 downto 0),
      axi_write_data_and_byte_mask_pipe_write_data => axi_write_data_and_byte_mask_pipe_write_data(35 downto 0),
      axi_write_address_pipe_write_req => axi_write_address_pipe_write_req(0 downto 0),
      axi_write_address_pipe_write_ack => axi_write_address_pipe_write_ack(0 downto 0),
      axi_write_address_pipe_write_data => axi_write_address_pipe_write_data(31 downto 0),
      tag_in => afb_to_axi_lite_bridge_daemon_tag_in,
      tag_out => afb_to_axi_lite_bridge_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  afb_to_axi_lite_bridge_daemon_tag_in <= (others => '0');
  afb_to_axi_lite_bridge_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => afb_to_axi_lite_bridge_daemon_start_req, start_ack => afb_to_axi_lite_bridge_daemon_start_ack,  fin_req => afb_to_axi_lite_bridge_daemon_fin_req,  fin_ack => afb_to_axi_lite_bridge_daemon_fin_ack);
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
      depth => 2 --
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
      depth => 2 --
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
  access_completed_lock_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe access_completed_lock",
      num_reads => 1,
      num_writes => 1,
      data_width => 1,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => access_completed_lock_pipe_read_req,
      read_ack => access_completed_lock_pipe_read_ack,
      read_data => access_completed_lock_pipe_read_data,
      write_req => access_completed_lock_pipe_write_req,
      write_ack => access_completed_lock_pipe_write_ack,
      write_data => access_completed_lock_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  axi_read_address_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe axi_read_address",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => axi_read_address_pipe_read_req,
      read_ack => axi_read_address_pipe_read_ack,
      read_data => axi_read_address_pipe_read_data,
      write_req => axi_read_address_pipe_write_req,
      write_ack => axi_read_address_pipe_write_ack,
      write_data => axi_read_address_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  axi_read_data_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe axi_read_data",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => axi_read_data_pipe_read_req,
      read_ack => axi_read_data_pipe_read_ack,
      read_data => axi_read_data_pipe_read_data,
      write_req => axi_read_data_pipe_write_req,
      write_ack => axi_read_data_pipe_write_ack,
      write_data => axi_read_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  axi_write_address_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe axi_write_address",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => axi_write_address_pipe_read_req,
      read_ack => axi_write_address_pipe_read_ack,
      read_data => axi_write_address_pipe_read_data,
      write_req => axi_write_address_pipe_write_req,
      write_ack => axi_write_address_pipe_write_ack,
      write_data => axi_write_address_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  axi_write_data_and_byte_mask_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe axi_write_data_and_byte_mask",
      num_reads => 1,
      num_writes => 1,
      data_width => 36,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => axi_write_data_and_byte_mask_pipe_read_req,
      read_ack => axi_write_data_and_byte_mask_pipe_read_ack,
      read_data => axi_write_data_and_byte_mask_pipe_read_data,
      write_req => axi_write_data_and_byte_mask_pipe_write_req,
      write_ack => axi_write_data_and_byte_mask_pipe_write_ack,
      write_data => axi_write_data_and_byte_mask_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  axi_write_status_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe axi_write_status",
      num_reads => 1,
      num_writes => 1,
      data_width => 2,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => axi_write_status_pipe_read_req,
      read_ack => axi_write_status_pipe_read_ack,
      read_data => axi_write_status_pipe_read_data,
      write_req => axi_write_status_pipe_write_req,
      write_ack => axi_write_status_pipe_write_ack,
      write_data => axi_write_status_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end afb_axi_core_arch;
library ieee;
use ieee.std_logic_1164.all;

library AxiBridgeLib;
use AxiBridgeLib.axi_component_package.all;

entity afb_axi_lite_bridge is
        generic (ADDR_WIDTH: integer := 32);
	port (
		clk, reset: in std_logic;
                ----------------------------------------------------------------
                ----------------------------------------------------------------
		-- AXI side interface
                ----------------------------------------------------------------
                -- clock, reset to slave device
                ----------------------------------------------------------------
	        ACLK, ARESETn: out std_logic;
                ----------------------------------------------------------------
                -- read address channel
                ----------------------------------------------------------------
                ARREADY: in std_logic;
                ARVALID: out std_logic;
                ARADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
                -- tied to 000
		ARPROT:  out std_logic_vector (2 downto 0);	
                ----------------------------------------------------------------
		-- read data channel.
                ----------------------------------------------------------------
                RVALID: in std_logic;
                RREADY: out std_logic;
                RDATA:  in std_logic_vector (31 downto 0);
    		RRESP:  in std_logic_vector (1 downto 0);
                ----------------------------------------------------------------
		-- write address channel.
                ----------------------------------------------------------------
                AWREADY: in std_logic;
                AWVALID: out std_logic;
                AWADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
                -- tied to 000
		AWPROT:  out std_logic_vector (2 downto 0);	
                ----------------------------------------------------------------
		-- write data channel.
                ----------------------------------------------------------------
                WVALID: out std_logic;
                WREADY: in std_logic;
                WDATA:  out std_logic_vector (31 downto 0);
                -- byte mask.
    		WSTRB:  out std_logic_vector (3 downto 0);
                ----------------------------------------------------------------
                ----------------------------------------------------------------
		-- AFB side interface
                ----------------------------------------------------------------
                ----------------------------------------------------------------
		-- AFB response side.
                ----------------------------------------------------------------
    		AFB_BUS_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
    		AFB_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    		AFB_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
                ----------------------------------------------------------------
		-- AFB request side..
                ----------------------------------------------------------------
    		AFB_BUS_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
    		AFB_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
    		AFB_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0)
	     );
end entity afb_axi_lite_bridge;

architecture AaInspired of afb_axi_lite_bridge is

 signal axi_read_address_pipe_read_data: std_logic_vector(31 downto 0);
 signal axi_read_address_pipe_read_req : std_logic_vector(0 downto 0);
 signal axi_read_address_pipe_read_ack : std_logic_vector(0 downto 0);
 signal axi_read_data_pipe_write_data:   std_logic_vector(31 downto 0);
 signal axi_read_data_pipe_write_req :   std_logic_vector(0 downto 0);
 signal axi_read_data_pipe_write_ack :   std_logic_vector(0 downto 0);
 signal axi_write_address_pipe_read_data: std_logic_vector(31 downto 0);
 signal axi_write_address_pipe_read_req : std_logic_vector(0 downto 0);
 signal axi_write_address_pipe_read_ack : std_logic_vector(0 downto 0);
 signal axi_write_data_and_byte_mask_pipe_read_data: std_logic_vector(35 downto 0);
 signal axi_write_data_and_byte_mask_pipe_read_req : std_logic_vector(0 downto 0);
 signal axi_write_data_and_byte_mask_pipe_read_ack : std_logic_vector(0 downto 0); -- 

 -- status signals.. stubbed.
 signal axi_write_status_pipe_write_data: std_logic_vector(1 downto 0);
 signal axi_write_status_pipe_write_req : std_logic_vector(0 downto 0);
 signal axi_write_status_pipe_write_ack : std_logic_vector(0 downto 0);  

begin

   ACLK <= clk;
   ARESETn <= not reset;

   -- status..  this is read inside afb_axi_core.. but the value is ignored.
   axi_write_status_pipe_write_req(0) <= '1';
   axi_write_status_pipe_write_data   <= (others => '0');

   
   -- read address channel
   ARVALID <= axi_read_address_pipe_read_req(0);
   axi_read_address_pipe_read_ack (0) <= ARREADY;
   ARADDR <= axi_read_address_pipe_read_data;
   ARPROT <= (others => '0');

   -- read data channel
   axi_read_data_pipe_write_data <= RDATA;
   axi_read_data_pipe_write_req(0) <= RVALID;
   RREADY <= axi_read_data_pipe_write_ack(0);
   -- RRESP is ignored.

   -- write address channel.
   AWADDR <= axi_write_address_pipe_read_data;
   axi_write_address_pipe_read_req(0) <= AWREADY;
   AWVALID <= axi_write_address_pipe_read_ack(0);

   -- write data channel.
   WDATA <= axi_write_data_and_byte_mask_pipe_read_data(31 downto 0);
   WSTRB <= axi_write_data_and_byte_mask_pipe_read_data(35 downto 32);
   axi_write_data_and_byte_mask_pipe_read_req(0) <= WREADY;
   WVALID <= axi_write_data_and_byte_mask_pipe_read_ack(0);

   aa_core: afb_axi_core
		port map (
    			clk  => clk ,
    			reset  => reset ,
    			AFB_BUS_REQUEST_pipe_write_data => AFB_BUS_REQUEST_pipe_write_data,
    			AFB_BUS_REQUEST_pipe_write_req  => AFB_BUS_REQUEST_pipe_write_req ,
    			AFB_BUS_REQUEST_pipe_write_ack  => AFB_BUS_REQUEST_pipe_write_ack ,
    			AFB_BUS_RESPONSE_pipe_read_data => AFB_BUS_RESPONSE_pipe_read_data,
    			AFB_BUS_RESPONSE_pipe_read_req  => AFB_BUS_RESPONSE_pipe_read_req ,
    			AFB_BUS_RESPONSE_pipe_read_ack  => AFB_BUS_RESPONSE_pipe_read_ack ,
    			axi_read_address_pipe_read_data => axi_read_address_pipe_read_data,
    			axi_read_address_pipe_read_req  => axi_read_address_pipe_read_req ,
    			axi_read_address_pipe_read_ack  => axi_read_address_pipe_read_ack ,
    			axi_read_data_pipe_write_data => axi_read_data_pipe_write_data,
    			axi_read_data_pipe_write_req  => axi_read_data_pipe_write_req ,
    			axi_read_data_pipe_write_ack  => axi_read_data_pipe_write_ack ,
    			axi_write_address_pipe_read_data => axi_write_address_pipe_read_data,
    			axi_write_address_pipe_read_req  => axi_write_address_pipe_read_req ,
    			axi_write_address_pipe_read_ack  => axi_write_address_pipe_read_ack ,
    			axi_write_data_and_byte_mask_pipe_read_data => 
							axi_write_data_and_byte_mask_pipe_read_data,
    			axi_write_data_and_byte_mask_pipe_read_req  => 
							axi_write_data_and_byte_mask_pipe_read_req ,
    			axi_write_data_and_byte_mask_pipe_read_ack  => 
							axi_write_data_and_byte_mask_pipe_read_ack,
    			axi_write_status_pipe_write_data => axi_write_status_pipe_write_data,
    			axi_write_status_pipe_write_req => axi_write_status_pipe_write_req,
			-- ignored.
    			axi_write_status_pipe_write_ack => axi_write_status_pipe_write_ack
		);


end AaInspired;

library ieee;
use ieee.std_logic_1164.all;

library AxiBridgeLib;
use AxiBridgeLib.axi_component_package.all;

entity afb_axi_master_lite_bridge is
        generic (ADDR_WIDTH: integer := 32);
	port (
		clk,reset: in std_logic;
                ----------------------------------------------------------------
                ----------------------------------------------------------------
		-- AXI side interface
                ----------------------------------------------------------------
                -- clock, reset to slave device
                ----------------------------------------------------------------
	        ACLK,ARESETn: out std_logic;
                ----------------------------------------------------------------
                -- read address channel
                ----------------------------------------------------------------
                ARREADY: in std_logic;
                ARVALID: out std_logic;
                ARADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
                -- tied to 000
		ARPROT:  out std_logic_vector (2 downto 0);	
                ----------------------------------------------------------------
		-- read data channel.
                ----------------------------------------------------------------
                RVALID: in std_logic;
                RREADY: out std_logic;
                RDATA:  in std_logic_vector (31 downto 0);
    		RRESP:  in std_logic_vector (1 downto 0);
                ----------------------------------------------------------------
		-- write address channel.
                ----------------------------------------------------------------
                AWREADY: in std_logic;
                AWVALID: out std_logic;
                AWADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
                -- tied to 000
		AWPROT:  out std_logic_vector (2 downto 0);	
                ----------------------------------------------------------------
		-- write data channel.
                ----------------------------------------------------------------
                WVALID: out std_logic;
                WREADY: in std_logic;
                WDATA:  out std_logic_vector (31 downto 0);
                -- byte mask.
    		WSTRB:  out std_logic_vector (3 downto 0);
                ----------------------------------------------------------------
                ----------------------------------------------------------------
                BRESP: in std_logic_vector(1 downto 0);
                BREADY: out std_logic;
                BVALID: in std_logic;
		-- AFB side interface
                ----------------------------------------------------------------
        	-- AFB response side.
                ----------------------------------------------------------------
    		AFB_BUS_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
    		AFB_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    		AFB_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
                ----------------------------------------------------------------
		-- AFB request side..
                ----------------------------------------------------------------
    		AFB_BUS_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
    		AFB_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
    		AFB_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0)
	     );
end entity afb_axi_master_lite_bridge;

architecture AaInspired of afb_axi_master_lite_bridge is


 signal axi_read_addr_pipe_read_data: std_logic_vector(31 downto 0);
 signal axi_read_addr_pipe_read_req : std_logic_vector(0 downto 0);
 signal axi_read_addr_pipe_read_ack : std_logic_vector(0 downto 0);
 signal axi_read_dat_pipe_write_data:   std_logic_vector(31 downto 0);
 signal axi_read_dat_pipe_write_req :   std_logic_vector(0 downto 0);
 signal axi_read_dat_pipe_write_ack :   std_logic_vector(0 downto 0);
 signal axi_write_addr_pipe_read_data: std_logic_vector(31 downto 0);
 signal axi_write_addr_pipe_read_req : std_logic_vector(0 downto 0);
 signal axi_write_addr_pipe_read_ack : std_logic_vector(0 downto 0);
 signal axi_write_dat_and_byte_mask_pipe_read_data: std_logic_vector(35 downto 0);
 signal axi_write_dat_and_byte_mask_pipe_read_req : std_logic_vector(0 downto 0);
 signal axi_write_dat_and_byte_mask_pipe_read_ack : std_logic_vector(0 downto 0); -- 
 signal axi_write_response_pipe_write_data: std_logic_vector(1 downto 0);
 signal axi_write_response_pipe_write_req : std_logic_vector(0 downto 0);
 signal axi_write_response_pipe_write_ack : std_logic_vector(0 downto 0);

begin

   ACLK <= clk;
   ARESETn <= not reset;
   
   -- read address channel
   ARVALID <= axi_read_addr_pipe_read_ack(0);
   axi_read_addr_pipe_read_req(0) <= ARREADY;
   ARADDR <= axi_read_addr_pipe_read_data(ADDR_WIDTH-1 downto 0);
   ARPROT <= (others => '0');

   -- read data channel
   axi_read_dat_pipe_write_data <= RDATA;
   axi_read_dat_pipe_write_req(0) <= RVALID;
   RREADY <= axi_read_dat_pipe_write_ack(0);
   -- RRESP is ignored.

   -- write address channel.
   AWADDR <= axi_write_addr_pipe_read_data(ADDR_WIDTH-1 downto 0);
   axi_write_addr_pipe_read_req(0) <= AWREADY;
   AWVALID <= axi_write_addr_pipe_read_ack(0);

   -- write data channel.
   WDATA <= axi_write_dat_and_byte_mask_pipe_read_data(31 downto 0);
   WSTRB <= axi_write_dat_and_byte_mask_pipe_read_data(35 downto 32);
   axi_write_dat_and_byte_mask_pipe_read_req(0) <= WREADY;
   WVALID <= axi_write_dat_and_byte_mask_pipe_read_ack(0);

    axi_write_response_pipe_write_data <= BRESP;
    axi_write_response_pipe_write_req(0) <= BVALID;
    BREADY <= axi_write_response_pipe_write_ack(0);
   
   aa_core: afb_axi_core
		port map (
    			clk  => clk,
    			reset  => reset,
    			AFB_BUS_REQUEST_pipe_write_data => AFB_BUS_REQUEST_pipe_write_data,
    			AFB_BUS_REQUEST_pipe_write_req  => AFB_BUS_REQUEST_pipe_write_req ,
    			AFB_BUS_REQUEST_pipe_write_ack  => AFB_BUS_REQUEST_pipe_write_ack ,
    			AFB_BUS_RESPONSE_pipe_read_data => AFB_BUS_RESPONSE_pipe_read_data,
    			AFB_BUS_RESPONSE_pipe_read_req  => AFB_BUS_RESPONSE_pipe_read_req ,
    			AFB_BUS_RESPONSE_pipe_read_ack  => AFB_BUS_RESPONSE_pipe_read_ack ,
    			axi_read_address_pipe_read_data => axi_read_addr_pipe_read_data,
    			axi_read_address_pipe_read_req  => axi_read_addr_pipe_read_req ,
    			axi_read_address_pipe_read_ack  => axi_read_addr_pipe_read_ack ,
    			axi_read_data_pipe_write_data => axi_read_dat_pipe_write_data,
    			axi_read_data_pipe_write_req  => axi_read_dat_pipe_write_req ,
    			axi_read_data_pipe_write_ack  => axi_read_dat_pipe_write_ack ,
    			axi_write_address_pipe_read_data => axi_write_addr_pipe_read_data,
    			axi_write_address_pipe_read_req  => axi_write_addr_pipe_read_req ,
    			axi_write_address_pipe_read_ack  => axi_write_addr_pipe_read_ack ,
    			axi_write_data_and_byte_mask_pipe_read_data => 
							axi_write_dat_and_byte_mask_pipe_read_data,
    			axi_write_data_and_byte_mask_pipe_read_req  => 
							axi_write_dat_and_byte_mask_pipe_read_req ,
    			axi_write_data_and_byte_mask_pipe_read_ack  => 
							axi_write_dat_and_byte_mask_pipe_read_ack,
			axi_write_status_pipe_write_data => axi_write_response_pipe_write_data,
               		axi_write_status_pipe_write_req => axi_write_response_pipe_write_req,
                	axi_write_status_pipe_write_ack => axi_write_response_pipe_write_ack			 
		);


end AaInspired;

