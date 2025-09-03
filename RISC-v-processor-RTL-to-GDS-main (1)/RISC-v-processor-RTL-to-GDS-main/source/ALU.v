`timescale 1ns / 1ps

module ALU(
    input wire clk,
    input wire [31:0] a, b,
    input wire [5:0] alufn, // 6-bit ALU operation code
    output reg [31:0] otp,
    output reg zero,        // Set if the output is 0
    output reg overflow
);

always @(*) begin
    casex (alufn)
        6'b0000xx: begin // Arithmetic Operations
            case (alufn[1:0])
                2'b00: begin // ADD
                    otp = a + b;
                    zero = (otp == 0) ? 1 : 0;
                    overflow = ((a >= 0 && b >= 0 && otp < 0) || (a < 0 && b < 0 && otp >= 0)) ? 1 : 0;
                end
                2'b01: begin // SUB
                    otp = a - b;
                    zero = (otp == 0) ? 1 : 0;
                    overflow = ((a >= 0 && b < 0 && otp < 0) || (a < 0 && b >= 0 && otp > 0)) ? 1 : 0;
                end
                2'b10: begin // MUL
                    otp = a * b;
                    zero = (otp == 0) ? 1 : 0;
                    overflow = 0;
                end
            endcase
        end
        6'b0001xx: begin // Logical Operations
            case (alufn[1:0])
                2'b00: otp = a & b; // AND
                2'b01: otp = a | b; // OR
                2'b10: otp = a ^ b; // XOR
            endcase
            zero = (otp == 0) ? 1 : 0;
            overflow = 0;
        end
        6'b0010xx: begin // Shift Operations
            case (alufn[1:0])
                2'b00: otp = a << b; // SHIFT LEFT
                2'b01: otp = a >> b; // SHIFT RIGHT
                2'b11: otp = (a < b) ? 1 : 0; // SLT
            endcase
            zero = (otp == 0) ? 1 : 0;
            overflow = 0;
        end
        default: otp = 32'b0; // Default case
    endcase
end

endmodule
