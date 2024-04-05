library ieee;
use ieee.std_logic_1164.all;
package nic_mac_bridge_Type_Package is -- 
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
library nic_mac_bridge_lib;
use nic_mac_bridge_lib.nic_mac_bridge_Type_Package.all;
--<<<<<
-->>>>>
library nic_mac_bridge_lib;
library nic_mac_bridge_lib;
library nic_mac_bridge_lib;
--<<<<<
entity nic_mac_bridge is -- 
  port( -- 
    ENABLE_MAC: in std_logic_vector(0 downto 0);
    rx_in_pipe_pipe_write_data : in std_logic_vector(9 downto 0);
    rx_in_pipe_pipe_write_req  : in std_logic_vector(0  downto 0);
    rx_in_pipe_pipe_write_ack  : out std_logic_vector(0  downto 0);
    tx_in_pipe_pipe_write_data : in std_logic_vector(72 downto 0);
    tx_in_pipe_pipe_write_req  : in std_logic_vector(0  downto 0);
    tx_in_pipe_pipe_write_ack  : out std_logic_vector(0  downto 0);
    nic_to_mac_resetn : out std_logic_vector(0 downto 0);
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
end entity nic_mac_bridge;
architecture struct of nic_mac_bridge is -- 
  component nic_mac_pipe_reset is -- 
    port( -- 
      clk: in std_logic;
      ENABLE_MAC : in std_logic;
      reset : out std_logic
    );
    --
  end component;
  -->>>>>
  
  --<<<<<
  component rx_concat_system is -- 
    port( -- 
      rx_in_pipe_pipe_write_data : in std_logic_vector(9 downto 0);
      rx_in_pipe_pipe_write_req  : in std_logic_vector(0  downto 0);
      rx_in_pipe_pipe_write_ack  : out std_logic_vector(0  downto 0);
      rx_out_pipe_pipe_read_data : out std_logic_vector(72 downto 0);
      rx_out_pipe_pipe_read_req  : in std_logic_vector(0  downto 0);
      rx_out_pipe_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for inst_rx_concat_system :  rx_concat_system -- 
    use entity nic_mac_bridge_lib.rx_concat_system; -- 
  --<<<<<
  component tx_deconcat_system is -- 
    port( -- 
      tx_in_pipe_pipe_write_data : in std_logic_vector(72 downto 0);
      tx_in_pipe_pipe_write_req  : in std_logic_vector(0  downto 0);
      tx_in_pipe_pipe_write_ack  : out std_logic_vector(0  downto 0);
      tx_out_pipe_pipe_read_data : out std_logic_vector(9 downto 0);
      tx_out_pipe_pipe_read_req  : in std_logic_vector(0  downto 0);
      tx_out_pipe_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for inst_tx_deconcat_system :  tx_deconcat_system -- 
    use entity nic_mac_bridge_lib.tx_deconcat_system; -- 
  --<<<<<

----  HAND EDIT PART BEGINS -----------------

    signal NIC_TO_MAC_RESETN_SIG: std_logic_vector(0 downto 0);
   

----  HAND EDIT PART ENDS -----------------


begin -- 
 
  inst_nic_mac_pipe_reset: nic_mac_pipe_reset
  port map ( --
    ENABLE_MAC => ENABLE_MAC(0),
    reset => NIC_TO_MAC_RESETN_SIG(0),
    clk => clk
    ); -- 
  inst_rx_concat_system: rx_concat_system
  port map ( --
    rx_in_pipe_pipe_write_data => rx_in_pipe_pipe_write_data,
    rx_in_pipe_pipe_write_req => rx_in_pipe_pipe_write_req,
    rx_in_pipe_pipe_write_ack => rx_in_pipe_pipe_write_ack,
    rx_out_pipe_pipe_read_data => rx_out_pipe_pipe_read_data,
    rx_out_pipe_pipe_read_req => rx_out_pipe_pipe_read_req,
    rx_out_pipe_pipe_read_ack => rx_out_pipe_pipe_read_ack,
    clk => clk, reset => NIC_TO_MAC_RESETN_SIG(0)
    ); -- 
  inst_tx_deconcat_system: tx_deconcat_system
  port map ( --
    tx_in_pipe_pipe_write_data => tx_in_pipe_pipe_write_data,
    tx_in_pipe_pipe_write_req => tx_in_pipe_pipe_write_req,
    tx_in_pipe_pipe_write_ack => tx_in_pipe_pipe_write_ack,
    tx_out_pipe_pipe_read_data => tx_out_pipe_pipe_read_data,
    tx_out_pipe_pipe_read_req => tx_out_pipe_pipe_read_req,
    tx_out_pipe_pipe_read_ack => tx_out_pipe_pipe_read_ack,
    clk => clk, reset => NIC_TO_MAC_RESETN_SIG(0)
    ); -- 
  -- 

	--OUTPUT ASSIGNMENT
	nic_to_mac_resetn <= NIC_TO_MAC_RESETN_SIG;


end struct;
