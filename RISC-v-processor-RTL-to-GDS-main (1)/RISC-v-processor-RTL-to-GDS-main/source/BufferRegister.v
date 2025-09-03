`timescale 1ns / 1ps

module BufferRegister #(
    parameter N = 1  // Default width of the register
)(
    input clk,
    input clear,
    input hold,
    input wire [N-1:0] in,
    output reg [N-1:0] out
);

always @(posedge clk) begin
    if (clear)
        out <= {N{1'b0}};  // Reset output to all zeros
    else if (!hold)
        out <= in;         // Latch new input only if not holding
end

endmodule

