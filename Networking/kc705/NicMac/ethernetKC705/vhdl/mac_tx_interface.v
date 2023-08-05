`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 10:10:52 AM
// Design Name: 
// Module Name: mac_tx_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module mac_tx_interface
(
               clk,
               reset,
               
               // Connect to MAC Tx interface
               
               tx_axis_tdata,
               tx_axis_tkeep,
               tx_axis_tvalid,
               tx_axis_tlast,
               tx_axis_tready,
               
               // NIC Pipe  Interface (Write to Tx fifo pipe)
               
               TX_FIFO_pipe_write_data,
               TX_FIFO_pipe_write_req,
               TX_FIFO_pipe_write_ack
               
);  



    parameter MAC_WIDTH = 64;
    parameter TKEEP_WIDTH = 8; //log2(N)
    parameter NIC_WIDTH = MAC_WIDTH + TKEEP_WIDTH + 1; 
    
    
    input clk;
    input reset; 

    output reg [MAC_WIDTH-1 :0] tx_axis_tdata;
    output reg [TKEEP_WIDTH-1 :0] tx_axis_tkeep;
    output reg tx_axis_tvalid = 0;
    //output reg [7:0] tx_ifg_delay = 0;
    output reg tx_axis_tlast;
    input      tx_axis_tready;
    
    

    input     [NIC_WIDTH-1:0]  TX_FIFO_pipe_write_data;
    input                      TX_FIFO_pipe_write_req;
    output     reg                TX_FIFO_pipe_write_ack;
 



	integer read_pointer = 0;
	integer write_pointer = 0;

	reg [NIC_WIDTH - 1 : 0] queue [511 : 0];


	always@(posedge clk)
	begin
		if(reset == 1'b1)
		begin
			TX_FIFO_pipe_write_ack <= 1'b0;
			tx_axis_tvalid <= 1'b0;
	
			read_pointer <= 1'b0;
			write_pointer <= 1'b0;			
		end

		else
		begin
			
			if(read_pointer != write_pointer)
				tx_axis_tvalid <= 1'b1;
			else
				tx_axis_tvalid <= 1'b0;

			if(((write_pointer + 1) % 511) != read_pointer)
				TX_FIFO_pipe_write_ack <= 1'b1;
			else
				TX_FIFO_pipe_write_ack <= 1'b0;


            
			if(TX_FIFO_pipe_write_req == 1'b1 && (((write_pointer + 1) % 511) != read_pointer))
			begin
				
		        queue[write_pointer]  <= TX_FIFO_pipe_write_data;
			write_pointer <= (write_pointer + 1) % 511;

			end

			if(tx_axis_tready == 1'b1 && (read_pointer != write_pointer))
			begin
				
            			tx_axis_tdata  <= queue[read_pointer][NIC_WIDTH-2:TKEEP_WIDTH];
            			tx_axis_tkeep  <= queue[read_pointer][TKEEP_WIDTH-1:0];
            			tx_axis_tlast  <= queue[read_pointer][NIC_WIDTH-1];
				read_pointer <= (read_pointer + 1 ) % 511;			
			end

		end
	end
          
endmodule