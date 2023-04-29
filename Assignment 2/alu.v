module alu(
    input [7:0] a,
    input [7:0] b,
    input [2:0] opcode,
    input cin,
    output reg [7:0] op,
    output reg cout,
    output reg cflag,
    output reg zflag
);

always @(*)
begin
 case (opcode)
   3'b000 : begin op = a + b; end
   3'b001 : begin op = a - b; end
   3'b010 : begin op = a && b; end
   3'b011 : begin op = a | b; end
   3'b100 : begin op = a ^ b; end
   3'b101 : begin op = a > b; end
   3'b110 : begin op = a << 1; end
   3'b111 : begin op = b << 1; end
   default:op = 8'bXXXXXXXX;
 endcase
end

endmodule