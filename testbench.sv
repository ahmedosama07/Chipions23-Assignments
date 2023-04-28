// Code your testbench here
// or browse Examples
module decoder_tb;
wire [7:0] out;
reg [2:0] in;
reg en;
integer i;
  decoder3to8 dut(en, in, out);

initial begin  
  $monitor( "en=%b, in=%b, out=%b ", en, in, out);
   for ( i=0; i<16; i=i+1) 
        begin
           {en,in}  = i;
            #1;
        end
end
endmodule