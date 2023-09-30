library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;

library unisim;
use unisim.vcomponents.all; -- for 7-series FPGA's

library SpiMasterLib;
use SpiMasterLib.SpiMasterLibComponents.all;

library AjitCustom;
use AjitCustom.AjitCustomComponents.all;

library GenericCoreAddOnLib;
use GenericCoreAddOnLib.GenericCoreAddOnPackage.all;

library GlueModules;
use GlueModules.GlueModulesBaseComponents.all;

library GenericGlueStuff;
use GenericGlueStuff.GenericGlueStuffComponents.all;

library AxiBridgeLib;
use AxiBridgeLib.axi_component_package.all;


entity dram_spi_wrapper_ui64 is
port(
	sys_clk_p:in std_logic;
	sys_clk_n:in std_logic;
	sys_rst,clk_rst:in std_logic;
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
    	led:out std_logic_vector(3 downto 0);
    	CPU_RESET:in std_logic_vector(0 downto 0);
      	DEBUG_MODE : in std_logic_vector(0 downto 0);
      	DEBUG_UART_RX : in std_logic_vector(0 downto 0);
      	EXTERNAL_INTERRUPT : in std_logic_vector(0 downto 0);
      	SERIAL_UART_RX : in std_logic_vector(0 downto 0);
      	SINGLE_STEP_MODE : in std_logic_vector(0 downto 0);
      	CPU_MODE : out std_logic_vector(1 downto 0);
      	DEBUG_UART_TX : out std_logic_vector(0 downto 0);
      	SERIAL_UART_TX : out std_logic_vector(0 downto 0);
      	spi_miso : in std_logic_vector(0 downto 0);
      	spi_clk : out std_logic_vector(0 downto 0);
      	spi_cs : out std_logic_vector(0 downto 0);
      	spi_mosi : out std_logic_vector(0 downto 0)
);
end entity dram_spi_wrapper_ui64;
architecture wrapper of dram_spi_wrapper_ui64 is

signal aclk,clk,reset,locked,clk200 : STD_LOGIC;
signal aresetn : STD_LOGIC;

signal clk1_p,clk1_n:std_logic:='0';
signal clk_sys_320,clk_ref_200: std_logic:='0';
signal reset1,reset2,reset_sync  : std_logic:='0';
signal fatal_error: std_logic_VECTOR(0 downto 0); 
signal cdebug,ddebug: std_logic_VECTOR(3 downto 0);    
signal rdebug:      std_logic_VECTOR(4 downto 0);  
signal dram_add,main_add:  std_logic_VECTOR(35 downto 0);                   
--signal Debug_add: std_logic_vector(35 downto 0); 

signal AFB_BUS_REQUEST_pipe_read_data: std_logic_vector(73 downto 0);
signal AFB_BUS_REQUEST_pipe_read_req : std_logic_vector(0 downto 0);
signal AFB_BUS_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
signal AFB_BUS_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
signal AFB_BUS_RESPONSE_pipe_write_req : std_logic_vector(0 downto 0);
signal AFB_BUS_RESPONSE_pipe_write_ack : std_logic_vector(0 downto 0);

signal CORE_BUS_RESPONSE_HIGH_pipe_write_data : std_logic_vector(64 downto 0);
signal CORE_BUS_RESPONSE_HIGH_pipe_write_req  : std_logic_vector(0  downto 0);
signal CORE_BUS_RESPONSE_HIGH_pipe_write_ack  : std_logic_vector(0  downto 0);

signal CORE_BUS_REQUEST_HIGH_pipe_read_data   : std_logic_vector(109 downto 0);
signal CORE_BUS_REQUEST_HIGH_pipe_read_req    : std_logic_vector(0  downto 0);
signal CORE_BUS_REQUEST_HIGH_pipe_read_ack    : std_logic_vector(0  downto 0);

signal CORE_BUS_RESPONSE_LOW_pipe_write_data  : std_logic_vector(64 downto 0);
signal CORE_BUS_RESPONSE_LOW_pipe_write_req   : std_logic_vector(0  downto 0);
signal CORE_BUS_RESPONSE_LOW_pipe_write_ack   : std_logic_vector(0  downto 0);

