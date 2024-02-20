module pufi(
	input I,
	input [7:0]C,
	output O);

	wire TL1, TL2, TL3, TL4, TL5, TL6, TL7, TL8; // Top path
	wire BL1, BL2, BL3, BL4, BL5, BL6, BL7, BL8; // Bottom path

	reg [1023:0] bits;	
	
	memoryread(0, 1024, bits);
	
	lut6 TLUT1(bits[63:0], I, C[0], 0, 0, 0, 0, TL1);
	lut6 TLUT2(bits[127:64], TL1, C[1], 0, 0, 0, 0, TL2);
	lut6 TLUT3(bits[191:128], TL2, C[2], 0, 0, 0, 0, TL3);
	lut6 TLUT4(bits[255:192], TL3, C[3], 0, 0, 0, 0, TL4);
	lut6 TLUT5(bits[319:256], TL4, C[4], 0, 0, 0, 0, TL5);
	lut6 TLUT6(bits[383:320], TL5, C[5], 0, 0, 0, 0, TL6);
	lut6 TLUT7(bits[447:384], TL6, C[6], 0, 0, 0, 0, TL7);
	lut6 TLUT8(bits[511:448], TL7, C[7], 0, 0, 0, 0, TL8);
	
	lut6 BLUT1(bits[575:512], I, C[0], 0, 0, 0, 0, BL1);
	lut6 BLUT2(bits[639:576], BL1, C[1], 0, 0, 0, 0, BL2);
	lut6 BLUT3(bits[703:640], BL2, C[2], 0, 0, 0, 0, BL3);
	lut6 BLUT4(bits[767:704], BL3, C[3], 0, 0, 0, 0, BL4);
	lut6 BLUT5(bits[831:768], BL4, C[4], 0, 0, 0, 0, BL5);
	lut6 BLUT6(bits[865:832], BL5, C[5], 0, 0, 0, 0, BL6);
	lut6 BLUT7(bits[959:896], BL6, C[6], 0, 0, 0, 0, BL7);
	lut6 BLUT8(bits[1023:960], BL7, C[7], 0, 0, 0, 0, BL8);
	
	flipflop FF(TL8, BL8, O);

endmodule 