module ETH_TOP
(
     /*
     * Clock: 125MHz LVDS
     * Reset: Push button, active low
     */
    input  wire       CLKREF_P, //100MHZ reference
    input  wire       CLKREF_N,
    input  wire       reset,

    /* Leds */
    output wire [7:0] led,
    input wire dummy_port_in,
    
    output wire clk_125mhz_int,
    output wire clock_100mhz_int,
    output wire clock_70mhz_int,
    output wire rst_125mhz_int,

    /*
     * Ethernet: 1000BASE-T SGMII
     */
    input  wire       phy_sgmii_rx_p,
    input  wire       phy_sgmii_rx_n,
    output wire       phy_sgmii_tx_p,
    output wire       phy_sgmii_tx_n,
    input  wire       phy_sgmii_clk_p,
    input  wire       phy_sgmii_clk_n,
    //output wire       phy_reset_n,
    input  wire       phy_int_n,
    inout  wire       phy_mdio,
    output wire       phy_mdc,


    //////////////////
    // AHIR PIPES
    //////////////////
     output [9:0] rx_pipe_data, 
     output rx_pipe_ack,
     input rx_pipe_req,  
     
     input [9:0] tx_pipe_data,
     input tx_pipe_ack,
     output tx_pipe_req

);

wire [9:0]  rx_pipe_pipe_write_data;//in
wire        rx_pipe_pipe_write_req;//in
wire        rx_pipe_pipe_write_ack; //out
wire [9:0]  tx_pipe_pipe_read_data;//out
wire        tx_pipe_pipe_read_req;//in
wire        tx_pipe_pipe_read_ack;

wire [9:0]  rx_pipe_pipe_write_data_Qb;//in
wire        rx_pipe_pipe_write_req_Qb;//in
wire        rx_pipe_pipe_write_ack_Qb; //out
wire [9:0]  rx_pipe_pipe_read_data_fifo;//out
wire        rx_pipe_pipe_read_req_fifo;//in
wire        rx_pipe_pipe_read_ack_fifo;
wire [9:0]  tx_pipe_pipe_write_data_Qb;//in
wire        tx_pipe_pipe_write_req_Qb;//in
wire        tx_pipe_pipe_write_ack_Qb; //out
wire [9:0]  tx_pipe_pipe_read_data_fifo;//out
wire        tx_pipe_pipe_read_req_fifo;//in
wire        tx_pipe_pipe_read_ack_fifo;  
    
wire [9:0]  tx_pipe_pipe_read_data_queue;//out
wire        tx_pipe_pipe_read_req_queue;//in
wire        tx_pipe_pipe_read_ack_queue;    

wire [7:0]  tx_axis_tdata;
wire        tx_axis_tvalid;
wire        tx_axis_tready;
wire        tx_axis_tlast;
wire        tx_axis_tuser;

wire [7:0]  rx_axis_tdata;
wire        rx_axis_tvalid;
wire        rx_axis_tlast;
wire        rx_axis_tuser;
wire        rx_axis_tready;

// Parameter to change the depth of Rx/Tx FIFO in Ethernet MAC
parameter DEPTH = 10000;		// Initially it was 1000

