library ieee;
use ieee.std_logic_1164.all;
package acb_dram_controller_bridge_Type_Package is -- 
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
library acb_dram_controller_bridge_lib;
use acb_dram_controller_bridge_lib.acb_dram_controller_bridge_Type_Package.all;
--<<<<<
-->>>>>
library dram_controller_bridge_lib;
--<<<<<
entity acb_dram_controller_bridge is -- 
  port( -- 
    CORE_BUS_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
    CORE_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
    CORE_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
    DRAM_CONTROLLER_TO_ACB_BRIDGE : in std_logic_vector(521 downto 0);
    ACB_BRIDGE_TO_DRAM_CONTROLLER : out std_logic_vector(612 downto 0);
    CORE_BUS_RESPONSE_pipe_read_data : out std_logic_vector(64 downto 0);
    CORE_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    CORE_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
end entity acb_dram_controller_bridge;
architecture struct of acb_dram_controller_bridge is -- 
 	COMPONENT ACB_to_UI_EA
  	port (
  		ui_clk                                        : IN STD_LOGIC;
  		sys_rst                                       : IN STD_LOGIC;
  		init_calib_complete                           : IN STD_LOGIC;

  		app_addr                                      : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
  		app_cmd                                       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
  		app_en                                        : OUT STD_LOGIC;
	
  		app_wdf_data                                  : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
  		app_wdf_end                                   : OUT STD_LOGIC;
  		app_wdf_mask                                  : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  		app_wdf_wren                                  : OUT STD_LOGIC;

  		app_rd_data                                   : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
	
  		app_rd_data_end                               : IN STD_LOGIC;
  		app_rd_data_valid                             : IN STD_LOGIC;
  		app_rdy                                       : IN STD_LOGIC;
  		app_wdf_rdy                                   : IN STD_LOGIC;


  		app_sr_req                                    : OUT STD_LOGIC;
  		app_ref_req                                   : OUT STD_LOGIC;
  		app_zq_req                                    : OUT STD_LOGIC;


  		app_sr_active                                : IN STD_LOGIC;
  		app_ref_ack                                  : IN STD_LOGIC;
  		app_zq_ack                                   : IN STD_LOGIC;
  		ui_clk_sync_rst                              : IN STD_LOGIC;


  		DRAM_REQUEST_pipe_write_ack                  : OUT STD_LOGIC_VECTOR(0 downto 0);
  		DRAM_REQUEST_pipe_write_req                  : IN STD_LOGIC_VECTOR(0 downto 0);
  		DRAM_REQUEST_pipe_write_data                 : IN STD_LOGIC_VECTOR(109 DOWNTO 0);
  		DRAM_RESPONSE_pipe_read_req                  : IN STD_LOGIC_VECTOR(0 downto 0);


  		DRAM_RESPONSE_pipe_read_ack                  : OUT STD_LOGIC_VECTOR(0 downto 0);
  		DRAM_RESPONSE_pipe_read_data                 : OUT STD_LOGIC_VECTOR(64 DOWNTO 0);
  		fatal_error                                  : OUT STD_LOGIC_VECTOR(0 downto 0);
  		cdebug                                       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  		ddebug                                       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  		rdebug                                       : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)  
    );

  END  COMPONENT;
  signal fatal_error                                  : STD_LOGIC_VECTOR(0 downto 0);
  signal cdebug                                       : STD_LOGIC_VECTOR(3 DOWNTO 0);
  signal ddebug                                       : STD_LOGIC_VECTOR(3 DOWNTO 0);
  signal rdebug                                       : STD_LOGIC_VECTOR(4 DOWNTO 0);  

begin  
	ACB_to_UI_Inst: ACB_to_UI_EA
	port map(
			-- Input signals (522 bits from DRAM Controller and 1 bit for Global Reset)
		sys_rst                                      => reset, 				    -- reset_sync,   
		ui_clk                                       => DRAM_CONTROLLER_TO_ACB_BRIDGE(521), -- ui_clk,                                                     
		init_calib_complete                          => DRAM_CONTROLLER_TO_ACB_BRIDGE(520), -- init_calib_complete,
		app_rd_data                                  => DRAM_CONTROLLER_TO_ACB_BRIDGE(519 downto 8), -- app_rd_data
		app_rd_data_end                              => DRAM_CONTROLLER_TO_ACB_BRIDGE(7), -- app_rd_data_end, 
		app_rd_data_valid                            => DRAM_CONTROLLER_TO_ACB_BRIDGE(6), -- app_rd_data_valid, 
		app_rdy                                      => DRAM_CONTROLLER_TO_ACB_BRIDGE(5), -- app_rdy, 
		app_wdf_rdy                                  => DRAM_CONTROLLER_TO_ACB_BRIDGE(4), --app_wdf_rdy, 
		app_sr_active                                => DRAM_CONTROLLER_TO_ACB_BRIDGE(3), -- app_sr_active,
		app_ref_ack                                  => DRAM_CONTROLLER_TO_ACB_BRIDGE(2), -- app_ref_ack,
		app_zq_ack                                   => DRAM_CONTROLLER_TO_ACB_BRIDGE(1), -- app_zq_ack,
		ui_clk_sync_rst                              => DRAM_CONTROLLER_TO_ACB_BRIDGE(0), -- ui_clk_sync_rst,                           
			-- Output signals to Dram Controller (614 bits)
		app_addr                                     => ACB_BRIDGE_TO_DRAM_CONTROLLER(612 DOWNTO 585), -- app_addr,
		app_cmd                                      => ACB_BRIDGE_TO_DRAM_CONTROLLER(584 DOWNTO 582), -- app_cmd,
		app_en                                       => ACB_BRIDGE_TO_DRAM_CONTROLLER(581), -- app_en,
		app_wdf_data                                 => ACB_BRIDGE_TO_DRAM_CONTROLLER(580 DOWNTO 69), -- app_wdf_data, 
		app_wdf_end                                  => ACB_BRIDGE_TO_DRAM_CONTROLLER(68), -- app_wdf_end, 
		app_wdf_mask                                 => ACB_BRIDGE_TO_DRAM_CONTROLLER(67 DOWNTO 4), -- app_wdf_mask, 
		app_wdf_wren                                 => ACB_BRIDGE_TO_DRAM_CONTROLLER(3), -- app_wdf_wren, 
		app_sr_req                                   => ACB_BRIDGE_TO_DRAM_CONTROLLER(2), -- app_sr_req,  
		app_ref_req                                  => ACB_BRIDGE_TO_DRAM_CONTROLLER(1), -- app_ref_req,  
		app_zq_req                                   => ACB_BRIDGE_TO_DRAM_CONTROLLER(0), -- app_zq_req, 
			-- pipe access from ACB side.
		DRAM_REQUEST_pipe_write_ack                  => CORE_BUS_REQUEST_pipe_write_ack,
		DRAM_REQUEST_pipe_write_req                  => CORE_BUS_REQUEST_pipe_write_req,
		DRAM_REQUEST_pipe_write_data                 => CORE_BUS_REQUEST_pipe_write_data,
		DRAM_RESPONSE_pipe_read_req                  => CORE_BUS_RESPONSE_pipe_read_req,
		DRAM_RESPONSE_pipe_read_ack                  => CORE_BUS_RESPONSE_pipe_read_ack,
		DRAM_RESPONSE_pipe_read_data                 => CORE_BUS_RESPONSE_pipe_read_data,
		-- unused signals.
		fatal_error                                  => fatal_error,                        
		cdebug                                       => cdebug,      
		ddebug                                       => ddebug,
		rdebug                                       => rdebug                              
    );
    
end struct;
