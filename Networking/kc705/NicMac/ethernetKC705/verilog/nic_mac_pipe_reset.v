
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
