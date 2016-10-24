module register #(parameter size)(
    input [size-1:0] Data,
    input Load, Reset, Clk,
    output logic [size-1:0] Data_out
    );
	 
    always_ff @(posedge Clk or posedge Reset) begin
        if(Reset==1'b1)
            Data_out <= 0;
        else if(Load)
            Data_out <= Data;
        else
            Data_out <= Data_out;
    end

endmodule // register

module split_reg #(parameter size)(
    input [size-1] Data,
    input Load, Reset, Clk, H_Load, L_Load,
    output logic [size-1:0] Data_out
    );

    always_ff @(posedge Clk or posedge Reset) begin
        if(Reset==1'b1)
            Data_out <= 0;
        else if(Load)
            Data_out <= Data;
        else if(H_Load)
            Data_out[15:8] <= Data[15:8];
        else if(L_Load)
            Data_out[7:0] <= Data[7:0];
        else
            Data_out <= Data_out;
    end

endmodule // split_reg
