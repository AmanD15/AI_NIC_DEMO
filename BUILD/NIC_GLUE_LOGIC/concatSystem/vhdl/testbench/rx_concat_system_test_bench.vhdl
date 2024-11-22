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
library nic_mac_bridge_lib;
use nic_mac_bridge_lib.rx_concat_system_global_package.all;
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;
entity rx_concat_system_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of rx_concat_system_Test_Bench is -- 
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal rx_concat_tag_in: std_logic_vector(1 downto 0);
  signal rx_concat_tag_out: std_logic_vector(1 downto 0);
  signal rx_concat_start_req : std_logic := '0';
  signal rx_concat_start_ack : std_logic := '0';
  signal rx_concat_fin_req   : std_logic := '0';
  signal rx_concat_fin_ack   : std_logic := '0';
  -- write to pipe rx_in_pipe
  signal rx_in_pipe_pipe_write_data: std_logic_vector(9 downto 0);
  signal rx_in_pipe_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal rx_in_pipe_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe rx_out_pipe
  signal rx_out_pipe_pipe_read_data: std_logic_vector(72 downto 0);
  signal rx_out_pipe_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal rx_out_pipe_pipe_read_ack : std_logic_vector(0 downto 0);
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
      obj_ref := Pack_String_To_Vhpi_String("rx_in_pipe req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      rx_in_pipe_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("rx_in_pipe 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,10);
      rx_in_pipe_pipe_write_data <= Unpack_String(port_val_string,10);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("rx_in_pipe ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(rx_in_pipe_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("rx_out_pipe req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      rx_out_pipe_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("rx_out_pipe ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(rx_out_pipe_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("rx_out_pipe 0");
      port_val_string := Pack_SLV_To_Vhpi_String(rx_out_pipe_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,73);
      -- 
    end loop;
    --
  end process;
  rx_concat_system_instance: rx_concat_system -- 
    port map ( -- 
      clk => clk,
      reset => reset,
      rx_in_pipe_pipe_write_data  => rx_in_pipe_pipe_write_data, 
      rx_in_pipe_pipe_write_req  => rx_in_pipe_pipe_write_req, 
      rx_in_pipe_pipe_write_ack  => rx_in_pipe_pipe_write_ack,
      rx_out_pipe_pipe_read_data  => rx_out_pipe_pipe_read_data, 
      rx_out_pipe_pipe_read_req  => rx_out_pipe_pipe_read_req, 
      rx_out_pipe_pipe_read_ack  => rx_out_pipe_pipe_read_ack ); -- 
  -- 
end VhpiLink;
