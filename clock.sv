module clock(
    input Clk,
    output Clk4,Clk8
    );
	 
	 logic [4:0] clk_div;
	 logic Clock_4,Clock_8;
	 
	 assign Clk4 = Clock_4;
	 assign Clk8 = Clock_8;

    initial begin
        clk_div = '0;
    end

    always_ff @(posedge Clk) begin
        clk_div <= clk_div+5'b00001;
		  if(clk_div == 5'b0000)begin
				Clock_4 <= '1;
				Clock_8 <= '1;
			end
		  if(clk_div == 5'b00110)
				Clock_8 <= '0;
		  if(clk_div == 5'b01100)begin
				Clock_4 <= '0;
				Clock_8 <= '1;
			end
		  if(clk_div == 5'b10010)
				Clock_8 <= '0;
		  if(clk_div == 5'b11000)
				clk_div <= '0;
    end

endmodule // clock