fpga_top_vcu128 fpga_top_vcu128_inst
(
     .CLKREF_P(CLKREF_P), //100MHZ reference
     .CLKREF_N(CLKREF_N),
     .reset(reset),

     .led(led),
     .dummy_port_in(dummy_port_in),
     .clk_125mhz_int(clk_125mhz_int),
     .clock_100mhz_int(clock_100mhz_int),
     .clock_70mhz_int(clock_70mhz_int),
     .phy_gmii_rst_int(rst_125mhz_int),

     
     .phy_sgmii_rx_p(phy_sgmii_rx_p),
     .phy_sgmii_rx_n(phy_sgmii_rx_n),
     .phy_sgmii_tx_p(phy_sgmii_tx_p),
     .phy_sgmii_tx_n(phy_sgmii_tx_n),
     .phy_sgmii_clk_p(phy_sgmii_clk_p),
     .phy_sgmii_clk_n(phy_sgmii_clk_n),
    
     .phy_int_n(phy_int_n),
     .phy_mdio(phy_mdio),
     .phy_mdc(phy_mdc),
    
    .tx_axis_tdata(tx_axis_tdata),
    .tx_axis_tvalid(tx_axis_tvalid),
    .tx_axis_tready(tx_axis_tready),
    .tx_axis_tlast(tx_axis_tlast),
    .tx_axis_tuser(tx_axis_tuser),

    .rx_axis_tdata(rx_axis_tdata),
    .rx_axis_tvalid(rx_axis_tvalid),
    .rx_axis_tready(rx_axis_tready),
    .rx_axis_tlast(rx_axis_tlast),
    .rx_axis_tuser(rx_axis_tuser)

);

 DualClockedQueue  DualClockedQueue_rx_loopback
    (
        // read 
        .read_req_in(rx_pipe_pipe_read_req_fifo), 
        .read_data_out(rx_pipe_pipe_read_data_fifo), 
        .read_ack_out(rx_pipe_pipe_read_ack_fifo), 
         // write
        .write_req_out(rx_axis_tready),   
        .write_data_in({rx_axis_tlast, rx_axis_tdata,1'b0}),
        .write_ack_in(rx_axis_tvalid), 
         
        .read_clk(clk_125mhz_int),
        .write_clk(clk_125mhz_int),
    
        .reset(rst_125mhz_int)
    );

    DualClockedQueue  DualClockedQueue_tx_loopback
    (
        //.read_req_in(tx_pipe_pipe_read_ack_queue),   
        //.read_data_out(tx_pipe_pipe_read_data_queue), 
        //.read_ack_out(tx_pipe_pipe_read_req_queue),
        .read_req_in(tx_axis_tready),   
        .read_data_out({tx_axis_tlast, tx_axis_tdata, 1'b0}), 
        .read_ack_out(tx_axis_tvalid),
        
        // write 
        .write_req_out(tx_pipe_pipe_read_req), 
        .write_data_in(tx_pipe_pipe_read_data), 
        .write_ack_in(tx_pipe_pipe_read_ack),          
    
        .read_clk(clk_125mhz_int),
        .write_clk(clk_125mhz_int),
    
        .reset(rst_125mhz_int)
    );
    
    /*queueMac queueMac_inst(
        
            .clk(clk_125mhz_int),
            .reset(rst_125mhz_int),
        
            .push_req(tx_pipe_pipe_read_req_queue), // in
            .push_data(tx_pipe_pipe_read_data_queue), // in
            .push_ack(tx_pipe_pipe_read_ack_queue), // out
            
            .pop_req(tx_axis_tready), // in
            .pop_data({tx_axis_tlast, tx_axis_tdata, 1'b0}), // out
            .pop_ack(tx_axis_tvalid) // out
    
        );*/
    
    /*SynchFifoWithDPRAM
    #("rx_interface",1000,10)
    rx_queue
    (
         .clk(clk_125mhz_int),    //: in std_logic;
         .reset(rst_125mhz_int),  //: in std_logic;
         .data_in({rx_axis_tlast, rx_axis_tdata,1'b0}),    //: in std_logic_vector(data_width-1 downto 0);
         .push_req(rx_axis_tvalid),   //: in std_logic;
         .push_ack(rx_axis_tready),   // : out std_logic;
         .nearly_full(),    //: out std_logic;
         .data_out(rx_pipe_data),   //: out std_logic_vector(data_width-1 downto 0);
         .pop_ack(rx_pipe_ack),    // : out std_logic;
         .pop_req(rx_pipe_req)     //: in std_logic);
    );
    SynchFifoWithDPRAM
        #("tx_interface",1000,10)
        tx_queue
        (
             .clk(clk_125mhz_int),    //: in std_logic;
             .reset(rst_125mhz_int),  //: in std_logic;
             .data_in(tx_pipe_data),    //: in std_logic_vector(data_width-1 downto 0);
             .push_req(tx_pipe_ack),   //: in std_logic;
             .push_ack(tx_pipe_req),   // : out std_logic;
             .nearly_full(),    //: out std_logic;
             .data_out({tx_axis_tlast, tx_axis_tdata, 1'b0}),   //: out std_logic_vector(data_width-1 downto 0);
             .pop_ack(tx_axis_tvalid),    // : out std_logic;
             .pop_req(tx_axis_tready)     //: in std_logic);
        );*/

    
    SynchFifoWithDPRAM
    #("rx_interface",DEPTH,10)
    rx_queue
    (
         .clk(clk_125mhz_int),    //: in std_logic;
         .reset(rst_125mhz_int),  //: in std_logic;
         .data_in(rx_pipe_pipe_read_data_fifo),    //: in std_logic_vector(data_width-1 downto 0);
         .push_req(rx_pipe_pipe_read_ack_fifo),   //: in std_logic;
         .push_ack(rx_pipe_pipe_read_req_fifo),   // : out std_logic;
         .nearly_full(),    //: out std_logic;
         .data_out(rx_pipe_data),   //: out std_logic_vector(data_width-1 downto 0);
         .pop_ack(rx_pipe_ack),    // : out std_logic;
         .pop_req(rx_pipe_req)     //: in std_logic);
    );
    
    SynchFifoWithDPRAM
        #("tx_interface",DEPTH,10)
        tx_queue
        (
             .clk(clk_125mhz_int),    //: in std_logic;
             .reset(rst_125mhz_int),  //: in std_logic;
             .data_in(tx_pipe_data),    //: in std_logic_vector(data_width-1 downto 0);
             .push_req(tx_pipe_ack),   //: in std_logic;
             .push_ack(tx_pipe_req),   // : out std_logic;
             .nearly_full(),    //: out std_logic;
             .data_out(tx_pipe_pipe_read_data),   //: out std_logic_vector(data_width-1 downto 0);
             .pop_ack(tx_pipe_pipe_read_ack),    // : out std_logic;
             .pop_req(tx_pipe_pipe_read_req)     //: in std_logic);
        );


endmodule
