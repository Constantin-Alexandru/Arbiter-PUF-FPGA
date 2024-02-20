module comparator #(parameter WIDTH = 8) (
	input[WIDTH - 1:0] a,
	input[WIDTH - 1:0] b,
	input enable,
	output reg O);

	always @(*) begin
		if(enable) begin
			O <= (a > b) ? 1'b1 : 1'b0;
		end
	end

endmodule 