


--------------------------------------------
library sbc_kc705_core_lib;

library ieee;
use ieee.std_logic_1164.all;

library std;
use std.standard.all;

library UNISIM;
use UNISIM.vcomponents.all;

library GenericCoreAddOnLib;
use GenericCoreAddOnLib.GenericCoreAddOnPackage.all;

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
     --  glbl_rst : in std_logic;
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
        SPI_FLASH_CLK    : out std_logic_vector(0 downto 0);
        SPI_FLASH_CS_TOP : out std_logic_vector(0 downto 0);
        SPI_FLASH_MOSI   : out std_logic_vector(0 downto 0);
        SPI_FLASH_MISO   : in std_logic_vector(0 downto 0);

      -----------------------------------------------
      -- CPU Mode.
      -----------------------------------------------
   	CPU_MODE : out std_logic_vector(1 downto 0); 

      -----------------------------------------------
      -- Clock wiz reset
      -----------------------------------------------
      clk_rst : in std_logic;
      -----------------------------------------------
      -- 200 MHz clock in.
      -----------------------------------------------
      clk_in_p : in std_logic;
      clk_in_n : in std_logic
	);
end entity sbc_kc705;

architecture structure of sbc_kc705 is


--------- NEW CLOCK WIZ AND VIOS ----------------------------------------

    component clk_wiz_0 is
      Port ( 
        clk_320 : out STD_LOGIC;
        clk_200 : out STD_LOGIC;
        clk_125 : out STD_LOGIC;
        clk_100 : out STD_LOGIC;
        reset : in STD_LOGIC;
        locked : out STD_LOGIC;
        clk_in1_p : in STD_LOGIC;
        clk_in1_n : in STD_LOGIC
      );

    end component;

-- To generate synchronous reset to processor.
    component vio_80 is
      Port ( 
        clk : in STD_LOGIC;
        probe_in0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
        probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
        probe_out1 : out STD_LOGIC_VECTOR ( 0 to 0 );
        probe_out2 : out STD_LOGIC_VECTOR ( 0 to 0 )
      );

    end component;

    component vio_125 is
      Port ( 
        clk : in STD_LOGIC;
        probe_in0 : in STD_LOGIC_VECTOR ( 0 to 0 );
        probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 )
      );

    end component;



