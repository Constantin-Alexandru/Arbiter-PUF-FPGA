module lut3(
	input [0:7]bits,
	input A1,
	input A2,
	input A3,
	output O);
	
	wire L1, L2;
	
	lut2 LUT1(bits[3:0], A1, A2, L1);
	lut2 LUT2(bits[7:4], A1, A2, L2);
	
	mux2x1 MUX1(L1, L2, A3, O);
	
endmodule