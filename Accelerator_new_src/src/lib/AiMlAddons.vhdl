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
