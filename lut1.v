module lut1(
	input [1:0]bits,
	input A,
	output O);
	
	
	mux2x1 MUX1(bits[0], bits[1], A, O);

endmodule