module alu(
    input [7:0] a,
    input [7:0] b,
    input [2:0] opcode,
    input cin,
    output reg [7:0] out,
    output reg cout,
    output reg cflag,
    output reg zflag
);
wire [7:0] add;
wire [7:0] neg;
wire c;
wire [7:0] negB;
fulladder sum(.a(a),.b(b),.cin(cin),.sum(add),.cout(c));
assign negB = 8'b11111111 ^ b;
fulladder sub(.a(a),.b(negB),.cin(1'b1),.sum(neg),.cout(c));
always @(*)
begin
 case (opcode)
   3'b000 : begin 
    out = add;
    cout = c;
    end
   3'b001 : begin
    out = neg;
    cout = c;
   end
   3'b010 : begin 
    out = a && b;
   end
   3'b011 : begin
    out = a | b;
   end
   3'b100 : begin
    out = a ^ b;
   end
   3'b101 : begin 
    out = a > b;
    if (a > b) begin
        cflag = 1;
    end
    else begin
        cflag = 0;
    end
    end
   3'b110 : begin out = a << 1; end
   3'b111 : begin out = b << 1; end
   default:out = 8'bXXXXXXXX;
 endcase

 case (out)
    8'b00000000 : zflag = 1; 
    default: 
    zflag = 0;
 endcase
end

endmodule