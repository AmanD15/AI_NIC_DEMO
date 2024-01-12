library ieee;
use ieee.std_logic_1164.all;
library std;
use std.standard.all;
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

library DualClockedQueuelib;
use DualClockedQueuelib.DualClockedQueuePackage.all;

library GenericCoreAddOnLib;
use GenericCoreAddOnLib.GenericCoreAddOnPackage.all;

library GlueModules;
use GlueModules.GlueModulesBaseComponents.all;

library GenericGlueStuff;
use GenericGlueStuff.GenericGlueStuffComponents.all;

library ahir_system_global_packagelib;
use ahir_system_global_packagelib.ahir_system_global_package.all;

--library rx_concat_lib;
--use rx_concat_lib.rx_concat_global_package.all;

--library tx_deconcat_lib;
--use tx_deconcat_lib.tx_deconcat_global_package.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity top_level is
port(
      DEBUG_UART_RX : in std_logic_vector(0 downto 0);
      DEBUG_UART_TX : out std_logic_vector(0 downto 0);
      SERIAL_UART_RX : in std_logic_vector(0 downto 0);
      SERIAL_UART_TX : out std_logic_vector(0 downto 0);
      -- TODO:
      -- 125 MHz clock from MMCM
             glbl_rst : in std_logic;
             gtx_clk_bufg_out : out std_logic;
        
             phy_resetn : out std_logic;
        
             -- RGMII Interface
             ------------------
             rgmii_txd : out std_logic_vector(3 downto 0);
             rgmii_tx_ctl : out std_logic;
             rgmii_txc : out std_logic;
             rgmii_rxd : in std_logic_vector(3 downto 0);
             rgmii_rx_ctl : in std_logic;
             rgmii_rxc : in std_logic;
        
             
             -- MDIO Interface
             -----------------
             mdio : inout std_logic;
             mdc : out std_logic;
        
        
             -- Serialised statistics vectors
             --------------------------------
             tx_statistics_s : out std_logic;
             rx_statistics_s : out std_logic;
        
             -- Serialised Pause interface controls
             --------------------------------------
             pause_req_s : in std_logic;
        
             -- Main example design controls
             -------------------------------
             mac_speed : in std_logic_vector(1 downto 0);
             update_speed : in std_logic;
             config_board : in std_logic;
             serial_response : out std_logic;
             gen_tx_data : in std_logic;
             chk_tx_data : in std_logic;
             reset_error : in std_logic;
             frame_error : out std_logic;
             frame_errorn : out std_logic;
             activity_flash : out std_logic;
             activity_flashn : out std_logic;
      -- SGMIII interface ports (mapped to PHY on the board)
      -- ENABLE FOR MAC+FIFO (mapped to a switch on the board)
      clk_in_p : in std_logic;
      clk_in_n : in std_logic
	);
end entity top_level;