signal CORE_BUS_REQUEST_LOW_pipe_read_data    : std_logic_vector(109 downto 0);
signal CORE_BUS_REQUEST_LOW_pipe_read_req     : std_logic_vector(0  downto 0);
signal CORE_BUS_REQUEST_LOW_pipe_read_ack     : std_logic_vector(0  downto 0);

signal MAX_ADDR_HIGH                          : std_logic_vector(35 downto 0);
signal MAX_ADDR_LOW                           : std_logic_vector(35 downto 0);
signal MIN_ADDR_HIGH                          : std_logic_vector(35 downto 0);
signal MIN_ADDR_LOW                           : std_logic_vector(35 downto 0);




signal app_addr :  STD_LOGIC_VECTOR ( 27 downto 0 );
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
signal device_temp       :  STD_LOGIC_VECTOR ( 11 downto 0 );





-----------------------------------------------*******************************-----------------------------
  -- ACB interface to processor.
  signal MAIN_MEM_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
  signal MAIN_MEM_REQUEST_pipe_read_req  : std_logic_vector(0  downto 0);
  signal MAIN_MEM_REQUEST_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal MAIN_MEM_RESPONSE_pipe_write_data : std_logic_vector(64 downto 0);
  signal MAIN_MEM_RESPONSE_pipe_write_req  : std_logic_vector(0  downto 0);
  signal MAIN_MEM_RESPONSE_pipe_write_ack  : std_logic_vector(0  downto 0);

  -- AFB interface bridged to ACB interface.
  signal CORE_AFB_RESPONSE_pipe_write_data:std_logic_vector(32 downto 0);
  signal CORE_AFB_RESPONSE_pipe_write_req:std_logic_vector(0 downto 0);
  signal CORE_AFB_RESPONSE_pipe_write_ack:std_logic_vector(0 downto 0);
  signal CORE_AFB_REQUEST_pipe_read_data:std_logic_vector(73 downto 0);
  signal CORE_AFB_REQUEST_pipe_read_req:std_logic_vector(0  downto 0);
  signal CORE_AFB_REQUEST_pipe_read_ack:std_logic_vector(0  downto 0);

  -- to flash spi master..
  signal FLASH_SPI_MASTER_COMMAND_pipe_read_data: std_logic_vector(15 downto 0);
  signal FLASH_SPI_MASTER_COMMAND_pipe_read_req : std_logic_vector(0 downto 0);
  signal FLASH_SPI_MASTER_COMMAND_pipe_read_ack : std_logic_vector(0 downto 0);
  signal FLASH_SPI_MASTER_RESPONSE_pipe_write_data: std_logic_vector(7 downto 0);
  signal FLASH_SPI_MASTER_RESPONSE_pipe_write_req : std_logic_vector(0 downto 0);
  signal FLASH_SPI_MASTER_RESPONSE_pipe_write_ack : std_logic_vector(0 downto 0);

  -- dram, flash AFB interface
  signal DRAM_HIGH_RESPONSE_pipe_write_data,FLASH_LOW_RESPONSE_pipe_write_data : std_logic_vector(32 downto 0);
  signal DRAM_HIGH_RESPONSE_pipe_write_req,FLASH_LOW_RESPONSE_pipe_write_req  : std_logic_vector(0 downto 0);
  signal DRAM_HIGH_RESPONSE_pipe_write_ack,FLASH_LOW_RESPONSE_pipe_write_ack  : std_logic_vector(0 downto 0);
  signal DRAM_HIGH_REQUEST_pipe_read_data,FLASH_LOW_REQUEST_pipe_read_data :  std_logic_vector(73 downto 0);
  signal DRAM_HIGH_REQUEST_pipe_read_req,FLASH_LOW_REQUEST_pipe_read_req  :  std_logic_vector(0  downto 0);
  signal DRAM_HIGH_REQUEST_pipe_read_ack,FLASH_LOW_REQUEST_pipe_read_ack  :  std_logic_vector(0  downto 0);



  signal spi_clk1:std_logic;
  signal spi_clk2,CORE_EXTERNAL_INTERRUPT:std_logic_vector(0 downto 0);
  signal spi_cs_0:std_logic;
  signal spi_cs_n8 : std_logic_vector(7 downto 0) :=x"FF";

  signal PROCESSOR_MODE: std_logic_vector ( 15 downto 0);

  signal SPI_MASTER_COMMAND_pipe_write_data: std_logic_vector(15 downto 0);  
  signal SPI_MASTER_COMMAND_pipe_write_ack : std_logic_vector(0 downto 0);
  signal SPI_MASTER_COMMAND_pipe_write_req : std_logic_vector(0 downto 0);
  signal SPI_MASTER_RESPONSE_pipe_read_data : std_logic_vector(7 downto 0);
  signal SPI_MASTER_RESPONSE_pipe_read_ack : std_logic_vector(0 downto 0);
  signal SPI_MASTER_RESPONSE_pipe_read_req : std_logic_vector(0 downto 0);
  
  signal LOGGER_MODE : std_logic_vector(0 downto 0);
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

  signal ZSLV1: std_logic_vector(0 downto 0);

