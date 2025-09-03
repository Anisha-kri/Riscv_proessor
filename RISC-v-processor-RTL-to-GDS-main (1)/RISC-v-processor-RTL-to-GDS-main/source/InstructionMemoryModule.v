`timescale 1ns / 1ps

module InstructionMemoryModule(
    input wire clk,
    input wire [31:0] address,
    input wire readEnable,
    input wire writeEnable,
    input wire [31:0] dataIn,
    output reg [31:0] dataOut
);

// Memory Declaration (8K x 32-bit)
reg [31:0] memory [8191:0];

// Initial Memory Contents
initial begin
    // Example Instructions
    memory[0] = 32'b00000000011000100000100000000000;
    memory[1] = 32'b00000000110001010010000000000000;
    memory[2] = 32'b00000000100000010000100000000001;
    memory[3] = 32'b01000000001000010000000001000000;
    memory[4] = 32'b01001100001000100000000000000011;
    memory[5] = 32'b01000000101001010000000000010000;
    memory[6] = 32'b00000000100001010010100000000001;
    memory[7] = 32'b00000000100000010000100000000000;
    memory[8] = 32'b00000001000000010001000000000001;
end

// Read Operation
always @(address) begin
    if (readEnable)
        dataOut = memory[address]; 
    
    // Debugging Output
    $display("Instruction Memory: Address = %d | DataOut = %b", address, dataOut);
end

endmodule
