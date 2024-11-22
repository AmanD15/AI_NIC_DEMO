library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
library nic_lib;
use nic_lib.nic_global_package.all;
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;
entity nic_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of nic_Test_Bench is -- 
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal ReceiveEngineDaemon_tag_in: std_logic_vector(1 downto 0);
  signal ReceiveEngineDaemon_tag_out: std_logic_vector(1 downto 0);
  signal ReceiveEngineDaemon_start_req : std_logic := '0';
  signal ReceiveEngineDaemon_start_ack : std_logic := '0';
  signal ReceiveEngineDaemon_fin_req   : std_logic := '0';
  signal ReceiveEngineDaemon_fin_ack   : std_logic := '0';
  signal controlDaemon_tag_in: std_logic_vector(1 downto 0);
  signal controlDaemon_tag_out: std_logic_vector(1 downto 0);
  signal controlDaemon_start_req : std_logic := '0';
  signal controlDaemon_start_ack : std_logic := '0';
  signal controlDaemon_fin_req   : std_logic := '0';
  signal controlDaemon_fin_ack   : std_logic := '0';
  signal nicRxFromMacDaemon_tag_in: std_logic_vector(1 downto 0);
  signal nicRxFromMacDaemon_tag_out: std_logic_vector(1 downto 0);
  signal nicRxFromMacDaemon_start_req : std_logic := '0';
  signal nicRxFromMacDaemon_start_ack : std_logic := '0';
  signal nicRxFromMacDaemon_fin_req   : std_logic := '0';
  signal nicRxFromMacDaemon_fin_ack   : std_logic := '0';
  signal transmitEngineDaemon_tag_in: std_logic_vector(1 downto 0);
  signal transmitEngineDaemon_tag_out: std_logic_vector(1 downto 0);
  signal transmitEngineDaemon_start_req : std_logic := '0';
  signal transmitEngineDaemon_start_ack : std_logic := '0';
  signal transmitEngineDaemon_fin_req   : std_logic := '0';
  signal transmitEngineDaemon_fin_ack   : std_logic := '0';
  -- write to pipe AFB_NIC_REQUEST
  signal AFB_NIC_REQUEST_pipe_write_data: std_logic_vector(73 downto 0);
  signal AFB_NIC_REQUEST_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal AFB_NIC_REQUEST_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe AFB_NIC_RESPONSE
  signal AFB_NIC_RESPONSE_pipe_read_data: std_logic_vector(32 downto 0);
  signal AFB_NIC_RESPONSE_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal AFB_NIC_RESPONSE_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe MAC_ENABLE
  signal MAC_ENABLE_pipe_read_data: std_logic_vector(0 downto 0);
  signal MAC_ENABLE_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal MAC_ENABLE_pipe_read_ack : std_logic_vector(0 downto 0);
  signal MAC_ENABLE: std_logic_vector(0 downto 0);
  -- write to pipe MEMORY_TO_NIC_RESPONSE
  signal MEMORY_TO_NIC_RESPONSE_pipe_write_data: std_logic_vector(64 downto 0);
  signal MEMORY_TO_NIC_RESPONSE_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal MEMORY_TO_NIC_RESPONSE_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe NIC_DEBUG_SIGNAL
  signal NIC_DEBUG_SIGNAL_pipe_read_data: std_logic_vector(255 downto 0);
  signal NIC_DEBUG_SIGNAL_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal NIC_DEBUG_SIGNAL_pipe_read_ack : std_logic_vector(0 downto 0);
  signal NIC_DEBUG_SIGNAL: std_logic_vector(255 downto 0);
  -- read from pipe NIC_INTR
  signal NIC_INTR_pipe_read_data: std_logic_vector(0 downto 0);
  signal NIC_INTR_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal NIC_INTR_pipe_read_ack : std_logic_vector(0 downto 0);
  signal NIC_INTR: std_logic_vector(0 downto 0);
  -- read from pipe NIC_TO_MEMORY_REQUEST
  signal NIC_TO_MEMORY_REQUEST_pipe_read_data: std_logic_vector(109 downto 0);
  signal NIC_TO_MEMORY_REQUEST_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal NIC_TO_MEMORY_REQUEST_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe RX_ACTIVITY_LOGGER
  signal RX_ACTIVITY_LOGGER_pipe_read_data: std_logic_vector(7 downto 0);
  signal RX_ACTIVITY_LOGGER_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal RX_ACTIVITY_LOGGER_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe TX_ACTIVITY_LOGGER
  signal TX_ACTIVITY_LOGGER_pipe_read_data: std_logic_vector(7 downto 0);
  signal TX_ACTIVITY_LOGGER_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal TX_ACTIVITY_LOGGER_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe mac_to_nic_data
  signal mac_to_nic_data_pipe_write_data: std_logic_vector(72 downto 0);
  signal mac_to_nic_data_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal mac_to_nic_data_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe nic_to_mac_transmit_pipe
  signal nic_to_mac_transmit_pipe_pipe_read_data: std_logic_vector(72 downto 0);
  signal nic_to_mac_transmit_pipe_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal nic_to_mac_transmit_pipe_pipe_read_ack : std_logic_vector(0 downto 0);
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  -- assert reset for four clocks.
  process
  begin --
    Vhpi_Initialize;
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
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
  -- connect all the top-level modules to Vhpi
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      AFB_NIC_REQUEST_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REQUEST 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,74);
      AFB_NIC_REQUEST_pipe_write_data <= Unpack_String(port_val_string,74);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REQUEST ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(AFB_NIC_REQUEST_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      AFB_NIC_RESPONSE_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_RESPONSE ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(AFB_NIC_RESPONSE_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_RESPONSE 0");
      port_val_string := Pack_SLV_To_Vhpi_String(AFB_NIC_RESPONSE_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,33);
      -- 
    end loop;
    --
  end process;
  MAC_ENABLE_pipe_read_ack(0) <= '1';
  TruncateOrPad(MAC_ENABLE, MAC_ENABLE_pipe_read_data);
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("MAC_ENABLE req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      MAC_ENABLE_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MAC_ENABLE ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(MAC_ENABLE_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MAC_ENABLE 0");
      port_val_string := Pack_SLV_To_Vhpi_String(MAC_ENABLE_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("MEMORY_TO_NIC_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      MEMORY_TO_NIC_RESPONSE_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MEMORY_TO_NIC_RESPONSE 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,65);
      MEMORY_TO_NIC_RESPONSE_pipe_write_data <= Unpack_String(port_val_string,65);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MEMORY_TO_NIC_RESPONSE ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(MEMORY_TO_NIC_RESPONSE_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  NIC_DEBUG_SIGNAL_pipe_read_ack(0) <= '1';
  TruncateOrPad(NIC_DEBUG_SIGNAL, NIC_DEBUG_SIGNAL_pipe_read_data);
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_DEBUG_SIGNAL req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      NIC_DEBUG_SIGNAL_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_DEBUG_SIGNAL ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(NIC_DEBUG_SIGNAL_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_DEBUG_SIGNAL 0");
      port_val_string := Pack_SLV_To_Vhpi_String(NIC_DEBUG_SIGNAL_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,256);
      -- 
    end loop;
    --
  end process;
  NIC_INTR_pipe_read_ack(0) <= '1';
  TruncateOrPad(NIC_INTR, NIC_INTR_pipe_read_data);
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_INTR req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      NIC_INTR_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_INTR ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(NIC_INTR_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_INTR 0");
      port_val_string := Pack_SLV_To_Vhpi_String(NIC_INTR_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MEMORY_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      NIC_TO_MEMORY_REQUEST_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MEMORY_REQUEST ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(NIC_TO_MEMORY_REQUEST_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MEMORY_REQUEST 0");
      port_val_string := Pack_SLV_To_Vhpi_String(NIC_TO_MEMORY_REQUEST_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,110);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("RX_ACTIVITY_LOGGER req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      RX_ACTIVITY_LOGGER_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("RX_ACTIVITY_LOGGER ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(RX_ACTIVITY_LOGGER_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("RX_ACTIVITY_LOGGER 0");
      port_val_string := Pack_SLV_To_Vhpi_String(RX_ACTIVITY_LOGGER_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,8);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("TX_ACTIVITY_LOGGER req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      TX_ACTIVITY_LOGGER_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("TX_ACTIVITY_LOGGER ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(TX_ACTIVITY_LOGGER_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("TX_ACTIVITY_LOGGER 0");
      port_val_string := Pack_SLV_To_Vhpi_String(TX_ACTIVITY_LOGGER_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,8);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      wait until clk = '1';
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      mac_to_nic_data_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,73);
      mac_to_nic_data_pipe_write_data <= Unpack_String(port_val_string,73);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("mac_to_nic_data ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(mac_to_nic_data_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
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
      obj_ref := Pack_String_To_Vhpi_String("nic_to_mac_transmit_pipe req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      nic_to_mac_transmit_pipe_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("nic_to_mac_transmit_pipe ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(nic_to_mac_transmit_pipe_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("nic_to_mac_transmit_pipe 0");
      port_val_string := Pack_SLV_To_Vhpi_String(nic_to_mac_transmit_pipe_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,73);
      -- 
    end loop;
    --
  end process;
  nic_instance: nic -- 
    port map ( -- 
      clk => clk,
      reset => reset,
      AFB_NIC_REQUEST_pipe_write_data  => AFB_NIC_REQUEST_pipe_write_data, 
      AFB_NIC_REQUEST_pipe_write_req  => AFB_NIC_REQUEST_pipe_write_req, 
      AFB_NIC_REQUEST_pipe_write_ack  => AFB_NIC_REQUEST_pipe_write_ack,
      AFB_NIC_RESPONSE_pipe_read_data  => AFB_NIC_RESPONSE_pipe_read_data, 
      AFB_NIC_RESPONSE_pipe_read_req  => AFB_NIC_RESPONSE_pipe_read_req, 
      AFB_NIC_RESPONSE_pipe_read_ack  => AFB_NIC_RESPONSE_pipe_read_ack ,
      MAC_ENABLE => MAC_ENABLE,
      MEMORY_TO_NIC_RESPONSE_pipe_write_data  => MEMORY_TO_NIC_RESPONSE_pipe_write_data, 
      MEMORY_TO_NIC_RESPONSE_pipe_write_req  => MEMORY_TO_NIC_RESPONSE_pipe_write_req, 
      MEMORY_TO_NIC_RESPONSE_pipe_write_ack  => MEMORY_TO_NIC_RESPONSE_pipe_write_ack,
      NIC_DEBUG_SIGNAL => NIC_DEBUG_SIGNAL,
      NIC_INTR => NIC_INTR,
      NIC_TO_MEMORY_REQUEST_pipe_read_data  => NIC_TO_MEMORY_REQUEST_pipe_read_data, 
      NIC_TO_MEMORY_REQUEST_pipe_read_req  => NIC_TO_MEMORY_REQUEST_pipe_read_req, 
      NIC_TO_MEMORY_REQUEST_pipe_read_ack  => NIC_TO_MEMORY_REQUEST_pipe_read_ack ,
      RX_ACTIVITY_LOGGER_pipe_read_data  => RX_ACTIVITY_LOGGER_pipe_read_data, 
      RX_ACTIVITY_LOGGER_pipe_read_req  => RX_ACTIVITY_LOGGER_pipe_read_req, 
      RX_ACTIVITY_LOGGER_pipe_read_ack  => RX_ACTIVITY_LOGGER_pipe_read_ack ,
      TX_ACTIVITY_LOGGER_pipe_read_data  => TX_ACTIVITY_LOGGER_pipe_read_data, 
      TX_ACTIVITY_LOGGER_pipe_read_req  => TX_ACTIVITY_LOGGER_pipe_read_req, 
      TX_ACTIVITY_LOGGER_pipe_read_ack  => TX_ACTIVITY_LOGGER_pipe_read_ack ,
      mac_to_nic_data_pipe_write_data  => mac_to_nic_data_pipe_write_data, 
      mac_to_nic_data_pipe_write_req  => mac_to_nic_data_pipe_write_req, 
      mac_to_nic_data_pipe_write_ack  => mac_to_nic_data_pipe_write_ack,
      nic_to_mac_transmit_pipe_pipe_read_data  => nic_to_mac_transmit_pipe_pipe_read_data, 
      nic_to_mac_transmit_pipe_pipe_read_req  => nic_to_mac_transmit_pipe_pipe_read_req, 
      nic_to_mac_transmit_pipe_pipe_read_ack  => nic_to_mac_transmit_pipe_pipe_read_ack ); -- 
  -- 
end VhpiLink;
