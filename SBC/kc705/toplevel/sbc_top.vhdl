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

library UNISIM;
use UNISIM.vcomponents.all;

entity sbc_kc705 is
port(
	------------------------------------------------------
	-- UARTS
	------------------------------------------------------
        DEBUG_UART_RX : in std_logic_vector(0 downto 0);
        DEBUG_UART_TX : out std_logic_vector(0 downto 0);
        SERIAL_UART_RX : in std_logic_vector(0 downto 0);
        SERIAL_UART_TX : out std_logic_vector(0 downto 0);

    -----------------------------------------------
    -- ETH_KC705(MAC) signals.
    -----------------------------------------------
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
       ------------------------------
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

      -----------------------------------------------
      -- DRAM signals.
      -----------------------------------------------
        ddr3_addr :out std_logic_vector(13 downto 0);
    	ddr3_ba:out std_logic_vector(2 downto 0);
    	ddr3_cas_n:out std_logic;
    	ddr3_ck_n:out std_logic_vector(0 downto 0);
    	ddr3_ck_p:out std_logic_vector(0 downto 0);
    	ddr3_cke:out std_logic_vector(0 downto 0);
    	ddr3_ras_n:out std_logic;
    	ddr3_reset_n:out std_logic;
    	ddr3_we_n:out std_logic;
    	ddr3_dq:inout std_logic_vector(63 downto 0);
    	ddr3_dqs_n:inout std_logic_vector(7 downto 0);
    	ddr3_dqs_p:inout std_logic_vector(7 downto 0);
    	ddr3_cs_n:out std_logic_vector(0 downto 0);
        ddr3_dm:out std_logic_vector(7 downto 0);
    	ddr3_odt:out std_logic_vector(0 downto 0);

      -----------------------------------------------
      -- SPI FLASH signals.
      -----------------------------------------------
        
        SPI_FLASH_CLK  : out std_logic_vector(0 downto 0);
        SPI_FLASH_CS_L : out std_logic_vector(7 downto 0);
        SPI_FLASH_MOSI : out std_logic_vector(0 downto 0);
        SPI_FLASH_MISO : in std_logic_vector(0 downto 0);
      -----------------------------------------------
      -- 200 MHz clock in.
      -----------------------------------------------
      clk_in_p : in std_logic;
      clk_in_n : in std_logic
	);
end entity top_level;

