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
library acb_afb_complex_lib;
--<<<<<
entity acb_afb_complex_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of acb_afb_complex_Test_Bench is -- 
  signal ACB_REQUEST_FROM_NIC_pipe_write_data : std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_NIC_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal ACB_REQUEST_FROM_NIC_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal ACB_REQUEST_FROM_PROCESSOR_pipe_write_data : std_logic_vector(109 downto 0);
  signal ACB_REQUEST_FROM_PROCESSOR_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal ACB_REQUEST_FROM_PROCESSOR_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_FROM_DRAM_pipe_write_data : std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_FROM_DRAM_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal ACB_RESPONSE_FROM_DRAM_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_FLASH_pipe_write_data : std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_FLASH_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal AFB_RESPONSE_FROM_FLASH_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal AFB_RESPONSE_FROM_NIC_pipe_write_data : std_logic_vector(32 downto 0);
  signal AFB_RESPONSE_FROM_NIC_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal AFB_RESPONSE_FROM_NIC_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal MAX_ACB_TAP1_ADDR_pipe_write_data : std_logic_vector(35 downto 0);
  signal MAX_ACB_TAP1_ADDR_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MAX_ACB_TAP1_ADDR_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal MAX_ACB_TAP1_ADDR: std_logic_vector(35 downto 0);
  signal MAX_ACB_TAP2_ADDR_pipe_write_data : std_logic_vector(35 downto 0);
  signal MAX_ACB_TAP2_ADDR_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MAX_ACB_TAP2_ADDR_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal MAX_ACB_TAP2_ADDR: std_logic_vector(35 downto 0);
  signal MIN_ACB_TAP1_ADDR_pipe_write_data : std_logic_vector(35 downto 0);
  signal MIN_ACB_TAP1_ADDR_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MIN_ACB_TAP1_ADDR_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal MIN_ACB_TAP1_ADDR: std_logic_vector(35 downto 0);
  signal MIN_ACB_TAP2_ADDR_pipe_write_data : std_logic_vector(35 downto 0);
  signal MIN_ACB_TAP2_ADDR_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal MIN_ACB_TAP2_ADDR_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal MIN_ACB_TAP2_ADDR: std_logic_vector(35 downto 0);
  signal ACB_REQUEST_TO_DRAM_pipe_read_data : std_logic_vector(109 downto 0);
  signal ACB_REQUEST_TO_DRAM_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal ACB_REQUEST_TO_DRAM_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_NIC_pipe_read_data : std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_NIC_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal ACB_RESPONSE_TO_NIC_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal ACB_RESPONSE_TO_PROCESSOR_pipe_read_data : std_logic_vector(64 downto 0);
  signal ACB_RESPONSE_TO_PROCESSOR_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal ACB_RESPONSE_TO_PROCESSOR_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_FLASH_pipe_read_data : std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_FLASH_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal AFB_REQUEST_TO_FLASH_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal AFB_REQUEST_TO_NIC_pipe_read_data : std_logic_vector(73 downto 0);
  signal AFB_REQUEST_TO_NIC_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal AFB_REQUEST_TO_NIC_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
  component acb_afb_complex is -- 
    port( -- 
      ACB_REQUEST_FROM_NIC_pipe_write_data : in std_logic_vector(109 downto 0);
      ACB_REQUEST_FROM_NIC_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_NIC_pipe_write_ack  : out std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_PROCESSOR_pipe_write_data : in std_logic_vector(109 downto 0);
      ACB_REQUEST_FROM_PROCESSOR_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_FROM_PROCESSOR_pipe_write_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_FROM_DRAM_pipe_write_data : in std_logic_vector(64 downto 0);
      ACB_RESPONSE_FROM_DRAM_pipe_write_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_FROM_DRAM_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_FLASH_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_RESPONSE_FROM_FLASH_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_FLASH_pipe_write_ack  : out std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_NIC_pipe_write_data : in std_logic_vector(32 downto 0);
      AFB_RESPONSE_FROM_NIC_pipe_write_req  : in std_logic_vector(0  downto 0);
      AFB_RESPONSE_FROM_NIC_pipe_write_ack  : out std_logic_vector(0  downto 0);
      MAX_ACB_TAP1_ADDR : in std_logic_vector(35 downto 0);
      MAX_ACB_TAP2_ADDR : in std_logic_vector(35 downto 0);
      MIN_ACB_TAP1_ADDR : in std_logic_vector(35 downto 0);
      MIN_ACB_TAP2_ADDR : in std_logic_vector(35 downto 0);
      ACB_REQUEST_TO_DRAM_pipe_read_data : out std_logic_vector(109 downto 0);
      ACB_REQUEST_TO_DRAM_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_REQUEST_TO_DRAM_pipe_read_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_NIC_pipe_read_data : out std_logic_vector(64 downto 0);
      ACB_RESPONSE_TO_NIC_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_NIC_pipe_read_ack  : out std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_PROCESSOR_pipe_read_data : out std_logic_vector(64 downto 0);
      ACB_RESPONSE_TO_PROCESSOR_pipe_read_req  : in std_logic_vector(0  downto 0);
      ACB_RESPONSE_TO_PROCESSOR_pipe_read_ack  : out std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_FLASH_pipe_read_data : out std_logic_vector(73 downto 0);
      AFB_REQUEST_TO_FLASH_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_FLASH_pipe_read_ack  : out std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_NIC_pipe_read_data : out std_logic_vector(73 downto 0);
      AFB_REQUEST_TO_NIC_pipe_read_req  : in std_logic_vector(0  downto 0);
      AFB_REQUEST_TO_NIC_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for dut :  acb_afb_complex -- 
    use entity acb_afb_complex_lib.acb_afb_complex; -- 
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
      obj_ref := Pack_String_To_Vhpi_String("ACB_REQUEST_FROM_NIC req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      ACB_REQUEST_FROM_NIC_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ACB_REQUEST_FROM_NIC 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,110);
      ACB_REQUEST_FROM_NIC_pipe_write_data <= Unpack_String(val_string,110);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ACB_REQUEST_FROM_NIC ack");
      val_string := Pack_SLV_To_Vhpi_String(ACB_REQUEST_FROM_NIC_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("ACB_REQUEST_FROM_PROCESSOR req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      ACB_REQUEST_FROM_PROCESSOR_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ACB_REQUEST_FROM_PROCESSOR 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,110);
      ACB_REQUEST_FROM_PROCESSOR_pipe_write_data <= Unpack_String(val_string,110);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ACB_REQUEST_FROM_PROCESSOR ack");
      val_string := Pack_SLV_To_Vhpi_String(ACB_REQUEST_FROM_PROCESSOR_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("ACB_RESPONSE_FROM_DRAM req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      ACB_RESPONSE_FROM_DRAM_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ACB_RESPONSE_FROM_DRAM 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,65);
      ACB_RESPONSE_FROM_DRAM_pipe_write_data <= Unpack_String(val_string,65);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ACB_RESPONSE_FROM_DRAM ack");
      val_string := Pack_SLV_To_Vhpi_String(ACB_RESPONSE_FROM_DRAM_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_RESPONSE_FROM_FLASH req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      AFB_RESPONSE_FROM_FLASH_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_RESPONSE_FROM_FLASH 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,33);
      AFB_RESPONSE_FROM_FLASH_pipe_write_data <= Unpack_String(val_string,33);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_RESPONSE_FROM_FLASH ack");
      val_string := Pack_SLV_To_Vhpi_String(AFB_RESPONSE_FROM_FLASH_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_RESPONSE_FROM_NIC req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      AFB_RESPONSE_FROM_NIC_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_RESPONSE_FROM_NIC 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,33);
      AFB_RESPONSE_FROM_NIC_pipe_write_data <= Unpack_String(val_string,33);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_RESPONSE_FROM_NIC ack");
      val_string := Pack_SLV_To_Vhpi_String(AFB_RESPONSE_FROM_NIC_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  MAX_ACB_TAP1_ADDR_pipe_write_ack(0) <= '1';
  TruncateOrPad(MAX_ACB_TAP1_ADDR_pipe_write_data,MAX_ACB_TAP1_ADDR);
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
      obj_ref := Pack_String_To_Vhpi_String("MAX_ACB_TAP1_ADDR req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MAX_ACB_TAP1_ADDR_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MAX_ACB_TAP1_ADDR 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,36);
      wait for 1 ns;
      if (MAX_ACB_TAP1_ADDR_pipe_write_req(0) = '1') then 
      -- 
        MAX_ACB_TAP1_ADDR_pipe_write_data <= Unpack_String(val_string,36);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MAX_ACB_TAP1_ADDR ack");
      val_string := Pack_SLV_To_Vhpi_String(MAX_ACB_TAP1_ADDR_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  MAX_ACB_TAP2_ADDR_pipe_write_ack(0) <= '1';
  TruncateOrPad(MAX_ACB_TAP2_ADDR_pipe_write_data,MAX_ACB_TAP2_ADDR);
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
      obj_ref := Pack_String_To_Vhpi_String("MAX_ACB_TAP2_ADDR req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MAX_ACB_TAP2_ADDR_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MAX_ACB_TAP2_ADDR 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,36);
      wait for 1 ns;
      if (MAX_ACB_TAP2_ADDR_pipe_write_req(0) = '1') then 
      -- 
        MAX_ACB_TAP2_ADDR_pipe_write_data <= Unpack_String(val_string,36);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MAX_ACB_TAP2_ADDR ack");
      val_string := Pack_SLV_To_Vhpi_String(MAX_ACB_TAP2_ADDR_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  MIN_ACB_TAP1_ADDR_pipe_write_ack(0) <= '1';
  TruncateOrPad(MIN_ACB_TAP1_ADDR_pipe_write_data,MIN_ACB_TAP1_ADDR);
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
      obj_ref := Pack_String_To_Vhpi_String("MIN_ACB_TAP1_ADDR req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MIN_ACB_TAP1_ADDR_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MIN_ACB_TAP1_ADDR 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,36);
      wait for 1 ns;
      if (MIN_ACB_TAP1_ADDR_pipe_write_req(0) = '1') then 
      -- 
        MIN_ACB_TAP1_ADDR_pipe_write_data <= Unpack_String(val_string,36);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MIN_ACB_TAP1_ADDR ack");
      val_string := Pack_SLV_To_Vhpi_String(MIN_ACB_TAP1_ADDR_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  MIN_ACB_TAP2_ADDR_pipe_write_ack(0) <= '1';
  TruncateOrPad(MIN_ACB_TAP2_ADDR_pipe_write_data,MIN_ACB_TAP2_ADDR);
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
      obj_ref := Pack_String_To_Vhpi_String("MIN_ACB_TAP2_ADDR req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      MIN_ACB_TAP2_ADDR_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("MIN_ACB_TAP2_ADDR 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,36);
      wait for 1 ns;
      if (MIN_ACB_TAP2_ADDR_pipe_write_req(0) = '1') then 
      -- 
        MIN_ACB_TAP2_ADDR_pipe_write_data <= Unpack_String(val_string,36);
        -- 
      end if;
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("MIN_ACB_TAP2_ADDR ack");
      val_string := Pack_SLV_To_Vhpi_String(MIN_ACB_TAP2_ADDR_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("ACB_REQUEST_TO_DRAM req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      ACB_REQUEST_TO_DRAM_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ACB_REQUEST_TO_DRAM ack");
      val_string := Pack_SLV_To_Vhpi_String(ACB_REQUEST_TO_DRAM_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ACB_REQUEST_TO_DRAM 0");
      val_string := Pack_SLV_To_Vhpi_String(ACB_REQUEST_TO_DRAM_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,110);
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
      obj_ref := Pack_String_To_Vhpi_String("ACB_RESPONSE_TO_NIC req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      ACB_RESPONSE_TO_NIC_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ACB_RESPONSE_TO_NIC ack");
      val_string := Pack_SLV_To_Vhpi_String(ACB_RESPONSE_TO_NIC_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ACB_RESPONSE_TO_NIC 0");
      val_string := Pack_SLV_To_Vhpi_String(ACB_RESPONSE_TO_NIC_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,65);
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
      obj_ref := Pack_String_To_Vhpi_String("ACB_RESPONSE_TO_PROCESSOR req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      ACB_RESPONSE_TO_PROCESSOR_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ACB_RESPONSE_TO_PROCESSOR ack");
      val_string := Pack_SLV_To_Vhpi_String(ACB_RESPONSE_TO_PROCESSOR_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ACB_RESPONSE_TO_PROCESSOR 0");
      val_string := Pack_SLV_To_Vhpi_String(ACB_RESPONSE_TO_PROCESSOR_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,65);
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_REQUEST_TO_FLASH req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      AFB_REQUEST_TO_FLASH_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_REQUEST_TO_FLASH ack");
      val_string := Pack_SLV_To_Vhpi_String(AFB_REQUEST_TO_FLASH_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_REQUEST_TO_FLASH 0");
      val_string := Pack_SLV_To_Vhpi_String(AFB_REQUEST_TO_FLASH_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,74);
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
      obj_ref := Pack_String_To_Vhpi_String("AFB_REQUEST_TO_NIC req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      AFB_REQUEST_TO_NIC_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("AFB_REQUEST_TO_NIC ack");
      val_string := Pack_SLV_To_Vhpi_String(AFB_REQUEST_TO_NIC_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("AFB_REQUEST_TO_NIC 0");
      val_string := Pack_SLV_To_Vhpi_String(AFB_REQUEST_TO_NIC_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,74);
      -- 
    end loop;
    --
  end process;
  dut: acb_afb_complex
  port map ( --
    ACB_REQUEST_FROM_NIC_pipe_write_data => ACB_REQUEST_FROM_NIC_pipe_write_data,
    ACB_REQUEST_FROM_NIC_pipe_write_req => ACB_REQUEST_FROM_NIC_pipe_write_req,
    ACB_REQUEST_FROM_NIC_pipe_write_ack => ACB_REQUEST_FROM_NIC_pipe_write_ack,
    ACB_REQUEST_FROM_PROCESSOR_pipe_write_data => ACB_REQUEST_FROM_PROCESSOR_pipe_write_data,
    ACB_REQUEST_FROM_PROCESSOR_pipe_write_req => ACB_REQUEST_FROM_PROCESSOR_pipe_write_req,
    ACB_REQUEST_FROM_PROCESSOR_pipe_write_ack => ACB_REQUEST_FROM_PROCESSOR_pipe_write_ack,
    ACB_RESPONSE_FROM_DRAM_pipe_write_data => ACB_RESPONSE_FROM_DRAM_pipe_write_data,
    ACB_RESPONSE_FROM_DRAM_pipe_write_req => ACB_RESPONSE_FROM_DRAM_pipe_write_req,
    ACB_RESPONSE_FROM_DRAM_pipe_write_ack => ACB_RESPONSE_FROM_DRAM_pipe_write_ack,
    AFB_RESPONSE_FROM_FLASH_pipe_write_data => AFB_RESPONSE_FROM_FLASH_pipe_write_data,
    AFB_RESPONSE_FROM_FLASH_pipe_write_req => AFB_RESPONSE_FROM_FLASH_pipe_write_req,
    AFB_RESPONSE_FROM_FLASH_pipe_write_ack => AFB_RESPONSE_FROM_FLASH_pipe_write_ack,
    AFB_RESPONSE_FROM_NIC_pipe_write_data => AFB_RESPONSE_FROM_NIC_pipe_write_data,
    AFB_RESPONSE_FROM_NIC_pipe_write_req => AFB_RESPONSE_FROM_NIC_pipe_write_req,
    AFB_RESPONSE_FROM_NIC_pipe_write_ack => AFB_RESPONSE_FROM_NIC_pipe_write_ack,
    MAX_ACB_TAP1_ADDR => MAX_ACB_TAP1_ADDR,
    MAX_ACB_TAP2_ADDR => MAX_ACB_TAP2_ADDR,
    MIN_ACB_TAP1_ADDR => MIN_ACB_TAP1_ADDR,
    MIN_ACB_TAP2_ADDR => MIN_ACB_TAP2_ADDR,
    ACB_REQUEST_TO_DRAM_pipe_read_data => ACB_REQUEST_TO_DRAM_pipe_read_data,
    ACB_REQUEST_TO_DRAM_pipe_read_req => ACB_REQUEST_TO_DRAM_pipe_read_req,
    ACB_REQUEST_TO_DRAM_pipe_read_ack => ACB_REQUEST_TO_DRAM_pipe_read_ack,
    ACB_RESPONSE_TO_NIC_pipe_read_data => ACB_RESPONSE_TO_NIC_pipe_read_data,
    ACB_RESPONSE_TO_NIC_pipe_read_req => ACB_RESPONSE_TO_NIC_pipe_read_req,
    ACB_RESPONSE_TO_NIC_pipe_read_ack => ACB_RESPONSE_TO_NIC_pipe_read_ack,
    ACB_RESPONSE_TO_PROCESSOR_pipe_read_data => ACB_RESPONSE_TO_PROCESSOR_pipe_read_data,
    ACB_RESPONSE_TO_PROCESSOR_pipe_read_req => ACB_RESPONSE_TO_PROCESSOR_pipe_read_req,
    ACB_RESPONSE_TO_PROCESSOR_pipe_read_ack => ACB_RESPONSE_TO_PROCESSOR_pipe_read_ack,
    AFB_REQUEST_TO_FLASH_pipe_read_data => AFB_REQUEST_TO_FLASH_pipe_read_data,
    AFB_REQUEST_TO_FLASH_pipe_read_req => AFB_REQUEST_TO_FLASH_pipe_read_req,
    AFB_REQUEST_TO_FLASH_pipe_read_ack => AFB_REQUEST_TO_FLASH_pipe_read_ack,
    AFB_REQUEST_TO_NIC_pipe_read_data => AFB_REQUEST_TO_NIC_pipe_read_data,
    AFB_REQUEST_TO_NIC_pipe_read_req => AFB_REQUEST_TO_NIC_pipe_read_req,
    AFB_REQUEST_TO_NIC_pipe_read_ack => AFB_REQUEST_TO_NIC_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;
