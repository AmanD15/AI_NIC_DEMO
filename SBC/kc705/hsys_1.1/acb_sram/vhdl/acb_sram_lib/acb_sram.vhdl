library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.mem_component_pack.all;
use ahir.utilities.all;
library GenericGlueStuff;
use GenericGlueStuff.GenericGlueStuffComponents.all;

entity acb_sram is 

    port( -- 
      ACB_SRAM_REQUEST_pipe_write_data : in std_logic_vector(109 downto 0);
      ACB_SRAM_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
      ACB_SRAM_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0);
      ACB_SRAM_RESPONSE_pipe_read_data: out std_logic_vector(64 downto 0);
      ACB_SRAM_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      ACB_SRAM_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      clk, reset: in std_logic 
      -- 
    );
    
end entity;


architecture arch of acb_sram is
    
begin

inst_generic_acb_sram : generic_acb_sram
    generic map(acb_sram_address_width => 18) -- 256KB
    port map(
        MAIN_MEM_REQUEST_PIPE_WRITE_DATA =>  ACB_SRAM_REQUEST_pipe_write_data,
        MAIN_MEM_REQUEST_PIPE_WRITE_REQ => ACB_SRAM_REQUEST_pipe_write_req,
        MAIN_MEM_REQUEST_PIPE_WRITE_ACK => ACB_SRAM_REQUEST_pipe_write_ack,

        MAIN_MEM_RESPONSE_PIPE_READ_DATA => ACB_SRAM_RESPONSE_pipe_read_data,
        MAIN_MEM_RESPONSE_PIPE_READ_REQ => ACB_SRAM_RESPONSE_pipe_read_req,
        MAIN_MEM_RESPONSE_PIPE_READ_ACK => ACB_SRAM_RESPONSE_pipe_read_ack,

        clk => clk,
        reset =>reset
        );

end arch;
