// Code your testbench here
// or browse Examples
/* ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 0011  |   ALU_Out = A / B;
----------------------------------------------------------------------
| 0100  |   ALU_Out = A << 1;
----------------------------------------------------------------------
| 0101  |   ALU_Out = A >> 1;
----------------------------------------------------------------------
| 0110  |   ALU_Out = A rotated left by 1;
----------------------------------------------------------------------
| 0111  |   ALU_Out = A rotated right by 1;
----------------------------------------------------------------------
| 1000  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 1001  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 1010  |   ALU_Out = A xor B;
----------------------------------------------------------------------
| 1011  |   ALU_Out = A nor B;
----------------------------------------------------------------------
| 1100  |   ALU_Out = A nand B;
----------------------------------------------------------------------
| 1101  |   ALU_Out = A xnor B;
----------------------------------------------------------------------
| 1110  |   ALU_Out = 1 if A>B else 0;
----------------------------------------------------------------------
| 1111  |   ALU_Out = 1 if A=B else 0;
----------------------------------------------------------------------*/
// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for ALU
// by FPGA4STUDENT
module alu(
           input [7:0] A,B,  // ALU 8-bit Inputs                 
  input [2:0] ALU_Sel,// ALU Selection
           output [7:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
        3'b000: // Addition
           ALU_Result = A + B ; 
        3'b001: // Subtraction
           ALU_Result = A - B ;
        3'b010: // Multiplication
           ALU_Result = A * B;
        3'b011: // Division
           ALU_Result = A/B;
        3'b100: // Logical shift left
           ALU_Result = A<<1;
         3'b101: // Logical shift right
           ALU_Result = A>>1;
         3'b110: // Rotate left
           ALU_Result = {A[6:0],A[7]};
         3'b111: // Rotate right
           ALU_Result = {A[0],A[7:1]};
          default: ALU_Result = A + B ; 
        endcase
    end

endmodule
Testbench Verilog code for the ALU:
// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for ALU
// by FPGA4STUDENT
 `timescale 1ns / 1ps  

module tb_alu;
//Inputs
 reg[7:0] A,B;
  reg[2:0] ALU_Sel;

//Outputs
 wire[7:0] ALU_Out;
 wire CarryOut;
 // Verilog code for ALU
 integer i;
 alu test_unit(
            A,B,  // ALU 8-bit Inputs                 
            ALU_Sel,// ALU Selection
            ALU_Out, // ALU 8-bit Output
            CarryOut // Carry Out Flag
     );
    initial begin
    // hold reset state for 100 ns.
      A = 8'h0A;
      B = 4'h02;
      ALU_Sel = 3'h0;
      
      for (i=0;i<=15;i=i+1)
      begin
       ALU_Sel = ALU_Sel + 8'h01;
       #10;
      end;
      
      A = 8'hF6;
      B = 8'h0A;
      
    end
endmodule