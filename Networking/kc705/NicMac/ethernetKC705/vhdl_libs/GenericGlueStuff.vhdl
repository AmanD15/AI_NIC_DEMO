library ieee;
use ieee.std_logic_1164.all;

package GenericGlueStuffComponents is
    component generic_transaction_mux is
	generic (request_data_width: integer := 32;
			response_data_width: integer := 32;
			   request_noblock_flag: boolean := true;
				request_valid_index: integer := 31;
			   	   response_noblock_flag: boolean := true;
					response_valid_index: integer := 31;
						lock_flag: boolean := false;
							lock_index: integer := 0;
						           queue_depth: integer := 8;
								output_queue_depth: integer := 2;
								output_queue_bypass: boolean := true);
	port (
		request_0_pipe_write_req  : in std_logic_vector(0 downto 0);	
		request_0_pipe_write_ack  : out std_logic_vector(0 downto 0);	
		request_0_pipe_write_data : in std_logic_vector(request_data_width-1 downto 0);	
    		response_0_pipe_read_req  : in  std_logic_vector(0 downto 0);
    		response_0_pipe_read_ack  : out   std_logic_vector(0 downto 0);
    		response_0_pipe_read_data : out  std_logic_vector(response_data_width-1 downto 0);
		request_1_pipe_write_req  : in std_logic_vector(0 downto 0);	
		request_1_pipe_write_ack  : out std_logic_vector(0 downto 0);	
		request_1_pipe_write_data : in std_logic_vector(request_data_width-1 downto 0);	
    		response_1_pipe_read_req  : in  std_logic_vector(0 downto 0);
    		response_1_pipe_read_ack  : out   std_logic_vector(0 downto 0);
    		response_1_pipe_read_data : out  std_logic_vector(response_data_width-1 downto 0);
		muxed_request_pipe_read_req: in std_logic_vector(0 downto 0);
		muxed_request_pipe_read_ack: out std_logic_vector(0 downto 0);
		muxed_request_pipe_read_data: out std_logic_vector(request_data_width-1 downto 0);
		muxed_response_pipe_write_req: in std_logic_vector(0 downto 0);
		muxed_response_pipe_write_ack: out std_logic_vector(0 downto 0);
		muxed_response_pipe_write_data: in std_logic_vector(response_data_width-1 downto 0);
		clk, reset: in std_logic
		);
    end component generic_transaction_mux;

    component generic_transaction_demux is
	  generic (request_data_width: integer := 32;
		     request_routing_section_width: integer := 16;
		       request_routing_section_low_index: integer := 0;
			 response_data_width: integer := 32;
			   tap_mode : boolean := false;
			      request_noblock_flag: boolean := true;
				request_valid_index: integer := 31;
			   	   response_noblock_flag: boolean := true;
					response_valid_index: integer := 31;
						queue_depth: integer := 8);
	  port (
		request_pipe_write_req  : in std_logic_vector(0 downto 0);	
		request_pipe_write_ack  : out std_logic_vector(0 downto 0);	
		request_pipe_write_data : in std_logic_vector(request_data_width-1 downto 0);	
    		response_pipe_read_req  : in  std_logic_vector(0 downto 0);
    		response_pipe_read_ack  : out   std_logic_vector(0 downto 0);
    		response_pipe_read_data : out  std_logic_vector(response_data_width-1 downto 0);
		demuxed_request_0_pipe_read_req: in std_logic_vector(0 downto 0);
		demuxed_request_0_pipe_read_ack: out std_logic_vector(0 downto 0);
		demuxed_request_0_pipe_read_data: out std_logic_vector(request_data_width-1 downto 0);
		demuxed_response_0_pipe_write_req: in std_logic_vector(0 downto 0);
		demuxed_response_0_pipe_write_ack: out std_logic_vector(0 downto 0);
		demuxed_response_0_pipe_write_data: in std_logic_vector(response_data_width-1 downto 0);
		demuxed_request_1_pipe_read_req: in std_logic_vector(0 downto 0);
		demuxed_request_1_pipe_read_ack: out std_logic_vector(0 downto 0);
		demuxed_request_1_pipe_read_data: out std_logic_vector(request_data_width-1 downto 0);
		demuxed_response_1_pipe_write_req: in std_logic_vector(0 downto 0);
		demuxed_response_1_pipe_write_ack: out std_logic_vector(0 downto 0);
		demuxed_response_1_pipe_write_data: in std_logic_vector(response_data_width-1 downto 0);
		min_addr_for_0, max_addr_for_0 : in std_logic_vector(request_routing_section_width-1 downto 0);
		min_addr_for_1, max_addr_for_1 : in std_logic_vector(request_routing_section_width-1 downto 0);
		clk, reset: in std_logic
		);
   end component generic_transaction_demux;

