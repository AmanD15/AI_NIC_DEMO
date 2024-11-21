library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.utilities.all;
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;
-->>>>>
library nic_mac_bridge_lib;
--<<<<<
entity nic_mac_bridge_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of nic_mac_bridge_Test_Bench is -- 
  signal ENABLE_MAC_pipe_write_data : std_logic_vector(0 downto 0);
  signal ENABLE_MAC_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal ENABLE_MAC_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal ENABLE_MAC: std_logic_vector(0 downto 0);
  signal rx_in_pipe_pipe_write_data : std_logic_vector(9 downto 0);
  signal rx_in_pipe_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal rx_in_pipe_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal tx_in_pipe_pipe_write_data : std_logic_vector(72 downto 0);
  signal tx_in_pipe_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal tx_in_pipe_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal nic_to_mac_resetn_pipe_read_data : std_logic_vector(0 downto 0);
  signal nic_to_mac_resetn_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal nic_to_mac_resetn_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal nic_to_mac_resetn: std_logic_vector(0 downto 0) := (others => '0');
  signal rx_out_pipe_pipe_read_data : std_logic_vector(72 downto 0);
  signal rx_out_pipe_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal rx_out_pipe_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal tx_out_pipe_pipe_read_data : std_logic_vector(9 downto 0);
  signal tx_out_pipe_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal tx_out_pipe_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
  component nic_mac_bridge is -- 
    port( -- 
      ENABLE_MAC : in std_logic_vector(0 downto 0);
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
  end component;
  -->>>>>
  for dut :  nic_mac_bridge -- 
    use entity nic_mac_bridge_lib.nic_mac_bridge; -- 
  --<<<<<
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  process
  begin --
    Vhpi_Initialize;
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait for 5 ns;
    reset <= '0';
    while true loop --
      wait until clk = '0';
      Vhpi_Listen;
      Vhpi_Send;
      --
    end loop;
    wait;
    --
  end process;
  ENABLE_MAC_pipe_write_ack(0) <= '1';
  TruncateOrPad(ENABLE_MAC_pipe_write_data,ENABLE_MAC);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("ENABLE_MAC req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      ENABLE_MAC_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ENABLE_MAC 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      wait for 1 ns;
      if (ENABLE_MAC_pipe_write_req(0) = '1') then 
      -- 
        ENABLE_MAC_pipe_write_data <= Unpack_String(val_string,1);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ENABLE_MAC ack");
      val_string := Pack_SLV_To_Vhpi_String(ENABLE_MAC_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("rx_in_pipe req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      rx_in_pipe_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("rx_in_pipe 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,10);
      rx_in_pipe_pipe_write_data <= Unpack_String(val_string,10);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("rx_in_pipe ack");
      val_string := Pack_SLV_To_Vhpi_String(rx_in_pipe_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("tx_in_pipe req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      tx_in_pipe_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("tx_in_pipe 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,73);
      tx_in_pipe_pipe_write_data <= Unpack_String(val_string,73);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("tx_in_pipe ack");
      val_string := Pack_SLV_To_Vhpi_String(tx_in_pipe_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  nic_to_mac_resetn_pipe_read_ack(0) <= '1';
  TruncateOrPad(nic_to_mac_resetn, nic_to_mac_resetn_pipe_read_data);
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("nic_to_mac_resetn req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      nic_to_mac_resetn_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("nic_to_mac_resetn ack");
      val_string := Pack_SLV_To_Vhpi_String(nic_to_mac_resetn_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("nic_to_mac_resetn 0");
      val_string := Pack_SLV_To_Vhpi_String(nic_to_mac_resetn_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("rx_out_pipe req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      rx_out_pipe_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("rx_out_pipe ack");
      val_string := Pack_SLV_To_Vhpi_String(rx_out_pipe_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("rx_out_pipe 0");
      val_string := Pack_SLV_To_Vhpi_String(rx_out_pipe_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,73);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("tx_out_pipe req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      tx_out_pipe_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("tx_out_pipe ack");
      val_string := Pack_SLV_To_Vhpi_String(tx_out_pipe_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("tx_out_pipe 0");
      val_string := Pack_SLV_To_Vhpi_String(tx_out_pipe_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,10);
      -- 
    end loop;
    --
  end process;
  dut: nic_mac_bridge
  port map ( --
    ENABLE_MAC => ENABLE_MAC,
    rx_in_pipe_pipe_write_data => rx_in_pipe_pipe_write_data,
    rx_in_pipe_pipe_write_req => rx_in_pipe_pipe_write_req,
    rx_in_pipe_pipe_write_ack => rx_in_pipe_pipe_write_ack,
    tx_in_pipe_pipe_write_data => tx_in_pipe_pipe_write_data,
    tx_in_pipe_pipe_write_req => tx_in_pipe_pipe_write_req,
    tx_in_pipe_pipe_write_ack => tx_in_pipe_pipe_write_ack,
    nic_to_mac_resetn => nic_to_mac_resetn,
    rx_out_pipe_pipe_read_data => rx_out_pipe_pipe_read_data,
    rx_out_pipe_pipe_read_req => rx_out_pipe_pipe_read_req,
    rx_out_pipe_pipe_read_ack => rx_out_pipe_pipe_read_ack,
    tx_out_pipe_pipe_read_data => tx_out_pipe_pipe_read_data,
    tx_out_pipe_pipe_read_req => tx_out_pipe_pipe_read_req,
    tx_out_pipe_pipe_read_ack => tx_out_pipe_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;
