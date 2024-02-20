module lfsr #(parameter WIDTH=8)(
				input clk,
				input inc,
				input reset,
				input [WIDTH-1:0] input_challenge,
				output reg[WIDTH-1:0] output_challenge);
	
	wire generated_bit = output_challenge[1] ^ output_challenge[2] ^ output_challenge[3] ^ output_challenge[7];
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			output_challenge <= input_challenge;
		end 
		else if (increment) begin
			output_challenge <= {output_challenge[6:0], new_bit};
		end
	end
	
	
endmodule