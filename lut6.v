module lut6(
	input [63:0]bits,
	input A1,
	input A2,
	input A3,
	input A4,
	input A5,
	input A6,
	output O);
	
	wire L1, L2;
	
	lut5 LUT1(bits[31:0], A1, A2, A3, A4, A5, L1);
	lut5 LUT2(bits[63:32], A1, A2, A3, A4, A5, L2);
	
	mux2x1 MUX1(L1, L2, A6, 0);
	
	
endmodule