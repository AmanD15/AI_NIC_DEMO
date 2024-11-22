-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package tx_deconcat_system_global_package is -- 
  component tx_deconcat_system is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      tx_in_pipe_pipe_write_data: in std_logic_vector(72 downto 0);
      tx_in_pipe_pipe_write_req : in std_logic_vector(0 downto 0);
      tx_in_pipe_pipe_write_ack : out std_logic_vector(0 downto 0);
      tx_out_pipe_pipe_read_data: out std_logic_vector(9 downto 0);
      tx_out_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
      tx_out_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  -- 
end package tx_deconcat_system_global_package;