architecture structure of top_level is




    --------------------------------------------------------------
    -- TODO: generate 320 and 200 MHz for DRAM
    --------------------------------------------------------------
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

  -- vio for processor reset
  -- on processor clock.
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
  

  -- vio for mig reset
  --   (on 200 MHz clock)
  COMPONENT vio_1
    PORT (
      clk : IN STD_LOGIC;
      probe_in0 : IN STD_LOGIC;
      probe_out0 : OUT STD_LOGIC
    );
  END COMPONENT;

  -- vio for nic reset
  --  on nic clock.
  COMPONENT vio_2
    PORT (
      clk : IN STD_LOGIC;
      probe_in0 : IN STD_LOGIC;
      probe_out0 : OUT STD_LOGIC
    );
  END COMPONENT;

  component sbc_kc705_core is -- 
  port( -- 
    CLOCK_TO_DRAMCTRL_BRIDGE : in std_logic_vector(0 downto 0);
    CLOCK_TO_NIC : in std_logic_vector(0 downto 0);
    CLOCK_TO_PROCESSOR : in std_logic_vector(0 downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_data : in std_logic_vector(7 downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_req  : in std_logic_vector(0  downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_ack  : out std_logic_vector(0  downto 0);
    DRAM_CONTROLLER_TO_ACB_BRIDGE : in std_logic_vector(521 downto 0);
    MAC_TO_NIC_pipe_write_data : in std_logic_vector(9 downto 0);
    MAC_TO_NIC_pipe_write_req  : in std_logic_vector(0  downto 0);
    MAC_TO_NIC_pipe_write_ack  : out std_logic_vector(0  downto 0);
    MAX_ACB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MAX_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MIN_ACB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MIN_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    RESET_TO_DRAMCTRL_BRIDGE : in std_logic_vector(0 downto 0);
    RESET_TO_NIC : in std_logic_vector(0 downto 0);
    RESET_TO_PROCESSOR : in std_logic_vector(0 downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_data : in std_logic_vector(7 downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_req  : in std_logic_vector(0  downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_ack  : out std_logic_vector(0  downto 0);
    SPI_FLASH_MISO : in std_logic_vector(0 downto 0);
    THREAD_RESET : in std_logic_vector(3 downto 0);
    WRITE_PROTECT : in std_logic_vector(0 downto 0);
    ACB_BRIDGE_TO_DRAM_CONTROLLER : out std_logic_vector(613 downto 0);
    NIC_MAC_RESETN : out std_logic_vector(0 downto 0);
    NIC_TO_MAC_pipe_read_data : out std_logic_vector(9 downto 0);
    NIC_TO_MAC_pipe_read_req  : in std_logic_vector(0  downto 0);
    NIC_TO_MAC_pipe_read_ack  : out std_logic_vector(0  downto 0);
    PROCESSOR_MODE : out std_logic_vector(15 downto 0);
    SERIAL_TX_to_CONSOLE_pipe_read_data : out std_logic_vector(7 downto 0);
    SERIAL_TX_to_CONSOLE_pipe_read_req  : in std_logic_vector(0  downto 0);
    SERIAL_TX_to_CONSOLE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    SOC_DEBUG_to_MONITOR_pipe_read_data : out std_logic_vector(7 downto 0);
    SOC_DEBUG_to_MONITOR_pipe_read_req  : in std_logic_vector(0  downto 0);
    SOC_DEBUG_to_MONITOR_pipe_read_ack  : out std_logic_vector(0  downto 0);
    SPI_FLASH_CLK : out std_logic_vector(0 downto 0);
    SPI_FLASH_CS_L : out std_logic_vector(7 downto 0);
    SPI_FLASH_MOSI : out std_logic_vector(0 downto 0)
    --clk, reset: in std_logic 

    -- 
  );
  --
  end component sbc_kc705_core;
  
  component ETH_KC is
  port
  (
      
       --asynchronous reset
       glbl_rst : in std_logic;

       -- 3 clocks
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

   ------------------------------------------------------------
   -- DRAM controller!
   ------------------------------------------------------------
  component mig_7series_0 is
  Port ( 
    ddr3_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    ddr3_dqs_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_dqs_p : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ddr3_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ddr3_ras_n : out STD_LOGIC;
    ddr3_cas_n : out STD_LOGIC;
    ddr3_we_n : out STD_LOGIC;
    ddr3_reset_n : out STD_LOGIC;
    ddr3_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_dm : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr3_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    sys_clk_i : in STD_LOGIC;
    clk_ref_i : in STD_LOGIC;
    app_addr : in STD_LOGIC_VECTOR ( 27 downto 0 );
    app_cmd : in STD_LOGIC_VECTOR ( 2 downto 0 );
    app_en : in STD_LOGIC;
    app_wdf_data : in STD_LOGIC_VECTOR ( 511 downto 0 );
    app_wdf_end : in STD_LOGIC;
    app_wdf_mask : in STD_LOGIC_VECTOR ( 63 downto 0 );
    app_wdf_wren : in STD_LOGIC;
    app_rd_data : out STD_LOGIC_VECTOR ( 511 downto 0 );
    app_rd_data_end : out STD_LOGIC;
    app_rd_data_valid : out STD_LOGIC;
    app_rdy : out STD_LOGIC;
    app_wdf_rdy : out STD_LOGIC;
    app_sr_req : in STD_LOGIC;
    app_ref_req : in STD_LOGIC;
    app_zq_req : in STD_LOGIC;
    app_sr_active : out STD_LOGIC;
    app_ref_ack : out STD_LOGIC;
    app_zq_ack : out STD_LOGIC;
    ui_clk : out STD_LOGIC;
    ui_clk_sync_rst : out STD_LOGIC;
    init_calib_complete : out STD_LOGIC;
    device_temp : out STD_LOGIC_VECTOR ( 11 downto 0 );
    sys_rst : in STD_LOGIC
  );

end component mig_7series_0;



------------------------------------------------------
-- TODO: Signal Declaration for SBC core. (DONE!!)
------------------------------------------------------
          
   signal CLOCK_TO_DRAMCTRL_BRIDGE, CLOCK_TO_NIC, CLOCK_TO_PROCESSOR : std_logic_vector(0 downto 0);
   signal RESET_TO_DRAMCTRL_BRIDGE, RESET_TO_NIC, RESET_TO_PROCESSOR : std_logic_vector(0 downto 0);

   signal PROCESSOR_MODE : std_logic_vector(15 downto 0);
   signal THREAD_RESET : std_logic_vector(3 downto 0);
   signal WRITE_PROTECT : std_logic_vector(0 downto 0);

   signal SOC_MONITOR_to_DEBUG_pipe_write_data : std_logic_vector(7 downto 0);
   signal SOC_MONITOR_to_DEBUG_pipe_write_req  : std_logic_vector(0  downto 0);
   signal SOC_MONITOR_to_DEBUG_pipe_write_ack  : std_logic_vector(0  downto 0);

   signal SOC_DEBUG_to_MONITOR_pipe_read_data : std_logic_vector(7 downto 0);
   signal SOC_DEBUG_to_MONITOR_pipe_read_req  : std_logic_vector(0  downto 0);
   signal SOC_DEBUG_to_MONITOR_pipe_read_ack  : std_logic_vector(0  downto 0);

   signal CONSOLE_to_SERIAL_RX_pipe_write_data : std_logic_vector(7 downto 0);
   signal CONSOLE_to_SERIAL_RX_pipe_write_req  : std_logic_vector(0  downto 0);
   signal CONSOLE_to_SERIAL_RX_pipe_write_ack  : std_logic_vector(0  downto 0);

   signal SERIAL_TX_to_CONSOLE_pipe_read_data : std_logic_vector(7 downto 0);
   signal SERIAL_TX_to_CONSOLE_pipe_read_req  : std_logic_vector(0  downto 0);
   signal SERIAL_TX_to_CONSOLE_pipe_read_ack  : std_logic_vector(0  downto 0);
   
   signal ACB_BRIDGE_TO_DRAM_CONTROLLER : std_logic_vector(613 downto 0);
   signal DRAM_CONTROLLER_TO_ACB_BRIDGE : std_logic_vector(521 downto 0);

   signal MAC_TO_NIC_pipe_write_data : std_logic_vector(9 downto 0);
   signal MAC_TO_NIC_pipe_write_req  : std_logic_vector(0  downto 0);
   signal MAC_TO_NIC_pipe_write_ack  : std_logic_vector(0  downto 0);
   signal NIC_MAC_RESETN : std_logic_vector(0 downto 0);
   signal NIC_TO_MAC_pipe_read_data : std_logic_vector(9 downto 0);
   signal NIC_TO_MAC_pipe_read_req  : std_logic_vector(0  downto 0);
   signal NIC_TO_MAC_pipe_read_ack  : std_logic_vector(0  downto 0);

   signal MAX_ACB_TAP_ADDR : std_logic_vector(35 downto 0):=X"0_0000_0000";
   signal MAX_AFB_TAP_ADDR : std_logic_vector(35 downto 0):=X"0_0000_0000";
   signal MIN_ACB_TAP_ADDR : std_logic_vector(35 downto 0):=X"0_0000_0000";
   signal MIN_AFB_TAP_ADDR : std_logic_vector(35 downto 0):=X"0_0000_0000";

   signal CONFIG_UART_BAUD_CONTROL_WORD: std_logic_vector(31 downto 0);

   -------------------- ADDITIONAL DRAM SIGNAL --------------------------------------
   signal device_temp       :  STD_LOGIC_VECTOR ( 11 downto 0 );

--------------------OLD SIGNALS --------------------------------------

   signal reset1, reset_sync, reset_nic: std_logic;
   signal reset1_mac,reset2_mac, reset_sync_pre_buf_mac, reset_sync_mac: std_logic;

   signal EXTERNAL_INTERRUPT : std_logic_vector(0 downto 0);
   signal LOGGER_MODE : std_logic_vector(0 downto 0);
   signal clock,clock_mac,lock:std_logic;

    				
   signal MAX_ADDR_TAP : std_logic_vector(35 downto 0);
   signal MIN_ADDR_TAP : std_logic_vector(35 downto 0);
   

   signal enable_reset : std_logic_vector (0 downto 0);





   
begin
   -- Info: Baudrate 115200 ClkFreq 65000000:  Baud-freq = 1152, Baud-limit= 39473 Baud-control=0x9a310480
   -- Info: Baudrate 115200 ClkFreq 70000000:  Baud-freq = 576, Baud-limit= 21299 Baud-control=0x53330240
   -- Info: Baudrate 115200 ClkFreq 75000000:  Baud-freq = 384, Baud-limit= 15241 Baud-control=0x3b890180
   -- clock freq = 80MHz, baud-rate=115200.
   CONFIG_UART_BAUD_CONTROL_WORD <= X"0bed0048";
   -- CONFIG_UART_BAUD_CONTROL_WORD <= X"3b890180";


       
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
			-- these three can be observed
			-- from the vivado GUI.
                        probe_in0 =>  dcm_locked,
                        probe_in1 =>  CPU_MODE(1),
                        probe_in2 =>  CPU_MODE(0),
			-- careful, do not assert this
			-- else the vio itself will be reset.
                        probe_out1 => reset_clk,
			-- these four can be controlled 
			-- by the vivado GUI.
                        probe_out0 => reset_sync,
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

	---------------------------------------------------------
	-- TODO: TAP VALUES INSIDE THE SBC CORE (DONE!!)
	---------------------------------------------------------
  -- 	CPU_MODE <= PROCESSOR_MODE(1 downto 0);

   core_inst: sbc_kc705_core
     port map ( --
    CLOCK_TO_DRAMCTRL_BRIDGE => CLOCK_TO_DRAMCTRL_BRIDGE, -- DRAM_CONTROLLER_TO_ACB_BRIDGE(521) ui_clk, 80MHz
    CLOCK_TO_NIC => CLOCK_TO_NIC,
    CLOCK_TO_PROCESSOR => CLOCK_TO_PROCESSOR, -- DRAM_CONTROLLER_TO_ACB_BRIDGE(521) ui_clk, 80MHz

    RESET_TO_DRAMCTRL_BRIDGE => RESET_TO_DRAMCTRL_BRIDGE,    
    RESET_TO_NIC => RESET_TO_NIC,
    RESET_TO_PROCESSOR => RESET_TO_PROCESSOR,
    
    THREAD_RESET => THREAD_RESET,
    WRITE_PROTECT => WRITE_PROTECT,
    PROCESSOR_MODE => PROCESSOR_MODE,

    CONSOLE_to_SERIAL_RX_pipe_write_data => CONSOLE_to_SERIAL_RX_pipe_write_data,
    CONSOLE_to_SERIAL_RX_pipe_write_req => CONSOLE_to_SERIAL_RX_pipe_write_req,
    CONSOLE_to_SERIAL_RX_pipe_write_ack => CONSOLE_to_SERIAL_RX_pipe_write_ack,
    SERIAL_TX_to_CONSOLE_pipe_read_data => SERIAL_TX_to_CONSOLE_pipe_read_data,
    SERIAL_TX_to_CONSOLE_pipe_read_req => SERIAL_TX_to_CONSOLE_pipe_read_req,
    SERIAL_TX_to_CONSOLE_pipe_read_ack => SERIAL_TX_to_CONSOLE_pipe_read_ack,

    SOC_MONITOR_to_DEBUG_pipe_write_data => SOC_MONITOR_to_DEBUG_pipe_write_data,
    SOC_MONITOR_to_DEBUG_pipe_write_req => SOC_MONITOR_to_DEBUG_pipe_write_req,
    SOC_MONITOR_to_DEBUG_pipe_write_ack => SOC_MONITOR_to_DEBUG_pipe_write_ack,
    SOC_DEBUG_to_MONITOR_pipe_read_data => SOC_DEBUG_to_MONITOR_pipe_read_data,
    SOC_DEBUG_to_MONITOR_pipe_read_req => SOC_DEBUG_to_MONITOR_pipe_read_req,
    SOC_DEBUG_to_MONITOR_pipe_read_ack => SOC_DEBUG_to_MONITOR_pipe_read_ack,

    ACB_BRIDGE_TO_DRAM_CONTROLLER => ACB_BRIDGE_TO_DRAM_CONTROLLER,
    DRAM_CONTROLLER_TO_ACB_BRIDGE => DRAM_CONTROLLER_TO_ACB_BRIDGE,

    MAC_TO_NIC_pipe_write_data => MAC_TO_NIC_pipe_write_data,
    MAC_TO_NIC_pipe_write_req => MAC_TO_NIC_pipe_write_req,
    MAC_TO_NIC_pipe_write_ack => MAC_TO_NIC_pipe_write_ack, 
    NIC_MAC_RESETN => NIC_MAC_RESETN,
    NIC_TO_MAC_pipe_read_data => NIC_TO_MAC_pipe_read_data,
    NIC_TO_MAC_pipe_read_req => NIC_TO_MAC_pipe_read_req,
    NIC_TO_MAC_pipe_read_ack => NIC_TO_MAC_pipe_read_ack,
    
    MAX_ACB_TAP_ADDR => MAX_ACB_TAP_ADDR,
    MAX_AFB_TAP_ADDR => MAX_AFB_TAP_ADDR,
    MIN_ACB_TAP_ADDR => MIN_ACB_TAP_ADDR,
    MIN_AFB_TAP_ADDR => MIN_AFB_TAP_ADDR,

    SPI_FLASH_MISO => SPI_FLASH_MISO,
    SPI_FLASH_CLK => SPI_FLASH_CLK,
    SPI_FLASH_CS_L => SPI_FLASH_CS_L,
    SPI_FLASH_MOSI => SPI_FLASH_MOSI
    ); -- 
  -- 


    ETH_KC_inst : ETH_KC
    port map
    (
    
     --asynchronous reset
     glbl_rst => enable_reset(0), --in std_logic;

     -- 3 clocks
     gtx_clk_bufg => clock_mac, --in std_logic;   //125MHz
     refclk_bufg => refclk_bufg , --in std_logic; //200MHz
     s_axi_aclk => s_axi_aclk, --in std_logic;    //100MHz
     
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
    rx_pipe_data => MAC_TO_NIC_pipe_write_data, --out std_logic_vector(9 downto 0);
    rx_pipe_ack => MAC_TO_NIC_pipe_write_req, --out std_logic;
    rx_pipe_req => MAC_TO_NIC_pipe_write_ack, --in std_logic;
         
    tx_pipe_data => NIC_TO_MAC_pipe_read_data, --in std_logic_vector(9 downto 0);
    tx_pipe_ack => NIC_TO_MAC_pipe_read_ack, --in std_logic;
    tx_pipe_req => NIC_TO_MAC_pipe_read_req, --out std_logic;
    
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



  debug_uart_inst: configurable_uart
  port map ( --
    CONFIG_UART_BAUD_CONTROL_WORD => CONFIG_UART_BAUD_CONTROL_WORD, -- in
    CONSOLE_to_RX_pipe_read_data => SOC_MONITOR_to_DEBUG_pipe_write_data, -- out
    CONSOLE_to_RX_pipe_read_req => SOC_MONITOR_to_DEBUG_pipe_write_ack, -- in
    CONSOLE_to_RX_pipe_read_ack => SOC_MONITOR_to_DEBUG_pipe_write_req, -- out
    TX_to_CONSOLE_pipe_write_data => SOC_DEBUG_to_MONITOR_pipe_read_data, -- in
    TX_to_CONSOLE_pipe_write_req => SOC_DEBUG_to_MONITOR_pipe_read_ack, -- in
    TX_to_CONSOLE_pipe_write_ack => SOC_DEBUG_to_MONITOR_pipe_read_req, -- out
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

   -----------------------------------------------------------------------------
  -- DRAM controller 
   -----------------------------------------------------------------------------
  mig_7series_0_inst:  mig_7series_0
  Port map( 
    ddr3_dq                    => ddr3_dq  ,
    ddr3_dqs_n                 => ddr3_dqs_n ,
    ddr3_dqs_p                 => ddr3_dqs_p ,
    ddr3_addr                  => ddr3_addr ,
    ddr3_ba                    => ddr3_ba ,
    ddr3_ras_n                 => ddr3_ras_n,
    ddr3_cas_n                 => ddr3_cas_n ,
    ddr3_we_n                  => ddr3_we_n,
    ddr3_reset_n               => ddr3_reset_n ,
    ddr3_ck_p                  => ddr3_ck_p ,
    ddr3_ck_n                  => ddr3_ck_n ,
    ddr3_cke                   => ddr3_cke ,
    ddr3_cs_n                  => ddr3_cs_n ,
    ddr3_dm                    => ddr3_dm ,
    ddr3_odt                   => ddr3_odt ,
    sys_clk_i                  => clk_sys_320 , -- 320 MHz clock, TODO
    clk_ref_i                  => clk_ref_200 , -- 200 MHz clock, TODO
    app_addr                   => ACB_BRIDGE_TO_DRAM_CONTROLLER(613 DOWNTO 585)  ,
    app_cmd                    => ACB_BRIDGE_TO_DRAM_CONTROLLER(584 DOWNTO 582)  ,
    app_en                     => ACB_BRIDGE_TO_DRAM_CONTROLLER(581) ,
    app_wdf_data               => ACB_BRIDGE_TO_DRAM_CONTROLLER(580 DOWNTO 69)  ,
    app_wdf_end                => ACB_BRIDGE_TO_DRAM_CONTROLLER(68) ,
    app_wdf_mask               => ACB_BRIDGE_TO_DRAM_CONTROLLER(67 DOWNTO 4)  ,
    app_wdf_wren               => ACB_BRIDGE_TO_DRAM_CONTROLLER(3) ,
    app_rd_data                => DRAM_CONTROLLER_TO_ACB_BRIDGE(519 downto 8) ,
    app_rd_data_end            => DRAM_CONTROLLER_TO_ACB_BRIDGE(7) ,
    app_rd_data_valid          => DRAM_CONTROLLER_TO_ACB_BRIDGE(6),
    app_rdy                    => DRAM_CONTROLLER_TO_ACB_BRIDGE(5) ,
    app_wdf_rdy                => DRAM_CONTROLLER_TO_ACB_BRIDGE(4) ,
    app_sr_req                 => ACB_BRIDGE_TO_DRAM_CONTROLLER(2) ,
    app_ref_req                => ACB_BRIDGE_TO_DRAM_CONTROLLER(1) ,
    app_zq_req                 => ACB_BRIDGE_TO_DRAM_CONTROLLER(0) ,
    app_sr_active              => DRAM_CONTROLLER_TO_ACB_BRIDGE(3) ,
    app_ref_ack                => DRAM_CONTROLLER_TO_ACB_BRIDGE(2) ,
    app_zq_ack                 => DRAM_CONTROLLER_TO_ACB_BRIDGE(1) ,
    ui_clk                     => DRAM_CONTROLLER_TO_ACB_BRIDGE(521) ,
    ui_clk_sync_rst            => DRAM_CONTROLLER_TO_ACB_BRIDGE(0) ,
    init_calib_complete        => DRAM_CONTROLLER_TO_ACB_BRIDGE(520) ,
    device_temp                => device_temp ,
    sys_rst                    => clk_rst -- Reset from clk_wiz
  );
  

end structure;