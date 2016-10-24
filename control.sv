module control(
	input Clk, Reset, Run,
	input[15:0] SP,
	input [7:0] IR,
	input logic mem_resp,
	output IR_Load,
    output logic PC_Load,MAR_Load,MDR_Load,
	output logic mem_read,mem_write,
	output logic MAR_Select, MDR_Select,
	output logic [1:0] mem_byte_enable,
    output logic [3:0] ALU_Select,
	output logic [2:0] State_curr,
	output logic [1:0] PC_Select
    );
	 
enum logic [2:0] {s_halt,fetch1,fetch2,fetch3,decode} State, Next_State;

logic IR_L,MAR_L,MDR_L;
assign IR_Load = IR_L;
assign MAR_Load = MAR_L;
assign MDR_Load = MDR_L;

// DEBUG
assign State_curr = State;

always_ff @(posedge Clk or posedge Reset) begin: Assign_Next_State
	if(Reset)
		State <= s_halt;
	else
		State <= Next_State;
end

always_comb begin
	Next_State = State;
	case(State)
		s_halt:
			if(Run) Next_State <= fetch1;
		fetch1:
			Next_State <= fetch2;
		fetch2:
			Next_State <= fetch3;
		fetch3:
			Next_State <= decode;
		decode: 
			Next_State <= fetch1;
	endcase
end

always_comb begin
	PC_Load = 1'b0;
	PC_Select = 2'b00;
	ALU_Select = 4'b0000;
	mem_write = 1'b0;
	mem_read = 1'b0;
	IR_L = 1'b0;
	MAR_L = 1'b0;
	MDR_L = 1'b0;
	mem_byte_enable = 2'b00;
	MAR_Select = 1'b0;
	MDR_Select = 1'b0;
		case(State)
			s_halt: /* Do nothing */;
			fetch1: begin
				/* MAR <- PC */
				MAR_L = 1'b1;
				/* PC <- PC + 2 */
				PC_Load = 1'b1;
			end
			fetch2: begin
				/* Read Memory */
				mem_read = 1'b1;
			end
			fetch3: begin
				/* Load IR */
				IR_L = 1'b1;
			end
			decode: /* Do nothing */;
			default: /* Do nothing */;
		endcase
end

endmodule // control