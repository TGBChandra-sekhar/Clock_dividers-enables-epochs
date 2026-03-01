// DDS Method
module fractional_divider (
        clk,        // 100 MHz
        rst,
        fcw,
        clk_out     // 4.092 MHz
    );

    input  clk;
    input  rst;
    input  [31:0] fcw; // Frequency Control Word
    output reg clk_out;
    
    reg [31:0] phase_acc;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            phase_acc <= 32'd0;
            clk_out   <= 1'b0;
        end 
        else begin
            phase_acc <= phase_acc + fcw;
            clk_out   <= phase_acc[31];
        end
    end

endmodule


// Test Bench
`timescale 1ns / 1ps

module fractional_divider_tb();
    reg clk,rst;
    reg [31:0]fcw;
    wire clk_out;
        
    fractional_divider uut (
        .clk    (clk    ),
        .rst    (rst    ),
        .fcw    (fcw    ),
        .clk_out(clk_out)
    );
    
    always #5 clk = ~clk;  // 100 MHz
    
    initial begin
        clk = 0;
        rst = 1;
        fcw = 32'd175750061; 
        #10;
        rst = 0;
    end
endmodule
