
//Description: This modules holds the MAC in reset state. 
//		sends an active high reset to the trimode MAC
//		example design top level (obs: reset_reg = 0, initially), 
//		once NIC is enabled, it makes ENABLE_MAC = 1,
//		bringing out MAC from reset state (as reset becomes 0) 
//		and link becomes active. Output reset signal is also sent to
//		rx_concat and tx_deconcat blocks.

module nic_mac_pipe_reset
(
input clk,
(* MARK_DEBUG = "true" *) input ENABLE_MAC,
output reg reset
);

reg reset_reg = 1'b0;

always@(posedge clk)
begin
	reset_reg <= ENABLE_MAC;
	reset <= ~reset_reg; 
end

endmodule
