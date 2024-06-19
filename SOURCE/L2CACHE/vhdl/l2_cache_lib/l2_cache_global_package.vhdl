-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package l2_cache_global_package is -- 
  constant default_mem_pool_base_address : std_logic_vector(0 downto 0) := "0";
  component l2_cache is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      L2CACHE_TO_MEM_REQUEST_pipe_read_data: out std_logic_vector(109 downto 0);
      L2CACHE_TO_MEM_REQUEST_pipe_read_req : in std_logic_vector(0 downto 0);
      L2CACHE_TO_MEM_REQUEST_pipe_read_ack : out std_logic_vector(0 downto 0);
      L2_RESPONSE_pipe_read_data: out std_logic_vector(64 downto 0);
      L2_RESPONSE_pipe_read_req : in std_logic_vector(0 downto 0);
      L2_RESPONSE_pipe_read_ack : out std_logic_vector(0 downto 0);
      L2_TO_L1_INVALIDATE_pipe_read_data: out std_logic_vector(29 downto 0);
      L2_TO_L1_INVALIDATE_pipe_read_req : in std_logic_vector(0 downto 0);
      L2_TO_L1_INVALIDATE_pipe_read_ack : out std_logic_vector(0 downto 0);
      MEM_TO_L2CACHE_RESPONSE_pipe_write_data: in std_logic_vector(64 downto 0);
      MEM_TO_L2CACHE_RESPONSE_pipe_write_req : in std_logic_vector(0 downto 0);
      MEM_TO_L2CACHE_RESPONSE_pipe_write_ack : out std_logic_vector(0 downto 0);
      NOBLOCK_L2_INVALIDATE_pipe_write_data: in std_logic_vector(30 downto 0);
      NOBLOCK_L2_INVALIDATE_pipe_write_req : in std_logic_vector(0 downto 0);
      NOBLOCK_L2_INVALIDATE_pipe_write_ack : out std_logic_vector(0 downto 0);
      NOBLOCK_L2_REQUEST_pipe_write_data: in std_logic_vector(110 downto 0);
      NOBLOCK_L2_REQUEST_pipe_write_req : in std_logic_vector(0 downto 0);
      NOBLOCK_L2_REQUEST_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  -- 
end package l2_cache_global_package;
