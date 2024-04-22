Author: Siddhant Singh Tomar
Date  : 22/04/2024

	MAC Organized:
	
	- docs
	  For generation for IP,example design and license please refer
	  to this folder.
	  
	- example_design_top_level: 
	  The only modification required is in the interface. 
	  AHIR pipes and clocks have been introduced to the interface.

	- Clocking: 
	  This has been moved to the top level, and within it, 
	  the clocking wizard for the SBC_core has been incorporated.
	  
	- tri_mode_ethernet_mac_ip: 
	  Contains the trimode_ethernet_mac IP.	  
	  	  
	- AXI_stateMachine:
	  This module is responsible for bringing up both the MAC and the
	  attached PHY (if any) to enable basic packet transfer in both directions.
	  It is intended to be directly usable on a xilinx demo platform to demonstrate
	  simple bring up and data transfer. The mac speed is set via inputs (which
	  can be connected to dip switches) and the PHY is configured to ONLY advertise the
	  specified speed. To maximise compatibility on boards only IEEE registers are used
	  and the PHY address can be set via a parameter.

	- AXI_fifos:
	  	RX AXI FIFO:
		    This is the receiver side FIFO for the design example
		    of the Tri-Mode Ethernet MAC core. AxiStream interfaces are used.
		    
		    The FIFO is built around an Inferred Dual Port RAM, 
		    giving a total memory capacity of 4096 bytes.

		    Frame data received from the MAC receiver is written into the
		    FIFO on the rx_mac_aclk. An end-of-frame marker is written to
		    the BRAM parity bit on the last byte of data stored for a frame.
		    This acts as frame delineation.

		    The rx_axis_mac_tvalid, rx_axis_mac_tlast, and rx_axis_mac_tuser signals
		    qualify the frame. A frame which ends with rx_axis_mac_tuser asserted
		    indicates a bad frame and will cause the FIFO write address
		    pointer to be reset to the base address of that frame. In this
		    way, the bad frame will be overwritten with the next received
		    frame and is therefore dropped from the FIFO.

		    Frames will also be dropped from the FIFO if an overflow occurs.
		    If there is not enough memory capacity in the FIFO to store the
		    whole of an incoming frame, the write address pointer will be
		    reset, and the overflow signal asserted.

		    When there is at least one complete frame in the FIFO,
		    the 8-bit AxiStream read interface's rx_axis_fifo_tvalid signal will
		    be enabled allowing data to be read from the FIFO.

		    The FIFO has been designed to operate with different clocks
		    on the write and read sides. The read clock (user side) should
		    always operate at an equal or faster frequency than the write
		    clock (MAC side).

		    The FIFO is designed to work with a minimum frame length of 8
		    bytes.

		    The FIFO memory size can be increased by expanding the rd_addr
		    and wr_addr signal widths, to address further BRAMs.

		    Requirements:
		    * Minimum frame size of 8 bytes
		    * Spacing between good/bad frame signaling (encoded by
		      rx_axis_mac_tvalid, rx_axis_mac_tlast, rx_axis_mac_tuser), is at least 64
		      clock cycles
		    * Write AxiStream clock is 125MHz downto 1.25MHz
		    * Read AxiStream clock equal to or faster than write clock,
		      and downto 20MHz

	  	TX AXI FIFO:
		    This is a transmitter side FIFO for the design example
		    of the Tri-Mode Ethernet MAC core. AxiStream interfaces are used.

		    The FIFO is built around an Inferred Dual Port RAM, 
		    giving a total memory capacity of 4096 bytes.

		    Valid frame data received from the user interface is written
		    into the Block RAM on the tx_fifo_aclkk. The FIFO will store
		    frames up to 4kbytes in length. If larger frames are written
		    to the FIFO, the AxiStream interface will accept the rest of the
		    frame, but that frame will be dropped by the FIFO, and the
		    overflow signal will be asserted.

		    The FIFO is designed to work with a minimum frame length of 14
		    bytes.

		    When there is at least one complete frame in the FIFO, the MAC
		    transmitter AxiStream interface will be driven to request frame
		    transmission by placing the first byte of the frame onto
		    tx_axis_mac_tdata and by asserting tx_axis_mac_tvalid. The MAC will later
		    respond by asserting tx_axis_mac_tready. At this point, the remaining
		    frame data is read out of the FIFO subject to tx_axis_mac_tready.
		    Data is read out of the FIFO on the tx_mac_aclk.

		    If the generic FULL_DUPLEX_ONLY is set to false, the FIFO will
		    requeue and retransmit frames as requested by the MAC. Once a
		    frame has been transmitted by the FIFO, it is stored until the
		    possible retransmit window for that frame has expired.

		    The FIFO has been designed to operate with different clocks
		    on the write and read sides. The minimum write clock
		    frequency is the read clock frequency divided by 2.

		    The FIFO memory size can be increased by expanding the rd_addr
		    and wr_addr signal widths, to address further BRAMs.

	- reset_sync: reset synchronizer

	- sync_block: ??
	
	
         _________________________________________________________
        |                                                         |
        |                 FIFO BLOCK LEVEL WRAPPER                |
        |                                                         |
        |   _____________________       ______________________    |
        |  |  _________________  |     |                      |   |
        |  | |                 | |     |                      |   |
  -------->| |   TX AXI FIFO   | |---->| Tx               Tx  |--------->
        |  | |                 | |     | AXI-S            PHY |   |
        |  | |_________________| |     | I/F              I/F |   |
        |  |                     |     |                      |   |
  AXI   |  |     10/100/1G       |     |  TRI-MODE ETHERNET   |   |
 Stream |  |    ETHERNET FIFO    |     |          MAC         |   | PHY I/F
        |  |                     |     |     SUPPORT LEVEL    |   |
        |  |  _________________  |     |                      |   |
        |  | |                 | |     |                      |   |
  <--------| |   RX AXI FIFO   | |<----| Rx               Rx  |<---------
        |  | |                 | |     | AXI-S            PHY |   |
        |  | |_________________| |     | I/F              I/F |   |
        |  |_____________________|     |______________________|   |
        |                                                         |
        |_________________________________________________________|
        
        
        
        
        
