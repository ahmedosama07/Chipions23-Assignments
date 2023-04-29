module rippleadder_b;

reg [7:0] a;
reg [7:0] b;
reg cin;
wire [7:0] sum;
wire cout;
fulladder uut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout) );

initial begin
#10 a=8'b00000001;b=8'b00000001;cin=1'b0;
#10 a=8'b00000001;b=8'b00000001;cin=1'b1;
#10 a=8'b00000010;b=8'b00000011;cin=1'b0;
#10 a=8'b10000001;b=8'b10000001;cin=1'b0;
#10 a=8'b00011001;b=8'b00110001;cin=1'b0;
#10 a=8'b00000011;b=8'b00000011;cin=1'b1;
#10 a=8'b11111111;b=8'b00000001;cin=1'b0;
#10 a=8'b11111111;b=8'b00000000;cin=1'b1;
#10 a=8'b11111111;b=8'b11111111;cin=1'b0;
#10 $stop;
end

initial begin $monitor(" time=%0d A=%b B=%b Cin=%b Sum=%b Cout=%b",$time,a,b,cin,sum,cout);end

endmodule