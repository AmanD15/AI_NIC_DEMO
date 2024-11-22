library ieee;
use ieee.std_logic_1164.all;

library GenericGlueStuff;
use  GenericGlueStuff.GenericGlueStuffComponents.all;

entity acb_sram_256KB is -- 
    port( -- 
      MAIN_MEM_REQUEST_PIPE_WRITE_DATA : in std_logic_vector(109 downto 0);
      MAIN_MEM_REQUEST_PIPE_WRITE_REQ : in std_logic_vector(0 downto 0);
      MAIN_MEM_REQUEST_PIPE_WRITE_ACK : out std_logic_vector(0 downto 0);
      MAIN_MEM_RESPONSE_PIPE_READ_DATA : out std_logic_vector(64 downto 0);
      MAIN_MEM_RESPONSE_PIPE_READ_REQ : in std_logic_vector(0 downto 0);
      MAIN_MEM_RESPONSE_PIPE_READ_ACK : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
end entity;

architecture Trivial of acb_sram_256KB is
begin
	base_inst: generic_acb_sram 
		generic map (acb_sram_address_width => 18)
		port map  (
			-- TODO
		);
end Trivial;


