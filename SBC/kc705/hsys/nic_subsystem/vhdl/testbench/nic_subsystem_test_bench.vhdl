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
library nic_subsystem_lib;
--<<<<<
entity nic_subsystem_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of nic_subsystem_Test_Bench is -- 
  signal AFB_NIC_REGISTER_REQUEST_pipe_write_data : std_logic_vector(73 downto 0);
  signal AFB_NIC_REGISTER_REQUEST_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal AFB_NIC_REGISTER_REQUEST_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal MAC_TO_NIC_DATA_pipe_write_data : std_logic_vector(9 downto 0);
  signal MAC_TO_NIC_DATA_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MAC_TO_NIC_DATA_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal NIC_ACB_MEMORY_RESPONSE_pipe_write_data : std_logic_vector(64 downto 0);
  signal NIC_ACB_MEMORY_RESPONSE_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal NIC_ACB_MEMORY_RESPONSE_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal AFB_NIC_REGISTER_RESPONSE_pipe_read_data : std_logic_vector(32 downto 0);
  signal AFB_NIC_REGISTER_RESPONSE_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal AFB_NIC_REGISTER_RESPONSE_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal NIC_ACB_MEMORY_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
  signal NIC_ACB_MEMORY_REQUEST_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal NIC_ACB_MEMORY_REQUEST_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal NIC_INTERRUPT_TO_PROCESSOR_pipe_read_data : std_logic_vector(0 downto 0);
  signal NIC_INTERRUPT_TO_PROCESSOR_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal NIC_INTERRUPT_TO_PROCESSOR_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal NIC_INTERRUPT_TO_PROCESSOR: std_logic_vector(0 downto 0) := (others => '0');
  signal NIC_TO_MAC_DATA_pipe_read_data : std_logic_vector(9 downto 0);
  signal NIC_TO_MAC_DATA_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal NIC_TO_MAC_DATA_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal NIC_TO_MAC_RESET_N_pipe_read_data : std_logic_vector(0 downto 0);
  signal NIC_TO_MAC_RESET_N_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal NIC_TO_MAC_RESET_N_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal NIC_TO_MAC_RESET_N: std_logic_vector(0 downto 0) := (others => '0');
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
  component nic_subsystem is -- 
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
  end component;
  -->>>>>
  for dut :  nic_subsystem -- 
    use entity nic_subsystem_lib.nic_subsystem; -- 
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REGISTER_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      AFB_NIC_REGISTER_REQUEST_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REGISTER_REQUEST 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,74);
      AFB_NIC_REGISTER_REQUEST_pipe_write_data <= Unpack_String(val_string,74);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REGISTER_REQUEST ack");
      val_string := Pack_SLV_To_Vhpi_String(AFB_NIC_REGISTER_REQUEST_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("MAC_TO_NIC_DATA req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MAC_TO_NIC_DATA_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MAC_TO_NIC_DATA 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,10);
      MAC_TO_NIC_DATA_pipe_write_data <= Unpack_String(val_string,10);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MAC_TO_NIC_DATA ack");
      val_string := Pack_SLV_To_Vhpi_String(MAC_TO_NIC_DATA_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_ACB_MEMORY_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      NIC_ACB_MEMORY_RESPONSE_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_ACB_MEMORY_RESPONSE 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,65);
      NIC_ACB_MEMORY_RESPONSE_pipe_write_data <= Unpack_String(val_string,65);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_ACB_MEMORY_RESPONSE ack");
      val_string := Pack_SLV_To_Vhpi_String(NIC_ACB_MEMORY_RESPONSE_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REGISTER_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      AFB_NIC_REGISTER_RESPONSE_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REGISTER_RESPONSE ack");
      val_string := Pack_SLV_To_Vhpi_String(AFB_NIC_REGISTER_RESPONSE_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_NIC_REGISTER_RESPONSE 0");
      val_string := Pack_SLV_To_Vhpi_String(AFB_NIC_REGISTER_RESPONSE_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,33);
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_ACB_MEMORY_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      NIC_ACB_MEMORY_REQUEST_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_ACB_MEMORY_REQUEST ack");
      val_string := Pack_SLV_To_Vhpi_String(NIC_ACB_MEMORY_REQUEST_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_ACB_MEMORY_REQUEST 0");
      val_string := Pack_SLV_To_Vhpi_String(NIC_ACB_MEMORY_REQUEST_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,110);
      -- 
    end loop;
    --
  end process;
  NIC_INTERRUPT_TO_PROCESSOR_pipe_read_ack(0) <= '1';
  TruncateOrPad(NIC_INTERRUPT_TO_PROCESSOR, NIC_INTERRUPT_TO_PROCESSOR_pipe_read_data);
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_INTERRUPT_TO_PROCESSOR req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      NIC_INTERRUPT_TO_PROCESSOR_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_INTERRUPT_TO_PROCESSOR ack");
      val_string := Pack_SLV_To_Vhpi_String(NIC_INTERRUPT_TO_PROCESSOR_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_INTERRUPT_TO_PROCESSOR 0");
      val_string := Pack_SLV_To_Vhpi_String(NIC_INTERRUPT_TO_PROCESSOR_pipe_read_data);
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MAC_DATA req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      NIC_TO_MAC_DATA_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MAC_DATA ack");
      val_string := Pack_SLV_To_Vhpi_String(NIC_TO_MAC_DATA_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MAC_DATA 0");
      val_string := Pack_SLV_To_Vhpi_String(NIC_TO_MAC_DATA_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,10);
      -- 
    end loop;
    --
  end process;
  NIC_TO_MAC_RESET_N_pipe_read_ack(0) <= '1';
  TruncateOrPad(NIC_TO_MAC_RESET_N, NIC_TO_MAC_RESET_N_pipe_read_data);
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
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MAC_RESET_N req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      NIC_TO_MAC_RESET_N_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MAC_RESET_N ack");
      val_string := Pack_SLV_To_Vhpi_String(NIC_TO_MAC_RESET_N_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("NIC_TO_MAC_RESET_N 0");
      val_string := Pack_SLV_To_Vhpi_String(NIC_TO_MAC_RESET_N_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  dut: nic_subsystem
  port map ( --
    AFB_NIC_REGISTER_REQUEST_pipe_write_data => AFB_NIC_REGISTER_REQUEST_pipe_write_data,
    AFB_NIC_REGISTER_REQUEST_pipe_write_req => AFB_NIC_REGISTER_REQUEST_pipe_write_req,
    AFB_NIC_REGISTER_REQUEST_pipe_write_ack => AFB_NIC_REGISTER_REQUEST_pipe_write_ack,
    MAC_TO_NIC_DATA_pipe_write_data => MAC_TO_NIC_DATA_pipe_write_data,
    MAC_TO_NIC_DATA_pipe_write_req => MAC_TO_NIC_DATA_pipe_write_req,
    MAC_TO_NIC_DATA_pipe_write_ack => MAC_TO_NIC_DATA_pipe_write_ack,
    NIC_ACB_MEMORY_RESPONSE_pipe_write_data => NIC_ACB_MEMORY_RESPONSE_pipe_write_data,
    NIC_ACB_MEMORY_RESPONSE_pipe_write_req => NIC_ACB_MEMORY_RESPONSE_pipe_write_req,
    NIC_ACB_MEMORY_RESPONSE_pipe_write_ack => NIC_ACB_MEMORY_RESPONSE_pipe_write_ack,
    AFB_NIC_REGISTER_RESPONSE_pipe_read_data => AFB_NIC_REGISTER_RESPONSE_pipe_read_data,
    AFB_NIC_REGISTER_RESPONSE_pipe_read_req => AFB_NIC_REGISTER_RESPONSE_pipe_read_req,
    AFB_NIC_REGISTER_RESPONSE_pipe_read_ack => AFB_NIC_REGISTER_RESPONSE_pipe_read_ack,
    NIC_ACB_MEMORY_REQUEST_pipe_read_data => NIC_ACB_MEMORY_REQUEST_pipe_read_data,
    NIC_ACB_MEMORY_REQUEST_pipe_read_req => NIC_ACB_MEMORY_REQUEST_pipe_read_req,
    NIC_ACB_MEMORY_REQUEST_pipe_read_ack => NIC_ACB_MEMORY_REQUEST_pipe_read_ack,
    NIC_INTERRUPT_TO_PROCESSOR => NIC_INTERRUPT_TO_PROCESSOR,
    NIC_TO_MAC_DATA_pipe_read_data => NIC_TO_MAC_DATA_pipe_read_data,
    NIC_TO_MAC_DATA_pipe_read_req => NIC_TO_MAC_DATA_pipe_read_req,
    NIC_TO_MAC_DATA_pipe_read_ack => NIC_TO_MAC_DATA_pipe_read_ack,
    NIC_TO_MAC_RESET_N => NIC_TO_MAC_RESET_N,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;
