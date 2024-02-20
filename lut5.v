module lut5(
	input [31:0]bits,
	input A1,
	input A2,
	input A3,
	input A4,
	input A5,
	output O);
	
	wire L1, L2;
	
	lut4 LUT1(bits[15:0], A1, A2, A3, A4,L1);
	lut4 LUT2(bits[31:16], A1, A2, A3, A4, L2);
	
	mux2x1 MUX1(L1, L2, A5);
	
endmodule