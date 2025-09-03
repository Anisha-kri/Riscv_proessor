`timescale 1ns / 1ps

module Control_Unit(
    input  [31:0] instruction,
    output reg       RegDst,    // Destination for I and R type instruction
    output reg       ALUSrc,    // Selects ALU input (Register or Immediate)
    output reg       MemToReg,  // Controls memory to register data path
    output reg       RegWrite,  // Enables Register File write
    output reg       MemRead,   // Enables Memory Read
    output reg       MemWrite,  // Enables Memory Write
    output reg       Branch,    // Enables branching for BEQ instruction
    output reg [2:0] ALUOp,     // ALU Opcode control
    output reg       Jump       // Enables jump instruction
);

// Extract opcode from instruction
wire [5:0] opcode;
assign opcode = instruction[31:26];

// Control signals storage
reg [10:0] controlSignals[63:0];

initial begin
    controlSignals[6'b000000] = 11'b10010000100; // R-type
    controlSignals[6'b010000] = 11'b01010000110; // ADDI
    controlSignals[6'b010001] = 11'b01010001000; // ANDI
    controlSignals[6'b010010] = 11'b01010001010; // XORI
    controlSignals[6'b010011] = 11'b00000010010; // BEQ
    // controlSignals[6'b010100] = 11'bXXXXXXXXXXX; // BNE (Not defined)
    controlSignals[6'b010101] = 11'b01111000000; // LW
    controlSignals[6'b010110] = 11'b01001000000; // SW
    controlSignals[6'b010111] = 11'b10010000100; // SLT
    controlSignals[6'b011000] = 11'b01010001100; // SLTI
    controlSignals[6'b110000] = 11'b00000011111; // JUMP
end

// Assign control signals based on opcode
always @(instruction) begin
    {RegDst, ALUSrc, MemToReg, RegWrite, MemWrite, MemRead, 
     Branch, ALUOp, Jump} = controlSignals[opcode];
end

endmodule
