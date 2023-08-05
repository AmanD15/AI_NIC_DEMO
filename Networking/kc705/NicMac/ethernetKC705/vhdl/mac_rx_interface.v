module mac_rx_interface
(


               clk,
               reset,
               
               rx_axis_tdata,
               rx_axis_tkeep,
               rx_axis_tvalid,
               rx_axis_tlast,
               rx_axis_tready,
               
               RX_FIFO_pipe_read_data,
               RX_FIFO_pipe_read_req,
               RX_FIFO_pipe_read_ack
);

    parameter MAC_WIDTH = 64;
    parameter TKEEP_WIDTH = 8; //log2(N)
    parameter NIC_WIDTH = MAC_WIDTH + TKEEP_WIDTH + 1; 
    
    parameter Q = 7;

    input clk;
    input reset;
    
    input  [MAC_WIDTH-1 : 0] rx_axis_tdata;
    input  [TKEEP_WIDTH-1 : 0] rx_axis_tkeep;
    input rx_axis_tvalid;
    output  rx_axis_tready;
    input rx_axis_tlast;
    
    output      [NIC_WIDTH-1:0]  RX_FIFO_pipe_read_data;
    input                      RX_FIFO_pipe_read_req;
    output                     RX_FIFO_pipe_read_ack;

	integer read_pointer = 0;
	integer write_pointer = 0;
	
	

	reg [NIC_WIDTH - 1 : 0] queue [Q : 0];

    assign rx_axis_tready = (reset != 1 && (((write_pointer + 1) & Q) != read_pointer)) ? 1'b1 : 1'b0;
    assign RX_FIFO_pipe_read_ack = (reset != 1 && (read_pointer != write_pointer)) ? 1'b1 : 1'b0;
    assign RX_FIFO_pipe_read_data = queue [read_pointer];
    
    
    always@(posedge clk)
	begin
	$display (" RX %t :  wp =%d, rp =%d, rx_axis_tdata = %x \n",$time, write_pointer, read_pointer, rx_axis_tdata);
	
		if(reset == 1'b1)
		begin
			write_pointer <= 1'b0;			
		end

		else
		begin
		
		   
			if(((write_pointer + 1) & Q) != read_pointer)
			begin
				
				if(rx_axis_tvalid == 1)
				begin
				
				queue[write_pointer]  <= {rx_axis_tlast ,rx_axis_tdata ,rx_axis_tkeep};
                write_pointer <= (write_pointer + 1) & Q;
				
				end
						
			end
			

		

		end

	end




always@(posedge clk)
begin
$display (" Send RX %t :  wp =%d, rp =%d \n",$time, write_pointer, read_pointer);
if(reset == 1'b1)
begin
			read_pointer <= 1'b0;			
end

else
begin


			if(read_pointer != write_pointer)
			begin
			
				
				if(RX_FIFO_pipe_read_req == 1'b1)
				begin
				    
                    read_pointer <= (read_pointer + 1 ) & Q;
							
				end
							
			end

end




end
endmodule