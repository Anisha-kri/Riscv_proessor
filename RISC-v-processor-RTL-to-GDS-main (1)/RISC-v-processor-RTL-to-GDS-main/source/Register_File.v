`timescale 1ns / 1ps

module Register_File(
    input wire clk,
    input wire reset,         // Added reset signal
    input wire [4:0] read_addr1,
    input wire [4:0] read_addr2,
    input wire [4:0] write_addr,
    input wire [31:0] write_data,
    input wire write_enable,
    output reg [31:0] read_data1,
    output reg [31:0] read_data2
);

/*************************
******* REGISTER FILE *****
*************************/
reg [31:0] Register_File [31:0]; // 32 registers, each 32-bit wide

/*************************
******* INITIALIZATION ****
*************************/
initial begin
    Register_File[0] = 32'h00000000; // Register 0 is always zero
    Register_File[1] = 32'h00000000;
    Register_File[2] = 32'h00000050;
    Register_File[3] = 32'h00000000;
    Register_File[4] = 32'h00000006;
    Register_File[5] = 32'h00000040;
    Register_File[6] = 32'h00000000;
    Register_File[7] = 32'h00000009;
    Register_File[8] = 32'h00000001;
end

/*************************
******* READ LOGIC *******
*************************/
always @(*) begin
    read_data1 = (read_addr1 == 5'b00000) ? 32'h00000000 : Register_File[read_addr1];
    read_data2 = (read_addr2 == 5'b00000) ? 32'h00000000 : Register_File[read_addr2];
end

/*************************
******* WRITE LOGIC ******
*************************/
always @(posedge clk or posedge reset) begin
    if (reset) begin
        Register_File[0] <= 32'h00000000; // Reset register 0
    end else if (write_enable && write_addr != 5'b00000) begin
        Register_File[write_addr] <= write_data;
    end
end

endmodule
