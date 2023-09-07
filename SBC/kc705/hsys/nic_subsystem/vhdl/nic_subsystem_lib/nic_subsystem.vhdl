library ieee;
use ieee.std_logic_1164.all;
package nic_subsystem_Type_Package is -- 
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
library nic_subsystem_lib;
use nic_subsystem_lib.nic_subsystem_Type_Package.all;
--<<<<<
-->>>>>
library nic_subsystem_lib;
library nic_mac_bridge_lib;
--<<<<<
entity nic_subsystem is -- 
  port( -- 
    AFB_NIC_REGISTER_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
    AFB_NIC_REGISTER_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
    AFB_NIC_REGISTER_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
    MAC_TO_NIC_DATA_pipe_write_data : in std_logic_vector(9 downto 0);
    MAC_TO_NIC_DATA_pipe_write_req  : in std_logic_vector(0  downto 0);
    MAC_TO_NIC_DATA_pipe_write_ack  : out std_logic_vector(0  downto 0);
    NIC_ACB_MEMORY_RESPONSE_pipe_write_data : in std_logic_vector(64 downto 0);
    NIC_ACB_MEMORY_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
    NIC_ACB_MEMORY_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
    AFB_NIC_REGISTER_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
    AFB_NIC_REGISTER_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
    AFB_NIC_REGISTER_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
    NIC_ACB_MEMORY_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
    NIC_ACB_MEMORY_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
    NIC_ACB_MEMORY_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
    NIC_INTERRUPT_TO_PROCESSOR : out std_logic_vector(0 downto 0);
    NIC_TO_MAC_DATA_pipe_read_data : out std_logic_vector(9 downto 0);
    NIC_TO_MAC_DATA_pipe_read_req  : in std_logic_vector(0  downto 0);
    NIC_TO_MAC_DATA_pipe_read_ack  : out std_logic_vector(0  downto 0);
    NIC_TO_MAC_RESET_N : out std_logic_vector(0 downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
end entity nic_subsystem;
architecture struct of nic_subsystem is -- 
  signal nic_mac_enable_pipe_write_data: std_logic_vector(0 downto 0);
  signal nic_mac_enable_pipe_write_req : std_logic_vector(0  downto 0);
  signal nic_mac_enable_pipe_write_ack : std_logic_vector(0  downto 0);
  signal nic_mac_enable_pipe_read_data: std_logic_vector(0 downto 0);
  signal nic_mac_enable_pipe_read_req : std_logic_vector(0  downto 0);
  signal nic_mac_enable_pipe_read_ack : std_logic_vector(0  downto 0);
  signal nic_to_tx_deconcat_data_pipe_write_data: std_logic_vector(72 downto 0);
  signal nic_to_tx_deconcat_data_pipe_write_req : std_logic_vector(0  downto 0);
  signal nic_to_tx_deconcat_data_pipe_write_ack : std_logic_vector(0  downto 0);
  signal nic_to_tx_deconcat_data_pipe_read_data: std_logic_vector(72 downto 0);
  signal nic_to_tx_deconcat_data_pipe_read_req : std_logic_vector(0  downto 0);
  signal nic_to_tx_deconcat_data_pipe_read_ack : std_logic_vector(0  downto 0);
  signal rx_concat_to_nic_data_pipe_write_data: std_logic_vector(72 downto 0);
  signal rx_concat_to_nic_data_pipe_write_req : std_logic_vector(0  downto 0);
  signal rx_concat_to_nic_data_pipe_write_ack : std_logic_vector(0  downto 0);
  signal rx_concat_to_nic_data_pipe_read_data: std_logic_vector(72 downto 0);
  signal rx_concat_to_nic_data_pipe_read_req : std_logic_vector(0  downto 0);
  signal rx_concat_to_nic_data_pipe_read_ack : std_logic_vector(0  downto 0);
  component nic is -- 
    port( -- 
      AFB_NIC_REQUEST_pipe_write_data : in std_logic_vector(73 downto 0);
      AFB_NIC_REQUEST_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_NIC_REQUEST_pipe_write_ack  : out std_logic_vector(0  downto 0);
      MEMORY_TO_NIC_RESPONSE_pipe_write_data : in std_logic_vector(64 downto 0);
      MEMORY_TO_NIC_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      MEMORY_TO_NIC_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      mac_to_nic_data_pipe_write_data : in std_logic_vector(9 downto 0);
      mac_to_nic_data_pipe_write_req  : in std_logic_vector(0  downto 0);
      mac_to_nic_data_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_NIC_RESPONSE_pipe_read_data : out std_logic_vector(32 downto 0);
      AFB_NIC_RESPONSE_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_NIC_RESPONSE_pipe_read_ack  : out std_logic_vector(0  downto 0);
      NIC_TO_MEMORY_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
      NIC_TO_MEMORY_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
      NIC_TO_MEMORY_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
      enable_mac_pipe_read_data : out std_logic_vector(0 downto 0);
      enable_mac_pipe_read_req  : in std_logic_vector(0  downto 0);
      enable_mac_pipe_read_ack  : out std_logic_vector(0  downto 0);
      nic_intr : out std_logic_vector(0 downto 0);
      nic_to_mac_transmit_pipe_pipe_read_data : out std_logic_vector(9 downto 0);
      nic_to_mac_transmit_pipe_pipe_read_req  : in std_logic_vector(0  downto 0);
      nic_to_mac_transmit_pipe_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for inst_nic :  nic -- 
    use entity nic_subsystem_lib.nic; -- 
  --<<<<<
  component nic_mac_bridge is -- 
    port( -- 
      ENABLE_MAC_pipe_write_data : in std_logic_vector(0 downto 0);
      ENABLE_MAC_pipe_write_req  : in std_logic_vector(0  downto 0);
      ENABLE_MAC_pipe_write_ack  : out std_logic_vector(0  downto 0);
      rx_in_pipe_pipe_write_data : in std_logic_vector(9 downto 0);
      rx_in_pipe_pipe_write_req  : in std_logic_vector(0  downto 0);
      rx_in_pipe_pipe_write_ack  : out std_logic_vector(0  downto 0);
      tx_in_pipe_pipe_write_data : in std_logic_vector(72 downto 0);
      tx_in_pipe_pipe_write_req  : in std_logic_vector(0  downto 0);
      tx_in_pipe_pipe_write_ack  : out std_logic_vector(0  downto 0);
      NIC_TO_MAC_RESET_N : out std_logic_vector(0 downto 0);
      rx_out_pipe_pipe_read_data : out std_logic_vector(72 downto 0);
      rx_out_pipe_pipe_read_req  : in std_logic_vector(0  downto 0);
      rx_out_pipe_pipe_read_ack  : out std_logic_vector(0  downto 0);
      tx_out_pipe_pipe_read_data : out std_logic_vector(9 downto 0);
      tx_out_pipe_pipe_read_req  : in std_logic_vector(0  downto 0);
      tx_out_pipe_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for nic_mac_bridge_inst :  nic_mac_bridge -- 
    use entity nic_mac_bridge_lib.nic_mac_bridge; -- 
  --<<<<<
  -- 
begin -- 
  inst_nic: nic
  port map ( --
    AFB_NIC_REQUEST_pipe_write_data => AFB_NIC_REGISTER_REQUEST_pipe_write_data,
    AFB_NIC_REQUEST_pipe_write_req => AFB_NIC_REGISTER_REQUEST_pipe_write_req,
    AFB_NIC_REQUEST_pipe_write_ack => AFB_NIC_REGISTER_REQUEST_pipe_write_ack,
    AFB_NIC_RESPONSE_pipe_read_data => AFB_NIC_REGISTER_RESPONSE_pipe_read_data,
    AFB_NIC_RESPONSE_pipe_read_req => AFB_NIC_REGISTER_RESPONSE_pipe_read_req,
    AFB_NIC_RESPONSE_pipe_read_ack => AFB_NIC_REGISTER_RESPONSE_pipe_read_ack,
    MEMORY_TO_NIC_RESPONSE_pipe_write_data => NIC_ACB_MEMORY_RESPONSE_pipe_write_data,
    MEMORY_TO_NIC_RESPONSE_pipe_write_req => NIC_ACB_MEMORY_RESPONSE_pipe_write_req,
    MEMORY_TO_NIC_RESPONSE_pipe_write_ack => NIC_ACB_MEMORY_RESPONSE_pipe_write_ack,
    NIC_TO_MEMORY_REQUEST_pipe_read_data => NIC_ACB_MEMORY_REQUEST_pipe_read_data,
    NIC_TO_MEMORY_REQUEST_pipe_read_req => NIC_ACB_MEMORY_REQUEST_pipe_read_req,
    NIC_TO_MEMORY_REQUEST_pipe_read_ack => NIC_ACB_MEMORY_REQUEST_pipe_read_ack,
    enable_mac_pipe_read_data => nic_mac_enable_pipe_write_data,
    enable_mac_pipe_read_req => nic_mac_enable_pipe_write_ack,
    enable_mac_pipe_read_ack => nic_mac_enable_pipe_write_req,
    mac_to_nic_data_pipe_write_data => rx_concat_to_nic_data_pipe_read_data,
    mac_to_nic_data_pipe_write_req => rx_concat_to_nic_data_pipe_read_ack,
    mac_to_nic_data_pipe_write_ack => rx_concat_to_nic_data_pipe_read_req,
    nic_intr => NIC_INTERRUPT_TO_PROCESSOR,
    nic_to_mac_transmit_pipe_pipe_read_data => nic_to_tx_deconcat_data_pipe_write_data,
    nic_to_mac_transmit_pipe_pipe_read_req => nic_to_tx_deconcat_data_pipe_write_ack,
    nic_to_mac_transmit_pipe_pipe_read_ack => nic_to_tx_deconcat_data_pipe_write_req,
    clk => clk, reset => reset 
    ); -- 
  nic_mac_bridge_inst: nic_mac_bridge
  port map ( --
    ENABLE_MAC_pipe_write_data => nic_mac_enable_pipe_read_data,
    ENABLE_MAC_pipe_write_req => nic_mac_enable_pipe_read_ack,
    ENABLE_MAC_pipe_write_ack => nic_mac_enable_pipe_read_req,
    NIC_TO_MAC_RESET_N => NIC_TO_MAC_RESET_N,
    rx_in_pipe_pipe_write_data => MAC_TO_NIC_DATA_pipe_write_data,
    rx_in_pipe_pipe_write_req => MAC_TO_NIC_DATA_pipe_write_req,
    rx_in_pipe_pipe_write_ack => MAC_TO_NIC_DATA_pipe_write_ack,
    rx_out_pipe_pipe_read_data => rx_concat_to_nic_data_pipe_write_data,
    rx_out_pipe_pipe_read_req => rx_concat_to_nic_data_pipe_write_ack,
    rx_out_pipe_pipe_read_ack => rx_concat_to_nic_data_pipe_write_req,
    tx_in_pipe_pipe_write_data => nic_to_tx_deconcat_data_pipe_read_data,
    tx_in_pipe_pipe_write_req => nic_to_tx_deconcat_data_pipe_read_ack,
    tx_in_pipe_pipe_write_ack => nic_to_tx_deconcat_data_pipe_read_req,
    tx_out_pipe_pipe_read_data => NIC_TO_MAC_DATA_pipe_read_data,
    tx_out_pipe_pipe_read_req => NIC_TO_MAC_DATA_pipe_read_req,
    tx_out_pipe_pipe_read_ack => NIC_TO_MAC_DATA_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  nic_mac_enable_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe nic_mac_enable",
      num_reads => 1,
      num_writes => 1,
      data_width => 1,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => nic_mac_enable_pipe_read_req,
      read_ack => nic_mac_enable_pipe_read_ack,
      read_data => nic_mac_enable_pipe_read_data,
      write_req => nic_mac_enable_pipe_write_req,
      write_ack => nic_mac_enable_pipe_write_ack,
      write_data => nic_mac_enable_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  nic_to_tx_deconcat_data_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe nic_to_tx_deconcat_data",
      num_reads => 1,
      num_writes => 1,
      data_width => 73,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => nic_to_tx_deconcat_data_pipe_read_req,
      read_ack => nic_to_tx_deconcat_data_pipe_read_ack,
      read_data => nic_to_tx_deconcat_data_pipe_read_data,
      write_req => nic_to_tx_deconcat_data_pipe_write_req,
      write_ack => nic_to_tx_deconcat_data_pipe_write_ack,
      write_data => nic_to_tx_deconcat_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  rx_concat_to_nic_data_inst:  PipeBase -- 
    generic map( -- 
      name => "pipe rx_concat_to_nic_data",
      num_reads => 1,
      num_writes => 1,
      data_width => 73,
      lifo_mode => false,
      signal_mode => false,
      shift_register_mode => false,
      bypass => false,
      depth => 2 --
    )
    port map( -- 
      read_req => rx_concat_to_nic_data_pipe_read_req,
      read_ack => rx_concat_to_nic_data_pipe_read_ack,
      read_data => rx_concat_to_nic_data_pipe_read_data,
      write_req => rx_concat_to_nic_data_pipe_write_req,
      write_ack => rx_concat_to_nic_data_pipe_write_ack,
      write_data => rx_concat_to_nic_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end struct;
