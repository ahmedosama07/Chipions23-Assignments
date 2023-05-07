module s1101mealy (
  input clk, // clock signal
  input rst, // reset signal
  input din, // input signal
  output reg dout // output signal
);

// Define the states
parameter S0 = 2'b00; // Initial state
parameter S1 = 2'b01; // Found 1
parameter S2 = 2'b10; // Found 11
parameter S3 = 2'b11; // Found 110

// Define the state register
reg [1:0] state_reg;
always @(posedge clk, posedge rst) begin
  if (rst) begin
    state_reg <= S0;
    dout <= 1'b0;
  end else begin
    case (state_reg)
      S0: if (din) begin
            state_reg <= S1;
            dout <= 1'b0;
          end else begin
            state_reg <= S0;
          end
      S1: if (din) begin
            state_reg <= S2;
            dout <= 1'b0;
          end else begin
            state_reg <= S0;
          end
      S2: if (din) begin
            state_reg <= S2;
            dout <= 1'b0;
          end else begin
            state_reg <= S3;
          end
      S3: if (din) begin
            state_reg <= S0;
            dout <= 1'b1;
          end else begin
            state_reg <= S0;
          end
      default: begin
            state_reg <= S0;
            dout <= 1'b0;
          end
    endcase
  end
end
endmodule