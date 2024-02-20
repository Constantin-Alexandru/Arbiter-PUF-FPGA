module pufigroup(
						input clk,
						input [7:0] SC,
						input [15:0] O);

	pufi PUFI0(clk, SC, O[0]);
	pufi PUFI1(clk, SC, O[1]);
	pufi PUFI2(clk, SC, O[2]);
	pufi PUFI3(clk, SC, O[3]);
	pufi PUFI4(clk, SC, O[4]);
	pufi PUFI5(clk, SC, O[5]);
	pufi PUFI6(clk, SC, O[6]);
	pufi PUFI7(clk, SC, O[7]);
	pufi PUFI8(clk, SC, O[8]);
	pufi PUFI9(clk, SC, O[9]);
	pufi PUFI10(clk, SC, O[10]);
	pufi PUFI11(clk, SC, O[11]);
	pufi PUFI12(clk, SC, O[12]);
	pufi PUFI13(clk, SC, O[13]);
	pufi PUFI14(clk, SC, O[14]);
	pufi PUFI15(clk, SC, O[15]);
	
endmodule