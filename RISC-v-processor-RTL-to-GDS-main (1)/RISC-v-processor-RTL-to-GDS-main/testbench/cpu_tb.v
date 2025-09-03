`timescale 1ns / 1ps

module cpu_tb;
    reg clk;
    reg rst;
    
    // Instantiate CPU module
    cpu uut (
        .clk(clk),
        .rst(rst)
    );

    // Generate Clock Signal
    always begin
        #5 clk = ~clk;  // 10 ns clock period (100 MHz)
    end 

    // Test Sequence
    initial begin
        $dumpfile("cpu_tb.vcd");  // Enable waveform dumping
        $dumpvars(0, cpu_tb);

        clk = 1'b0;   // Initialize clock
        rst = 1'b1;   // Assert reset
        #20 rst = 1'b0; // Deassert reset after 20 ns
        
        // Run the test for a specific duration
        #2000;
        $display("Simulation Completed");
        $finish;
    end
endmodule