end package;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.utilities.all;

entity generic_acb_sram is -- 
    generic (acb_sram_address_width: integer := 20);
    port( -- 
      MAIN_MEM_REQUEST_PIPE_WRITE_DATA : in std_logic_vector(109 downto 0);
      MAIN_MEM_REQUEST_PIPE_WRITE_REQ : in std_logic_vector(0 downto 0);
      MAIN_MEM_REQUEST_PIPE_WRITE_ACK : out std_logic_vector(0 downto 0);
      MAIN_MEM_RESPONSE_PIPE_READ_DATA : out std_logic_vector(64 downto 0);
      MAIN_MEM_RESPONSE_PIPE_READ_REQ : in std_logic_vector(0 downto 0);
      MAIN_MEM_RESPONSE_PIPE_READ_ACK : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
end entity;


--
-- a simple interface.. serves single requests.. back to back is ok.
--
architecture Mixed of generic_acb_sram is

	type FsmState is (IdleState, AccessDoneState, WaitOnBusState);
	signal fsm_state : FsmState;

	signal addr_to_sram: std_logic_vector(acb_sram_address_width-1 downto 0);
	signal data_to_sram: std_logic_vector(63 downto 0);
	signal byte_mask_to_sram: std_logic_vector(7 downto 0);
	signal read_write_bar: std_logic_vector(0 downto 0);
	signal read_write_bar_reg: std_logic_vector(0 downto 0);

	signal read_data_from_sram: std_logic_vector(63 downto 0);
	signal read_data_from_sram_reg: std_logic_vector(63 downto 0);

	signal latch_response: boolean;	
	signal latch_command: boolean;	
	signal bus_has_command, bus_accepts_response: boolean;

	signal bb_enables: std_logic_vector(7 downto 0);
	signal enable: std_logic;
begin 
	data_to_sram <= MAIN_MEM_REQUEST_PIPE_WRITE_DATA(63 downto 0);
	addr_to_sram <= MAIN_MEM_REQUEST_PIPE_WRITE_DATA((64 + acb_sram_address_width-1) downto 64);
	byte_mask_to_sram <= MAIN_MEM_REQUEST_PIPE_WRITE_DATA((64 + 36 + 8)-1 downto 64+36);
	read_write_bar <= MAIN_MEM_REQUEST_PIPE_WRITE_DATA((64 + 36 + 8 + 1)-1 downto 64+36+8);

	bus_has_command <= (MAIN_MEM_REQUEST_PIPE_WRITE_REQ(0) = '1');
	bus_accepts_response <= (MAIN_MEM_RESPONSE_PIPE_READ_REQ(0) = '1');

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



	-- error is always '0'.		
	MAIN_MEM_RESPONSE_PIPE_READ_DATA(64) <= '0';

	process(clk, reset, fsm_state, read_write_bar, byte_mask_to_sram, addr_to_sram, data_to_sram,
				bus_has_command, bus_accepts_response)
		variable next_fsm_state_var: FsmState;
		variable enable_var: std_logic;
		variable write_ack_var, read_ack_var: std_logic;
		variable response_val_var : std_logic_vector(63 downto 0);
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
				if (bus_has_command) then
					next_fsm_state_var := AccessDoneState;
					enable_var := '1';
					latch_command_var := true;
				end if;
			when AccessDoneState =>
				read_ack_var := '1';
				if(read_write_bar_reg(0) = '1') then
					response_val_var :=  read_data_from_sram;
				end if;
				if(bus_accepts_response) then
					write_ack_var := '1';
					if(bus_has_command) then
						enable_var := '1';
						latch_command_var := true;
					else
						next_fsm_state_var := IdleState;
					end if;
				else
					latch_response_var := true;
					next_fsm_state_var := WaitOnBusState;
				end if;
			when WaitOnBusState =>
				read_ack_var := '1';
				if(read_write_bar_reg(0) = '1') then
					response_val_var :=  read_data_from_sram_reg;
				end if;
				if(bus_accepts_response) then
					write_ack_var := '1';
					if(bus_has_command) then
						enable_var := '1';
						latch_command_var := true;
						next_fsm_state_var := AccessDoneState;
					else
						next_fsm_state_var := IdleState;
					end if;
				end if;
		end case;

		enable <= enable_var;

		MAIN_MEM_REQUEST_PIPE_WRITE_ACK(0) <= write_ack_var;
		MAIN_MEM_RESPONSE_PIPE_READ_ACK(0) <= read_ack_var;
		MAIN_MEM_RESPONSE_PIPE_READ_DATA(63 downto 0) <= response_val_var;

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
	bb_enables(4) <= enable when ((read_write_bar(0) = '1')  or (byte_mask_to_sram(4) = '1')) else '0';
	bb_enables(5) <= enable when ((read_write_bar(0) = '1')  or (byte_mask_to_sram(5) = '1')) else '0';
	bb_enables(6) <= enable when ((read_write_bar(0) = '1')  or (byte_mask_to_sram(6) = '1')) else '0';
	bb_enables(7) <= enable when ((read_write_bar(0) = '1')  or (byte_mask_to_sram(7) = '1')) else '0';

	-- 8 banks.
	bbGen: for B in 0 to 7 generate 
	   bb: base_bank 
		generic map (name => "SRAM-STUB-BASE-BANK-" & Convert_To_String(B), 
						g_addr_width => acb_sram_address_width-3, 
								g_data_width => 8)
		port map (
				datain => data_to_sram ((8*(B+1))-1 downto 8*B),
				dataout => read_data_from_sram((8*(B+1))-1 downto 8*B),
				addrin => addr_to_sram(acb_sram_address_width-1 downto 3),
				enable => bb_enables(B),
				writebar => read_write_bar(0),
				clk => clk,
				reset => reset);
       end generate bbGen;

end Mixed;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.basecomponents.all;

-- written by Madhav P. Desai.
--
-- A generic request/ack pipe transaction de-mux.
--
--     The demux operates in two modes
--       a. when tap_mode is true, the output interface to 1
--          is tapped off from the main flow using min/max spec for 
--	    output 1.  Whatever is not tapped off is sent through
--	    on output 0.
--       b. when tap mode is false, the output interfaces are 
--	    selected based on the specified ranges.
--
--    Note: a section of the input request data is treated as
--          the address used for determining the destination.
--    In each mode, there is provision for noblock/block etc.
--    
--
entity generic_transaction_demux is
	generic (request_data_width: integer := 32;
		     request_routing_section_width: integer := 16;
		       request_routing_section_low_index: integer := 0;
			 response_data_width: integer := 32;
			   tap_mode : boolean := false;
			      request_noblock_flag: boolean := true;
				request_valid_index: integer := 31;
			   	   response_noblock_flag: boolean := true;
					response_valid_index: integer := 31;
						queue_depth: integer := 8);
	port (
		request_pipe_write_req  : in std_logic_vector(0 downto 0);	
		request_pipe_write_ack  : out std_logic_vector(0 downto 0);	
		request_pipe_write_data : in std_logic_vector(request_data_width-1 downto 0);	
    		response_pipe_read_req  : in  std_logic_vector(0 downto 0);
    		response_pipe_read_ack  : out   std_logic_vector(0 downto 0);
    		response_pipe_read_data : out  std_logic_vector(response_data_width-1 downto 0);
		demuxed_request_0_pipe_read_req: in std_logic_vector(0 downto 0);
		demuxed_request_0_pipe_read_ack: out std_logic_vector(0 downto 0);
		demuxed_request_0_pipe_read_data: out std_logic_vector(request_data_width-1 downto 0);
		demuxed_response_0_pipe_write_req: in std_logic_vector(0 downto 0);
		demuxed_response_0_pipe_write_ack: out std_logic_vector(0 downto 0);
		demuxed_response_0_pipe_write_data: in std_logic_vector(response_data_width-1 downto 0);
		demuxed_request_1_pipe_read_req: in std_logic_vector(0 downto 0);
		demuxed_request_1_pipe_read_ack: out std_logic_vector(0 downto 0);
		demuxed_request_1_pipe_read_data: out std_logic_vector(request_data_width-1 downto 0);
		demuxed_response_1_pipe_write_req: in std_logic_vector(0 downto 0);
		demuxed_response_1_pipe_write_ack: out std_logic_vector(0 downto 0);
		demuxed_response_1_pipe_write_data: in std_logic_vector(response_data_width-1 downto 0);
		min_addr_for_0, max_addr_for_0 : in std_logic_vector(request_routing_section_width-1 downto 0);
		min_addr_for_1, max_addr_for_1 : in std_logic_vector(request_routing_section_width-1 downto 0);
		clk, reset: in std_logic
		);
end entity generic_transaction_demux;

architecture Simple of generic_transaction_demux is

	signal req_ready, resp_ready : boolean;
	signal demux_req_0_ready, demux_req_1_ready, demux_resp_0_ready, demux_resp_1_ready: boolean;
	signal qpush_req, qpush_ack, qpop_req, qpop_ack: std_logic;
	
	-- data format
	--    wait-on-resp  resp-id
	--      1             1
	signal qpush_data, qpop_data: std_logic_vector(1 downto 0);

	signal pull_request, do_request_transfer: boolean;
	signal push_response, do_response_transfer: boolean;

	signal req_data_valid, demux_resp_0_data_valid, demux_resp_1_data_valid: boolean;
	signal routing_control: std_logic_vector(request_routing_section_width-1 downto 0);

	function computeRoutingControlInfo 
			(tap_flag: boolean;
				min0, max0, min1, max1, rc: 
					std_logic_vector(request_routing_section_width-1 downto 0))
		return std_logic_vector is
		variable ret_var: std_logic_vector(1 downto 0);
		variable urc : unsigned(request_routing_section_width-1 downto 0);
		variable s0, s1: std_logic;
	begin

		urc := unsigned(rc);

		s0 := '0'; s1 := '0';

		ret_var := (others => '0');
		if((urc >= unsigned(min1)) and (urc <= unsigned(max1))) then
			s1 := '1';
		elsif (tap_flag or ((urc >= unsigned(min0)) and (urc <= unsigned(max0)))) then
			s0 := '1';
		end if;
		
		-- combinations
		--   0 x    none selected
		--   1 0    0 selected
		--   1 1    1 selected.
		ret_var(1) := (s1 or s0);
		ret_var(0) :=  s1;

		return(ret_var);
	end function;

	signal response_control: std_logic_vector(1 downto 0);
begin
	---------------------------------------------------------------------------------------
	-- request side demuxing.
	---------------------------------------------------------------------------------------

	routing_control <= 
		request_pipe_write_data((request_routing_section_width + request_routing_section_low_index)-1 
								downto request_routing_section_low_index);
	
	
	demux_req_0_ready <= (demuxed_request_0_pipe_read_req(0) = '1');
	demux_req_1_ready <= (demuxed_request_1_pipe_read_req(0) = '1');

	req_data_valid <= (not request_noblock_flag) or (request_pipe_write_data(request_valid_index) = '1');
	req_ready <= req_data_valid and (request_pipe_write_req(0)  = '1');



	response_control <= computeRoutingControlInfo(tap_mode, min_addr_for_0, max_addr_for_0, 
								min_addr_for_1, max_addr_for_1, routing_control);
	qpush_data <= response_control;

	pull_request <= 
			((qpush_ack = '1') and
				    ((response_control(1) = '0')  or
					((response_control(0) = '1') and demux_req_1_ready) or
					((response_control(0) = '0') and demux_req_0_ready)));
	do_request_transfer <= pull_request and req_ready;
	request_pipe_write_ack(0) <= '1' when pull_request else '0';

	demuxed_request_0_pipe_read_ack(0) <= '1' when 
						(do_request_transfer and 
							(response_control(1) = '1') and
							(response_control(0) = '0')) else '0';	
	demuxed_request_0_pipe_read_data <= request_pipe_write_data;

	demuxed_request_1_pipe_read_ack(0) <= '1' when 
						(do_request_transfer and 
							(response_control(1) = '1') and
							(response_control(0) = '1')) else '0';	
	demuxed_request_1_pipe_read_data <= request_pipe_write_data;

	qpush_req <= '1' when do_request_transfer else '0';

	qinst: QueueBase
		generic map(name => "generic_transaction_demux", 
					queue_depth => queue_depth, data_width => 2, save_one_slot => false)
		port map(
				clk => clk, reset => reset,
				push_req => qpush_req,
				push_ack => qpush_ack,
				data_in => qpush_data,
				pop_req => qpop_req,
				pop_ack => qpop_ack,
				data_out => qpop_data);

	---------------------------------------------------------------------------------------
	-- response side demuxing.
	---------------------------------------------------------------------------------------

	demux_resp_0_data_valid <= 
		(not response_noblock_flag) or
				(demuxed_response_0_pipe_write_data(response_valid_index) = '1');
	demux_resp_0_ready <= demux_resp_0_data_valid and (demuxed_response_0_pipe_write_req(0) = '1');

	demux_resp_1_data_valid <= 
		(not response_noblock_flag) or
				(demuxed_response_1_pipe_write_data(response_valid_index) = '1');
	demux_resp_1_ready <= demux_resp_1_data_valid and (demuxed_response_1_pipe_write_req(0) = '1');

	push_response
		<= ((qpop_ack = '1') and
			((qpop_data(1) = '0') or
				((qpop_data(0) = '1') and demux_resp_1_ready) or
				((qpop_data(0) = '0') and demux_resp_0_ready)));
	do_response_transfer  <= push_response and (response_pipe_read_req(0) = '1');
	qpop_req <= '1' when do_response_transfer else '0';

	-- response data...
	response_pipe_read_data <= 
		demuxed_response_1_pipe_write_data
			 when ((qpop_data(1) = '1') and (qpop_data(0) = '1')) else 
		    demuxed_response_0_pipe_write_data
			 when ((qpop_data(1) = '1') and (qpop_data(0) = '0')) else 
				(others => '0');

	
	response_pipe_read_ack(0) <= '1' when push_response else '0'; 
		
	demuxed_response_0_pipe_write_ack(0) <= 
			'1' when (do_response_transfer and (qpop_data(1) = '1') and
						qpop_data(0) = '0')   else '0';
	demuxed_response_1_pipe_write_ack(0) <= 
			'1' when (do_response_transfer and (qpop_data(1) = '1') and
						qpop_data(0) = '1')   else '0';

	-- assertion.
	process(clk, reset)
	begin
		if(clk'event and clk = '1') then
			if(reset = '0') then
				if(qpop_ack = '1') and (qpop_data(1) = '0') then
					assert false
						report "generic_transaction_demux unclassified request" 
							severity error;
				end if;
			end if;
		end if;
	end process;

end Simple;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.basecomponents.all;

--
-- A generic request/ack pipe transaction mux.
--
-- written by Madhav P. Desai.
--
-- There are two requesters, and fair arbitration is
-- used.   The requesters and their responses can be
-- configured to be in either blocking or non-blocking
-- mode (with valid bit specified).
--    
--
entity generic_transaction_mux is
	generic (request_data_width: integer := 32;
			response_data_width: integer := 32;
			   request_noblock_flag: boolean := true;
				request_valid_index: integer := 31;
			   	   response_noblock_flag: boolean := true;
					response_valid_index: integer := 31;
						lock_flag: boolean := false;
							lock_index: integer := 0;
								queue_depth: integer := 8;
									output_queue_depth : integer := 2;
									output_queue_bypass : boolean := true
		);
	port (
		request_0_pipe_write_req  : in std_logic_vector(0 downto 0);	
		request_0_pipe_write_ack  : out std_logic_vector(0 downto 0);	
		request_0_pipe_write_data : in std_logic_vector(request_data_width-1 downto 0);	
    		response_0_pipe_read_req  : in  std_logic_vector(0 downto 0);
    		response_0_pipe_read_ack  : out   std_logic_vector(0 downto 0);
    		response_0_pipe_read_data : out  std_logic_vector(response_data_width-1 downto 0);
		request_1_pipe_write_req  : in std_logic_vector(0 downto 0);	
		request_1_pipe_write_ack  : out std_logic_vector(0 downto 0);	
		request_1_pipe_write_data : in std_logic_vector(request_data_width-1 downto 0);	
    		response_1_pipe_read_req  : in  std_logic_vector(0 downto 0);
    		response_1_pipe_read_ack  : out   std_logic_vector(0 downto 0);
    		response_1_pipe_read_data : out  std_logic_vector(response_data_width-1 downto 0);
		muxed_request_pipe_read_req: in std_logic_vector(0 downto 0);
		muxed_request_pipe_read_ack: out std_logic_vector(0 downto 0);
		muxed_request_pipe_read_data: out std_logic_vector(request_data_width-1 downto 0);
		muxed_response_pipe_write_req: in std_logic_vector(0 downto 0);
		muxed_response_pipe_write_ack: out std_logic_vector(0 downto 0);
		muxed_response_pipe_write_data: in std_logic_vector(response_data_width-1 downto 0);
		clk, reset: in std_logic
		);
end entity generic_transaction_mux;

architecture Simple of generic_transaction_mux is

	signal req_0_ready, req_1_ready, resp_0_ready, resp_1_ready: boolean;
	signal qpush_req, qpush_ack, qpop_req, qpop_ack: std_logic;
	signal qpush_data, qpop_data: std_logic_vector(0 downto 0);

	signal oq_qpush_req, oq_qpush_ack, oq_qpop_req, oq_qpop_ack: std_logic;
	signal oq_qpush_data, oq_qpop_data: std_logic_vector(request_data_width-1 downto 0);

	signal sel_0, sel_1: boolean;
	signal rsel_0, rsel_1: boolean;
	signal pull_request, push_request,  do_request_transfer: boolean;
	signal pull_response, push_response,  do_response_transfer: boolean;
	signal priority_flag: std_logic;
	signal muxed_resp_ready: boolean;
	signal muxed_request_accept: boolean;

	signal req_0_data_valid, req_1_data_valid: boolean;
	signal muxed_resp_data_valid: boolean;

	signal req_0_has_lock, req_1_has_lock: boolean;
	signal req_0_wants_lock, req_1_wants_lock: boolean;
	signal req_0_selected, req_1_selected: boolean;

begin

	oqDG0: if (output_queue_depth > 0) generate
	   bypGen: if (output_queue_bypass) generate
	      oq_inst: QueueWithBypass
		 	generic map (name => "generic_transaction_mux_oq_with_bypass",
					queue_depth => output_queue_depth,
						data_width => request_data_width)
			port map (clk => clk, reset => reset,
					data_in => oq_qpush_data,
					push_req => oq_qpush_req,
					push_ack => oq_qpush_ack,
					data_out => oq_qpop_data,
					pop_req  => oq_qpop_req,
					pop_ack  => oq_qpop_ack);
	   end generate bypGen;

	   nobypGen: if (not output_queue_bypass) generate
	      oq_inst: QueueBase
		 	generic map (name => "generic_transaction_mux_oq",
					queue_depth => output_queue_depth,
						data_width => request_data_width)
			port map (clk => clk, reset => reset,
					data_in => oq_qpush_data,
					push_req => oq_qpush_req,
					push_ack => oq_qpush_ack,
					data_out => oq_qpop_data,
					pop_req  => oq_qpop_req,
					pop_ack  => oq_qpop_ack);
	   end generate nobypGen;
	end generate oqDG0;

	oqDEq0: if (output_queue_depth = 0) generate

		oq_qpush_ack <= oq_qpop_req;
		oq_qpop_ack  <= oq_qpush_req;
		oq_qpop_data <= oq_qpush_data;

	end generate oqDEq0;
			
	oq_qpop_req <= muxed_request_pipe_read_req(0);
	muxed_request_pipe_read_ack(0) <= oq_qpop_ack;
	muxed_request_pipe_read_data <= oq_qpop_data;

	
	muxed_request_accept <= (oq_qpush_ack = '1');


	req_0_data_valid <= (not request_noblock_flag) or (request_0_pipe_write_data(request_valid_index) = '1');
	req_0_ready <= req_0_data_valid and (request_0_pipe_write_req(0)  = '1');
	req_0_wants_lock <= lock_flag and req_0_ready and (request_0_pipe_write_data(lock_index) = '1');

	req_1_data_valid <= (not request_noblock_flag) or (request_1_pipe_write_data(request_valid_index) = '1');
	req_1_ready <= req_1_data_valid and (request_1_pipe_write_req(0)  = '1');
	req_1_wants_lock <= lock_flag and req_1_ready and (request_1_pipe_write_data(lock_index) = '1');

	resp_0_ready <= response_0_pipe_read_req(0) = '1';
	resp_1_ready <= response_1_pipe_read_req(0) = '1';

	process(muxed_request_accept, 
			req_0_ready, req_0_has_lock, 
			req_1_ready, req_1_has_lock, 
			qpush_ack)
		variable push_req_var: boolean;
	begin
		push_req_var := false;

		-- 
		-- req_1_has_lock req_0_has_lock req_1_ready req_0_ready    drt
		--   0              0               1             *	    1
		--   0              0               *             1	    1
		--   1              0               1             *         1
		--   0              1               *             1         1
		if(((not req_1_has_lock) and req_0_ready) or
			((not req_0_has_lock) and req_1_ready)) then
			if(qpush_ack = '1') then
				push_req_var := true;
			end if;
		end if;
		push_request <= push_req_var;
	end process;
	do_request_transfer <= push_request and muxed_request_accept;

	qpush_req <= '1' when do_request_transfer else '0';
	qinst: QueueBase
		generic map(name => "generic_transaction_mux", 
					queue_depth => queue_depth, data_width => 1, save_one_slot => false)
		port map(
				clk => clk, reset => reset,
				push_req => qpush_req,
				push_ack => qpush_ack,
				data_in => qpush_data,
				pop_req => qpop_req,
				pop_ack => qpop_ack,
				data_out => qpop_data);

	-- priority
	process(clk, reset, priority_flag, do_request_transfer, req_0_selected, req_1_selected)
		variable req_0_has_lock_var, req_1_has_lock_var: boolean;
		variable priority_flag_var: std_logic;
	begin

		req_0_has_lock_var := req_0_has_lock;
		req_1_has_lock_var := req_1_has_lock;
		priority_flag_var  := priority_flag;

		if(req_0_selected and do_request_transfer) then
			req_0_has_lock_var := req_0_wants_lock;
			priority_flag_var  := '1';
		end if;

		if(req_1_selected and do_request_transfer) then
			req_1_has_lock_var := req_1_wants_lock;
			priority_flag_var  := '0';
		end if;
		

		if(clk'event and (clk = '1')) then
			if(reset = '1') then
				priority_flag <= '0';
				req_0_has_lock <= false;
				req_1_has_lock <= false;
			elsif do_request_transfer then
				priority_flag <= priority_flag_var;
				req_0_has_lock <= req_0_has_lock_var;
				req_1_has_lock <= req_1_has_lock_var;
			end if;
		end if;
	end process;

	-- push side.
	process(priority_flag, req_0_ready, req_1_ready, push_request,  do_request_transfer,
				request_0_pipe_write_data, request_1_pipe_write_data)
		variable ack_0_var, ack_1_var: std_logic;
		variable req_data_var: std_logic_vector(request_data_width-1 downto 0);
		variable qpush_data_var: std_logic_vector(0 downto 0);
		variable req_1_selected_var, req_0_selected_var: boolean;
		variable muxed_req_ack_var : std_logic;
	begin
		muxed_req_ack_var := '0';

		ack_0_var := '0';
		req_0_selected_var := false;

		ack_1_var := '0';
		req_1_selected_var := false;

		req_data_var := (others => '0');
		qpush_data_var(0) := '0';

		--   req_0_ready req_0_has_lock req_1_has_lock priority req_1_ready   select_r0
		--    0            *                                                   0
		--    *                              1                     *           0
		--    1             1                  *                               1
		--    1             0                 0            0       *           1
		 --    1             0                 0            *       0           1
		if(req_0_ready and 
			(req_0_has_lock or 
				((not req_1_has_lock) and
					((priority_flag = '0') or (not req_1_ready))))) then
			req_0_selected_var := true;
			req_data_var := request_0_pipe_write_data;
		end if;
		if(req_1_ready and 
			(req_1_has_lock or ((not req_0_has_lock) and
						((priority_flag = '1') or (not req_0_ready))))) then
			req_1_selected_var := true;
			req_data_var := request_1_pipe_write_data;
			qpush_data_var(0) := '1';
		end if;

		-- note: when the remaining two (queue and mux) are ready
		--       we can freely ack.
		if(muxed_request_accept and (qpush_ack = '1')) then
			if(req_0_selected_var) then 
				ack_0_var := '1';
			elsif (req_1_selected_var) then
				ack_1_var := '1';
			end if;
		end if;

		if(push_request) then
			muxed_req_ack_var := '1';
		end if;

		-- reveal your intentions.
		oq_qpush_data <= req_data_var;
		oq_qpush_req   <= muxed_req_ack_var;

		request_0_pipe_write_ack(0) <= ack_0_var;
		request_1_pipe_write_ack(0) <= ack_1_var;

		qpush_data <= qpush_data_var;
		req_0_selected <= req_0_selected_var;
		req_1_selected <= req_1_selected_var;
	end process;

	-- pop side.
	muxed_resp_data_valid <= (not response_noblock_flag) or
						(muxed_response_pipe_write_data(response_valid_index) = '1');
	muxed_resp_ready <= muxed_resp_data_valid and (muxed_response_pipe_write_req(0) = '1');

	pull_response 
		<= (qpop_ack = '1') and 
			(((response_0_pipe_read_req(0) = '1') and (qpop_data(0) = '0'))
			  or 
			 ((response_1_pipe_read_req(0) = '1') and  (qpop_data(0) = '1')));
	do_response_transfer <= pull_response and muxed_resp_ready;
	
	response_0_pipe_read_data <= muxed_response_pipe_write_data;
	response_1_pipe_read_data <= muxed_response_pipe_write_data;
	qpop_req <= '1' when do_response_transfer else '0';

	response_0_pipe_read_ack(0) <= '1' 
				when ((qpop_data(0) = '0') and do_response_transfer) else '0';
	response_1_pipe_read_ack(0) <= '1' 
				when ((qpop_data(0) = '1') and do_response_transfer) else '0';
	
	muxed_response_pipe_write_ack(0) <= '1' when pull_response else '0';

end Simple;
