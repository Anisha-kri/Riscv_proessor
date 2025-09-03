`timescale 1ns / 1ps

module ProgramCounter(
    input clk,
    input reset,
    input zero,
    input branch,
    input jump,
    input [25:0] jumpAddress,
    input [15:0] branchOffset,
    input [31:0] regAddress,
    output reg [31:0] pc 
);
    wire [31:0] pcPlus4;
    reg [1:0] pcControl;

    initial begin
        pc <= 32'h00000000;
    end
    
    assign pcPlus4 = pc + 4;  // Increment by 4 for MIPS-style instruction fetching
    
    always @(posedge clk) begin
        if (reset)
            pc <= 32'h00000000;
        else begin
            if (jump)
                pcControl = 2'b11;
            else if (branch & (zero == 1))
                pcControl = 2'b10;
            else
                pcControl = 2'b00;
        
            case (pcControl)
                2'b00: pc <= pcPlus4;                                                       // Normal increment
                2'b01: pc <= regAddress;                                                    // Register-based jump
                2'b10: pc <= pcPlus4 + {{16{branchOffset[15]}}, branchOffset};              // Sign-extended branch address
                2'b11: pc <= {pcPlus4[31:26], jumpAddress};                                 // Jump address calculation
                default: pc <= pcPlus4;
            endcase
        end
    end
endmodule
