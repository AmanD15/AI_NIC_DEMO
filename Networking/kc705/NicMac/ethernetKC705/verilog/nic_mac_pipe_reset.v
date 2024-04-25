
//Description: This modules holds the MAC in reset state. 
//		sends an active high reset to the example  
//		design top level (obs: reset_reg = 0, initially), 
//		once NIC is enabled, it makes ENABLE_MAC = 1,
//		bringing out MAC from reset state and link becomes active.

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
	reset <= ~reset_reg; // 1 = Reset 0 = No Reset
end

endmodule
