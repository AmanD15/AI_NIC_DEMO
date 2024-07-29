library ieee;
use ieee.std_logic_1164.all;

package AiMlAddonsComponents is
  component genericSinglePortMemory_Operator is

	generic ( data_width: integer := 32; address_width: integer := 32);
	port (sample_req: in boolean;
		sample_ack: out boolean;
		update_req: in boolean;
		update_ack: out boolean;

		enable: in std_logic_vector(0 downto 0);	
		write_bar: in std_logic_vector(0 downto 0);	
		write_data: in std_logic_vector(data_width-1 downto 0);
		read_data: out std_logic_vector(data_width-1 downto 0);
		address: in std_logic_vector(address_width-1 downto 0);

		clk,reset: in std_logic);

  end component genericSinglePortMemory_Operator;
  component genericDualPortMemory_Operator is

	generic ( data_width: integer := 32; address_width: integer := 32);
	port (sample_req: in boolean;
		sample_ack: out boolean;
		update_req: in boolean;
		update_ack: out boolean;

		enable_0: in std_logic_vector(0 downto 0);	
		write_bar_0: in std_logic_vector(0 downto 0);	
		write_data_0: in std_logic_vector(data_width-1 downto 0);
		read_data_0: out std_logic_vector(data_width-1 downto 0);
		address_0: in std_logic_vector(address_width-1 downto 0);

		enable_1: in std_logic_vector(0 downto 0);	
		write_bar_1: in std_logic_vector(0 downto 0);	
		write_data_1: in std_logic_vector(data_width-1 downto 0);
		read_data_1: out std_logic_vector(data_width-1 downto 0);
		address_1: in std_logic_vector(address_width-1 downto 0);

		clk,reset: in std_logic);

  end component genericDualPortMemory_Operator;
  component memoryXsingleX24X64_Operator is
	port (  
		sample_req: in boolean;
		sample_ack: out boolean;
		update_req: in boolean;
		update_ack: out boolean;

		enable: in std_logic_vector(0 downto 0);	
		write_bar: in std_logic_vector(0 downto 0);	
		write_data: in std_logic_vector(64-1 downto 0);
		read_data: out std_logic_vector(64-1 downto 0);
		address: in std_logic_vector(19-1 downto 0);

		clk,reset: in std_logic);
  end component;

end package;
