`timescale 1ns / 1ps

module MainMemoryModule(
    input wire clk,
    input wire [31:0] address,
    input wire readEnable,
    input wire writeEnable,
    input wire [31:0] dataIn,
    output reg [31:0] dataOut
);

// Memory Declaration (8K x 32-bit)
reg [31:0] memory [8191:0]; 

// Initialize Memory with Sample Instructions
initial begin
    memory[0] = 32'b00000000001000100001100000000000; // ADD R1, R2 → R3
    // memory[8] = 32'b00000000001000100001100000000000;
end

// Read Operation (Combinational Logic)
always @(*) begin
    if (readEnable)
        dataOut = memory[address];
end

// Write Operation (Synchronous)
always @(posedge clk) begin
    if (writeEnable && !readEnable) 
        memory[address] <= dataIn;
end

endmodule
