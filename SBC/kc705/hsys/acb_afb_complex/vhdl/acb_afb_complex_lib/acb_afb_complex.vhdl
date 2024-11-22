library ieee;
use ieee.std_logic_1164.all;
package acb_afb_complex_Type_Package is -- 
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
library acb_afb_complex_lib;
use acb_afb_complex_lib.acb_afb_complex_Type_Package.all;
--<<<<<
-->>>>>
library GlueModules;
library GlueModules;
library GlueModules;
library GlueModules;
library GlueModules;
--<<<<<
entity acb_afb_complex is -- 
  port( -- 
    ACB_REQUEST_FROM_NIC_pipe_write_data : in std_logic_vector(109 downto 0);
    ACB_REQUEST_FROM_NIC_pipe_write_req  : in std_logic_vector(0  downto 0);
    ACB_REQUEST_FROM_NIC_pipe_write_ack  : out std_logic_vector(0  downto 0);
    ACB_REQUEST_FROM_PROCESSOR_pipe_write_data : in std_logic_vector(109 downto 0);
    ACB_REQUEST_FROM_PROCESSOR_pipe_write_req  : in std_logic_vector(0  downto 0);
    ACB_REQUEST_FROM_PROCESSOR_pipe_write_ack  : out std_logic_vector(0  downto 0);
    ACB_RESPONSE_FROM_DRAM_pipe_write_data : in std_logic_vector(64 downto 0);
    ACB_RESPONSE_FROM_DRAM_pipe_write_req  : in std_logic_vector(0  downto 0);
    ACB_RESPONSE_FROM_DRAM_pipe_write_ack  : out std_logic_vector(0  downto 0);
    AFB_RESPONSE_FROM_FLASH_pipe_write_data : in std_logic_vector(32 downto 0);
    AFB_RESPONSE_FROM_FLASH_pipe_write_req  : in std_logic_vector(0  downto 0);
    AFB_RESPONSE_FROM_FLASH_pipe_write_ack  : out std_logic_vector(0  downto 0);
    AFB_RESPONSE_FROM_NIC_pipe_write_data : in std_logic_vector(32 downto 0);
    AFB_RESPONSE_FROM_NIC_pipe_write_req  : in std_logic_vector(0  downto 0);
    AFB_RESPONSE_FROM_NIC_pipe_write_ack  : out std_logic_vector(0  downto 0);
    MAX_ACB_TAP1_ADDR : in std_logic_vector(35 downto 0);
    MAX_ACB_TAP2_ADDR : in std_logic_vector(35 downto 0);
    MIN_ACB_TAP1_ADDR : in std_logic_vector(35 downto 0);
    MIN_ACB_TAP2_ADDR : in std_logic_vector(35 downto 0);
    ACB_REQUEST_TO_DRAM_pipe_read_data : out std_logic_vector(109 downto 0);
    ACB_REQUEST_TO_DRAM_pipe_read_req  : in std_logic_vector(0  downto 0);
    ACB_REQUEST_TO_DRAM_pipe_read_ack  : out std_logic_vector(0  downto 0);
    ACB_RESPONSE_TO_NIC_pipe_read_data : out std_logic_vector(64 downto 0);
    ACB_RESPONSE_TO_NIC_pipe_read_req  : in std_logic_vector(0  downto 0);
    ACB_RESPONSE_TO_NIC_pipe_read_ack  : out std_logic_vector(0  downto 0);
    ACB_RESPONSE_TO_PROCESSOR_pipe_read_data : out std_logic_vector(64 downto 0);
    ACB_RESPONSE_TO_PROCESSOR_pipe_read_req  : in std_logic_vector(0  downto 0);
    ACB_RESPONSE_TO_PROCESSOR_pipe_read_ack  : out std_logic_vector(0  downto 0);
    AFB_REQUEST_TO_FLASH_pipe_read_data : out std_logic_vector(73 downto 0);
    AFB_REQUEST_TO_FLASH_pipe_read_req  : in std_logic_vector(0  downto 0);
    AFB_REQUEST_TO_FLASH_pipe_read_ack  : out std_logic_vector(0  downto 0);
    AFB_REQUEST_TO_NIC_pipe_read_data : out std_logic_vector(73 downto 0);
    AFB_REQUEST_TO_NIC_pipe_read_req  : in std_logic_vector(0  downto 0);
    AFB_REQUEST_TO_NIC_pipe_read_ack  : out std_logic_vector(0  downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
end entity acb_afb_complex;
architecture struct of acb_afb_complex is -- 
  signal hsys_tie_low, hsys_tie_high: std_logic;
  signal ACB_TAP_REQUEST_TO_FLASH_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_TAP_REQUEST_TO_FLASH_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_REQUEST_TO_FLASH_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_REQUEST_TO_FLASH_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_TAP_REQUEST_TO_FLASH_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_REQUEST_TO_FLASH_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_REQUEST_TO_NIC_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_TAP_REQUEST_TO_NIC_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_REQUEST_TO_NIC_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_REQUEST_TO_NIC_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_TAP_REQUEST_TO_NIC_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_REQUEST_TO_NIC_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_RESPONSE_FROM_FLASH_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_TAP_RESPONSE_FROM_FLASH_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_RESPONSE_FROM_FLASH_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_RESPONSE_FROM_FLASH_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_TAP_RESPONSE_FROM_FLASH_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_RESPONSE_FROM_FLASH_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_RESPONSE_FROM_NIC_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_TAP_RESPONSE_FROM_NIC_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_RESPONSE_FROM_NIC_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_TAP_RESPONSE_FROM_NIC_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_TAP_RESPONSE_FROM_NIC_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_TAP_RESPONSE_FROM_NIC_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_REQUEST_TO_DRAM_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_THROUGH_REQUEST_TO_DRAM_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_REQUEST_TO_DRAM_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_REQUEST_TO_DRAM_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_THROUGH_REQUEST_TO_DRAM_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_REQUEST_TO_DRAM_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_read_ack : std_logic_vector(0  downto 0);
  component acb_afb_bridge is -- 
    port( -- 
      AFB_BUS_RESPONSE_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_BUS_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_BUS_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_BUS_REQUEST_pipe_read_data : out std_logic_vector(73 downto 0);
      AFB_BUS_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_BUS_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for acb_afb_bridge_inst_1 :  acb_afb_bridge -- 
    use entity GlueModules.acb_afb_bridge; -- 
  --<<<<<
  -->>>>>
  for acb_afb_bridge_inst_2 :  acb_afb_bridge -- 
    use entity GlueModules.acb_afb_bridge; -- 
  --<<<<<
  component acb_fast_mux is -- 
    port( -- 
      CORE_BUS_REQUEST_HIGH_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_HIGH_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_HIGH_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_LOW_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_LOW_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_LOW_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_write_data : in std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_HIGH_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_HIGH_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_HIGH_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_LOW_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_LOW_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_LOW_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for acb_fast_mux_inst :  acb_fast_mux -- 
    use entity GlueModules.acb_fast_mux; -- 
  --<<<<<
  component acb_fast_tap is -- 
    port( -- 
      CORE_BUS_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_TAP_pipe_write_data : in std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_TAP_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_TAP_pipe_write_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_THROUGH_pipe_write_data : in std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_THROUGH_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_THROUGH_pipe_write_ack  : out std_logic_vector(0  downto 0);
      MAX_ADDR_TAP : in std_logic_vector(35 downto 0);
      MIN_ADDR_TAP : in std_logic_vector(35 downto 0);
      CORE_BUS_REQUEST_TAP_pipe_read_data : out std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_TAP_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_TAP_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_THROUGH_pipe_read_data : out std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_THROUGH_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_THROUGH_pipe_read_ack  : out std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for acb_tap_inst_1 :  acb_fast_tap -- 
    use entity GlueModules.acb_fast_tap; -- 
  --<<<<<
  -->>>>>
  for acb_tap_inst_2 :  acb_fast_tap -- 
    use entity GlueModules.acb_fast_tap; -- 
  --<<<<<
  -- 
begin -- 
  hsys_tie_low  <= '0';
  hsys_tie_high <= '1';
  acb_afb_bridge_inst_1: acb_afb_bridge
  port map ( --
    AFB_BUS_REQUEST_pipe_read_data => AFB_REQUEST_TO_NIC_pipe_read_data,
    AFB_BUS_REQUEST_pipe_read_req => AFB_REQUEST_TO_NIC_pipe_read_req,
    AFB_BUS_REQUEST_pipe_read_ack => AFB_REQUEST_TO_NIC_pipe_read_ack,
    AFB_BUS_RESPONSE_pipe_write_data => AFB_RESPONSE_FROM_NIC_pipe_write_data,
    AFB_BUS_RESPONSE_pipe_write_req => AFB_RESPONSE_FROM_NIC_pipe_write_req,
    AFB_BUS_RESPONSE_pipe_write_ack => AFB_RESPONSE_FROM_NIC_pipe_write_ack,
    CORE_BUS_REQUEST_pipe_write_data => ACB_TAP_REQUEST_TO_NIC_pipe_read_data,
    CORE_BUS_REQUEST_pipe_write_req => ACB_TAP_REQUEST_TO_NIC_pipe_read_ack,
    CORE_BUS_REQUEST_pipe_write_ack => ACB_TAP_REQUEST_TO_NIC_pipe_read_req,
    CORE_BUS_RESPONSE_pipe_read_data => ACB_TAP_RESPONSE_FROM_NIC_pipe_write_data,
    CORE_BUS_RESPONSE_pipe_read_req => ACB_TAP_RESPONSE_FROM_NIC_pipe_write_ack,
    CORE_BUS_RESPONSE_pipe_read_ack => ACB_TAP_RESPONSE_FROM_NIC_pipe_write_req,
    clk => clk,  reset => reset
    ); -- 
  acb_afb_bridge_inst_2: acb_afb_bridge
  port map ( --
    AFB_BUS_REQUEST_pipe_read_data => AFB_REQUEST_TO_FLASH_pipe_read_data,
    AFB_BUS_REQUEST_pipe_read_req => AFB_REQUEST_TO_FLASH_pipe_read_req,
    AFB_BUS_REQUEST_pipe_read_ack => AFB_REQUEST_TO_FLASH_pipe_read_ack,
    AFB_BUS_RESPONSE_pipe_write_data => AFB_RESPONSE_FROM_FLASH_pipe_write_data,
    AFB_BUS_RESPONSE_pipe_write_req => AFB_RESPONSE_FROM_FLASH_pipe_write_req,
    AFB_BUS_RESPONSE_pipe_write_ack => AFB_RESPONSE_FROM_FLASH_pipe_write_ack,
    CORE_BUS_REQUEST_pipe_write_data => ACB_TAP_REQUEST_TO_FLASH_pipe_read_data,
    CORE_BUS_REQUEST_pipe_write_req => ACB_TAP_REQUEST_TO_FLASH_pipe_read_ack,
    CORE_BUS_REQUEST_pipe_write_ack => ACB_TAP_REQUEST_TO_FLASH_pipe_read_req,
    CORE_BUS_RESPONSE_pipe_read_data => ACB_TAP_RESPONSE_FROM_FLASH_pipe_write_data,
    CORE_BUS_RESPONSE_pipe_read_req => ACB_TAP_RESPONSE_FROM_FLASH_pipe_write_ack,
    CORE_BUS_RESPONSE_pipe_read_ack => ACB_TAP_RESPONSE_FROM_FLASH_pipe_write_req,
    clk => clk,  reset => reset
    ); -- 
  acb_fast_mux_inst: acb_fast_mux
  port map ( --
    CORE_BUS_REQUEST_pipe_read_data => ACB_REQUEST_TO_DRAM_pipe_read_data,
    CORE_BUS_REQUEST_pipe_read_req => ACB_REQUEST_TO_DRAM_pipe_read_req,
    CORE_BUS_REQUEST_pipe_read_ack => ACB_REQUEST_TO_DRAM_pipe_read_ack,
    CORE_BUS_REQUEST_HIGH_pipe_write_data => ACB_REQUEST_FROM_NIC_pipe_write_data,
    CORE_BUS_REQUEST_HIGH_pipe_write_req => ACB_REQUEST_FROM_NIC_pipe_write_req,
    CORE_BUS_REQUEST_HIGH_pipe_write_ack => ACB_REQUEST_FROM_NIC_pipe_write_ack,
    CORE_BUS_REQUEST_LOW_pipe_write_data => ACB_THROUGH_REQUEST_TO_DRAM_pipe_read_data,
    CORE_BUS_REQUEST_LOW_pipe_write_req => ACB_THROUGH_REQUEST_TO_DRAM_pipe_read_ack,
    CORE_BUS_REQUEST_LOW_pipe_write_ack => ACB_THROUGH_REQUEST_TO_DRAM_pipe_read_req,
    CORE_BUS_RESPONSE_pipe_write_data => ACB_RESPONSE_FROM_DRAM_pipe_write_data,
    CORE_BUS_RESPONSE_pipe_write_req => ACB_RESPONSE_FROM_DRAM_pipe_write_req,
    CORE_BUS_RESPONSE_pipe_write_ack => ACB_RESPONSE_FROM_DRAM_pipe_write_ack,
    CORE_BUS_RESPONSE_HIGH_pipe_read_data => ACB_RESPONSE_TO_NIC_pipe_read_data,
    CORE_BUS_RESPONSE_HIGH_pipe_read_req => ACB_RESPONSE_TO_NIC_pipe_read_req,
    CORE_BUS_RESPONSE_HIGH_pipe_read_ack => ACB_RESPONSE_TO_NIC_pipe_read_ack,
    CORE_BUS_RESPONSE_LOW_pipe_read_data => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_write_data,
    CORE_BUS_RESPONSE_LOW_pipe_read_req => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_write_ack,
    CORE_BUS_RESPONSE_LOW_pipe_read_ack => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_write_req,
    clk => clk,  reset => reset
    ); -- 
  acb_tap_inst_1: acb_fast_tap
  port map ( --
    CORE_BUS_REQUEST_pipe_write_data => ACB_REQUEST_FROM_PROCESSOR_pipe_write_data,
    CORE_BUS_REQUEST_pipe_write_req => ACB_REQUEST_FROM_PROCESSOR_pipe_write_req,
    CORE_BUS_REQUEST_pipe_write_ack => ACB_REQUEST_FROM_PROCESSOR_pipe_write_ack,
    CORE_BUS_REQUEST_TAP_pipe_read_data => ACB_TAP_REQUEST_TO_NIC_pipe_write_data,
    CORE_BUS_REQUEST_TAP_pipe_read_req => ACB_TAP_REQUEST_TO_NIC_pipe_write_ack,
    CORE_BUS_REQUEST_TAP_pipe_read_ack => ACB_TAP_REQUEST_TO_NIC_pipe_write_req,
    CORE_BUS_REQUEST_THROUGH_pipe_read_data => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_write_data,
    CORE_BUS_REQUEST_THROUGH_pipe_read_req => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_write_ack,
    CORE_BUS_REQUEST_THROUGH_pipe_read_ack => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_write_req,
    CORE_BUS_RESPONSE_pipe_read_data => ACB_RESPONSE_TO_PROCESSOR_pipe_read_data,
    CORE_BUS_RESPONSE_pipe_read_req => ACB_RESPONSE_TO_PROCESSOR_pipe_read_req,
    CORE_BUS_RESPONSE_pipe_read_ack => ACB_RESPONSE_TO_PROCESSOR_pipe_read_ack,
    CORE_BUS_RESPONSE_TAP_pipe_write_data => ACB_TAP_RESPONSE_FROM_NIC_pipe_read_data,
    CORE_BUS_RESPONSE_TAP_pipe_write_req => ACB_TAP_RESPONSE_FROM_NIC_pipe_read_ack,
    CORE_BUS_RESPONSE_TAP_pipe_write_ack => ACB_TAP_RESPONSE_FROM_NIC_pipe_read_req,
    CORE_BUS_RESPONSE_THROUGH_pipe_write_data => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_read_data,
    CORE_BUS_RESPONSE_THROUGH_pipe_write_req => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_read_ack,
    CORE_BUS_RESPONSE_THROUGH_pipe_write_ack => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_read_req,
    MAX_ADDR_TAP => MAX_ACB_TAP1_ADDR,
    MIN_ADDR_TAP => MIN_ACB_TAP1_ADDR,
    clk => clk,  reset => reset
    ); -- 
  acb_tap_inst_2: acb_fast_tap
  port map ( --
    CORE_BUS_REQUEST_pipe_write_data => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_read_data,
    CORE_BUS_REQUEST_pipe_write_req => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_read_ack,
    CORE_BUS_REQUEST_pipe_write_ack => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_read_req,
    CORE_BUS_REQUEST_TAP_pipe_read_data => ACB_TAP_REQUEST_TO_FLASH_pipe_write_data,
    CORE_BUS_REQUEST_TAP_pipe_read_req => ACB_TAP_REQUEST_TO_FLASH_pipe_write_ack,
    CORE_BUS_REQUEST_TAP_pipe_read_ack => ACB_TAP_REQUEST_TO_FLASH_pipe_write_req,
    CORE_BUS_REQUEST_THROUGH_pipe_read_data => ACB_THROUGH_REQUEST_TO_DRAM_pipe_write_data,
    CORE_BUS_REQUEST_THROUGH_pipe_read_req => ACB_THROUGH_REQUEST_TO_DRAM_pipe_write_ack,
    CORE_BUS_REQUEST_THROUGH_pipe_read_ack => ACB_THROUGH_REQUEST_TO_DRAM_pipe_write_req,
    CORE_BUS_RESPONSE_pipe_read_data => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_write_data,
    CORE_BUS_RESPONSE_pipe_read_req => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_write_ack,
    CORE_BUS_RESPONSE_pipe_read_ack => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_write_req,
    CORE_BUS_RESPONSE_TAP_pipe_write_data => ACB_TAP_RESPONSE_FROM_FLASH_pipe_read_data,
    CORE_BUS_RESPONSE_TAP_pipe_write_req => ACB_TAP_RESPONSE_FROM_FLASH_pipe_read_ack,
    CORE_BUS_RESPONSE_TAP_pipe_write_ack => ACB_TAP_RESPONSE_FROM_FLASH_pipe_read_req,
    CORE_BUS_RESPONSE_THROUGH_pipe_write_data => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_read_data,
    CORE_BUS_RESPONSE_THROUGH_pipe_write_req => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_read_ack,
    CORE_BUS_RESPONSE_THROUGH_pipe_write_ack => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_read_req,
    MAX_ADDR_TAP => MAX_ACB_TAP2_ADDR,
    MIN_ADDR_TAP => MIN_ACB_TAP2_ADDR,
    clk => clk,  reset => reset
    ); -- 
  ACB_TAP_REQUEST_TO_FLASH_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_TAP_REQUEST_TO_FLASH",
      num_reads => 1,
      num_writes => 1,
      data_width => 110,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => ACB_TAP_REQUEST_TO_FLASH_pipe_read_req,
      read_ack => ACB_TAP_REQUEST_TO_FLASH_pipe_read_ack,
      read_data => ACB_TAP_REQUEST_TO_FLASH_pipe_read_data,
      write_req => ACB_TAP_REQUEST_TO_FLASH_pipe_write_req,
      write_ack => ACB_TAP_REQUEST_TO_FLASH_pipe_write_ack,
      write_data => ACB_TAP_REQUEST_TO_FLASH_pipe_write_data,
      clk => clk, reset => reset -- 
    ); -- 
  ACB_TAP_REQUEST_TO_NIC_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_TAP_REQUEST_TO_NIC",
      num_reads => 1,
      num_writes => 1,
      data_width => 110,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => ACB_TAP_REQUEST_TO_NIC_pipe_read_req,
      read_ack => ACB_TAP_REQUEST_TO_NIC_pipe_read_ack,
      read_data => ACB_TAP_REQUEST_TO_NIC_pipe_read_data,
      write_req => ACB_TAP_REQUEST_TO_NIC_pipe_write_req,
      write_ack => ACB_TAP_REQUEST_TO_NIC_pipe_write_ack,
      write_data => ACB_TAP_REQUEST_TO_NIC_pipe_write_data,
      clk => clk, reset => reset -- 
    ); -- 
  ACB_TAP_RESPONSE_FROM_FLASH_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_TAP_RESPONSE_FROM_FLASH",
      num_reads => 1,
      num_writes => 1,
      data_width => 65,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => ACB_TAP_RESPONSE_FROM_FLASH_pipe_read_req,
      read_ack => ACB_TAP_RESPONSE_FROM_FLASH_pipe_read_ack,
      read_data => ACB_TAP_RESPONSE_FROM_FLASH_pipe_read_data,
      write_req => ACB_TAP_RESPONSE_FROM_FLASH_pipe_write_req,
      write_ack => ACB_TAP_RESPONSE_FROM_FLASH_pipe_write_ack,
      write_data => ACB_TAP_RESPONSE_FROM_FLASH_pipe_write_data,
      clk => clk, reset => reset -- 
    ); -- 
  ACB_TAP_RESPONSE_FROM_NIC_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_TAP_RESPONSE_FROM_NIC",
      num_reads => 1,
      num_writes => 1,
      data_width => 65,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => ACB_TAP_RESPONSE_FROM_NIC_pipe_read_req,
      read_ack => ACB_TAP_RESPONSE_FROM_NIC_pipe_read_ack,
      read_data => ACB_TAP_RESPONSE_FROM_NIC_pipe_read_data,
      write_req => ACB_TAP_RESPONSE_FROM_NIC_pipe_write_req,
      write_ack => ACB_TAP_RESPONSE_FROM_NIC_pipe_write_ack,
      write_data => ACB_TAP_RESPONSE_FROM_NIC_pipe_write_data,
      clk => clk, reset => reset -- 
    ); -- 
  ACB_THROUGH_REQUEST_TO_DRAM_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_THROUGH_REQUEST_TO_DRAM",
      num_reads => 1,
      num_writes => 1,
      data_width => 110,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => ACB_THROUGH_REQUEST_TO_DRAM_pipe_read_req,
      read_ack => ACB_THROUGH_REQUEST_TO_DRAM_pipe_read_ack,
      read_data => ACB_THROUGH_REQUEST_TO_DRAM_pipe_read_data,
      write_req => ACB_THROUGH_REQUEST_TO_DRAM_pipe_write_req,
      write_ack => ACB_THROUGH_REQUEST_TO_DRAM_pipe_write_ack,
      write_data => ACB_THROUGH_REQUEST_TO_DRAM_pipe_write_data,
      clk => clk, reset => reset -- 
    ); -- 
  ACB_THROUGH_REQUEST_TO_FLASH_DRAM_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_THROUGH_REQUEST_TO_FLASH_DRAM",
      num_reads => 1,
      num_writes => 1,
      data_width => 110,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_read_req,
      read_ack => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_read_ack,
      read_data => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_read_data,
      write_req => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_write_req,
      write_ack => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_write_ack,
      write_data => ACB_THROUGH_REQUEST_TO_FLASH_DRAM_pipe_write_data,
      clk => clk, reset => reset -- 
    ); -- 
  ACB_THROUGH_RESPONSE_FROM_DRAM_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_THROUGH_RESPONSE_FROM_DRAM",
      num_reads => 1,
      num_writes => 1,
      data_width => 65,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_read_req,
      read_ack => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_read_ack,
      read_data => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_read_data,
      write_req => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_write_req,
      write_ack => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_write_ack,
      write_data => ACB_THROUGH_RESPONSE_FROM_DRAM_pipe_write_data,
      clk => clk, reset => reset -- 
    ); -- 
  ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM",
      num_reads => 1,
      num_writes => 1,
      data_width => 65,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_read_req,
      read_ack => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_read_ack,
      read_data => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_read_data,
      write_req => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_write_req,
      write_ack => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_write_ack,
      write_data => ACB_THROUGH_RESPONSE_FROM_FLASH_DRAM_pipe_write_data,
      clk => clk, reset => reset -- 
    ); -- 
  -- 
end struct;
