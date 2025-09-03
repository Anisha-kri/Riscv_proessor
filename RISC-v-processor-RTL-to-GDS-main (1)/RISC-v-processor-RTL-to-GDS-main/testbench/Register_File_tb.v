`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2025 23:21:05
// Design Name: ALU Testbench
// Module Name: ALU_tb
// Project Name: ALU Simulation
// Target Devices: 
// Tool Versions: 
// Description: 
// This is a testbench for the ALU module. It tests the ALU operations 
// such as add, subtract, multiply, logical AND, logical OR, XOR, 
// and shift left/right with a variety of inputs.
// 
// Dependencies: ALU module
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb;
    // Testbench signals
    reg [31:0] a, b;              // Operand inputs
    reg [5:0] alufn;              // ALU function selector
    wire [31:0] otp;              // ALU output
    wire overflow, zero;          // Overflow and zero flags

    // Instantiate the ALU module
    ALU alu_inst_1 (
        .a(a),
        .b(b),
        .alufn(alufn),
        .otp(otp),
        .overflow(overflow),
        .zero(zero)
    );
    
    // Initial block for simulation
    initial begin
        // Test case 1: Addition (ALU Function 000000)
        #100;
        alufn = 6'b000000;     // ALU function code for addition
        a = 32'h00000001;      // Operand a = 1
        b = 32'h00000001;      // Operand b = 1

        // Test case 2: Subtraction (ALU Function 000001)
        #100;
        alufn = 6'b000001;     // ALU function code for subtraction
        a = 32'h00000013;      // Operand a = 19
        b = 32'h00000002;      // Operand b = 2

        // Test case 3: Multiplication (ALU Function 000010)
        #100;
        alufn = 6'b000010;     // ALU function code for multiplication
        a = 32'h00000013;      // Operand a = 19
        b = 32'h00000002;      // Operand b = 2

        // Test case 4: AND operation (ALU Function 000100)
        #100;
        alufn = 6'b000100;     // ALU function code for AND
        a = 32'h00000001;      // Operand a = 1
        b = 32'h00000000;      // Operand b = 0

        // Test case 5: OR operation (ALU Function 000101)
        #100;
        alufn = 6'b000101;     // ALU function code for OR
        a = 32'h00000001;      // Operand a = 1
        b = 32'h00000000;      // Operand b = 0

        // Test case 6: XOR operation (ALU Function 000110)
        #100;
        alufn = 6'b000110;     // ALU function code for XOR
        a = 32'h00000001;      // Operand a = 1
        b = 32'h00000000;      // Operand b = 0

        // Test case 7: Shift Left operation (ALU Function 001000)
        #100;
        alufn = 6'b001000;     // ALU function code for shift left
        a = 32'h00000001;      // Operand a = 1
        b = 32'h00000003;      // Operand b = 3

        // Test case 8: Shift Right operation (ALU Function 001001)
        #100;
        alufn = 6'b001001;     // ALU function code for shift right
        a = 32'h00000010;      // Operand a = 16
        b = 32'h00000003;      // Operand b = 3

        // Additional test cases can be added here in a similar fashion.
    end

    // Monitor output and flags for debugging
    initial begin
        $monitor("At time %t, ALU Output = %h, Overflow = %b, Zero = %b", $time, otp, overflow, zero);
    end
    
endmodule
