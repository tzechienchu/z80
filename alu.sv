module alu(
    input[3:0] ALU_Select,
    input[7:0] A,B,
    output[7:0] ALU_Out
    );
    
    always_comb begin
        case(ALU_Select)
            4'b0000: // ADD
                ALU_Out = A+B;
            4'b0001: // SUBTRACT
                ALU_Out = A-B;
            4'b0010: // LOGICAL AND
                ALU_Out = A&B;
            4'b0011: // LOGICAL OR
                ALU_Out = A|B;
            4'b0100: // LOGICAL XOR
                ALU_Out = A^B;
            4'b0101: // 
                ALU_Out = '0;
            4'b0110:
                ALU_Out = '0;
            4'b0111:
                ALU_Out = '0;
            4'b1000:
                ALU_Out = '0;
            4'b1001:
                ALU_Out = '0;
            4'b1010:
                ALU_Out = '0;
            4'b1011:
                ALU_Out = '0;
            4'b1100:
                ALU_Out = '0;
            4'b1101:
                ALU_Out = '0;
            4'b1110:
                ALU_Out = '0;
            4'b1111:
                ALU_Out = '0;
			endcase
    end


endmodule // alu