-----------------------*********************************************---------------------------------

----debug signals

	signal  dram_debug: STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal  flash_add : STD_LOGIC_VECTOR(35 DOWNTO 0);
	signal flash_debug:  STD_LOGIC_VECTOR(3 DOWNTO 0);

---------------



component clk_wiz_0 is
  Port ( 
    clk_sys_320 : out STD_LOGIC;
    clk_ref_200 : out STD_LOGIC;
    reset : in STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );
end component;

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



  component processor_1x1x32 is -- 
   port( -- 
    CONSOLE_to_SERIAL_RX_pipe_write_data : in std_logic_vector(7 downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_req  : in std_logic_vector(0  downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_ack  : out std_logic_vector(0  downto 0);
    EXTERNAL_INTERRUPT : in std_logic_vector(0 downto 0);
    MAIN_MEM_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
    MAIN_MEM_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
    MAIN_MEM_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
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
  end component processor_1x1x32;
  




begin
  clk1_p <= sys_clk_p;
  clk1_n <= sys_clk_n;
  led <= CORE_BUS_REQUEST_HIGH_pipe_read_data(7 downto 4);
  --DRAM_HIGH_RESPONSE_pipe_write_data(7 downto 4);
  spi_clk <= spi_clk2;
  spi_clk1 <= spi_clk2(0); 
  --spi_cs_n8 <= b"1111111" & spi_cs_0;
  --spi_cs(0) <= spi_cs_0;
  spi_cs(0) <= spi_cs_n8(0);
  
  -- afb splitter control.
  MIN_ADDR_HIGH <= x"040000000";
  MIN_ADDR_LOW  <= x"000000000";
  MAX_ADDR_HIGH <= x"FFFFFFFFF";
  MAX_ADDR_LOW  <= x"03FFFFFFF";



  -- tie off things you dont need.
  INVALIDATE_REQUEST_pipe_write_data <= (others => '0');
  INVALIDATE_REQUEST_pipe_write_req  <= (others => '0');
  LOGGER_MODE <= (others => '0');
  CORE_EXTERNAL_INTERRUPT(0) <= '0';

  CPU_MODE <= PROCESSOR_MODE ( 1 downto 0);

  processor: processor_1x1x32 port map(
		 		THREAD_RESET(0) => CPU_RESET(0),
      				THREAD_RESET(1) => DEBUG_MODE(0),
      				THREAD_RESET(2) => SINGLE_STEP_MODE(0),
      				THREAD_RESET(3) => LOGGER_MODE(0),
				EXTERNAL_INTERRUPT => CORE_EXTERNAL_INTERRUPT,
				PROCESSOR_MODE  => PROCESSOR_MODE,
    				MAIN_MEM_INVALIDATE_pipe_write_data  => INVALIDATE_REQUEST_pipe_write_data ,
    				MAIN_MEM_INVALIDATE_pipe_write_req   => INVALIDATE_REQUEST_pipe_write_req  ,
    				MAIN_MEM_INVALIDATE_pipe_write_ack   => INVALIDATE_REQUEST_pipe_write_ack  ,
    				SOC_MONITOR_to_DEBUG_pipe_write_data  => MONITOR_to_DEBUG_pipe_write_data ,
    				SOC_MONITOR_to_DEBUG_pipe_write_req  => MONITOR_to_DEBUG_pipe_write_req ,
    				SOC_MONITOR_to_DEBUG_pipe_write_ack  => MONITOR_to_DEBUG_pipe_write_ack ,
    				SOC_DEBUG_to_MONITOR_pipe_read_data  => DEBUG_to_MONITOR_pipe_read_data ,
    				SOC_DEBUG_to_MONITOR_pipe_read_req   => DEBUG_to_MONITOR_pipe_read_req  ,
    				SOC_DEBUG_to_MONITOR_pipe_read_ack   => DEBUG_to_MONITOR_pipe_read_ack  ,
    				CONSOLE_to_SERIAL_RX_pipe_write_data  => CONSOLE_to_SERIAL_RX_pipe_write_data ,
    				CONSOLE_to_SERIAL_RX_pipe_write_req  => CONSOLE_to_SERIAL_RX_pipe_write_req ,
    				CONSOLE_to_SERIAL_RX_pipe_write_ack  => CONSOLE_to_SERIAL_RX_pipe_write_ack ,
    				SERIAL_TX_to_CONSOLE_pipe_read_data => SERIAL_TX_to_CONSOLE_pipe_read_data,
    				SERIAL_TX_to_CONSOLE_pipe_read_req  => SERIAL_TX_to_CONSOLE_pipe_read_req ,
    				SERIAL_TX_to_CONSOLE_pipe_read_ack   => SERIAL_TX_to_CONSOLE_pipe_read_ack  ,
      				MAIN_MEM_RESPONSE_pipe_write_data => MAIN_MEM_RESPONSE_pipe_write_data, 
      				MAIN_MEM_RESPONSE_pipe_write_req => MAIN_MEM_RESPONSE_pipe_write_req,
      				MAIN_MEM_RESPONSE_pipe_write_ack => MAIN_MEM_RESPONSE_pipe_write_ack,
      				MAIN_MEM_REQUEST_pipe_read_data => MAIN_MEM_REQUEST_pipe_read_data,
      				MAIN_MEM_REQUEST_pipe_read_req => MAIN_MEM_REQUEST_pipe_read_req,
      				MAIN_MEM_REQUEST_pipe_read_ack => MAIN_MEM_REQUEST_pipe_read_ack,
      				clk => ui_clk,
      				reset => reset_sync);



	acb_splitter_inst: acb_fast_splitter
		port map(
			    CORE_BUS_REQUEST_pipe_write_data        => MAIN_MEM_REQUEST_pipe_read_data,
			    CORE_BUS_REQUEST_pipe_write_req         => MAIN_MEM_REQUEST_pipe_read_ack,
			    CORE_BUS_REQUEST_pipe_write_ack         => MAIN_MEM_REQUEST_pipe_read_req,

			    CORE_BUS_RESPONSE_HIGH_pipe_write_data  => CORE_BUS_RESPONSE_HIGH_pipe_write_data,
			    CORE_BUS_RESPONSE_HIGH_pipe_write_req   => CORE_BUS_RESPONSE_HIGH_pipe_write_req,
			    CORE_BUS_RESPONSE_HIGH_pipe_write_ack   => CORE_BUS_RESPONSE_HIGH_pipe_write_ack,

			    CORE_BUS_RESPONSE_LOW_pipe_write_data   => CORE_BUS_RESPONSE_LOW_pipe_write_data,
			    CORE_BUS_RESPONSE_LOW_pipe_write_req    => CORE_BUS_RESPONSE_LOW_pipe_write_req,
			    CORE_BUS_RESPONSE_LOW_pipe_write_ack    => CORE_BUS_RESPONSE_LOW_pipe_write_ack, 

			    MAX_ADDR_HIGH                           => MAX_ADDR_HIGH,
			    MAX_ADDR_LOW                            => MAX_ADDR_LOW, 
			    MIN_ADDR_HIGH                           => MIN_ADDR_HIGH,
			    MIN_ADDR_LOW                            => MIN_ADDR_LOW,

			    CORE_BUS_REQUEST_HIGH_pipe_read_data    => CORE_BUS_REQUEST_HIGH_pipe_read_data,
			    CORE_BUS_REQUEST_HIGH_pipe_read_req     => CORE_BUS_REQUEST_HIGH_pipe_read_req, 
			    CORE_BUS_REQUEST_HIGH_pipe_read_ack     => CORE_BUS_REQUEST_HIGH_pipe_read_ack, 

			    CORE_BUS_REQUEST_LOW_pipe_read_data     => CORE_BUS_REQUEST_LOW_pipe_read_data,
			    CORE_BUS_REQUEST_LOW_pipe_read_req      => CORE_BUS_REQUEST_LOW_pipe_read_req,  
			    CORE_BUS_REQUEST_LOW_pipe_read_ack      => CORE_BUS_REQUEST_LOW_pipe_read_ack,  

			    CORE_BUS_RESPONSE_pipe_read_data        => MAIN_MEM_RESPONSE_pipe_write_data,
			    CORE_BUS_RESPONSE_pipe_read_req         => MAIN_MEM_RESPONSE_pipe_write_ack, 
			    CORE_BUS_RESPONSE_pipe_read_ack         => MAIN_MEM_RESPONSE_pipe_write_req, 

			    clk                                     => ui_clk,
                            reset                                   => reset_sync
                        );



	ACB_to_UI_Inst: ACB_to_UI_EA
	port map(
		ui_clk                                       => ui_clk,                 
		sys_rst                                      => reset_sync,                                       
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
		DRAM_REQUEST_pipe_write_ack                  => CORE_BUS_REQUEST_HIGH_pipe_read_req,                 
		DRAM_REQUEST_pipe_write_req                  => CORE_BUS_REQUEST_HIGH_pipe_read_ack,
		DRAM_REQUEST_pipe_write_data                 => CORE_BUS_REQUEST_HIGH_pipe_read_data,
		DRAM_RESPONSE_pipe_read_req                  => CORE_BUS_RESPONSE_HIGH_pipe_write_ack,
		DRAM_RESPONSE_pipe_read_ack                  => CORE_BUS_RESPONSE_HIGH_pipe_write_req,
		DRAM_RESPONSE_pipe_read_data                 => CORE_BUS_RESPONSE_HIGH_pipe_write_data,
		fatal_error                                  => fatal_error,                        
		cdebug                                       => cdebug,      
		ddebug                                       => ddebug,
		rdebug                                       => rdebug                              
    );
    
    --


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
    app_addr                   => app_addr  ,
    app_cmd                    => app_cmd  ,
    app_en                     => app_en ,
    app_wdf_data               => app_wdf_data  ,
    app_wdf_end                => app_wdf_end ,
    app_wdf_mask               => app_wdf_mask  ,
    app_wdf_wren               => app_wdf_wren ,
    app_rd_data                => app_rd_data ,
    app_rd_data_end            => app_rd_data_end ,
    app_rd_data_valid          => app_rd_data_valid,
    app_rdy                    => app_rdy ,
    app_wdf_rdy                => app_wdf_rdy ,
    app_sr_req                 => app_sr_req ,
    app_ref_req                => app_ref_req ,
    app_zq_req                 => app_zq_req ,
    app_sr_active              => app_sr_active ,
    app_ref_ack                => app_ref_ack ,
    app_zq_ack                 => app_zq_ack ,
    ui_clk                     => ui_clk ,
    ui_clk_sync_rst            => ui_clk_sync_rst ,
    init_calib_complete        => init_calib_complete ,
    device_temp                => device_temp ,
    sys_rst                    => clk_rst 
  );
  
  





	afb_bridge_inst: acb_afb_bridge
		port map (
    				CORE_BUS_REQUEST_pipe_write_data 
					=> CORE_BUS_REQUEST_LOW_pipe_read_data,
    				CORE_BUS_REQUEST_pipe_write_req 
					=> CORE_BUS_REQUEST_LOW_pipe_read_ack,
    				CORE_BUS_REQUEST_pipe_write_ack  
					=> CORE_BUS_REQUEST_LOW_pipe_read_req,

    				CORE_BUS_RESPONSE_pipe_read_data 
					=> CORE_BUS_RESPONSE_LOW_pipe_write_data,
    				CORE_BUS_RESPONSE_pipe_read_req 
					=> CORE_BUS_RESPONSE_LOW_pipe_write_ack,
    				CORE_BUS_RESPONSE_pipe_read_ack 
					=> CORE_BUS_RESPONSE_LOW_pipe_write_req,

    				AFB_BUS_REQUEST_pipe_read_data 
 					=> AFB_BUS_REQUEST_pipe_read_data,
    				AFB_BUS_REQUEST_pipe_read_req 
 					=> AFB_BUS_REQUEST_pipe_read_req,
    				AFB_BUS_REQUEST_pipe_read_ack  
 					=> AFB_BUS_REQUEST_pipe_read_ack,

    				AFB_BUS_RESPONSE_pipe_write_data 
					=> AFB_BUS_RESPONSE_pipe_write_data, 
    				AFB_BUS_RESPONSE_pipe_write_req 
					=> AFB_BUS_RESPONSE_pipe_write_req, 
    				AFB_BUS_RESPONSE_pipe_write_ack
					=> AFB_BUS_RESPONSE_pipe_write_ack, 
      				clk => ui_clk,
      				reset => reset_sync);

                      
                   

	flash_controller: afb_flash_rw_controller port map (
				clk => ui_clk, reset => reset_sync,
    				AFB_BUS_REQUEST_pipe_write_data  => AFB_BUS_REQUEST_pipe_read_data,
    				AFB_BUS_REQUEST_pipe_write_req   => AFB_BUS_REQUEST_pipe_read_ack,
    				AFB_BUS_REQUEST_pipe_write_ack   => AFB_BUS_REQUEST_pipe_read_req,
    				AFB_BUS_RESPONSE_pipe_read_data  => AFB_BUS_RESPONSE_pipe_write_data,
    				AFB_BUS_RESPONSE_pipe_read_req   => AFB_BUS_RESPONSE_pipe_write_ack,
    				AFB_BUS_RESPONSE_pipe_read_ack   => AFB_BUS_RESPONSE_pipe_write_req,
    				SPI_MASTER_COMMAND_pipe_read_data => FLASH_SPI_MASTER_COMMAND_pipe_read_data,
    				SPI_MASTER_COMMAND_pipe_read_req  => FLASH_SPI_MASTER_COMMAND_pipe_read_req,
    				SPI_MASTER_COMMAND_pipe_read_ack  => FLASH_SPI_MASTER_COMMAND_pipe_read_ack,
    				SPI_MASTER_RESPONSE_pipe_write_data => FLASH_SPI_MASTER_RESPONSE_pipe_write_data,
    				SPI_MASTER_RESPONSE_pipe_write_req  => FLASH_SPI_MASTER_RESPONSE_pipe_write_req,
    				SPI_MASTER_RESPONSE_pipe_write_ack  => FLASH_SPI_MASTER_RESPONSE_pipe_write_ack,
				WRITE_PROTECT => ZSLV1);
	ZSLV1(0) <= '0';


	flash_spi_master_inst: spi_master_stub
		port map (
				master_in_data_pipe_write_data => 
					FLASH_SPI_MASTER_COMMAND_pipe_read_data,
				master_in_data_pipe_write_req => 
					FLASH_SPI_MASTER_COMMAND_pipe_read_ack,
				master_in_data_pipe_write_ack => 
					FLASH_SPI_MASTER_COMMAND_pipe_read_req,
				master_out_data_pipe_read_data =>
					FLASH_SPI_MASTER_RESPONSE_pipe_write_data,
				master_out_data_pipe_read_req =>
					FLASH_SPI_MASTER_RESPONSE_pipe_write_ack,
				master_out_data_pipe_read_ack =>
					FLASH_SPI_MASTER_RESPONSE_pipe_write_req,
    				spi_miso => spi_miso,
    				spi_clk => spi_clk2,
    				spi_cs_n => spi_cs_n8,
    				spi_mosi => spi_mosi,
    				clk => ui_clk, 
    				reset => reset_sync);



	

	clk_wiz_inst: clk_wiz_0 
	Port map( 
		clk_sys_320 => clk_sys_320, -- goes to the DRAM controller
		clk_ref_200 => clk_ref_200, -- goes to the DRAM controller
		reset       => clk_rst,
		clk_in1_p   => sys_clk_p,
		clk_in1_n   => sys_clk_n);




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
                		USRCCLKO => spi_clk1,   -- Provide signal to output on CCLK pin 
               			USRCCLKTS => '0',       -- Enable CCLK pin  
                		USRDONEO => '1',       -- Drive DONE pin High even though tri-state
               			USRDONETS => '1' );     -- Maintain tri-state of DONE pin
		
  	process (ui_clk)
    	begin
    		if (ui_clk'event and ui_clk = '1') then
        		reset2 <= reset1;
        		reset1 <= sys_rst;
    		end if;
  	end process;
  	reset_sync <= reset2;

	
-- Info: Baudrate 115200 ClkFreq 100000000:  Baud-freq = 288, Baud-limit= 15337 Baud-control=0x3be90120
-- Info: Baudrate 115200 ClkFreq 80000000:   Baud-freq = 72, Baud-limit= 3053 Baud-control=0x0bed0048
-- Info: Baudrate 115200 ClkFreq 50000000:   Baud-freq = 576, Baud-limit= 15049 Baud-control=0x3ac90240
  	CONFIG_UART_BAUD_CONTROL_WORD  <= X"0bed0048";

  	debug_uart_inst: configurable_uart
  	port map ( --
    		CONFIG_UART_BAUD_CONTROL_WORD => CONFIG_UART_BAUD_CONTROL_WORD,
    		CONSOLE_to_RX_pipe_read_data => MONITOR_to_DEBUG_pipe_write_data,
    		CONSOLE_to_RX_pipe_read_req => MONITOR_to_DEBUG_pipe_write_ack,
    		CONSOLE_to_RX_pipe_read_ack => MONITOR_to_DEBUG_pipe_write_req,
    		TX_to_CONSOLE_pipe_write_data => DEBUG_to_MONITOR_pipe_read_data,
    		TX_to_CONSOLE_pipe_write_req => DEBUG_to_MONITOR_pipe_read_ack,
    		TX_to_CONSOLE_pipe_write_ack => DEBUG_to_MONITOR_pipe_read_req,
    		UART_RX => DEBUG_UART_RX,
    		UART_TX => DEBUG_UART_TX,
    		clk => ui_clk, reset => reset_sync); --
  
	serial_uart_inst: configurable_uart
  	port map ( --
    		CONFIG_UART_BAUD_CONTROL_WORD => CONFIG_UART_BAUD_CONTROL_WORD,
    		CONSOLE_to_RX_pipe_read_data => CONSOLE_to_SERIAL_RX_pipe_write_data,
    		CONSOLE_to_RX_pipe_read_req => CONSOLE_to_SERIAL_RX_pipe_write_ack,
    		CONSOLE_to_RX_pipe_read_ack => CONSOLE_to_SERIAL_RX_pipe_write_req,
    		TX_to_CONSOLE_pipe_write_data => SERIAL_TX_to_CONSOLE_pipe_read_data,
    		TX_to_CONSOLE_pipe_write_req => SERIAL_TX_to_CONSOLE_pipe_read_ack,
    		TX_to_CONSOLE_pipe_write_ack => SERIAL_TX_to_CONSOLE_pipe_read_req,
    		UART_RX => SERIAL_UART_RX,
    		UART_TX => SERIAL_UART_TX,
    		clk => ui_clk, reset => reset_sync); -- 

end wrapper;


