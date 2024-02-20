module mux4x1(
	input I0,
	input I1,
	input I2,
	input I3,
	input I4,
	input S0,
	input S1,
	output O);
	
	wire M0, M1;
	
	mux2x1 MUX0(I0, I1, S0, M0);
	mux2x1 MUX1(I2, I3, S0, M0);
	
	mux2x1 MUX2(M0, M1, S1, O);
	
endmodule