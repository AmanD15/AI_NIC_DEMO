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
library tx_deconcat_system_global_package;
use tx_deconcat_system_global_package.tx_deconcat_system_global_package.all;
entity tx_deconcat is -- 
  generic (tag_length : integer); 
  port ( -- 
    tx_in_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
    tx_in_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
    tx_in_pipe_pipe_read_data : in   std_logic_vector(72 downto 0);
    tx_out_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    tx_out_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    tx_out_pipe_pipe_write_data : out  std_logic_vector(9 downto 0);
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
end entity tx_deconcat;
architecture tx_deconcat_arch of tx_deconcat is -- 
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
  signal tx_deconcat_CP_3_start: Boolean;
  signal tx_deconcat_CP_3_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal do_while_stmt_36_branch_req_0 : boolean;
  signal phi_stmt_38_req_1 : boolean;
  signal phi_stmt_38_req_0 : boolean;
  signal phi_stmt_38_ack_0 : boolean;
  signal ncount_94_43_buf_req_0 : boolean;
  signal ncount_94_43_buf_ack_0 : boolean;
  signal ncount_94_43_buf_req_1 : boolean;
  signal ncount_94_43_buf_ack_1 : boolean;
  signal do_while_stmt_36_branch_ack_0 : boolean;
  signal phi_stmt_44_req_1 : boolean;
  signal phi_stmt_44_req_0 : boolean;
  signal phi_stmt_44_ack_0 : boolean;
  signal data_19_46_buf_req_0 : boolean;
  signal data_19_46_buf_ack_0 : boolean;
  signal data_19_46_buf_req_1 : boolean;
  signal data_19_46_buf_ack_1 : boolean;
  signal nsenddata_72_47_buf_req_0 : boolean;
  signal nsenddata_72_47_buf_ack_0 : boolean;
  signal nsenddata_72_47_buf_req_1 : boolean;
  signal nsenddata_72_47_buf_ack_1 : boolean;
  signal WPIPE_tx_out_pipe_95_inst_req_0 : boolean;
  signal WPIPE_tx_out_pipe_95_inst_ack_0 : boolean;
  signal WPIPE_tx_out_pipe_95_inst_req_1 : boolean;
  signal WPIPE_tx_out_pipe_95_inst_ack_1 : boolean;
  signal do_while_stmt_36_branch_ack_1 : boolean;
  signal if_stmt_109_branch_req_0 : boolean;
  signal if_stmt_109_branch_ack_1 : boolean;
  signal if_stmt_109_branch_ack_0 : boolean;
  signal RPIPE_tx_in_pipe_12_inst_req_0 : boolean;
  signal RPIPE_tx_in_pipe_12_inst_ack_0 : boolean;
  signal RPIPE_tx_in_pipe_12_inst_req_1 : boolean;
  signal RPIPE_tx_in_pipe_12_inst_ack_1 : boolean;
  signal phi_stmt_10_req_0 : boolean;
  signal RPIPE_tx_in_pipe_13_inst_req_0 : boolean;
  signal RPIPE_tx_in_pipe_13_inst_ack_0 : boolean;
  signal RPIPE_tx_in_pipe_13_inst_req_1 : boolean;
  signal RPIPE_tx_in_pipe_13_inst_ack_1 : boolean;
  signal phi_stmt_10_req_1 : boolean;
  signal phi_stmt_10_ack_0 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "tx_deconcat_input_buffer", -- 
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
  tx_deconcat_CP_3_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "tx_deconcat_out_buffer", -- 
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
    preds <= tx_deconcat_CP_3_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
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
    preds <= tx_deconcat_CP_3_start & tag_ilock_write_ack_symbol;
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
    preds <= tx_deconcat_CP_3_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  tx_deconcat_CP_3: Block -- control-path 
    signal tx_deconcat_CP_3_elements: BooleanArray(66 downto 0);
    -- 
  begin -- 
    tx_deconcat_CP_3_elements(0) <= tx_deconcat_CP_3_start;
    tx_deconcat_CP_3_symbol <= tx_deconcat_CP_3_elements(60);
    -- CP-element group 0:  branch  transition  place  output  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	61 
    -- CP-element group 0:  members (11) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_8/$entry
      -- CP-element group 0: 	 branch_block_stmt_8/branch_block_stmt_8__entry__
      -- CP-element group 0: 	 branch_block_stmt_8/merge_stmt_9__entry__
      -- CP-element group 0: 	 branch_block_stmt_8/merge_stmt_9_dead_link/$entry
      -- CP-element group 0: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/$entry
      -- CP-element group 0: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/$entry
      -- CP-element group 0: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/$entry
      -- CP-element group 0: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/$entry
      -- CP-element group 0: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/Sample/$entry
      -- CP-element group 0: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/Sample/req
      -- 
    req_220_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_220_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(0), ack => RPIPE_tx_in_pipe_12_inst_req_0); -- 
    -- CP-element group 1:  branch  transition  place  output  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	58 
    -- CP-element group 1: successors 
    -- CP-element group 1: 	60 
    -- CP-element group 1: 	59 
    -- CP-element group 1:  members (23) 
      -- CP-element group 1: 	 branch_block_stmt_8/do_while_stmt_36__exit__
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109__entry__
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_dead_link/$entry
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/$entry
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/$exit
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/$entry
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/$exit
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/BITSEL_u8_u1_112_inputs/$entry
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/BITSEL_u8_u1_112_inputs/$exit
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/$entry
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/$exit
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/Sample/$entry
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/Sample/$exit
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/Sample/rr
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/Sample/ra
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/Update/$entry
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/Update/$exit
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/Update/cr
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/BITSEL_u8_u1_112/SplitProtocol/Update/ca
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_eval_test/branch_req
      -- CP-element group 1: 	 branch_block_stmt_8/BITSEL_u8_u1_112_place
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_if_link/$entry
      -- CP-element group 1: 	 branch_block_stmt_8/if_stmt_109_else_link/$entry
      -- 
    branch_req_190_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " branch_req_190_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(1), ack => if_stmt_109_branch_req_0); -- 
    tx_deconcat_CP_3_elements(1) <= tx_deconcat_CP_3_elements(58);
    -- CP-element group 2:  transition  place  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	66 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	8 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_8/do_while_stmt_36/$entry
      -- CP-element group 2: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36__entry__
      -- 
    tx_deconcat_CP_3_elements(2) <= tx_deconcat_CP_3_elements(66);
    -- CP-element group 3:  merge  place  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	58 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36__exit__
      -- 
    -- Element group tx_deconcat_CP_3_elements(3) is bound as output of CP function.
    -- CP-element group 4:  merge  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	7 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_8/do_while_stmt_36/loop_back
      -- 
    -- Element group tx_deconcat_CP_3_elements(4) is bound as output of CP function.
    -- CP-element group 5:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	10 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	57 
    -- CP-element group 5: 	56 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 branch_block_stmt_8/do_while_stmt_36/condition_done
      -- CP-element group 5: 	 branch_block_stmt_8/do_while_stmt_36/loop_exit/$entry
      -- CP-element group 5: 	 branch_block_stmt_8/do_while_stmt_36/loop_taken/$entry
      -- 
    tx_deconcat_CP_3_elements(5) <= tx_deconcat_CP_3_elements(10);
    -- CP-element group 6:  branch  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	55 
    -- CP-element group 6: successors 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_8/do_while_stmt_36/loop_body_done
      -- 
    tx_deconcat_CP_3_elements(6) <= tx_deconcat_CP_3_elements(55);
    -- CP-element group 7:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	4 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	38 
    -- CP-element group 7: 	21 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/back_edge_to_loop_body
      -- 
    tx_deconcat_CP_3_elements(7) <= tx_deconcat_CP_3_elements(4);
    -- CP-element group 8:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	2 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	40 
    -- CP-element group 8: 	23 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/first_time_through_loop_body
      -- 
    tx_deconcat_CP_3_elements(8) <= tx_deconcat_CP_3_elements(2);
    -- CP-element group 9:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	34 
    -- CP-element group 9: 	54 
    -- CP-element group 9: 	35 
    -- CP-element group 9: 	15 
    -- CP-element group 9: 	16 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/$entry
      -- CP-element group 9: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/loop_body_start
      -- 
    -- Element group tx_deconcat_CP_3_elements(9) is bound as output of CP function.
    -- CP-element group 10:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	54 
    -- CP-element group 10: 	14 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	5 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/condition_evaluated
      -- 
    condition_evaluated_36_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_36_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(10), ack => do_while_stmt_36_branch_req_0); -- 
    tx_deconcat_cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(54) & tx_deconcat_CP_3_elements(14);
      gj_tx_deconcat_cp_element_group_10 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	34 
    -- CP-element group 11: 	15 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	14 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	17 
    -- CP-element group 11:  members (2) 
      -- CP-element group 11: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/aggregated_phi_sample_req
      -- CP-element group 11: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_sample_start__ps
      -- 
    tx_deconcat_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(34) & tx_deconcat_CP_3_elements(15) & tx_deconcat_CP_3_elements(14);
      gj_tx_deconcat_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	36 
    -- CP-element group 12: 	18 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	55 
    -- CP-element group 12: marked-successors 
    -- CP-element group 12: 	34 
    -- CP-element group 12: 	15 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/aggregated_phi_sample_ack
      -- CP-element group 12: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_sample_completed_
      -- CP-element group 12: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_sample_completed_
      -- 
    tx_deconcat_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(36) & tx_deconcat_CP_3_elements(18);
      gj_tx_deconcat_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	35 
    -- CP-element group 13: 	16 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	19 
    -- CP-element group 13:  members (2) 
      -- CP-element group 13: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/aggregated_phi_update_req
      -- CP-element group 13: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_update_start__ps
      -- 
    tx_deconcat_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(35) & tx_deconcat_CP_3_elements(16);
      gj_tx_deconcat_cp_element_group_13 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	37 
    -- CP-element group 14: 	20 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	10 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	11 
    -- CP-element group 14:  members (1) 
      -- CP-element group 14: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/aggregated_phi_update_ack
      -- 
    tx_deconcat_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(37) & tx_deconcat_CP_3_elements(20);
      gj_tx_deconcat_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	9 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	12 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	11 
    -- CP-element group 15:  members (1) 
      -- CP-element group 15: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_sample_start_
      -- 
    tx_deconcat_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(9) & tx_deconcat_CP_3_elements(12);
      gj_tx_deconcat_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  join  transition  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	9 
    -- CP-element group 16: marked-predecessors 
    -- CP-element group 16: 	52 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	13 
    -- CP-element group 16:  members (1) 
      -- CP-element group 16: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_update_start_
      -- 
    tx_deconcat_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(9) & tx_deconcat_CP_3_elements(52);
      gj_tx_deconcat_cp_element_group_16 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	11 
    -- CP-element group 17: successors 
    -- CP-element group 17:  members (1) 
      -- CP-element group 17: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_sample_start__ps
      -- 
    tx_deconcat_CP_3_elements(17) <= tx_deconcat_CP_3_elements(11);
    -- CP-element group 18:  join  transition  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	12 
    -- CP-element group 18:  members (1) 
      -- CP-element group 18: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_sample_completed__ps
      -- 
    -- Element group tx_deconcat_CP_3_elements(18) is bound as output of CP function.
    -- CP-element group 19:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	13 
    -- CP-element group 19: successors 
    -- CP-element group 19:  members (1) 
      -- CP-element group 19: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_update_start__ps
      -- 
    tx_deconcat_CP_3_elements(19) <= tx_deconcat_CP_3_elements(13);
    -- CP-element group 20:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	51 
    -- CP-element group 20: 	14 
    -- CP-element group 20:  members (2) 
      -- CP-element group 20: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_update_completed_
      -- CP-element group 20: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_update_completed__ps
      -- 
    -- Element group tx_deconcat_CP_3_elements(20) is bound as output of CP function.
    -- CP-element group 21:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	7 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (1) 
      -- CP-element group 21: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_loopback_trigger
      -- 
    tx_deconcat_CP_3_elements(21) <= tx_deconcat_CP_3_elements(7);
    -- CP-element group 22:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: successors 
    -- CP-element group 22:  members (2) 
      -- CP-element group 22: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_loopback_sample_req
      -- CP-element group 22: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_loopback_sample_req_ps
      -- 
    phi_stmt_38_loopback_sample_req_51_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_38_loopback_sample_req_51_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(22), ack => phi_stmt_38_req_1); -- 
    -- Element group tx_deconcat_CP_3_elements(22) is bound as output of CP function.
    -- CP-element group 23:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	8 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (1) 
      -- CP-element group 23: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_entry_trigger
      -- 
    tx_deconcat_CP_3_elements(23) <= tx_deconcat_CP_3_elements(8);
    -- CP-element group 24:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: successors 
    -- CP-element group 24:  members (2) 
      -- CP-element group 24: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_entry_sample_req
      -- CP-element group 24: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_entry_sample_req_ps
      -- 
    phi_stmt_38_entry_sample_req_54_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_38_entry_sample_req_54_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(24), ack => phi_stmt_38_req_0); -- 
    -- Element group tx_deconcat_CP_3_elements(24) is bound as output of CP function.
    -- CP-element group 25:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: successors 
    -- CP-element group 25:  members (2) 
      -- CP-element group 25: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_phi_mux_ack
      -- CP-element group 25: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_38_phi_mux_ack_ps
      -- 
    phi_stmt_38_phi_mux_ack_57_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 25_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_38_ack_0, ack => tx_deconcat_CP_3_elements(25)); -- 
    -- CP-element group 26:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: successors 
    -- CP-element group 26:  members (4) 
      -- CP-element group 26: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/type_cast_42_sample_start__ps
      -- CP-element group 26: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/type_cast_42_sample_completed__ps
      -- CP-element group 26: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/type_cast_42_sample_start_
      -- CP-element group 26: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/type_cast_42_sample_completed_
      -- 
    -- Element group tx_deconcat_CP_3_elements(26) is bound as output of CP function.
    -- CP-element group 27:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: successors 
    -- CP-element group 27: 	29 
    -- CP-element group 27:  members (2) 
      -- CP-element group 27: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/type_cast_42_update_start__ps
      -- CP-element group 27: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/type_cast_42_update_start_
      -- 
    -- Element group tx_deconcat_CP_3_elements(27) is bound as output of CP function.
    -- CP-element group 28:  join  transition  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	29 
    -- CP-element group 28: successors 
    -- CP-element group 28:  members (1) 
      -- CP-element group 28: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/type_cast_42_update_completed__ps
      -- 
    tx_deconcat_CP_3_elements(28) <= tx_deconcat_CP_3_elements(29);
    -- CP-element group 29:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	27 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	28 
    -- CP-element group 29:  members (1) 
      -- CP-element group 29: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/type_cast_42_update_completed_
      -- 
    -- Element group tx_deconcat_CP_3_elements(29) is a control-delay.
    cp_element_29_delay: control_delay_element  generic map(name => " 29_delay", delay_value => 1)  port map(req => tx_deconcat_CP_3_elements(27), ack => tx_deconcat_CP_3_elements(29), clk => clk, reset =>reset);
    -- CP-element group 30:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	32 
    -- CP-element group 30:  members (4) 
      -- CP-element group 30: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_sample_start__ps
      -- CP-element group 30: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_sample_start_
      -- CP-element group 30: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_Sample/$entry
      -- CP-element group 30: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_Sample/req
      -- 
    req_78_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_78_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(30), ack => ncount_94_43_buf_req_0); -- 
    -- Element group tx_deconcat_CP_3_elements(30) is bound as output of CP function.
    -- CP-element group 31:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: successors 
    -- CP-element group 31: 	33 
    -- CP-element group 31:  members (4) 
      -- CP-element group 31: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_update_start__ps
      -- CP-element group 31: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_update_start_
      -- CP-element group 31: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_Update/$entry
      -- CP-element group 31: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_Update/req
      -- 
    req_83_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_83_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(31), ack => ncount_94_43_buf_req_1); -- 
    -- Element group tx_deconcat_CP_3_elements(31) is bound as output of CP function.
    -- CP-element group 32:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	30 
    -- CP-element group 32: successors 
    -- CP-element group 32:  members (4) 
      -- CP-element group 32: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_sample_completed__ps
      -- CP-element group 32: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_sample_completed_
      -- CP-element group 32: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_Sample/$exit
      -- CP-element group 32: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_Sample/ack
      -- 
    ack_79_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 32_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ncount_94_43_buf_ack_0, ack => tx_deconcat_CP_3_elements(32)); -- 
    -- CP-element group 33:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	31 
    -- CP-element group 33: successors 
    -- CP-element group 33:  members (4) 
      -- CP-element group 33: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_update_completed__ps
      -- CP-element group 33: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_update_completed_
      -- CP-element group 33: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_Update/$exit
      -- CP-element group 33: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_ncount_43_Update/ack
      -- 
    ack_84_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 33_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => ncount_94_43_buf_ack_1, ack => tx_deconcat_CP_3_elements(33)); -- 
    -- CP-element group 34:  join  transition  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	9 
    -- CP-element group 34: marked-predecessors 
    -- CP-element group 34: 	12 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	11 
    -- CP-element group 34:  members (1) 
      -- CP-element group 34: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_sample_start_
      -- 
    tx_deconcat_cp_element_group_34: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_34"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(9) & tx_deconcat_CP_3_elements(12);
      gj_tx_deconcat_cp_element_group_34 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(34), clk => clk, reset => reset); --
    end block;
    -- CP-element group 35:  join  transition  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	9 
    -- CP-element group 35: marked-predecessors 
    -- CP-element group 35: 	52 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	13 
    -- CP-element group 35:  members (1) 
      -- CP-element group 35: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_update_start_
      -- 
    tx_deconcat_cp_element_group_35: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_35"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(9) & tx_deconcat_CP_3_elements(52);
      gj_tx_deconcat_cp_element_group_35 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(35), clk => clk, reset => reset); --
    end block;
    -- CP-element group 36:  join  transition  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	12 
    -- CP-element group 36:  members (1) 
      -- CP-element group 36: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_sample_completed__ps
      -- 
    -- Element group tx_deconcat_CP_3_elements(36) is bound as output of CP function.
    -- CP-element group 37:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	51 
    -- CP-element group 37: 	14 
    -- CP-element group 37:  members (2) 
      -- CP-element group 37: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_update_completed_
      -- CP-element group 37: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_update_completed__ps
      -- 
    -- Element group tx_deconcat_CP_3_elements(37) is bound as output of CP function.
    -- CP-element group 38:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	7 
    -- CP-element group 38: successors 
    -- CP-element group 38:  members (1) 
      -- CP-element group 38: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_loopback_trigger
      -- 
    tx_deconcat_CP_3_elements(38) <= tx_deconcat_CP_3_elements(7);
    -- CP-element group 39:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: successors 
    -- CP-element group 39:  members (2) 
      -- CP-element group 39: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_loopback_sample_req
      -- CP-element group 39: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_loopback_sample_req_ps
      -- 
    phi_stmt_44_loopback_sample_req_95_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_44_loopback_sample_req_95_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(39), ack => phi_stmt_44_req_1); -- 
    -- Element group tx_deconcat_CP_3_elements(39) is bound as output of CP function.
    -- CP-element group 40:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: 	8 
    -- CP-element group 40: successors 
    -- CP-element group 40:  members (1) 
      -- CP-element group 40: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_entry_trigger
      -- 
    tx_deconcat_CP_3_elements(40) <= tx_deconcat_CP_3_elements(8);
    -- CP-element group 41:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: successors 
    -- CP-element group 41:  members (2) 
      -- CP-element group 41: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_entry_sample_req
      -- CP-element group 41: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_entry_sample_req_ps
      -- 
    phi_stmt_44_entry_sample_req_98_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_44_entry_sample_req_98_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(41), ack => phi_stmt_44_req_0); -- 
    -- Element group tx_deconcat_CP_3_elements(41) is bound as output of CP function.
    -- CP-element group 42:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: successors 
    -- CP-element group 42:  members (2) 
      -- CP-element group 42: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_phi_mux_ack
      -- CP-element group 42: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/phi_stmt_44_phi_mux_ack_ps
      -- 
    phi_stmt_44_phi_mux_ack_101_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 42_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_44_ack_0, ack => tx_deconcat_CP_3_elements(42)); -- 
    -- CP-element group 43:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: successors 
    -- CP-element group 43: 	45 
    -- CP-element group 43:  members (4) 
      -- CP-element group 43: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_sample_start__ps
      -- CP-element group 43: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_sample_start_
      -- CP-element group 43: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_Sample/$entry
      -- CP-element group 43: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_Sample/req
      -- 
    req_114_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_114_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(43), ack => data_19_46_buf_req_0); -- 
    -- Element group tx_deconcat_CP_3_elements(43) is bound as output of CP function.
    -- CP-element group 44:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: successors 
    -- CP-element group 44: 	46 
    -- CP-element group 44:  members (4) 
      -- CP-element group 44: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_update_start__ps
      -- CP-element group 44: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_update_start_
      -- CP-element group 44: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_Update/$entry
      -- CP-element group 44: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_Update/req
      -- 
    req_119_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_119_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(44), ack => data_19_46_buf_req_1); -- 
    -- Element group tx_deconcat_CP_3_elements(44) is bound as output of CP function.
    -- CP-element group 45:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: 	43 
    -- CP-element group 45: successors 
    -- CP-element group 45:  members (4) 
      -- CP-element group 45: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_sample_completed__ps
      -- CP-element group 45: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_sample_completed_
      -- CP-element group 45: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_Sample/$exit
      -- CP-element group 45: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_Sample/ack
      -- 
    ack_115_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 45_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => data_19_46_buf_ack_0, ack => tx_deconcat_CP_3_elements(45)); -- 
    -- CP-element group 46:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: 	44 
    -- CP-element group 46: successors 
    -- CP-element group 46:  members (4) 
      -- CP-element group 46: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_update_completed__ps
      -- CP-element group 46: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_update_completed_
      -- CP-element group 46: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_Update/$exit
      -- CP-element group 46: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_data_46_Update/ack
      -- 
    ack_120_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 46_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => data_19_46_buf_ack_1, ack => tx_deconcat_CP_3_elements(46)); -- 
    -- CP-element group 47:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: successors 
    -- CP-element group 47: 	49 
    -- CP-element group 47:  members (4) 
      -- CP-element group 47: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_sample_start__ps
      -- CP-element group 47: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_sample_start_
      -- CP-element group 47: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_Sample/$entry
      -- CP-element group 47: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_Sample/req
      -- 
    req_132_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_132_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(47), ack => nsenddata_72_47_buf_req_0); -- 
    -- Element group tx_deconcat_CP_3_elements(47) is bound as output of CP function.
    -- CP-element group 48:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: successors 
    -- CP-element group 48: 	50 
    -- CP-element group 48:  members (4) 
      -- CP-element group 48: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_update_start__ps
      -- CP-element group 48: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_update_start_
      -- CP-element group 48: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_Update/$entry
      -- CP-element group 48: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_Update/req
      -- 
    req_137_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_137_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(48), ack => nsenddata_72_47_buf_req_1); -- 
    -- Element group tx_deconcat_CP_3_elements(48) is bound as output of CP function.
    -- CP-element group 49:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: 	47 
    -- CP-element group 49: successors 
    -- CP-element group 49:  members (4) 
      -- CP-element group 49: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_sample_completed__ps
      -- CP-element group 49: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_sample_completed_
      -- CP-element group 49: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_Sample/$exit
      -- CP-element group 49: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_Sample/ack
      -- 
    ack_133_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 49_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nsenddata_72_47_buf_ack_0, ack => tx_deconcat_CP_3_elements(49)); -- 
    -- CP-element group 50:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: 	48 
    -- CP-element group 50: successors 
    -- CP-element group 50:  members (4) 
      -- CP-element group 50: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_update_completed__ps
      -- CP-element group 50: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_update_completed_
      -- CP-element group 50: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_Update/$exit
      -- CP-element group 50: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/R_nsenddata_47_Update/ack
      -- 
    ack_138_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 50_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => nsenddata_72_47_buf_ack_1, ack => tx_deconcat_CP_3_elements(50)); -- 
    -- CP-element group 51:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: 	37 
    -- CP-element group 51: 	20 
    -- CP-element group 51: marked-predecessors 
    -- CP-element group 51: 	53 
    -- CP-element group 51: successors 
    -- CP-element group 51: 	52 
    -- CP-element group 51:  members (3) 
      -- CP-element group 51: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_sample_start_
      -- CP-element group 51: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_Sample/$entry
      -- CP-element group 51: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_Sample/req
      -- 
    req_147_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_147_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(51), ack => WPIPE_tx_out_pipe_95_inst_req_0); -- 
    tx_deconcat_cp_element_group_51: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 7,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_51"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(37) & tx_deconcat_CP_3_elements(20) & tx_deconcat_CP_3_elements(53);
      gj_tx_deconcat_cp_element_group_51 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(51), clk => clk, reset => reset); --
    end block;
    -- CP-element group 52:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 52: predecessors 
    -- CP-element group 52: 	51 
    -- CP-element group 52: successors 
    -- CP-element group 52: 	53 
    -- CP-element group 52: marked-successors 
    -- CP-element group 52: 	35 
    -- CP-element group 52: 	16 
    -- CP-element group 52:  members (6) 
      -- CP-element group 52: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_sample_completed_
      -- CP-element group 52: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_update_start_
      -- CP-element group 52: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_Sample/$exit
      -- CP-element group 52: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_Sample/ack
      -- CP-element group 52: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_Update/$entry
      -- CP-element group 52: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_Update/req
      -- 
    ack_148_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 52_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_tx_out_pipe_95_inst_ack_0, ack => tx_deconcat_CP_3_elements(52)); -- 
    req_152_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_152_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(52), ack => WPIPE_tx_out_pipe_95_inst_req_1); -- 
    -- CP-element group 53:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 53: predecessors 
    -- CP-element group 53: 	52 
    -- CP-element group 53: successors 
    -- CP-element group 53: 	55 
    -- CP-element group 53: marked-successors 
    -- CP-element group 53: 	51 
    -- CP-element group 53:  members (3) 
      -- CP-element group 53: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_update_completed_
      -- CP-element group 53: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_Update/$exit
      -- CP-element group 53: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/WPIPE_tx_out_pipe_95_Update/ack
      -- 
    ack_153_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 53_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_tx_out_pipe_95_inst_ack_1, ack => tx_deconcat_CP_3_elements(53)); -- 
    -- CP-element group 54:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 54: predecessors 
    -- CP-element group 54: 	9 
    -- CP-element group 54: successors 
    -- CP-element group 54: 	10 
    -- CP-element group 54:  members (1) 
      -- CP-element group 54: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group tx_deconcat_CP_3_elements(54) is a control-delay.
    cp_element_54_delay: control_delay_element  generic map(name => " 54_delay", delay_value => 1)  port map(req => tx_deconcat_CP_3_elements(9), ack => tx_deconcat_CP_3_elements(54), clk => clk, reset =>reset);
    -- CP-element group 55:  join  transition  bypass  pipeline-parent 
    -- CP-element group 55: predecessors 
    -- CP-element group 55: 	53 
    -- CP-element group 55: 	12 
    -- CP-element group 55: successors 
    -- CP-element group 55: 	6 
    -- CP-element group 55:  members (1) 
      -- CP-element group 55: 	 branch_block_stmt_8/do_while_stmt_36/do_while_stmt_36_loop_body/$exit
      -- 
    tx_deconcat_cp_element_group_55: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 7);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 31) := "tx_deconcat_cp_element_group_55"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= tx_deconcat_CP_3_elements(53) & tx_deconcat_CP_3_elements(12);
      gj_tx_deconcat_cp_element_group_55 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => tx_deconcat_CP_3_elements(55), clk => clk, reset => reset); --
    end block;
    -- CP-element group 56:  transition  input  bypass  pipeline-parent 
    -- CP-element group 56: predecessors 
    -- CP-element group 56: 	5 
    -- CP-element group 56: successors 
    -- CP-element group 56:  members (2) 
      -- CP-element group 56: 	 branch_block_stmt_8/do_while_stmt_36/loop_exit/$exit
      -- CP-element group 56: 	 branch_block_stmt_8/do_while_stmt_36/loop_exit/ack
      -- 
    ack_158_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 56_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_36_branch_ack_0, ack => tx_deconcat_CP_3_elements(56)); -- 
    -- CP-element group 57:  transition  input  bypass  pipeline-parent 
    -- CP-element group 57: predecessors 
    -- CP-element group 57: 	5 
    -- CP-element group 57: successors 
    -- CP-element group 57:  members (2) 
      -- CP-element group 57: 	 branch_block_stmt_8/do_while_stmt_36/loop_taken/$exit
      -- CP-element group 57: 	 branch_block_stmt_8/do_while_stmt_36/loop_taken/ack
      -- 
    ack_162_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 57_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_36_branch_ack_1, ack => tx_deconcat_CP_3_elements(57)); -- 
    -- CP-element group 58:  transition  bypass  pipeline-parent 
    -- CP-element group 58: predecessors 
    -- CP-element group 58: 	3 
    -- CP-element group 58: successors 
    -- CP-element group 58: 	1 
    -- CP-element group 58:  members (1) 
      -- CP-element group 58: 	 branch_block_stmt_8/do_while_stmt_36/$exit
      -- 
    tx_deconcat_CP_3_elements(58) <= tx_deconcat_CP_3_elements(3);
    -- CP-element group 59:  transition  place  input  output  bypass 
    -- CP-element group 59: predecessors 
    -- CP-element group 59: 	1 
    -- CP-element group 59: successors 
    -- CP-element group 59: 	63 
    -- CP-element group 59:  members (9) 
      -- CP-element group 59: 	 branch_block_stmt_8/if_stmt_109_if_link/$exit
      -- CP-element group 59: 	 branch_block_stmt_8/if_stmt_109_if_link/if_choice_transition
      -- CP-element group 59: 	 branch_block_stmt_8/outer_loopback
      -- CP-element group 59: 	 branch_block_stmt_8/outer_loopback_PhiReq/$entry
      -- CP-element group 59: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/$entry
      -- CP-element group 59: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/$entry
      -- CP-element group 59: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/$entry
      -- CP-element group 59: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/Sample/$entry
      -- CP-element group 59: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/Sample/req
      -- 
    if_choice_transition_195_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 59_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_109_branch_ack_1, ack => tx_deconcat_CP_3_elements(59)); -- 
    req_243_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_243_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(59), ack => RPIPE_tx_in_pipe_13_inst_req_0); -- 
    -- CP-element group 60:  merge  transition  place  input  bypass 
    -- CP-element group 60: predecessors 
    -- CP-element group 60: 	1 
    -- CP-element group 60: successors 
    -- CP-element group 60:  members (6) 
      -- CP-element group 60: 	 $exit
      -- CP-element group 60: 	 branch_block_stmt_8/$exit
      -- CP-element group 60: 	 branch_block_stmt_8/branch_block_stmt_8__exit__
      -- CP-element group 60: 	 branch_block_stmt_8/if_stmt_109__exit__
      -- CP-element group 60: 	 branch_block_stmt_8/if_stmt_109_else_link/$exit
      -- CP-element group 60: 	 branch_block_stmt_8/if_stmt_109_else_link/else_choice_transition
      -- 
    else_choice_transition_199_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 60_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_109_branch_ack_0, ack => tx_deconcat_CP_3_elements(60)); -- 
    -- CP-element group 61:  transition  input  output  bypass 
    -- CP-element group 61: predecessors 
    -- CP-element group 61: 	0 
    -- CP-element group 61: successors 
    -- CP-element group 61: 	62 
    -- CP-element group 61:  members (4) 
      -- CP-element group 61: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/Sample/$exit
      -- CP-element group 61: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/Sample/ack
      -- CP-element group 61: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/Update/$entry
      -- CP-element group 61: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/Update/req
      -- 
    ack_221_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 61_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_tx_in_pipe_12_inst_ack_0, ack => tx_deconcat_CP_3_elements(61)); -- 
    req_225_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_225_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(61), ack => RPIPE_tx_in_pipe_12_inst_req_1); -- 
    -- CP-element group 62:  transition  input  output  bypass 
    -- CP-element group 62: predecessors 
    -- CP-element group 62: 	61 
    -- CP-element group 62: successors 
    -- CP-element group 62: 	65 
    -- CP-element group 62:  members (7) 
      -- CP-element group 62: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/$exit
      -- CP-element group 62: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/$exit
      -- CP-element group 62: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/$exit
      -- CP-element group 62: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/$exit
      -- CP-element group 62: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/Update/$exit
      -- CP-element group 62: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_12/Update/ack
      -- CP-element group 62: 	 branch_block_stmt_8/merge_stmt_9__entry___PhiReq/phi_stmt_10/phi_stmt_10_req
      -- 
    ack_226_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 62_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_tx_in_pipe_12_inst_ack_1, ack => tx_deconcat_CP_3_elements(62)); -- 
    phi_stmt_10_req_227_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_10_req_227_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(62), ack => phi_stmt_10_req_0); -- 
    -- CP-element group 63:  transition  input  output  bypass 
    -- CP-element group 63: predecessors 
    -- CP-element group 63: 	59 
    -- CP-element group 63: successors 
    -- CP-element group 63: 	64 
    -- CP-element group 63:  members (4) 
      -- CP-element group 63: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/Sample/$exit
      -- CP-element group 63: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/Sample/ack
      -- CP-element group 63: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/Update/$entry
      -- CP-element group 63: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/Update/req
      -- 
    ack_244_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 63_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_tx_in_pipe_13_inst_ack_0, ack => tx_deconcat_CP_3_elements(63)); -- 
    req_248_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_248_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(63), ack => RPIPE_tx_in_pipe_13_inst_req_1); -- 
    -- CP-element group 64:  transition  input  output  bypass 
    -- CP-element group 64: predecessors 
    -- CP-element group 64: 	63 
    -- CP-element group 64: successors 
    -- CP-element group 64: 	65 
    -- CP-element group 64:  members (7) 
      -- CP-element group 64: 	 branch_block_stmt_8/outer_loopback_PhiReq/$exit
      -- CP-element group 64: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/$exit
      -- CP-element group 64: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/$exit
      -- CP-element group 64: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/$exit
      -- CP-element group 64: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/Update/$exit
      -- CP-element group 64: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_sources/RPIPE_tx_in_pipe_13/Update/ack
      -- CP-element group 64: 	 branch_block_stmt_8/outer_loopback_PhiReq/phi_stmt_10/phi_stmt_10_req
      -- 
    ack_249_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 64_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_tx_in_pipe_13_inst_ack_1, ack => tx_deconcat_CP_3_elements(64)); -- 
    phi_stmt_10_req_250_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_10_req_250_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => tx_deconcat_CP_3_elements(64), ack => phi_stmt_10_req_1); -- 
    -- CP-element group 65:  merge  transition  place  bypass 
    -- CP-element group 65: predecessors 
    -- CP-element group 65: 	62 
    -- CP-element group 65: 	64 
    -- CP-element group 65: successors 
    -- CP-element group 65: 	66 
    -- CP-element group 65:  members (2) 
      -- CP-element group 65: 	 branch_block_stmt_8/merge_stmt_9_PhiReqMerge
      -- CP-element group 65: 	 branch_block_stmt_8/merge_stmt_9_PhiAck/$entry
      -- 
    tx_deconcat_CP_3_elements(65) <= OrReduce(tx_deconcat_CP_3_elements(62) & tx_deconcat_CP_3_elements(64));
    -- CP-element group 66:  merge  transition  place  input  bypass 
    -- CP-element group 66: predecessors 
    -- CP-element group 66: 	65 
    -- CP-element group 66: successors 
    -- CP-element group 66: 	2 
    -- CP-element group 66:  members (8) 
      -- CP-element group 66: 	 branch_block_stmt_8/merge_stmt_9__exit__
      -- CP-element group 66: 	 branch_block_stmt_8/assign_stmt_19_to_assign_stmt_30__entry__
      -- CP-element group 66: 	 branch_block_stmt_8/assign_stmt_19_to_assign_stmt_30__exit__
      -- CP-element group 66: 	 branch_block_stmt_8/do_while_stmt_36__entry__
      -- CP-element group 66: 	 branch_block_stmt_8/assign_stmt_19_to_assign_stmt_30/$entry
      -- CP-element group 66: 	 branch_block_stmt_8/assign_stmt_19_to_assign_stmt_30/$exit
      -- CP-element group 66: 	 branch_block_stmt_8/merge_stmt_9_PhiAck/$exit
      -- CP-element group 66: 	 branch_block_stmt_8/merge_stmt_9_PhiAck/phi_stmt_10_ack
      -- 
    phi_stmt_10_ack_255_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 66_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_10_ack_0, ack => tx_deconcat_CP_3_elements(66)); -- 
    tx_deconcat_do_while_stmt_36_terminator_163: loop_terminator -- 
      generic map (name => " tx_deconcat_do_while_stmt_36_terminator_163", max_iterations_in_flight =>7) 
      port map(loop_body_exit => tx_deconcat_CP_3_elements(6),loop_continue => tx_deconcat_CP_3_elements(57),loop_terminate => tx_deconcat_CP_3_elements(56),loop_back => tx_deconcat_CP_3_elements(4),loop_exit => tx_deconcat_CP_3_elements(3),clk => clk, reset => reset); -- 
    phi_stmt_38_phi_seq_85_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= tx_deconcat_CP_3_elements(23);
      tx_deconcat_CP_3_elements(26)<= src_sample_reqs(0);
      src_sample_acks(0)  <= tx_deconcat_CP_3_elements(26);
      tx_deconcat_CP_3_elements(27)<= src_update_reqs(0);
      src_update_acks(0)  <= tx_deconcat_CP_3_elements(28);
      tx_deconcat_CP_3_elements(24) <= phi_mux_reqs(0);
      triggers(1)  <= tx_deconcat_CP_3_elements(21);
      tx_deconcat_CP_3_elements(30)<= src_sample_reqs(1);
      src_sample_acks(1)  <= tx_deconcat_CP_3_elements(32);
      tx_deconcat_CP_3_elements(31)<= src_update_reqs(1);
      src_update_acks(1)  <= tx_deconcat_CP_3_elements(33);
      tx_deconcat_CP_3_elements(22) <= phi_mux_reqs(1);
      phi_stmt_38_phi_seq_85 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_38_phi_seq_85") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => tx_deconcat_CP_3_elements(17), 
          phi_sample_ack => tx_deconcat_CP_3_elements(18), 
          phi_update_req => tx_deconcat_CP_3_elements(19), 
          phi_update_ack => tx_deconcat_CP_3_elements(20), 
          phi_mux_ack => tx_deconcat_CP_3_elements(25), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_44_phi_seq_139_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= tx_deconcat_CP_3_elements(40);
      tx_deconcat_CP_3_elements(43)<= src_sample_reqs(0);
      src_sample_acks(0)  <= tx_deconcat_CP_3_elements(45);
      tx_deconcat_CP_3_elements(44)<= src_update_reqs(0);
      src_update_acks(0)  <= tx_deconcat_CP_3_elements(46);
      tx_deconcat_CP_3_elements(41) <= phi_mux_reqs(0);
      triggers(1)  <= tx_deconcat_CP_3_elements(38);
      tx_deconcat_CP_3_elements(47)<= src_sample_reqs(1);
      src_sample_acks(1)  <= tx_deconcat_CP_3_elements(49);
      tx_deconcat_CP_3_elements(48)<= src_update_reqs(1);
      src_update_acks(1)  <= tx_deconcat_CP_3_elements(50);
      tx_deconcat_CP_3_elements(39) <= phi_mux_reqs(1);
      phi_stmt_44_phi_seq_139 : phi_sequencer_v2-- 
        generic map (place_capacity => 7, ntriggers => 2, name => "phi_stmt_44_phi_seq_139") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => tx_deconcat_CP_3_elements(11), 
          phi_sample_ack => tx_deconcat_CP_3_elements(36), 
          phi_update_req => tx_deconcat_CP_3_elements(13), 
          phi_update_ack => tx_deconcat_CP_3_elements(37), 
          phi_mux_ack => tx_deconcat_CP_3_elements(42), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_37_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= tx_deconcat_CP_3_elements(7);
        preds(1)  <= tx_deconcat_CP_3_elements(8);
        entry_tmerge_37 : transition_merge -- 
          generic map(name => " entry_tmerge_37")
          port map (preds => preds, symbol_out => tx_deconcat_CP_3_elements(9));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal ADD_u4_u4_61_wire : std_logic_vector(3 downto 0);
    signal ADD_u4_u4_92_wire : std_logic_vector(3 downto 0);
    signal BITSEL_u8_u1_112_wire : std_logic_vector(0 downto 0);
    signal BITSEL_u8_u1_62_wire : std_logic_vector(0 downto 0);
    signal CONCAT_u1_u9_81_wire : std_logic_vector(8 downto 0);
    signal EQ_u1_u1_64_wire : std_logic_vector(0 downto 0);
    signal EQ_u4_u1_57_wire : std_logic_vector(0 downto 0);
    signal MUX_78_wire : std_logic_vector(0 downto 0);
    signal NOT_u1_u1_108_wire : std_logic_vector(0 downto 0);
    signal RPIPE_tx_in_pipe_12_wire : std_logic_vector(72 downto 0);
    signal RPIPE_tx_in_pipe_13_wire : std_logic_vector(72 downto 0);
    signal RX_10 : std_logic_vector(72 downto 0);
    signal count_38 : std_logic_vector(3 downto 0);
    signal data_19 : std_logic_vector(63 downto 0);
    signal data_19_46_buffered : std_logic_vector(63 downto 0);
    signal data_to_send_85 : std_logic_vector(9 downto 0);
    signal konst_111_wire_constant : std_logic_vector(7 downto 0);
    signal konst_27_wire_constant : std_logic_vector(72 downto 0);
    signal konst_56_wire_constant : std_logic_vector(3 downto 0);
    signal konst_60_wire_constant : std_logic_vector(3 downto 0);
    signal konst_63_wire_constant : std_logic_vector(0 downto 0);
    signal konst_91_wire_constant : std_logic_vector(3 downto 0);
    signal ncount_94 : std_logic_vector(3 downto 0);
    signal ncount_94_43_buffered : std_logic_vector(3 downto 0);
    signal nsenddata_72 : std_logic_vector(63 downto 0);
    signal nsenddata_72_47_buffered : std_logic_vector(63 downto 0);
    signal send_53 : std_logic_vector(0 downto 0);
    signal senddata_44 : std_logic_vector(63 downto 0);
    signal sendtlast_66 : std_logic_vector(0 downto 0);
    signal slice_80_wire : std_logic_vector(7 downto 0);
    signal tkeep_24 : std_logic_vector(7 downto 0);
    signal tlast_30 : std_logic_vector(0 downto 0);
    signal type_cast_42_wire_constant : std_logic_vector(3 downto 0);
    signal type_cast_70_wire_constant : std_logic_vector(63 downto 0);
    signal type_cast_77_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_83_wire_constant : std_logic_vector(0 downto 0);
    signal type_cast_89_wire_constant : std_logic_vector(3 downto 0);
    -- 
  begin -- 
    konst_111_wire_constant <= "00000000";
    konst_27_wire_constant <= "0000000000000000000000000000000000000000000000000000000000000000001001000";
    konst_56_wire_constant <= "0111";
    konst_60_wire_constant <= "0001";
    konst_63_wire_constant <= "0";
    konst_91_wire_constant <= "0001";
    type_cast_42_wire_constant <= "0000";
    type_cast_70_wire_constant <= "0000000000000000000000000000000000000000000000000000000000001000";
    type_cast_77_wire_constant <= "0";
    type_cast_83_wire_constant <= "0";
    type_cast_89_wire_constant <= "0000";
    phi_stmt_10: Block -- phi operator 
      signal idata: std_logic_vector(145 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= RPIPE_tx_in_pipe_12_wire & RPIPE_tx_in_pipe_13_wire;
      req <= phi_stmt_10_req_0 & phi_stmt_10_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_10",
          num_reqs => 2,
          bypass_flag => false,
          data_width => 73) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_10_ack_0,
          idata => idata,
          odata => RX_10,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_10
    phi_stmt_38: Block -- phi operator 
      signal idata: std_logic_vector(7 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_42_wire_constant & ncount_94_43_buffered;
      req <= phi_stmt_38_req_0 & phi_stmt_38_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_38",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 4) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_38_ack_0,
          idata => idata,
          odata => count_38,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_38
    phi_stmt_44: Block -- phi operator 
      signal idata: std_logic_vector(127 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= data_19_46_buffered & nsenddata_72_47_buffered;
      req <= phi_stmt_44_req_0 & phi_stmt_44_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_44",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 64) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_44_ack_0,
          idata => idata,
          odata => senddata_44,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_44
    -- flow-through select operator MUX_78_inst
    MUX_78_wire <= tlast_30 when (sendtlast_66(0) /=  '0') else type_cast_77_wire_constant;
    -- flow-through select operator MUX_93_inst
    ncount_94 <= type_cast_89_wire_constant when (sendtlast_66(0) /=  '0') else ADD_u4_u4_92_wire;
    -- flow-through slice operator slice_18_inst
    data_19 <= RX_10(71 downto 8);
    -- flow-through slice operator slice_23_inst
    tkeep_24 <= RX_10(7 downto 0);
    -- flow-through slice operator slice_80_inst
    slice_80_wire <= senddata_44(7 downto 0);
    data_19_46_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= data_19_46_buf_req_0;
      data_19_46_buf_ack_0<= wack(0);
      rreq(0) <= data_19_46_buf_req_1;
      data_19_46_buf_ack_1<= rack(0);
      data_19_46_buf : InterlockBuffer generic map ( -- 
        name => "data_19_46_buf",
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
        write_data => data_19,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => data_19_46_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    ncount_94_43_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= ncount_94_43_buf_req_0;
      ncount_94_43_buf_ack_0<= wack(0);
      rreq(0) <= ncount_94_43_buf_req_1;
      ncount_94_43_buf_ack_1<= rack(0);
      ncount_94_43_buf : InterlockBuffer generic map ( -- 
        name => "ncount_94_43_buf",
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
        write_data => ncount_94,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => ncount_94_43_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    nsenddata_72_47_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= nsenddata_72_47_buf_req_0;
      nsenddata_72_47_buf_ack_0<= wack(0);
      rreq(0) <= nsenddata_72_47_buf_req_1;
      nsenddata_72_47_buf_ack_1<= rack(0);
      nsenddata_72_47_buf : InterlockBuffer generic map ( -- 
        name => "nsenddata_72_47_buf",
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
        write_data => nsenddata_72,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => nsenddata_72_47_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    do_while_stmt_36_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= NOT_u1_u1_108_wire;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_36_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_36_branch_req_0,
          ack0 => do_while_stmt_36_branch_ack_0,
          ack1 => do_while_stmt_36_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_109_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= BITSEL_u8_u1_112_wire;
      branch_instance: BranchBase -- 
        generic map( name => "if_stmt_109_branch", condition_width => 1,  bypass_flag => false)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_109_branch_req_0,
          ack0 => if_stmt_109_branch_ack_0,
          ack1 => if_stmt_109_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator ADD_u4_u4_61_inst
    process(count_38) -- 
      variable tmp_var : std_logic_vector(3 downto 0); -- 
    begin -- 
      ApIntAdd_proc(count_38, konst_60_wire_constant, tmp_var);
      ADD_u4_u4_61_wire <= tmp_var; --
    end process;
    -- binary operator ADD_u4_u4_92_inst
    process(count_38) -- 
      variable tmp_var : std_logic_vector(3 downto 0); -- 
    begin -- 
      ApIntAdd_proc(count_38, konst_91_wire_constant, tmp_var);
      ADD_u4_u4_92_wire <= tmp_var; --
    end process;
    -- binary operator BITSEL_u73_u1_28_inst
    process(RX_10) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(RX_10, konst_27_wire_constant, tmp_var);
      tlast_30 <= tmp_var; --
    end process;
    -- binary operator BITSEL_u8_u1_112_inst
    process(tkeep_24) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(tkeep_24, konst_111_wire_constant, tmp_var);
      BITSEL_u8_u1_112_wire <= tmp_var; --
    end process;
    -- binary operator BITSEL_u8_u1_52_inst
    process(tkeep_24, count_38) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(tkeep_24, count_38, tmp_var);
      send_53 <= tmp_var; --
    end process;
    -- binary operator BITSEL_u8_u1_62_inst
    process(tkeep_24, ADD_u4_u4_61_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApBitsel_proc(tkeep_24, ADD_u4_u4_61_wire, tmp_var);
      BITSEL_u8_u1_62_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u1_u9_81_inst
    process(MUX_78_wire, slice_80_wire) -- 
      variable tmp_var : std_logic_vector(8 downto 0); -- 
    begin -- 
      ApConcat_proc(MUX_78_wire, slice_80_wire, tmp_var);
      CONCAT_u1_u9_81_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u9_u10_84_inst
    process(CONCAT_u1_u9_81_wire) -- 
      variable tmp_var : std_logic_vector(9 downto 0); -- 
    begin -- 
      ApConcat_proc(CONCAT_u1_u9_81_wire, type_cast_83_wire_constant, tmp_var);
      data_to_send_85 <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_64_inst
    process(BITSEL_u8_u1_62_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(BITSEL_u8_u1_62_wire, konst_63_wire_constant, tmp_var);
      EQ_u1_u1_64_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u4_u1_57_inst
    process(count_38) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(count_38, konst_56_wire_constant, tmp_var);
      EQ_u4_u1_57_wire <= tmp_var; --
    end process;
    -- binary operator LSHR_u64_u64_71_inst
    process(senddata_44) -- 
      variable tmp_var : std_logic_vector(63 downto 0); -- 
    begin -- 
      ApIntLSHR_proc(senddata_44, type_cast_70_wire_constant, tmp_var);
      nsenddata_72 <= tmp_var; --
    end process;
    -- unary operator NOT_u1_u1_108_inst
    process(sendtlast_66) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", sendtlast_66, tmp_var);
      NOT_u1_u1_108_wire <= tmp_var; -- 
    end process;
    -- binary operator OR_u1_u1_65_inst
    process(EQ_u4_u1_57_wire, EQ_u1_u1_64_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u4_u1_57_wire, EQ_u1_u1_64_wire, tmp_var);
      sendtlast_66 <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_tx_in_pipe_12_inst RPIPE_tx_in_pipe_13_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(145 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 1 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 1 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 1 downto 0);
      signal guard_vector : std_logic_vector( 1 downto 0);
      constant outBUFs : IntegerArray(1 downto 0) := (1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(1 downto 0) := (0 => false, 1 => false);
      constant guardBuffering: IntegerArray(1 downto 0)  := (0 => 2, 1 => 2);
      -- 
    begin -- 
      reqL_unguarded(1) <= RPIPE_tx_in_pipe_12_inst_req_0;
      reqL_unguarded(0) <= RPIPE_tx_in_pipe_13_inst_req_0;
      RPIPE_tx_in_pipe_12_inst_ack_0 <= ackL_unguarded(1);
      RPIPE_tx_in_pipe_13_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(1) <= RPIPE_tx_in_pipe_12_inst_req_1;
      reqR_unguarded(0) <= RPIPE_tx_in_pipe_13_inst_req_1;
      RPIPE_tx_in_pipe_12_inst_ack_1 <= ackR_unguarded(1);
      RPIPE_tx_in_pipe_13_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      RPIPE_tx_in_pipe_12_wire <= data_out(145 downto 73);
      RPIPE_tx_in_pipe_13_wire <= data_out(72 downto 0);
      tx_in_pipe_read_0_gI: SplitGuardInterface generic map(name => "tx_in_pipe_read_0_gI", nreqs => 2, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
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
      tx_in_pipe_read_0: InputPortRevised -- 
        generic map ( name => "tx_in_pipe_read_0", data_width => 73,  num_reqs => 2,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => tx_in_pipe_pipe_read_req(0),
          oack => tx_in_pipe_pipe_read_ack(0),
          odata => tx_in_pipe_pipe_read_data(72 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_tx_out_pipe_95_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(9 downto 0);
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
      sample_req_unguarded(0) <= WPIPE_tx_out_pipe_95_inst_req_0;
      WPIPE_tx_out_pipe_95_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_tx_out_pipe_95_inst_req_1;
      WPIPE_tx_out_pipe_95_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= data_to_send_85;
      tx_out_pipe_write_0_gI: SplitGuardInterface generic map(name => "tx_out_pipe_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      tx_out_pipe_write_0: OutputPortRevised -- 
        generic map ( name => "tx_out_pipe", data_width => 10, num_reqs => 1, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => tx_out_pipe_pipe_write_req(0),
          oack => tx_out_pipe_pipe_write_ack(0),
          odata => tx_out_pipe_pipe_write_data(9 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end tx_deconcat_arch;
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
library tx_deconcat_system_global_package;
use tx_deconcat_system_global_package.tx_deconcat_system_global_package.all;
entity tx_deconcat_system is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    tx_in_pipe_pipe_write_data: in std_logic_vector(72 downto 0);
    tx_in_pipe_pipe_write_req : in std_logic_vector(0 downto 0);
    tx_in_pipe_pipe_write_ack : out std_logic_vector(0 downto 0);
    tx_out_pipe_pipe_read_data: out std_logic_vector(9 downto 0);
    tx_out_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
    tx_out_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture tx_deconcat_system_arch  of tx_deconcat_system is -- system-architecture 
  -- declarations related to module tx_deconcat
  component tx_deconcat is -- 
    generic (tag_length : integer); 
    port ( -- 
      tx_in_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      tx_in_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      tx_in_pipe_pipe_read_data : in   std_logic_vector(72 downto 0);
      tx_out_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      tx_out_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      tx_out_pipe_pipe_write_data : out  std_logic_vector(9 downto 0);
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
  -- argument signals for module tx_deconcat
  signal tx_deconcat_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal tx_deconcat_tag_out   : std_logic_vector(1 downto 0);
  signal tx_deconcat_start_req : std_logic;
  signal tx_deconcat_start_ack : std_logic;
  signal tx_deconcat_fin_req   : std_logic;
  signal tx_deconcat_fin_ack : std_logic;
  -- aggregate signals for read from pipe tx_in_pipe
  signal tx_in_pipe_pipe_read_data: std_logic_vector(72 downto 0);
  signal tx_in_pipe_pipe_read_req: std_logic_vector(0 downto 0);
  signal tx_in_pipe_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe tx_out_pipe
  signal tx_out_pipe_pipe_write_data: std_logic_vector(9 downto 0);
  signal tx_out_pipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal tx_out_pipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module tx_deconcat
  tx_deconcat_instance:tx_deconcat-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => tx_deconcat_start_req,
      start_ack => tx_deconcat_start_ack,
      fin_req => tx_deconcat_fin_req,
      fin_ack => tx_deconcat_fin_ack,
      clk => clk,
      reset => reset,
      tx_in_pipe_pipe_read_req => tx_in_pipe_pipe_read_req(0 downto 0),
      tx_in_pipe_pipe_read_ack => tx_in_pipe_pipe_read_ack(0 downto 0),
      tx_in_pipe_pipe_read_data => tx_in_pipe_pipe_read_data(72 downto 0),
      tx_out_pipe_pipe_write_req => tx_out_pipe_pipe_write_req(0 downto 0),
      tx_out_pipe_pipe_write_ack => tx_out_pipe_pipe_write_ack(0 downto 0),
      tx_out_pipe_pipe_write_data => tx_out_pipe_pipe_write_data(9 downto 0),
      tag_in => tx_deconcat_tag_in,
      tag_out => tx_deconcat_tag_out-- 
    ); -- 
  -- module will be run forever 
  tx_deconcat_tag_in <= (others => '0');
  tx_deconcat_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => tx_deconcat_start_req, start_ack => tx_deconcat_start_ack,  fin_req => tx_deconcat_fin_req,  fin_ack => tx_deconcat_fin_ack);
  tx_in_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe tx_in_pipe",
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
      read_req => tx_in_pipe_pipe_read_req,
      read_ack => tx_in_pipe_pipe_read_ack,
      read_data => tx_in_pipe_pipe_read_data,
      write_req => tx_in_pipe_pipe_write_req,
      write_ack => tx_in_pipe_pipe_write_ack,
      write_data => tx_in_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  tx_out_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe tx_out_pipe",
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
      read_req => tx_out_pipe_pipe_read_req,
      read_ack => tx_out_pipe_pipe_read_ack,
      read_data => tx_out_pipe_pipe_read_data,
      write_req => tx_out_pipe_pipe_write_req,
      write_ack => tx_out_pipe_pipe_write_ack,
      write_data => tx_out_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- gated clock generators 
  -- 
end tx_deconcat_system_arch;
