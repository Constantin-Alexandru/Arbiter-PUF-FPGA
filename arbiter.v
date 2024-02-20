module arbiter #(parameter CHALLENGE_WIDTH = 8, CHALLENGES = 256)(
	input clk,
	input [CHALLENGE_WIDTH-1:0] challenge,
	input reset,
	output [CHALLENGES-1:0]O);
	
	reg [7:0] count;
	reg [7:0] ref_count; // How many cycles occured this iteration
	reg enable;
	reg ref_reset = 0;
	reg ref_input = 1;
		
	always @(posedge clk) begin
		counter(clk, enable, ref_input, ref_reset, ref_count);
	end	
	
	reg [CHALLENGES-1:0] temp;
	wire [7:0] CNTO0, CNTO1; // The output of the 2 counters
	wire[7:0] SC; //The LFSR output
	wire [31:0] PUFI; // The output of the 32 PUFIs
	wire MUXO0, MUXO1; // The output of the 2 multiplexers
	
	always @(posedge clk) begin
		if(ref_count < CHALLENGES) begin
			lfsr _lfsr (clk, enable, ref_reset, challenge, SC);
			
			pufigroup(clk, SC, PUFI[15:0]);
			pufigroup(clk, SC, PUFI[31:16]);
			
			
			
			mux16x1 (PUFIO[0], PUFIO[1], PUFIO[2], PUFIO[3], PUFIO[4], PUFIO[5], PUFIO[6], PUFIO[7], PUFIO[8], PUFIO[9], PUFIO[10], PUFIO[11], PUFIO[12], PUFIO[13], PUFIO[14], PUFIO[15], SC[0], SC[1], SC[2], SC[3], MUXO0);
			mux16x1 (PUFIO[16], PUFIO[17], PUFIO[18], PUFIO[19], PUFIO[20], PUFIO[21], PUFIO[22], PUFIO[23], PUFIO[24], PUFIO[25], PUFIO[26], PUFIO[27], PUFIO[28], PUFIO[29], PUFIO[30], PUFIO[31], SC[4], SC[5], SC[6], SC[7], MUXO1);
			
			counter (clk, enable, MUXO0, CNTO0);
			counter (clk, enable, MUXO1, CNTO1);
			
		end 
		else if(ref_count == CHALLENGES) begin
			enable <= 0;
		end
		
	end

	wire CMP0; // The output of the comparato;
	
	always @(posedge clk) begin
		if(count < CHALLENGES) begin
			if(!enable) begin
				
				comparator(CNT0, CNT1, enable, CMP0); 
			
				shiftregister(clk, CMP0, temp);
			
				enable <= 1;
				count <= count + 1;
			end
		end else if(count == CHALLENGES) begin
			O <= temp;
		end	
	end
	
	always @(posedge clk) begin
		if(reset) begin
			count <= 0;
			ref_reset <= 0;
		end
	end
	
	
endmodule