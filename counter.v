module counter(
	input clk,
	input enable,
	input I,
	input reset,
	output reg[7:0] count);
	
	always @(posedge clk) begin
		if (reset) begin
			count <= 8'b0000_0000;
		end else if (enable && I) begin
			count <= count + 1;
		end	
	end

endmodule