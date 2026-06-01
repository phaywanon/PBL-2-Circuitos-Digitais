module flipflop_D_descida(
  input wire clk,
  input wire rst_n, // Active-low asynchronous reset
  input wire en,    // Enable signal
  input wire d,
  output reg q
);

  always @(negedge clk or negedge rst_n) begin
    if (!rst_n) begin // Asynchronous reset
      q <= 1'b0;
    end else if (en) begin // Synchronous enable
      q <= d;
    end
  end

endmodule