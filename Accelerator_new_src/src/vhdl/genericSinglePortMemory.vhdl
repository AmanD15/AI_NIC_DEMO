library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_component_pack.all;
use ahir.BaseComponents.all;

entity genericSinglePortMemory_Operator is

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

end entity genericSinglePortMemory_Operator;


architecture SimpleBehavioural of genericSinglePortMemory_Operator is
	signal jsig: boolean;
	signal enable_sig: std_logic;
begin
	ji: join2 generic map (bypass => true, name => "genericSinglePortMemory:join2")
		port map (pred0 => sample_req, pred1 => update_req, symbol_out => jsig,
					clk => clk, reset => reset);

	enable_sig <= '1' when jsig else '0';

	sample_ack <= jsig;

	process(clk, reset)
	begin
		if(clk'event and (clk = '1')) then
			if(reset = '1') then
				update_ack <= false;
			else
				update_ack <= jsig;
			end if;
		end if;
	end process;

	bb: base_bank
		generic map (name => "genericSinglePortMemory:bb", g_addr_width => address_width,
					g_data_width => data_width)
		port map(
				datain => write_data,
				dataout => read_data,
				enable => enable_sig,
				writebar => write_bar(0),
				addrin => address,
				clk => clk, reset => reset);

end SimpleBehavioural;

