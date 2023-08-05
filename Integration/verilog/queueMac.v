module queueMac(

	input clk,
	input reset,

	input push_req,
	input [9:0] push_data,
	output push_ack,
	
	input pop_req,
	output [9:0] pop_data,
	output pop_ack
);

	parameter start = 1'b0,
		  send  = 1'b1;
	
	reg state,next;
	
	reg [9:0] queue [3:0];
	wire [1:0] queue_size;
	reg [1:0] wptr,rptr;
	reg last_flag;
	reg send_flag,recv_flag;
	wire [2:0] diff;
	
	reg push_ack_reg,pop_ack_reg;
	
	reg [9:0] pop_data_reg;
	
	assign pop_data = queue[rptr];//pop_data_reg; 
	
	assign push_ack = (recv_flag && (queue_size < 3)) ? 1:0;
	assign pop_ack = (send_flag && (queue_size > 0))? 1:0;
	
	assign diff = {1'b1, wptr} - {1'b0,rptr};
    assign queue_size = (reset == 1'b1) ?  2'd0: diff[1:0];
	
	/*ila_1 your_instance_name (
        .clk(clk), // input wire clk
    
    
        .probe0(reset), // input wire [0:0]  probe0  
        .probe1(push_req), // input wire [0:0]  probe1 
        .probe2(push_data), // input wire [9:0]  probe2 
        .probe3(push_ack), // input wire [0:0]  probe3 
        .probe4(pop_req), // input wire [0:0]  probe4 
        .probe5(pop_data), // input wire [9:0]  probe5 
        .probe6(pop_ack), // input wire [0:0]  probe6 
        .probe7(state), // input wire [0:0]  probe7 
        .probe8(next), // input wire [0:0]  probe8 
        .probe9(1'b0), // input wire [0:0]  probe9 
        .probe10(queue[3]), // input wire [9:0]  probe10 
        .probe11(queue[2]), // input wire [9:0]  probe11 
        .probe12(queue[1]), // input wire [9:0]  probe12 
        .probe13(queue[0]), // input wire [9:0]  probe13 
        .probe14(queue_size), // input wire [1:0]  probe14 
        .probe15(wptr), // input wire [1:0]  probe15 
        .probe16(rptr), // input wire [1:0]  probe16 
        .probe17(last_flag), // input wire [0:0]  probe17 
        .probe18(send_flag), // input wire [0:0]  probe18 
        .probe19(recv_flag), // input wire [0:0]  probe19 
        .probe20(diff) // input wire [2:0]  probe20
    );*/
	
	// state transition
	always @ (posedge clk)
		if(reset)
			state <= start;
		else
			state <= next;
	
	// next state logic
	always @ (state,queue_size,last_flag) begin
		next = 1'bx;
		send_flag = 1'b0;
		
		case (state)	
			start :
			    begin
			    send_flag = 1'b0;
		        recv_flag = 1'b1;	 
				if(queue_size < 2)
					next = start;
				else
					next = send;
			    end
			send :
				begin
				send_flag = 1'b1;
				if(last_flag == 1'b1)
				    begin
				        recv_flag = 1'b0;
				        if(queue_size > 0)
				            next = send;
				        else
					       next = start;
					end
				else
				    begin
				       recv_flag = 1'b1;
					   next = send;
					end
				end
		endcase
	end
	
	// push side logic	
	always @ (posedge clk)
		if(reset)
			begin
				wptr <= 2'd0;
				last_flag <= 1'b0;
				
			end
		else
			begin
				if(push_req == 1'b1 && queue_size < 3) begin
					queue[wptr] <= push_data;
					if(push_data[9])
						last_flag <= 1'b1;
					else
						last_flag <= 1'b0;
					 wptr <= wptr + 1;
				end
			end
	
	
	// pop side logic
	always @ (posedge clk)
		if(reset)
			begin
				rptr <= 2'd0;
			end
		else
			begin
				if(send_flag && (queue_size > 0)) 
				begin
				    if(pop_req)
				        begin
					       rptr <= rptr + 1;
					    end
				end
			end
endmodule

