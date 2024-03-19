library ieee;
use ieee.std_logic_1164.all;


package DualClockedQueuePackage is

	component DualClockedQueue_ACB_req  is
		  port ( 
		    -- read 
		    read_req_in : in std_logic;
		    read_data_out : out std_logic_vector(109 DOWNTO 0);
		    read_ack_out : out std_logic;
		    -- write 
		    write_req_out : out std_logic;
		    write_data_in : in std_logic_vector(109 DOWNTO 0);
		    write_ack_in : in std_logic;
		
		    read_clk : in std_logic;
		    write_clk : in std_logic;
		    
		    reset: in std_logic);	
	end component DualClockedQueue_ACB_req;
	
	component DualClockedQueue_ACB_resp  is
		  port ( 
		    -- read 
		    read_req_in : in std_logic;
		    read_data_out : out std_logic_vector(64 DOWNTO 0);
		    read_ack_out : out std_logic;
		    -- write 
		    write_req_out : out std_logic;
		    write_data_in : in std_logic_vector(64 DOWNTO 0);
		    write_ack_in : in std_logic;
		
		    read_clk : in std_logic;
		    write_clk : in std_logic;
		    
		    reset: in std_logic);	
	end component DualClockedQueue_ACB_resp;
	
	component DualClockedQueue_AFB_req  is
		  port ( 
		    -- read 
		    read_req_in : in std_logic;
		    read_data_out : out std_logic_vector(73 DOWNTO 0);
		    read_ack_out : out std_logic;
		    -- write 
		    write_req_out : out std_logic;
		    write_data_in : in std_logic_vector(73 DOWNTO 0);
		    write_ack_in : in std_logic;
		
		    read_clk : in std_logic;
		    write_clk : in std_logic;
		    
		    reset: in std_logic);	
	end component DualClockedQueue_AFB_req;
	
	component DualClockedQueue_AFB_resp  is
		  port ( 
		    -- read 
		    read_req_in : in std_logic;
		    read_data_out : out std_logic_vector(32 DOWNTO 0);
		    read_ack_out : out std_logic;
		    -- write 
		    write_req_out : out std_logic;
		    write_data_in : in std_logic_vector(32 DOWNTO 0);
		    write_ack_in : in std_logic;
		
		    read_clk : in std_logic;
		    write_clk : in std_logic;
		    
		    reset: in std_logic);	
	end component DualClockedQueue_AFB_resp;
	
end package DualClockedQueuePackage;




LIBRARY ieee;
LIBRARY std;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;

--
-- a dual clocked FIFO with ready-ready protocol
-- at the boundaries.
--
-- instantiates a Xilinx dual-clocked FIFO and
-- matches it to the AHIR ready-ready protocol
-- at the write and read ends.
--
--
entity DualClockedQueue_ACB_req  is
  port ( 
    -- read 
    read_req_in : in std_logic;
    read_data_out : out std_logic_vector(109 DOWNTO 0);
    read_ack_out : out std_logic;
    -- write 
    write_req_out : out std_logic;
    write_data_in : in std_logic_vector(109 DOWNTO 0);
    write_ack_in : in std_logic;

    read_clk : in std_logic;
    write_clk : in std_logic;
    
    reset: in std_logic);	
end entity;


architecture Behavioral  of DualClockedQueue_ACB_req is

  component fifo_generator_acb_req IS
    PORT (
      rst : IN STD_LOGIC;
      wr_clk : IN STD_LOGIC;
      rd_clk : IN STD_LOGIC;
      din : IN STD_LOGIC_VECTOR(109 DOWNTO 0);
      wr_en : IN STD_LOGIC;
      rd_en : IN STD_LOGIC;
      dout : OUT STD_LOGIC_VECTOR(109 DOWNTO 0);
      full : OUT STD_LOGIC;
      empty : OUT STD_LOGIC;
      wr_ack : OUT STD_LOGIC;
      valid : OUT STD_LOGIC
      );
  end component;

  signal read_reset, write_reset: std_logic;

  -- Signals from Dual clock FIFO
  signal fifo_din : STD_LOGIC_VECTOR(109 DOWNTO 0);
  signal fifo_wr_en : STD_LOGIC;
  signal fifo_rd_en : STD_LOGIC;
  signal fifo_dout : STD_LOGIC_VECTOR(109 DOWNTO 0);
  signal fifo_full : STD_LOGIC;
  signal fifo_empty : STD_LOGIC;
  signal fifo_wr_ack : STD_LOGIC;
  signal fifo_valid : STD_LOGIC;
  
  
  type ReadState  is (Empty, Full);
  signal read_data_register: STD_LOGIC_VECTOR(109 DOWNTO 0);
  signal read_state : ReadState;

  
