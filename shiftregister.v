module shiftregister #(
							parameter WIDTH = 256) (
							input clk,
							input enable,
							input shift_in,
							output reg [WIDTH-1:0] O);
			
	reg [WIDTH-1:0] temp;
	
	
	always @(posedge clk) begin
		temp <= {shift_in, temp[WIDTH-2:0]};
	end
		
	always @(posedge clk) begin
		O <= temp;
	end
	
endmodule