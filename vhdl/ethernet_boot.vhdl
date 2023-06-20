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
library work;
use work.ethernet_boot_global_package.all;
entity accessMemory2 is -- 
  generic (tag_length : integer); 
  port ( -- 
    lock : in  std_logic_vector(0 downto 0);
    rwbar : in  std_logic_vector(0 downto 0);
    bmask : in  std_logic_vector(7 downto 0);
    addr : in  std_logic_vector(35 downto 0);
    wdata : in  std_logic_vector(63 downto 0);
    rdata : out  std_logic_vector(63 downto 0);
    MEMORY_TO_PROG_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
    MEMORY_TO_PROG_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
    MEMORY_TO_PROG_RESPONSE_pipe_read_data : in   std_logic_vector(64 downto 0);
    PROG_TO_MEMORY_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
    PROG_TO_MEMORY_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
    PROG_TO_MEMORY_REQUEST_pipe_write_data : out  std_logic_vector(109 downto 0);
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
end entity accessMemory2;
architecture accessMemory2_arch of accessMemory2 is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 110)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 64)-1 downto 0);
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
  signal lock_buffer :  std_logic_vector(0 downto 0);
  signal lock_update_enable: Boolean;
  signal rwbar_buffer :  std_logic_vector(0 downto 0);
  signal rwbar_update_enable: Boolean;
  signal bmask_buffer :  std_logic_vector(7 downto 0);
  signal bmask_update_enable: Boolean;
  signal addr_buffer :  std_logic_vector(35 downto 0);
  signal addr_update_enable: Boolean;
  signal wdata_buffer :  std_logic_vector(63 downto 0);
  signal wdata_update_enable: Boolean;
  -- output port buffer signals
  signal rdata_buffer :  std_logic_vector(63 downto 0);
  signal rdata_update_enable: Boolean;
  signal accessMemory2_CP_30100_start: Boolean;
  signal accessMemory2_CP_30100_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_ack_1 : boolean;
  signal WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_req_1 : boolean;
  signal WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_ack_0 : boolean;
  signal WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_req_0 : boolean;
  signal do_while_stmt_15638_branch_ack_1 : boolean;
  signal do_while_stmt_15638_branch_ack_0 : boolean;
  signal RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_ack_1 : boolean;
  signal RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_req_1 : boolean;
  signal RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_ack_0 : boolean;
  signal RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_req_0 : boolean;
  signal do_while_stmt_15638_branch_req_0 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "accessMemory2_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 110) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(0 downto 0) <= lock;
  lock_buffer <= in_buffer_data_out(0 downto 0);
  in_buffer_data_in(1 downto 1) <= rwbar;
  rwbar_buffer <= in_buffer_data_out(1 downto 1);
  in_buffer_data_in(9 downto 2) <= bmask;
  bmask_buffer <= in_buffer_data_out(9 downto 2);
  in_buffer_data_in(45 downto 10) <= addr;
  addr_buffer <= in_buffer_data_out(45 downto 10);
  in_buffer_data_in(109 downto 46) <= wdata;
  wdata_buffer <= in_buffer_data_out(109 downto 46);
  in_buffer_data_in(tag_length + 109 downto 110) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 109 downto 110);
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
  accessMemory2_CP_30100_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "accessMemory2_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 64) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(63 downto 0) <= rdata_buffer;
  rdata <= out_buffer_data_out(63 downto 0);
  out_buffer_data_in(tag_length + 63 downto 64) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length + 63 downto 64);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= accessMemory2_CP_30100_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
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
    preds <= accessMemory2_CP_30100_start & tag_ilock_write_ack_symbol;
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
    preds <= accessMemory2_CP_30100_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  accessMemory2_CP_30100: Block -- control-path 
    signal accessMemory2_CP_30100_elements: BooleanArray(20 downto 0);
    -- 
  begin -- 
    accessMemory2_CP_30100_elements(0) <= accessMemory2_CP_30100_start;
    accessMemory2_CP_30100_symbol <= accessMemory2_CP_30100_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 branch_block_stmt_15637/branch_block_stmt_15637__entry__
      -- CP-element group 0: 	 branch_block_stmt_15637/$entry
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_15637/do_while_stmt_15638__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	20 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 branch_block_stmt_15637/branch_block_stmt_15637__exit__
      -- CP-element group 1: 	 branch_block_stmt_15637/$exit
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_15637/do_while_stmt_15638__exit__
      -- 
    accessMemory2_CP_30100_elements(1) <= accessMemory2_CP_30100_elements(20);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_15637/do_while_stmt_15638/$entry
      -- CP-element group 2: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638__entry__
      -- 
    accessMemory2_CP_30100_elements(2) <= accessMemory2_CP_30100_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	20 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638__exit__
      -- 
    -- Element group accessMemory2_CP_30100_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_15637/do_while_stmt_15638/loop_back
      -- 
    -- Element group accessMemory2_CP_30100_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	18 
    -- CP-element group 5: 	19 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_15637/do_while_stmt_15638/condition_done
      -- CP-element group 5: 	 branch_block_stmt_15637/do_while_stmt_15638/loop_taken/$entry
      -- CP-element group 5: 	 branch_block_stmt_15637/do_while_stmt_15638/loop_exit/$entry
      -- 
    accessMemory2_CP_30100_elements(5) <= accessMemory2_CP_30100_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	13 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_15637/do_while_stmt_15638/loop_body_done
      -- 
    accessMemory2_CP_30100_elements(6) <= accessMemory2_CP_30100_elements(13);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/back_edge_to_loop_body
      -- 
    accessMemory2_CP_30100_elements(7) <= accessMemory2_CP_30100_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/first_time_through_loop_body
      -- 
    accessMemory2_CP_30100_elements(8) <= accessMemory2_CP_30100_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	17 
    -- CP-element group 9: 	14 
    -- CP-element group 9: 	11 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/loop_body_start
      -- CP-element group 9: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/$entry
      -- 
    -- Element group accessMemory2_CP_30100_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	17 
    -- CP-element group 10: 	16 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/condition_evaluated
      -- 
    condition_evaluated_30124_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_30124_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => accessMemory2_CP_30100_elements(10), ack => do_while_stmt_15638_branch_req_0); -- 
    accessMemory2_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 15);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 33) := "accessMemory2_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= accessMemory2_CP_30100_elements(17) & accessMemory2_CP_30100_elements(16);
      gj_accessMemory2_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => accessMemory2_CP_30100_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	9 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	13 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	12 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_Sample/req
      -- CP-element group 11: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_Sample/$entry
      -- CP-element group 11: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_sample_start_
      -- 
    req_30133_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_30133_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => accessMemory2_CP_30100_elements(11), ack => WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_req_0); -- 
    accessMemory2_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 33) := "accessMemory2_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= accessMemory2_CP_30100_elements(9) & accessMemory2_CP_30100_elements(13);
      gj_accessMemory2_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => accessMemory2_CP_30100_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	11 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	13 
    -- CP-element group 12:  members (6) 
      -- CP-element group 12: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_Update/req
      -- CP-element group 12: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_Update/$entry
      -- CP-element group 12: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_Sample/ack
      -- CP-element group 12: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_Sample/$exit
      -- CP-element group 12: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_update_start_
      -- 
    ack_30134_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_ack_0, ack => accessMemory2_CP_30100_elements(12)); -- 
    req_30138_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_30138_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => accessMemory2_CP_30100_elements(12), ack => WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_req_1); -- 
    -- CP-element group 13:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	12 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	6 
    -- CP-element group 13: marked-successors 
    -- CP-element group 13: 	11 
    -- CP-element group 13:  members (4) 
      -- CP-element group 13: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_Update/ack
      -- CP-element group 13: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_update_completed_
      -- CP-element group 13: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/WPIPE_PROG_TO_MEMORY_REQUEST_15651_Update/$exit
      -- CP-element group 13: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/$exit
      -- 
    ack_30139_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_ack_1, ack => accessMemory2_CP_30100_elements(13)); -- 
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	9 
    -- CP-element group 14: marked-predecessors 
    -- CP-element group 14: 	16 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	15 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_Sample/rr
      -- CP-element group 14: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_sample_start_
      -- CP-element group 14: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_Sample/$entry
      -- 
    rr_30147_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_30147_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => accessMemory2_CP_30100_elements(14), ack => RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_req_0); -- 
    accessMemory2_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 15,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 33) := "accessMemory2_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= accessMemory2_CP_30100_elements(9) & accessMemory2_CP_30100_elements(16);
      gj_accessMemory2_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => accessMemory2_CP_30100_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	14 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	16 
    -- CP-element group 15:  members (6) 
      -- CP-element group 15: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_update_start_
      -- CP-element group 15: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_Update/cr
      -- CP-element group 15: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_Update/$entry
      -- CP-element group 15: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_Sample/ra
      -- CP-element group 15: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_Sample/$exit
      -- 
    ra_30148_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_ack_0, ack => accessMemory2_CP_30100_elements(15)); -- 
    cr_30152_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_30152_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => accessMemory2_CP_30100_elements(15), ack => RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_req_1); -- 
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	15 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	10 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	14 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_Update/ca
      -- CP-element group 16: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/RPIPE_MEMORY_TO_PROG_RESPONSE_15655_Update/$exit
      -- 
    ca_30153_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_ack_1, ack => accessMemory2_CP_30100_elements(16)); -- 
    -- CP-element group 17:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	9 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	10 
    -- CP-element group 17:  members (1) 
      -- CP-element group 17: 	 branch_block_stmt_15637/do_while_stmt_15638/do_while_stmt_15638_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group accessMemory2_CP_30100_elements(17) is a control-delay.
    cp_element_17_delay: control_delay_element  generic map(name => " 17_delay", delay_value => 1)  port map(req => accessMemory2_CP_30100_elements(9), ack => accessMemory2_CP_30100_elements(17), clk => clk, reset =>reset);
    -- CP-element group 18:  transition  input  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	5 
    -- CP-element group 18: successors 
    -- CP-element group 18:  members (2) 
      -- CP-element group 18: 	 branch_block_stmt_15637/do_while_stmt_15638/loop_exit/ack
      -- CP-element group 18: 	 branch_block_stmt_15637/do_while_stmt_15638/loop_exit/$exit
      -- 
    ack_30158_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 18_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_15638_branch_ack_0, ack => accessMemory2_CP_30100_elements(18)); -- 
    -- CP-element group 19:  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	5 
    -- CP-element group 19: successors 
    -- CP-element group 19:  members (2) 
      -- CP-element group 19: 	 branch_block_stmt_15637/do_while_stmt_15638/loop_taken/ack
      -- CP-element group 19: 	 branch_block_stmt_15637/do_while_stmt_15638/loop_taken/$exit
      -- 
    ack_30162_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_15638_branch_ack_1, ack => accessMemory2_CP_30100_elements(19)); -- 
    -- CP-element group 20:  transition  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	3 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	1 
    -- CP-element group 20:  members (1) 
      -- CP-element group 20: 	 branch_block_stmt_15637/do_while_stmt_15638/$exit
      -- 
    accessMemory2_CP_30100_elements(20) <= accessMemory2_CP_30100_elements(3);
    accessMemory2_do_while_stmt_15638_terminator_30163: loop_terminator -- 
      generic map (name => " accessMemory2_do_while_stmt_15638_terminator_30163", max_iterations_in_flight =>15) 
      port map(loop_body_exit => accessMemory2_CP_30100_elements(6),loop_continue => accessMemory2_CP_30100_elements(19),loop_terminate => accessMemory2_CP_30100_elements(18),loop_back => accessMemory2_CP_30100_elements(4),loop_exit => accessMemory2_CP_30100_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_30125_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= accessMemory2_CP_30100_elements(7);
        preds(1)  <= accessMemory2_CP_30100_elements(8);
        entry_tmerge_30125 : transition_merge -- 
          generic map(name => " entry_tmerge_30125")
          port map (preds => preds, symbol_out => accessMemory2_CP_30100_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u1_u2_15643_wire : std_logic_vector(1 downto 0);
    signal CONCAT_u2_u10_15645_wire : std_logic_vector(9 downto 0);
    signal CONCAT_u36_u100_15648_wire : std_logic_vector(99 downto 0);
    signal EQ_u1_u1_15674_wire : std_logic_vector(0 downto 0);
    signal err_15660 : std_logic_vector(0 downto 0);
    signal konst_15673_wire_constant : std_logic_vector(0 downto 0);
    signal request_15650 : std_logic_vector(109 downto 0);
    signal response_15656 : std_logic_vector(64 downto 0);
    -- 
  begin -- 
    konst_15673_wire_constant <= "1";
    -- flow-through slice operator slice_15659_inst
    err_15660 <= response_15656(64 downto 64);
    -- flow-through slice operator slice_15663_inst
    rdata_buffer <= response_15656(63 downto 0);
    do_while_stmt_15638_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= EQ_u1_u1_15674_wire;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_15638_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_15638_branch_req_0,
          ack0 => do_while_stmt_15638_branch_ack_0,
          ack1 => do_while_stmt_15638_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator CONCAT_u10_u110_15649_inst
    process(CONCAT_u2_u10_15645_wire, CONCAT_u36_u100_15648_wire) -- 
      variable tmp_var : std_logic_vector(109 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u2_u10_15645_wire, CONCAT_u36_u100_15648_wire, tmp_var);
      request_15650 <= tmp_var; --
    end process;
    -- binary operator CONCAT_u1_u2_15643_inst
    process(lock_buffer, rwbar_buffer) -- 
      variable tmp_var : std_logic_vector(1 downto 0); -- 
    begin -- 
      ApConcat_proc(lock_buffer, rwbar_buffer, tmp_var);
      CONCAT_u1_u2_15643_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u2_u10_15645_inst
    process(CONCAT_u1_u2_15643_wire, bmask_buffer) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u1_u2_15643_wire, bmask_buffer, tmp_var);
      CONCAT_u2_u10_15645_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u36_u100_15648_inst
    process(addr_buffer, wdata_buffer) -- 
      variable tmp_var : std_logic_vector(99 downto 0); -- 
    begin -- 
      ApConcat_proc(addr_buffer, wdata_buffer, tmp_var);
      CONCAT_u36_u100_15648_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_15674_inst
    process(err_15660) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(err_15660, konst_15673_wire_constant, tmp_var);
      EQ_u1_u1_15674_wire <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(64 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_req_0;
      RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_req_1;
      RPIPE_MEMORY_TO_PROG_RESPONSE_15655_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      response_15656 <= data_out(64 downto 0);
      MEMORY_TO_PROG_RESPONSE_read_0_gI: SplitGuardInterface generic map(name => "MEMORY_TO_PROG_RESPONSE_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
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
      MEMORY_TO_PROG_RESPONSE_read_0: InputPortRevised -- 
        generic map ( name => "MEMORY_TO_PROG_RESPONSE_read_0", data_width => 65,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => MEMORY_TO_PROG_RESPONSE_pipe_read_req(0),
          oack => MEMORY_TO_PROG_RESPONSE_pipe_read_ack(0),
          odata => MEMORY_TO_PROG_RESPONSE_pipe_read_data(64 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(109 downto 0);
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
      sample_req_unguarded(0) <= WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_req_0;
      WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_req_1;
      WPIPE_PROG_TO_MEMORY_REQUEST_15651_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= request_15650;
      PROG_TO_MEMORY_REQUEST_write_0_gI: SplitGuardInterface generic map(name => "PROG_TO_MEMORY_REQUEST_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      PROG_TO_MEMORY_REQUEST_write_0: OutputPortRevised -- 
        generic map ( name => "PROG_TO_MEMORY_REQUEST", data_width => 110, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => PROG_TO_MEMORY_REQUEST_pipe_write_req(0),
          oack => PROG_TO_MEMORY_REQUEST_pipe_write_ack(0),
          odata => PROG_TO_MEMORY_REQUEST_pipe_write_data(109 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end accessMemory2_arch;
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
library work;
use work.ethernet_boot_global_package.all;
entity ethernet_programmer is -- 
  generic (tag_length : integer); 
  port ( -- 
    mac_to_prog_pipe_read_req : out  std_logic_vector(0 downto 0);
    mac_to_prog_pipe_read_ack : in   std_logic_vector(0 downto 0);
    mac_to_prog_pipe_read_data : in   std_logic_vector(72 downto 0);
    prog_to_mac_pipe_write_req : out  std_logic_vector(0 downto 0);
    prog_to_mac_pipe_write_ack : in   std_logic_vector(0 downto 0);
    prog_to_mac_pipe_write_data : out  std_logic_vector(72 downto 0);
    accessMemory2_call_reqs : out  std_logic_vector(0 downto 0);
    accessMemory2_call_acks : in   std_logic_vector(0 downto 0);
    accessMemory2_call_data : out  std_logic_vector(109 downto 0);
    accessMemory2_call_tag  :  out  std_logic_vector(0 downto 0);
    accessMemory2_return_reqs : out  std_logic_vector(0 downto 0);
    accessMemory2_return_acks : in   std_logic_vector(0 downto 0);
    accessMemory2_return_data : in   std_logic_vector(63 downto 0);
    accessMemory2_return_tag :  in   std_logic_vector(0 downto 0);
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
end entity ethernet_programmer;
architecture ethernet_programmer_arch of ethernet_programmer is -- 
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
  signal ethernet_programmer_CP_30164_start: Boolean;
  signal ethernet_programmer_CP_30164_symbol: Boolean;
  -- volatile/operator module components. 
  component accessMemory2 is -- 
    generic (tag_length : integer); 
    port ( -- 
      lock : in  std_logic_vector(0 downto 0);
      rwbar : in  std_logic_vector(0 downto 0);
      bmask : in  std_logic_vector(7 downto 0);
      addr : in  std_logic_vector(35 downto 0);
      wdata : in  std_logic_vector(63 downto 0);
      rdata : out  std_logic_vector(63 downto 0);
      MEMORY_TO_PROG_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
      MEMORY_TO_PROG_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
      MEMORY_TO_PROG_RESPONSE_pipe_read_data : in   std_logic_vector(64 downto 0);
      PROG_TO_MEMORY_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
      PROG_TO_MEMORY_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
      PROG_TO_MEMORY_REQUEST_pipe_write_data : out  std_logic_vector(109 downto 0);
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
  signal do_while_stmt_15679_branch_req_0 : boolean;
  signal RPIPE_mac_to_prog_15683_inst_req_0 : boolean;
  signal RPIPE_mac_to_prog_15683_inst_ack_0 : boolean;
  signal RPIPE_mac_to_prog_15683_inst_req_1 : boolean;
  signal RPIPE_mac_to_prog_15683_inst_ack_1 : boolean;
  signal slice_15687_inst_req_0 : boolean;
  signal slice_15687_inst_ack_0 : boolean;
  signal slice_15687_inst_req_1 : boolean;
  signal slice_15687_inst_ack_1 : boolean;
  signal slice_15691_inst_req_0 : boolean;
  signal slice_15691_inst_ack_0 : boolean;
  signal slice_15691_inst_req_1 : boolean;
  signal slice_15691_inst_ack_1 : boolean;
  signal slice_15695_inst_req_0 : boolean;
  signal slice_15695_inst_ack_0 : boolean;
  signal slice_15695_inst_req_1 : boolean;
  signal slice_15695_inst_ack_1 : boolean;
  signal slice_15699_inst_req_0 : boolean;
  signal slice_15699_inst_ack_0 : boolean;
  signal slice_15699_inst_req_1 : boolean;
  signal slice_15699_inst_ack_1 : boolean;
  signal call_stmt_15737_call_req_0 : boolean;
  signal call_stmt_15737_call_ack_0 : boolean;
  signal call_stmt_15737_call_req_1 : boolean;
  signal call_stmt_15737_call_ack_1 : boolean;
  signal W_tlast_14932_delayed_1_0_15738_inst_req_0 : boolean;
  signal W_tlast_14932_delayed_1_0_15738_inst_ack_0 : boolean;
  signal W_tlast_14932_delayed_1_0_15738_inst_req_1 : boolean;
  signal W_tlast_14932_delayed_1_0_15738_inst_ack_1 : boolean;
  signal CONCAT_u1_u73_15751_inst_req_0 : boolean;
  signal CONCAT_u1_u73_15751_inst_ack_0 : boolean;
  signal CONCAT_u1_u73_15751_inst_req_1 : boolean;
  signal CONCAT_u1_u73_15751_inst_ack_1 : boolean;
  signal WPIPE_prog_to_mac_15742_inst_req_0 : boolean;
  signal WPIPE_prog_to_mac_15742_inst_ack_0 : boolean;
  signal WPIPE_prog_to_mac_15742_inst_req_1 : boolean;
  signal WPIPE_prog_to_mac_15742_inst_ack_1 : boolean;
  signal do_while_stmt_15679_branch_ack_0 : boolean;
  signal do_while_stmt_15679_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "ethernet_programmer_input_buffer", -- 
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
  ethernet_programmer_CP_30164_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "ethernet_programmer_out_buffer", -- 
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
    preds <= ethernet_programmer_CP_30164_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
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
    preds <= ethernet_programmer_CP_30164_start & tag_ilock_write_ack_symbol;
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
    preds <= ethernet_programmer_CP_30164_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  ethernet_programmer_CP_30164: Block -- control-path 
    signal ethernet_programmer_CP_30164_elements: BooleanArray(52 downto 0);
    -- 
  begin -- 
    ethernet_programmer_CP_30164_elements(0) <= ethernet_programmer_CP_30164_start;
    ethernet_programmer_CP_30164_symbol <= ethernet_programmer_CP_30164_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 branch_block_stmt_15678/do_while_stmt_15679__entry__
      -- CP-element group 0: 	 branch_block_stmt_15678/branch_block_stmt_15678__entry__
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_15678/$entry
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	52 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 branch_block_stmt_15678/do_while_stmt_15679__exit__
      -- CP-element group 1: 	 branch_block_stmt_15678/branch_block_stmt_15678__exit__
      -- CP-element group 1: 	 branch_block_stmt_15678/$exit
      -- CP-element group 1: 	 $exit
      -- 
    ethernet_programmer_CP_30164_elements(1) <= ethernet_programmer_CP_30164_elements(52);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679__entry__
      -- CP-element group 2: 	 branch_block_stmt_15678/do_while_stmt_15679/$entry
      -- 
    ethernet_programmer_CP_30164_elements(2) <= ethernet_programmer_CP_30164_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	52 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679__exit__
      -- 
    -- Element group ethernet_programmer_CP_30164_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_15678/do_while_stmt_15679/loop_back
      -- 
    -- Element group ethernet_programmer_CP_30164_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	50 
    -- CP-element group 5: 	51 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_15678/do_while_stmt_15679/condition_done
      -- CP-element group 5: 	 branch_block_stmt_15678/do_while_stmt_15679/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_15678/do_while_stmt_15679/loop_taken/$entry
      -- 
    ethernet_programmer_CP_30164_elements(5) <= ethernet_programmer_CP_30164_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	49 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_15678/do_while_stmt_15679/loop_body_done
      -- 
    ethernet_programmer_CP_30164_elements(6) <= ethernet_programmer_CP_30164_elements(49);
    -- CP-element group 7:  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/back_edge_to_loop_body
      -- 
    ethernet_programmer_CP_30164_elements(7) <= ethernet_programmer_CP_30164_elements(4);
    -- CP-element group 8:  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/first_time_through_loop_body
      -- 
    ethernet_programmer_CP_30164_elements(8) <= ethernet_programmer_CP_30164_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	48 
    -- CP-element group 9: 	11 
    -- CP-element group 9: 	12 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/loop_body_start
      -- CP-element group 9: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/phi_stmt_15681_sample_start_
      -- 
    -- Element group ethernet_programmer_CP_30164_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	48 
    -- CP-element group 10: 	16 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/condition_evaluated
      -- 
    condition_evaluated_30188_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_30188_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(10), ack => do_while_stmt_15679_branch_req_0); -- 
    ethernet_programmer_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 31,1 => 31);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(48) & ethernet_programmer_CP_30164_elements(16);
      gj_ethernet_programmer_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	9 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	16 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (1) 
      -- CP-element group 11: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/aggregated_phi_sample_req
      -- 
    ethernet_programmer_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 31,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(9) & ethernet_programmer_CP_30164_elements(16);
      gj_ethernet_programmer_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	9 
    -- CP-element group 12: marked-predecessors 
    -- CP-element group 12: 	19 
    -- CP-element group 12: 	23 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	14 
    -- CP-element group 12:  members (2) 
      -- CP-element group 12: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/phi_stmt_15681_update_start_
      -- CP-element group 12: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/aggregated_phi_update_req
      -- 
    ethernet_programmer_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 31,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(9) & ethernet_programmer_CP_30164_elements(19) & ethernet_programmer_CP_30164_elements(23);
      gj_ethernet_programmer_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: marked-predecessors 
    -- CP-element group 13: 	16 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	15 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_Sample/rr
      -- CP-element group 13: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_Sample/$entry
      -- CP-element group 13: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_sample_start_
      -- 
    rr_30205_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_30205_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(13), ack => RPIPE_mac_to_prog_15683_inst_req_0); -- 
    ethernet_programmer_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(11) & ethernet_programmer_CP_30164_elements(16);
      gj_ethernet_programmer_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	15 
    -- CP-element group 14: 	12 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	16 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_Update/$entry
      -- CP-element group 14: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_Update/cr
      -- CP-element group 14: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_update_start_
      -- 
    cr_30210_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_30210_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(14), ack => RPIPE_mac_to_prog_15683_inst_req_1); -- 
    ethernet_programmer_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(15) & ethernet_programmer_CP_30164_elements(12);
      gj_ethernet_programmer_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	13 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	49 
    -- CP-element group 15: 	14 
    -- CP-element group 15:  members (5) 
      -- CP-element group 15: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_Sample/ra
      -- CP-element group 15: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_Sample/$exit
      -- CP-element group 15: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/phi_stmt_15681_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/aggregated_phi_sample_ack
      -- 
    ra_30206_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_to_prog_15683_inst_ack_0, ack => ethernet_programmer_CP_30164_elements(15)); -- 
    -- CP-element group 16:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	14 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	10 
    -- CP-element group 16: 	21 
    -- CP-element group 16: 	17 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	11 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (5) 
      -- CP-element group 16: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/aggregated_phi_update_ack
      -- CP-element group 16: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/phi_stmt_15681_update_completed_
      -- CP-element group 16: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_Update/$exit
      -- CP-element group 16: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_Update/ca
      -- CP-element group 16: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/RPIPE_mac_to_prog_15683_update_completed_
      -- 
    ca_30211_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mac_to_prog_15683_inst_ack_1, ack => ethernet_programmer_CP_30164_elements(16)); -- 
    -- CP-element group 17:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	16 
    -- CP-element group 17: marked-predecessors 
    -- CP-element group 17: 	19 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_Sample/$entry
      -- CP-element group 17: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_Sample/rr
      -- CP-element group 17: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_sample_start_
      -- 
    rr_30219_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_30219_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(17), ack => slice_15687_inst_req_0); -- 
    ethernet_programmer_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(16) & ethernet_programmer_CP_30164_elements(19);
      gj_ethernet_programmer_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: marked-predecessors 
    -- CP-element group 18: 	39 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	20 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_Update/$entry
      -- CP-element group 18: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_update_start_
      -- CP-element group 18: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_Update/cr
      -- 
    cr_30224_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_30224_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(18), ack => slice_15687_inst_req_1); -- 
    ethernet_programmer_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= ethernet_programmer_CP_30164_elements(39);
      gj_ethernet_programmer_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: marked-successors 
    -- CP-element group 19: 	12 
    -- CP-element group 19: 	17 
    -- CP-element group 19:  members (3) 
      -- CP-element group 19: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_Sample/$exit
      -- CP-element group 19: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_Sample/ra
      -- CP-element group 19: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_sample_completed_
      -- 
    ra_30220_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_15687_inst_ack_0, ack => ethernet_programmer_CP_30164_elements(19)); -- 
    -- CP-element group 20:  transition  input  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	18 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	37 
    -- CP-element group 20:  members (3) 
      -- CP-element group 20: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_Update/$exit
      -- CP-element group 20: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15687_Update/ca
      -- 
    ca_30225_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 20_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_15687_inst_ack_1, ack => ethernet_programmer_CP_30164_elements(20)); -- 
    -- CP-element group 21:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	16 
    -- CP-element group 21: marked-predecessors 
    -- CP-element group 21: 	23 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	23 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_sample_start_
      -- CP-element group 21: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_Sample/$entry
      -- CP-element group 21: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_Sample/rr
      -- 
    rr_30233_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_30233_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(21), ack => slice_15691_inst_req_0); -- 
    ethernet_programmer_cp_element_group_21: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_21"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(16) & ethernet_programmer_CP_30164_elements(23);
      gj_ethernet_programmer_cp_element_group_21 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(21), clk => clk, reset => reset); --
    end block;
    -- CP-element group 22:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: marked-predecessors 
    -- CP-element group 22: 	31 
    -- CP-element group 22: 	27 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	24 
    -- CP-element group 22:  members (3) 
      -- CP-element group 22: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_update_start_
      -- CP-element group 22: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_Update/$entry
      -- CP-element group 22: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_Update/cr
      -- 
    cr_30238_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_30238_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(22), ack => slice_15691_inst_req_1); -- 
    ethernet_programmer_cp_element_group_22: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_22"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(31) & ethernet_programmer_CP_30164_elements(27);
      gj_ethernet_programmer_cp_element_group_22 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(22), clk => clk, reset => reset); --
    end block;
    -- CP-element group 23:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	21 
    -- CP-element group 23: successors 
    -- CP-element group 23: marked-successors 
    -- CP-element group 23: 	21 
    -- CP-element group 23: 	12 
    -- CP-element group 23:  members (3) 
      -- CP-element group 23: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_sample_completed_
      -- CP-element group 23: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_Sample/$exit
      -- CP-element group 23: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_Sample/ra
      -- 
    ra_30234_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 23_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_15691_inst_ack_0, ack => ethernet_programmer_CP_30164_elements(23)); -- 
    -- CP-element group 24:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	22 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	29 
    -- CP-element group 24: 	25 
    -- CP-element group 24:  members (3) 
      -- CP-element group 24: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_update_completed_
      -- CP-element group 24: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_Update/$exit
      -- CP-element group 24: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15691_Update/ca
      -- 
    ca_30239_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 24_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_15691_inst_ack_1, ack => ethernet_programmer_CP_30164_elements(24)); -- 
    -- CP-element group 25:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	24 
    -- CP-element group 25: marked-predecessors 
    -- CP-element group 25: 	27 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	27 
    -- CP-element group 25:  members (3) 
      -- CP-element group 25: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_sample_start_
      -- CP-element group 25: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_Sample/$entry
      -- CP-element group 25: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_Sample/rr
      -- 
    rr_30247_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_30247_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(25), ack => slice_15695_inst_req_0); -- 
    ethernet_programmer_cp_element_group_25: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_25"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(24) & ethernet_programmer_CP_30164_elements(27);
      gj_ethernet_programmer_cp_element_group_25 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(25), clk => clk, reset => reset); --
    end block;
    -- CP-element group 26:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: marked-predecessors 
    -- CP-element group 26: 	35 
    -- CP-element group 26: 	43 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	28 
    -- CP-element group 26:  members (3) 
      -- CP-element group 26: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_update_start_
      -- CP-element group 26: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_Update/$entry
      -- CP-element group 26: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_Update/cr
      -- 
    cr_30252_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_30252_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(26), ack => slice_15695_inst_req_1); -- 
    ethernet_programmer_cp_element_group_26: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_26"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(35) & ethernet_programmer_CP_30164_elements(43);
      gj_ethernet_programmer_cp_element_group_26 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(26), clk => clk, reset => reset); --
    end block;
    -- CP-element group 27:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	25 
    -- CP-element group 27: successors 
    -- CP-element group 27: marked-successors 
    -- CP-element group 27: 	22 
    -- CP-element group 27: 	25 
    -- CP-element group 27:  members (3) 
      -- CP-element group 27: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_sample_completed_
      -- CP-element group 27: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_Sample/$exit
      -- CP-element group 27: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_Sample/ra
      -- 
    ra_30248_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 27_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_15695_inst_ack_0, ack => ethernet_programmer_CP_30164_elements(27)); -- 
    -- CP-element group 28:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	26 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	33 
    -- CP-element group 28: 	41 
    -- CP-element group 28:  members (3) 
      -- CP-element group 28: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_update_completed_
      -- CP-element group 28: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_Update/$exit
      -- CP-element group 28: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15695_Update/ca
      -- 
    ca_30253_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 28_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_15695_inst_ack_1, ack => ethernet_programmer_CP_30164_elements(28)); -- 
    -- CP-element group 29:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	24 
    -- CP-element group 29: marked-predecessors 
    -- CP-element group 29: 	31 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (3) 
      -- CP-element group 29: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_sample_start_
      -- CP-element group 29: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_Sample/$entry
      -- CP-element group 29: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_Sample/rr
      -- 
    rr_30261_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_30261_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(29), ack => slice_15699_inst_req_0); -- 
    ethernet_programmer_cp_element_group_29: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_29"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(24) & ethernet_programmer_CP_30164_elements(31);
      gj_ethernet_programmer_cp_element_group_29 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(29), clk => clk, reset => reset); --
    end block;
    -- CP-element group 30:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: marked-predecessors 
    -- CP-element group 30: 	35 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	32 
    -- CP-element group 30:  members (3) 
      -- CP-element group 30: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_update_start_
      -- CP-element group 30: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_Update/$entry
      -- CP-element group 30: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_Update/cr
      -- 
    cr_30266_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_30266_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(30), ack => slice_15699_inst_req_1); -- 
    ethernet_programmer_cp_element_group_30: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_30"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= ethernet_programmer_CP_30164_elements(35);
      gj_ethernet_programmer_cp_element_group_30 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(30), clk => clk, reset => reset); --
    end block;
    -- CP-element group 31:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31: marked-successors 
    -- CP-element group 31: 	22 
    -- CP-element group 31: 	29 
    -- CP-element group 31:  members (3) 
      -- CP-element group 31: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_sample_completed_
      -- CP-element group 31: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_Sample/$exit
      -- CP-element group 31: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_Sample/ra
      -- 
    ra_30262_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 31_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_15699_inst_ack_0, ack => ethernet_programmer_CP_30164_elements(31)); -- 
    -- CP-element group 32:  transition  input  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	30 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	33 
    -- CP-element group 32:  members (3) 
      -- CP-element group 32: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_update_completed_
      -- CP-element group 32: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_Update/$exit
      -- CP-element group 32: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/slice_15699_Update/ca
      -- 
    ca_30267_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 32_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_15699_inst_ack_1, ack => ethernet_programmer_CP_30164_elements(32)); -- 
    -- CP-element group 33:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	32 
    -- CP-element group 33: 	28 
    -- CP-element group 33: marked-predecessors 
    -- CP-element group 33: 	35 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	35 
    -- CP-element group 33:  members (3) 
      -- CP-element group 33: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_sample_start_
      -- CP-element group 33: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_Sample/$entry
      -- CP-element group 33: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_Sample/crr
      -- 
    crr_30275_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_30275_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(33), ack => call_stmt_15737_call_req_0); -- 
    ethernet_programmer_cp_element_group_33: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_33"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(32) & ethernet_programmer_CP_30164_elements(28) & ethernet_programmer_CP_30164_elements(35);
      gj_ethernet_programmer_cp_element_group_33 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(33), clk => clk, reset => reset); --
    end block;
    -- CP-element group 34:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: marked-predecessors 
    -- CP-element group 34: 	36 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	36 
    -- CP-element group 34:  members (3) 
      -- CP-element group 34: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_update_start_
      -- CP-element group 34: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_Update/$entry
      -- CP-element group 34: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_Update/ccr
      -- 
    ccr_30280_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_30280_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(34), ack => call_stmt_15737_call_req_1); -- 
    ethernet_programmer_cp_element_group_34: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_34"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= ethernet_programmer_CP_30164_elements(36);
      gj_ethernet_programmer_cp_element_group_34 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(34), clk => clk, reset => reset); --
    end block;
    -- CP-element group 35:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	33 
    -- CP-element group 35: successors 
    -- CP-element group 35: marked-successors 
    -- CP-element group 35: 	33 
    -- CP-element group 35: 	30 
    -- CP-element group 35: 	26 
    -- CP-element group 35:  members (3) 
      -- CP-element group 35: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_sample_completed_
      -- CP-element group 35: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_Sample/$exit
      -- CP-element group 35: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_Sample/cra
      -- 
    cra_30276_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 35_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_15737_call_ack_0, ack => ethernet_programmer_CP_30164_elements(35)); -- 
    -- CP-element group 36:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	34 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	49 
    -- CP-element group 36: marked-successors 
    -- CP-element group 36: 	34 
    -- CP-element group 36:  members (3) 
      -- CP-element group 36: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_update_completed_
      -- CP-element group 36: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_Update/$exit
      -- CP-element group 36: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/call_stmt_15737_Update/cca
      -- 
    cca_30281_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 36_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_15737_call_ack_1, ack => ethernet_programmer_CP_30164_elements(36)); -- 
    -- CP-element group 37:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	20 
    -- CP-element group 37: marked-predecessors 
    -- CP-element group 37: 	39 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	39 
    -- CP-element group 37:  members (3) 
      -- CP-element group 37: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_sample_start_
      -- CP-element group 37: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_Sample/$entry
      -- CP-element group 37: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_Sample/req
      -- 
    req_30289_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_30289_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(37), ack => W_tlast_14932_delayed_1_0_15738_inst_req_0); -- 
    ethernet_programmer_cp_element_group_37: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_37"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(20) & ethernet_programmer_CP_30164_elements(39);
      gj_ethernet_programmer_cp_element_group_37 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(37), clk => clk, reset => reset); --
    end block;
    -- CP-element group 38:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: marked-predecessors 
    -- CP-element group 38: 	46 
    -- CP-element group 38: 	43 
    -- CP-element group 38: successors 
    -- CP-element group 38: 	40 
    -- CP-element group 38:  members (3) 
      -- CP-element group 38: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_update_start_
      -- CP-element group 38: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_Update/$entry
      -- CP-element group 38: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_Update/req
      -- 
    req_30294_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_30294_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(38), ack => W_tlast_14932_delayed_1_0_15738_inst_req_1); -- 
    ethernet_programmer_cp_element_group_38: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_38"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(46) & ethernet_programmer_CP_30164_elements(43);
      gj_ethernet_programmer_cp_element_group_38 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(38), clk => clk, reset => reset); --
    end block;
    -- CP-element group 39:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	37 
    -- CP-element group 39: successors 
    -- CP-element group 39: marked-successors 
    -- CP-element group 39: 	18 
    -- CP-element group 39: 	37 
    -- CP-element group 39:  members (3) 
      -- CP-element group 39: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_sample_completed_
      -- CP-element group 39: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_Sample/$exit
      -- CP-element group 39: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_Sample/ack
      -- 
    ack_30290_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 39_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_tlast_14932_delayed_1_0_15738_inst_ack_0, ack => ethernet_programmer_CP_30164_elements(39)); -- 
    -- CP-element group 40:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: 	38 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	45 
    -- CP-element group 40: 	41 
    -- CP-element group 40:  members (3) 
      -- CP-element group 40: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_update_completed_
      -- CP-element group 40: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_Update/$exit
      -- CP-element group 40: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/assign_stmt_15740_Update/ack
      -- 
    ack_30295_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 40_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_tlast_14932_delayed_1_0_15738_inst_ack_1, ack => ethernet_programmer_CP_30164_elements(40)); -- 
    -- CP-element group 41:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: 	28 
    -- CP-element group 41: 	40 
    -- CP-element group 41: marked-predecessors 
    -- CP-element group 41: 	43 
    -- CP-element group 41: successors 
    -- CP-element group 41: 	43 
    -- CP-element group 41:  members (3) 
      -- CP-element group 41: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_sample_start_
      -- CP-element group 41: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_Sample/$entry
      -- CP-element group 41: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_Sample/rr
      -- 
    rr_30303_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_30303_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(41), ack => CONCAT_u1_u73_15751_inst_req_0); -- 
    ethernet_programmer_cp_element_group_41: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_41"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(28) & ethernet_programmer_CP_30164_elements(40) & ethernet_programmer_CP_30164_elements(43);
      gj_ethernet_programmer_cp_element_group_41 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(41), clk => clk, reset => reset); --
    end block;
    -- CP-element group 42:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: marked-predecessors 
    -- CP-element group 42: 	46 
    -- CP-element group 42: successors 
    -- CP-element group 42: 	44 
    -- CP-element group 42:  members (3) 
      -- CP-element group 42: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_update_start_
      -- CP-element group 42: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_Update/$entry
      -- CP-element group 42: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_Update/cr
      -- 
    cr_30308_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_30308_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(42), ack => CONCAT_u1_u73_15751_inst_req_1); -- 
    ethernet_programmer_cp_element_group_42: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_42"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= ethernet_programmer_CP_30164_elements(46);
      gj_ethernet_programmer_cp_element_group_42 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(42), clk => clk, reset => reset); --
    end block;
    -- CP-element group 43:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: 	41 
    -- CP-element group 43: successors 
    -- CP-element group 43: marked-successors 
    -- CP-element group 43: 	26 
    -- CP-element group 43: 	38 
    -- CP-element group 43: 	41 
    -- CP-element group 43:  members (3) 
      -- CP-element group 43: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_sample_completed_
      -- CP-element group 43: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_Sample/$exit
      -- CP-element group 43: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_Sample/ra
      -- 
    ra_30304_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 43_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u1_u73_15751_inst_ack_0, ack => ethernet_programmer_CP_30164_elements(43)); -- 
    -- CP-element group 44:  transition  input  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: 	42 
    -- CP-element group 44: successors 
    -- CP-element group 44: 	45 
    -- CP-element group 44:  members (3) 
      -- CP-element group 44: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_update_completed_
      -- CP-element group 44: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_Update/$exit
      -- CP-element group 44: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/CONCAT_u1_u73_15751_Update/ca
      -- 
    ca_30309_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 44_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u1_u73_15751_inst_ack_1, ack => ethernet_programmer_CP_30164_elements(44)); -- 
    -- CP-element group 45:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: 	44 
    -- CP-element group 45: 	40 
    -- CP-element group 45: marked-predecessors 
    -- CP-element group 45: 	47 
    -- CP-element group 45: successors 
    -- CP-element group 45: 	46 
    -- CP-element group 45:  members (3) 
      -- CP-element group 45: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_sample_start_
      -- CP-element group 45: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_Sample/$entry
      -- CP-element group 45: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_Sample/req
      -- 
    req_30317_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_30317_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(45), ack => WPIPE_prog_to_mac_15742_inst_req_0); -- 
    ethernet_programmer_cp_element_group_45: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_45"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(44) & ethernet_programmer_CP_30164_elements(40) & ethernet_programmer_CP_30164_elements(47);
      gj_ethernet_programmer_cp_element_group_45 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(45), clk => clk, reset => reset); --
    end block;
    -- CP-element group 46:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: 	45 
    -- CP-element group 46: successors 
    -- CP-element group 46: 	47 
    -- CP-element group 46: marked-successors 
    -- CP-element group 46: 	38 
    -- CP-element group 46: 	42 
    -- CP-element group 46:  members (6) 
      -- CP-element group 46: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_sample_completed_
      -- CP-element group 46: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_update_start_
      -- CP-element group 46: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_Sample/$exit
      -- CP-element group 46: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_Sample/ack
      -- CP-element group 46: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_Update/$entry
      -- CP-element group 46: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_Update/req
      -- 
    ack_30318_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 46_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_prog_to_mac_15742_inst_ack_0, ack => ethernet_programmer_CP_30164_elements(46)); -- 
    req_30322_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_30322_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ethernet_programmer_CP_30164_elements(46), ack => WPIPE_prog_to_mac_15742_inst_req_1); -- 
    -- CP-element group 47:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: 	46 
    -- CP-element group 47: successors 
    -- CP-element group 47: 	49 
    -- CP-element group 47: marked-successors 
    -- CP-element group 47: 	45 
    -- CP-element group 47:  members (3) 
      -- CP-element group 47: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_update_completed_
      -- CP-element group 47: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_Update/$exit
      -- CP-element group 47: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/WPIPE_prog_to_mac_15742_Update/ack
      -- 
    ack_30323_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 47_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_prog_to_mac_15742_inst_ack_1, ack => ethernet_programmer_CP_30164_elements(47)); -- 
    -- CP-element group 48:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: 	9 
    -- CP-element group 48: successors 
    -- CP-element group 48: 	10 
    -- CP-element group 48:  members (1) 
      -- CP-element group 48: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group ethernet_programmer_CP_30164_elements(48) is a control-delay.
    cp_element_48_delay: control_delay_element  generic map(name => " 48_delay", delay_value => 1)  port map(req => ethernet_programmer_CP_30164_elements(9), ack => ethernet_programmer_CP_30164_elements(48), clk => clk, reset =>reset);
    -- CP-element group 49:  join  transition  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: 	47 
    -- CP-element group 49: 	15 
    -- CP-element group 49: 	36 
    -- CP-element group 49: successors 
    -- CP-element group 49: 	6 
    -- CP-element group 49:  members (1) 
      -- CP-element group 49: 	 branch_block_stmt_15678/do_while_stmt_15679/do_while_stmt_15679_loop_body/$exit
      -- 
    ethernet_programmer_cp_element_group_49: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 31,1 => 31,2 => 31);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 39) := "ethernet_programmer_cp_element_group_49"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= ethernet_programmer_CP_30164_elements(47) & ethernet_programmer_CP_30164_elements(15) & ethernet_programmer_CP_30164_elements(36);
      gj_ethernet_programmer_cp_element_group_49 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(49), clk => clk, reset => reset); --
    end block;
    -- CP-element group 50:  transition  input  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: 	5 
    -- CP-element group 50: successors 
    -- CP-element group 50:  members (2) 
      -- CP-element group 50: 	 branch_block_stmt_15678/do_while_stmt_15679/loop_exit/$exit
      -- CP-element group 50: 	 branch_block_stmt_15678/do_while_stmt_15679/loop_exit/ack
      -- 
    ack_30328_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 50_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_15679_branch_ack_0, ack => ethernet_programmer_CP_30164_elements(50)); -- 
    -- CP-element group 51:  transition  input  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: 	5 
    -- CP-element group 51: successors 
    -- CP-element group 51:  members (2) 
      -- CP-element group 51: 	 branch_block_stmt_15678/do_while_stmt_15679/loop_taken/$exit
      -- CP-element group 51: 	 branch_block_stmt_15678/do_while_stmt_15679/loop_taken/ack
      -- 
    ack_30332_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 51_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_15679_branch_ack_1, ack => ethernet_programmer_CP_30164_elements(51)); -- 
    -- CP-element group 52:  transition  bypass  pipeline-parent 
    -- CP-element group 52: predecessors 
    -- CP-element group 52: 	3 
    -- CP-element group 52: successors 
    -- CP-element group 52: 	1 
    -- CP-element group 52:  members (1) 
      -- CP-element group 52: 	 branch_block_stmt_15678/do_while_stmt_15679/$exit
      -- 
    ethernet_programmer_CP_30164_elements(52) <= ethernet_programmer_CP_30164_elements(3);
    ethernet_programmer_do_while_stmt_15679_terminator_30333: loop_terminator -- 
      generic map (name => " ethernet_programmer_do_while_stmt_15679_terminator_30333", max_iterations_in_flight =>31) 
      port map(loop_body_exit => ethernet_programmer_CP_30164_elements(6),loop_continue => ethernet_programmer_CP_30164_elements(51),loop_terminate => ethernet_programmer_CP_30164_elements(50),loop_back => ethernet_programmer_CP_30164_elements(4),loop_exit => ethernet_programmer_CP_30164_elements(3),clk => clk, reset => reset); -- 
    entry_tmerge_30189_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= ethernet_programmer_CP_30164_elements(7);
        preds(1)  <= ethernet_programmer_CP_30164_elements(8);
        entry_tmerge_30189 : transition_merge -- 
          generic map(name => " entry_tmerge_30189")
          port map (preds => preds, symbol_out => ethernet_programmer_CP_30164_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u1_u73_15751_wire : std_logic_vector(72 downto 0);
    signal CONCAT_u64_u72_15749_wire : std_logic_vector(71 downto 0);
    signal RPIPE_mac_to_prog_15683_wire : std_logic_vector(72 downto 0);
    signal SHL_u64_u64_15722_wire : std_logic_vector(63 downto 0);
    signal SHL_u64_u64_15726_wire : std_logic_vector(63 downto 0);
    signal addr_15696 : std_logic_vector(31 downto 0);
    signal address_15717 : std_logic_vector(35 downto 0);
    signal bytemask_15711 : std_logic_vector(7 downto 0);
    signal data_15700 : std_logic_vector(31 downto 0);
    signal ignore_return_15737 : std_logic_vector(63 downto 0);
    signal konst_15721_wire_constant : std_logic_vector(63 downto 0);
    signal konst_15725_wire_constant : std_logic_vector(63 downto 0);
    signal konst_15754_wire_constant : std_logic_vector(0 downto 0);
    signal pos_15704 : std_logic_vector(2 downto 0);
    signal read_val_15681 : std_logic_vector(72 downto 0);
    signal tdata_15692 : std_logic_vector(63 downto 0);
    signal tlast_14932_delayed_1_0_15740 : std_logic_vector(0 downto 0);
    signal tlast_15688 : std_logic_vector(0 downto 0);
    signal type_cast_15707_wire_constant : std_logic_vector(7 downto 0);
    signal type_cast_15709_wire : std_logic_vector(7 downto 0);
    signal type_cast_15714_wire_constant : std_logic_vector(3 downto 0);
    signal type_cast_15720_wire : std_logic_vector(63 downto 0);
    signal type_cast_15724_wire : std_logic_vector(63 downto 0);
    signal type_cast_15730_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_15732_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_15744_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_15746_wire : std_logic_vector(63 downto 0);
    signal type_cast_15748_wire_constant : std_logic_vector(7 downto 0);
    signal wdata_15728 : std_logic_vector(63 downto 0);
    -- 
  begin -- 
    konst_15721_wire_constant <= "0000000000000000000000000000000000000000000000000000000000111000";
    konst_15725_wire_constant <= "0000000000000000000000000000000000000000000000000000000000000011";
    konst_15754_wire_constant <= "1";
    type_cast_15707_wire_constant <= "10000000";
    type_cast_15714_wire_constant <= "0000";
    type_cast_15730_wire_constant <= "0";
    type_cast_15732_wire_constant <= "0";
    type_cast_15744_wire_constant <= "1";
    type_cast_15748_wire_constant <= "11111111";
    slice_15687_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_15687_inst_req_0;
      slice_15687_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_15687_inst_req_1;
      slice_15687_inst_ack_1<= update_ack(0);
      slice_15687_inst: SliceSplitProtocol generic map(name => "slice_15687_inst", in_data_width => 73, high_index => 72, low_index => 72, buffering => 1, flow_through => false,  full_rate => true) -- 
        port map( din => read_val_15681, dout => tlast_15688, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    slice_15691_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_15691_inst_req_0;
      slice_15691_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_15691_inst_req_1;
      slice_15691_inst_ack_1<= update_ack(0);
      slice_15691_inst: SliceSplitProtocol generic map(name => "slice_15691_inst", in_data_width => 73, high_index => 71, low_index => 8, buffering => 1, flow_through => false,  full_rate => true) -- 
        port map( din => read_val_15681, dout => tdata_15692, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    slice_15695_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_15695_inst_req_0;
      slice_15695_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_15695_inst_req_1;
      slice_15695_inst_ack_1<= update_ack(0);
      slice_15695_inst: SliceSplitProtocol generic map(name => "slice_15695_inst", in_data_width => 64, high_index => 63, low_index => 32, buffering => 1, flow_through => false,  full_rate => true) -- 
        port map( din => tdata_15692, dout => addr_15696, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    slice_15699_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_15699_inst_req_0;
      slice_15699_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_15699_inst_req_1;
      slice_15699_inst_ack_1<= update_ack(0);
      slice_15699_inst: SliceSplitProtocol generic map(name => "slice_15699_inst", in_data_width => 64, high_index => 31, low_index => 0, buffering => 1, flow_through => false,  full_rate => true) -- 
        port map( din => tdata_15692, dout => data_15700, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    -- flow-through slice operator slice_15703_inst
    pos_15704 <= addr_15696(2 downto 0);
    W_tlast_14932_delayed_1_0_15738_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_tlast_14932_delayed_1_0_15738_inst_req_0;
      W_tlast_14932_delayed_1_0_15738_inst_ack_0<= wack(0);
      rreq(0) <= W_tlast_14932_delayed_1_0_15738_inst_req_1;
      W_tlast_14932_delayed_1_0_15738_inst_ack_1<= rack(0);
      W_tlast_14932_delayed_1_0_15738_inst : InterlockBuffer generic map ( -- 
        name => "W_tlast_14932_delayed_1_0_15738_inst",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag =>  true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => tlast_15688,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => tlast_14932_delayed_1_0_15740,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- interlock ssrc_phi_stmt_15681
    process(RPIPE_mac_to_prog_15683_wire) -- 
      variable tmp_var : std_logic_vector(72 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 72 downto 0) := RPIPE_mac_to_prog_15683_wire(72 downto 0);
      read_val_15681 <= tmp_var; -- 
    end process;
    -- interlock type_cast_15709_inst
    process(pos_15704) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 2 downto 0) := pos_15704(2 downto 0);
      type_cast_15709_wire <= tmp_var; -- 
    end process;
    -- interlock type_cast_15720_inst
    process(data_15700) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 31 downto 0) := data_15700(31 downto 0);
      type_cast_15720_wire <= tmp_var; -- 
    end process;
    -- interlock type_cast_15724_inst
    process(pos_15704) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 2 downto 0) := pos_15704(2 downto 0);
      type_cast_15724_wire <= tmp_var; -- 
    end process;
    -- interlock type_cast_15746_inst
    process(addr_15696) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 31 downto 0) := addr_15696(31 downto 0);
      type_cast_15746_wire <= tmp_var; -- 
    end process;
    do_while_stmt_15679_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_15754_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_15679_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_15679_branch_req_0,
          ack0 => do_while_stmt_15679_branch_ack_0,
          ack1 => do_while_stmt_15679_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared split operator group (0) : CONCAT_u1_u73_15751_inst 
    ApConcat_group_0: Block -- 
      signal data_in: std_logic_vector(72 downto 0);
      signal data_out: std_logic_vector(72 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= type_cast_15744_wire_constant & CONCAT_u64_u72_15749_wire;
      CONCAT_u1_u73_15751_wire <= data_out(72 downto 0);
      guard_vector(0)  <= tlast_14932_delayed_1_0_15740(0);
      reqL_unguarded(0) <= CONCAT_u1_u73_15751_inst_req_0;
      CONCAT_u1_u73_15751_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= CONCAT_u1_u73_15751_inst_req_1;
      CONCAT_u1_u73_15751_inst_ack_1 <= ackR_unguarded(0);
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
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 72, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 73,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          full_rate  => true,
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
    -- binary operator CONCAT_u4_u36_15716_inst
    process(type_cast_15714_wire_constant, addr_15696) -- 
      variable tmp_var : std_logic_vector(35 downto 0); -- 
    begin -- 
      ApConcat_proc(type_cast_15714_wire_constant, addr_15696, tmp_var);
      address_15717 <= tmp_var; --
    end process;
    -- binary operator CONCAT_u64_u72_15749_inst
    process(type_cast_15746_wire) -- 
      variable tmp_var : std_logic_vector(71 downto 0); -- 
    begin -- 
      ApConcat_proc(type_cast_15746_wire, type_cast_15748_wire_constant, tmp_var);
      CONCAT_u64_u72_15749_wire <= tmp_var; --
    end process;
    -- binary operator LSHR_u64_u64_15727_inst
    process(SHL_u64_u64_15722_wire, SHL_u64_u64_15726_wire) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      ApIntLSHR_proc(SHL_u64_u64_15722_wire, SHL_u64_u64_15726_wire, tmp_var);
      wdata_15728 <= tmp_var; --
    end process;
    -- binary operator LSHR_u8_u8_15710_inst
    process(type_cast_15707_wire_constant, type_cast_15709_wire) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      ApIntLSHR_proc(type_cast_15707_wire_constant, type_cast_15709_wire, tmp_var);
      bytemask_15711 <= tmp_var; --
    end process;
    -- binary operator SHL_u64_u64_15722_inst
    process(type_cast_15720_wire) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      ApIntSHL_proc(type_cast_15720_wire, konst_15721_wire_constant, tmp_var);
      SHL_u64_u64_15722_wire <= tmp_var; --
    end process;
    -- binary operator SHL_u64_u64_15726_inst
    process(type_cast_15724_wire) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      ApIntSHL_proc(type_cast_15724_wire, konst_15725_wire_constant, tmp_var);
      SHL_u64_u64_15726_wire <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_mac_to_prog_15683_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(72 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_mac_to_prog_15683_inst_req_0;
      RPIPE_mac_to_prog_15683_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_mac_to_prog_15683_inst_req_1;
      RPIPE_mac_to_prog_15683_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      RPIPE_mac_to_prog_15683_wire <= data_out(72 downto 0);
      mac_to_prog_read_0_gI: SplitGuardInterface generic map(name => "mac_to_prog_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
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
      mac_to_prog_read_0: InputPortRevised -- 
        generic map ( name => "mac_to_prog_read_0", data_width => 73,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => mac_to_prog_pipe_read_req(0),
          oack => mac_to_prog_pipe_read_ack(0),
          odata => mac_to_prog_pipe_read_data(72 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_prog_to_mac_15742_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(72 downto 0);
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
      sample_req_unguarded(0) <= WPIPE_prog_to_mac_15742_inst_req_0;
      WPIPE_prog_to_mac_15742_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_prog_to_mac_15742_inst_req_1;
      WPIPE_prog_to_mac_15742_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= tlast_14932_delayed_1_0_15740(0);
      data_in <= CONCAT_u1_u73_15751_wire;
      prog_to_mac_write_0_gI: SplitGuardInterface generic map(name => "prog_to_mac_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      prog_to_mac_write_0: OutputPortRevised -- 
        generic map ( name => "prog_to_mac", data_width => 73, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => prog_to_mac_pipe_write_req(0),
          oack => prog_to_mac_pipe_write_ack(0),
          odata => prog_to_mac_pipe_write_data(72 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared call operator group (0) : call_stmt_15737_call 
    accessMemory2_call_group_0: Block -- 
      signal data_in: std_logic_vector(109 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_15737_call_req_0;
      call_stmt_15737_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_15737_call_req_1;
      call_stmt_15737_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      accessMemory2_call_group_0_gI: SplitGuardInterface generic map(name => "accessMemory2_call_group_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
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
      data_in <= type_cast_15730_wire_constant & type_cast_15732_wire_constant & bytemask_15711 & address_15717 & wdata_15728;
      ignore_return_15737 <= data_out(63 downto 0);
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 110,
        owidth => 110,
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
          reqR => accessMemory2_call_reqs(0),
          ackR => accessMemory2_call_acks(0),
          dataR => accessMemory2_call_data(109 downto 0),
          tagR => accessMemory2_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 64,
          owidth => 64,
          detailed_buffering_per_output => outBUFs, 
          full_rate => true, 
          twidth => 1,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => accessMemory2_return_acks(0), -- cross-over
          ackL => accessMemory2_return_reqs(0), -- cross-over
          dataL => accessMemory2_return_data(63 downto 0),
          tagL => accessMemory2_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- 
  end Block; -- data_path
  -- 
end ethernet_programmer_arch;
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
library work;
use work.ethernet_boot_global_package.all;
entity ethernet_boot is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    MEMORY_TO_PROG_RESPONSE_pipe_write_data: in std_logic_vector(64 downto 0);
    MEMORY_TO_PROG_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
    MEMORY_TO_PROG_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
    PROG_TO_MEMORY_REQUEST_pipe_read_data: out std_logic_vector(109 downto 0);
    PROG_TO_MEMORY_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
    PROG_TO_MEMORY_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
    mac_to_prog_pipe_write_data: in std_logic_vector(72 downto 0);
    mac_to_prog_pipe_write_req : in std_logic_vector(0 downto 0);
    mac_to_prog_pipe_write_ack : out std_logic_vector(0 downto 0);
    prog_to_mac_pipe_read_data: out std_logic_vector(72 downto 0);
    prog_to_mac_pipe_read_req : in std_logic_vector(0 downto 0);
    prog_to_mac_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture ethernet_boot_arch  of ethernet_boot is -- system-architecture 
  -- interface signals to connect to memory space memory_space_0
  -- interface signals to connect to memory space memory_space_1
  -- interface signals to connect to memory space memory_space_2
  -- declarations related to module accessMemory2
  component accessMemory2 is -- 
    generic (tag_length : integer); 
    port ( -- 
      lock : in  std_logic_vector(0 downto 0);
      rwbar : in  std_logic_vector(0 downto 0);
      bmask : in  std_logic_vector(7 downto 0);
      addr : in  std_logic_vector(35 downto 0);
      wdata : in  std_logic_vector(63 downto 0);
      rdata : out  std_logic_vector(63 downto 0);
      MEMORY_TO_PROG_RESPONSE_pipe_read_req : out  std_logic_vector(0 downto 0);
      MEMORY_TO_PROG_RESPONSE_pipe_read_ack : in   std_logic_vector(0 downto 0);
      MEMORY_TO_PROG_RESPONSE_pipe_read_data : in   std_logic_vector(64 downto 0);
      PROG_TO_MEMORY_REQUEST_pipe_write_req : out  std_logic_vector(0 downto 0);
      PROG_TO_MEMORY_REQUEST_pipe_write_ack : in   std_logic_vector(0 downto 0);
      PROG_TO_MEMORY_REQUEST_pipe_write_data : out  std_logic_vector(109 downto 0);
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
  -- argument signals for module accessMemory2
  signal accessMemory2_lock :  std_logic_vector(0 downto 0);
  signal accessMemory2_rwbar :  std_logic_vector(0 downto 0);
  signal accessMemory2_bmask :  std_logic_vector(7 downto 0);
  signal accessMemory2_addr :  std_logic_vector(35 downto 0);
  signal accessMemory2_wdata :  std_logic_vector(63 downto 0);
  signal accessMemory2_rdata :  std_logic_vector(63 downto 0);
  signal accessMemory2_in_args    : std_logic_vector(109 downto 0);
  signal accessMemory2_out_args   : std_logic_vector(63 downto 0);
  signal accessMemory2_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal accessMemory2_tag_out   : std_logic_vector(1 downto 0);
  signal accessMemory2_start_req : std_logic;
  signal accessMemory2_start_ack : std_logic;
  signal accessMemory2_fin_req   : std_logic;
  signal accessMemory2_fin_ack : std_logic;
  -- caller side aggregated signals for module accessMemory2
  signal accessMemory2_call_reqs: std_logic_vector(0 downto 0);
  signal accessMemory2_call_acks: std_logic_vector(0 downto 0);
  signal accessMemory2_return_reqs: std_logic_vector(0 downto 0);
  signal accessMemory2_return_acks: std_logic_vector(0 downto 0);
  signal accessMemory2_call_data: std_logic_vector(109 downto 0);
  signal accessMemory2_call_tag: std_logic_vector(0 downto 0);
  signal accessMemory2_return_data: std_logic_vector(63 downto 0);
  signal accessMemory2_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module ethernet_programmer
  component ethernet_programmer is -- 
    generic (tag_length : integer); 
    port ( -- 
      mac_to_prog_pipe_read_req : out  std_logic_vector(0 downto 0);
      mac_to_prog_pipe_read_ack : in   std_logic_vector(0 downto 0);
      mac_to_prog_pipe_read_data : in   std_logic_vector(72 downto 0);
      prog_to_mac_pipe_write_req : out  std_logic_vector(0 downto 0);
      prog_to_mac_pipe_write_ack : in   std_logic_vector(0 downto 0);
      prog_to_mac_pipe_write_data : out  std_logic_vector(72 downto 0);
      accessMemory2_call_reqs : out  std_logic_vector(0 downto 0);
      accessMemory2_call_acks : in   std_logic_vector(0 downto 0);
      accessMemory2_call_data : out  std_logic_vector(109 downto 0);
      accessMemory2_call_tag  :  out  std_logic_vector(0 downto 0);
      accessMemory2_return_reqs : out  std_logic_vector(0 downto 0);
      accessMemory2_return_acks : in   std_logic_vector(0 downto 0);
      accessMemory2_return_data : in   std_logic_vector(63 downto 0);
      accessMemory2_return_tag :  in   std_logic_vector(0 downto 0);
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
  -- argument signals for module ethernet_programmer
  signal ethernet_programmer_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal ethernet_programmer_tag_out   : std_logic_vector(1 downto 0);
  signal ethernet_programmer_start_req : std_logic;
  signal ethernet_programmer_start_ack : std_logic;
  signal ethernet_programmer_fin_req   : std_logic;
  signal ethernet_programmer_fin_ack : std_logic;
  -- aggregate signals for read from pipe MEMORY_TO_PROG_RESPONSE
  signal MEMORY_TO_PROG_RESPONSE_pipe_read_data: std_logic_vector(64 downto 0);
  signal MEMORY_TO_PROG_RESPONSE_pipe_read_req: std_logic_vector(0 downto 0);
  signal MEMORY_TO_PROG_RESPONSE_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe PROG_TO_MEMORY_REQUEST
  signal PROG_TO_MEMORY_REQUEST_pipe_write_data: std_logic_vector(109 downto 0);
  signal PROG_TO_MEMORY_REQUEST_pipe_write_req: std_logic_vector(0 downto 0);
  signal PROG_TO_MEMORY_REQUEST_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe mac_to_prog
  signal mac_to_prog_pipe_read_data: std_logic_vector(72 downto 0);
  signal mac_to_prog_pipe_read_req: std_logic_vector(0 downto 0);
  signal mac_to_prog_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe prog_to_mac
  signal prog_to_mac_pipe_write_data: std_logic_vector(72 downto 0);
  signal prog_to_mac_pipe_write_req: std_logic_vector(0 downto 0);
  signal prog_to_mac_pipe_write_ack: std_logic_vector(0 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module accessMemory2
  accessMemory2_lock <= accessMemory2_in_args(109 downto 109);
  accessMemory2_rwbar <= accessMemory2_in_args(108 downto 108);
  accessMemory2_bmask <= accessMemory2_in_args(107 downto 100);
  accessMemory2_addr <= accessMemory2_in_args(99 downto 64);
  accessMemory2_wdata <= accessMemory2_in_args(63 downto 0);
  accessMemory2_out_args <= accessMemory2_rdata ;
  -- call arbiter for module accessMemory2
  accessMemory2_arbiter: SplitCallArbiter -- 
    generic map( --
      name => "SplitCallArbiter", num_reqs => 1,
      call_data_width => 110,
      return_data_width => 64,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => accessMemory2_call_reqs,
      call_acks => accessMemory2_call_acks,
      return_reqs => accessMemory2_return_reqs,
      return_acks => accessMemory2_return_acks,
      call_data  => accessMemory2_call_data,
      call_tag  => accessMemory2_call_tag,
      return_tag  => accessMemory2_return_tag,
      call_mtag => accessMemory2_tag_in,
      return_mtag => accessMemory2_tag_out,
      return_data =>accessMemory2_return_data,
      call_mreq => accessMemory2_start_req,
      call_mack => accessMemory2_start_ack,
      return_mreq => accessMemory2_fin_req,
      return_mack => accessMemory2_fin_ack,
      call_mdata => accessMemory2_in_args,
      return_mdata => accessMemory2_out_args,
      clk => clk, 
      reset => reset --
    ); --
  accessMemory2_instance:accessMemory2-- 
    generic map(tag_length => 2)
    port map(-- 
      lock => accessMemory2_lock,
      rwbar => accessMemory2_rwbar,
      bmask => accessMemory2_bmask,
      addr => accessMemory2_addr,
      wdata => accessMemory2_wdata,
      rdata => accessMemory2_rdata,
      start_req => accessMemory2_start_req,
      start_ack => accessMemory2_start_ack,
      fin_req => accessMemory2_fin_req,
      fin_ack => accessMemory2_fin_ack,
      clk => clk,
      reset => reset,
      MEMORY_TO_PROG_RESPONSE_pipe_read_req => MEMORY_TO_PROG_RESPONSE_pipe_read_req(0 downto 0),
      MEMORY_TO_PROG_RESPONSE_pipe_read_ack => MEMORY_TO_PROG_RESPONSE_pipe_read_ack(0 downto 0),
      MEMORY_TO_PROG_RESPONSE_pipe_read_data => MEMORY_TO_PROG_RESPONSE_pipe_read_data(64 downto 0),
      PROG_TO_MEMORY_REQUEST_pipe_write_req => PROG_TO_MEMORY_REQUEST_pipe_write_req(0 downto 0),
      PROG_TO_MEMORY_REQUEST_pipe_write_ack => PROG_TO_MEMORY_REQUEST_pipe_write_ack(0 downto 0),
      PROG_TO_MEMORY_REQUEST_pipe_write_data => PROG_TO_MEMORY_REQUEST_pipe_write_data(109 downto 0),
      tag_in => accessMemory2_tag_in,
      tag_out => accessMemory2_tag_out-- 
    ); -- 
  -- module ethernet_programmer
  ethernet_programmer_instance:ethernet_programmer-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => ethernet_programmer_start_req,
      start_ack => ethernet_programmer_start_ack,
      fin_req => ethernet_programmer_fin_req,
      fin_ack => ethernet_programmer_fin_ack,
      clk => clk,
      reset => reset,
      mac_to_prog_pipe_read_req => mac_to_prog_pipe_read_req(0 downto 0),
      mac_to_prog_pipe_read_ack => mac_to_prog_pipe_read_ack(0 downto 0),
      mac_to_prog_pipe_read_data => mac_to_prog_pipe_read_data(72 downto 0),
      prog_to_mac_pipe_write_req => prog_to_mac_pipe_write_req(0 downto 0),
      prog_to_mac_pipe_write_ack => prog_to_mac_pipe_write_ack(0 downto 0),
      prog_to_mac_pipe_write_data => prog_to_mac_pipe_write_data(72 downto 0),
      accessMemory2_call_reqs => accessMemory2_call_reqs(0 downto 0),
      accessMemory2_call_acks => accessMemory2_call_acks(0 downto 0),
      accessMemory2_call_data => accessMemory2_call_data(109 downto 0),
      accessMemory2_call_tag => accessMemory2_call_tag(0 downto 0),
      accessMemory2_return_reqs => accessMemory2_return_reqs(0 downto 0),
      accessMemory2_return_acks => accessMemory2_return_acks(0 downto 0),
      accessMemory2_return_data => accessMemory2_return_data(63 downto 0),
      accessMemory2_return_tag => accessMemory2_return_tag(0 downto 0),
      tag_in => ethernet_programmer_tag_in,
      tag_out => ethernet_programmer_tag_out-- 
    ); -- 
  -- module will be run forever 
  ethernet_programmer_tag_in <= (others => '0');
  ethernet_programmer_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => ethernet_programmer_start_req, start_ack => ethernet_programmer_start_ack,  fin_req => ethernet_programmer_fin_req,  fin_ack => ethernet_programmer_fin_ack);
  MEMORY_TO_PROG_RESPONSE_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe MEMORY_TO_PROG_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 65,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => MEMORY_TO_PROG_RESPONSE_pipe_read_req,
      read_ack => MEMORY_TO_PROG_RESPONSE_pipe_read_ack,
      read_data => MEMORY_TO_PROG_RESPONSE_pipe_read_data,
      write_req => MEMORY_TO_PROG_RESPONSE_pipe_write_req,
      write_ack => MEMORY_TO_PROG_RESPONSE_pipe_write_ack,
      write_data => MEMORY_TO_PROG_RESPONSE_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  PROG_TO_MEMORY_REQUEST_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe PROG_TO_MEMORY_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 110,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => PROG_TO_MEMORY_REQUEST_pipe_read_req,
      read_ack => PROG_TO_MEMORY_REQUEST_pipe_read_ack,
      read_data => PROG_TO_MEMORY_REQUEST_pipe_read_data,
      write_req => PROG_TO_MEMORY_REQUEST_pipe_write_req,
      write_ack => PROG_TO_MEMORY_REQUEST_pipe_write_ack,
      write_data => PROG_TO_MEMORY_REQUEST_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  mac_to_prog_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe mac_to_prog",
      num_reads => 1,
      num_writes => 1,
      data_width => 73,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => mac_to_prog_pipe_read_req,
      read_ack => mac_to_prog_pipe_read_ack,
      read_data => mac_to_prog_pipe_read_data,
      write_req => mac_to_prog_pipe_write_req,
      write_ack => mac_to_prog_pipe_write_ack,
      write_data => mac_to_prog_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  prog_to_mac_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe prog_to_mac",
      num_reads => 1,
      num_writes => 1,
      data_width => 73,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => prog_to_mac_pipe_read_req,
      read_ack => prog_to_mac_pipe_read_ack,
      read_data => prog_to_mac_pipe_read_data,
      write_req => prog_to_mac_pipe_write_req,
      write_ack => prog_to_mac_pipe_write_ack,
      write_data => prog_to_mac_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- gated clock generators 
  -- 
end ethernet_boot_arch;
