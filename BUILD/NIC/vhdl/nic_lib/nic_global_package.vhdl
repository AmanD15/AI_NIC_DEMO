-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package nic_global_package is -- 
  constant BAD_PACKET_DATA : std_logic_vector(63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111";
  constant FREEQUEUE : std_logic_vector(1 downto 0) := "00";
  constant FULL_BYTE_MASK : std_logic_vector(7 downto 0) := "11111111";
  constant HEADER_TKEEP : std_logic_vector(7 downto 0) := "11111100";
  constant LD : std_logic_vector(2 downto 0) := "100";
  constant LDB : std_logic_vector(2 downto 0) := "110";
  constant LDD : std_logic_vector(2 downto 0) := "101";
  constant LDSTUB : std_logic_vector(2 downto 0) := "111";
  constant LOCKMEM : std_logic_vector(0 downto 0) := "1";
  constant POPQ : std_logic_vector(3 downto 0) := "0001";
  constant PREPOPQ : std_logic_vector(3 downto 0) := "0011";
  constant PREPUSHQ : std_logic_vector(3 downto 0) := "0100";
  constant PUSHQ : std_logic_vector(3 downto 0) := "0010";
  constant QUEUE_SIZE_MASK : std_logic_vector(31 downto 0) := "00000000000000000000000000000100";
  constant READMEM : std_logic_vector(0 downto 0) := "1";
  constant RXQUEUE : std_logic_vector(1 downto 0) := "10";
  constant S0 : std_logic_vector(1 downto 0) := "00";
  constant S1 : std_logic_vector(1 downto 0) := "01";
  constant S2 : std_logic_vector(1 downto 0) := "10";
  constant S3 : std_logic_vector(1 downto 0) := "11";
  constant ST : std_logic_vector(2 downto 0) := "001";
  constant STB : std_logic_vector(2 downto 0) := "011";
  constant STD : std_logic_vector(2 downto 0) := "010";
  constant TXQUEUE : std_logic_vector(1 downto 0) := "01";
  constant UNLOCKMEM : std_logic_vector(0 downto 0) := "0";
  constant WAIT_TIME : std_logic_vector(9 downto 0) := "0000001010";
  constant WRITEMEM : std_logic_vector(0 downto 0) := "0";
  constant nic_registers_base_address : std_logic_vector(7 downto 0) := "00000000";
  component nic is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      AFB_NIC_REQUEST_pipe_write_data: in std_logic_vector(73 downto 0);
      AFB_NIC_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
      AFB_NIC_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
      AFB_NIC_RESPONSE_pipe_read_data: out std_logic_vector(32 downto 0);
      AFB_NIC_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      AFB_NIC_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      MAC_ENABLE: out std_logic_vector(0 downto 0);
      MEMORY_TO_NIC_RESPONSE_pipe_write_data: in std_logic_vector(64 downto 0);
      MEMORY_TO_NIC_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
      MEMORY_TO_NIC_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
      NIC_DEBUG_SIGNAL: out std_logic_vector(255 downto 0);
      NIC_INTR: out std_logic_vector(0 downto 0);
      NIC_TO_MEMORY_REQUEST_pipe_read_data: out std_logic_vector(109 downto 0);
      NIC_TO_MEMORY_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
      NIC_TO_MEMORY_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
      RX_ACTIVITY_LOGGER_pipe_read_data: out std_logic_vector(7 downto 0);
      RX_ACTIVITY_LOGGER_pipe_read_req : in std_logic_vector(0 downto 0);
      RX_ACTIVITY_LOGGER_pipe_read_ack : out std_logic_vector(0 downto 0);
      TX_ACTIVITY_LOGGER_pipe_read_data: out std_logic_vector(7 downto 0);
      TX_ACTIVITY_LOGGER_pipe_read_req : in std_logic_vector(0 downto 0);
      TX_ACTIVITY_LOGGER_pipe_read_ack : out std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_data: in std_logic_vector(72 downto 0);
      mac_to_nic_data_pipe_write_req : in std_logic_vector(0 downto 0);
      mac_to_nic_data_pipe_write_ack : out std_logic_vector(0 downto 0);
      nic_to_mac_transmit_pipe_pipe_read_data: out std_logic_vector(72 downto 0);
      nic_to_mac_transmit_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
      nic_to_mac_transmit_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  -- 
end package nic_global_package;
