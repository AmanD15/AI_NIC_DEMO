library AiMlAddons;
use AiMlAddons.AiMlAddonsComponents.all;

library ieee;
use ieee.std_logic_1164.all;

entity memoryXsingleX24X64_Operator is
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
end entity;

architecture Triv of memoryXsingleX24X64_Operator is 
begin
	core: genericSinglePortMemory_Operator
		generic map (data_width => 64, address_width => 19)
		port map (
			sample_req,
			sample_ack,
			update_req,
			update_ack,
			enable,
			write_bar,
			write_data,
			read_data,
			address,
			clk,reset);

end Triv;
