library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_component_pack.all;
use ahir.BaseComponents.all;

entity genericDualPortMemory_Operator is

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

end entity genericDualPortMemory_Operator;


architecture SimpleBehavioural of genericDualPortMemory_Operator is
	signal jsig: boolean;
	signal enable_sig: std_logic;
	signal enable_sig_0, enable_sig_1: std_logic;
begin
	ji: join2 generic map (bypass => true, name =>  "genericDualPortMemory:join2")
		port map (pred0 => sample_req, pred1 => update_req, symbol_out => jsig,
					clk => clk, reset => reset);

	enable_sig <= '1' when jsig else '0';
	enable_sig_0 <= enable_sig and enable_0(0);
	enable_sig_1 <= enable_sig and enable_1(0);

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

	bb: base_bank_dual_port
		generic map (name => ":genericDualPortMemory:bb", g_addr_width => address_width,
					g_data_width => data_width)
		port map(
				datain_0 => write_data_0,
				dataout_0 => read_data_0,
				enable_0 => enable_sig_0,
				writebar_0 => write_bar_0(0),
				addrin_0 => address_0,

				datain_1 => write_data_1,
				dataout_1 => read_data_1,
				enable_1 => enable_sig_1,
				writebar_1 => write_bar_1(0),
				addrin_1 => address_1,

				clk => clk, reset => reset);

end SimpleBehavioural;

