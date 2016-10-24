module testbench();

timeunit 10ns;  // Half clock cycle at 50 MHz
                // This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk,Clk4,Clk8,Reset,Run;
logic [1:0] State_curr;
logic [15:0] PC_Out,SP_Out,MAR_Out,MDR_Out;
logic [7:0] IR_Out;
logic [19:0] ADDR;

// A counter to count the instances where simulation results
// do no match with expected results
integer ErrorCnt = 0;
        
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
z80 comp(.*);    

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
Reset = 0;
Run = 1;

#2 Reset = 1;

#2 Run = 0;
#60 Run = 1;

if (ErrorCnt == 0)
    $display("Success!");  // Command line output in ModelSim
else
    $display("%d error(s) detected. You are bad boy!", ErrorCnt);
end
endmodule
