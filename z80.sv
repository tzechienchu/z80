module z80(
    input Clk,Reset,Run,
	output [2:0] State_curr,
    output logic [15:0] PC_Out,SP_Out,MAR_Out,MDR_Out,
	output logic [7:0] IR_Out,
	output logic Clk4,Clk8,
	output logic [19:0] ADDR
    );

    clock clock(.*);

    // PC 
    //
    logic[1:0] PC_Select;
    logic[15:0] PC_In;
    logic PC_Load;
	logic [3:0] ALU_Select;
    register#(16) PC(.Data(PC_In),.Clk(Clk4),.Load(PC_Load),.Reset(~Reset),.Data_out(PC_Out));
	 
	initial begin
		PC_Select = '0;
        MAR_Select = '0;
		Clk4 = '0;
		Clk8 = '0;
	end

    always_comb begin 
        case(PC_Select)
            2'b00 : PC_In <= PC_Out + 16'h2;
            2'b01 : PC_In <= PC_Out + 16'h4;
            2'b10 : PC_In <= PC_Out;
            2'b11 : PC_In <= PC_Out;
        endcase // PC_Select
    end

    // IR
    //
    wire[7:0] IR_In;
    wire IL_Load;
    register#(8) IR(.Data(IR_In),.Clk(Clk4),.Load(IL_Load),.Reset(~Reset),.Data_out(IR_Out));

    // MAR
    // 
    logic[15:0] MAR_In;
    wire MAL_Load;
    logic MAR_Select;
    register#(16) IR(.Data(MAR_In),.Clk(Clk4),.Load(MAL_Load),.Reset(~Reset),.Data_out(MAR_Out));

    always_comb begin 
        case(MAR_Select)
            1'b0 : MAR_In <= PC_Out;
            1'b1 : MAR_In <= PC_Out; // TODO: Change to get from instruction
    end

    // MDR
    // 
    logic[15:0] MDR_In;
    wire MDL_Load;
    register#(16) IR(.Data(MDR_In),.Clk(Clk4),.Load(MDL_Load),.Reset(~Reset),.Data_out(MDR_Out));

    always_comb begin 
        case(MDR_Select)
            1'b0 : MDR_In <= mem_rdata; 
            1'b1 : MDR_In <= '0; // TODO: Change to get from instruction
    end

    // SP
    // 
    logic[15:0] SP_In;
    wire SP_Load;
    register#(16) SP(.Data(SP_In),.Clk(Clk4),.Load(SP_Load),.Reset(~Reset),.Data_out(SP_Out));

    // Registers
    // AF,BC,DE,HL
    logic[15:0] AF_In,BC_In,DE_In,HL_In;
    logic[15:0] AF_Out,BC_Out,DE_Out,HL_Out;
    logic AF_Load, AF_H_Load, AF_L_Load;
    logic BC_Load, BC_H_Load, BC_L_Load;
    logic DE_Load, DE_H_Load, DE_L_Load;
    logic HL_Load, HL_H_Load, HL_L_Load;
    split_reg#(16) regs[3:0](.Data({AF_In,BC_In,DE_In,HL_In}),
                             .Load({AF_Load,BC_Load,DE_Load,HL_Load}),
                             .Reset(~Reset),
                             .Clk(Clk4),
                             .H_Load({AF_H_Load,BC_H_Load,DE_H_Load,HL_H_Load}),
                             .L_Load({AF_L_Load,BC_L_Load,DE_L_Load,HL_L_Load}));

    // Memory
    // 
    always_comb begin
        case(Addr_Select)
            1'b0 : ADDR = {4'b0000,PC_Out};
            1'b1 : ADDR = {4'b0000,HL_Out};
    end
    logic mem_read,mem_write,mem_resp;
    logic [1:0] mem_byte_enable;
    logic [15:0] mem_rdata, mem_wdata;
    test_memory mem(.*,.WE(mem_write),.RE(mem_read),.mem_in(mem_wdata),.mem_out(mem_rdata),.wmask(mem_byte_enable),
                    .Clk(Clk4),.Reset(~Reset),.I_O(IR_In),.A(ADDR));

    // Control Logic
    // 
    control control(.*,.Clk(Clk4),.IR(IR_Out),.SP(SP_Out),.Run(~Run),.Reset(~Reset));

endmodule // z80
