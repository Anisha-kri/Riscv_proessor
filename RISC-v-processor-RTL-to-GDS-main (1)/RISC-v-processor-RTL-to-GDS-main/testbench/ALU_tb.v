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
// Testbench for the ALU module. It covers a variety of ALU operations
// such as add, subtract, multiply, logical AND, OR, XOR, shift left and shift right.
// 
// Dependencies: ALU module
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

    // Define the signals for the testbench
    reg [31:0] a;              // Operand a
    reg [31:0] b;              // Operand b
    reg [5:0] alufn;           // ALU function selector
    wire [31:0] otp;           // ALU output
    wire overflow, zero;       // ALU overflow and zero flags

    // Instantiate the ALU module
    ALU alu_inst_1 (
        .a(a),
        .b(b),
        .alufn(alufn),
        .otp(otp),
        .overflow(overflow),
        .zero(zero)
    );

    // ALU operation function codes (parameterize for clarity)
    localparam ADD      = 6'b000000;
    localparam SUB      = 6'b000001;
    localparam MUL      = 6'b000010;
    localparam AND_OP   = 6'b000100;
    localparam OR_OP    = 6'b000101;
    localparam XOR_OP   = 6'b000110;
    localparam SHL     = 6'b001000;
    localparam SHR     = 6'b001001;

    // Test sequence for ALU operations
    initial begin
        // Display the start of simulation
        $display("Starting ALU test sequence...\n");

        // Add operation
        #100; 
        alufn = ADD;     
        a = 32'h00000001; 
        b = 32'h00000001;
        $display("Test 1: Add a=1, b=1 -> otp=%h, overflow=%b, zero=%b", otp, overflow, zero);

        // Subtract operation
        #100; 
        alufn = SUB;     
        a = 32'h00000013; 
        b = 32'h00000002;
        $display("Test 2: Subtract a=19, b=2 -> otp=%h, overflow=%b, zero=%b", otp, overflow, zero);

        // Multiply operation
        #100; 
        alufn = MUL;     
        a = 32'h00000013; 
        b = 32'h00000002;  
        $display("Test 3: Multiply a=19, b=2 -> otp=%h, overflow=%b, zero=%b", otp, overflow, zero);

        // AND operation
        #100; 
        alufn = AND_OP;     
        a = 32'h00000001; 
        b = 32'h00000000;
        $display("Test 4: AND a=1, b=0 -> otp=%h, overflow=%b, zero=%b", otp, overflow, zero);

        // OR operation
        #100; 
        alufn = OR_OP;     
        a = 32'h00000001; 
        b = 32'h00000000;
        $display("Test 5: OR a=1, b=0 -> otp=%h, overflow=%b, zero=%b", otp, overflow, zero);

        // XOR operation
        #100; 
        alufn = XOR_OP;     
        a = 32'h00000001; 
        b = 32'h00000000;
        $display("Test 6: XOR a=1, b=0 -> otp=%h, overflow=%b, zero=%b", otp, overflow, zero);

        // Shift Left operation
        #100; 
        alufn = SHL;     
        a = 32'h00000001; 
        b = 32'h00000003;
        $display("Test 7: Shift Left a=1, b=3 -> otp=%h, overflow=%b, zero=%b", otp, overflow, zero);

        // Shift Right operation
        #100; 
        alufn = SHR;     
        a = 32'h00000010; 
        b = 32'h00000003; 
        $display("Test 8: Shift Right a=16, b=3 -> otp=%h, overflow=%b, zero=%b", otp, overflow, zero);

        // End the testbench
        $display("Test sequence completed.");
    end
    
endmodule
