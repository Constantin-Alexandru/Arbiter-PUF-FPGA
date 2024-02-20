module mux2x1(
	input I0,
	input I1,
	input S,
	output Y);
	
	wire WN, WA1, WA2;
	
	not N1(WN, S);
	and A1(WA1, I0, WN);
	and A2(WA2, I1, S);
	or  O1(Y, WA1, WA2);

endmodule