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

--library work;
--use work.ahir_system_global_package.all;

library simpleUartLib;
use simpleUartLib.all;


library UNISIM;
use UNISIM.vcomponents.all;

entity top_level is
port(
--      CPU_RESET : in std_logic_vector(0 downto 0);
--      DEBUG_MODE : in std_logic_vector(0 downto 0);
--      SINGLE_STEP_MODE : in std_logic_vector(0 downto 0);
--      CPU_MODE : out std_logic_vector(1 downto 0);
      DEBUG_UART_RX : in std_logic_vector(0 downto 0);
      DEBUG_UART_TX : out std_logic_vector(0 downto 0);
      SERIAL_UART_RX : in std_logic_vector(0 downto 0);
      SERIAL_UART_TX : out std_logic_vector(0 downto 0);

	reset : in std_logic;
	led : out std_logic_vector(7 downto 0);
      -- TODO:
      -- SGMIII interface ports (mapped to PHY on the board)
	     --phy_rst_n : out std_logic;                      

	     phy_sgmii_rx_n : in std_logic;                       
	     phy_sgmii_rx_p : in std_logic;                       
	     phy_sgmii_tx_n : out std_logic;                      
	     phy_sgmii_tx_p : out std_logic;                      
	
	     phy_sgmii_clk_n : in std_logic;                       
	     phy_sgmii_clk_p : in std_logic;                       
	     dummy_port_in : in std_logic;                   
	     phy_int_n : in std_logic;

	     -- MDIO Interface
	     -----------------
	    phy_mdio : inout std_logic;                  
	    phy_mdc : out std_logic; 


      -- ENABLE FOR MAC+FIFO (mapped to a switch on the board)
--      reset,reset_clk: in std_logic;
      CLKREF_P : in std_logic;
      CLKREF_N : in std_logic;


    c0_sys_clk_p : in STD_LOGIC;
    c0_sys_clk_n : in STD_LOGIC;
    c0_ddr4_act_n : out STD_LOGIC;
    c0_ddr4_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    c0_ddr4_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_bg : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_cs_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_reset_n : out STD_LOGIC;
    c0_ddr4_dm_dbi_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    c0_ddr4_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    c0_ddr4_dqs_c : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    c0_ddr4_dqs_t : inout STD_LOGIC_VECTOR ( 7 downto 0 )
	);
end entity top_level;

architecture structure of top_level is


  component processor_1x1x32 is  
   port(  
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

   COMPONENT ACB_to_UI_EA
  port (
  ui_clk                                        : IN STD_LOGIC;
  sys_rst                                       : IN STD_LOGIC;
  init_calib_complete                           : IN STD_LOGIC;

  app_addr                                      : OUT STD_LOGIC_VECTOR(28 DOWNTO 0);
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
  DRAM_RESPONSE_pipe_read_data                 : OUT STD_LOGIC_VECTOR(64 DOWNTO 0)
  --fatal_error                                  : OUT STD_LOGIC_VECTOR(0 downto 0)
    );

  END  COMPONENT;


  -- NIC component
  component nic_system is  -- system 
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
    nic_to_mac_transmit_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)
    );
  -- 
  end component; 

  component ai_ml_engine is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    ACCELERATOR_INTERRUPT_8: out std_logic_vector(7 downto 0);
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_data: out std_logic_vector(109 downto 0);
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_req : in std_logic_vector(0 downto 0);
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_ack : out std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_data: in std_logic_vector(64 downto 0);
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_req : in std_logic_vector(0 downto 0);
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
  end component; 

  component ethernet_boot is  -- system 
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
  end component; 

  component ddr4_0 is
  Port ( 
        sys_rst : in STD_LOGIC;
      c0_sys_clk_p : in STD_LOGIC;
      c0_sys_clk_n : in STD_LOGIC;
      c0_ddr4_act_n : out STD_LOGIC;
      c0_ddr4_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
      c0_ddr4_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
      c0_ddr4_bg : out STD_LOGIC_VECTOR ( 0 to 0 );
      c0_ddr4_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
      c0_ddr4_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
      c0_ddr4_cs_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
      c0_ddr4_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
      c0_ddr4_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
      c0_ddr4_reset_n : out STD_LOGIC;
      c0_ddr4_dm_dbi_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
      c0_ddr4_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
      c0_ddr4_dqs_c : inout STD_LOGIC_VECTOR ( 7 downto 0 );
      c0_ddr4_dqs_t : inout STD_LOGIC_VECTOR ( 7 downto 0 );
      c0_init_calib_complete : out STD_LOGIC;
      c0_ddr4_ui_clk : out STD_LOGIC;
      addn_ui_clkout1 : out STD_LOGIC;
      c0_ddr4_ui_clk_sync_rst : out STD_LOGIC;
      dbg_clk : out STD_LOGIC;
      c0_ddr4_app_addr : in STD_LOGIC_VECTOR ( 28 downto 0 );
      c0_ddr4_app_cmd : in STD_LOGIC_VECTOR ( 2 downto 0 );
      c0_ddr4_app_en : in STD_LOGIC;
      c0_ddr4_app_hi_pri : in STD_LOGIC;
      c0_ddr4_app_wdf_data : in STD_LOGIC_VECTOR ( 511 downto 0 );
      c0_ddr4_app_wdf_end : in STD_LOGIC;
      c0_ddr4_app_wdf_mask : in STD_LOGIC_VECTOR ( 63 downto 0 );
      c0_ddr4_app_wdf_wren : in STD_LOGIC;
      c0_ddr4_app_rd_data : out STD_LOGIC_VECTOR ( 511 downto 0 );
      c0_ddr4_app_rd_data_end : out STD_LOGIC;
      c0_ddr4_app_rd_data_valid : out STD_LOGIC;
      c0_ddr4_app_rdy : out STD_LOGIC;
      c0_ddr4_app_wdf_rdy : out STD_LOGIC;
      dbg_bus : out STD_LOGIC_VECTOR ( 511 downto 0 )
  );

end component;
  component uartTopGenericEasilyConfigurable is
	    generic (
	                    baud_rate  : integer:= 115200;
	                    clock_frequency : integer := 100000000);
	      port ( -- global signals
	               reset     : in  std_logic;                     -- global reset input
	               clk       : in  std_logic;                     -- global clock input
	               -- uart serial signals
	               serIn     : in  std_logic;                     -- serial data input
	               serOut    : out std_logic;                     -- serial data output
	               -- pipe signals for tx/rx.
	               uart_rx_pipe_read_data:  out  std_logic_vector (7 downto 0);
	               uart_rx_pipe_read_req:   in   std_logic_vector (0 downto 0);
	               uart_rx_pipe_read_ack:   out  std_logic_vector (0 downto 0);
	               uart_tx_pipe_write_data: in   std_logic_vector (7 downto 0);
	               uart_tx_pipe_write_req:  in   std_logic_vector (0 downto 0);
	               uart_tx_pipe_write_ack:  out  std_logic_vector (0 downto 0));
	        end component;


  component nic_mac_pipe_reset is
	port(
		clk : in std_logic;

		ENABLE_MAC_pipe_data: in std_logic; 
		ENABLE_MAC_pipe_req : in std_logic;
		ENABLE_MAC_pipe_ack : out std_logic;

		reset : out std_logic);
  end component;

