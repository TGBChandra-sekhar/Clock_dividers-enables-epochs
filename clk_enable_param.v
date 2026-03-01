module clk_enable (
        clk,
        rst,
        clk_out
    );
    
    input clk,rst;
    output reg clk_out;
    
    parameter integer N = 20;
    
    reg [$clog2(N)-1:0]count;
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            clk_out <= 1'b0;
            count <= 'b0;
        end
        else begin
            if(count == N - 1) begin
                count <= 'd0;
            end
            else begin
                count <= count + 'd1;
            end
            clk_out <= (count == 'd0);
        end
    end
endmodule