architecture structure of top_level is


  component processor_1x1x32 is -- 
   port( -- 
    CONSOLE_to_SERIAL_RX_pipe_write_data : in std_logic_vector(7 downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_req  : in std_logic_vector(0  downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_ack  : out std_logic_vector(0  downto 0);
    EXTERNAL_INTERRUPT : in std_logic_vector(0 downto 0);
    MAIN_MEM_INVALIDATE_pipe_write_data : in std_logic_vector(29 downto 0);
    MAIN_MEM_INVALIDATE_pipe_write_req  : in std_logic_vector(0  downto 0);
    MAIN_MEM_INVALIDATE_pipe_write_ack  : out std_logic_vector(0  downto 0);
    MAIN_MEM_RESPONSE_pipe_write_data : in std_logic_vector(64 downto 0);
    MAIN_MEM_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
    MAIN_MEM_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_data : in std_logic_vector(7 downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_req  : in std_logic_vector(0  downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_ack  : out std_logic_vector(0  downto 0);
    THREAD_RESET : in std_logic_vector(3 downto 0);
    MAIN_MEM_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
    MAIN_MEM_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
    MAIN_MEM_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
    PROCESSOR_MODE : out std_logic_vector(15 downto 0);
    SERIAL_TX_to_CONSOLE_pipe_read_data : out std_logic_vector(7 downto 0);
    SERIAL_TX_to_CONSOLE_pipe_read_req  : in std_logic_vector(0  downto 0);
    SERIAL_TX_to_CONSOLE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    SOC_DEBUG_to_MONITOR_pipe_read_data : out std_logic_vector(7 downto 0);
    SOC_DEBUG_to_MONITOR_pipe_read_req  : in std_logic_vector(0  downto 0);
    SOC_DEBUG_to_MONITOR_pipe_read_ack  : out std_logic_vector(0  downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
  end component processor_1x1x32;
  
  -- NIC component
  component ahir_system is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    AFB_NIC_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_NIC_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_NIC_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_NIC_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_NIC_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_NIC_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    MEMORY_TO_NIC_RESPONSE_pipe_write_data: in std_logic_vector(64 downto 0);
    MEMORY_TO_NIC_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
    MEMORY_TO_NIC_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
    NIC_TO_MEMORY_REQUEST_pipe_read_data: out std_logic_vector(109 downto 0);
    NIC_TO_MEMORY_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
    NIC_TO_MEMORY_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
    enable_mac_pipe_read_data: out std_logic_vector(0 downto 0);
    enable_mac_pipe_read_req : in std_logic_vector(0 downto 0);
    enable_mac_pipe_read_ack : out std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_data: in std_logic_vector(72 downto 0);
    mac_to_nic_data_pipe_write_req : in std_logic_vector(0 downto 0);
    mac_to_nic_data_pipe_write_ack : out std_logic_vector(0 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_data: out std_logic_vector(72 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
    nic_to_mac_transmit_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  
  component mac_rx_interface is
	port(
		clk : in std_logic;
		reset : in std_logic;
		--rx_axis_resetn : out std_logic;
		rx_axis_tdata : in std_logic_vector(63 downto 0);
		rx_axis_tkeep : in std_logic_vector(7 downto 0);
		rx_axis_tvalid : in std_logic;
		--rx_axis_tuser : in std_logic;
		rx_axis_tlast : in std_logic;
		rx_axis_tready : out std_logic;
               
		RX_FIFO_pipe_read_data : out std_logic_vector(72 downto 0);
		RX_FIFO_pipe_read_req : in std_logic;
		RX_FIFO_pipe_read_ack : out std_logic);
  end component;
  
  component mac_tx_interface is
	port(
		clk : in std_logic;
		reset : in std_logic;
		tx_axis_tready : in std_logic;
		--tx_axis_resetn : out std_logic;
		tx_axis_tdata : out std_logic_vector(63 downto 0);
		tx_axis_tkeep : out std_logic_vector(7 downto 0);
		tx_axis_tvalid : out std_logic;
		--tx_axis_tuser : out std_logic;
		tx_axis_tlast : out std_logic;
		TX_FIFO_pipe_write_data : in std_logic_vector(72 downto 0);
		TX_FIFO_pipe_write_req : in std_logic;
		TX_FIFO_pipe_write_ack : out std_logic);
  end component;

  component nic_mac_pipe_reset is
	port(
		clk : in std_logic;

		ENABLE_MAC_pipe_data: in std_logic; 
		ENABLE_MAC_pipe_req : in std_logic;
		ENABLE_MAC_pipe_ack : out std_logic;

		reset : out std_logic);
  end component;

  component mac_engine is
  	port(
		clk : in std_logic;
		reset : in std_logic;
		--m_rx_axis_resetn : in std_logic;
		m_rx_axis_tdata : out std_logic_vector(63 downto 0);
		m_rx_axis_tkeep : out std_logic_vector(7 downto 0);
		m_rx_axis_tvalid : out std_logic;
		--m_rx_axis_tuser : out std_logic;
		m_rx_axis_tlast : out std_logic;
		m_rx_axis_tready : in std_logic;

		--s_tx_axis_resetn : in std_logic;
		s_tx_axis_tdata : in std_logic_vector(63 downto 0);
		s_tx_axis_tkeep : in std_logic_vector(7 downto 0);
		s_tx_axis_tvalid : in std_logic;
		--s_tx_axis_tuser : in std_logic;
		s_tx_axis_tlast : in std_logic;
		s_tx_axis_tready : out std_logic);
   end component;


  signal PROCESSOR_MODE: std_logic_vector(15 downto 0);


   
   -- to generate a 80  and 125 Mhz clock
   component clk_wiz_0
   port
    (-- Clock in ports
     -- Clock out ports
     clk_out1          : out    std_logic; -- 80 Mhz Clock
     clk_out2	       : out    std_logic; -- 125 MHz clock
     clk_out3	       : out    std_logic; -- 100 MHz clock
     clk_out4	       : out    std_logic; -- 200 MHz clock
     -- Status and control signals
     reset             : in     std_logic;
     locked            : out    std_logic;
     clk_in1_p         : in     std_logic;
     clk_in1_n         : in     std_logic
    );
   end component;

    -- vio for reset
  component vio_0 is
  port (
    clk : in std_logic;
    probe_in0 : in std_logic;
    probe_in1 : in std_logic;
    probe_in2 : in std_logic;
    probe_out0 : out std_logic;
    probe_out1 : OUT std_logic;
    probe_out2 : OUT std_logic;
    probe_out3 : OUT std_logic;
    probe_out4 : OUT std_logic
  );
  end component;
  
  COMPONENT vio_1
    PORT (
      clk : IN STD_LOGIC;
      probe_in0 : IN STD_LOGIC;
      probe_out0 : OUT STD_LOGIC
    );
  END COMPONENT;
  
  component ETH_KC is
  port
  (
      
       --asynchronous reset
       glbl_rst : in std_logic;
       
       gtx_clk_bufg : in std_logic;
       refclk_bufg : in std_logic;
       s_axi_aclk : in std_logic;
       
       -- 125 MHz clock from MMCM
       gtx_clk_bufg_out : out std_logic;
  
       phy_resetn : out std_logic;
  
       -- RGMII Interface
       ------------------
       rgmii_txd : out std_logic_vector(3 downto 0);
       rgmii_tx_ctl : out std_logic;
       rgmii_txc : out std_logic;
       rgmii_rxd : in std_logic_vector(3 downto 0);
       rgmii_rx_ctl : in std_logic;
       rgmii_rxc : in std_logic;
  
       
       -- MDIO Interface
       -----------------
       mdio : inout std_logic;
       mdc : out std_logic;
  
       -- NIC side interfaces
       rx_pipe_data : out std_logic_vector(9 downto 0);
       rx_pipe_ack : out std_logic_vector(0 downto 0);
       rx_pipe_req : in std_logic_vector(0 downto 0);
         
       tx_pipe_data : in std_logic_vector(9 downto 0);
       tx_pipe_ack : in std_logic_vector(0 downto 0);
       tx_pipe_req : out std_logic_vector(0 downto 0);
       
       gtx_clk_reset : out std_logic;
       dcm_locked : in std_logic;
            
  
       -- Serialised statistics vectors
       --------------------------------
       tx_statistics_s : out std_logic;
       rx_statistics_s : out std_logic;
  
       -- Serialised Pause interface controls
       --------------------------------------
       pause_req_s : in std_logic;
  
       -- Main example design controls
       -------------------------------
       mac_speed : in std_logic_vector(1 downto 0);
       update_speed : in std_logic;
       config_board : in std_logic;
       serial_response : out std_logic;
       gen_tx_data : in std_logic;
       chk_tx_data : in std_logic;
       reset_error : in std_logic;
       frame_error : out std_logic;
       frame_errorn : out std_logic;
       activity_flash : out std_logic;
       activity_flashn : out std_logic
       );
       end component;  

    component rx_concat_system is -- 
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
     end component;
        
    component tx_deconcat_system is -- 
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
   end component;   
           
     component clocks_gen is
       port(
          -- differential clock inputs
          clk_in_p : in std_logic;
          clk_in_n : in std_logic;
       
          -- asynchronous control/resets
          glbl_rst : in std_logic;
          dcm_locked : out std_logic;
       
          -- clock outputs
          gtx_clk_bufg : out std_logic;
          refclk_bufg : out std_logic;
          s_axi_aclk : out std_logic;

          clock : out std_logic);
       end component;

	component tri_mode_ethernet_mac_0_sync_block is 
		port(
		    
			clk : in std_logic;
			data_in : in std_logic;
			data_out : out std_logic);
	end component;


   signal MAIN_MEM_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_MEM_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
   signal MAIN_MEM_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MAIN_MEM_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_MEM_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_MEM_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);

   -- main tap bus signals (including buffering)
   signal MAIN_TAP_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_TAP_RESPONSE_pipe_write_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_RESPONSE_pipe_write_ack:std_logic_vector(0  downto 0);

   signal MAIN_TAP_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_TAP_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);

   signal MAIN_TAP_RESPONSE_BUF_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_TAP_RESPONSE_BUF_pipe_write_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_RESPONSE_BUF_pipe_write_ack:std_logic_vector(0  downto 0);

   signal MAIN_TAP_REQUEST_BUF_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_TAP_REQUEST_BUF_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_REQUEST_BUF_pipe_read_ack:std_logic_vector(0  downto 0);

   -- main through bus signals (including buffering)
   signal MAIN_THROUGH_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_THROUGH_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
   signal MAIN_THROUGH_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MAIN_THROUGH_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_THROUGH_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_THROUGH_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);
   
   signal MAIN_THROUGH_RESPONSE_BUF_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_THROUGH_RESPONSE_BUF_pipe_write_req:std_logic_vector(0 downto 0);
   signal MAIN_THROUGH_RESPONSE_BUF_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MAIN_THROUGH_REQUEST_BUF_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_THROUGH_REQUEST_BUF_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_THROUGH_REQUEST_BUF_pipe_read_ack:std_logic_vector(0  downto 0);

   -- buffer betwwen acb_mux and acb_sram
   signal MUX_TO_MEM_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MUX_TO_MEM_REQUEST_pipe_read_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_REQUEST_pipe_read_ack:std_logic_vector(0 downto 0);
   
   signal MUX_TO_MEM_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MUX_TO_MEM_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);
   
   signal MUX_TO_MEM_REQUEST_BUF_pipe_read_data:std_logic_vector(109 downto 0);
   signal MUX_TO_MEM_REQUEST_BUF_pipe_read_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_REQUEST_BUF_pipe_read_ack:std_logic_vector(0 downto 0);
   
   signal MUX_TO_MEM_RESPONSE_BUF_pipe_write_data:std_logic_vector(64 downto 0);
   signal MUX_TO_MEM_RESPONSE_BUF_pipe_write_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_RESPONSE_BUF_pipe_write_ack:std_logic_vector(0 downto 0);
   
   --
   
   signal reset1,reset2, reset_sync_pre_buf, reset_sync, reset_nic: std_logic;
   signal reset1_mac,reset2_mac, reset_sync_pre_buf_mac, reset_sync_mac: std_logic;
   signal EXTERNAL_INTERRUPT : std_logic_vector(0 downto 0);
   signal LOGGER_MODE : std_logic_vector(0 downto 0);
   signal clock,clock_mac,lock:std_logic;

   signal MONITOR_to_DEBUG_pipe_write_data : std_logic_vector(7 downto 0);
   signal MONITOR_to_DEBUG_pipe_write_req  : std_logic_vector(0  downto 0);
   signal MONITOR_to_DEBUG_pipe_write_ack  : std_logic_vector(0  downto 0);

   signal DEBUG_to_MONITOR_pipe_read_data : std_logic_vector(7 downto 0);
   signal DEBUG_to_MONITOR_pipe_read_req  : std_logic_vector(0  downto 0);
   signal DEBUG_to_MONITOR_pipe_read_ack  : std_logic_vector(0  downto 0);

   signal CONSOLE_to_SERIAL_RX_pipe_write_data : std_logic_vector(7 downto 0);
   signal CONSOLE_to_SERIAL_RX_pipe_write_req  : std_logic_vector(0  downto 0);
   signal CONSOLE_to_SERIAL_RX_pipe_write_ack  : std_logic_vector(0  downto 0);

   signal SERIAL_TX_to_CONSOLE_pipe_read_data : std_logic_vector(7 downto 0);
   signal SERIAL_TX_to_CONSOLE_pipe_read_req  : std_logic_vector(0  downto 0);
   signal SERIAL_TX_to_CONSOLE_pipe_read_ack  : std_logic_vector(0  downto 0);

   signal CONFIG_UART_BAUD_CONTROL_WORD: std_logic_vector(31 downto 0);
    
   signal INVALIDATE_REQUEST_pipe_write_data : std_logic_vector(29 downto 0);
   signal INVALIDATE_REQUEST_pipe_write_req  : std_logic_vector(0  downto 0);
   signal INVALIDATE_REQUEST_pipe_write_ack  : std_logic_vector(0  downto 0);

    				
   signal MAX_ADDR_TAP : std_logic_vector(35 downto 0);
   signal MIN_ADDR_TAP : std_logic_vector(35 downto 0);
   
   -- ACB to AFB bridge and queues(Dual clocked fifos)
   signal AFB_NIC_RESPONSE_DFIFO_pipe_write_data : std_logic_vector(32 downto 0);
   signal AFB_NIC_RESPONSE_DFIFO_pipe_write_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_RESPONSE_DFIFO_pipe_write_ack : std_logic_vector(0 downto 0);
   
   signal AFB_NIC_REQUEST_DFIFO_pipe_write_data : std_logic_vector(73 downto 0);
   signal AFB_NIC_REQUEST_DFIFO_pipe_write_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_REQUEST_DFIFO_pipe_write_ack : std_logic_vector(0 downto 0);
   
   signal AFB_NIC_REQUEST_pipe_read_data : std_logic_vector(73 downto 0);
   signal AFB_NIC_REQUEST_pipe_read_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal AFB_NIC_RESPONSE_pipe_read_data : std_logic_vector(32 downto 0);
   signal AFB_NIC_RESPONSE_pipe_read_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_RESPONSE_pipe_read_ack : std_logic_vector(0 downto 0);
   
   -- NIC to mem
   signal NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_data : std_logic_vector(109 downto 0);
   signal NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_req : std_logic_vector(0 downto 0);
   signal NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_ack : std_logic_vector(0 downto 0);
   
   signal NIC_TO_MEMORY_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
   signal NIC_TO_MEMORY_REQUEST_pipe_read_req : std_logic_vector(0 downto 0);
   signal NIC_TO_MEMORY_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal MEMORY_TO_NIC_RESPONSE_pipe_read_data : std_logic_vector(64 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_pipe_read_req : std_logic_vector(0 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_data : std_logic_vector(64 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_req : std_logic_vector(0 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_ack : std_logic_vector(0 downto 0);
   

   
   
   
   
   signal RX_FIFO_pipe_read_data : std_logic_vector (72 downto 0);
   signal RX_FIFO_pipe_read_req : std_logic_vector (0 downto 0);
   signal RX_FIFO_pipe_read_ack : std_logic_vector (0 downto 0);
   
--   signal RX_FIFO_BUF_pipe_read_data : std_logic_vector (72 downto 0);
--   signal RX_FIFO_BUF_pipe_read_req : std_logic_vector (0 downto 0);
--   signal RX_FIFO_BUF_pipe_read_ack : std_logic_vector (0 downto 0);
   
   signal TX_FIFO_pipe_write_data : std_logic_vector (72 downto 0);
   signal TX_FIFO_pipe_write_req : std_logic_vector (0 downto 0);
   signal TX_FIFO_pipe_write_ack : std_logic_vector (0 downto 0);

   attribute mark_debug : string;
   attribute mark_debug of RX_FIFO_pipe_read_data  : signal is "true";


    --attribute mark_debug : string;
    attribute mark_debug of RX_FIFO_pipe_read_req: signal is "true";

    --attribute mark_debug : string;
    attribute mark_debug of RX_FIFO_pipe_read_ack: signal is "true";

    --attribute mark_debug : string;
    attribute mark_debug of TX_FIFO_pipe_write_data: signal is "true";

    --attribute mark_debug : string;
    attribute mark_debug of TX_FIFO_pipe_write_req: signal is "true";

    --attribute mark_debug : string;
    attribute mark_debug of TX_FIFO_pipe_write_ack: signal is "true";


--   signal TX_FIFO_BUF_pipe_write_data : std_logic_vector (72 downto 0);
--   signal TX_FIFO_BUF_pipe_write_req : std_logic_vector (0 downto 0);
--   signal TX_FIFO_BUF_pipe_write_ack : std_logic_vector (0 downto 0);
   
   signal enable_mac_pipe_read_data: std_logic_vector (0 downto 0);
   signal enable_mac_pipe_read_req : std_logic_vector (0 downto 0);
   signal enable_mac_pipe_read_ack : std_logic_vector (0 downto 0);

   signal enable_reset : std_logic_vector (0 downto 0);
   
   -- mac side connections   
   signal rx_axis_resetn : std_logic;
   signal rx_axis_tdata : std_logic_vector (63 downto 0);
   signal rx_axis_tkeep : std_logic_vector (7 downto 0);
   signal rx_axis_tvalid : std_logic;
   signal rx_axis_tuser : std_logic;
   signal rx_axis_tlast : std_logic;
   signal rx_axis_tready : std_logic;
   
   signal tx_axis_resetn : std_logic;
   signal tx_axis_tdata : std_logic_vector (63 downto 0);
   signal tx_axis_tkeep : std_logic_vector (7 downto 0);
   signal tx_axis_tvalid : std_logic;
   signal tx_axis_tuser : std_logic;
   signal tx_axis_tlast : std_logic;
   signal tx_axis_tready : std_logic;
   
   signal one_bit_one : std_logic_vector(0 downto 0);
   
   
   signal reset,reset_clk : std_logic;

   signal CPU_RESET : std_logic_vector(0 downto 0);
   signal DEBUG_MODE : std_logic_vector(0 downto 0);
   signal SINGLE_STEP_MODE : std_logic_vector(0 downto 0);
   signal CPU_MODE : std_logic_vector(1 downto 0);


    -- MAC related signals
    signal s_axi_aclk : std_logic;
    signal refclk_bufg : std_logic;
    
    signal rx_pipe_data : std_logic_vector(9 downto 0);
    signal rx_pipe_ack : std_logic_vector(0 downto 0);
    signal rx_pipe_req : std_logic_vector(0 downto 0);
    
    signal tx_pipe_data : std_logic_vector(9 downto 0);
    signal tx_pipe_ack : std_logic_vector(0 downto 0);
    signal tx_pipe_req : std_logic_vector(0 downto 0);
    
    signal gtx_clk_reset : std_logic;
    
    signal dcm_locked : std_logic;
   
   
   -- ADDITIONAL SIGNALS FOR MAC + NIC + SWITCH 
begin

	-- make '1'
   one_bit_one(0) <= '1';

   -- tie it off for this board.
   INVALIDATE_REQUEST_pipe_write_req(0) <= '0'; 
   INVALIDATE_REQUEST_pipe_write_data  <= (others => '0');

   -- Info: Baudrate 115200 ClkFreq 65000000:  Baud-freq = 1152, Baud-limit= 39473 Baud-control=0x9a310480
   -- Info: Baudrate 115200 ClkFreq 70000000:  Baud-freq = 576, Baud-limit= 21299 Baud-control=0x53330240
   -- Info: Baudrate 115200 ClkFreq 75000000:  Baud-freq = 384, Baud-limit= 15241 Baud-control=0x3b890180
   -- clock freq = 80MHz, baud-rate=115200.
   CONFIG_UART_BAUD_CONTROL_WORD <= X"0bed0048";
   -- CONFIG_UART_BAUD_CONTROL_WORD <= X"3b890180";


       
   -- 80  & 125 & 100 & 200 MHz generator
--   clocking1 : clk_wiz_0
--      port map ( 
--        -- Clock out ports  
--         clk_out1 => clock,
--	     clk_out2 => clock_mac, -- gtx_clk_bufg
--	     clk_out3 => s_axi_aclk,
--	     clk_out4 => refclk_bufg,
--        -- Status and control signals                
--         reset => reset_clk,
--         locked => lock,
--         -- Clock in ports
--         clk_in1_p => clk_in_p,
--         clk_in1_n => clk_in_n
--       );
    clock_gen_inst : clocks_gen
        port map(
        -- differential clock inputs
        clk_in_p => clk_in_p,--in std_logic;
        clk_in_n => clk_in_n,--in_std_logic;

         -- asynchronous control/resets
        glbl_rst => glbl_rst,--in std_logic;
        dcm_locked => dcm_locked,--out std_logic;

        -- clock outputs
        gtx_clk_bufg => clock_mac,--out std_logic;
   
        refclk_bufg => refclk_bufg,--out std_logic;
        s_axi_aclk => s_axi_aclk,--out std_logic;
        clock => clock --out std_logic	
        );      
       
    -- VIO for reset 
    virtual_reset : vio_0
        port map (
                        clk => clock,
                        probe_in0 =>  dcm_locked,
                        probe_in1 =>  CPU_MODE(1),
                        probe_in2 =>  CPU_MODE(0),
                        probe_out0 => reset_sync,
                        probe_out1 => reset_clk,
                        probe_out2 => CPU_RESET(0),
                        probe_out3 => DEBUG_MODE(0),
                        probe_out4 => SINGLE_STEP_MODE(0)
                );
    virtual_reset_nic : vio_1
                        port map (
                                        clk => clock_mac,
                                        probe_in0 =>  dcm_locked,
                                        probe_out0 => reset_nic
                                       
                                );

 
    EXTERNAL_INTERRUPT(0) <= '0';
    LOGGER_MODE(0) <= '0';

    test_inst: processor_1x1x32 port map(
		THREAD_RESET(0) => CPU_RESET(0),
      		THREAD_RESET(1) => DEBUG_MODE(0),
      		THREAD_RESET(2) => SINGLE_STEP_MODE(0),
      		THREAD_RESET(3) => LOGGER_MODE(0),
		EXTERNAL_INTERRUPT => EXTERNAL_INTERRUPT,
		-- only bottom 2 bits used.
		PROCESSOR_MODE => PROCESSOR_MODE,
    		MAIN_MEM_INVALIDATE_pipe_write_data  => INVALIDATE_REQUEST_pipe_write_data , -- in
    		MAIN_MEM_INVALIDATE_pipe_write_req   => INVALIDATE_REQUEST_pipe_write_req  , -- in
    		MAIN_MEM_INVALIDATE_pipe_write_ack   => INVALIDATE_REQUEST_pipe_write_ack  , -- out
    		SOC_MONITOR_to_DEBUG_pipe_write_data  => MONITOR_to_DEBUG_pipe_write_data , -- in
    		SOC_MONITOR_to_DEBUG_pipe_write_req  => MONITOR_to_DEBUG_pipe_write_req , -- in
    		SOC_MONITOR_to_DEBUG_pipe_write_ack  => MONITOR_to_DEBUG_pipe_write_ack , -- out
    		SOC_DEBUG_to_MONITOR_pipe_read_data  => DEBUG_to_MONITOR_pipe_read_data , -- out
    		SOC_DEBUG_to_MONITOR_pipe_read_req   => DEBUG_to_MONITOR_pipe_read_req  , -- in
    		SOC_DEBUG_to_MONITOR_pipe_read_ack   => DEBUG_to_MONITOR_pipe_read_ack  , -- out
    		CONSOLE_to_SERIAL_RX_pipe_write_data  => CONSOLE_to_SERIAL_RX_pipe_write_data , -- in
    		CONSOLE_to_SERIAL_RX_pipe_write_req  => CONSOLE_to_SERIAL_RX_pipe_write_req , -- in
    		CONSOLE_to_SERIAL_RX_pipe_write_ack  => CONSOLE_to_SERIAL_RX_pipe_write_ack , -- out
    		SERIAL_TX_to_CONSOLE_pipe_read_data => SERIAL_TX_to_CONSOLE_pipe_read_data, -- out
    		SERIAL_TX_to_CONSOLE_pipe_read_req  => SERIAL_TX_to_CONSOLE_pipe_read_req , -- in
    		SERIAL_TX_to_CONSOLE_pipe_read_ack   => SERIAL_TX_to_CONSOLE_pipe_read_ack  , -- out
		--  The memory interface to the processor.
      		MAIN_MEM_RESPONSE_pipe_write_data => MAIN_MEM_RESPONSE_pipe_write_data, -- in
      		MAIN_MEM_RESPONSE_pipe_write_req => MAIN_MEM_RESPONSE_pipe_write_req, -- in
      		MAIN_MEM_RESPONSE_pipe_write_ack => MAIN_MEM_RESPONSE_pipe_write_ack, -- out
      		MAIN_MEM_REQUEST_pipe_read_data => MAIN_MEM_REQUEST_pipe_read_data, -- out
      		MAIN_MEM_REQUEST_pipe_read_req => MAIN_MEM_REQUEST_pipe_read_req, -- in
      		MAIN_MEM_REQUEST_pipe_read_ack => MAIN_MEM_REQUEST_pipe_read_ack, -- out
      		clk => clock,
      		reset => reset_sync
	);
   	CPU_MODE <= PROCESSOR_MODE(1 downto 0);

  ---------------------------------------------------------------------------
  -- ACB fast tap!  
  ---------------------------------------------------------------------------
	main_tap: acb_fast_tap  -- done
		port map (
				clk => clock, reset => reset_sync,

    				CORE_BUS_REQUEST_pipe_write_data => MAIN_MEM_REQUEST_pipe_read_data, -- in
    				CORE_BUS_REQUEST_pipe_write_req  => MAIN_MEM_REQUEST_pipe_read_ack, -- in
    				CORE_BUS_REQUEST_pipe_write_ack  => MAIN_MEM_REQUEST_pipe_read_req, -- out

    				CORE_BUS_RESPONSE_pipe_read_data => MAIN_MEM_RESPONSE_pipe_write_data, -- out
    				CORE_BUS_RESPONSE_pipe_read_req  => MAIN_MEM_RESPONSE_pipe_write_ack, -- in
    				CORE_BUS_RESPONSE_pipe_read_ack  => MAIN_MEM_RESPONSE_pipe_write_req, -- out

				-- connect to the tap.
    				CORE_BUS_REQUEST_TAP_pipe_read_data => MAIN_TAP_REQUEST_pipe_read_data, -- out
    				CORE_BUS_REQUEST_TAP_pipe_read_req  => MAIN_TAP_REQUEST_pipe_read_req, -- in
    				CORE_BUS_REQUEST_TAP_pipe_read_ack  => MAIN_TAP_REQUEST_pipe_read_ack, -- out
				-- MAIN_TAP_RESPONSE
    				CORE_BUS_RESPONSE_TAP_pipe_write_data => MAIN_TAP_RESPONSE_pipe_write_data, -- in
    				CORE_BUS_RESPONSE_TAP_pipe_write_req  => MAIN_TAP_RESPONSE_pipe_write_ack, -- in
    				CORE_BUS_RESPONSE_TAP_pipe_write_ack  => MAIN_TAP_RESPONSE_pipe_write_req, -- out

				-- MAIN_THROUGH_REQUEST
    				CORE_BUS_REQUEST_THROUGH_pipe_read_data => MAIN_THROUGH_REQUEST_pipe_read_data, -- out
    				CORE_BUS_REQUEST_THROUGH_pipe_read_req  => MAIN_THROUGH_REQUEST_pipe_read_req, -- in
    				CORE_BUS_REQUEST_THROUGH_pipe_read_ack  => MAIN_THROUGH_REQUEST_pipe_read_ack, -- out
				-- MAIN_THROUGH_RESPONSE
    				CORE_BUS_RESPONSE_THROUGH_pipe_write_data => MAIN_THROUGH_RESPONSE_pipe_write_data, -- in
    				CORE_BUS_RESPONSE_THROUGH_pipe_write_req  => MAIN_THROUGH_RESPONSE_pipe_write_req, -- in
    				CORE_BUS_RESPONSE_THROUGH_pipe_write_ack  => MAIN_THROUGH_RESPONSE_pipe_write_ack, -- out

    				MAX_ADDR_TAP => MAX_ADDR_TAP, -- in
    				MIN_ADDR_TAP => MIN_ADDR_TAP -- in
			);

   --MAX_ADDR_TAP <= X"00040ffff";  -- 4MB + 64KB-1
   --MIN_ADDR_TAP <= X"000400000"; -- 4MB
   --MAX_ADDR_TAP <= X"0FFFF50FF";  -- MMIO for NIC+ 256B-1
   --MIN_ADDR_TAP <= X"0FFFF5000"; -- MMIO for NIC
   MAX_ADDR_TAP <= X"01FFFFFFF";  -- MMIO for NIC+ 256B-1
   MIN_ADDR_TAP <= X"010000000"; -- MMIO for NIC

  -- two buffers between TAP and acb_afb_bridge
  qb_req_tap: QueueBase -- done
	generic map (name => "main_tap_req_buffer", queue_depth => 2,
			data_width => 110, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MAIN_TAP_REQUEST_pipe_read_data, -- in
			push_req => MAIN_TAP_REQUEST_pipe_read_ack(0), -- in
			push_ack => MAIN_TAP_REQUEST_pipe_read_req(0), -- out
			data_out => MAIN_TAP_REQUEST_BUF_pipe_read_data, -- out
			pop_req => MAIN_TAP_REQUEST_BUF_pipe_read_ack(0), -- in
			pop_ack => MAIN_TAP_REQUEST_BUF_pipe_read_req(0) -- out
		);
  qb_resp_tap: QueueBase -- done
	generic map (name => "main_tap_resp_buffer", queue_depth => 2,
			data_width => 65, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MAIN_TAP_RESPONSE_BUF_pipe_write_data, -- in
			push_req => MAIN_TAP_RESPONSE_BUF_pipe_write_req(0), -- in
			push_ack => MAIN_TAP_RESPONSE_BUF_pipe_write_ack(0), -- out
			data_out => MAIN_TAP_RESPONSE_pipe_write_data, -- out
			pop_req => MAIN_TAP_RESPONSE_pipe_write_req(0), -- in
			pop_ack => MAIN_TAP_RESPONSE_pipe_write_ack(0) -- out
		);
  acb_afb_bridge_nic: acb_afb_bridge  -- done
	port map(
		clk => clock, reset => reset_sync,
		AFB_BUS_RESPONSE_pipe_write_data => AFB_NIC_RESPONSE_DFIFO_pipe_write_data, -- in 
		AFB_BUS_RESPONSE_pipe_write_req  => AFB_NIC_RESPONSE_DFIFO_pipe_write_ack, -- in
		AFB_BUS_RESPONSE_pipe_write_ack  => AFB_NIC_RESPONSE_DFIFO_pipe_write_req, -- out
		CORE_BUS_REQUEST_pipe_write_data => MAIN_TAP_REQUEST_BUF_pipe_read_data, -- in
		CORE_BUS_REQUEST_pipe_write_req  => MAIN_TAP_REQUEST_BUF_pipe_read_req, -- in
		CORE_BUS_REQUEST_pipe_write_ack  => MAIN_TAP_REQUEST_BUF_pipe_read_ack, -- out
		AFB_BUS_REQUEST_pipe_read_data 	 => AFB_NIC_REQUEST_pipe_read_data, -- out
		AFB_BUS_REQUEST_pipe_read_req    => AFB_NIC_REQUEST_pipe_read_req, -- in
		AFB_BUS_REQUEST_pipe_read_ack    => AFB_NIC_REQUEST_pipe_read_ack, -- out
		CORE_BUS_RESPONSE_pipe_read_data => MAIN_TAP_RESPONSE_BUF_pipe_write_data, -- out
		CORE_BUS_RESPONSE_pipe_read_req  => MAIN_TAP_RESPONSE_BUF_pipe_write_ack, -- in
		CORE_BUS_RESPONSE_pipe_read_ack  => MAIN_TAP_RESPONSE_BUF_pipe_write_req -- out
  );
  
  -- two buffers between TAP and acb_mux
  qb_req_through: QueueBase -- done
	generic map (name => "main_through_req_buffer", queue_depth => 2,
			data_width => 110, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MAIN_THROUGH_REQUEST_pipe_read_data, -- in
			push_req => MAIN_THROUGH_REQUEST_pipe_read_ack(0), -- in
			push_ack => MAIN_THROUGH_REQUEST_pipe_read_req(0), -- out
			data_out => MAIN_THROUGH_REQUEST_BUF_pipe_read_data, -- out
			pop_req => MAIN_THROUGH_REQUEST_BUF_pipe_read_ack(0), -- in
			pop_ack => MAIN_THROUGH_REQUEST_BUF_pipe_read_req(0) -- out
		);
  qb_resp_through: QueueBase  -- done
	generic map (name => "main_through_resp_buffer", queue_depth => 2,
			data_width => 65, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MAIN_THROUGH_RESPONSE_BUF_pipe_write_data, -- in
			push_req => MAIN_THROUGH_RESPONSE_BUF_pipe_write_req(0), -- in
			push_ack => MAIN_THROUGH_RESPONSE_BUF_pipe_write_ack(0), -- out
			data_out => MAIN_THROUGH_RESPONSE_pipe_write_data, -- out
			pop_req => MAIN_THROUGH_RESPONSE_pipe_write_ack(0), -- in
			pop_ack => MAIN_THROUGH_RESPONSE_pipe_write_req(0) -- out
		);
  
  acb_mux: acb_fast_mux   -- done
	port map( 
		clk => clock, reset => reset_sync,
		CORE_BUS_REQUEST_HIGH_pipe_write_data => MAIN_THROUGH_REQUEST_BUF_pipe_read_data, -- in
		CORE_BUS_REQUEST_HIGH_pipe_write_req  => MAIN_THROUGH_REQUEST_BUF_pipe_read_req, -- in
		CORE_BUS_REQUEST_HIGH_pipe_write_ack  => MAIN_THROUGH_REQUEST_BUF_pipe_read_ack, -- out
		CORE_BUS_REQUEST_LOW_pipe_write_data  => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_data, -- in
		CORE_BUS_REQUEST_LOW_pipe_write_req   => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_ack, -- in
		CORE_BUS_REQUEST_LOW_pipe_write_ack   => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_req, -- out
		CORE_BUS_RESPONSE_pipe_write_data     => MUX_TO_MEM_RESPONSE_pipe_write_data, -- in
		CORE_BUS_RESPONSE_pipe_write_req      => MUX_TO_MEM_RESPONSE_pipe_write_req, -- in
		CORE_BUS_RESPONSE_pipe_write_ack      => MUX_TO_MEM_RESPONSE_pipe_write_ack, -- out
		CORE_BUS_REQUEST_pipe_read_data       => MUX_TO_MEM_REQUEST_pipe_read_data, --out
		CORE_BUS_REQUEST_pipe_read_req        => MUX_TO_MEM_REQUEST_pipe_read_ack, -- in
		CORE_BUS_REQUEST_pipe_read_ack        => MUX_TO_MEM_REQUEST_pipe_read_req, -- out
		CORE_BUS_RESPONSE_HIGH_pipe_read_data => MAIN_THROUGH_RESPONSE_BUF_pipe_write_data, -- out
		CORE_BUS_RESPONSE_HIGH_pipe_read_req  => MAIN_THROUGH_RESPONSE_BUF_pipe_write_ack, -- in
		CORE_BUS_RESPONSE_HIGH_pipe_read_ack  => MAIN_THROUGH_RESPONSE_BUF_pipe_write_req, -- out
		CORE_BUS_RESPONSE_LOW_pipe_read_data  => MEMORY_TO_NIC_RESPONSE_pipe_read_data, -- out
		CORE_BUS_RESPONSE_LOW_pipe_read_req   => MEMORY_TO_NIC_RESPONSE_pipe_read_req, -- in
		CORE_BUS_RESPONSE_LOW_pipe_read_ack   => MEMORY_TO_NIC_RESPONSE_pipe_read_ack -- out
	);


  -- two buffers between acb_mux acb_ram
  qb_req_mem: QueueBase  -- done
	generic map (name => "mux_mem_req_buffer", queue_depth => 2,
			data_width => 110, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MUX_TO_MEM_REQUEST_pipe_read_data, -- in
			push_req => MUX_TO_MEM_REQUEST_pipe_read_req(0), -- in
			push_ack => MUX_TO_MEM_REQUEST_pipe_read_ack(0), -- out
			data_out => MUX_TO_MEM_REQUEST_BUF_pipe_read_data, -- out
			pop_req => MUX_TO_MEM_REQUEST_BUF_pipe_read_ack(0), -- in
			pop_ack => MUX_TO_MEM_REQUEST_BUF_pipe_read_req(0) -- out
		);
  qb_resp_mem: QueueBase   -- done
	generic map (name => "mux_mem_resp_buffer", queue_depth => 2, 
			data_width => 65, save_one_slot => false)
	port map (
			clk => clock, reset => reset_sync,
			data_in => MUX_TO_MEM_RESPONSE_BUF_pipe_write_data, -- in
			push_req => MUX_TO_MEM_RESPONSE_BUF_pipe_write_req(0), -- in
			push_ack => MUX_TO_MEM_RESPONSE_BUF_pipe_write_ack(0), -- out
			data_out => MUX_TO_MEM_RESPONSE_pipe_write_data, -- out
			pop_req => MUX_TO_MEM_RESPONSE_pipe_write_ack(0), -- in
			pop_ack => MUX_TO_MEM_RESPONSE_pipe_write_req(0) -- out
		);
  
  nic_instance : ahir_system 			-- TODO : done
	port map( 
		clk => clock_mac, 
		reset => reset_sync_mac,--reset_nic,

		AFB_NIC_REQUEST_pipe_write_data => AFB_NIC_REQUEST_DFIFO_pipe_write_data, -- in
		AFB_NIC_REQUEST_pipe_write_req => AFB_NIC_REQUEST_DFIFO_pipe_write_req, -- in
		AFB_NIC_REQUEST_pipe_write_ack => AFB_NIC_REQUEST_DFIFO_pipe_write_ack, -- out

		AFB_NIC_RESPONSE_pipe_read_data => AFB_NIC_RESPONSE_pipe_read_data, -- out
		AFB_NIC_RESPONSE_pipe_read_req => AFB_NIC_RESPONSE_pipe_read_req, -- in
		AFB_NIC_RESPONSE_pipe_read_ack  => AFB_NIC_RESPONSE_pipe_read_ack, -- out

		MEMORY_TO_NIC_RESPONSE_pipe_write_data => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_data, -- in
		MEMORY_TO_NIC_RESPONSE_pipe_write_req => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_req, -- in
		MEMORY_TO_NIC_RESPONSE_pipe_write_ack => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_ack, -- out

		NIC_TO_MEMORY_REQUEST_pipe_read_data => NIC_TO_MEMORY_REQUEST_pipe_read_data, -- out
		NIC_TO_MEMORY_REQUEST_pipe_read_req => NIC_TO_MEMORY_REQUEST_pipe_read_req, -- in
		NIC_TO_MEMORY_REQUEST_pipe_read_ack => NIC_TO_MEMORY_REQUEST_pipe_read_ack, -- out

   		enable_mac_pipe_read_data => enable_mac_pipe_read_data, --out
    	enable_mac_pipe_read_req =>  enable_mac_pipe_read_req, --in
    	enable_mac_pipe_read_ack =>  enable_mac_pipe_read_ack, -- out

		mac_to_nic_data_pipe_write_data => RX_FIFO_pipe_read_data, -- in
		mac_to_nic_data_pipe_write_req => RX_FIFO_pipe_read_ack, -- in
		mac_to_nic_data_pipe_write_ack => RX_FIFO_pipe_read_req, -- out

		nic_to_mac_transmit_pipe_pipe_read_data => TX_FIFO_pipe_write_data, --out
		nic_to_mac_transmit_pipe_pipe_read_req => TX_FIFO_pipe_write_req, -- in
		nic_to_mac_transmit_pipe_pipe_read_ack => TX_FIFO_pipe_write_ack -- out
	); 
	
  nic_mac_reset_sync : nic_mac_pipe_reset 
	port map(
		clk => clock_mac,

		ENABLE_MAC_pipe_data => enable_mac_pipe_read_data(0),
		ENABLE_MAC_pipe_req => enable_mac_pipe_read_ack(0),
		ENABLE_MAC_pipe_ack =>  enable_mac_pipe_read_req(0),

		reset => enable_reset(0)
	);

    ETH_KC_inst : ETH_KC
    port map
    (
    
     --asynchronous reset
     glbl_rst => enable_reset(0), --in std_logic;
     
     gtx_clk_bufg => clock_mac, --in std_logic;
     refclk_bufg => refclk_bufg , --in std_logic;
     s_axi_aclk => s_axi_aclk, --in std_logic;
     
     -- 125 MHz clock from MMCM
     gtx_clk_bufg_out => gtx_clk_bufg_out, --out std_logic;

     phy_resetn => phy_resetn, --out std_logic;

     -- RGMII Interface
     ------------------
     rgmii_txd => rgmii_txd, --out std_logic_vector(3 downto 0);
     rgmii_tx_ctl => rgmii_tx_ctl, --out std_logic;
     rgmii_txc => rgmii_txc, --out std_logic;
     rgmii_rxd => rgmii_rxd, --in std_logic_vector(3 downto 0);
     rgmii_rx_ctl => rgmii_rx_ctl, --in std_logic;
     rgmii_rxc => rgmii_rxc, --in std_logic;

     
     -- MDIO Interface
     -----------------
     mdio => mdio, --in std_logic;
     mdc => mdc, --out std_logic;

    -- nic side
    rx_pipe_data => rx_pipe_data, --out std_logic_vector(9 downto 0);
    rx_pipe_ack => rx_pipe_ack, --out std_logic;
    rx_pipe_req => rx_pipe_req, --in std_logic;
         
    tx_pipe_data => tx_pipe_data, --in std_logic_vector(9 downto 0);
    tx_pipe_ack => tx_pipe_ack, --in std_logic;
    tx_pipe_req => tx_pipe_req, --out std_logic;
    
    gtx_clk_reset => gtx_clk_reset, -- out std logic;
    dcm_locked => dcm_locked,

     -- Serialised statistics vectors
     --------------------------------
     tx_statistics_s => tx_statistics_s, --out std_logic;
     rx_statistics_s => rx_statistics_s, --out std_logic;

     -- Serialised Pause interface controls
     --------------------------------------
     pause_req_s => pause_req_s, --in std_logic;

     -- Main example design controls
     -------------------------------
     mac_speed => mac_speed, --in std_logic_vector(1 ownto 0);
     update_speed => update_speed, --in std_logic;
     config_board => config_board, --in std_logic;
     serial_response => serial_response, --out std_logic;
     gen_tx_data => gen_tx_data, --in std_logic;
     chk_tx_data => chk_tx_data, --in std_logic;
     reset_error => reset_error, --in std_logic;
     frame_error => frame_error, --out std_logic;
     frame_errorn => frame_errorn, --out std_logic;
     activity_flash => activity_flash, --out std_logic;
     activity_flashn => activity_flashn --out std_logic
);


     rx_concat_inst : rx_concat_system 
           port map(--
                 clk => clock_mac, --in std_logic;
                 reset => enable_reset(0),--gtx_clk_reset, --in std_logic;
                 rx_in_pipe_pipe_write_data => rx_pipe_data, --in std_logic_vector(9 downto 0);
                 rx_in_pipe_pipe_write_req => rx_pipe_ack, --in std_logic_vector(0 downto 0);
                 rx_in_pipe_pipe_write_ack => rx_pipe_req, --out std_logic_vector(0 downto 0);
                 rx_out_pipe_pipe_read_data => RX_FIFO_pipe_read_data, --out std_logic_vector(72 downto 0);
                 rx_out_pipe_pipe_read_req => RX_FIFO_pipe_read_req, --in std_logic_vector(0 downto 0);
                 rx_out_pipe_pipe_read_ack => RX_FIFO_pipe_read_ack --out std_logic_vector(0 downto 0)
                 );
            
      tx_deconcat_inst : tx_deconcat_system
             port map(-- 
             clk => clock_mac, --in std_logic;
             reset => enable_reset(0), --gtx_clk_reset, --in std_logic;
             tx_in_pipe_pipe_write_data => TX_FIFO_pipe_write_data, --in std_logic_vector(72 downto 0);
             tx_in_pipe_pipe_write_req => TX_FIFO_pipe_write_ack, --in std_logic_vector(0 downto 0);
             tx_in_pipe_pipe_write_ack => TX_FIFO_pipe_write_req, --out std_logic_vector(0 downto 0);
             tx_out_pipe_pipe_read_data => tx_pipe_data, --out std_logic_vector(9 downto 0);
             tx_out_pipe_pipe_read_req =>  tx_pipe_req, --in std_logic_vector(0 downto 0);
             tx_out_pipe_pipe_read_ack => tx_pipe_ack --out std_logic_vector(0 downto 0)
             );   

   DualClockedQueue_ACB_req_instance: DualClockedQueue_ACB_req  -- done
	port map( 
		    -- read 
		    read_req_in => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_req(0),
		    read_data_out => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_data,
		    read_ack_out => NIC_TO_MEMORY_REQUEST_DFIFO_pipe_write_ack(0),
		    -- write 
		    write_req_out => NIC_TO_MEMORY_REQUEST_pipe_read_req(0),
		    write_data_in => NIC_TO_MEMORY_REQUEST_pipe_read_data,
		    write_ack_in => NIC_TO_MEMORY_REQUEST_pipe_read_ack(0),
		
		    read_clk => clock,
		    write_clk => clock_mac,
		    
		    reset => reset);	
	
	DualClockedQueue_ACB_resp_inst : DualClockedQueue_ACB_resp -- done
		port map( 
		    -- read
		    read_req_in => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_ack(0),
		    read_data_out =>MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_data,
		    read_ack_out => MEMORY_TO_NIC_RESPONSE_DFIFO_pipe_write_req(0),
		    -- write 
		    write_req_out => MEMORY_TO_NIC_RESPONSE_pipe_read_req(0),
		    write_data_in => MEMORY_TO_NIC_RESPONSE_pipe_read_data,
		    write_ack_in => MEMORY_TO_NIC_RESPONSE_pipe_read_ack(0),
		
		    read_clk => clock_mac,
		    write_clk => clock,
		    
		    reset => reset);
	
	DualClockedQueue_AFB_req_inst : DualClockedQueue_AFB_req -- done
		port map( 
		    -- read 
		    read_req_in => AFB_NIC_REQUEST_DFIFO_pipe_write_ack(0),
		    read_data_out => AFB_NIC_REQUEST_DFIFO_pipe_write_data,
		    read_ack_out => AFB_NIC_REQUEST_DFIFO_pipe_write_req(0),
		    -- write 
		    write_req_out => AFB_NIC_REQUEST_pipe_read_req(0),
		    write_data_in => AFB_NIC_REQUEST_pipe_read_data,
		    write_ack_in => AFB_NIC_REQUEST_pipe_read_ack(0),
		
		    read_clk => clock_mac,
		    write_clk => clock,
		    
		    reset => reset);
	
	DualClockedQueue_AFB_resp_inst : DualClockedQueue_AFB_resp -- done
		port map( 
		    -- read
		    read_req_in => AFB_NIC_RESPONSE_DFIFO_pipe_write_req(0),
		    read_data_out => AFB_NIC_RESPONSE_DFIFO_pipe_write_data,
		    read_ack_out => AFB_NIC_RESPONSE_DFIFO_pipe_write_ack(0),
		    -- write 
		    write_req_out => AFB_NIC_RESPONSE_pipe_read_req(0),
		    write_data_in => AFB_NIC_RESPONSE_pipe_read_data,
		    write_ack_in => AFB_NIC_RESPONSE_pipe_read_ack(0),
		
		    read_clk => clock,
		    write_clk => clock_mac,
		    
		    reset => reset);
   
  

  
  bram:acb_sram_stub generic map (addr_width => 19) port map (
      CORE_BUS_REQUEST_PIPE_WRITE_DATA => MUX_TO_MEM_REQUEST_BUF_pipe_read_data, -- in
      CORE_BUS_REQUEST_PIPE_WRITE_REQ  => MUX_TO_MEM_REQUEST_BUF_pipe_read_req, -- in
      CORE_BUS_REQUEST_PIPE_WRITE_ACK  => MUX_TO_MEM_REQUEST_BUF_pipe_read_ack, -- out
      CORE_BUS_RESPONSE_PIPE_READ_DATA => MUX_TO_MEM_RESPONSE_BUF_pipe_write_data, -- out
      CORE_BUS_RESPONSE_PIPE_READ_REQ  => MUX_TO_MEM_RESPONSE_BUF_pipe_write_ack, -- in
      CORE_BUS_RESPONSE_PIPE_READ_ACK  => MUX_TO_MEM_RESPONSE_BUF_pipe_write_req, -- out
      clk => clock, 
      reset => reset_sync
   );


  debug_uart_inst: configurable_uart
  port map ( --
    CONFIG_UART_BAUD_CONTROL_WORD => CONFIG_UART_BAUD_CONTROL_WORD, -- in
    CONSOLE_to_RX_pipe_read_data => MONITOR_to_DEBUG_pipe_write_data, -- out
    CONSOLE_to_RX_pipe_read_req => MONITOR_to_DEBUG_pipe_write_ack, -- in
    CONSOLE_to_RX_pipe_read_ack => MONITOR_to_DEBUG_pipe_write_req, -- out
    TX_to_CONSOLE_pipe_write_data => DEBUG_to_MONITOR_pipe_read_data, -- in
    TX_to_CONSOLE_pipe_write_req => DEBUG_to_MONITOR_pipe_read_ack, -- in
    TX_to_CONSOLE_pipe_write_ack => DEBUG_to_MONITOR_pipe_read_req, -- out
    UART_RX => DEBUG_UART_RX, -- in
    UART_TX => DEBUG_UART_TX, -- out
    clk => clock, reset => reset_sync
    ); -- 

  serial_uart_inst: configurable_uart
  port map ( --
    CONFIG_UART_BAUD_CONTROL_WORD => CONFIG_UART_BAUD_CONTROL_WORD, -- in
    CONSOLE_to_RX_pipe_read_data => CONSOLE_to_SERIAL_RX_pipe_write_data, -- out
    CONSOLE_to_RX_pipe_read_req => CONSOLE_to_SERIAL_RX_pipe_write_ack, -- in
    CONSOLE_to_RX_pipe_read_ack => CONSOLE_to_SERIAL_RX_pipe_write_req, -- out
    TX_to_CONSOLE_pipe_write_data => SERIAL_TX_to_CONSOLE_pipe_read_data, -- in
    TX_to_CONSOLE_pipe_write_req => SERIAL_TX_to_CONSOLE_pipe_read_ack, -- in
    TX_to_CONSOLE_pipe_write_ack => SERIAL_TX_to_CONSOLE_pipe_read_req, -- out
    UART_RX => SERIAL_UART_RX, -- in
    UART_TX => SERIAL_UART_TX, -- out
    clk => clock, reset => reset_sync
    ); -- 

--  process (clock)
--  begin
--    if (clock'event and clock = '1') then
--	reset_sync_pre_buf <= reset2;
--	reset2 <= reset1;
--	reset1 <= reset;
--    end if;
--  end process;

--  process (clock_mac)
--  begin
--    if (clock_mac'event and clock_mac = '1') then
--	reset_sync_pre_buf_mac <= reset2_mac;
--	reset2_mac <= reset1_mac;
--	reset1_mac <= reset_sync;
--    end if;
--  end process;
  -- BUFGs to help vivado out..
--  resetBufg: BUFG port map (I => reset_sync_pre_buf, O => reset_sync);
--    resetBufg_mac: BUFG port map (I => reset_sync_pre_buf_mac, O => reset_sync_mac);
	sync_block_inst : tri_mode_ethernet_mac_0_sync_block
		port map(
		clk =>  clock_mac,
	        data_in => reset_sync,
		data_out => reset_sync_mac);

end structure;
