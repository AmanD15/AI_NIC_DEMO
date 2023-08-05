-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package ai_ml_engine_global_package is -- 
  constant BAD_PACKET_DATA : std_logic_vector(63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111";
  constant FULL_BYTE_MASK : std_logic_vector(7 downto 0) := "11111111";
  constant HEADER_TKEEP : std_logic_vector(7 downto 0) := "00111111";
  constant QUEUE_SIZE_MASK : std_logic_vector(31 downto 0) := "00000000000000000000000000000100";
  constant RX_QUEUES_REG_START_OFFSET : std_logic_vector(5 downto 0) := "000010";
  constant S0 : std_logic_vector(1 downto 0) := "00";
  constant S1 : std_logic_vector(1 downto 0) := "01";
  constant S2 : std_logic_vector(1 downto 0) := "10";
  constant S3 : std_logic_vector(1 downto 0) := "11";
  constant TX_QUEUES_REG_START_OFFSET : std_logic_vector(5 downto 0) := "001010";
  constant WAIT_TIME : std_logic_vector(9 downto 0) := "0000001010";
  constant accelerator_reg_base_address : std_logic_vector(3 downto 0) := "0000";
  constant global_time_val_pipe_base_address : std_logic_vector(4 downto 0) := "00000";
  constant nic_registers_base_address : std_logic_vector(5 downto 0) := "000000";
  -- 
end package ai_ml_engine_global_package;
