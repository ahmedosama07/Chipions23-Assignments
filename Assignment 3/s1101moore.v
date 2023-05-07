module s1101moore (
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
reg [1:0] state;
always @(posedge clk, posedge rst) begin
  if (rst) begin
    state <= S0;
  end
  else begin
    case (state)
      S0: if (din) state <= S1;
          else state <= S0;
      S1: if (din) state <= S2;
          else state <= S1;
      S2: if (din) state <= S3;
          else state <= S1;
      S3: if (din) state <= S1;
          else state <= S2;
      default: state <= S0;
    endcase
  end
end

// Define the output logic
always @(state) begin
  case (state)
    S3: dout <= 1'b1;
    default: dout <= 1'b0;
  endcase
end

endmodule