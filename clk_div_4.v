module clk_div_4 (
        clk,
        rst,
        clk_out
    );
   
    input clk;
    input rst;
    output reg clk_out;
    
    reg [1:0]count;
    
    always@(posedge clk or posedge rst) begin
        if(rst) begin
            clk_out <= 1'b0;
            count <= 2'd0;
        end
        else begin
            if(count == 2'b1) begin
                count <= 2'd0;
                clk_out <= ~clk_out;
            end
            else 
                count <= count + 2'd1;
        end
    end
endmodule
