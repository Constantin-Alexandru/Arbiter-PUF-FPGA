module lut4(
	input [15:0]bits,
	input A1,
	input A2,
	input A3,
	input A4,
	output O);
	
	wire L1, L2;
	
	lut3 LUT1(bits[7:0], A1, A2, A3, L1);
	lut3 LUT2(bits[15:8], A1, A2, A3, L2);
	
	mux2x1 MUX1(L1, L2, A4, O);
	
endmodule