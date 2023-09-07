
module nic_mac_pipe_reset
(
input clk,

(* MARK_DEBUG = "true" *) input ENABLE_MAC_pipe_data,
(* MARK_DEBUG = "true" *) input ENABLE_MAC_pipe_req,
(* MARK_DEBUG = "true" *) output ENABLE_MAC_pipe_ack,

output reg NIC_TO_MAC_RESET_N
);

assign ENABLE_MAC_pipe_ack = 1'b1;
reg reset_reg = 1'b0;

always@(posedge clk)
begin

	if(ENABLE_MAC_pipe_req == 1'b1)
	begin
		reset_reg <= ENABLE_MAC_pipe_data;	
	end

	NIC_TO_MAC_RESET_N <= ~reset_reg; //  nic_to_mac_reset is active low!
end

endmodule