-------------------------------------------------------------------------

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
    MAX_ACB_TAP1_ADDR : in std_logic_vector(35 downto 0);
    MAX_ACB_TAP2_ADDR : in std_logic_vector(35 downto 0);
    MIN_ACB_TAP1_ADDR : in std_logic_vector(35 downto 0);
    MIN_ACB_TAP2_ADDR : in std_logic_vector(35 downto 0);
    RESET_TO_DRAMCTRL_BRIDGE : in std_logic_vector(0 downto 0);
    RESET_TO_NIC : in std_logic_vector(0 downto 0);
    RESET_TO_PROCESSOR : in std_logic_vector(0 downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_data : in std_logic_vector(7 downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_req  : in std_logic_vector(0  downto 0);
    SOC_MONITOR_to_DEBUG_pipe_write_ack  : out std_logic_vector(0  downto 0);
    SPI_FLASH_MISO : in std_logic_vector(0 downto 0);
    THREAD_RESET : in std_logic_vector(3 downto 0);
    WRITE_PROTECT : in std_logic_vector(0 downto 0);
    ACB_BRIDGE_TO_DRAM_CONTROLLER : out std_logic_vector(612 downto 0);
    NIC_DEBUG_SIGNAL : out std_logic_vector(127 downto 0);
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
    SPI_FLASH_MOSI : out std_logic_vector(0 downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
  end component sbc_kc705_core;
  signal SPI_FLASH_CS_L: std_logic_vector(7 downto 0);

for sbc_kc705_core_inst :  sbc_kc705_core -- 
    use entity sbc_kc705_core_lib.sbc_kc705_core; -- 


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

 component ila_1 is
 
    Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 35 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  

end component;

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
   
   signal ACB_BRIDGE_TO_DRAM_CONTROLLER : std_logic_vector(612 downto 0);
   signal DRAM_CONTROLLER_TO_ACB_BRIDGE : std_logic_vector(521 downto 0);

   signal MAC_TO_NIC_pipe_write_data : std_logic_vector(9 downto 0);
   signal MAC_TO_NIC_pipe_write_req  : std_logic_vector(0  downto 0);
   signal MAC_TO_NIC_pipe_write_ack  : std_logic_vector(0  downto 0);
   signal NIC_MAC_RESETN : std_logic_vector(0 downto 0);
   signal NIC_TO_MAC_pipe_read_data : std_logic_vector(9 downto 0);
   signal NIC_TO_MAC_pipe_read_req  : std_logic_vector(0  downto 0);
   signal NIC_TO_MAC_pipe_read_ack  : std_logic_vector(0  downto 0);
    
 
   signal  NIC_DEBUG_SIGNAL :  std_logic_vector(127 downto 0);

   signal MAX_ACB_TAP1_ADDR : std_logic_vector(35 downto 0):=X"0_0000_0000";
   signal MAX_ACB_TAP2_ADDR : std_logic_vector(35 downto 0):=X"0_0000_0000";
   signal MIN_ACB_TAP1_ADDR : std_logic_vector(35 downto 0):=X"0_0000_0000";
   signal MIN_ACB_TAP2_ADDR : std_logic_vector(35 downto 0):=X"0_0000_0000";

   signal CONFIG_UART_BAUD_CONTROL_WORD: std_logic_vector(31 downto 0);
   signal CPU_MODE_SIG : std_logic_vector(1 downto 0); 
   signal clk_ref_100,clk_ref_125: std_logic:='0';
   signal clk_ref_125_vector : std_logic_vector(0 downto 0); 
   -------------------- ADDITIONAL DRAM SIGNAL --------------------------------------
   signal device_temp       :  STD_LOGIC_VECTOR ( 11 downto 0 );
   signal clk_sys_320, clk_ref_200: std_logic:='0';
   signal sys_rst: std_logic_vector(0 downto 0);
   --------------------OLD SIGNALS --------------------------------------

   signal EXTERNAL_INTERRUPT : std_logic_vector(0 downto 0);
   signal LOGGER_MODE : std_logic_vector(0 downto 0);
   signal clock:std_logic;

    				
   signal MAX_ADDR_TAP : std_logic_vector(35 downto 0);
   signal MIN_ADDR_TAP : std_logic_vector(35 downto 0);
   

   signal enable_reset : std_logic_vector (0 downto 0);
   signal clk_wizard_locked : STD_LOGIC_VECTOR ( 0 to 0 );
   signal dcm_locked, gtx_clk_reset :std_logic;


   signal  CPU_RESET, DEBUG_MODE: std_logic_vector (0 downto 0);

	
    signal SPI_CLK_HACK : std_logic;
    signal SPI_FLASH_CLK_SIG: std_logic_vector(0 downto 0);


    signal MIG7_UI_CLOCK: std_logic_vector(0 downto 0);
    
    --------------------DEBUG SIGNALS --------------------------------------
    
    signal NIC_ACB_REQUEST_TO_MEMORY_LOCK : std_logic_vector(0 downto 0);
    signal NIC_ACB_REQUEST_TO_MEMORY_RWBAR : std_logic_vector(0 downto 0);
    signal NIC_ACB_REQUEST_TO_MEMORY_MASK : std_logic_vector(7 downto 0);
    signal NIC_ACB_REQUEST_TO_MEMORY_ADDR : std_logic_vector(35 downto 0);
    signal NIC_ACB_REQUEST_TO_MEMORY_DATA : std_logic_vector(63 downto 0);
    
   
begin
   -- Info: Baudrate 115200 ClkFreq 65000000:  Baud-freq = 1152, Baud-limit= 39473 Baud-control=0x9a310480
   -- Info: Baudrate 115200 ClkFreq 70000000:  Baud-freq = 576, Baud-limit= 21299 Baud-control=0x53330240
   -- Info: Baudrate 115200 ClkFreq 75000000:  Baud-freq = 384, Baud-limit= 15241 Baud-control=0x3b890180
   -- clock freq = 80MHz, baud-rate=115200.
   CONFIG_UART_BAUD_CONTROL_WORD <= X"0bed0048";
   -- CONFIG_UART_BAUD_CONTROL_WORD <= X"3b890180";

      
     -- For first ACB Tap goes to only NIC.
     MIN_ACB_TAP1_ADDR <= X"0_FF00_0000";
     MAX_ACB_TAP1_ADDR <= X"0_FFFF_FFFF";

     -- For second ACB TAP goes to RAM.
     MIN_ACB_TAP2_ADDR <= X"0_3000_0000";
     MAX_ACB_TAP2_ADDR <= X"0_FEFF_FFFF"; -- 0_FEFF_FFFF + 1 = 0_FF00_0000
       
    clk_wiz_0_inst: clk_wiz_0 
        Port map( 
          clk_320       => clk_sys_320, -- goes to the DRAM controller
          clk_200       => clk_ref_200, -- goes to the DRAM controller
	  clk_125       => clk_ref_125, -- To ethernet mac
	  clk_100       => clk_ref_100, -- To axi (in mac)
          reset         => clk_rst, 
          locked        => clk_wizard_locked(0), -- goes to the VIO
          clk_in1_p     => clk_in_p,
          clk_in1_n     => clk_in_n);

    -- used by ETH	
    dcm_locked <= clk_wizard_locked(0);

    -- VIO for processor reset 

    virtual_reset_processor : vio_80
        port map (
                        clk         => MIG7_UI_CLOCK(0), --CLOCK_TO_PROCESSOR  ui_clk, 80MHz,
                        probe_in0   => CPU_MODE_SIG,
                        probe_out0  => RESET_TO_PROCESSOR,
			probe_out1  => CPU_RESET, 
			probe_out2  => DEBUG_MODE 
                );

    -- VIO for NIC reset 

    virtual_reset_nic       : vio_125
        port map (
                        clk         => clk_ref_125,
			probe_in0   => clk_wizard_locked,
                        probe_out0  => RESET_TO_NIC
          );

 

   CPU_MODE_SIG <= PROCESSOR_MODE(1 downto 0);
   CPU_MODE <= CPU_MODE_SIG;

   THREAD_RESET(0) <= CPU_RESET(0);
   THREAD_RESET(1) <= DEBUG_MODE(0);
   THREAD_RESET(2) <= '0';
   THREAD_RESET(3) <= '0';

   clk_ref_125_vector	<= (0 => clk_ref_125);
   
   MIG7_UI_CLOCK <= DRAM_CONTROLLER_TO_ACB_BRIDGE(521 downto 521); -- 80MHz

   sbc_kc705_core_inst: sbc_kc705_core
     port map ( --
    CLOCK_TO_DRAMCTRL_BRIDGE =>  MIG7_UI_CLOCK, --  ui_clk, 80MHz
    CLOCK_TO_NIC => clk_ref_125_vector,
    CLOCK_TO_PROCESSOR => MIG7_UI_CLOCK,        --  ui_clk, 80MHz

    RESET_TO_DRAMCTRL_BRIDGE => RESET_TO_PROCESSOR,    
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
    
   NIC_DEBUG_SIGNAL => NIC_DEBUG_SIGNAL,
   
    MAX_ACB_TAP1_ADDR => MAX_ACB_TAP1_ADDR,
    MAX_ACB_TAP2_ADDR => MAX_ACB_TAP2_ADDR,
    MIN_ACB_TAP1_ADDR => MIN_ACB_TAP1_ADDR,
    MIN_ACB_TAP2_ADDR => MIN_ACB_TAP2_ADDR,

    SPI_FLASH_MISO => SPI_FLASH_MISO,
    SPI_FLASH_CLK => SPI_FLASH_CLK_SIG,
    SPI_FLASH_CS_L => SPI_FLASH_CS_L,
    SPI_FLASH_MOSI => SPI_FLASH_MOSI,
    clk => '0',
    reset =>'0'
    ); -- 
  -- 
    SPI_FLASH_CS_TOP(0) <= SPI_FLASH_CS_L(0);
    SPI_FLASH_CLK <= SPI_FLASH_CLK_SIG;
    WRITE_PROTECT(0) <= '0';


    ETH_KC_inst : ETH_KC
    port map
    (
    
     --asynchronous reset
     glbl_rst => NIC_MAC_RESETN(0), --in std_logic;

     -- 3 clocks (buffered with bufg's)
     gtx_clk_bufg => clk_ref_125 , --in std_logic;   //125MHz
     refclk_bufg => clk_ref_200 , --in std_logic; //200MHz
     s_axi_aclk => clk_ref_100, --in std_logic;    //100MHz
     
     -- 125 MHz clock from MMCM
     gtx_clk_bufg_out => gtx_clk_bufg_out, --out std_logic;
     phy_resetn => phy_resetn, --out std_logic;

     -- RGMII Interface
     ------------------
     rgmii_txc => rgmii_txc,
     rgmii_txd => rgmii_txd, --out std_logic_vector(3 downto 0);
     rgmii_tx_ctl => rgmii_tx_ctl, --out std_logic;
     
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
    clk => MIG7_UI_CLOCK(0), reset => RESET_TO_PROCESSOR(0)
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
    clk => MIG7_UI_CLOCK(0), reset => RESET_TO_PROCESSOR(0)
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
    sys_clk_i                  => clk_sys_320 , 
    clk_ref_i                  => clk_ref_200 , 
    app_addr                   => ACB_BRIDGE_TO_DRAM_CONTROLLER(612 DOWNTO 585)  ,
    app_cmd                    => ACB_BRIDGE_TO_DRAM_CONTROLLER(584 DOWNTO 582)  ,
    app_en                     => ACB_BRIDGE_TO_DRAM_CONTROLLER(581) ,
    app_wdf_data               => ACB_BRIDGE_TO_DRAM_CONTROLLER(580 DOWNTO 69)  ,
    app_wdf_end                => ACB_BRIDGE_TO_DRAM_CONTROLLER(68) ,
    app_wdf_mask               => ACB_BRIDGE_TO_DRAM_CONTROLLER(67 DOWNTO 4),
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
    sys_rst                    => sys_rst(0)
  );
  sys_rst(0) <= clk_rst; -- MIG is at same level as clock generator.



 NIC_ACB_REQUEST_TO_MEMORY_LOCK  <= (0 => NIC_DEBUG_SIGNAL(109));
 NIC_ACB_REQUEST_TO_MEMORY_RWBAR <= (0 => NIC_DEBUG_SIGNAL(108));
 NIC_ACB_REQUEST_TO_MEMORY_MASK  <= NIC_DEBUG_SIGNAL(107 downto 100);
 NIC_ACB_REQUEST_TO_MEMORY_ADDR  <= NIC_DEBUG_SIGNAL(99 downto 64);
 NIC_ACB_REQUEST_TO_MEMORY_DATA  <= NIC_DEBUG_SIGNAL(63 downto 0);
	
inst_ila_1 : ila_1 
  Port map( 
    clk => clk_ref_125,
    probe0 => NIC_ACB_REQUEST_TO_MEMORY_LOCK,
    probe1 => NIC_ACB_REQUEST_TO_MEMORY_RWBAR,
    probe2 => NIC_ACB_REQUEST_TO_MEMORY_MASK,
    probe3 => NIC_ACB_REQUEST_TO_MEMORY_ADDR,
    probe4 => NIC_ACB_REQUEST_TO_MEMORY_DATA
  );











  -- HACK needed to make SPI_CLK controllable on the board.
  spi_connect: STARTUPE2
    		generic map(      PROG_USR => "FALSE", 
                 		SIM_CCLK_FREQ => 0.0)
    		port map (    CFGCLK => open,
                 		CFGMCLK => open,
                     		EOS => open,
                    		PREQ => open,
                     		CLK => '0',
                     		GSR => '0',
                     		GTS => '0',
               			KEYCLEARB => '0',
                    		PACK => '0',
                		USRCCLKO => SPI_CLK_HACK,   -- Provide signal to output on CCLK pin 
               			USRCCLKTS => '0',       -- Enable CCLK pin  
                		USRDONEO => '1',       -- Drive DONE pin High even though tri-state
               			USRDONETS => '1' );     -- Maintain tri-state of DONE pin

    SPI_CLK_HACK <= SPI_FLASH_CLK_SIG(0);
		
end structure;