component ETH_TOP is
port(
    -------------------------------------
    -- Clock: 125MHz LVDS
    -- Reset: Push button, active low
    --------------------------------------
    CLKREF_P : in std_logic;
    CLKREF_N : in std_logic; 
    reset : in std_logic;

    ------- Leds -------
    led : out std_logic_vector(7 downto 0);
    dummy_port_in : in std_logic;
    
    clk_125mhz_int : out std_logic;
    clock_100mhz_int : out std_logic;
    clock_70mhz_int : out std_logic;
    rst_125mhz_int : out std_logic; 

    ---------------------------------
    ---- Ethernet: 1000BASE-T SGMII
    ---------------------------------
    phy_sgmii_rx_p : in std_logic; 
    phy_sgmii_rx_n : in std_logic;
    phy_sgmii_tx_p : out std_logic;
    phy_sgmii_tx_n : out std_logic;
    phy_sgmii_clk_p : in std_logic;
    phy_sgmii_clk_n : in std_Logic;
    phy_int_n : in std_logic;
    phy_mdio : inout std_logic;
    phy_mdc : out std_logic;


    ---------------------
    -- AHIR PIPES
    ----------------------
    rx_pipe_data : out std_logic_vector(9 downto 0);
    rx_pipe_ack : out std_logic_vector(0 downto 0);
    rx_pipe_req : in std_logic_vector(0 downto 0);
     
    tx_pipe_data : in std_logic_vector(9 downto 0);
    tx_pipe_ack : in std_logic_vector(0 downto 0);
    tx_pipe_req : out std_logic_vector(0 downto 0));
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


  signal PROCESSOR_MODE: std_logic_vector(15 downto 0);


   
   -- to generate a 156 and 80  Mhz clock
   component clk_wiz_0
   port
    (-- Clock in ports
     -- Clock out ports
     clk_out1          : out    std_logic; -- 125 Mhz Clock
     -- Status and control signals
     reset             : in     std_logic;
     locked            : out    std_logic;
     clk_in1_p         : in     std_logic;
     clk_in1_n         : in     std_logic
    );
   end component;
   
	component ila_1 is
		port (
		         clk : in std_logic; --input wire clk
		         probe0 : in std_logic; --input wire [0:0]  probe0
		         probe1 : in std_logic_vector(31 downto 0); --input wire [31:0]  probe1
		         probe2 : in std_logic_vector(3 downto 0); --input wire [3:0]  probe2
		         probe3 : in std_logic; --input wire [0:0]  probe3
		         probe4 : in std_logic; --input wire [0:0]  probe4
		         probe5 : in std_logic; --input wire [0:0]  probe5
		         probe6 : in std_logic; --input wire [0:0]  probe6
		         probe7 : in std_logic_vector(31 downto 0); --input wire [31:0]  probe7
		         probe8 : in std_logic_vector(3 downto 0); --input wire [3:0]  probe8
		         probe9 : in std_logic; --input wire [0:0]  probe9
		         probe10 : in std_logic; --input wire [0:0]  probe10
		         probe11 : in std_logic);
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

  COMPONENT vio_1 is
	    PORT (
	        clk : IN STD_LOGIC;
	        probe_in0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	        probe_in1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	        probe_in2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	        probe_out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	        probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		  );
  END COMPONENT;
  component ila_2 is 
	  port(
	  	clk : in std_logic ;
	  	probe0 : in std_logic_vector(9 downto 0); 
	  	probe1 : in std_logic_vector(0 downto 0);
	  	probe2 : in std_logic_vector(0 downto 0);
	  	probe3 : in std_logic_vector(9 downto 0);
	  	probe4 : in std_logic_vector(0 downto 0);
	  	probe5 : in std_logic_vector(0 downto 0));
  end component;

   signal MAIN_MEM_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_MEM_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
   signal MAIN_MEM_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MAIN_MEM_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_MEM_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_MEM_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);

   signal MAIN_MEM_RESPONSE_DFIFO_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_MEM_RESPONSE_DFIFO_pipe_write_req:std_logic_vector(0 downto 0);
   signal MAIN_MEM_RESPONSE_DFIFO_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MAIN_MEM_REQUEST_DFIFO_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_MEM_REQUEST_DFIFO_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_MEM_REQUEST_DFIFO_pipe_read_ack:std_logic_vector(0  downto 0);

   -- main tap bus signals (including buffering)
   signal MAIN_TAP_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MAIN_TAP_RESPONSE_pipe_write_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_RESPONSE_pipe_write_ack:std_logic_vector(0  downto 0);

   signal MAIN_TAP_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MAIN_TAP_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MAIN_TAP_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);
	
   signal AFB_TAP_RESPONSE_pipe_write_data:std_logic_vector(32 downto 0);
   signal AFB_TAP_RESPONSE_pipe_write_req:std_logic_vector(0  downto 0);
   signal AFB_TAP_RESPONSE_pipe_write_ack:std_logic_vector(0  downto 0);

   signal AFB_TAP_REQUEST_pipe_read_data:std_logic_vector(73 downto 0);
   signal AFB_TAP_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal AFB_TAP_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);


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


   -- mem tap and through signals
   signal MEM1_TAP_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MEM1_TAP_RESPONSE_pipe_write_req:std_logic_vector(0  downto 0);
   signal MEM1_TAP_RESPONSE_pipe_write_ack:std_logic_vector(0  downto 0);

   signal MEM1_TAP_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MEM1_TAP_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MEM1_TAP_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);

   signal MEM1_THROUGH_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MEM1_THROUGH_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
   signal MEM1_THROUGH_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MEM1_THROUGH_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MEM1_THROUGH_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
   signal MEM1_THROUGH_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);
 
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

   signal MUX_TO_MEM_REQUEST_BUF_dfifo_pipe_read_data:std_logic_vector(109 downto 0);
   signal MUX_TO_MEM_REQUEST_BUF_dfifo_pipe_read_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_REQUEST_BUF_dfifo_pipe_read_ack:std_logic_vector(0 downto 0);
   
   signal MUX_TO_MEM_RESPONSE_BUF_dfifo_pipe_write_data:std_logic_vector(64 downto 0);
   signal MUX_TO_MEM_RESPONSE_BUF_dfifo_pipe_write_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MEM_RESPONSE_BUF_dfifo_pipe_write_ack:std_logic_vector(0 downto 0);

   signal MUX_TO_MUX_REQUEST_pipe_read_data:std_logic_vector(109 downto 0);
   signal MUX_TO_MUX_REQUEST_pipe_read_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MUX_REQUEST_pipe_read_ack:std_logic_vector(0 downto 0);
   
   signal MUX_TO_MUX_RESPONSE_pipe_write_data:std_logic_vector(64 downto 0);
   signal MUX_TO_MUX_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
   signal MUX_TO_MUX_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);
   
   

   --
  
   --signal reset : std_logic; 
   signal reset1,reset2, reset_sync_pre_buf, reset_sync: std_logic;
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

   signal MAX_ADDR_TAP_MEM : std_logic_vector(35 downto 0);
   signal MIN_ADDR_TAP_MEM : std_logic_vector(35 downto 0);
   
   -- ACB to AFB bridge and queues(Dual clocked fifos)
   signal AFB_NIC_REQUEST_pipe_read_data : std_logic_vector(73 downto 0);
   signal AFB_NIC_REQUEST_pipe_read_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal AFB_NIC_RESPONSE_pipe_write_data : std_logic_vector(32 downto 0);
   signal AFB_NIC_RESPONSE_pipe_write_req : std_logic_vector(0 downto 0);
   signal AFB_NIC_RESPONSE_pipe_write_ack : std_logic_vector(0 downto 0);
   
   -- NIC to mem
   signal NIC_TO_MEMORY_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
   signal NIC_TO_MEMORY_REQUEST_pipe_read_req : std_logic_vector(0 downto 0);
   signal NIC_TO_MEMORY_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal MEMORY_TO_NIC_RESPONSE_pipe_write_data : std_logic_vector(64 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_pipe_write_req : std_logic_vector(0 downto 0);
   signal MEMORY_TO_NIC_RESPONSE_pipe_write_ack : std_logic_vector(0 downto 0);
   
   signal PROG_TO_MEMORY_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
   signal PROG_TO_MEMORY_REQUEST_pipe_read_req : std_logic_vector(0 downto 0);
   signal PROG_TO_MEMORY_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal MEMORY_TO_PROG_RESPONSE_pipe_read_data : std_logic_vector(64 downto 0);
   signal MEMORY_TO_PROG_RESPONSE_pipe_read_req : std_logic_vector(0 downto 0);
   signal MEMORY_TO_PROG_RESPONSE_pipe_read_ack : std_logic_vector(0 downto 0);
   
   
   signal OUT_TO_MEMORY_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
   signal OUT_TO_MEMORY_REQUEST_pipe_read_req : std_logic_vector(0 downto 0);
   signal OUT_TO_MEMORY_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal MEMORY_TO_IN_RESPONSE_pipe_read_data : std_logic_vector(64 downto 0);
   signal MEMORY_TO_IN_RESPONSE_pipe_read_req : std_logic_vector(0 downto 0);
   signal MEMORY_TO_IN_RESPONSE_pipe_read_ack : std_logic_vector(0 downto 0);
   
   signal rx_pipe_data :  std_logic_vector(9 downto 0);
   signal rx_pipe_ack :  std_logic_vector(0 downto 0);
   signal rx_pipe_req :  std_logic_vector(0 downto 0);

   signal tx_pipe_data : std_logic_vector(9 downto 0);
   signal tx_pipe_ack :  std_logic_vector(0 downto 0);
   signal tx_pipe_req :  std_logic_vector(0 downto 0);
   
   
   signal NIC_FIFO_pipe_read_data : std_logic_vector (72 downto 0);
   signal NIC_FIFO_pipe_read_req : std_logic_vector (0 downto 0);
   signal NIC_FIFO_pipe_read_ack : std_logic_vector (0 downto 0);
   
   signal PROG_FIFO_pipe_read_data : std_logic_vector (72 downto 0);
   signal PROG_FIFO_pipe_read_req : std_logic_vector (0 downto 0);
   signal PROG_FIFO_pipe_read_ack : std_logic_vector (0 downto 0);
   
   signal PROG_RET_pipe_write_req : std_logic_vector(0 downto 0);
   signal PROG_RET_pipe_write_ack : std_logic_vector(0 downto 0);
   signal PROG_RET_pipe_write_data : std_logic_vector(72 downto 0);
   signal NIC_TX_pipe_write_req : std_logic_vector(0 downto 0);
   signal NIC_TX_pipe_write_ack : std_logic_vector(0 downto 0);
   signal NIC_TX_pipe_write_data : std_logic_vector(72 downto 0);
   
   signal prog : std_logic;
   
   signal RX_FIFO_pipe_read_data : std_logic_vector (72 downto 0);
   signal RX_FIFO_pipe_read_req : std_logic_vector (0 downto 0);
   signal RX_FIFO_pipe_read_ack : std_logic_vector (0 downto 0);
   
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

	signal AFB_TAP_RESP_DATA : std_logic_vector(32 downto 0);
	signal AFB_TAP_RESP_REQ : std_logic_vector(0 downto 0);
	signal AFB_TAP_RESP_ACK : std_logic_vector(0 downto 0);

	signal scl_in, sda_in, scl_pull_down, sda_pull_down : std_logic_vector(0 downto 0);
	signal driven_scl_out, driven_sda_out: std_logic_vector(0 downto 0);
	signal MAX_ADDR_TAP_AFB, MIN_ADDR_TAP_AFB : std_logic_vector(35 downto 0);

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
   
   
   signal rst_125mhz_int,clk_125mhz_int, clock_70mhz_int,clock_100mhz_int,reset_a,reset_clk : std_logic;

   signal CPU_RESET : std_logic_vector(0 downto 0);
   signal DEBUG_MODE : std_logic_vector(0 downto 0);
   signal SINGLE_STEP_MODE : std_logic_vector(0 downto 0);
   signal CPU_MODE : std_logic_vector(1 downto 0);

   signal clk_in_p,clk_in_n,sys_rst,clk_rst,soft_rst,mmcm_locked_out,axi_lite_resetn : std_logic;
   signal axis_rstn,sys_out_rst,clkgen_gtx_clk,ref_clk,ref_clk_50_bufg,axis_clk,axi_lite_clk : std_logic;

   -- vio connections
	signal phy_rst_n : std_logic;
	signal mtrlb_activity_flash,mtrlb_pktchk_error,control_ready : std_logic_vector(0 downto 0);
	signal control_valid, start_config : std_logic_vector(0 downto 0);
	signal control_data : std_logic_vector(3 downto 0);

	-- ila connections
	signal s_axis_txc_tlast,s_axis_txc_tready,s_axis_txc_tvalid : std_logic;
	signal s_axis_txd_tlast,s_axis_txd_tready,s_axis_txd_tvalid : std_logic;
	signal m_axis_rxd_tlast,m_axis_rxd_tready,m_axis_rxd_tvalid : std_logic;
	signal m_axis_rxs_tlast,m_axis_rxs_tready,m_axis_rxs_tvalid : std_logic;
	signal s_axis_txc_tdata,s_axis_txd_tdata,m_axis_rxd_tdata,m_axis_rxs_tdata : std_logic_vector(31 downto 0);
	signal s_axis_txc_tkeep,s_axis_txd_tkeep,m_axis_rxd_tkeep,m_axis_rxs_tkeep : std_logic_vector(3  downto 0);

	
  signal i1,i2,i3,o1,o2,o3,o4 : std_logic;

  signal clock_proc, reset_proc : std_logic;
   -- ADDITIONAL SIGNALS FOR MAC + NIC + SWITCH 

	-- DRAM connections
signal app_addr :  STD_LOGIC_VECTOR ( 28 downto 0 );
signal app_cmd  :  STD_LOGIC_VECTOR ( 2 downto 0 );
signal app_en   :  STD_LOGIC;
signal app_wdf_data :  STD_LOGIC_VECTOR ( 511 downto 0 );
signal app_wdf_end  :  STD_LOGIC;
signal app_wdf_mask :  STD_LOGIC_VECTOR ( 63 downto 0 );
signal app_wdf_wren :  STD_LOGIC;
signal app_rd_data  :  STD_LOGIC_VECTOR ( 511 downto 0 );
signal app_rd_data_end   :  STD_LOGIC;
signal app_rd_data_valid :  STD_LOGIC;
signal app_rdy     :  STD_LOGIC;
signal app_wdf_rdy :  STD_LOGIC;
signal app_sr_req  :  STD_LOGIC;
signal app_ref_req :  STD_LOGIC;
signal app_zq_req  :  STD_LOGIC;
signal app_sr_active :  STD_LOGIC;
signal app_ref_ack   :  STD_LOGIC;
signal app_zq_ack    :  STD_LOGIC;
signal ui_clk        :  STD_LOGIC;
signal ui_clk_sync_rst   :  STD_LOGIC;
signal init_calib_complete :  STD_LOGIC;

signal clk_125mhz_int_n, clk_125mhz_int_p: std_logic;

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
   --CONFIG_UART_BAUD_CONTROL_WORD <= X"0bed0048";
   CONFIG_UART_BAUD_CONTROL_WORD <= X"3b890180";

   --reset <= enable_reset(0);
   reset_sync_mac <= rst_125mhz_int;
   reset_sync <= rst_125mhz_int;
   clock <= clk_125mhz_int;
   clock_proc <= clock_100mhz_int;
   clock_mac <= clk_125mhz_int;


--    -- VIO for reset 
    virtual_reset : vio_0
        port map (
                        clk => clock_100mhz_int,
                        probe_in0 =>  lock,
                        probe_in1 =>  CPU_MODE(1),
                        probe_in2 =>  CPU_MODE(0),
                        probe_out0 => reset_proc,
                        probe_out1 => reset_clk,
                        probe_out2 => CPU_RESET(0),
                        probe_out3 => DEBUG_MODE(0),
                        probe_out4 => SINGLE_STEP_MODE(0));


    -- VIO for reset 
    virtual_reset_mac : vio_0
        port map (
                        clk => clock_mac,
                        probe_in0 =>  i1,
                       	probe_in1 =>  i2,
                        probe_in2 =>  i3,
                        probe_out0 => prog,
                        probe_out1 => o1,
                        probe_out2 => o2,
                        probe_out3 => o3,
                        probe_out4 => o4);
 
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
      		clk => clock_proc,
      		reset => reset_proc
	);
   	CPU_MODE <= PROCESSOR_MODE(1 downto 0);


  ---------------------------------------------------------------------------
  -- DFIFOS for 100 to 125 MHz 
  ---------------------------------------------------------------------------

   DualClockedQueue_ACB_req_instance: DualClockedQueue_ACB_req  -- done
	port map( 
		    -- read 
		    read_req_in => MAIN_MEM_REQUEST_DFIFO_pipe_read_req(0),
		    read_data_out => MAIN_MEM_REQUEST_DFIFO_pipe_read_data,
		    read_ack_out => MAIN_MEM_REQUEST_DFIFO_pipe_read_ack(0),
		    -- write 
		    write_req_out => MAIN_MEM_REQUEST_pipe_read_req(0),
		    write_data_in => MAIN_MEM_REQUEST_pipe_read_data,
		    write_ack_in => MAIN_MEM_REQUEST_pipe_read_ack(0),
		
		    read_clk => clock_mac,
		    write_clk => clock_proc,
		    
		    reset => reset_sync_mac);	
	
	DualClockedQueue_ACB_resp_inst : DualClockedQueue_ACB_resp -- done
		port map( 
		    -- read
		    read_req_in => MAIN_MEM_RESPONSE_pipe_write_ack(0),
		    read_data_out =>MAIN_MEM_RESPONSE_pipe_write_data,
		    read_ack_out => MAIN_MEM_RESPONSE_pipe_write_req(0),
		    -- write 
		    write_req_out => MAIN_MEM_RESPONSE_DFIFO_pipe_write_ack(0),
		    write_data_in => MAIN_MEM_RESPONSE_DFIFO_pipe_write_data,
		    write_ack_in => MAIN_MEM_RESPONSE_DFIFO_pipe_write_req(0),
		
		    read_clk => clock_proc,
		    write_clk => clock_mac,
		    
		    reset => reset_proc);
  ---------------------------------------------------------------------------
  -- ACB fast tap!  
  ---------------------------------------------------------------------------
	main_tap: acb_fast_tap  -- done
		port map (
				clk => clock_mac, reset => reset_sync_mac,

    				CORE_BUS_REQUEST_pipe_write_data => MAIN_MEM_REQUEST_DFIFO_pipe_read_data, -- in
    				CORE_BUS_REQUEST_pipe_write_req  => MAIN_MEM_REQUEST_DFIFO_pipe_read_ack, -- in
    				CORE_BUS_REQUEST_pipe_write_ack  => MAIN_MEM_REQUEST_DFIFO_pipe_read_req, -- out

    				CORE_BUS_RESPONSE_pipe_read_data => MAIN_MEM_RESPONSE_DFIFO_pipe_write_data, -- out
    				CORE_BUS_RESPONSE_pipe_read_req  => MAIN_MEM_RESPONSE_DFIFO_pipe_write_ack, -- in
    				CORE_BUS_RESPONSE_pipe_read_ack  => MAIN_MEM_RESPONSE_DFIFO_pipe_write_req, -- out

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
		AFB_BUS_RESPONSE_pipe_write_data => AFB_TAP_RESPONSE_pipe_write_data, -- in 
		AFB_BUS_RESPONSE_pipe_write_req  => AFB_TAP_RESPONSE_pipe_write_ack, -- in
		AFB_BUS_RESPONSE_pipe_write_ack  => AFB_TAP_RESPONSE_pipe_write_req, -- out
		CORE_BUS_REQUEST_pipe_write_data => MAIN_TAP_REQUEST_BUF_pipe_read_data, -- in
		CORE_BUS_REQUEST_pipe_write_req  => MAIN_TAP_REQUEST_BUF_pipe_read_req, -- in
		CORE_BUS_REQUEST_pipe_write_ack  => MAIN_TAP_REQUEST_BUF_pipe_read_ack, -- out
		AFB_BUS_REQUEST_pipe_read_data 	 => AFB_TAP_REQUEST_pipe_read_data, -- out
		AFB_BUS_REQUEST_pipe_read_req    => AFB_TAP_REQUEST_pipe_read_req, -- in
		AFB_BUS_REQUEST_pipe_read_ack    => AFB_TAP_REQUEST_pipe_read_ack, -- out
		CORE_BUS_RESPONSE_pipe_read_data => MAIN_TAP_RESPONSE_BUF_pipe_write_data, -- out
		CORE_BUS_RESPONSE_pipe_read_req  => MAIN_TAP_RESPONSE_BUF_pipe_write_ack, -- in
		CORE_BUS_RESPONSE_pipe_read_ack  => MAIN_TAP_RESPONSE_BUF_pipe_write_req -- out
  );
   ---------------------------------------------------------------------------
  -- AFB fast tap!  
  ---------------------------------------------------------------------------
 
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
  
  acb_proc_mux: acb_fast_mux   -- done
	port map( 
		clk => clock_mac, reset => reset_sync_mac,
		CORE_BUS_REQUEST_HIGH_pipe_write_data => MAIN_THROUGH_REQUEST_BUF_pipe_read_data, -- in
		CORE_BUS_REQUEST_HIGH_pipe_write_req  => MAIN_THROUGH_REQUEST_BUF_pipe_read_req, -- in
		CORE_BUS_REQUEST_HIGH_pipe_write_ack  => MAIN_THROUGH_REQUEST_BUF_pipe_read_ack, -- out
		CORE_BUS_REQUEST_LOW_pipe_write_data  => NIC_TO_MEMORY_REQUEST_pipe_read_data, -- in
		CORE_BUS_REQUEST_LOW_pipe_write_req   => NIC_TO_MEMORY_REQUEST_pipe_read_ack, -- in
		CORE_BUS_REQUEST_LOW_pipe_write_ack   => NIC_TO_MEMORY_REQUEST_pipe_read_req, -- out
		CORE_BUS_RESPONSE_pipe_write_data     => MUX_TO_MEM_RESPONSE_pipe_write_data, -- in
		CORE_BUS_RESPONSE_pipe_write_req      => MUX_TO_MEM_RESPONSE_pipe_write_req, -- in
		CORE_BUS_RESPONSE_pipe_write_ack      => MUX_TO_MEM_RESPONSE_pipe_write_ack, -- out
		CORE_BUS_REQUEST_pipe_read_data       => MUX_TO_MEM_REQUEST_pipe_read_data, --out
		CORE_BUS_REQUEST_pipe_read_req        => MUX_TO_MEM_REQUEST_pipe_read_ack, -- in
		CORE_BUS_REQUEST_pipe_read_ack        => MUX_TO_MEM_REQUEST_pipe_read_req, -- out
		CORE_BUS_RESPONSE_HIGH_pipe_read_data => MAIN_THROUGH_RESPONSE_BUF_pipe_write_data, -- out
		CORE_BUS_RESPONSE_HIGH_pipe_read_req  => MAIN_THROUGH_RESPONSE_BUF_pipe_write_ack, -- in
		CORE_BUS_RESPONSE_HIGH_pipe_read_ack  => MAIN_THROUGH_RESPONSE_BUF_pipe_write_req, -- out
		CORE_BUS_RESPONSE_LOW_pipe_read_data  => MEMORY_TO_NIC_RESPONSE_pipe_write_data, -- out
		CORE_BUS_RESPONSE_LOW_pipe_read_req   => MEMORY_TO_NIC_RESPONSE_pipe_write_ack, -- in
		CORE_BUS_RESPONSE_LOW_pipe_read_ack   => MEMORY_TO_NIC_RESPONSE_pipe_write_req -- out
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
  
  nic_instance : nic_system 			-- TODO : done
	port map( 
		clk => clock_mac, 
		reset => reset_sync_mac,
 		AFB_NIC_REQUEST_pipe_write_data => AFB_TAP_REQUEST_pipe_read_data, --AFB_NIC_REQUEST_tap_pipe_read_data, -- in
		AFB_NIC_REQUEST_pipe_write_req => AFB_TAP_REQUEST_pipe_read_req, --AFB_NIC_REQUEST_tap_pipe_read_ack, -- in
		AFB_NIC_REQUEST_pipe_write_ack => AFB_TAP_REQUEST_pipe_read_ack, -- out
		AFB_NIC_RESPONSE_pipe_read_data => AFB_TAP_RESPONSE_pipe_write_data, -- out
		AFB_NIC_RESPONSE_pipe_read_req => AFB_TAP_RESPONSE_pipe_write_req, -- in
		AFB_NIC_RESPONSE_pipe_read_ack  => AFB_TAP_RESPONSE_pipe_write_ack, -- out
		MEMORY_TO_NIC_RESPONSE_pipe_write_data => MEMORY_TO_IN_RESPONSE_pipe_read_data, -- in
		MEMORY_TO_NIC_RESPONSE_pipe_write_req => MEMORY_TO_IN_RESPONSE_pipe_read_req, -- in
		MEMORY_TO_NIC_RESPONSE_pipe_write_ack => MEMORY_TO_IN_RESPONSE_pipe_read_ack, -- out
		NIC_TO_MEMORY_REQUEST_pipe_read_data => OUT_TO_MEMORY_REQUEST_pipe_read_data, -- out
		NIC_TO_MEMORY_REQUEST_pipe_read_req => OUT_TO_MEMORY_REQUEST_pipe_read_req, -- in
		NIC_TO_MEMORY_REQUEST_pipe_read_ack => OUT_TO_MEMORY_REQUEST_pipe_read_ack, -- out
		
		-----------------------------------------
   		enable_mac_pipe_read_data => enable_mac_pipe_read_data, --out
    		enable_mac_pipe_read_req =>  enable_mac_pipe_read_req, --in
    		enable_mac_pipe_read_ack =>  enable_mac_pipe_read_ack, -- out
		-----------------------------
		mac_to_nic_data_pipe_write_data => NIC_FIFO_pipe_read_data, -- in
		mac_to_nic_data_pipe_write_req => NIC_FIFO_pipe_read_ack, -- in
		mac_to_nic_data_pipe_write_ack => NIC_FIFO_pipe_read_req, -- out
		
		nic_to_mac_transmit_pipe_pipe_read_data => NIC_TX_pipe_write_data, --out
		nic_to_mac_transmit_pipe_pipe_read_req => NIC_TX_pipe_write_req, -- in
		nic_to_mac_transmit_pipe_pipe_read_ack => NIC_TX_pipe_write_ack -- out
		-----------------------------
	); 
	bootloader : ethernet_boot
	port map(
		
		clk => clock_mac, 
		reset => reset_sync_mac,
    		mac_to_prog_pipe_write_data => PROG_FIFO_pipe_read_data, --in
    		mac_to_prog_pipe_write_req => PROG_FIFO_pipe_read_ack, --in
    		mac_to_prog_pipe_write_ack => PROG_FIFO_pipe_read_req, --out
    		prog_to_mac_pipe_read_data => PROG_RET_pipe_write_data, -- out std_logic_vector(72 downto 0);
		prog_to_mac_pipe_read_req => PROG_RET_pipe_write_req, --in std_logic_vector(0 downto 0);
    		prog_to_mac_pipe_read_ack => PROG_RET_pipe_write_ack, --out std_logic_vector(0 downto 0)); -- 
		MEMORY_TO_PROG_RESPONSE_pipe_write_data => MEMORY_TO_PROG_RESPONSE_pipe_read_data, -- in
		MEMORY_TO_PROG_RESPONSE_pipe_write_req => MEMORY_TO_PROG_RESPONSE_pipe_read_req, -- in
		MEMORY_TO_PROG_RESPONSE_pipe_write_ack => MEMORY_TO_PROG_RESPONSE_pipe_read_ack, -- out
		PROG_TO_MEMORY_REQUEST_pipe_read_data => PROG_TO_MEMORY_REQUEST_pipe_read_data, -- out
		PROG_TO_MEMORY_REQUEST_pipe_read_req => PROG_TO_MEMORY_REQUEST_pipe_read_req, -- in
		PROG_TO_MEMORY_REQUEST_pipe_read_ack => PROG_TO_MEMORY_REQUEST_pipe_read_ack -- out
		);

	--------------
	-- Programmer 
	--------------
	PROG_FIFO_pipe_read_data <= RX_FIFO_pipe_read_data;
	NIC_FIFO_pipe_read_data <= RX_FIFO_pipe_read_data;
	-- ACTIVE HIGH hence else "0". If ACTIVE LOW, use else "1"
	PROG_FIFO_pipe_read_ack <= RX_FIFO_pipe_read_ack when prog = '1' else "0";
	NIC_FIFO_pipe_read_ack <= RX_FIFO_pipe_read_ack when prog = '0' else "0";
	RX_FIFO_pipe_read_req <= NIC_FIFO_pipe_read_req when prog = '0' else PROG_FIFO_pipe_read_req;

	TX_FIFO_pipe_write_data <=  PROG_RET_pipe_write_data when prog = '1' else NIC_TX_pipe_write_data;
	TX_FIFO_pipe_write_ack <=  NIC_TX_pipe_write_ack when prog = '0' else PROG_RET_pipe_write_ack;
	PROG_RET_pipe_write_req <= TX_FIFO_pipe_write_req when prog = '1' else "0";
	NIC_TX_pipe_write_req <= TX_FIFO_pipe_write_req when prog = '0' else "0";

 
	NIC_TO_MEMORY_REQUEST_pipe_read_data <= PROG_TO_MEMORY_REQUEST_pipe_read_data when prog = '1' else OUT_TO_MEMORY_REQUEST_pipe_read_data;
	MEMORY_TO_IN_RESPONSE_pipe_read_data <= MEMORY_TO_NIC_RESPONSE_pipe_write_data;
	MEMORY_TO_PROG_RESPONSE_pipe_read_data <= MEMORY_TO_NIC_RESPONSE_pipe_write_data;

	PROG_TO_MEMORY_REQUEST_pipe_read_req <= NIC_TO_MEMORY_REQUEST_pipe_read_req when prog = '1' else "0";
	OUT_TO_MEMORY_REQUEST_pipe_read_req <= NIC_TO_MEMORY_REQUEST_pipe_read_req when prog = '0' else "0";
	NIC_TO_MEMORY_REQUEST_pipe_read_ack <= OUT_TO_MEMORY_REQUEST_pipe_read_ack when prog = '0' else PROG_TO_MEMORY_REQUEST_pipe_read_ack;
	
	MEMORY_TO_PROG_RESPONSE_pipe_read_req <= MEMORY_TO_NIC_RESPONSE_pipe_write_req when prog = '1' else "0";
	MEMORY_TO_IN_RESPONSE_pipe_read_req <= MEMORY_TO_NIC_RESPONSE_pipe_write_req when prog = '0' else "0";
	MEMORY_TO_NIC_RESPONSE_pipe_write_ack <= MEMORY_TO_IN_RESPONSE_pipe_read_ack when prog = '0' else MEMORY_TO_PROG_RESPONSE_pipe_read_ack;


   
   ----------------------------------

 
   ETH_TOP_inst : ETH_TOP 
   port map(
   	    -------------------------------------
	    -- Clock: 125MHz LVDS
	    -- Reset: Push button, active low
	    --------------------------------------
	    CLKREF_P => CLKREF_P,-- in std_logic;
	    CLKREF_N => CLKREF_N,-- in std_logic;
	    reset => reset,-- in std_logic;

    	    ------- Leds -------
	    led => led,-- out std_logic_vector(7 downto 0);
	    dummy_port_in => dummy_port_in,-- in std_logic;

	    clk_125mhz_int => clk_125mhz_int, -- out std_logic;
	    clock_100mhz_int => clock_100mhz_int, -- out std_logic;
	    clock_70mhz_int => clock_70mhz_int, -- out std_logic;
	    rst_125mhz_int => rst_125mhz_int, -- out_std_logic;
	
	    ---------------------------------
	    ---- Ethernet: 1000BASE-T SGMII
	    ---------------------------------
	    phy_sgmii_rx_p => phy_sgmii_rx_p,-- in std_logic;
	    phy_sgmii_rx_n => phy_sgmii_rx_n,-- in std_logic;
	    phy_sgmii_tx_p => phy_sgmii_tx_p,-- out std_logic;
	    phy_sgmii_tx_n => phy_sgmii_tx_n,-- out std_logic;
	    phy_sgmii_clk_p =>phy_sgmii_clk_p ,-- in std_logic;
	    phy_sgmii_clk_n => phy_sgmii_clk_n,-- in std_Logic;
	    phy_int_n => phy_int_n,-- in std_logic;
	    phy_mdio => phy_mdio,-- inout std_logic;
	    phy_mdc => phy_mdc,-- out std_logic;


	    ---------------------
	    -- AHIR PIPES
    	    ----------------------
	    rx_pipe_data => rx_pipe_data,-- out std_logic_vector(9 dwonto 0);
	    rx_pipe_ack => rx_pipe_ack,-- out std_logic_vector(0 dwonto 0);
	    rx_pipe_req => rx_pipe_req,-- in std_logic_vector(0 dwonto 0);

	    tx_pipe_data => tx_pipe_data,-- in std_logic_vector(9 dwonto 0);
	    tx_pipe_ack => tx_pipe_ack,-- in std_logic_vector(0 dwonto 0);
	    tx_pipe_req => tx_pipe_req); -- out std_logic_vector(0 dwonto 0));

   ila_2_inst : ila_2
   	port map(
		clk => clock_mac,
		probe0 => rx_pipe_data,
		probe1 => (others => clock_proc),
		probe2 => (others => ui_clk),--
		probe3 => tx_pipe_data,--
		probe4 => tx_pipe_ack, --tx_pipe_req
		probe5 => tx_pipe_req);

    rx_concat_inst : rx_concat_system 
           port map(--
                 clk => clock_mac, --in std_logic;
                 reset => reset_sync_mac, --enable_reset(0),--gtx_clk_reset, --in std_logic;
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
             reset => reset_sync_mac, --enable_reset(0), --gtx_clk_reset, --in std_logic;
             tx_in_pipe_pipe_write_data => TX_FIFO_pipe_write_data, --in std_logic_vector(72 downto 0);
             tx_in_pipe_pipe_write_req => TX_FIFO_pipe_write_ack, --in std_logic_vector(0 downto 0);
             tx_in_pipe_pipe_write_ack => TX_FIFO_pipe_write_req, --out std_logic_vector(0 downto 0);
             tx_out_pipe_pipe_read_data => tx_pipe_data, --out std_logic_vector(9 downto 0);
             tx_out_pipe_pipe_read_req =>  tx_pipe_req, --in std_logic_vector(0 downto 0);
             tx_out_pipe_pipe_read_ack => tx_pipe_ack --out std_logic_vector(0 downto 0)
             );   	
   	
  	 nic_mac_reset_sync : nic_mac_pipe_reset 
	port map(
		clk => clock_mac,

		ENABLE_MAC_pipe_data => enable_mac_pipe_read_data(0),
		ENABLE_MAC_pipe_req => enable_mac_pipe_read_ack(0),
		ENABLE_MAC_pipe_ack =>  enable_mac_pipe_read_req(0),

		reset => enable_reset(0)
	);

  ---------------------------------------------------------------------------
  -- DFIFOS for 100 to 125 MHz 
  ---------------------------------------------------------------------------

	DualClockedQueue_ACB_req_instance_memside: DualClockedQueue_ACB_req  -- done
		port map( 
		    -- read 
		    read_req_in => MUX_TO_MEM_REQUEST_BUF_dfifo_pipe_read_req(0),
		    read_data_out => MUX_TO_MEM_REQUEST_BUF_dfifo_pipe_read_data,
		    read_ack_out => MUX_TO_MEM_REQUEST_BUF_dfifo_pipe_read_ack(0),
		    -- write 
		    write_req_out => MUX_TO_MEM_REQUEST_BUF_pipe_read_ack(0),
		    write_data_in => MUX_TO_MEM_REQUEST_BUF_pipe_read_data,
		    write_ack_in => MUX_TO_MEM_REQUEST_BUF_pipe_read_req(0),
		
		    read_clk => ui_clk,
		    write_clk => clock_mac,
		    
		    reset => ui_clk_sync_rst);	
	
	DualClockedQueue_ACB_resp_inst_memside : DualClockedQueue_ACB_resp -- done
		port map( 
		    -- read
		    read_req_in => MUX_TO_MEM_RESPONSE_BUF_pipe_write_ack(0),
		    read_data_out =>MUX_TO_MEM_RESPONSE_BUF_pipe_write_data,
		    read_ack_out => MUX_TO_MEM_RESPONSE_BUF_pipe_write_req(0),
		    -- write 
		    write_req_out => MUX_TO_MEM_RESPONSE_BUF_dfifo_pipe_write_ack(0),
		    write_data_in => MUX_TO_MEM_RESPONSE_BUF_dfifo_pipe_write_data,
		    write_ack_in => MUX_TO_MEM_RESPONSE_BUF_dfifo_pipe_write_req(0),
		
		    read_clk => clock_mac,
		    write_clk => ui_clk,

		    reset => reset_sync_mac);
		    
	ACB_to_UI_Inst: ACB_to_UI_EA
	port map(
		ui_clk                                       => ui_clk,
		sys_rst                                      => ui_clk_sync_rst,
		init_calib_complete                          => init_calib_complete,
		app_addr                                     => app_addr,
		app_cmd                                      => app_cmd,
		app_en                                       => app_en,
		app_wdf_data                                 => app_wdf_data, 
		app_wdf_end                                  => app_wdf_end, 
		app_wdf_mask                                 => app_wdf_mask, 
		app_wdf_wren                                 => app_wdf_wren, 
		app_rd_data                                  => app_rd_data,
		app_rd_data_end                              => app_rd_data_end, 
		app_rd_data_valid                            => app_rd_data_valid, 
		app_rdy                                      => app_rdy, 
		app_wdf_rdy                                  => app_wdf_rdy, 
		app_sr_req                                   => app_sr_req,  
		app_ref_req                                  => app_ref_req,  
		app_zq_req                                   => app_zq_req, 
		app_sr_active                                => app_sr_active,
		app_ref_ack                                  => app_ref_ack,
		app_zq_ack                                   => app_zq_ack,
		ui_clk_sync_rst                              => ui_clk_sync_rst,                           
		DRAM_REQUEST_pipe_write_ack                  => MUX_TO_MEM_REQUEST_BUF_dfifo_pipe_read_req,                 
		DRAM_REQUEST_pipe_write_req                  => MUX_TO_MEM_REQUEST_BUF_dfifo_pipe_read_ack,
		DRAM_REQUEST_pipe_write_data                 => MUX_TO_MEM_REQUEST_BUF_dfifo_pipe_read_data,
		DRAM_RESPONSE_pipe_read_req                  => MUX_TO_MEM_RESPONSE_BUF_dfifo_pipe_write_ack,
		DRAM_RESPONSE_pipe_read_ack                  => MUX_TO_MEM_RESPONSE_BUF_dfifo_pipe_write_req,
		DRAM_RESPONSE_pipe_read_data                 => MUX_TO_MEM_RESPONSE_BUF_dfifo_pipe_write_data
		--fatal_error                                  => fatal_error 
    );


  ddr4_0_inst :  ddr4_0
  port map ( 
    sys_rst => reset, --in STD_LOGIC;
    c0_sys_clk_p => c0_sys_clk_p, --c0_sys_clk_p, --in STD_LOGIC;
    c0_sys_clk_n => c0_sys_clk_n, --c0_sys_clk_n, --in STD_LOGIC;
    c0_ddr4_act_n => c0_ddr4_act_n, --out STD_LOGIC;
    c0_ddr4_adr => c0_ddr4_adr, --out STD_LOGIC_VECTOR ( 16 downto 0 );
    c0_ddr4_ba => c0_ddr4_ba, --out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_bg => c0_ddr4_bg, --out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_cke => c0_ddr4_cke, --out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_odt => c0_ddr4_odt, --out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_cs_n => c0_ddr4_cs_n, --out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_ck_t => c0_ddr4_ck_t, --out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_ck_c => c0_ddr4_ck_c, --out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_reset_n => c0_ddr4_reset_n, --out STD_LOGIC;
    c0_ddr4_dm_dbi_n => c0_ddr4_dm_dbi_n, --inout STD_LOGIC_VECTOR ( 8 downto 0 );
    c0_ddr4_dq => c0_ddr4_dq, --inout STD_LOGIC_VECTOR ( 71 downto 0 );
    c0_ddr4_dqs_c => c0_ddr4_dqs_c, --inout STD_LOGIC_VECTOR ( 8 downto 0 );
    c0_ddr4_dqs_t => c0_ddr4_dqs_t, --inout STD_LOGIC_VECTOR ( 8 downto 0 );
    c0_init_calib_complete => init_calib_complete, --out STD_LOGIC;
    c0_ddr4_ui_clk => ui_clk, --out STD_LOGIC;
    c0_ddr4_ui_clk_sync_rst => ui_clk_sync_rst, --out STD_LOGIC;
    --addn_ui_clkout1 => clock_proc,
    --dbg_clk => , --out STD_LOGIC;
    c0_ddr4_app_addr => app_addr, --in STD_LOGIC_VECTOR ( 28 downto 0 );
    c0_ddr4_app_cmd => app_cmd, --in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_app_en => app_en, --in STD_LOGIC;
    c0_ddr4_app_hi_pri => '0', --in STD_LOGIC;
    c0_ddr4_app_wdf_data => app_wdf_data, --in STD_LOGIC_VECTOR ( 511 downto 0 );
    c0_ddr4_app_wdf_end => app_wdf_end, --in STD_LOGIC;
    c0_ddr4_app_wdf_mask => app_wdf_mask, --in STD_LOGIC_VECTOR ( 63 downto 0 );
    c0_ddr4_app_wdf_wren => app_wdf_wren, --in STD_LOGIC;
    c0_ddr4_app_rd_data => app_rd_data, --out STD_LOGIC_VECTOR ( 511 downto 0 );
    c0_ddr4_app_rd_data_end => app_rd_data_end, --out STD_LOGIC;
    c0_ddr4_app_rd_data_valid => app_rd_data_valid, --out STD_LOGIC;
    c0_ddr4_app_rdy => app_rdy, --out STD_LOGIC;
    c0_ddr4_app_wdf_rdy => app_wdf_rdy --out STD_LOGIC
    --dbg_bus =>  --out STD_LOGIC_VECTOR ( 511 downto 0 )
  );


    debug_uart: uartTopGenericEasilyConfigurable
                    generic map(baud_rate => 115200, clock_frequency => 100000000)
                        port map (
                                reset     => reset_proc,
                                clk       => clock_proc,
                                -- uart serial signals
                                serIn     => DEBUG_UART_RX(0),
                                serOut    => DEBUG_UART_TX(0),
                                -- pipe signals for tx/rx.
                                uart_rx_pipe_read_data  =>  MONITOR_to_DEBUG_pipe_write_data,
                                uart_rx_pipe_read_req   =>  MONITOR_to_DEBUG_pipe_write_ack,
                                uart_rx_pipe_read_ack   =>  MONITOR_to_DEBUG_pipe_write_req,
                                uart_tx_pipe_write_data =>  DEBUG_to_MONITOR_pipe_read_data,
                                uart_tx_pipe_write_req  =>  DEBUG_to_MONITOR_pipe_read_ack,
                                uart_tx_pipe_write_ack  =>  DEBUG_to_MONITOR_pipe_read_req
                        );

    serial_uart: uartTopGenericEasilyConfigurable
                        generic map(baud_rate => 115200, clock_frequency => 100000000)
                        port map (
                                 reset     => reset_proc,
                                clk       => clock_proc,
                                -- uart serial signals
                                serIn     => SERIAL_UART_RX(0),
                                serOut    => SERIAL_UART_TX(0),
                                -- pipe signals for tx/rx.
                                uart_rx_pipe_read_data  =>  CONSOLE_to_SERIAL_RX_pipe_write_data,
                                uart_rx_pipe_read_req   =>  CONSOLE_to_SERIAL_RX_pipe_write_ack,
                                uart_rx_pipe_read_ack   =>  CONSOLE_to_SERIAL_RX_pipe_write_req,
                                uart_tx_pipe_write_data =>  SERIAL_TX_to_CONSOLE_pipe_read_data,
                                uart_tx_pipe_write_req  =>  SERIAL_TX_to_CONSOLE_pipe_read_ack,
                                uart_tx_pipe_write_ack  =>  SERIAL_TX_to_CONSOLE_pipe_read_req
                        );
  process (clock_70mhz_int)
  begin
    if (clock_70mhz_int'event and clock_70mhz_int = '1') then
	reset_sync_pre_buf <= reset2;
	reset2 <= reset1;
	reset1 <= reset_sync;
    end if;
  end process;

--  process (clock_mac)
--  begin
--    if (clock_mac'event and clock_mac = '1') then
--	reset_sync_mac <= reset2_mac;
--	reset2_mac <= reset1_mac;
--	reset1_mac <= reset_sync;
--    end if;
--  end process;
-- BUFGs to help vivado out..
  --resetBufg: BUFG port map (I => reset_sync_pre_buf, O => reset_sync);
  --resetBufg_mac: BUFG port map (I => reset_sync_pre_buf_mac, O => reset_sync_mac);
end structure;
