module lut2(
	input [3:0]bits,
	input A1,
	input A2,
	output O);
	
	wire L1, L2;
	
	lut1 LUT1(bits[1:0], A1, L1);
	lut1 LUT2(bits[3:2], A1, L2);
	
	mux2x1 MUX1(L1, L2, A2, O);
	
endmodule