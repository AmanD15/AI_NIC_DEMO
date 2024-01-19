library ieee;
use ieee.std_logic_1164.all;
package sbc_kc705_core_Type_Package is -- 
  subtype unsigned_0_downto_0 is std_logic_vector(0 downto 0);
  subtype unsigned_29_downto_0 is std_logic_vector(29 downto 0);
  subtype unsigned_109_downto_0 is std_logic_vector(109 downto 0);
  subtype unsigned_32_downto_0 is std_logic_vector(32 downto 0);
  subtype unsigned_64_downto_0 is std_logic_vector(64 downto 0);
  subtype unsigned_73_downto_0 is std_logic_vector(73 downto 0);
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
--library work;
--use work.ai_ml_engine_global_package.all;
library sbc_kc705_core_lib;
use sbc_kc705_core_lib.sbc_kc705_core_Type_Package.all;
--<<<<<
entity clockResetDummy is  -- 
  port (-- 
    c1: in std_logic_vector(0 downto 0);
    c2: in std_logic_vector(0 downto 0);
    c3: in std_logic_vector(0 downto 0);
    c4: in std_logic_vector(0 downto 0);
    c5: in std_logic_vector(0 downto 0);
    c6: in std_logic_vector(0 downto 0);
    clk, reset: in std_logic); --
  --
end entity clockResetDummy;
architecture rtlThreadArch of clockResetDummy is --
  type ThreadState is (s_crt_rst_state);
  signal current_thread_state : ThreadState;
  --