begin

  -- reset synchronizers.
  process(reset, write_clk)
  begin
	if(reset = '1') then
		write_reset <= '1';
	elsif (write_clk'event and write_clk = '1') then
		write_reset <= '0';
	end if;
  end process;

  
  process(reset, read_clk)
  begin
	if(reset = '1') then
		read_reset <= '1';
	elsif (read_clk'event and read_clk = '1') then
		read_reset <= '0';
	end if;
  end process;

  -- the FSM interfacing the riffa read interface to the fifo
  READFSM : process (read_state, read_clk, read_reset, read_req_in, fifo_valid, fifo_dout, fifo_empty)		------------
    variable next_state : ReadState;
    variable read_data_out_var : STD_LOGIC_VECTOR(109 DOWNTO 0);
    variable fifo_rd_en_var, read_ack_out_var : std_logic;
    variable latch_var : boolean;
  begin

    read_ack_out_var := '0';
    next_state := read_state;
    fifo_rd_en_var := '0';
    latch_var := false;
    
    case read_state is
      when Empty =>
        if (fifo_empty = '0') then
          fifo_rd_en_var := '1';
          next_state := Full;
        end if;
      when Full =>
	-- Note: ack is expected as long as fifo-empty = '0'.
	read_ack_out_var := '1';
        if ((read_req_in  = '1') and (fifo_empty = '0'))  then
          fifo_rd_en_var := '1';
        elsif ((read_req_in = '1') and (fifo_empty = '1')) then
	  next_state := Empty;
        end if;
    end case;

    -- immediate outputs
    read_data_out <= fifo_dout ;
    fifo_rd_en <= fifo_rd_en_var ;
    read_ack_out <= read_ack_out_var ;    

    -- delayed actions.
    if (read_clk'event and read_clk = '1') then
      if read_reset = '1' then
        read_state <= Empty;
      else
        read_state <= next_state;
      end if;			
    end if;
  end process;

  -- write logic. interface AHIR protocol to 
  -- fifo write protocol.  Simple.
  write_req_out <= (not fifo_full);
  fifo_wr_en <=  ((not fifo_full) and write_ack_in);
  fifo_din   <= write_data_in;

  dual_clock_fifo : fifo_generator_acb_req
    port map(rst => reset,
             wr_clk => write_clk,
             rd_clk => read_clk,
             din => fifo_din,
             wr_en => fifo_wr_en,
             rd_en => fifo_rd_en,
             dout => fifo_dout,
             full => fifo_full,
             empty => fifo_empty,
             valid => fifo_valid,
             wr_ack => fifo_wr_ack);
  
end Behavioral ;

LIBRARY ieee;
LIBRARY std;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;

--
-- a dual clocked FIFO with ready-ready protocol
-- at the boundaries.
--
-- instantiates a Xilinx dual-clocked FIFO and
-- matches it to the AHIR ready-ready protocol
-- at the write and read ends.
--
--
entity DualClockedQueue_ACB_resp  is
  port ( 
    -- read 
    read_req_in : in std_logic;
    read_data_out : out std_logic_vector(64 DOWNTO 0);
    read_ack_out : out std_logic;
    -- write 
    write_req_out : out std_logic;
    write_data_in : in std_logic_vector(64 DOWNTO 0);
    write_ack_in : in std_logic;

    read_clk : in std_logic;
    write_clk : in std_logic;
    
    reset: in std_logic);	
end entity;


architecture Behavioral  of DualClockedQueue_ACB_resp is

  component fifo_generator_acb_resp IS
    PORT (
      rst : IN STD_LOGIC;
      wr_clk : IN STD_LOGIC;
      rd_clk : IN STD_LOGIC;
      din : IN STD_LOGIC_VECTOR(64 DOWNTO 0);
      wr_en : IN STD_LOGIC;
      rd_en : IN STD_LOGIC;
      dout : OUT STD_LOGIC_VECTOR(64 DOWNTO 0);
      full : OUT STD_LOGIC;
      empty : OUT STD_LOGIC;
      wr_ack : OUT STD_LOGIC;
      valid : OUT STD_LOGIC
      );
  end component;

  signal read_reset, write_reset: std_logic;

  -- Signals from Dual clock FIFO
  signal fifo_din : STD_LOGIC_VECTOR(64 DOWNTO 0);
  signal fifo_wr_en : STD_LOGIC;
  signal fifo_rd_en : STD_LOGIC;
  signal fifo_dout : STD_LOGIC_VECTOR(64 DOWNTO 0);
  signal fifo_full : STD_LOGIC;
  signal fifo_empty : STD_LOGIC;
  signal fifo_wr_ack : STD_LOGIC;
  signal fifo_valid : STD_LOGIC;
  
  
  type ReadState  is (Empty, Full);
  signal read_data_register: STD_LOGIC_VECTOR(64 DOWNTO 0);
  signal read_state : ReadState;

  
begin

  -- reset synchronizers.
  process(reset, write_clk)
  begin
	if(reset = '1') then
		write_reset <= '1';
	elsif (write_clk'event and write_clk = '1') then
		write_reset <= '0';
	end if;
  end process;

  
  process(reset, read_clk)
  begin
	if(reset = '1') then
		read_reset <= '1';
	elsif (read_clk'event and read_clk = '1') then
		read_reset <= '0';
	end if;
  end process;

  -- the FSM interfacing the riffa read interface to the fifo
  READFSM : process (read_state, read_clk, read_reset, read_req_in, fifo_valid, fifo_dout, fifo_empty)		------------
    variable next_state : ReadState;
    variable read_data_out_var : STD_LOGIC_VECTOR(64 DOWNTO 0);
    variable fifo_rd_en_var, read_ack_out_var : std_logic;
    variable latch_var : boolean;
  begin

    read_ack_out_var := '0';
    next_state := read_state;
    fifo_rd_en_var := '0';
    latch_var := false;
    
    case read_state is
      when Empty =>
        if (fifo_empty = '0') then
          fifo_rd_en_var := '1';
          next_state := Full;
        end if;
      when Full =>
	-- Note: ack is expected as long as fifo-empty = '0'.
	read_ack_out_var := '1';
        if ((read_req_in  = '1') and (fifo_empty = '0'))  then
          fifo_rd_en_var := '1';
        elsif ((read_req_in = '1') and (fifo_empty = '1')) then
	  next_state := Empty;
        end if;
    end case;

    -- immediate outputs
    read_data_out <= fifo_dout ;
    fifo_rd_en <= fifo_rd_en_var ;
    read_ack_out <= read_ack_out_var ;    

    -- delayed actions.
    if (read_clk'event and read_clk = '1') then
      if read_reset = '1' then
        read_state <= Empty;
      else
        read_state <= next_state;
      end if;			
    end if;
  end process;

  -- write logic. interface AHIR protocol to 
  -- fifo write protocol.  Simple.
  write_req_out <= (not fifo_full);
  fifo_wr_en <=  ((not fifo_full) and write_ack_in);
  fifo_din   <= write_data_in;

  dual_clock_fifo : fifo_generator_acb_resp
    port map(rst => reset,
             wr_clk => write_clk,
             rd_clk => read_clk,
             din => fifo_din,
             wr_en => fifo_wr_en,
             rd_en => fifo_rd_en,
             dout => fifo_dout,
             full => fifo_full,
             empty => fifo_empty,
             valid => fifo_valid,
             wr_ack => fifo_wr_ack);
  
end Behavioral ;


LIBRARY ieee;
LIBRARY std;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;

--
-- a dual clocked FIFO with ready-ready protocol
-- at the boundaries.
--
-- instantiates a Xilinx dual-clocked FIFO and
-- matches it to the AHIR ready-ready protocol
-- at the write and read ends.
--
--
entity DualClockedQueue_AFB_req  is
  port ( 
    -- read 
    read_req_in : in std_logic;
    read_data_out : out std_logic_vector(73 DOWNTO 0);
    read_ack_out : out std_logic;
    -- write 
    write_req_out : out std_logic;
    write_data_in : in std_logic_vector(73 DOWNTO 0);
    write_ack_in : in std_logic;

    read_clk : in std_logic;
    write_clk : in std_logic;
    
    reset: in std_logic);	
end entity;


architecture Behavioral  of DualClockedQueue_AFB_req is

  component fifo_generator_afb_req IS
    PORT (
      rst : IN STD_LOGIC;
      wr_clk : IN STD_LOGIC;
      rd_clk : IN STD_LOGIC;
      din : IN STD_LOGIC_VECTOR(73 DOWNTO 0);
      wr_en : IN STD_LOGIC;
      rd_en : IN STD_LOGIC;
      dout : OUT STD_LOGIC_VECTOR(73 DOWNTO 0);
      full : OUT STD_LOGIC;
      empty : OUT STD_LOGIC;
      wr_ack : OUT STD_LOGIC;
      valid : OUT STD_LOGIC
      );
  end component;

  signal read_reset, write_reset: std_logic;

  -- Signals from Dual clock FIFO
  signal fifo_din : STD_LOGIC_VECTOR(73 DOWNTO 0);
  signal fifo_wr_en : STD_LOGIC;
  signal fifo_rd_en : STD_LOGIC;
  signal fifo_dout : STD_LOGIC_VECTOR(73 DOWNTO 0);
  signal fifo_full : STD_LOGIC;
  signal fifo_empty : STD_LOGIC;
  signal fifo_wr_ack : STD_LOGIC;
  signal fifo_valid : STD_LOGIC;
  
  
  type ReadState  is (Empty, Full);
  signal read_data_register: STD_LOGIC_VECTOR(73 DOWNTO 0);
  signal read_state : ReadState;

  
begin

  -- reset synchronizers.
  process(reset, write_clk)
  begin
	if(reset = '1') then
		write_reset <= '1';
	elsif (write_clk'event and write_clk = '1') then
		write_reset <= '0';
	end if;
  end process;

  
  process(reset, read_clk)
  begin
	if(reset = '1') then
		read_reset <= '1';
	elsif (read_clk'event and read_clk = '1') then
		read_reset <= '0';
	end if;
  end process;

  -- the FSM interfacing the riffa read interface to the fifo
  READFSM : process (read_state, read_clk, read_reset, read_req_in, fifo_valid, fifo_dout, fifo_empty)		------------
    variable next_state : ReadState;
    variable read_data_out_var : STD_LOGIC_VECTOR(73 DOWNTO 0);
    variable fifo_rd_en_var, read_ack_out_var : std_logic;
    variable latch_var : boolean;
  begin

    read_ack_out_var := '0';
    next_state := read_state;
    fifo_rd_en_var := '0';
    latch_var := false;
    
    case read_state is
      when Empty =>
        if (fifo_empty = '0') then
          fifo_rd_en_var := '1';
          next_state := Full;
        end if;
      when Full =>
	-- Note: ack is expected as long as fifo-empty = '0'.
	read_ack_out_var := '1';
        if ((read_req_in  = '1') and (fifo_empty = '0'))  then
          fifo_rd_en_var := '1';
        elsif ((read_req_in = '1') and (fifo_empty = '1')) then
	  next_state := Empty;
        end if;
    end case;

    -- immediate outputs
    read_data_out <= fifo_dout ;
    fifo_rd_en <= fifo_rd_en_var ;
    read_ack_out <= read_ack_out_var ;    

    -- delayed actions.
    if (read_clk'event and read_clk = '1') then
      if read_reset = '1' then
        read_state <= Empty;
      else
        read_state <= next_state;
      end if;			
    end if;
  end process;

  -- write logic. interface AHIR protocol to 
  -- fifo write protocol.  Simple.
  write_req_out <= (not fifo_full);
  fifo_wr_en <=  ((not fifo_full) and write_ack_in);
  fifo_din   <= write_data_in;

  dual_clock_fifo : fifo_generator_afb_req
    port map(rst => reset,
             wr_clk => write_clk,
             rd_clk => read_clk,
             din => fifo_din,
             wr_en => fifo_wr_en,
             rd_en => fifo_rd_en,
             dout => fifo_dout,
             full => fifo_full,
             empty => fifo_empty,
             valid => fifo_valid,
             wr_ack => fifo_wr_ack);
  
end Behavioral ;

LIBRARY ieee;
LIBRARY std;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;

--
-- a dual clocked FIFO with ready-ready protocol
-- at the boundaries.
--
-- instantiates a Xilinx dual-clocked FIFO and
-- matches it to the AHIR ready-ready protocol
-- at the write and read ends.
--
--
entity DualClockedQueue_AFB_resp  is
  port ( 
    -- read 
    read_req_in : in std_logic;
    read_data_out : out std_logic_vector(32 DOWNTO 0);
    read_ack_out : out std_logic;
    -- write 
    write_req_out : out std_logic;
    write_data_in : in std_logic_vector(32 DOWNTO 0);
    write_ack_in : in std_logic;

    read_clk : in std_logic;
    write_clk : in std_logic;
    
    reset: in std_logic);	
end entity;


architecture Behavioral  of DualClockedQueue_AFB_resp is

  component fifo_generator_afb_resp IS
    PORT (
      rst : IN STD_LOGIC;
      wr_clk : IN STD_LOGIC;
      rd_clk : IN STD_LOGIC;
      din : IN STD_LOGIC_VECTOR(32 DOWNTO 0);
      wr_en : IN STD_LOGIC;
      rd_en : IN STD_LOGIC;
      dout : OUT STD_LOGIC_VECTOR(32 DOWNTO 0);
      full : OUT STD_LOGIC;
      empty : OUT STD_LOGIC;
      wr_ack : OUT STD_LOGIC;
      valid : OUT STD_LOGIC
      );
  end component;

  signal read_reset, write_reset: std_logic;

  -- Signals from Dual clock FIFO
  signal fifo_din : STD_LOGIC_VECTOR(32 DOWNTO 0);
  signal fifo_wr_en : STD_LOGIC;
  signal fifo_rd_en : STD_LOGIC;
  signal fifo_dout : STD_LOGIC_VECTOR(32 DOWNTO 0);
  signal fifo_full : STD_LOGIC;
  signal fifo_empty : STD_LOGIC;
  signal fifo_wr_ack : STD_LOGIC;
  signal fifo_valid : STD_LOGIC;
  
  
  type ReadState  is (Empty, Full);
  signal read_data_register: STD_LOGIC_VECTOR(32 DOWNTO 0);
  signal read_state : ReadState;

  
begin

  -- reset synchronizers.
  process(reset, write_clk)
  begin
	if(reset = '1') then
		write_reset <= '1';
	elsif (write_clk'event and write_clk = '1') then
		write_reset <= '0';
	end if;
  end process;

  
  process(reset, read_clk)
  begin
	if(reset = '1') then
		read_reset <= '1';
	elsif (read_clk'event and read_clk = '1') then
		read_reset <= '0';
	end if;
  end process;

  -- the FSM interfacing the riffa read interface to the fifo
  READFSM : process (read_state, read_clk, read_reset, read_req_in, fifo_valid, fifo_dout, fifo_empty)		------------
    variable next_state : ReadState;
    variable read_data_out_var : STD_LOGIC_VECTOR(32 DOWNTO 0);
    variable fifo_rd_en_var, read_ack_out_var : std_logic;
    variable latch_var : boolean;
  begin

    read_ack_out_var := '0';
    next_state := read_state;
    fifo_rd_en_var := '0';
    latch_var := false;
    
    case read_state is
      when Empty =>
        if (fifo_empty = '0') then
          fifo_rd_en_var := '1';
          next_state := Full;
        end if;
      when Full =>
	-- Note: ack is expected as long as fifo-empty = '0'.
	read_ack_out_var := '1';
        if ((read_req_in  = '1') and (fifo_empty = '0'))  then
          fifo_rd_en_var := '1';
        elsif ((read_req_in = '1') and (fifo_empty = '1')) then
	  next_state := Empty;
        end if;
    end case;

    -- immediate outputs
    read_data_out <= fifo_dout ;
    fifo_rd_en <= fifo_rd_en_var ;
    read_ack_out <= read_ack_out_var ;    

    -- delayed actions.
    if (read_clk'event and read_clk = '1') then
      if read_reset = '1' then
        read_state <= Empty;
      else
        read_state <= next_state;
      end if;			
    end if;
  end process;

  -- write logic. interface AHIR protocol to 
  -- fifo write protocol.  Simple.
  write_req_out <= (not fifo_full);
  fifo_wr_en <=  ((not fifo_full) and write_ack_in);
  fifo_din   <= write_data_in;

  dual_clock_fifo : fifo_generator_afb_resp
    port map(rst => reset,
             wr_clk => write_clk,
             rd_clk => read_clk,
             din => fifo_din,
             wr_en => fifo_wr_en,
             rd_en => fifo_rd_en,
             dout => fifo_dout,
             full => fifo_full,
             empty => fifo_empty,
             valid => fifo_valid,
             wr_ack => fifo_wr_ack);
  
end Behavioral ;


