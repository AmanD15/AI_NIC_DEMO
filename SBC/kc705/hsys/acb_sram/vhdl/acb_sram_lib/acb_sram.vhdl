library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.utilities.all;
library GenericGlueStuff;
use GenericGlueStuff.GenericGlueStuffComponents.all;

entity acb_sram is 

    port( -- 
      ACB_SRAM_REQUEST_WRITE_DATA : in std_logic_vector(109 downto 0);
      ACB_SRAM_REQUEST_WRITE_REQ : in std_logic_vector(0 downto 0);
      ACB_SRAM_REQUEST_WRITE_ACK : out std_logic_vector(0 downto 0);
      ACB_SRAM_RESPONSE_READ_DATA: out std_logic_vector(64 downto 0);
      ACB_SRAM_RESPONSE_READ_REQ : in std_logic_vector(0 downto 0);
      ACB_SRAM_RESPONSE_READ_ACK : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    
end entity;


architecture arch of acb_sram is
    
begin

generic_acb_sram : inst_generic_acb_sram
    generic map(acb_sram_address_width => 18); -- 256KB
    port map(
        MAIN_MEM_REQUEST_PIPE_WRITE_DATA =>  ACB_SRAM_REQUEST_WRITE_DATA,
        MAIN_MEM_REQUEST_PIPE_WRITE_REQ => ACB_SRAM_REQUEST_WRITE_REQ,
        MAIN_MEM_REQUEST_PIPE_WRITE_ACK => ACB_SRAM_REQUEST_WRITE_ACK,

        MAIN_MEM_RESPONSE_PIPE_READ_DATA => ACB_SRAM_RESPONSE_READ_DATA,
        MAIN_MEM_RESPONSE_PIPE_READ_REQ => ACB_SRAM_RESPONSE_READ_REQ,
        MAIN_MEM_RESPONSE_PIPE_READ_ACK => ACB_SRAM_RESPONSE_READ_ACK,

        clk => clk,
        reset =>reset
        );

end arch;
