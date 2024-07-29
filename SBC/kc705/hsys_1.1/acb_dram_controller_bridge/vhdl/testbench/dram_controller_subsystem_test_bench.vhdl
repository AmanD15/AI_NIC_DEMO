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
library dram_controller_subsystem_lib;
--<<<<<
entity dram_controller_subsystem_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of dram_controller_subsystem_Test_Bench is -- 
  signal CORE_BUS_RESPONSE_pipe_write_data : std_logic_vector(64 downto 0);
  signal CORE_BUS_RESPONSE_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal CORE_BUS_RESPONSE_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal DRAM_CONTROLLER_UI_TO_ACB_pipe_write_data : std_logic_vector(521 downto 0);
  signal DRAM_CONTROLLER_UI_TO_ACB_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal DRAM_CONTROLLER_UI_TO_ACB_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal DRAM_CONTROLLER_UI_TO_ACB: std_logic_vector(521 downto 0);
  signal ACB_TO_DRAM_CONTROLLER_UI_pipe_read_data : std_logic_vector(612 downto 0);
  signal ACB_TO_DRAM_CONTROLLER_UI_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal ACB_TO_DRAM_CONTROLLER_UI_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal ACB_TO_DRAM_CONTROLLER_UI: std_logic_vector(612 downto 0) := (others => '0');
  signal CORE_BUS_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
  signal CORE_BUS_REQUEST_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal CORE_BUS_REQUEST_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
  component dram_controller_subsystem is -- 
    port( -- 
      CORE_BUS_RESPONSE_pipe_write_data : in std_logic_vector(64 downto 0);
      CORE_BUS_RESPONSE_pipe_write_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_RESPONSE_pipe_write_ack  : out std_logic_vector(0  downto 0);
      DRAM_CONTROLLER_UI_TO_ACB : in std_logic_vector(521 downto 0);
      ACB_TO_DRAM_CONTROLLER_UI : out std_logic_vector(612 downto 0);
      CORE_BUS_REQUEST_pipe_read_data : out std_logic_vector(109 downto 0);
      CORE_BUS_REQUEST_pipe_read_req  : in std_logic_vector(0  downto 0);
      CORE_BUS_REQUEST_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for dut :  dram_controller_subsystem -- 
    use entity dram_controller_subsystem_lib.dram_controller_subsystem; -- 
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
      obj_ref := Pack_String_To_Vhpi_String("CORE_BUS_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      CORE_BUS_RESPONSE_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("CORE_BUS_RESPONSE 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,65);
      CORE_BUS_RESPONSE_pipe_write_data <= Unpack_String(val_string,65);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("CORE_BUS_RESPONSE ack");
      val_string := Pack_SLV_To_Vhpi_String(CORE_BUS_RESPONSE_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  DRAM_CONTROLLER_UI_TO_ACB_pipe_write_ack(0) <= '1';
  TruncateOrPad(DRAM_CONTROLLER_UI_TO_ACB_pipe_write_data,DRAM_CONTROLLER_UI_TO_ACB);
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
      obj_ref := Pack_String_To_Vhpi_String("DRAM_CONTROLLER_UI_TO_ACB req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      DRAM_CONTROLLER_UI_TO_ACB_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("DRAM_CONTROLLER_UI_TO_ACB 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,522);
      wait for 1 ns;
      if (DRAM_CONTROLLER_UI_TO_ACB_pipe_write_req(0) = '1') then 
      -- 
        DRAM_CONTROLLER_UI_TO_ACB_pipe_write_data <= Unpack_String(val_string,522);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("DRAM_CONTROLLER_UI_TO_ACB ack");
      val_string := Pack_SLV_To_Vhpi_String(DRAM_CONTROLLER_UI_TO_ACB_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  ACB_TO_DRAM_CONTROLLER_UI_pipe_read_ack(0) <= '1';
  TruncateOrPad(ACB_TO_DRAM_CONTROLLER_UI, ACB_TO_DRAM_CONTROLLER_UI_pipe_read_data);
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
      obj_ref := Pack_String_To_Vhpi_String("ACB_TO_DRAM_CONTROLLER_UI req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      ACB_TO_DRAM_CONTROLLER_UI_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ACB_TO_DRAM_CONTROLLER_UI ack");
      val_string := Pack_SLV_To_Vhpi_String(ACB_TO_DRAM_CONTROLLER_UI_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ACB_TO_DRAM_CONTROLLER_UI 0");
      val_string := Pack_SLV_To_Vhpi_String(ACB_TO_DRAM_CONTROLLER_UI_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,613);
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
      obj_ref := Pack_String_To_Vhpi_String("CORE_BUS_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      CORE_BUS_REQUEST_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("CORE_BUS_REQUEST ack");
      val_string := Pack_SLV_To_Vhpi_String(CORE_BUS_REQUEST_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("CORE_BUS_REQUEST 0");
      val_string := Pack_SLV_To_Vhpi_String(CORE_BUS_REQUEST_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,110);
      -- 
    end loop;
    --
  end process;
  dut: dram_controller_subsystem
  port map ( --
    CORE_BUS_RESPONSE_pipe_write_data => CORE_BUS_RESPONSE_pipe_write_data,
    CORE_BUS_RESPONSE_pipe_write_req => CORE_BUS_RESPONSE_pipe_write_req,
    CORE_BUS_RESPONSE_pipe_write_ack => CORE_BUS_RESPONSE_pipe_write_ack,
    DRAM_CONTROLLER_UI_TO_ACB => DRAM_CONTROLLER_UI_TO_ACB,
    ACB_TO_DRAM_CONTROLLER_UI => ACB_TO_DRAM_CONTROLLER_UI,
    CORE_BUS_REQUEST_pipe_read_data => CORE_BUS_REQUEST_pipe_read_data,
    CORE_BUS_REQUEST_pipe_read_req => CORE_BUS_REQUEST_pipe_read_req,
    CORE_BUS_REQUEST_pipe_read_ack => CORE_BUS_REQUEST_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;
