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
use ahir.functionLibraryComponents.all;
library rx_concat_system_global_package;
use rx_concat_system_global_package.rx_concat_system_global_package.all;
entity rx_concat is -- 
  generic (tag_length : integer); 
  port ( -- 
    rx_in_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
    rx_in_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
    rx_in_pipe_pipe_read_data : in   std_logic_vector(9 downto 0);
    rx_out_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    rx_out_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    rx_out_pipe_pipe_write_data : out  std_logic_vector(72 downto 0);
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
end entity rx_concat;
architecture rx_concat_arch of rx_concat is -- 
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
  signal rx_concat_CP_3_start: Boolean;
  signal rx_concat_CP_3_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal do_while_stmt_13_branch_req_0 : boolean;
  signal RPIPE_rx_in_pipe_17_inst_req_0 : boolean;
  signal RPIPE_rx_in_pipe_17_inst_ack_0 : boolean;
  signal RPIPE_rx_in_pipe_17_inst_req_1 : boolean;
  signal RPIPE_rx_in_pipe_17_inst_ack_1 : boolean;
  signal phi_stmt_18_req_1 : boolean;
  signal phi_stmt_18_req_0 : boolean;
  signal phi_stmt_18_ack_0 : boolean;
  signal ncount_61_23_buf_req_0 : boolean;
  signal ncount_61_23_buf_ack_0 : boolean;
  signal ncount_61_23_buf_req_1 : boolean;
  signal ncount_61_23_buf_ack_1 : boolean;
  signal phi_stmt_24_req_0 : boolean;
  signal phi_stmt_24_req_1 : boolean;
  signal phi_stmt_24_ack_0 : boolean;
  signal sendData_101_26_buf_req_0 : boolean;
  signal sendData_101_26_buf_ack_0 : boolean;
  signal sendData_101_26_buf_req_1 : boolean;
  signal sendData_101_26_buf_ack_1 : boolean;
  signal phi_stmt_30_req_1 : boolean;
  signal phi_stmt_30_req_0 : boolean;
  signal phi_stmt_30_ack_0 : boolean;
  signal tkeep_75_35_buf_req_0 : boolean;
  signal tkeep_75_35_buf_ack_0 : boolean;
  signal tkeep_75_35_buf_req_1 : boolean;
  signal tkeep_75_35_buf_ack_1 : boolean;
  signal CONCAT_u65_u73_118_inst_req_0 : boolean;
  signal CONCAT_u65_u73_118_inst_ack_0 : boolean;
  signal CONCAT_u65_u73_118_inst_req_1 : boolean;
  signal CONCAT_u65_u73_118_inst_ack_1 : boolean;
  signal WPIPE_rx_out_pipe_111_inst_req_0 : boolean;
  signal WPIPE_rx_out_pipe_111_inst_ack_0 : boolean;
  signal WPIPE_rx_out_pipe_111_inst_req_1 : boolean;
  signal WPIPE_rx_out_pipe_111_inst_ack_1 : boolean;
  signal do_while_stmt_13_branch_ack_0 : boolean;
  signal do_while_stmt_13_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "rx_concat_input_buffer", -- 
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
  rx_concat_CP_3_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "rx_concat_out_buffer", -- 
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
    preds <= rx_concat_CP_3_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
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
    preds <= rx_concat_CP_3_start & tag_ilock_write_ack_symbol;
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
    preds <= rx_concat_CP_3_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  rx_concat_CP_3: Block -- control-path 
    signal rx_concat_CP_3_elements: BooleanArray(86 downto 0);
    -- 
  begin -- 
    rx_concat_CP_3_elements(0) <= rx_concat_CP_3_start;
    rx_concat_CP_3_symbol <= rx_concat_CP_3_elements(1);
    -- CP-element group 0:  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	2 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_12/$entry
      -- CP-element group 0: 	 branch_block_stmt_12/branch_block_stmt_12__entry__
      -- CP-element group 0: 	 branch_block_stmt_12/do_while_stmt_13__entry__
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	86 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (4) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_12/$exit
      -- CP-element group 1: 	 branch_block_stmt_12/branch_block_stmt_12__exit__
      -- CP-element group 1: 	 branch_block_stmt_12/do_while_stmt_13__exit__
      -- 
    rx_concat_CP_3_elements(1) <= rx_concat_CP_3_elements(86);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_12/do_while_stmt_13/$entry
      -- CP-element group 2: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13__entry__
      -- 
    rx_concat_CP_3_elements(2) <= rx_concat_CP_3_elements(0);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	86 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13__exit__
      -- 
    -- Element group rx_concat_CP_3_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_12/do_while_stmt_13/loop_back
      -- 
    -- Element group rx_concat_CP_3_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	84 
    -- CP-element group 5: 	85 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_12/do_while_stmt_13/condition_done
      -- CP-element group 5: 	 branch_block_stmt_12/do_while_stmt_13/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_12/do_while_stmt_13/loop_taken/$entry
      -- 
    rx_concat_CP_3_elements(5) <= rx_concat_CP_3_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	83 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_12/do_while_stmt_13/loop_body_done
      -- 
    rx_concat_CP_3_elements(6) <= rx_concat_CP_3_elements(83);
    -- CP-element group 7:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	24 
    -- CP-element group 7: 	43 
    -- CP-element group 7: 	62 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/back_edge_to_loop_body
      -- 
    rx_concat_CP_3_elements(7) <= rx_concat_CP_3_elements(4);
    -- CP-element group 8:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	26 
    -- CP-element group 8: 	45 
    -- CP-element group 8: 	64 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/first_time_through_loop_body
      -- 
    rx_concat_CP_3_elements(8) <= rx_concat_CP_3_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	82 
    -- CP-element group 9: 	11 
    -- CP-element group 9: 	15 
    -- CP-element group 9: 	20 
    -- CP-element group 9: 	21 
    -- CP-element group 9: 	37 
    -- CP-element group 9: 	38 
    -- CP-element group 9: 	56 
    -- CP-element group 9: 	57 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/loop_body_start
      -- CP-element group 9: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_15_sample_start_
      -- 
    -- Element group rx_concat_CP_3_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	82 
    -- CP-element group 10: 	14 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/condition_evaluated
      -- 
    condition_evaluated_27_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_27_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(10), ack => do_while_stmt_13_branch_req_0); -- 
    rx_concat_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(82) & rx_concat_CP_3_elements(14);
      gj_rx_concat_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	9 
    -- CP-element group 11: 	20 
    -- CP-element group 11: 	37 
    -- CP-element group 11: 	56 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	14 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	16 
    -- CP-element group 11: 	39 
    -- CP-element group 11: 	58 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/aggregated_phi_sample_req
      -- CP-element group 11: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_sample_start__ps
      -- 
    rx_concat_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 4) := (0 => 7,1 => 1,2 => 1,3 => 1,4 => 1);
      constant place_markings: IntegerArray(0 to 4)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 1);
      constant place_delays: IntegerArray(0 to 4) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 5); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(9) & rx_concat_CP_3_elements(20) & rx_concat_CP_3_elements(37) & rx_concat_CP_3_elements(56) & rx_concat_CP_3_elements(14);
      gj_rx_concat_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 5, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	18 
    -- CP-element group 12: 	22 
    -- CP-element group 12: 	40 
    -- CP-element group 12: 	59 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	83 
    -- CP-element group 12: marked-successors 
    -- CP-element group 12: 	20 
    -- CP-element group 12: 	37 
    -- CP-element group 12: 	56 
    -- CP-element group 12:  members (5) 
      -- CP-element group 12: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/aggregated_phi_sample_ack
      -- CP-element group 12: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_15_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_sample_completed_
      -- 
    rx_concat_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 7,2 => 7,3 => 7);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(18) & rx_concat_CP_3_elements(22) & rx_concat_CP_3_elements(40) & rx_concat_CP_3_elements(59);
      gj_rx_concat_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	15 
    -- CP-element group 13: 	21 
    -- CP-element group 13: 	38 
    -- CP-element group 13: 	57 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	17 
    -- CP-element group 13: 	41 
    -- CP-element group 13: 	60 
    -- CP-element group 13:  members (2) 
      -- CP-element group 13: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/aggregated_phi_update_req
      -- CP-element group 13: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_update_start__ps
      -- 
    rx_concat_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 1,2 => 1,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(15) & rx_concat_CP_3_elements(21) & rx_concat_CP_3_elements(38) & rx_concat_CP_3_elements(57);
      gj_rx_concat_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	19 
    -- CP-element group 14: 	23 
    -- CP-element group 14: 	42 
    -- CP-element group 14: 	61 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	10 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	11 
    -- CP-element group 14:  members (1) 
      -- CP-element group 14: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/aggregated_phi_update_ack
      -- 
    rx_concat_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 7,2 => 7,3 => 7);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(19) & rx_concat_CP_3_elements(23) & rx_concat_CP_3_elements(42) & rx_concat_CP_3_elements(61);
      gj_rx_concat_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	9 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	77 
    -- CP-element group 15: 	80 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	13 
    -- CP-element group 15:  members (1) 
      -- CP-element group 15: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_15_update_start_
      -- 
    rx_concat_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(9) & rx_concat_CP_3_elements(77) & rx_concat_CP_3_elements(80);
      gj_rx_concat_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	11 
    -- CP-element group 16: marked-predecessors 
    -- CP-element group 16: 	19 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	18 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_sample_start_
      -- CP-element group 16: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_Sample/$entry
      -- CP-element group 16: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_Sample/rr
      -- 
    rr_44_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_44_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(16), ack => RPIPE_rx_in_pipe_17_inst_req_0); -- 
    rx_concat_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(11) & rx_concat_CP_3_elements(19);
      gj_rx_concat_cp_element_group_16 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	13 
    -- CP-element group 17: 	18 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_update_start_
      -- CP-element group 17: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_Update/$entry
      -- CP-element group 17: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_Update/cr
      -- 
    cr_49_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_49_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(17), ack => RPIPE_rx_in_pipe_17_inst_req_1); -- 
    rx_concat_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(13) & rx_concat_CP_3_elements(18);
      gj_rx_concat_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	16 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	12 
    -- CP-element group 18: 	17 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_sample_completed_
      -- CP-element group 18: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_Sample/$exit
      -- CP-element group 18: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_Sample/ra
      -- 
    ra_45_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 18_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_rx_in_pipe_17_inst_ack_0, ack => rx_concat_CP_3_elements(18)); -- 
    -- CP-element group 19:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	14 
    -- CP-element group 19: 	75 
    -- CP-element group 19: 	79 
    -- CP-element group 19: marked-successors 
    -- CP-element group 19: 	16 
    -- CP-element group 19:  members (4) 
      -- CP-element group 19: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_15_update_completed_
      -- CP-element group 19: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_update_completed_
      -- CP-element group 19: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_Update/$exit
      -- CP-element group 19: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/RPIPE_rx_in_pipe_17_Update/ca
      -- 
    ca_50_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_rx_in_pipe_17_inst_ack_1, ack => rx_concat_CP_3_elements(19)); -- 
    -- CP-element group 20:  join  transition  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	9 
    -- CP-element group 20: marked-predecessors 
    -- CP-element group 20: 	12 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	11 
    -- CP-element group 20:  members (1) 
      -- CP-element group 20: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_sample_start_
      -- 
    rx_concat_cp_element_group_20: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_20"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(9) & rx_concat_CP_3_elements(12);
      gj_rx_concat_cp_element_group_20 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(20), clk => clk, reset => reset); --
    end block;
    -- CP-element group 21:  join  transition  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	9 
    -- CP-element group 21: marked-predecessors 
    -- CP-element group 21: 	77 
    -- CP-element group 21: 	80 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	13 
    -- CP-element group 21:  members (1) 
      -- CP-element group 21: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_update_start_
      -- 
    rx_concat_cp_element_group_21: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_21"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(9) & rx_concat_CP_3_elements(77) & rx_concat_CP_3_elements(80);
      gj_rx_concat_cp_element_group_21 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(21), clk => clk, reset => reset); --
    end block;
    -- CP-element group 22:  join  transition  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	12 
    -- CP-element group 22:  members (1) 
      -- CP-element group 22: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_sample_completed__ps
      -- 
    -- Element group rx_concat_CP_3_elements(22) is bound as output of CP function.
    -- CP-element group 23:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	14 
    -- CP-element group 23: 	75 
    -- CP-element group 23: 	79 
    -- CP-element group 23:  members (2) 
      -- CP-element group 23: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_update_completed_
      -- CP-element group 23: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_update_completed__ps
      -- 
    -- Element group rx_concat_CP_3_elements(23) is bound as output of CP function.
    -- CP-element group 24:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	7 
    -- CP-element group 24: successors 
    -- CP-element group 24:  members (1) 
      -- CP-element group 24: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_loopback_trigger
      -- 
    rx_concat_CP_3_elements(24) <= rx_concat_CP_3_elements(7);
    -- CP-element group 25:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: successors 
    -- CP-element group 25:  members (2) 
      -- CP-element group 25: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_loopback_sample_req
      -- CP-element group 25: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_loopback_sample_req_ps
      -- 
    phi_stmt_18_loopback_sample_req_60_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_18_loopback_sample_req_60_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(25), ack => phi_stmt_18_req_1); -- 
    -- Element group rx_concat_CP_3_elements(25) is bound as output of CP function.
    -- CP-element group 26:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	8 
    -- CP-element group 26: successors 
    -- CP-element group 26:  members (1) 
      -- CP-element group 26: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_entry_trigger
      -- 
    rx_concat_CP_3_elements(26) <= rx_concat_CP_3_elements(8);
    -- CP-element group 27:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (2) 
      -- CP-element group 27: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_entry_sample_req
      -- CP-element group 27: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_entry_sample_req_ps
      -- 
    phi_stmt_18_entry_sample_req_63_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_18_entry_sample_req_63_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(27), ack => phi_stmt_18_req_0); -- 
    -- Element group rx_concat_CP_3_elements(27) is bound as output of CP function.
    -- CP-element group 28:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: successors 
    -- CP-element group 28:  members (2) 
      -- CP-element group 28: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_phi_mux_ack
      -- CP-element group 28: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_18_phi_mux_ack_ps
      -- 
    phi_stmt_18_phi_mux_ack_66_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 28_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_18_ack_0, ack => rx_concat_CP_3_elements(28)); -- 
    -- CP-element group 29:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: successors 
    -- CP-element group 29:  members (4) 
      -- CP-element group 29: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_22_sample_start__ps
      -- CP-element group 29: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_22_sample_completed__ps
      -- CP-element group 29: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_22_sample_start_
      -- CP-element group 29: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_22_sample_completed_
      -- 
    -- Element group rx_concat_CP_3_elements(29) is bound as output of CP function.
    -- CP-element group 30:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	32 
    -- CP-element group 30:  members (2) 
      -- CP-element group 30: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_22_update_start__ps
      -- CP-element group 30: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_22_update_start_
      -- 
    -- Element group rx_concat_CP_3_elements(30) is bound as output of CP function.
    -- CP-element group 31:  join  transition  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	32 
    -- CP-element group 31: successors 
    -- CP-element group 31:  members (1) 
      -- CP-element group 31: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_22_update_completed__ps
      -- 
    rx_concat_CP_3_elements(31) <= rx_concat_CP_3_elements(32);
    -- CP-element group 32:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	30 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	31 
    -- CP-element group 32:  members (1) 
      -- CP-element group 32: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_22_update_completed_
      -- 
    -- Element group rx_concat_CP_3_elements(32) is a control-delay.
    cp_element_32_delay: control_delay_element  generic map(name => " 32_delay", delay_value => 1)  port map(req => rx_concat_CP_3_elements(30), ack => rx_concat_CP_3_elements(32), clk => clk, reset =>reset);
    -- CP-element group 33:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	35 
    -- CP-element group 33:  members (4) 
      -- CP-element group 33: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_sample_start__ps
      -- CP-element group 33: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_sample_start_
      -- CP-element group 33: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_Sample/$entry
      -- CP-element group 33: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_Sample/req
      -- 
    req_87_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_87_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(33), ack => ncount_61_23_buf_req_0); -- 
    -- Element group rx_concat_CP_3_elements(33) is bound as output of CP function.
    -- CP-element group 34:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	36 
    -- CP-element group 34:  members (4) 
      -- CP-element group 34: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_update_start__ps
      -- CP-element group 34: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_update_start_
      -- CP-element group 34: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_Update/$entry
      -- CP-element group 34: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_Update/req
      -- 
    req_92_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_92_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(34), ack => ncount_61_23_buf_req_1); -- 
    -- Element group rx_concat_CP_3_elements(34) is bound as output of CP function.
    -- CP-element group 35:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	33 
    -- CP-element group 35: successors 
    -- CP-element group 35:  members (4) 
      -- CP-element group 35: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_sample_completed__ps
      -- CP-element group 35: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_sample_completed_
      -- CP-element group 35: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_Sample/$exit
      -- CP-element group 35: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_Sample/ack
      -- 
    ack_88_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 35_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ncount_61_23_buf_ack_0, ack => rx_concat_CP_3_elements(35)); -- 
    -- CP-element group 36:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	34 
    -- CP-element group 36: successors 
    -- CP-element group 36:  members (4) 
      -- CP-element group 36: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_update_completed__ps
      -- CP-element group 36: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_update_completed_
      -- CP-element group 36: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_Update/$exit
      -- CP-element group 36: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_ncount_23_Update/ack
      -- 
    ack_93_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 36_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ncount_61_23_buf_ack_1, ack => rx_concat_CP_3_elements(36)); -- 
    -- CP-element group 37:  join  transition  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	9 
    -- CP-element group 37: marked-predecessors 
    -- CP-element group 37: 	12 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	11 
    -- CP-element group 37:  members (1) 
      -- CP-element group 37: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_sample_start_
      -- 
    rx_concat_cp_element_group_37: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_37"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(9) & rx_concat_CP_3_elements(12);
      gj_rx_concat_cp_element_group_37 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(37), clk => clk, reset => reset); --
    end block;
    -- CP-element group 38:  join  transition  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	9 
    -- CP-element group 38: marked-predecessors 
    -- CP-element group 38: 	77 
    -- CP-element group 38: successors 
    -- CP-element group 38: 	13 
    -- CP-element group 38:  members (1) 
      -- CP-element group 38: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_update_start_
      -- 
    rx_concat_cp_element_group_38: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_38"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(9) & rx_concat_CP_3_elements(77);
      gj_rx_concat_cp_element_group_38 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(38), clk => clk, reset => reset); --
    end block;
    -- CP-element group 39:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	11 
    -- CP-element group 39: successors 
    -- CP-element group 39:  members (1) 
      -- CP-element group 39: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_sample_start__ps
      -- 
    rx_concat_CP_3_elements(39) <= rx_concat_CP_3_elements(11);
    -- CP-element group 40:  join  transition  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	12 
    -- CP-element group 40:  members (1) 
      -- CP-element group 40: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_sample_completed__ps
      -- 
    -- Element group rx_concat_CP_3_elements(40) is bound as output of CP function.
    -- CP-element group 41:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: 	13 
    -- CP-element group 41: successors 
    -- CP-element group 41:  members (1) 
      -- CP-element group 41: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_update_start__ps
      -- 
    rx_concat_CP_3_elements(41) <= rx_concat_CP_3_elements(13);
    -- CP-element group 42:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: successors 
    -- CP-element group 42: 	14 
    -- CP-element group 42: 	75 
    -- CP-element group 42:  members (2) 
      -- CP-element group 42: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_update_completed_
      -- CP-element group 42: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_update_completed__ps
      -- 
    -- Element group rx_concat_CP_3_elements(42) is bound as output of CP function.
    -- CP-element group 43:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: 	7 
    -- CP-element group 43: successors 
    -- CP-element group 43:  members (1) 
      -- CP-element group 43: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_loopback_trigger
      -- 
    rx_concat_CP_3_elements(43) <= rx_concat_CP_3_elements(7);
    -- CP-element group 44:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: successors 
    -- CP-element group 44:  members (2) 
      -- CP-element group 44: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_loopback_sample_req
      -- CP-element group 44: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_loopback_sample_req_ps
      -- 
    phi_stmt_24_loopback_sample_req_104_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_24_loopback_sample_req_104_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(44), ack => phi_stmt_24_req_0); -- 
    -- Element group rx_concat_CP_3_elements(44) is bound as output of CP function.
    -- CP-element group 45:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: 	8 
    -- CP-element group 45: successors 
    -- CP-element group 45:  members (1) 
      -- CP-element group 45: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_entry_trigger
      -- 
    rx_concat_CP_3_elements(45) <= rx_concat_CP_3_elements(8);
    -- CP-element group 46:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: successors 
    -- CP-element group 46:  members (2) 
      -- CP-element group 46: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_entry_sample_req
      -- CP-element group 46: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_entry_sample_req_ps
      -- 
    phi_stmt_24_entry_sample_req_107_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_24_entry_sample_req_107_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(46), ack => phi_stmt_24_req_1); -- 
    -- Element group rx_concat_CP_3_elements(46) is bound as output of CP function.
    -- CP-element group 47:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: successors 
    -- CP-element group 47:  members (2) 
      -- CP-element group 47: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_phi_mux_ack
      -- CP-element group 47: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_24_phi_mux_ack_ps
      -- 
    phi_stmt_24_phi_mux_ack_110_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 47_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_24_ack_0, ack => rx_concat_CP_3_elements(47)); -- 
    -- CP-element group 48:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: successors 
    -- CP-element group 48: 	50 
    -- CP-element group 48:  members (4) 
      -- CP-element group 48: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_sample_start__ps
      -- CP-element group 48: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_sample_start_
      -- CP-element group 48: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_Sample/$entry
      -- CP-element group 48: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_Sample/req
      -- 
    req_123_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_123_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(48), ack => sendData_101_26_buf_req_0); -- 
    -- Element group rx_concat_CP_3_elements(48) is bound as output of CP function.
    -- CP-element group 49:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: successors 
    -- CP-element group 49: 	51 
    -- CP-element group 49:  members (4) 
      -- CP-element group 49: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_update_start__ps
      -- CP-element group 49: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_update_start_
      -- CP-element group 49: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_Update/$entry
      -- CP-element group 49: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_Update/req
      -- 
    req_128_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_128_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(49), ack => sendData_101_26_buf_req_1); -- 
    -- Element group rx_concat_CP_3_elements(49) is bound as output of CP function.
    -- CP-element group 50:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: 	48 
    -- CP-element group 50: successors 
    -- CP-element group 50:  members (4) 
      -- CP-element group 50: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_sample_completed__ps
      -- CP-element group 50: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_sample_completed_
      -- CP-element group 50: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_Sample/$exit
      -- CP-element group 50: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_Sample/ack
      -- 
    ack_124_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 50_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendData_101_26_buf_ack_0, ack => rx_concat_CP_3_elements(50)); -- 
    -- CP-element group 51:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: 	49 
    -- CP-element group 51: successors 
    -- CP-element group 51:  members (4) 
      -- CP-element group 51: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_update_completed__ps
      -- CP-element group 51: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_update_completed_
      -- CP-element group 51: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_Update/$exit
      -- CP-element group 51: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_sendData_26_Update/ack
      -- 
    ack_129_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 51_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => sendData_101_26_buf_ack_1, ack => rx_concat_CP_3_elements(51)); -- 
    -- CP-element group 52:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 52: predecessors 
    -- CP-element group 52: successors 
    -- CP-element group 52:  members (4) 
      -- CP-element group 52: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_29_sample_start__ps
      -- CP-element group 52: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_29_sample_completed__ps
      -- CP-element group 52: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_29_sample_start_
      -- CP-element group 52: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_29_sample_completed_
      -- 
    -- Element group rx_concat_CP_3_elements(52) is bound as output of CP function.
    -- CP-element group 53:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 53: predecessors 
    -- CP-element group 53: successors 
    -- CP-element group 53: 	55 
    -- CP-element group 53:  members (2) 
      -- CP-element group 53: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_29_update_start__ps
      -- CP-element group 53: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_29_update_start_
      -- 
    -- Element group rx_concat_CP_3_elements(53) is bound as output of CP function.
    -- CP-element group 54:  join  transition  bypass  pipeline-parent 
    -- CP-element group 54: predecessors 
    -- CP-element group 54: 	55 
    -- CP-element group 54: successors 
    -- CP-element group 54:  members (1) 
      -- CP-element group 54: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_29_update_completed__ps
      -- 
    rx_concat_CP_3_elements(54) <= rx_concat_CP_3_elements(55);
    -- CP-element group 55:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 55: predecessors 
    -- CP-element group 55: 	53 
    -- CP-element group 55: successors 
    -- CP-element group 55: 	54 
    -- CP-element group 55:  members (1) 
      -- CP-element group 55: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_29_update_completed_
      -- 
    -- Element group rx_concat_CP_3_elements(55) is a control-delay.
    cp_element_55_delay: control_delay_element  generic map(name => " 55_delay", delay_value => 1)  port map(req => rx_concat_CP_3_elements(53), ack => rx_concat_CP_3_elements(55), clk => clk, reset =>reset);
    -- CP-element group 56:  join  transition  bypass  pipeline-parent 
    -- CP-element group 56: predecessors 
    -- CP-element group 56: 	9 
    -- CP-element group 56: marked-predecessors 
    -- CP-element group 56: 	12 
    -- CP-element group 56: successors 
    -- CP-element group 56: 	11 
    -- CP-element group 56:  members (1) 
      -- CP-element group 56: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_sample_start_
      -- 
    rx_concat_cp_element_group_56: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_56"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(9) & rx_concat_CP_3_elements(12);
      gj_rx_concat_cp_element_group_56 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(56), clk => clk, reset => reset); --
    end block;
    -- CP-element group 57:  join  transition  bypass  pipeline-parent 
    -- CP-element group 57: predecessors 
    -- CP-element group 57: 	9 
    -- CP-element group 57: marked-predecessors 
    -- CP-element group 57: 	77 
    -- CP-element group 57: successors 
    -- CP-element group 57: 	13 
    -- CP-element group 57:  members (1) 
      -- CP-element group 57: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_update_start_
      -- 
    rx_concat_cp_element_group_57: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_57"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(9) & rx_concat_CP_3_elements(77);
      gj_rx_concat_cp_element_group_57 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(57), clk => clk, reset => reset); --
    end block;
    -- CP-element group 58:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 58: predecessors 
    -- CP-element group 58: 	11 
    -- CP-element group 58: successors 
    -- CP-element group 58:  members (1) 
      -- CP-element group 58: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_sample_start__ps
      -- 
    rx_concat_CP_3_elements(58) <= rx_concat_CP_3_elements(11);
    -- CP-element group 59:  join  transition  bypass  pipeline-parent 
    -- CP-element group 59: predecessors 
    -- CP-element group 59: successors 
    -- CP-element group 59: 	12 
    -- CP-element group 59:  members (1) 
      -- CP-element group 59: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_sample_completed__ps
      -- 
    -- Element group rx_concat_CP_3_elements(59) is bound as output of CP function.
    -- CP-element group 60:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 60: predecessors 
    -- CP-element group 60: 	13 
    -- CP-element group 60: successors 
    -- CP-element group 60:  members (1) 
      -- CP-element group 60: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_update_start__ps
      -- 
    rx_concat_CP_3_elements(60) <= rx_concat_CP_3_elements(13);
    -- CP-element group 61:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 61: predecessors 
    -- CP-element group 61: successors 
    -- CP-element group 61: 	14 
    -- CP-element group 61: 	75 
    -- CP-element group 61:  members (2) 
      -- CP-element group 61: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_update_completed__ps
      -- CP-element group 61: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_update_completed_
      -- 
    -- Element group rx_concat_CP_3_elements(61) is bound as output of CP function.
    -- CP-element group 62:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 62: predecessors 
    -- CP-element group 62: 	7 
    -- CP-element group 62: successors 
    -- CP-element group 62:  members (1) 
      -- CP-element group 62: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_loopback_trigger
      -- 
    rx_concat_CP_3_elements(62) <= rx_concat_CP_3_elements(7);
    -- CP-element group 63:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 63: predecessors 
    -- CP-element group 63: successors 
    -- CP-element group 63:  members (2) 
      -- CP-element group 63: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_loopback_sample_req
      -- CP-element group 63: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_loopback_sample_req_ps
      -- 
    phi_stmt_30_loopback_sample_req_148_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_30_loopback_sample_req_148_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(63), ack => phi_stmt_30_req_1); -- 
    -- Element group rx_concat_CP_3_elements(63) is bound as output of CP function.
    -- CP-element group 64:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 64: predecessors 
    -- CP-element group 64: 	8 
    -- CP-element group 64: successors 
    -- CP-element group 64:  members (1) 
      -- CP-element group 64: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_entry_trigger
      -- 
    rx_concat_CP_3_elements(64) <= rx_concat_CP_3_elements(8);
    -- CP-element group 65:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 65: predecessors 
    -- CP-element group 65: successors 
    -- CP-element group 65:  members (2) 
      -- CP-element group 65: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_entry_sample_req
      -- CP-element group 65: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_entry_sample_req_ps
      -- 
    phi_stmt_30_entry_sample_req_151_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_30_entry_sample_req_151_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(65), ack => phi_stmt_30_req_0); -- 
    -- Element group rx_concat_CP_3_elements(65) is bound as output of CP function.
    -- CP-element group 66:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 66: predecessors 
    -- CP-element group 66: successors 
    -- CP-element group 66:  members (2) 
      -- CP-element group 66: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_phi_mux_ack
      -- CP-element group 66: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/phi_stmt_30_phi_mux_ack_ps
      -- 
    phi_stmt_30_phi_mux_ack_154_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 66_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_30_ack_0, ack => rx_concat_CP_3_elements(66)); -- 
    -- CP-element group 67:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 67: predecessors 
    -- CP-element group 67: successors 
    -- CP-element group 67:  members (4) 
      -- CP-element group 67: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_34_sample_start__ps
      -- CP-element group 67: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_34_sample_completed__ps
      -- CP-element group 67: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_34_sample_start_
      -- CP-element group 67: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_34_sample_completed_
      -- 
    -- Element group rx_concat_CP_3_elements(67) is bound as output of CP function.
    -- CP-element group 68:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 68: predecessors 
    -- CP-element group 68: successors 
    -- CP-element group 68: 	70 
    -- CP-element group 68:  members (2) 
      -- CP-element group 68: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_34_update_start__ps
      -- CP-element group 68: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_34_update_start_
      -- 
    -- Element group rx_concat_CP_3_elements(68) is bound as output of CP function.
    -- CP-element group 69:  join  transition  bypass  pipeline-parent 
    -- CP-element group 69: predecessors 
    -- CP-element group 69: 	70 
    -- CP-element group 69: successors 
    -- CP-element group 69:  members (1) 
      -- CP-element group 69: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_34_update_completed__ps
      -- 
    rx_concat_CP_3_elements(69) <= rx_concat_CP_3_elements(70);
    -- CP-element group 70:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 70: predecessors 
    -- CP-element group 70: 	68 
    -- CP-element group 70: successors 
    -- CP-element group 70: 	69 
    -- CP-element group 70:  members (1) 
      -- CP-element group 70: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/type_cast_34_update_completed_
      -- 
    -- Element group rx_concat_CP_3_elements(70) is a control-delay.
    cp_element_70_delay: control_delay_element  generic map(name => " 70_delay", delay_value => 1)  port map(req => rx_concat_CP_3_elements(68), ack => rx_concat_CP_3_elements(70), clk => clk, reset =>reset);
    -- CP-element group 71:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 71: predecessors 
    -- CP-element group 71: successors 
    -- CP-element group 71: 	73 
    -- CP-element group 71:  members (4) 
      -- CP-element group 71: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_sample_start__ps
      -- CP-element group 71: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_sample_start_
      -- CP-element group 71: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_Sample/$entry
      -- CP-element group 71: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_Sample/req
      -- 
    req_175_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_175_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(71), ack => tkeep_75_35_buf_req_0); -- 
    -- Element group rx_concat_CP_3_elements(71) is bound as output of CP function.
    -- CP-element group 72:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 72: predecessors 
    -- CP-element group 72: successors 
    -- CP-element group 72: 	74 
    -- CP-element group 72:  members (4) 
      -- CP-element group 72: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_update_start__ps
      -- CP-element group 72: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_update_start_
      -- CP-element group 72: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_Update/$entry
      -- CP-element group 72: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_Update/req
      -- 
    req_180_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_180_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(72), ack => tkeep_75_35_buf_req_1); -- 
    -- Element group rx_concat_CP_3_elements(72) is bound as output of CP function.
    -- CP-element group 73:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 73: predecessors 
    -- CP-element group 73: 	71 
    -- CP-element group 73: successors 
    -- CP-element group 73:  members (4) 
      -- CP-element group 73: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_sample_completed__ps
      -- CP-element group 73: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_sample_completed_
      -- CP-element group 73: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_Sample/$exit
      -- CP-element group 73: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_Sample/ack
      -- 
    ack_176_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 73_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tkeep_75_35_buf_ack_0, ack => rx_concat_CP_3_elements(73)); -- 
    -- CP-element group 74:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 74: predecessors 
    -- CP-element group 74: 	72 
    -- CP-element group 74: successors 
    -- CP-element group 74:  members (4) 
      -- CP-element group 74: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_update_completed__ps
      -- CP-element group 74: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_update_completed_
      -- CP-element group 74: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_Update/$exit
      -- CP-element group 74: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/R_tkeep_35_Update/ack
      -- 
    ack_181_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 74_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tkeep_75_35_buf_ack_1, ack => rx_concat_CP_3_elements(74)); -- 
    -- CP-element group 75:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 75: predecessors 
    -- CP-element group 75: 	19 
    -- CP-element group 75: 	23 
    -- CP-element group 75: 	42 
    -- CP-element group 75: 	61 
    -- CP-element group 75: marked-predecessors 
    -- CP-element group 75: 	77 
    -- CP-element group 75: successors 
    -- CP-element group 75: 	77 
    -- CP-element group 75:  members (3) 
      -- CP-element group 75: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_sample_start_
      -- CP-element group 75: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_Sample/$entry
      -- CP-element group 75: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_Sample/rr
      -- 
    rr_190_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_190_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(75), ack => CONCAT_u65_u73_118_inst_req_0); -- 
    rx_concat_cp_element_group_75: block -- 
      constant place_capacities: IntegerArray(0 to 4) := (0 => 1,1 => 7,2 => 7,3 => 7,4 => 1);
      constant place_markings: IntegerArray(0 to 4)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 1);
      constant place_delays: IntegerArray(0 to 4) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 1);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_75"; 
      signal preds: BooleanArray(1 to 5); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(19) & rx_concat_CP_3_elements(23) & rx_concat_CP_3_elements(42) & rx_concat_CP_3_elements(61) & rx_concat_CP_3_elements(77);
      gj_rx_concat_cp_element_group_75 : generic_join generic map(name => joinName, number_of_predecessors => 5, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(75), clk => clk, reset => reset); --
    end block;
    -- CP-element group 76:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 76: predecessors 
    -- CP-element group 76: marked-predecessors 
    -- CP-element group 76: 	80 
    -- CP-element group 76: successors 
    -- CP-element group 76: 	78 
    -- CP-element group 76:  members (3) 
      -- CP-element group 76: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_update_start_
      -- CP-element group 76: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_Update/$entry
      -- CP-element group 76: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_Update/cr
      -- 
    cr_195_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_195_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(76), ack => CONCAT_u65_u73_118_inst_req_1); -- 
    rx_concat_cp_element_group_76: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_76"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= rx_concat_CP_3_elements(80);
      gj_rx_concat_cp_element_group_76 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(76), clk => clk, reset => reset); --
    end block;
    -- CP-element group 77:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 77: predecessors 
    -- CP-element group 77: 	75 
    -- CP-element group 77: successors 
    -- CP-element group 77: marked-successors 
    -- CP-element group 77: 	15 
    -- CP-element group 77: 	21 
    -- CP-element group 77: 	38 
    -- CP-element group 77: 	57 
    -- CP-element group 77: 	75 
    -- CP-element group 77:  members (3) 
      -- CP-element group 77: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_sample_completed_
      -- CP-element group 77: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_Sample/$exit
      -- CP-element group 77: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_Sample/ra
      -- 
    ra_191_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 77_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u65_u73_118_inst_ack_0, ack => rx_concat_CP_3_elements(77)); -- 
    -- CP-element group 78:  transition  input  bypass  pipeline-parent 
    -- CP-element group 78: predecessors 
    -- CP-element group 78: 	76 
    -- CP-element group 78: successors 
    -- CP-element group 78: 	79 
    -- CP-element group 78:  members (3) 
      -- CP-element group 78: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_update_completed_
      -- CP-element group 78: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_Update/$exit
      -- CP-element group 78: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/CONCAT_u65_u73_118_Update/ca
      -- 
    ca_196_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 78_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u65_u73_118_inst_ack_1, ack => rx_concat_CP_3_elements(78)); -- 
    -- CP-element group 79:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 79: predecessors 
    -- CP-element group 79: 	19 
    -- CP-element group 79: 	23 
    -- CP-element group 79: 	78 
    -- CP-element group 79: marked-predecessors 
    -- CP-element group 79: 	81 
    -- CP-element group 79: successors 
    -- CP-element group 79: 	80 
    -- CP-element group 79:  members (3) 
      -- CP-element group 79: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_sample_start_
      -- CP-element group 79: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_Sample/$entry
      -- CP-element group 79: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_Sample/req
      -- 
    req_204_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_204_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(79), ack => WPIPE_rx_out_pipe_111_inst_req_0); -- 
    rx_concat_cp_element_group_79: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 7,2 => 1,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_79"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(19) & rx_concat_CP_3_elements(23) & rx_concat_CP_3_elements(78) & rx_concat_CP_3_elements(81);
      gj_rx_concat_cp_element_group_79 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(79), clk => clk, reset => reset); --
    end block;
    -- CP-element group 80:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 80: predecessors 
    -- CP-element group 80: 	79 
    -- CP-element group 80: successors 
    -- CP-element group 80: 	81 
    -- CP-element group 80: marked-successors 
    -- CP-element group 80: 	15 
    -- CP-element group 80: 	21 
    -- CP-element group 80: 	76 
    -- CP-element group 80:  members (6) 
      -- CP-element group 80: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_sample_completed_
      -- CP-element group 80: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_update_start_
      -- CP-element group 80: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_Sample/$exit
      -- CP-element group 80: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_Sample/ack
      -- CP-element group 80: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_Update/$entry
      -- CP-element group 80: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_Update/req
      -- 
    ack_205_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 80_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_rx_out_pipe_111_inst_ack_0, ack => rx_concat_CP_3_elements(80)); -- 
    req_209_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_209_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => rx_concat_CP_3_elements(80), ack => WPIPE_rx_out_pipe_111_inst_req_1); -- 
    -- CP-element group 81:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 81: predecessors 
    -- CP-element group 81: 	80 
    -- CP-element group 81: successors 
    -- CP-element group 81: 	83 
    -- CP-element group 81: marked-successors 
    -- CP-element group 81: 	79 
    -- CP-element group 81:  members (3) 
      -- CP-element group 81: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_update_completed_
      -- CP-element group 81: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_Update/$exit
      -- CP-element group 81: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/WPIPE_rx_out_pipe_111_Update/ack
      -- 
    ack_210_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 81_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_rx_out_pipe_111_inst_ack_1, ack => rx_concat_CP_3_elements(81)); -- 
    -- CP-element group 82:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 82: predecessors 
    -- CP-element group 82: 	9 
    -- CP-element group 82: successors 
    -- CP-element group 82: 	10 
    -- CP-element group 82:  members (1) 
      -- CP-element group 82: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group rx_concat_CP_3_elements(82) is a control-delay.
    cp_element_82_delay: control_delay_element  generic map(name => " 82_delay", delay_value => 1)  port map(req => rx_concat_CP_3_elements(9), ack => rx_concat_CP_3_elements(82), clk => clk, reset =>reset);
    -- CP-element group 83:  join  transition  bypass  pipeline-parent 
    -- CP-element group 83: predecessors 
    -- CP-element group 83: 	81 
    -- CP-element group 83: 	12 
    -- CP-element group 83: successors 
    -- CP-element group 83: 	6 
    -- CP-element group 83:  members (1) 
      -- CP-element group 83: 	 branch_block_stmt_12/do_while_stmt_13/do_while_stmt_13_loop_body/$exit
      -- 
    rx_concat_cp_element_group_83: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "rx_concat_cp_element_group_83"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= rx_concat_CP_3_elements(81) & rx_concat_CP_3_elements(12);
      gj_rx_concat_cp_element_group_83 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => rx_concat_CP_3_elements(83), clk => clk, reset => reset); --
    end block;
    -- CP-element group 84:  transition  input  bypass  pipeline-parent 
    -- CP-element group 84: predecessors 
    -- CP-element group 84: 	5 
    -- CP-element group 84: successors 
    -- CP-element group 84:  members (2) 
      -- CP-element group 84: 	 branch_block_stmt_12/do_while_stmt_13/loop_exit/$exit
      -- CP-element group 84: 	 branch_block_stmt_12/do_while_stmt_13/loop_exit/ack
      -- 
    ack_215_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 84_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_13_branch_ack_0, ack => rx_concat_CP_3_elements(84)); -- 
    -- CP-element group 85:  transition  input  bypass  pipeline-parent 
    -- CP-element group 85: predecessors 
    -- CP-element group 85: 	5 
    -- CP-element group 85: successors 
    -- CP-element group 85:  members (2) 
      -- CP-element group 85: 	 branch_block_stmt_12/do_while_stmt_13/loop_taken/$exit
      -- CP-element group 85: 	 branch_block_stmt_12/do_while_stmt_13/loop_taken/ack
      -- 
    ack_219_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 85_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_13_branch_ack_1, ack => rx_concat_CP_3_elements(85)); -- 
    -- CP-element group 86:  transition  bypass  pipeline-parent 
    -- CP-element group 86: predecessors 
    -- CP-element group 86: 	3 
    -- CP-element group 86: successors 
    -- CP-element group 86: 	1 
    -- CP-element group 86:  members (1) 
      -- CP-element group 86: 	 branch_block_stmt_12/do_while_stmt_13/$exit
      -- 
    rx_concat_CP_3_elements(86) <= rx_concat_CP_3_elements(3);
    rx_concat_do_while_stmt_13_terminator_220: loop_terminator -- 
      generic map (name => " rx_concat_do_while_stmt_13_terminator_220", max_iterations_in_flight =>7) 
      port map(loop_body_exit => rx_concat_CP_3_elements(6),loop_continue => rx_concat_CP_3_elements(85),loop_terminate => rx_concat_CP_3_elements(84),loop_back => rx_concat_CP_3_elements(4),loop_exit => rx_concat_CP_3_elements(3),clk => clk, reset => reset); -- 
    phi_stmt_18_phi_seq_94_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= rx_concat_CP_3_elements(26);
      rx_concat_CP_3_elements(29)<= src_sample_reqs(0);
      src_sample_acks(0)  <= rx_concat_CP_3_elements(29);
      rx_concat_CP_3_elements(30)<= src_update_reqs(0);
      src_update_acks(0)  <= rx_concat_CP_3_elements(31);
      rx_concat_CP_3_elements(27) <= phi_mux_reqs(0);
      triggers(1)  <= rx_concat_CP_3_elements(24);
      rx_concat_CP_3_elements(33)<= src_sample_reqs(1);
      src_sample_acks(1)  <= rx_concat_CP_3_elements(35);
      rx_concat_CP_3_elements(34)<= src_update_reqs(1);
      src_update_acks(1)  <= rx_concat_CP_3_elements(36);
      rx_concat_CP_3_elements(25) <= phi_mux_reqs(1);
      phi_stmt_18_phi_seq_94 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_18_phi_seq_94") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => rx_concat_CP_3_elements(11), 
          phi_sample_ack => rx_concat_CP_3_elements(22), 
          phi_update_req => rx_concat_CP_3_elements(13), 
          phi_update_ack => rx_concat_CP_3_elements(23), 
          phi_mux_ack => rx_concat_CP_3_elements(28), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_24_phi_seq_138_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= rx_concat_CP_3_elements(43);
      rx_concat_CP_3_elements(48)<= src_sample_reqs(0);
      src_sample_acks(0)  <= rx_concat_CP_3_elements(50);
      rx_concat_CP_3_elements(49)<= src_update_reqs(0);
      src_update_acks(0)  <= rx_concat_CP_3_elements(51);
      rx_concat_CP_3_elements(44) <= phi_mux_reqs(0);
      triggers(1)  <= rx_concat_CP_3_elements(45);
      rx_concat_CP_3_elements(52)<= src_sample_reqs(1);
      src_sample_acks(1)  <= rx_concat_CP_3_elements(52);
      rx_concat_CP_3_elements(53)<= src_update_reqs(1);
      src_update_acks(1)  <= rx_concat_CP_3_elements(54);
      rx_concat_CP_3_elements(46) <= phi_mux_reqs(1);
      phi_stmt_24_phi_seq_138 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_24_phi_seq_138") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => rx_concat_CP_3_elements(39), 
          phi_sample_ack => rx_concat_CP_3_elements(40), 
          phi_update_req => rx_concat_CP_3_elements(41), 
          phi_update_ack => rx_concat_CP_3_elements(42), 
          phi_mux_ack => rx_concat_CP_3_elements(47), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_30_phi_seq_182_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= rx_concat_CP_3_elements(64);
      rx_concat_CP_3_elements(67)<= src_sample_reqs(0);
      src_sample_acks(0)  <= rx_concat_CP_3_elements(67);
      rx_concat_CP_3_elements(68)<= src_update_reqs(0);
      src_update_acks(0)  <= rx_concat_CP_3_elements(69);
      rx_concat_CP_3_elements(65) <= phi_mux_reqs(0);
      triggers(1)  <= rx_concat_CP_3_elements(62);
      rx_concat_CP_3_elements(71)<= src_sample_reqs(1);
      src_sample_acks(1)  <= rx_concat_CP_3_elements(73);
      rx_concat_CP_3_elements(72)<= src_update_reqs(1);
      src_update_acks(1)  <= rx_concat_CP_3_elements(74);
      rx_concat_CP_3_elements(63) <= phi_mux_reqs(1);
      phi_stmt_30_phi_seq_182 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_30_phi_seq_182") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => rx_concat_CP_3_elements(58), 
          phi_sample_ack => rx_concat_CP_3_elements(59), 
          phi_update_req => rx_concat_CP_3_elements(60), 
          phi_update_ack => rx_concat_CP_3_elements(61), 
          phi_mux_ack => rx_concat_CP_3_elements(66), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_28_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= rx_concat_CP_3_elements(7);
        preds(1)  <= rx_concat_CP_3_elements(8);
        entry_tmerge_28 : transition_merge -- 
          generic map(name => " entry_tmerge_28")
          port map (preds => preds, symbol_out => rx_concat_CP_3_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal ADD_u4_u4_59_wire : std_logic_vector(3 downto 0);
    signal BITSEL_u10_u1_114_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u10_u1_44_wire : std_logic_vector(0 downto 0);
    signal CONCAT_u1_u65_116_wire : std_logic_vector(64 downto 0);
    signal CONCAT_u56_u64_91_wire : std_logic_vector(63 downto 0);
    signal CONCAT_u65_u73_118_wire : std_logic_vector(72 downto 0);
    signal EQ_u1_u1_46_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_40_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_52_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_65_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_85_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_54_wire : std_logic_vector(0 downto 0);
    signal OR_u64_u64_99_wire : std_logic_vector(63 downto 0);
    signal OR_u8_u8_73_wire : std_logic_vector(7 downto 0);
    signal RPIPE_rx_in_pipe_17_wire : std_logic_vector(9 downto 0);
    signal RX_15 : std_logic_vector(9 downto 0);
    signal R_Eight_79_wire_constant : std_logic_vector(31 downto 0);
    signal SHL_u64_u64_98_wire : std_logic_vector(63 downto 0);
    signal SHL_u8_u8_72_wire : std_logic_vector(7 downto 0);
    signal count_18 : std_logic_vector(3 downto 0);
    signal konst_113_wire_constant : std_logic_vector(9 downto 0);
    signal konst_121_wire_constant : std_logic_vector(0 downto 0);
    signal konst_39_wire_constant : std_logic_vector(3 downto 0);
    signal konst_43_wire_constant : std_logic_vector(9 downto 0);
    signal konst_45_wire_constant : std_logic_vector(0 downto 0);
    signal konst_51_wire_constant : std_logic_vector(3 downto 0);
    signal konst_58_wire_constant : std_logic_vector(3 downto 0);
    signal konst_64_wire_constant : std_logic_vector(3 downto 0);
    signal konst_66_wire_constant : std_logic_vector(7 downto 0);
    signal konst_84_wire_constant : std_logic_vector(3 downto 0);
    signal ncount_61 : std_logic_vector(3 downto 0);
    signal ncount_61_23_buffered : std_logic_vector(3 downto 0);
    signal prevSendData_24 : std_logic_vector(63 downto 0);
    signal prev_tkeep_30 : std_logic_vector(7 downto 0);
    signal sendData_101 : std_logic_vector(63 downto 0);
    signal sendData_101_26_buffered : std_logic_vector(63 downto 0);
    signal sendtopipe_48 : std_logic_vector(0 downto 0);
    signal shift_data_81 : std_logic_vector(31 downto 0);
    signal slice_90_wire : std_logic_vector(7 downto 0);
    signal slice_94_wire : std_logic_vector(7 downto 0);
    signal tkeep_75 : std_logic_vector(7 downto 0);
    signal tkeep_75_35_buffered : std_logic_vector(7 downto 0);
    signal type_cast_22_wire_constant : std_logic_vector(3 downto 0);
    signal type_cast_29_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_34_wire_constant : std_logic_vector(7 downto 0);
    signal type_cast_56_wire_constant : std_logic_vector(3 downto 0);
    signal type_cast_69_wire_constant : std_logic_vector(7 downto 0);
    signal type_cast_71_wire : std_logic_vector(7 downto 0);
    signal type_cast_78_wire : std_logic_vector(31 downto 0);
    signal type_cast_88_wire_constant : std_logic_vector(55 downto 0);
    signal type_cast_95_wire : std_logic_vector(63 downto 0);
    signal type_cast_97_wire : std_logic_vector(63 downto 0);
    -- 
  begin -- 
    R_Eight_79_wire_constant <= "00000000000000000000000000001000";
    konst_113_wire_constant <= "0000001001";
    konst_121_wire_constant <= "1";
    konst_39_wire_constant <= "0111";
    konst_43_wire_constant <= "0000001001";
    konst_45_wire_constant <= "1";
    konst_51_wire_constant <= "0111";
    konst_58_wire_constant <= "0001";
    konst_64_wire_constant <= "0000";
    konst_66_wire_constant <= "00000001";
    konst_84_wire_constant <= "0000";
    type_cast_22_wire_constant <= "0000";
    type_cast_29_wire_constant <= "0000000000000000000000000000000000000000000000000000000000000000";
    type_cast_34_wire_constant <= "00000000";
    type_cast_56_wire_constant <= "0000";
    type_cast_69_wire_constant <= "00000001";
    type_cast_88_wire_constant <= "00000000000000000000000000000000000000000000000000000000";
    phi_stmt_18: Block -- phi operator 
      signal idata: std_logic_vector(7 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_22_wire_constant & ncount_61_23_buffered;
      req <= phi_stmt_18_req_0 & phi_stmt_18_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_18",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 4) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_18_ack_0,
          idata => idata,
          odata => count_18,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_18
    phi_stmt_24: Block -- phi operator 
      signal idata: std_logic_vector(127 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= sendData_101_26_buffered & type_cast_29_wire_constant;
      req <= phi_stmt_24_req_0 & phi_stmt_24_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_24",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 64) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_24_ack_0,
          idata => idata,
          odata => prevSendData_24,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_24
    phi_stmt_30: Block -- phi operator 
      signal idata: std_logic_vector(15 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_34_wire_constant & tkeep_75_35_buffered;
      req <= phi_stmt_30_req_0 & phi_stmt_30_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_30",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 8) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_30_ack_0,
          idata => idata,
          odata => prev_tkeep_30,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_30
    -- flow-through select operator MUX_100_inst
    sendData_101 <= CONCAT_u56_u64_91_wire when (EQ_u4_u1_85_wire(0) /=  '0') else OR_u64_u64_99_wire;
    -- flow-through select operator MUX_60_inst
    ncount_61 <= type_cast_56_wire_constant when (OR_u1_u1_54_wire(0) /=  '0') else ADD_u4_u4_59_wire;
    -- flow-through select operator MUX_74_inst
    tkeep_75 <= konst_66_wire_constant when (EQ_u4_u1_65_wire(0) /=  '0') else OR_u8_u8_73_wire;
    -- flow-through slice operator slice_90_inst
    slice_90_wire <= RX_15(8 downto 1);
    -- flow-through slice operator slice_94_inst
    slice_94_wire <= RX_15(8 downto 1);
    ncount_61_23_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= ncount_61_23_buf_req_0;
      ncount_61_23_buf_ack_0<= wack(0);
      rreq(0) <= ncount_61_23_buf_req_1;
      ncount_61_23_buf_ack_1<= rack(0);
      ncount_61_23_buf : InterlockBuffer generic map ( -- 
        name => "ncount_61_23_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 4,
        out_data_width => 4,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => ncount_61,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => ncount_61_23_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    sendData_101_26_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= sendData_101_26_buf_req_0;
      sendData_101_26_buf_ack_0<= wack(0);
      rreq(0) <= sendData_101_26_buf_req_1;
      sendData_101_26_buf_ack_1<= rack(0);
      sendData_101_26_buf : InterlockBuffer generic map ( -- 
        name => "sendData_101_26_buf",
        buffer_size => 1,
        flow_through =>  false ,
        cut_through =>  false ,
        in_data_width => 64,
        out_data_width => 64,
        bypass_flag =>  false 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => sendData_101,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => sendData_101_26_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- interlock ssrc_phi_stmt_15
    process(RPIPE_rx_in_pipe_17_wire) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 9 downto 0) := RPIPE_rx_in_pipe_17_wire(9 downto 0);
      RX_15 <= tmp_var; -- 
    end process;
    tkeep_75_35_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= tkeep_75_35_buf_req_0;
      tkeep_75_35_buf_ack_0<= wack(0);
      rreq(0) <= tkeep_75_35_buf_req_1;
      tkeep_75_35_buf_ack_1<= rack(0);
      tkeep_75_35_buf : InterlockBuffer generic map ( -- 
        name => "tkeep_75_35_buf",
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
        write_data => tkeep_75,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => tkeep_75_35_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- interlock type_cast_71_inst
    process(count_18) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 3 downto 0) := count_18(3 downto 0);
      type_cast_71_wire <= tmp_var; -- 
    end process;
    -- interlock type_cast_78_inst
    process(count_18) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 3 downto 0) := count_18(3 downto 0);
      type_cast_78_wire <= tmp_var; -- 
    end process;
    -- interlock type_cast_95_inst
    process(slice_94_wire) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 7 downto 0) := slice_94_wire(7 downto 0);
      type_cast_95_wire <= tmp_var; -- 
    end process;
    -- interlock type_cast_97_inst
    process(shift_data_81) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 31 downto 0) := shift_data_81(31 downto 0);
      type_cast_97_wire <= tmp_var; -- 
    end process;
    do_while_stmt_13_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_121_wire_constant;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_13_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_13_branch_req_0,
          ack0 => do_while_stmt_13_branch_ack_0,
          ack1 => do_while_stmt_13_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator ADD_u4_u4_59_inst
    process(count_18) -- 
      variable tmp_var : std_logic_vector(3 downto 0); -- 
    begin -- 
      ApIntAdd_proc(count_18, konst_58_wire_constant, tmp_var);
      ADD_u4_u4_59_wire <= tmp_var; --
    end process;
    -- binary operator BITSEL_u10_u1_114_inst
    process(RX_15) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(RX_15, konst_113_wire_constant, tmp_var);
      BITSEL_u10_u1_114_wire <= tmp_var; --
    end process;
    -- binary operator BITSEL_u10_u1_44_inst
    process(RX_15) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(RX_15, konst_43_wire_constant, tmp_var);
      BITSEL_u10_u1_44_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u1_u65_116_inst
    process(BITSEL_u10_u1_114_wire, sendData_101) -- 
      variable tmp_var : std_logic_vector(64 downto 0); -- 
    begin -- 
      ApConcat_proc(BITSEL_u10_u1_114_wire, sendData_101, tmp_var);
      CONCAT_u1_u65_116_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u56_u64_91_inst
    process(type_cast_88_wire_constant, slice_90_wire) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      ApConcat_proc(type_cast_88_wire_constant, slice_90_wire, tmp_var);
      CONCAT_u56_u64_91_wire <= tmp_var; --
    end process;
    -- shared split operator group (5) : CONCAT_u65_u73_118_inst 
    ApConcat_group_5: Block -- 
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
      data_in <= CONCAT_u1_u65_116_wire & tkeep_75;
      CONCAT_u65_u73_118_wire <= data_out(72 downto 0);
      guard_vector(0)  <= sendtopipe_48(0);
      reqL_unguarded(0) <= CONCAT_u65_u73_118_inst_req_0;
      CONCAT_u65_u73_118_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= CONCAT_u65_u73_118_inst_req_1;
      CONCAT_u65_u73_118_inst_ack_1 <= ackR_unguarded(0);
      ApConcat_group_5_gI: SplitGuardInterface generic map(name => "ApConcat_group_5_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
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
          name => "ApConcat_group_5",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 65,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 8, 
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
    end Block; -- split operator group 5
    -- binary operator EQ_u1_u1_46_inst
    process(BITSEL_u10_u1_44_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(BITSEL_u10_u1_44_wire, konst_45_wire_constant, tmp_var);
      EQ_u1_u1_46_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_40_inst
    process(count_18) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(count_18, konst_39_wire_constant, tmp_var);
      EQ_u4_u1_40_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_52_inst
    process(count_18) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(count_18, konst_51_wire_constant, tmp_var);
      EQ_u4_u1_52_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_65_inst
    process(count_18) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(count_18, konst_64_wire_constant, tmp_var);
      EQ_u4_u1_65_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_85_inst
    process(count_18) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(count_18, konst_84_wire_constant, tmp_var);
      EQ_u4_u1_85_wire <= tmp_var; --
    end process;
    -- binary operator MUL_u32_u32_80_inst
    process(type_cast_78_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntMul_proc(type_cast_78_wire, R_Eight_79_wire_constant, tmp_var);
      shift_data_81 <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_47_inst
    process(EQ_u4_u1_40_wire, EQ_u1_u1_46_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u4_u1_40_wire, EQ_u1_u1_46_wire, tmp_var);
      sendtopipe_48 <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_54_inst
    process(EQ_u4_u1_52_wire, sendtopipe_48) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u4_u1_52_wire, sendtopipe_48, tmp_var);
      OR_u1_u1_54_wire <= tmp_var; --
    end process;
    -- binary operator OR_u64_u64_99_inst
    process(prevSendData_24, SHL_u64_u64_98_wire) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      ApIntOr_proc(prevSendData_24, SHL_u64_u64_98_wire, tmp_var);
      OR_u64_u64_99_wire <= tmp_var; --
    end process;
    -- binary operator OR_u8_u8_73_inst
    process(prev_tkeep_30, SHL_u8_u8_72_wire) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      ApIntOr_proc(prev_tkeep_30, SHL_u8_u8_72_wire, tmp_var);
      OR_u8_u8_73_wire <= tmp_var; --
    end process;
    -- binary operator SHL_u64_u64_98_inst
    process(type_cast_95_wire, type_cast_97_wire) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      ApIntSHL_proc(type_cast_95_wire, type_cast_97_wire, tmp_var);
      SHL_u64_u64_98_wire <= tmp_var; --
    end process;
    -- binary operator SHL_u8_u8_72_inst
    process(type_cast_69_wire_constant, type_cast_71_wire) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      ApIntSHL_proc(type_cast_69_wire_constant, type_cast_71_wire, tmp_var);
      SHL_u8_u8_72_wire <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_rx_in_pipe_17_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(9 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_rx_in_pipe_17_inst_req_0;
      RPIPE_rx_in_pipe_17_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_rx_in_pipe_17_inst_req_1;
      RPIPE_rx_in_pipe_17_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      RPIPE_rx_in_pipe_17_wire <= data_out(9 downto 0);
      rx_in_pipe_read_0_gI: SplitGuardInterface generic map(name => "rx_in_pipe_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
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
      rx_in_pipe_read_0: InputPortRevised -- 
        generic map ( name => "rx_in_pipe_read_0", data_width => 10,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => rx_in_pipe_pipe_read_req(0),
          oack => rx_in_pipe_pipe_read_ack(0),
          odata => rx_in_pipe_pipe_read_data(9 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_rx_out_pipe_111_inst 
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
      sample_req_unguarded(0) <= WPIPE_rx_out_pipe_111_inst_req_0;
      WPIPE_rx_out_pipe_111_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_rx_out_pipe_111_inst_req_1;
      WPIPE_rx_out_pipe_111_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= sendtopipe_48(0);
      data_in <= CONCAT_u65_u73_118_wire;
      rx_out_pipe_write_0_gI: SplitGuardInterface generic map(name => "rx_out_pipe_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      rx_out_pipe_write_0: OutputPortRevised -- 
        generic map ( name => "rx_out_pipe", data_width => 73, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => rx_out_pipe_pipe_write_req(0),
          oack => rx_out_pipe_pipe_write_ack(0),
          odata => rx_out_pipe_pipe_write_data(72 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end rx_concat_arch;
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
use ahir.functionLibraryComponents.all;
library rx_concat_system_global_package;
use rx_concat_system_global_package.rx_concat_system_global_package.all;
entity rx_concat_system is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    rx_in_pipe_pipe_write_data: in std_logic_vector(9 downto 0);
    rx_in_pipe_pipe_write_req : in std_logic_vector(0 downto 0);
    rx_in_pipe_pipe_write_ack : out std_logic_vector(0 downto 0);
    rx_out_pipe_pipe_read_data: out std_logic_vector(72 downto 0);
    rx_out_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
    rx_out_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture rx_concat_system_arch  of rx_concat_system is -- system-architecture 
  -- declarations related to module rx_concat
  component rx_concat is -- 
    generic (tag_length : integer); 
    port ( -- 
      rx_in_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      rx_in_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      rx_in_pipe_pipe_read_data : in   std_logic_vector(9 downto 0);
      rx_out_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      rx_out_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      rx_out_pipe_pipe_write_data : out  std_logic_vector(72 downto 0);
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
  -- argument signals for module rx_concat
  signal rx_concat_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal rx_concat_tag_out   : std_logic_vector(1 downto 0);
  signal rx_concat_start_req : std_logic;
  signal rx_concat_start_ack : std_logic;
  signal rx_concat_fin_req   : std_logic;
  signal rx_concat_fin_ack : std_logic;
  -- aggregate signals for read from pipe rx_in_pipe
  signal rx_in_pipe_pipe_read_data: std_logic_vector(9 downto 0);
  signal rx_in_pipe_pipe_read_req: std_logic_vector(0 downto 0);
  signal rx_in_pipe_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe rx_out_pipe
  signal rx_out_pipe_pipe_write_data: std_logic_vector(72 downto 0);
  signal rx_out_pipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal rx_out_pipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module rx_concat
  rx_concat_instance:rx_concat-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => rx_concat_start_req,
      start_ack => rx_concat_start_ack,
      fin_req => rx_concat_fin_req,
      fin_ack => rx_concat_fin_ack,
      clk => clk,
      reset => reset,
      rx_in_pipe_pipe_read_req => rx_in_pipe_pipe_read_req(0 downto 0),
      rx_in_pipe_pipe_read_ack => rx_in_pipe_pipe_read_ack(0 downto 0),
      rx_in_pipe_pipe_read_data => rx_in_pipe_pipe_read_data(9 downto 0),
      rx_out_pipe_pipe_write_req => rx_out_pipe_pipe_write_req(0 downto 0),
      rx_out_pipe_pipe_write_ack => rx_out_pipe_pipe_write_ack(0 downto 0),
      rx_out_pipe_pipe_write_data => rx_out_pipe_pipe_write_data(72 downto 0),
      tag_in => rx_concat_tag_in,
      tag_out => rx_concat_tag_out-- 
    ); -- 
  -- module will be run forever 
  rx_concat_tag_in <= (others => '0');
  rx_concat_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => rx_concat_start_req, start_ack => rx_concat_start_ack,  fin_req => rx_concat_fin_req,  fin_ack => rx_concat_fin_ack);
  rx_in_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe rx_in_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 10,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => rx_in_pipe_pipe_read_req,
      read_ack => rx_in_pipe_pipe_read_ack,
      read_data => rx_in_pipe_pipe_read_data,
      write_req => rx_in_pipe_pipe_write_req,
      write_ack => rx_in_pipe_pipe_write_ack,
      write_data => rx_in_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  rx_out_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe rx_out_pipe",
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
      read_req => rx_out_pipe_pipe_read_req,
      read_ack => rx_out_pipe_pipe_read_ack,
      read_data => rx_out_pipe_pipe_read_data,
      write_req => rx_out_pipe_pipe_write_req,
      write_ack => rx_out_pipe_pipe_write_ack,
      write_data => rx_out_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- gated clock generators 
  -- 
end rx_concat_system_arch;
