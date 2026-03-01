//CLock divider by 2 with 50% duty cycle
module clk_div_2 (
    clk,
    rst,
    clk_out
    );
    
    input clk;
    input rst;
    output reg clk_out;
    
    always@(posedge clk or posedge rst) begin
        if(rst) begin
            clk_out <= 1'b0;
        end
        else begin
            clk_out <= ~clk_out;
        end
    end
endmodule