begin -- 
  process(clk, reset, current_thread_state , c1, c2, c3, c4, c5, c6) --
    -- declared variables and implied variables 
    variable t1: unsigned_0_downto_0;
    variable t2: unsigned_0_downto_0;
    variable t3: unsigned_0_downto_0;
    variable t4: unsigned_0_downto_0;
    variable t5: unsigned_0_downto_0;
    variable t6: unsigned_0_downto_0;
    variable next_thread_state : ThreadState;
    --
  begin -- 
    -- default values 
    next_thread_state := current_thread_state;
    --  t1 :=  c1
    t1 := c1;
    --  t2 :=  c2
    t2 := c2;
    --  t3 :=  c3
    t3 := c3;
    --  t4 :=  c4
    t4 := c4;
    --  t5 :=  c5
    t5 := c5;
    --  t6 :=  c6
    t6 := c6;
    -- case statement 
    case current_thread_state is -- 
      when s_crt_rst_state => -- 
        next_thread_state := s_crt_rst_state;
        next_thread_state := s_crt_rst_state;
        --
      --
    end case;
    if (clk'event and clk = '1') then -- 
      if (reset = '1') then -- 
        current_thread_state <= s_crt_rst_state;
        -- 
      else -- 
        current_thread_state <= next_thread_state; 
        -- objects to be updated under tick.
        -- specified tick assignments. 
        -- 
      end if; 
      -- 
    end if; 
    --
  end process; 
  --
end rtlThreadArch;
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
library sbc_kc705_core_lib;
use sbc_kc705_core_lib.sbc_kc705_core_Type_Package.all;
--<<<<<
entity invalidateDummy is  -- 
  port (-- 
    ei: out std_logic_vector(0 downto 0);
    inval: out std_logic_vector(29 downto 0);
    inval_pipe_write_req: out std_logic_vector(0 downto 0);
    inval_pipe_write_ack: in std_logic_vector(0 downto 0);
    clk, reset: in std_logic); --
  --
end entity invalidateDummy;
architecture rtlThreadArch of invalidateDummy is --
  type ThreadState is (s_inval_rst_state);
  signal current_thread_state : ThreadState;
  --
begin -- 
  process(clk, reset, current_thread_state , inval_pipe_write_ack) --
    -- declared variables and implied variables 
    variable next_thread_state : ThreadState;
    --
  begin -- 
    -- default values 
    next_thread_state := current_thread_state;
    --  $now  inval$req  :=  ( $unsigned<1> )  0 
    inval_pipe_write_req <= "0";
    --  $now  inval :=  ( $unsigned<30> )  000000000000000000000000000000 
    inval <= "000000000000000000000000000000";
    --  $now  ei :=  ( $unsigned<1> )  0 
    ei <= "0";
    -- case statement 
    case current_thread_state is -- 
      when s_inval_rst_state => -- 
        next_thread_state := s_inval_rst_state;
        next_thread_state := s_inval_rst_state;
        --
      --
    end case;
    if (clk'event and clk = '1') then -- 
      if (reset = '1') then -- 
        current_thread_state <= s_inval_rst_state;
        -- 
      else -- 
        current_thread_state <= next_thread_state; 
        -- objects to be updated under tick.
        -- specified tick assignments. 
        -- 
      end if; 
      -- 
    end if; 
    --
  end process; 
  --
end rtlThreadArch;
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
library sbc_kc705_core_lib;
use sbc_kc705_core_lib.sbc_kc705_core_Type_Package.all;
--<<<<<
entity set_addr_tap is  -- 
  port (-- 
    acb_request_from_accelerator_1: out std_logic_vector(109 downto 0);
    acb_request_from_accelerator_1_pipe_write_req: out std_logic_vector(0 downto 0);
    acb_request_from_accelerator_1_pipe_write_ack: in std_logic_vector(0 downto 0);
    acb_request_from_accelerator_2: out std_logic_vector(109 downto 0);
    acb_request_from_accelerator_2_pipe_write_req: out std_logic_vector(0 downto 0);
    acb_request_from_accelerator_2_pipe_write_ack: in std_logic_vector(0 downto 0);
    acb_request_from_accelerator_3: out std_logic_vector(109 downto 0);
    acb_request_from_accelerator_3_pipe_write_req: out std_logic_vector(0 downto 0);
    acb_request_from_accelerator_3_pipe_write_ack: in std_logic_vector(0 downto 0);
    acb_request_from_accelerator_4: out std_logic_vector(109 downto 0);
    acb_request_from_accelerator_4_pipe_write_req: out std_logic_vector(0 downto 0);
    acb_request_from_accelerator_4_pipe_write_ack: in std_logic_vector(0 downto 0);
    acb_response_to_accelerator_1: in std_logic_vector(64 downto 0);
    acb_response_to_accelerator_1_pipe_read_req: out std_logic_vector(0 downto 0);
    acb_response_to_accelerator_1_pipe_read_ack: in std_logic_vector(0 downto 0);
    acb_response_to_accelerator_2: in std_logic_vector(64 downto 0);
    acb_response_to_accelerator_2_pipe_read_req: out std_logic_vector(0 downto 0);
    acb_response_to_accelerator_2_pipe_read_ack: in std_logic_vector(0 downto 0);
    acb_response_to_accelerator_3: in std_logic_vector(64 downto 0);
    acb_response_to_accelerator_3_pipe_read_req: out std_logic_vector(0 downto 0);
    acb_response_to_accelerator_3_pipe_read_ack: in std_logic_vector(0 downto 0);
    acb_response_to_accelerator_4: in std_logic_vector(64 downto 0);
    acb_response_to_accelerator_4_pipe_read_req: out std_logic_vector(0 downto 0);
    acb_response_to_accelerator_4_pipe_read_ack: in std_logic_vector(0 downto 0);
    afb_request_to_accelerator_1: in std_logic_vector(73 downto 0);
    afb_request_to_accelerator_1_pipe_read_req: out std_logic_vector(0 downto 0);
    afb_request_to_accelerator_1_pipe_read_ack: in std_logic_vector(0 downto 0);
    afb_request_to_accelerator_2: in std_logic_vector(73 downto 0);
    afb_request_to_accelerator_2_pipe_read_req: out std_logic_vector(0 downto 0);
    afb_request_to_accelerator_2_pipe_read_ack: in std_logic_vector(0 downto 0);
    afb_request_to_accelerator_3: in std_logic_vector(73 downto 0);
    afb_request_to_accelerator_3_pipe_read_req: out std_logic_vector(0 downto 0);
    afb_request_to_accelerator_3_pipe_read_ack: in std_logic_vector(0 downto 0);
    afb_request_to_accelerator_4: in std_logic_vector(73 downto 0);
    afb_request_to_accelerator_4_pipe_read_req: out std_logic_vector(0 downto 0);
    afb_request_to_accelerator_4_pipe_read_ack: in std_logic_vector(0 downto 0);
    afb_response_from_accelerator_1: out std_logic_vector(32 downto 0);
    afb_response_from_accelerator_1_pipe_write_req: out std_logic_vector(0 downto 0);
    afb_response_from_accelerator_1_pipe_write_ack: in std_logic_vector(0 downto 0);
    afb_response_from_accelerator_2: out std_logic_vector(32 downto 0);
    afb_response_from_accelerator_2_pipe_write_req: out std_logic_vector(0 downto 0);
    afb_response_from_accelerator_2_pipe_write_ack: in std_logic_vector(0 downto 0);
    afb_response_from_accelerator_3: out std_logic_vector(32 downto 0);
    afb_response_from_accelerator_3_pipe_write_req: out std_logic_vector(0 downto 0);
    afb_response_from_accelerator_3_pipe_write_ack: in std_logic_vector(0 downto 0);
    afb_response_from_accelerator_4: out std_logic_vector(32 downto 0);
    afb_response_from_accelerator_4_pipe_write_req: out std_logic_vector(0 downto 0);
    afb_response_from_accelerator_4_pipe_write_ack: in std_logic_vector(0 downto 0);
    clk, reset: in std_logic); --
  --
end entity set_addr_tap;
architecture rtlThreadArch of set_addr_tap is --
  type ThreadState is (s_dummy_reset_state);
  signal current_thread_state : ThreadState;
  --
begin -- 
  process(clk, reset, current_thread_state , acb_request_from_accelerator_1_pipe_write_ack, acb_request_from_accelerator_2_pipe_write_ack, acb_request_from_accelerator_3_pipe_write_ack, acb_request_from_accelerator_4_pipe_write_ack, acb_response_to_accelerator_1, acb_response_to_accelerator_1_pipe_read_ack, acb_response_to_accelerator_2, acb_response_to_accelerator_2_pipe_read_ack, acb_response_to_accelerator_3, acb_response_to_accelerator_3_pipe_read_ack, acb_response_to_accelerator_4, acb_response_to_accelerator_4_pipe_read_ack, afb_request_to_accelerator_1, afb_request_to_accelerator_1_pipe_read_ack, afb_request_to_accelerator_2, afb_request_to_accelerator_2_pipe_read_ack, afb_request_to_accelerator_3, afb_request_to_accelerator_3_pipe_read_ack, afb_request_to_accelerator_4, afb_request_to_accelerator_4_pipe_read_ack, afb_response_from_accelerator_1_pipe_write_ack, afb_response_from_accelerator_2_pipe_write_ack, afb_response_from_accelerator_3_pipe_write_ack, afb_response_from_accelerator_4_pipe_write_ack) --
    -- declared variables and implied variables 
    variable t1: unsigned_64_downto_0;
    variable t2: unsigned_64_downto_0;
    variable t3: unsigned_64_downto_0;
    variable t4: unsigned_64_downto_0;
    variable t5: unsigned_73_downto_0;
    variable t6: unsigned_73_downto_0;
    variable t7: unsigned_73_downto_0;
    variable t8: unsigned_73_downto_0;
    variable next_thread_state : ThreadState;
    --
  begin -- 
    -- default values 
    next_thread_state := current_thread_state;
    --  $now  acb_request_from_accelerator_1 :=  ( $unsigned<110> )  00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 
    acb_request_from_accelerator_1 <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
    --  $now  acb_request_from_accelerator_2 :=  ( $unsigned<110> )  00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 
    acb_request_from_accelerator_2 <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
    --  $now  acb_request_from_accelerator_3 :=  ( $unsigned<110> )  00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 
    acb_request_from_accelerator_3 <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
    --  $now  acb_request_from_accelerator_4 :=  ( $unsigned<110> )  00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 
    acb_request_from_accelerator_4 <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
    --  $now  afb_response_from_accelerator_1 :=  ( $unsigned<33> )  000000000000000000000000000000010 
    afb_response_from_accelerator_1 <= "000000000000000000000000000000010";
    --  $now  afb_response_from_accelerator_2 :=  ( $unsigned<33> )  000000000000000000000000000000010 
    afb_response_from_accelerator_2 <= "000000000000000000000000000000010";
    --  $now  afb_response_from_accelerator_3 :=  ( $unsigned<33> )  000000000000000000000000000000010 
    afb_response_from_accelerator_3 <= "000000000000000000000000000000010";
    --  $now  afb_response_from_accelerator_4 :=  ( $unsigned<33> )  000000000000000000000000000000010 
    afb_response_from_accelerator_4 <= "000000000000000000000000000000010";
    --  t1 :=  acb_response_to_accelerator_1
    t1 := acb_response_to_accelerator_1;
    --  t2 :=  acb_response_to_accelerator_2
    t2 := acb_response_to_accelerator_2;
    --  t3 :=  acb_response_to_accelerator_3
    t3 := acb_response_to_accelerator_3;
    --  t4 :=  acb_response_to_accelerator_4
    t4 := acb_response_to_accelerator_4;
    --  t5 :=  afb_request_to_accelerator_1
    t5 := afb_request_to_accelerator_1;
    --  t6 :=  afb_request_to_accelerator_2
    t6 := afb_request_to_accelerator_2;
    --  t7 :=  afb_request_to_accelerator_3
    t7 := afb_request_to_accelerator_3;
    --  t8 :=  afb_request_to_accelerator_4
    t8 := afb_request_to_accelerator_4;
    -- case statement 
    case current_thread_state is -- 
      when s_dummy_reset_state => -- 
        next_thread_state := s_dummy_reset_state;
        next_thread_state := s_dummy_reset_state;
        --
      --
    end case;
    if (clk'event and clk = '1') then -- 
      if (reset = '1') then -- 
        current_thread_state <= s_dummy_reset_state;
        -- 
      else -- 
        current_thread_state <= next_thread_state; 
        -- objects to be updated under tick.
        -- specified tick assignments. 
        -- 
      end if; 
      -- 
    end if; 
    --
  end process; 
  --
end rtlThreadArch;

-----------------------------------------SBC Core starts here-------------------------------------------------------------------------------------------------------------

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
library sbc_kc705_core_lib;
use sbc_kc705_core_lib.sbc_kc705_core_Type_Package.all;
--<<<<<
-->>>>>
library DualClockedQueue_lib;
library DualClockedQueue_lib;
library DualClockedQueue_lib;
library DualClockedQueue_lib;
library acb_afb_complex_lib;
library acb_dram_controller_bridge_lib;
library nic_subsystem_lib;
library ajit_processor_lib;
library spi_flash_controller_lib;
--<<<<<
entity sbc_kc705_core is -- 
  port( -- 
    CLOCK_TO_DRAMCTRL_BRIDGE : in std_logic;
    CLOCK_TO_NIC : in std_logic;
    CLOCK_TO_PROCESSOR : in std_logic;
    CONSOLE_to_SERIAL_RX_pipe_write_data : in std_logic_vector(7 downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_req  : in std_logic_vector(0  downto 0);
    CONSOLE_to_SERIAL_RX_pipe_write_ack  : out std_logic_vector(0  downto 0);
    DRAM_CONTROLLER_TO_ACB_BRIDGE : in std_logic_vector(521 downto 0);
    MAC_TO_NIC_pipe_write_data : in std_logic_vector(9 downto 0);
    MAC_TO_NIC_pipe_write_req  : in std_logic_vector(0  downto 0);
    MAC_TO_NIC_pipe_write_ack  : out std_logic_vector(0  downto 0);
    MAX_ACB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MAX_ACC_1_2_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MAX_ACC_1_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MAX_ACC_3_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MAX_FLASH_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MAX_NIC_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MIN_ACB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MIN_ACC_1_2_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MIN_ACC_1_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MIN_ACC_3_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MIN_FLASH_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    MIN_NIC_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
    RESET_TO_DRAMCTRL_BRIDGE : in std_logic;
    RESET_TO_NIC : in std_logic;
    RESET_TO_PROCESSOR : in std_logic;
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
end entity sbc_kc705_core;
architecture struct of sbc_kc705_core is -- 
  signal ACB_DRAM_REQUEST_FIFO_IN_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_DRAM_REQUEST_FIFO_IN_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_DRAM_REQUEST_FIFO_IN_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_DRAM_REQUEST_FIFO_IN_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_DRAM_REQUEST_FIFO_IN_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_DRAM_REQUEST_FIFO_IN_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_DRAM_REQUEST_FIFO_OUT_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_DRAM_REQUEST_FIFO_OUT_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_DRAM_REQUEST_FIFO_OUT_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_DRAM_REQUEST_FIFO_OUT_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_DRAM_REQUEST_FIFO_OUT_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_DRAM_REQUEST_FIFO_OUT_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_NIC_RESPONSE_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_NIC_RESPONSE_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_NIC_RESPONSE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_NIC_RESPONSE_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_NIC_RESPONSE_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_NIC_RESPONSE_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_1_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_1_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_1_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_2_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_2_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_2_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_3_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_3_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_3_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_data: std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_4_pipe_read_data: std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_4_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_ACCELERATOR_4_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_1_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_1_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_1_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_2_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_2_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_2_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_3_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_3_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_3_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_ack : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_4_pipe_write_data: std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_4_pipe_write_req : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_4_pipe_write_ack : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_data: std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_req : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_FLASH_REQUEST_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_FLASH_REQUEST_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_FLASH_REQUEST_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_FLASH_REQUEST_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_FLASH_REQUEST_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_FLASH_REQUEST_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_NIC_REQUEST_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_NIC_REQUEST_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_NIC_REQUEST_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_NIC_REQUEST_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_NIC_REQUEST_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_NIC_REQUEST_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_1_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_1_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_1_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_2_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_2_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_2_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_3_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_3_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_3_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_4_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_4_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_4_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_data: std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_read_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_read_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_read_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_read_ack : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_req : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_ack : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_read_data: std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_read_req : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_read_ack : std_logic_vector(0  downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_IN_pipe_write_data: std_logic_vector(64 downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_IN_pipe_write_req : std_logic_vector(0  downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_IN_pipe_write_ack : std_logic_vector(0  downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_data: std_logic_vector(64 downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_req : std_logic_vector(0  downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_ack : std_logic_vector(0  downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_OUT_pipe_write_data: std_logic_vector(64 downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_OUT_pipe_write_req : std_logic_vector(0  downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_OUT_pipe_write_ack : std_logic_vector(0  downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_OUT_pipe_read_data: std_logic_vector(64 downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_OUT_pipe_read_req : std_logic_vector(0  downto 0);
  signal DRAM_ACB_RESPONSE_FIFO_OUT_pipe_read_ack : std_logic_vector(0  downto 0);
  signal FLASH_AFB_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal FLASH_AFB_RESPONSE_pipe_write_req : std_logic_vector(0  downto 0);
  signal FLASH_AFB_RESPONSE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal FLASH_AFB_RESPONSE_pipe_read_data: std_logic_vector(32 downto 0);
  signal FLASH_AFB_RESPONSE_pipe_read_req : std_logic_vector(0  downto 0);
  signal FLASH_AFB_RESPONSE_pipe_read_ack : std_logic_vector(0  downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_write_data: std_logic_vector(29 downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_write_req : std_logic_vector(0  downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_read_data: std_logic_vector(29 downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_read_req : std_logic_vector(0  downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_read_ack : std_logic_vector(0  downto 0);
  signal NIC_ACB_REQUEST_pipe_write_data: std_logic_vector(109 downto 0);
  signal NIC_ACB_REQUEST_pipe_write_req : std_logic_vector(0  downto 0);
  signal NIC_ACB_REQUEST_pipe_write_ack : std_logic_vector(0  downto 0);
  signal NIC_ACB_REQUEST_pipe_read_data: std_logic_vector(109 downto 0);
  signal NIC_ACB_REQUEST_pipe_read_req : std_logic_vector(0  downto 0);
  signal NIC_ACB_REQUEST_pipe_read_ack : std_logic_vector(0  downto 0);
  signal NIC_AFB_RESPONSE_pipe_write_data: std_logic_vector(32 downto 0);
  signal NIC_AFB_RESPONSE_pipe_write_req : std_logic_vector(0  downto 0);
  signal NIC_AFB_RESPONSE_pipe_write_ack : std_logic_vector(0  downto 0);
  signal NIC_AFB_RESPONSE_pipe_read_data: std_logic_vector(32 downto 0);
  signal NIC_AFB_RESPONSE_pipe_read_req : std_logic_vector(0  downto 0);
  signal NIC_AFB_RESPONSE_pipe_read_ack : std_logic_vector(0  downto 0);
  signal NIC_INTERRUPT : std_logic_vector(0 downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_write_data: std_logic_vector(109 downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_write_req : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_write_ack : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_data: std_logic_vector(109 downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_req : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_ack : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_write_data: std_logic_vector(109 downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_write_req : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_write_ack : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_read_data: std_logic_vector(109 downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_read_req : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_read_ack : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_write_data: std_logic_vector(64 downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_write_req : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_write_ack : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_data: std_logic_vector(64 downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_req : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_ack : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_write_data: std_logic_vector(64 downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_write_req : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_write_ack : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_read_data: std_logic_vector(64 downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_read_req : std_logic_vector(0  downto 0);
  signal PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_read_ack : std_logic_vector(0  downto 0);
  
 ------ Component definition for the two request and response FIFOs copied from DualClockedQueuelib.vhdl---------------------

 component DualClockedQueue_ACB_req  is
  port ( 
    -- read 
    read_req_in : in std_logic;
    read_data_out : out std_logic_vector(109 DOWNTO 0);
    read_ack_out : out std_logic;
    -- write 
    write_req_out : out std_logic;
    write_data_in : in std_logic_vector(109 DOWNTO 0);
    write_ack_in : in std_logic;

    read_clk : in std_logic;
    write_clk : in std_logic;
    
    reset: in std_logic);	
end component DualClockedQueue_ACB_req;
-->>>>>
for DualClockedQueue_ACB_Dram_Bridge_req_inst :  DualClockedQueue_ACB_req -- 
use entity DualClockedQueuelib.DualClockedQueue_ACB_req; -- 
--<<<<<
-->>>>>
for DualClockedQueue_ACB_Proc_req_inst :  DualClockedQueue_ACB_req -- 
use entity DualClockedQueuelib.DualClockedQueue_ACB_req; -- 
--<<<<<


component DualClockedQueue_ACB_resp  is
  port ( 
    -- read 
    read_req_in : in std_logic;
    read_data_out : out std_logic_vector(64 DOWNTO 0);
    read_ack_out : out std_logic;
    -- write 
    write_req_out : out std_logic;
    write_data_in : in std_logic_vector(64 DOWNTO 0);
    write_ack_in : in std_logic;

    read_clk : in std_logic;
    write_clk : in std_logic;
    
    reset: in std_logic);	
end component DualClockedQueue_ACB_resp;
--

-->>>>>
for DualClockedQueue_ACB_Proc_resp_inst :  DualClockedQueue_ACB_resp -- 
use entity DualClockedQueuelib.DualClockedQueue_ACB_resp; -- 
--<<<<<
-->>>>>
for DualClockedQueue_Dram_Bridge_ACB_resp_inst :  DualClockedQueue_ACB_resp -- 
use entity DualClockedQueuelib.DualClockedQueue_ACB_resp; -- 
--<<<<<

----------------------------------------------------------------------------------------------------------------

  component acb_afb_complex is -- 
    port( -- 
      ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_data : in std_logic_vector(109 downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_ack  : out std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_data : in std_logic_vector(109 downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_ack  : out std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_data : in std_logic_vector(109 downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_ack  : out std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_data : in std_logic_vector(109 downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_ack  : out std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_NIC_pipe_write_data : in std_logic_vector(109 downto 0);
      ACB_REQUEST_FROM_NIC_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_NIC_pipe_write_ack  : out std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_PROCESSOR_pipe_write_data : in std_logic_vector(109 downto 0);
      ACB_REQUEST_FROM_PROCESSOR_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_PROCESSOR_pipe_write_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_FROM_DRAM_pipe_write_data : in std_logic_vector(64 downto 0);
      ACB_RESPONSE_FROM_DRAM_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_FROM_DRAM_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_FLASH_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_RESPONSE_FROM_FLASH_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_FLASH_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_NIC_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_RESPONSE_FROM_NIC_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_NIC_pipe_write_ack  : out std_logic_vector(0  downto 0);
      MAX_ACB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MAX_ACC_1_2_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MAX_ACC_1_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MAX_ACC_3_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MAX_FLASH_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MAX_NIC_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MIN_ACB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MIN_ACC_1_2_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MIN_ACC_1_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MIN_ACC_3_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MIN_FLASH_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      MIN_NIC_AFB_TAP_ADDR : in std_logic_vector(35 downto 0);
      ACB_REQUEST_TO_DRAM_pipe_read_data : out std_logic_vector(109 downto 0);
      ACB_REQUEST_TO_DRAM_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_TO_DRAM_pipe_read_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_data : out std_logic_vector(64 downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_data : out std_logic_vector(64 downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_data : out std_logic_vector(64 downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_data : out std_logic_vector(64 downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_NIC_pipe_read_data : out std_logic_vector(64 downto 0);
      ACB_RESPONSE_TO_NIC_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_NIC_pipe_read_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_PROCESSOR_pipe_read_data : out std_logic_vector(64 downto 0);
      ACB_RESPONSE_TO_PROCESSOR_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_PROCESSOR_pipe_read_ack  : out std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_data : out std_logic_vector(73 downto 0);
      AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_ack  : out std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_data : out std_logic_vector(73 downto 0);
      AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_ack  : out std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_data : out std_logic_vector(73 downto 0);
      AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_ack  : out std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_data : out std_logic_vector(73 downto 0);
      AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_ack  : out std_logic_vector(0  downto 0);
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
  end component;
  -->>>>>
  for acb_afb_complex_inst :  acb_afb_complex -- 
    use entity acb_afb_complex_lib.acb_afb_complex; -- 
  --<<<<<
  component acb_dram_controller_bridge is -- 
    port( -- 
      CORE_BUS_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      DRAM_CONTROLLER_TO_ACB_BRIDGE : in std_logic_vector(521 downto 0);
      ACB_BRIDGE_TO_DRAM_CONTROLLER : out std_logic_vector(613 downto 0);
      CORE_BUS_RESPONSE_pipe_read_data : out std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for acb_dram_controller_bridge_inst :  acb_dram_controller_bridge -- 
    use entity acb_dram_controller_bridge_lib.acb_dram_controller_bridge; -- 
  --<<<<<
  component nic_subsystem is -- 
    port( -- 
      ACB_TO_NIC_RESPONSE_pipe_write_data : in std_logic_vector(64 downto 0);
      ACB_TO_NIC_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_TO_NIC_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_TO_NIC_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
      AFB_TO_NIC_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_TO_NIC_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      MAC_TO_NIC_DATA_pipe_write_data : in std_logic_vector(9 downto 0);
      MAC_TO_NIC_DATA_pipe_write_req  : in std_logic_vector(0  downto 0);
      MAC_TO_NIC_DATA_pipe_write_ack  : out std_logic_vector(0  downto 0);
      NIC_INTERRUPT_TO_PROCESSOR : out std_logic_vector(0 downto 0);
      NIC_TO_ACB_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
      NIC_TO_ACB_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
      NIC_TO_ACB_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
      NIC_TO_AFB_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
      NIC_TO_AFB_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      NIC_TO_AFB_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      NIC_TO_MAC_DATA_pipe_read_data : out std_logic_vector(9 downto 0);
      NIC_TO_MAC_DATA_pipe_read_req  : in std_logic_vector(0  downto 0);
      NIC_TO_MAC_DATA_pipe_read_ack  : out std_logic_vector(0  downto 0);
      NIC_TO_MAC_RESETN : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for nic_subsystem_inst :  nic_subsystem -- 
    use entity nic_subsystem_lib.nic_subsystem; -- 
  --<<<<<
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
  end component;
  -->>>>>
  for processor_inst :  processor_1x1x32 -- 
    use entity ajit_processor_lib.processor_1x1x32; -- 
  --<<<<<
  component spi_flash_controller is -- 
    port( -- 
      AFB_REQUEST_TO_FLASH_pipe_write_data : in std_logic_vector(73 downto 0);
      AFB_REQUEST_TO_FLASH_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_FLASH_pipe_write_ack  : out std_logic_vector(0  downto 0);
      SPI_FLASH_MISO : in std_logic_vector(0 downto 0);
      WRITE_PROTECT : in std_logic_vector(0 downto 0);
      AFB_RESPONSE_FROM_FLASH_pipe_read_data : out std_logic_vector(32 downto 0);
      AFB_RESPONSE_FROM_FLASH_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_FLASH_pipe_read_ack  : out std_logic_vector(0  downto 0);
      SPI_FLASH_CLK : out std_logic_vector(0 downto 0);
      SPI_FLASH_CS_L : out std_logic_vector(7 downto 0);
      SPI_FLASH_MOSI : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for spi_flash_controller_inst :  spi_flash_controller -- 
    use entity spi_flash_controller_lib.spi_flash_controller; -- 
  --<<<<<
  component clockResetDummy is  -- 
    port (-- 
      c1: in std_logic_vector(0 downto 0);
      c2: in std_logic_vector(0 downto 0);
      c3: in std_logic_vector(0 downto 0);
      c4: in std_logic_vector(0 downto 0);
      c5: in std_logic_vector(0 downto 0);
      c6: in std_logic_vector(0 downto 0);
      clk, reset: in std_logic); --
    --
  end component;
  -->>>>>
  -- for clk_rst_str :  clockResetDummy -- 
  --   use entity sbc_kc705_core_lib.clockResetDummy; -- 
  --<<<<<
  component invalidateDummy is  -- 
    port (-- 
      ei: out std_logic_vector(0 downto 0);
      inval: out std_logic_vector(29 downto 0);
      inval_pipe_write_req: out std_logic_vector(0 downto 0);
      inval_pipe_write_ack: in std_logic_vector(0 downto 0);
      clk, reset: in std_logic); --
    --
  end component;
  -->>>>>
  for inval_str :  invalidateDummy -- 
    use entity sbc_kc705_core_lib.invalidateDummy; -- 
  --<<<<<

  component set_addr_tap is  -- 
    port (-- 
      acb_request_from_accelerator_1: out std_logic_vector(109 downto 0);
      acb_request_from_accelerator_1_pipe_write_req: out std_logic_vector(0 downto 0);
      acb_request_from_accelerator_1_pipe_write_ack: in std_logic_vector(0 downto 0);
      acb_request_from_accelerator_2: out std_logic_vector(109 downto 0);
      acb_request_from_accelerator_2_pipe_write_req: out std_logic_vector(0 downto 0);
      acb_request_from_accelerator_2_pipe_write_ack: in std_logic_vector(0 downto 0);
      acb_request_from_accelerator_3: out std_logic_vector(109 downto 0);
      acb_request_from_accelerator_3_pipe_write_req: out std_logic_vector(0 downto 0);
      acb_request_from_accelerator_3_pipe_write_ack: in std_logic_vector(0 downto 0);
      acb_request_from_accelerator_4: out std_logic_vector(109 downto 0);
      acb_request_from_accelerator_4_pipe_write_req: out std_logic_vector(0 downto 0);
      acb_request_from_accelerator_4_pipe_write_ack: in std_logic_vector(0 downto 0);
      acb_response_to_accelerator_1: in std_logic_vector(64 downto 0);
      acb_response_to_accelerator_1_pipe_read_req: out std_logic_vector(0 downto 0);
      acb_response_to_accelerator_1_pipe_read_ack: in std_logic_vector(0 downto 0);
      acb_response_to_accelerator_2: in std_logic_vector(64 downto 0);
      acb_response_to_accelerator_2_pipe_read_req: out std_logic_vector(0 downto 0);
      acb_response_to_accelerator_2_pipe_read_ack: in std_logic_vector(0 downto 0);
      acb_response_to_accelerator_3: in std_logic_vector(64 downto 0);
      acb_response_to_accelerator_3_pipe_read_req: out std_logic_vector(0 downto 0);
      acb_response_to_accelerator_3_pipe_read_ack: in std_logic_vector(0 downto 0);
      acb_response_to_accelerator_4: in std_logic_vector(64 downto 0);
      acb_response_to_accelerator_4_pipe_read_req: out std_logic_vector(0 downto 0);
      acb_response_to_accelerator_4_pipe_read_ack: in std_logic_vector(0 downto 0);
      afb_request_to_accelerator_1: in std_logic_vector(73 downto 0);
      afb_request_to_accelerator_1_pipe_read_req: out std_logic_vector(0 downto 0);
      afb_request_to_accelerator_1_pipe_read_ack: in std_logic_vector(0 downto 0);
      afb_request_to_accelerator_2: in std_logic_vector(73 downto 0);
      afb_request_to_accelerator_2_pipe_read_req: out std_logic_vector(0 downto 0);
      afb_request_to_accelerator_2_pipe_read_ack: in std_logic_vector(0 downto 0);
      afb_request_to_accelerator_3: in std_logic_vector(73 downto 0);
      afb_request_to_accelerator_3_pipe_read_req: out std_logic_vector(0 downto 0);
      afb_request_to_accelerator_3_pipe_read_ack: in std_logic_vector(0 downto 0);
      afb_request_to_accelerator_4: in std_logic_vector(73 downto 0);
      afb_request_to_accelerator_4_pipe_read_req: out std_logic_vector(0 downto 0);
      afb_request_to_accelerator_4_pipe_read_ack: in std_logic_vector(0 downto 0);
      afb_response_from_accelerator_1: out std_logic_vector(32 downto 0);
      afb_response_from_accelerator_1_pipe_write_req: out std_logic_vector(0 downto 0);
      afb_response_from_accelerator_1_pipe_write_ack: in std_logic_vector(0 downto 0);
      afb_response_from_accelerator_2: out std_logic_vector(32 downto 0);
      afb_response_from_accelerator_2_pipe_write_req: out std_logic_vector(0 downto 0);
      afb_response_from_accelerator_2_pipe_write_ack: in std_logic_vector(0 downto 0);
      afb_response_from_accelerator_3: out std_logic_vector(32 downto 0);
      afb_response_from_accelerator_3_pipe_write_req: out std_logic_vector(0 downto 0);
      afb_response_from_accelerator_3_pipe_write_ack: in std_logic_vector(0 downto 0);
      afb_response_from_accelerator_4: out std_logic_vector(32 downto 0);
      afb_response_from_accelerator_4_pipe_write_req: out std_logic_vector(0 downto 0);
      afb_response_from_accelerator_4_pipe_write_ack: in std_logic_vector(0 downto 0);
      clk, reset: in std_logic); --
    --
  end component;
  -->>>>>
  -- for i0 :  set_addr_tap -- 
  --   use entity sbc_kc705_core_lib.set_addr_tap; -- 
  -- --<<<<<

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

  -- Hand edit parts-------------------------------------------------

 signal reset: std_logic;

  -- 
begin -- 

  -------------------------------------------------------------------
 -- Hand edited code
 -------------------------------------------------------------------

 DualClockedQueue_ACB_Dram_Bridge_req_inst: DualClockedQueue_ACB_req
 port map ( --
   
   read_data_out => ACB_DRAM_REQUEST_FIFO_OUT_pipe_write_data,

   read_req_in => ACB_DRAM_REQUEST_FIFO_OUT_pipe_write_ack(0),
   read_ack_out => ACB_DRAM_REQUEST_FIFO_OUT_pipe_write_req(0),
   
   write_data_in => ACB_DRAM_REQUEST_FIFO_IN_pipe_read_data,
  
   ----------------------------------------------------------------------- 
   -- ERROR: output - output connection.
   -- write_req_out => ACB_DRAM_REQUEST_FIFO_IN_pipe_read_ack(0),
   
   -- Corrected
   write_req_out => ACB_DRAM_REQUEST_FIFO_IN_pipe_read_req(0),

   -- ERROR: input - input connection...
   -- write_ack_in => ACB_DRAM_REQUEST_FIFO_IN_pipe_read_req(0),

   -- Corrected.
   write_ack_in => ACB_DRAM_REQUEST_FIFO_IN_pipe_read_ack(0),
   ----------------------------------------------------------------------- 

   read_clk => CLOCK_TO_DRAMCTRL_BRIDGE,
   write_clk => CLOCK_TO_NIC,

   reset => RESET_TO_NIC 
   ); -- 
 DualClockedQueue_ACB_Proc_req_inst: DualClockedQueue_ACB_req
 port map ( --
   
   read_data_out => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_write_data,
   read_req_in => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_write_ack(0),
   read_ack_out => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_write_req(0),

   write_data_in => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_data,

   ------------------------------------------------------------------
   -- ERROR: out-out connection
   -- write_req_out => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_ack(0),
   
   -- Corrected
   write_req_out => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_req(0),

   -- ERROR: in-in correction
   -- write_ack_in => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_req(0),

   -- Corrected
   write_ack_in => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_ack(0),
   ------------------------------------------------------------------

   read_clk => CLOCK_TO_NIC,
   write_clk => CLOCK_TO_PROCESSOR,
   reset => RESET_TO_PROCESSOR 
   ); -- 


 DualClockedQueue_ACB_Proc_resp_inst: DualClockedQueue_ACB_resp
 port map ( --

   read_data_out => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_write_data,
   read_req_in => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_write_ack(0),
   read_ack_out => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_write_req(0),

   write_data_in => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_data,
   ----------------------------------------------------------------
   -- ERROR in-in and out-out connections!
   -- write_req_out => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_ack(0),
   -- write_ack_in  => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_req(0),

   write_req_out => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_req(0),
   write_ack_in  => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_ack(0),
   ----------------------------------------------------------------

   read_clk => CLOCK_TO_PROCESSOR,
   write_clk => CLOCK_TO_NIC,

   reset => RESET_TO_NIC 
   ); -- 
 DualClockedQueue_Dram_Bridge_ACB_resp_inst: DualClockedQueue_ACB_resp
 port map ( --
  
   read_data_out => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_write_data,
   read_req_in => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_write_ack(0),
   read_ack_out => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_write_req(0),
 
   write_data_in => DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_data,
   ----------------------------------------------------------------
   -- ERROR in-in and out-out connections!
   -- write_req_out => DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_ack(0),
   -- write_ack_in => DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_req(0),
 
   -- Corrected
   write_req_out => DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_req(0),
   write_ack_in => DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_ack(0),
   ----------------------------------------------------------------

   read_clk => CLOCK_TO_NIC,
   write_clk => CLOCK_TO_DRAMCTRL_BRIDGE,
   reset => RESET_TO_DRAMCTRL_BRIDGE 
   ); -- 
-------------------------------------------------------------------
-- End: Hand edited code.
-------------------------------------------------------------------

  acb_afb_complex_inst: acb_afb_complex
  port map ( --
    ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_data => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_data,
    ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_req => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_req,
    ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_ack => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_ack,
    ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_data => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_data,
    ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_req => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_req,
    ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_ack => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_ack,
    ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_data => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_data,
    ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_req => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_req,
    ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_ack => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_ack,
    ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_data => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_data,
    ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_req => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_req,
    ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_ack => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_ack,
    ACB_REQUEST_FROM_NIC_pipe_write_data => NIC_ACB_REQUEST_pipe_read_data,
    ACB_REQUEST_FROM_NIC_pipe_write_req => NIC_ACB_REQUEST_pipe_read_ack,
    ACB_REQUEST_FROM_NIC_pipe_write_ack => NIC_ACB_REQUEST_pipe_read_req,
    ACB_REQUEST_FROM_PROCESSOR_pipe_write_data => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_read_data,
    ACB_REQUEST_FROM_PROCESSOR_pipe_write_req => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_read_ack,
    ACB_REQUEST_FROM_PROCESSOR_pipe_write_ack => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_read_req,
    ACB_REQUEST_TO_DRAM_pipe_read_data => ACB_DRAM_REQUEST_FIFO_IN_pipe_write_data,
    ACB_REQUEST_TO_DRAM_pipe_read_req => ACB_DRAM_REQUEST_FIFO_IN_pipe_write_ack,
    ACB_REQUEST_TO_DRAM_pipe_read_ack => ACB_DRAM_REQUEST_FIFO_IN_pipe_write_req,
    ACB_RESPONSE_FROM_DRAM_pipe_write_data => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_read_data,
    ACB_RESPONSE_FROM_DRAM_pipe_write_req => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_read_ack,
    ACB_RESPONSE_FROM_DRAM_pipe_write_ack => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_read_req,
    ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_data => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_data,
    ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_req => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_req,
    ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_ack => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_ack,
    ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_data => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_data,
    ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_req => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_req,
    ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_ack => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_ack,
    ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_data => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_data,
    ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_req => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_req,
    ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_ack => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_ack,
    ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_data => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_data,
    ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_req => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_req,
    ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_ack => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_ack,
    ACB_RESPONSE_TO_NIC_pipe_read_data => ACB_NIC_RESPONSE_pipe_write_data,
    ACB_RESPONSE_TO_NIC_pipe_read_req => ACB_NIC_RESPONSE_pipe_write_ack,
    ACB_RESPONSE_TO_NIC_pipe_read_ack => ACB_NIC_RESPONSE_pipe_write_req,
    ACB_RESPONSE_TO_PROCESSOR_pipe_read_data => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_write_data,
    ACB_RESPONSE_TO_PROCESSOR_pipe_read_req => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_write_ack,
    ACB_RESPONSE_TO_PROCESSOR_pipe_read_ack => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_write_req,
    AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_data => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_data,
    AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_req => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_req,
    AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_ack => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_ack,
    AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_data => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_data,
    AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_req => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_req,
    AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_ack => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_ack,
    AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_data => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_data,
    AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_req => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_req,
    AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_ack => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_ack,
    AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_data => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_data,
    AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_req => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_req,
    AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_ack => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_ack,
    AFB_REQUEST_TO_FLASH_pipe_read_data => AFB_FLASH_REQUEST_pipe_write_data,
    AFB_REQUEST_TO_FLASH_pipe_read_req => AFB_FLASH_REQUEST_pipe_write_ack,
    AFB_REQUEST_TO_FLASH_pipe_read_ack => AFB_FLASH_REQUEST_pipe_write_req,
    AFB_REQUEST_TO_NIC_pipe_read_data => AFB_NIC_REQUEST_pipe_write_data,
    AFB_REQUEST_TO_NIC_pipe_read_req => AFB_NIC_REQUEST_pipe_write_ack,
    AFB_REQUEST_TO_NIC_pipe_read_ack => AFB_NIC_REQUEST_pipe_write_req,
    AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_data => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_data,
    AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_req => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_req,
    AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_ack => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_ack,
    AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_data => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_data,
    AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_req => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_req,
    AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_ack => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_ack,
    AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_data => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_data,
    AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_req => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_req,
    AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_ack => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_ack,
    AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_data => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_data,
    AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_req => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_req,
    AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_ack => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_ack,
    AFB_RESPONSE_FROM_FLASH_pipe_write_data => FLASH_AFB_RESPONSE_pipe_read_data,
    AFB_RESPONSE_FROM_FLASH_pipe_write_req => FLASH_AFB_RESPONSE_pipe_read_ack,
    AFB_RESPONSE_FROM_FLASH_pipe_write_ack => FLASH_AFB_RESPONSE_pipe_read_req,
    AFB_RESPONSE_FROM_NIC_pipe_write_data => NIC_AFB_RESPONSE_pipe_read_data,
    AFB_RESPONSE_FROM_NIC_pipe_write_req => NIC_AFB_RESPONSE_pipe_read_ack,
    AFB_RESPONSE_FROM_NIC_pipe_write_ack => NIC_AFB_RESPONSE_pipe_read_req,
    MAX_ACB_TAP_ADDR => MAX_ACB_TAP_ADDR,
    MAX_ACC_1_2_AFB_TAP_ADDR => MAX_ACC_1_2_AFB_TAP_ADDR,
    MAX_ACC_1_AFB_TAP_ADDR => MAX_ACC_1_AFB_TAP_ADDR,
    MAX_ACC_3_AFB_TAP_ADDR => MAX_ACC_3_AFB_TAP_ADDR,
    MAX_FLASH_AFB_TAP_ADDR => MAX_FLASH_AFB_TAP_ADDR,
    MAX_NIC_AFB_TAP_ADDR => MAX_NIC_AFB_TAP_ADDR,
    MIN_ACB_TAP_ADDR => MIN_ACB_TAP_ADDR,
    MIN_ACC_1_2_AFB_TAP_ADDR => MIN_ACC_1_2_AFB_TAP_ADDR,
    MIN_ACC_1_AFB_TAP_ADDR => MIN_ACC_1_AFB_TAP_ADDR,
    MIN_ACC_3_AFB_TAP_ADDR => MIN_ACC_3_AFB_TAP_ADDR,
    MIN_FLASH_AFB_TAP_ADDR => MIN_FLASH_AFB_TAP_ADDR,
    MIN_NIC_AFB_TAP_ADDR => MIN_NIC_AFB_TAP_ADDR,
    clk => CLOCK_TO_NIC, reset => RESET_TO_NIC 
    ); -- 

  engine1 : ai_ml_engine 			-- TODO : done
  port map( 
    clk => CLOCK_TO_NIC, 
    reset => RESET_TO_NIC,
    -- ACCELERATOR_INTERRUPT_8 -- out std_logic_vector(7 downto 0);
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_data => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_data, -- out 
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_req => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_ack, -- in    
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_ack => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_req, -- out
    AFB_ACCELERATOR_REQUEST_pipe_write_data => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_data, -- in std_logic_vector(73 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_req => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_ack, -- in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_ack => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_req, -- out std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_data => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_data, -- out std_logic_vector(32 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_req => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_ack, -- in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_ack => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_req, -- out std_logic_vector(0 downto 0);
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_data => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_data, -- in
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_req => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_ack, -- in
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_ack => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_req -- out
  );

  engine2 : ai_ml_engine 			-- TODO : done
  port map( 
    clk => CLOCK_TO_NIC, 
    reset => RESET_TO_NIC,
    -- ACCELERATOR_INTERRUPT_8 -- out std_logic_vector(7 downto 0);
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_data => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_data, -- out 
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_req => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_ack, -- in    
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_ack => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_req, -- out
    AFB_ACCELERATOR_REQUEST_pipe_write_data => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_data, -- in std_logic_vector(73 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_req => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_ack, -- in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_ack => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_req, -- out std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_data => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_data, -- out std_logic_vector(32 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_req => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_ack, -- in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_ack => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_req, -- out std_logic_vector(0 downto 0);
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_data => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_data, -- in
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_req => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_ack, -- in
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_ack => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_req -- out
  );

  engine3 : ai_ml_engine 			-- TODO : done
  port map( 
    clk => CLOCK_TO_NIC, 
    reset => RESET_TO_NIC,
    -- ACCELERATOR_INTERRUPT_8 -- out std_logic_vector(7 downto 0);
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_data => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_data, -- out 
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_req => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_ack, -- in    
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_ack => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_req, -- out
    AFB_ACCELERATOR_REQUEST_pipe_write_data => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_data, -- in std_logic_vector(73 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_req => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_ack, -- in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_ack => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_req, -- out std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_data => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_data, -- out std_logic_vector(32 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_req => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_ack, -- in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_ack => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_req, -- out std_logic_vector(0 downto 0);
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_data => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_data, -- in
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_req => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_ack, -- in
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_ack => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_req -- out
  );

  engine4 : ai_ml_engine 			-- TODO : done
  port map( 
    clk => CLOCK_TO_NIC, 
    reset => RESET_TO_NIC,
    -- ACCELERATOR_INTERRUPT_8 -- out std_logic_vector(7 downto 0);
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_data => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_data, -- out 
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_req => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_ack, -- in    
    ACCELERATOR_MEMORY_REQUEST_PIPE_pipe_read_ack => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_req, -- out
    AFB_ACCELERATOR_REQUEST_pipe_write_data => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_data, -- in std_logic_vector(73 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_req => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_ack, -- in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_REQUEST_pipe_write_ack => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_req, -- out std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_data => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_data, -- out std_logic_vector(32 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_req => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_ack, -- in std_logic_vector(0 downto 0);
    AFB_ACCELERATOR_RESPONSE_pipe_read_ack => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_req, -- out std_logic_vector(0 downto 0);
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_data => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_data, -- in
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_req => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_ack, -- in
    MEMORY_ACCELERATOR_RESPONSE_PIPE_pipe_write_ack => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_req -- out
  );


  acb_dram_controller_bridge_inst: acb_dram_controller_bridge
  port map ( --
    ACB_BRIDGE_TO_DRAM_CONTROLLER => ACB_BRIDGE_TO_DRAM_CONTROLLER,
    CORE_BUS_REQUEST_pipe_write_data => ACB_DRAM_REQUEST_FIFO_OUT_pipe_read_data,
    CORE_BUS_REQUEST_pipe_write_req => ACB_DRAM_REQUEST_FIFO_OUT_pipe_read_ack,
    CORE_BUS_REQUEST_pipe_write_ack => ACB_DRAM_REQUEST_FIFO_OUT_pipe_read_req,
    CORE_BUS_RESPONSE_pipe_read_data => DRAM_ACB_RESPONSE_FIFO_IN_pipe_write_data,
    CORE_BUS_RESPONSE_pipe_read_req => DRAM_ACB_RESPONSE_FIFO_IN_pipe_write_ack,
    CORE_BUS_RESPONSE_pipe_read_ack => DRAM_ACB_RESPONSE_FIFO_IN_pipe_write_req,
    DRAM_CONTROLLER_TO_ACB_BRIDGE => DRAM_CONTROLLER_TO_ACB_BRIDGE,
    clk => CLOCK_TO_DRAMCTRL_BRIDGE, reset => RESET_TO_DRAMCTRL_BRIDGE 
    ); -- 
  nic_subsystem_inst: nic_subsystem
  port map ( --
    ACB_TO_NIC_RESPONSE_pipe_write_data => ACB_NIC_RESPONSE_pipe_read_data,
    ACB_TO_NIC_RESPONSE_pipe_write_req => ACB_NIC_RESPONSE_pipe_read_ack,
    ACB_TO_NIC_RESPONSE_pipe_write_ack => ACB_NIC_RESPONSE_pipe_read_req,
    AFB_TO_NIC_REQUEST_pipe_write_data => AFB_NIC_REQUEST_pipe_read_data,
    AFB_TO_NIC_REQUEST_pipe_write_req => AFB_NIC_REQUEST_pipe_read_ack,
    AFB_TO_NIC_REQUEST_pipe_write_ack => AFB_NIC_REQUEST_pipe_read_req,
    MAC_TO_NIC_DATA_pipe_write_data => MAC_TO_NIC_pipe_write_data,
    MAC_TO_NIC_DATA_pipe_write_req => MAC_TO_NIC_pipe_write_req,
    MAC_TO_NIC_DATA_pipe_write_ack => MAC_TO_NIC_pipe_write_ack,
    NIC_INTERRUPT_TO_PROCESSOR => NIC_INTERRUPT,
    NIC_TO_ACB_REQUEST_pipe_read_data => NIC_ACB_REQUEST_pipe_write_data,
    NIC_TO_ACB_REQUEST_pipe_read_req => NIC_ACB_REQUEST_pipe_write_ack,
    NIC_TO_ACB_REQUEST_pipe_read_ack => NIC_ACB_REQUEST_pipe_write_req,
    NIC_TO_AFB_RESPONSE_pipe_read_data => NIC_AFB_RESPONSE_pipe_write_data,
    NIC_TO_AFB_RESPONSE_pipe_read_req => NIC_AFB_RESPONSE_pipe_write_ack,
    NIC_TO_AFB_RESPONSE_pipe_read_ack => NIC_AFB_RESPONSE_pipe_write_req,
    NIC_TO_MAC_DATA_pipe_read_data => NIC_TO_MAC_pipe_read_data,
    NIC_TO_MAC_DATA_pipe_read_req => NIC_TO_MAC_pipe_read_req,
    NIC_TO_MAC_DATA_pipe_read_ack => NIC_TO_MAC_pipe_read_ack,
    NIC_TO_MAC_RESETN => NIC_MAC_RESETN,
    clk => CLOCK_TO_NIC, reset => RESET_TO_NIC 
    ); -- 
  processor_inst: processor_1x1x32
  port map ( --
    CONSOLE_to_SERIAL_RX_pipe_write_data => CONSOLE_to_SERIAL_RX_pipe_write_data,
    CONSOLE_to_SERIAL_RX_pipe_write_req => CONSOLE_to_SERIAL_RX_pipe_write_req,
    CONSOLE_to_SERIAL_RX_pipe_write_ack => CONSOLE_to_SERIAL_RX_pipe_write_ack,
    EXTERNAL_INTERRUPT => NIC_INTERRUPT,
    MAIN_MEM_INVALIDATE_pipe_write_data => MAIN_MEM_INVALIDATE_pipe_read_data,
    MAIN_MEM_INVALIDATE_pipe_write_req => MAIN_MEM_INVALIDATE_pipe_read_ack,
    MAIN_MEM_INVALIDATE_pipe_write_ack => MAIN_MEM_INVALIDATE_pipe_read_req,
    MAIN_MEM_REQUEST_pipe_read_data => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_write_data,
    MAIN_MEM_REQUEST_pipe_read_req => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_write_ack,
    MAIN_MEM_REQUEST_pipe_read_ack => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_write_req,
    MAIN_MEM_RESPONSE_pipe_write_data => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_read_data,
    MAIN_MEM_RESPONSE_pipe_write_req => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_read_ack,
    MAIN_MEM_RESPONSE_pipe_write_ack => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_read_req,
    PROCESSOR_MODE => PROCESSOR_MODE,
    SERIAL_TX_to_CONSOLE_pipe_read_data => SERIAL_TX_to_CONSOLE_pipe_read_data,
    SERIAL_TX_to_CONSOLE_pipe_read_req => SERIAL_TX_to_CONSOLE_pipe_read_req,
    SERIAL_TX_to_CONSOLE_pipe_read_ack => SERIAL_TX_to_CONSOLE_pipe_read_ack,
    SOC_DEBUG_to_MONITOR_pipe_read_data => SOC_DEBUG_to_MONITOR_pipe_read_data,
    SOC_DEBUG_to_MONITOR_pipe_read_req => SOC_DEBUG_to_MONITOR_pipe_read_req,
    SOC_DEBUG_to_MONITOR_pipe_read_ack => SOC_DEBUG_to_MONITOR_pipe_read_ack,
    SOC_MONITOR_to_DEBUG_pipe_write_data => SOC_MONITOR_to_DEBUG_pipe_write_data,
    SOC_MONITOR_to_DEBUG_pipe_write_req => SOC_MONITOR_to_DEBUG_pipe_write_req,
    SOC_MONITOR_to_DEBUG_pipe_write_ack => SOC_MONITOR_to_DEBUG_pipe_write_ack,
    THREAD_RESET => THREAD_RESET,
    clk => CLOCK_TO_PROCESSOR, reset => RESET_TO_PROCESSOR 
    ); -- 
  spi_flash_controller_inst: spi_flash_controller
  port map ( --
    AFB_REQUEST_TO_FLASH_pipe_write_data => AFB_FLASH_REQUEST_pipe_read_data,
    AFB_REQUEST_TO_FLASH_pipe_write_req => AFB_FLASH_REQUEST_pipe_read_ack,
    AFB_REQUEST_TO_FLASH_pipe_write_ack => AFB_FLASH_REQUEST_pipe_read_req,
    AFB_RESPONSE_FROM_FLASH_pipe_read_data => FLASH_AFB_RESPONSE_pipe_write_data,
    AFB_RESPONSE_FROM_FLASH_pipe_read_req => FLASH_AFB_RESPONSE_pipe_write_ack,
    AFB_RESPONSE_FROM_FLASH_pipe_read_ack => FLASH_AFB_RESPONSE_pipe_write_req,
    SPI_FLASH_CLK => SPI_FLASH_CLK,
    SPI_FLASH_CS_L => SPI_FLASH_CS_L,
    SPI_FLASH_MISO => SPI_FLASH_MISO,
    SPI_FLASH_MOSI => SPI_FLASH_MOSI,
    WRITE_PROTECT => WRITE_PROTECT,
    clk => CLOCK_TO_NIC, reset => RESET_TO_NIC 
    ); -- 
  -- clk_rst_str: clockResetDummy -- 
  --   port map ( -- 
  --     c1 => CLOCK_TO_PROCESSOR,
  --     c2 => CLOCK_TO_NIC,
  --     c3 => CLOCK_TO_DRAMCTRL_BRIDGE,
  --     c4 => RESET_TO_PROCESSOR,
  --     c5 => RESET_TO_NIC,
  --     c6 => RESET_TO_DRAMCTRL_BRIDGE,
  --     clk => clk, reset => reset--
  --   ); -- 
  inval_str: invalidateDummy -- 
    port map ( -- 
      ei => NIC_INTERRUPT,
      inval => MAIN_MEM_INVALIDATE_pipe_write_data,
      inval_pipe_write_req => MAIN_MEM_INVALIDATE_pipe_write_req,
      inval_pipe_write_ack => MAIN_MEM_INVALIDATE_pipe_write_ack,
      clk => CLOCK_TO_PROCESSOR, reset => RESET_TO_PROCESSOR--
    ); -- 
  -- i0: set_addr_tap -- 
  --   port map ( -- 
  --     acb_request_from_accelerator_1 => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_data,
  --     acb_request_from_accelerator_1_pipe_write_req => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_req,
  --     acb_request_from_accelerator_1_pipe_write_ack => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_ack,
  --     acb_request_from_accelerator_2 => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_data,
  --     acb_request_from_accelerator_2_pipe_write_req => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_req,
  --     acb_request_from_accelerator_2_pipe_write_ack => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_ack,
  --     acb_request_from_accelerator_3 => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_data,
  --     acb_request_from_accelerator_3_pipe_write_req => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_req,
  --     acb_request_from_accelerator_3_pipe_write_ack => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_ack,
  --     acb_request_from_accelerator_4 => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_data,
  --     acb_request_from_accelerator_4_pipe_write_req => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_req,
  --     acb_request_from_accelerator_4_pipe_write_ack => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_ack,
  --     acb_response_to_accelerator_1 => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_data,
  --     acb_response_to_accelerator_1_pipe_read_req => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_req,
  --     acb_response_to_accelerator_1_pipe_read_ack => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_ack,
  --     acb_response_to_accelerator_2 => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_data,
  --     acb_response_to_accelerator_2_pipe_read_req => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_req,
  --     acb_response_to_accelerator_2_pipe_read_ack => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_ack,
  --     acb_response_to_accelerator_3 => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_data,
  --     acb_response_to_accelerator_3_pipe_read_req => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_req,
  --     acb_response_to_accelerator_3_pipe_read_ack => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_ack,
  --     acb_response_to_accelerator_4 => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_data,
  --     acb_response_to_accelerator_4_pipe_read_req => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_req,
  --     acb_response_to_accelerator_4_pipe_read_ack => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_ack,
  --     afb_request_to_accelerator_1 => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_data,
  --     afb_request_to_accelerator_1_pipe_read_req => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_req,
  --     afb_request_to_accelerator_1_pipe_read_ack => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_ack,
  --     afb_request_to_accelerator_2 => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_data,
  --     afb_request_to_accelerator_2_pipe_read_req => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_req,
  --     afb_request_to_accelerator_2_pipe_read_ack => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_ack,
  --     afb_request_to_accelerator_3 => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_data,
  --     afb_request_to_accelerator_3_pipe_read_req => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_req,
  --     afb_request_to_accelerator_3_pipe_read_ack => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_ack,
  --     afb_request_to_accelerator_4 => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_data,
  --     afb_request_to_accelerator_4_pipe_read_req => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_req,
  --     afb_request_to_accelerator_4_pipe_read_ack => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_ack,
  --     afb_response_from_accelerator_1 => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_data,
  --     afb_response_from_accelerator_1_pipe_write_req => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_req,
  --     afb_response_from_accelerator_1_pipe_write_ack => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_ack,
  --     afb_response_from_accelerator_2 => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_data,
  --     afb_response_from_accelerator_2_pipe_write_req => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_req,
  --     afb_response_from_accelerator_2_pipe_write_ack => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_ack,
  --     afb_response_from_accelerator_3 => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_data,
  --     afb_response_from_accelerator_3_pipe_write_req => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_req,
  --     afb_response_from_accelerator_3_pipe_write_ack => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_ack,
  --     afb_response_from_accelerator_4 => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_data,
  --     afb_response_from_accelerator_4_pipe_write_req => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_req,
  --     afb_response_from_accelerator_4_pipe_write_ack => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_ack,
  --     clk => CLOCK_TO_NIC, reset => RESET_TO_NIC--
  --   ); -- 
  ACB_DRAM_REQUEST_FIFO_IN_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_DRAM_REQUEST_FIFO_IN",
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
      read_req => ACB_DRAM_REQUEST_FIFO_IN_pipe_read_req,
      read_ack => ACB_DRAM_REQUEST_FIFO_IN_pipe_read_ack,
      read_data => ACB_DRAM_REQUEST_FIFO_IN_pipe_read_data,
      write_req => ACB_DRAM_REQUEST_FIFO_IN_pipe_write_req,
      write_ack => ACB_DRAM_REQUEST_FIFO_IN_pipe_write_ack,
      write_data => ACB_DRAM_REQUEST_FIFO_IN_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
    ); -- 
  ACB_DRAM_REQUEST_FIFO_OUT_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_DRAM_REQUEST_FIFO_OUT",
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
      read_req => ACB_DRAM_REQUEST_FIFO_OUT_pipe_read_req,
      read_ack => ACB_DRAM_REQUEST_FIFO_OUT_pipe_read_ack,
      read_data => ACB_DRAM_REQUEST_FIFO_OUT_pipe_read_data,
      write_req => ACB_DRAM_REQUEST_FIFO_OUT_pipe_write_req,
      write_ack => ACB_DRAM_REQUEST_FIFO_OUT_pipe_write_ack,
      write_data => ACB_DRAM_REQUEST_FIFO_OUT_pipe_write_data,
      clk => CLOCK_TO_DRAMCTRL_BRIDGE,reset => RESET_TO_DRAMCTRL_BRIDGE -- 
    ); -- 
  ACB_NIC_RESPONSE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe ACB_NIC_RESPONSE",
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
      read_req => ACB_NIC_RESPONSE_pipe_read_req,
      read_ack => ACB_NIC_RESPONSE_pipe_read_ack,
      read_data => ACB_NIC_RESPONSE_pipe_read_data,
      write_req => ACB_NIC_RESPONSE_pipe_write_req,
      write_ack => ACB_NIC_RESPONSE_pipe_write_ack,
      write_data => ACB_NIC_RESPONSE_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
    ); -- 
  -- ACB_REQUEST_FROM_ACCELERATOR_1_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe ACB_REQUEST_FROM_ACCELERATOR_1",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 110,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_read_req,
  --     read_ack => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_read_ack,
  --     read_data => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_read_data,
  --     write_req => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_req,
  --     write_ack => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_ack,
  --     write_data => ACB_REQUEST_FROM_ACCELERATOR_1_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- ACB_REQUEST_FROM_ACCELERATOR_2_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe ACB_REQUEST_FROM_ACCELERATOR_2",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 110,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_read_req,
  --     read_ack => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_read_ack,
  --     read_data => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_read_data,
  --     write_req => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_req,
  --     write_ack => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_ack,
  --     write_data => ACB_REQUEST_FROM_ACCELERATOR_2_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- ACB_REQUEST_FROM_ACCELERATOR_3_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe ACB_REQUEST_FROM_ACCELERATOR_3",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 110,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_read_req,
  --     read_ack => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_read_ack,
  --     read_data => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_read_data,
  --     write_req => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_req,
  --     write_ack => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_ack,
  --     write_data => ACB_REQUEST_FROM_ACCELERATOR_3_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- ACB_REQUEST_FROM_ACCELERATOR_4_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe ACB_REQUEST_FROM_ACCELERATOR_4",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 110,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_read_req,
  --     read_ack => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_read_ack,
  --     read_data => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_read_data,
  --     write_req => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_req,
  --     write_ack => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_ack,
  --     write_data => ACB_REQUEST_FROM_ACCELERATOR_4_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- ACB_RESPONSE_TO_ACCELERATOR_1_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe ACB_RESPONSE_TO_ACCELERATOR_1",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 65,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_req,
  --     read_ack => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_ack,
  --     read_data => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_read_data,
  --     write_req => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_write_req,
  --     write_ack => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_write_ack,
  --     write_data => ACB_RESPONSE_TO_ACCELERATOR_1_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- ACB_RESPONSE_TO_ACCELERATOR_2_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe ACB_RESPONSE_TO_ACCELERATOR_2",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 65,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_req,
  --     read_ack => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_ack,
  --     read_data => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_read_data,
  --     write_req => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_write_req,
  --     write_ack => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_write_ack,
  --     write_data => ACB_RESPONSE_TO_ACCELERATOR_2_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- ACB_RESPONSE_TO_ACCELERATOR_3_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe ACB_RESPONSE_TO_ACCELERATOR_3",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 65,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_req,
  --     read_ack => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_ack,
  --     read_data => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_read_data,
  --     write_req => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_write_req,
  --     write_ack => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_write_ack,
  --     write_data => ACB_RESPONSE_TO_ACCELERATOR_3_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- ACB_RESPONSE_TO_ACCELERATOR_4_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe ACB_RESPONSE_TO_ACCELERATOR_4",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 65,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_req,
  --     read_ack => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_ack,
  --     read_data => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_read_data,
  --     write_req => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_write_req,
  --     write_ack => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_write_ack,
  --     write_data => ACB_RESPONSE_TO_ACCELERATOR_4_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  AFB_FLASH_REQUEST_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe AFB_FLASH_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => AFB_FLASH_REQUEST_pipe_read_req,
      read_ack => AFB_FLASH_REQUEST_pipe_read_ack,
      read_data => AFB_FLASH_REQUEST_pipe_read_data,
      write_req => AFB_FLASH_REQUEST_pipe_write_req,
      write_ack => AFB_FLASH_REQUEST_pipe_write_ack,
      write_data => AFB_FLASH_REQUEST_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
    ); -- 
  AFB_NIC_REQUEST_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe AFB_NIC_REQUEST",
      num_reads => 1,
      num_writes => 1,
      data_width => 74,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => AFB_NIC_REQUEST_pipe_read_req,
      read_ack => AFB_NIC_REQUEST_pipe_read_ack,
      read_data => AFB_NIC_REQUEST_pipe_read_data,
      write_req => AFB_NIC_REQUEST_pipe_write_req,
      write_ack => AFB_NIC_REQUEST_pipe_write_ack,
      write_data => AFB_NIC_REQUEST_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
    ); -- 
  -- AFB_REQUEST_TO_ACCELERATOR_1_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe AFB_REQUEST_TO_ACCELERATOR_1",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 74,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_req,
  --     read_ack => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_ack,
  --     read_data => AFB_REQUEST_TO_ACCELERATOR_1_pipe_read_data,
  --     write_req => AFB_REQUEST_TO_ACCELERATOR_1_pipe_write_req,
  --     write_ack => AFB_REQUEST_TO_ACCELERATOR_1_pipe_write_ack,
  --     write_data => AFB_REQUEST_TO_ACCELERATOR_1_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- AFB_REQUEST_TO_ACCELERATOR_2_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe AFB_REQUEST_TO_ACCELERATOR_2",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 74,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_req,
  --     read_ack => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_ack,
  --     read_data => AFB_REQUEST_TO_ACCELERATOR_2_pipe_read_data,
  --     write_req => AFB_REQUEST_TO_ACCELERATOR_2_pipe_write_req,
  --     write_ack => AFB_REQUEST_TO_ACCELERATOR_2_pipe_write_ack,
  --     write_data => AFB_REQUEST_TO_ACCELERATOR_2_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC --  
  --   ); -- 
  -- AFB_REQUEST_TO_ACCELERATOR_3_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe AFB_REQUEST_TO_ACCELERATOR_3",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 74,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_req,
  --     read_ack => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_ack,
  --     read_data => AFB_REQUEST_TO_ACCELERATOR_3_pipe_read_data,
  --     write_req => AFB_REQUEST_TO_ACCELERATOR_3_pipe_write_req,
  --     write_ack => AFB_REQUEST_TO_ACCELERATOR_3_pipe_write_ack,
  --     write_data => AFB_REQUEST_TO_ACCELERATOR_3_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- AFB_REQUEST_TO_ACCELERATOR_4_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe AFB_REQUEST_TO_ACCELERATOR_4",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 74,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_req,
  --     read_ack => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_ack,
  --     read_data => AFB_REQUEST_TO_ACCELERATOR_4_pipe_read_data,
  --     write_req => AFB_REQUEST_TO_ACCELERATOR_4_pipe_write_req,
  --     write_ack => AFB_REQUEST_TO_ACCELERATOR_4_pipe_write_ack,
  --     write_data => AFB_REQUEST_TO_ACCELERATOR_4_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- AFB_RESPONSE_FROM_ACCELERATOR_1_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe AFB_RESPONSE_FROM_ACCELERATOR_1",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 33,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_read_req,
  --     read_ack => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_read_ack,
  --     read_data => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_read_data,
  --     write_req => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_req,
  --     write_ack => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_ack,
  --     write_data => AFB_RESPONSE_FROM_ACCELERATOR_1_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- AFB_RESPONSE_FROM_ACCELERATOR_2_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe AFB_RESPONSE_FROM_ACCELERATOR_2",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 33,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_read_req,
  --     read_ack => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_read_ack,
  --     read_data => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_read_data,
  --     write_req => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_req,
  --     write_ack => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_ack,
  --     write_data => AFB_RESPONSE_FROM_ACCELERATOR_2_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- AFB_RESPONSE_FROM_ACCELERATOR_3_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe AFB_RESPONSE_FROM_ACCELERATOR_3",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 33,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_read_req,
  --     read_ack => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_read_ack,
  --     read_data => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_read_data,
  --     write_req => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_req,
  --     write_ack => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_ack,
  --     write_data => AFB_RESPONSE_FROM_ACCELERATOR_3_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  -- AFB_RESPONSE_FROM_ACCELERATOR_4_inst:  PipeBase -- 
  --   generic map( -- 
  --     name => "pipe AFB_RESPONSE_FROM_ACCELERATOR_4",
  --     num_reads => 1,
  --     num_writes => 1,
  --     data_width => 33,
  --     lifo_mode => false,
  --     signal_mode => false,
  --     shift_register_mode => false,
  --     bypass => false,
  --     depth => 2 --
  --   )
  --   port map( -- 
  --     read_req => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_read_req,
  --     read_ack => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_read_ack,
  --     read_data => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_read_data,
  --     write_req => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_req,
  --     write_ack => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_ack,
  --     write_data => AFB_RESPONSE_FROM_ACCELERATOR_4_pipe_write_data,
  --     clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
  --   ); -- 
  DRAM_ACB_RESPONSE_FIFO_IN_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe DRAM_ACB_RESPONSE_FIFO_IN",
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
      read_req => DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_req,
      read_ack => DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_ack,
      read_data => DRAM_ACB_RESPONSE_FIFO_IN_pipe_read_data,
      write_req => DRAM_ACB_RESPONSE_FIFO_IN_pipe_write_req,
      write_ack => DRAM_ACB_RESPONSE_FIFO_IN_pipe_write_ack,
      write_data => DRAM_ACB_RESPONSE_FIFO_IN_pipe_write_data,
      clk => CLOCK_TO_DRAMCTRL_BRIDGE,reset => RESET_TO_DRAMCTRL_BRIDGE -- 
    ); -- 
  DRAM_ACB_RESPONSE_FIFO_OUT_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe DRAM_ACB_RESPONSE_FIFO_OUT",
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
      read_req => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_read_req,
      read_ack => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_read_ack,
      read_data => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_read_data,
      write_req => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_write_req,
      write_ack => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_write_ack,
      write_data => DRAM_ACB_RESPONSE_FIFO_OUT_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
    ); -- 
  FLASH_AFB_RESPONSE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe FLASH_AFB_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => FLASH_AFB_RESPONSE_pipe_read_req,
      read_ack => FLASH_AFB_RESPONSE_pipe_read_ack,
      read_data => FLASH_AFB_RESPONSE_pipe_read_data,
      write_req => FLASH_AFB_RESPONSE_pipe_write_req,
      write_ack => FLASH_AFB_RESPONSE_pipe_write_ack,
      write_data => FLASH_AFB_RESPONSE_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
    ); -- 
  MAIN_MEM_INVALIDATE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe MAIN_MEM_INVALIDATE",
      num_reads => 1,
      num_writes => 1,
      data_width => 30,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => MAIN_MEM_INVALIDATE_pipe_read_req,
      read_ack => MAIN_MEM_INVALIDATE_pipe_read_ack,
      read_data => MAIN_MEM_INVALIDATE_pipe_read_data,
      write_req => MAIN_MEM_INVALIDATE_pipe_write_req,
      write_ack => MAIN_MEM_INVALIDATE_pipe_write_ack,
      write_data => MAIN_MEM_INVALIDATE_pipe_write_data,
      clk => CLOCK_TO_PROCESSOR,reset => RESET_TO_PROCESSOR -- 
    ); -- 
  NIC_ACB_REQUEST_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe NIC_ACB_REQUEST",
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
      read_req => NIC_ACB_REQUEST_pipe_read_req,
      read_ack => NIC_ACB_REQUEST_pipe_read_ack,
      read_data => NIC_ACB_REQUEST_pipe_read_data,
      write_req => NIC_ACB_REQUEST_pipe_write_req,
      write_ack => NIC_ACB_REQUEST_pipe_write_ack,
      write_data => NIC_ACB_REQUEST_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC --  
    ); -- 
  NIC_AFB_RESPONSE_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe NIC_AFB_RESPONSE",
      num_reads => 1,
      num_writes => 1,
      data_width => 33,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => NIC_AFB_RESPONSE_pipe_read_req,
      read_ack => NIC_AFB_RESPONSE_pipe_read_ack,
      read_data => NIC_AFB_RESPONSE_pipe_read_data,
      write_req => NIC_AFB_RESPONSE_pipe_write_req,
      write_ack => NIC_AFB_RESPONSE_pipe_write_ack,
      write_data => NIC_AFB_RESPONSE_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
    ); -- 
  -- pipe PROCESSOR_ACB_REQUEST_FIFO_IN depth set to 0 since it is a P2P pipe.
  PROCESSOR_ACB_REQUEST_FIFO_IN_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe PROCESSOR_ACB_REQUEST_FIFO_IN",
      num_reads => 1,
      num_writes => 1,
      data_width => 110,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_req,
      read_ack => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_ack,
      read_data => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_read_data,
      write_req => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_write_req,
      write_ack => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_write_ack,
      write_data => PROCESSOR_ACB_REQUEST_FIFO_IN_pipe_write_data,
      clk => CLOCK_TO_PROCESSOR,reset => RESET_TO_PROCESSOR -- 
    ); -- 
  -- pipe PROCESSOR_ACB_REQUEST_FIFO_OUT depth set to 0 since it is a P2P pipe.
  PROCESSOR_ACB_REQUEST_FIFO_OUT_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe PROCESSOR_ACB_REQUEST_FIFO_OUT",
      num_reads => 1,
      num_writes => 1,
      data_width => 110,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_read_req,
      read_ack => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_read_ack,
      read_data => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_read_data,
      write_req => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_write_req,
      write_ack => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_write_ack,
      write_data => PROCESSOR_ACB_REQUEST_FIFO_OUT_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
    ); -- 
  -- pipe PROCESSOR_ACB_RESPONSE_FIFO_IN depth set to 0 since it is a P2P pipe.
  PROCESSOR_ACB_RESPONSE_FIFO_IN_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe PROCESSOR_ACB_RESPONSE_FIFO_IN",
      num_reads => 1,
      num_writes => 1,
      data_width => 65,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_req,
      read_ack => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_ack,
      read_data => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_read_data,
      write_req => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_write_req,
      write_ack => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_write_ack,
      write_data => PROCESSOR_ACB_RESPONSE_FIFO_IN_pipe_write_data,
      clk => CLOCK_TO_NIC,reset => RESET_TO_NIC -- 
    ); -- 
  -- pipe PROCESSOR_ACB_RESPONSE_FIFO_OUT depth set to 0 since it is a P2P pipe.
  PROCESSOR_ACB_RESPONSE_FIFO_OUT_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe PROCESSOR_ACB_RESPONSE_FIFO_OUT",
      num_reads => 1,
      num_writes => 1,
      data_width => 65,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_read_req,
      read_ack => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_read_ack,
      read_data => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_read_data,
      write_req => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_write_req,
      write_ack => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_write_ack,
      write_data => PROCESSOR_ACB_RESPONSE_FIFO_OUT_pipe_write_data,
      clk => CLOCK_TO_PROCESSOR,reset => RESET_TO_PROCESSOR --
    ); -- 
  -- 
end struct;
