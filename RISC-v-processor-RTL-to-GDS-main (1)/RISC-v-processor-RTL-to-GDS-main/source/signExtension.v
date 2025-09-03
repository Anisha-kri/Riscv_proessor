`timescale 1ns / 1ps

module regmux2x1(
    input wire select,
    input wire [4:0] in0,
    input wire [4:0] in1,
    output wire [4:0] out
);

// 2x1 MUX using a simple assign statement
assign out = (select == 0) ? in0 : in1;

endmodule
