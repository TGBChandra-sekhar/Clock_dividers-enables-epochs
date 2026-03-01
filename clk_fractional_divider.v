// DDS Method
module fractional_divider (
        clk,
        rst,
        fcw,
        clk_out  
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
