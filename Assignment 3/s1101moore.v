module s1101moore (
  input clk, // clock signal
  input rst, // reset signal
  input din, // input signal
  output reg dout // output signal
);

// Define the states
parameter S0 = 3'b000; // Initial state
parameter S1 = 3'b001; // Found 1
parameter S2 = 3'b010; // Found 11
parameter S3 = 3'b011; // Found 110
parameter S4 = 3'b100; // Found 110

// Define the state register
reg [2:0] state;
always @(posedge clk, posedge rst) begin
  if (rst) begin
    state <= S0;
  end
  else begin
    case (state)
      S0: if (din) state <= S1;
          else state <= S0;
      S1: if (din) state <= S2;
          else state <= S0;
      S2: if (din) state <= S2;
          else state <= S3;
      S3: if (din) state <= S4;
          else state <= S0;
      S4: if (din) state <= S1;
          else state <= S0;
      default: state <= S0;
    endcase
  end
end

// Define the output logic
always @(state) begin
  case (state)
    S4: dout <= 1'b1;
    default: dout <= 1'b0;
  endcase
end

endmodule