module memoryread #(
	parameter start = 0,
	parameter length = 1023)(
	input clk,
	output reg [1023:0]	mem);

	always @(posedge clk) begin
		reg [1023:0] memory;
	
		mem <= memory[start+length-1:start];
	end	
	

endmodule