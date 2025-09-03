`timescale 1ns / 1ps

module alu_control(
    input      [31:0] instruction,  // Full instruction word
    input      [2:0]  ALUOp,        // ALU operation control signal
    output reg [5:0]  ALUFn         // ALU function code
);

always @(*) begin
    case (ALUOp)
        3'b010: ALUFn = instruction[5:0]; // Use function field from instruction (R-type)
        3'b000: ALUFn = 6'b000000; // ADD operation
        3'b001: ALUFn = 6'b000001; // SUB operation
        3'b011: ALUFn = 6'b000000; // AND operation
        3'b100: ALUFn = 6'b000100; // OR operation
        3'b101: ALUFn = 6'b000110; // XOR operation
        3'b110: ALUFn = 6'b001011; // SLT operation (Set Less Than)
        default: ALUFn = 6'b000000; // Default case (safe handling)
    endcase
end

endmodule

