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
library ajit_processor_lib;
--<<<<<
entity processor_1x1x32_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of processor_1x1x32_Test_Bench is -- 
  signal CONSOLE_to_SERIAL_RX_pipe_write_data : std_logic_vector(7 downto 0);
  signal CONSOLE_to_SERIAL_RX_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal CONSOLE_to_SERIAL_RX_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal EXTERNAL_INTERRUPT_pipe_write_data : std_logic_vector(0 downto 0);
  signal EXTERNAL_INTERRUPT_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal EXTERNAL_INTERRUPT_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal EXTERNAL_INTERRUPT: std_logic_vector(0 downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_write_data : std_logic_vector(29 downto 0);
  signal MAIN_MEM_INVALIDATE_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MAIN_MEM_INVALIDATE_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal MAIN_MEM_RESPONSE_pipe_write_data : std_logic_vector(64 downto 0);
  signal MAIN_MEM_RESPONSE_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MAIN_MEM_RESPONSE_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal SOC_MONITOR_to_DEBUG_pipe_write_data : std_logic_vector(7 downto 0);
  signal SOC_MONITOR_to_DEBUG_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal SOC_MONITOR_to_DEBUG_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal THREAD_RESET_pipe_write_data : std_logic_vector(3 downto 0);
  signal THREAD_RESET_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal THREAD_RESET_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal THREAD_RESET: std_logic_vector(3 downto 0);
  signal MAIN_MEM_REQUEST_pipe_read_data : std_logic_vector(109 downto 0);
  signal MAIN_MEM_REQUEST_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MAIN_MEM_REQUEST_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal PROCESSOR_MODE_pipe_read_data : std_logic_vector(15 downto 0);
  signal PROCESSOR_MODE_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal PROCESSOR_MODE_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal PROCESSOR_MODE: std_logic_vector(15 downto 0) := (others => '0');
  signal SERIAL_TX_to_CONSOLE_pipe_read_data : std_logic_vector(7 downto 0);
  signal SERIAL_TX_to_CONSOLE_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal SERIAL_TX_to_CONSOLE_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal SOC_DEBUG_to_MONITOR_pipe_read_data : std_logic_vector(7 downto 0);
  signal SOC_DEBUG_to_MONITOR_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal SOC_DEBUG_to_MONITOR_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
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
  for dut :  processor_1x1x32 -- 
    use entity ajit_processor_lib.processor_1x1x32; -- 
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
      obj_ref := Pack_String_To_Vhpi_String("CONSOLE_to_SERIAL_RX req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      CONSOLE_to_SERIAL_RX_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("CONSOLE_to_SERIAL_RX 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,8);
      CONSOLE_to_SERIAL_RX_pipe_write_data <= Unpack_String(val_string,8);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("CONSOLE_to_SERIAL_RX ack");
      val_string := Pack_SLV_To_Vhpi_String(CONSOLE_to_SERIAL_RX_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  EXTERNAL_INTERRUPT_pipe_write_ack(0) <= '1';
  TruncateOrPad(EXTERNAL_INTERRUPT_pipe_write_data,EXTERNAL_INTERRUPT);
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
      obj_ref := Pack_String_To_Vhpi_String("EXTERNAL_INTERRUPT req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      EXTERNAL_INTERRUPT_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("EXTERNAL_INTERRUPT 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      wait for 1 ns;
      if (EXTERNAL_INTERRUPT_pipe_write_req(0) = '1') then 
      -- 
        EXTERNAL_INTERRUPT_pipe_write_data <= Unpack_String(val_string,1);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("EXTERNAL_INTERRUPT ack");
      val_string := Pack_SLV_To_Vhpi_String(EXTERNAL_INTERRUPT_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_INVALIDATE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MAIN_MEM_INVALIDATE_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_INVALIDATE 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,30);
      MAIN_MEM_INVALIDATE_pipe_write_data <= Unpack_String(val_string,30);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_INVALIDATE ack");
      val_string := Pack_SLV_To_Vhpi_String(MAIN_MEM_INVALIDATE_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_RESPONSE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MAIN_MEM_RESPONSE_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_RESPONSE 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,65);
      MAIN_MEM_RESPONSE_pipe_write_data <= Unpack_String(val_string,65);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_RESPONSE ack");
      val_string := Pack_SLV_To_Vhpi_String(MAIN_MEM_RESPONSE_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("SOC_MONITOR_to_DEBUG req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      SOC_MONITOR_to_DEBUG_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("SOC_MONITOR_to_DEBUG 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,8);
      SOC_MONITOR_to_DEBUG_pipe_write_data <= Unpack_String(val_string,8);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("SOC_MONITOR_to_DEBUG ack");
      val_string := Pack_SLV_To_Vhpi_String(SOC_MONITOR_to_DEBUG_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  THREAD_RESET_pipe_write_ack(0) <= '1';
  TruncateOrPad(THREAD_RESET_pipe_write_data,THREAD_RESET);
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
      obj_ref := Pack_String_To_Vhpi_String("THREAD_RESET req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      THREAD_RESET_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("THREAD_RESET 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,4);
      wait for 1 ns;
      if (THREAD_RESET_pipe_write_req(0) = '1') then 
      -- 
        THREAD_RESET_pipe_write_data <= Unpack_String(val_string,4);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("THREAD_RESET ack");
      val_string := Pack_SLV_To_Vhpi_String(THREAD_RESET_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_REQUEST req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MAIN_MEM_REQUEST_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_REQUEST ack");
      val_string := Pack_SLV_To_Vhpi_String(MAIN_MEM_REQUEST_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MAIN_MEM_REQUEST 0");
      val_string := Pack_SLV_To_Vhpi_String(MAIN_MEM_REQUEST_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,110);
      -- 
    end loop;
    --
  end process;
  PROCESSOR_MODE_pipe_read_ack(0) <= '1';
  TruncateOrPad(PROCESSOR_MODE, PROCESSOR_MODE_pipe_read_data);
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
      obj_ref := Pack_String_To_Vhpi_String("PROCESSOR_MODE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      PROCESSOR_MODE_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("PROCESSOR_MODE ack");
      val_string := Pack_SLV_To_Vhpi_String(PROCESSOR_MODE_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("PROCESSOR_MODE 0");
      val_string := Pack_SLV_To_Vhpi_String(PROCESSOR_MODE_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,16);
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
      obj_ref := Pack_String_To_Vhpi_String("SERIAL_TX_to_CONSOLE req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      SERIAL_TX_to_CONSOLE_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("SERIAL_TX_to_CONSOLE ack");
      val_string := Pack_SLV_To_Vhpi_String(SERIAL_TX_to_CONSOLE_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("SERIAL_TX_to_CONSOLE 0");
      val_string := Pack_SLV_To_Vhpi_String(SERIAL_TX_to_CONSOLE_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,8);
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
      obj_ref := Pack_String_To_Vhpi_String("SOC_DEBUG_to_MONITOR req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      SOC_DEBUG_to_MONITOR_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("SOC_DEBUG_to_MONITOR ack");
      val_string := Pack_SLV_To_Vhpi_String(SOC_DEBUG_to_MONITOR_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("SOC_DEBUG_to_MONITOR 0");
      val_string := Pack_SLV_To_Vhpi_String(SOC_DEBUG_to_MONITOR_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,8);
      -- 
    end loop;
    --
  end process;
  dut: processor_1x1x32
  port map ( --
    CONSOLE_to_SERIAL_RX_pipe_write_data => CONSOLE_to_SERIAL_RX_pipe_write_data,
    CONSOLE_to_SERIAL_RX_pipe_write_req => CONSOLE_to_SERIAL_RX_pipe_write_req,
    CONSOLE_to_SERIAL_RX_pipe_write_ack => CONSOLE_to_SERIAL_RX_pipe_write_ack,
    EXTERNAL_INTERRUPT => EXTERNAL_INTERRUPT,
    MAIN_MEM_INVALIDATE_pipe_write_data => MAIN_MEM_INVALIDATE_pipe_write_data,
    MAIN_MEM_INVALIDATE_pipe_write_req => MAIN_MEM_INVALIDATE_pipe_write_req,
    MAIN_MEM_INVALIDATE_pipe_write_ack => MAIN_MEM_INVALIDATE_pipe_write_ack,
    MAIN_MEM_RESPONSE_pipe_write_data => MAIN_MEM_RESPONSE_pipe_write_data,
    MAIN_MEM_RESPONSE_pipe_write_req => MAIN_MEM_RESPONSE_pipe_write_req,
    MAIN_MEM_RESPONSE_pipe_write_ack => MAIN_MEM_RESPONSE_pipe_write_ack,
    SOC_MONITOR_to_DEBUG_pipe_write_data => SOC_MONITOR_to_DEBUG_pipe_write_data,
    SOC_MONITOR_to_DEBUG_pipe_write_req => SOC_MONITOR_to_DEBUG_pipe_write_req,
    SOC_MONITOR_to_DEBUG_pipe_write_ack => SOC_MONITOR_to_DEBUG_pipe_write_ack,
    THREAD_RESET => THREAD_RESET,
    MAIN_MEM_REQUEST_pipe_read_data => MAIN_MEM_REQUEST_pipe_read_data,
    MAIN_MEM_REQUEST_pipe_read_req => MAIN_MEM_REQUEST_pipe_read_req,
    MAIN_MEM_REQUEST_pipe_read_ack => MAIN_MEM_REQUEST_pipe_read_ack,
    PROCESSOR_MODE => PROCESSOR_MODE,
    SERIAL_TX_to_CONSOLE_pipe_read_data => SERIAL_TX_to_CONSOLE_pipe_read_data,
    SERIAL_TX_to_CONSOLE_pipe_read_req => SERIAL_TX_to_CONSOLE_pipe_read_req,
    SERIAL_TX_to_CONSOLE_pipe_read_ack => SERIAL_TX_to_CONSOLE_pipe_read_ack,
    SOC_DEBUG_to_MONITOR_pipe_read_data => SOC_DEBUG_to_MONITOR_pipe_read_data,
    SOC_DEBUG_to_MONITOR_pipe_read_req => SOC_DEBUG_to_MONITOR_pipe_read_req,
    SOC_DEBUG_to_MONITOR_pipe_read_ack => SOC_DEBUG_to_MONITOR_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;
