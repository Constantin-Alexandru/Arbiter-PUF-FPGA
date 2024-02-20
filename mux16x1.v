module mux16x1(
	input I0,
	input I1,
	input I2,
	input I3,
	input I4,
	input I5,
	input I6,
	input I7,
	input I8,
	input I9,
	input I10,
	input I11,
	input I12,
	input I13,
	input I14,
	input I15,
	input S0,
	input S1,
	input S2,
	input S3,
	output O);
	
	reg M0, M1, M2, M3;
	
	mux4x1 MUX0(I0, I1, I2, I3, S0, S1, M0);
	mux4x1 MUX1(I4, I5, I6, I7, S0, S1, M1);
	mux4x1 MUX2(I8, I9, I10, I11, S0, S1, M2);
	mux4x1 MUX3(I12, I13, I14, I15, S0, S1, M3);
	
	mux4x1 MUX4(M0, M1, M2, M3, S2, S3, O);	
endmodule