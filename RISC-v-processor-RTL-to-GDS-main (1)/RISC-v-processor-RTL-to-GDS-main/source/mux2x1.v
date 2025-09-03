`timescale 1ns / 1ps

module mux2x1(
    input wire [31:0] in0,
    input wire [31:0] in1,
    input wire select,
    output wire [31:0] out
);

    assign out = select ? in1 : in0;

endmodule
