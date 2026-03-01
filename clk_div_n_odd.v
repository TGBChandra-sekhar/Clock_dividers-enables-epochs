module clk_div_n_odd (
        clk,
        rst,
        clk_out
    );
    
    input clk,rst;
    output reg clk_out;
    
    parameter integer N = 5;
    localparam HIGH_COUNT = (N + 1) / 2;
    localparam LOW_COUNT  = (N - 1) / 2;
    localparam integer COUNT_W  = $clog2(HIGH_COUNT);
    
    reg [COUNT_W-1:0]count;
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            clk_out <= 1'b0;
            count <= 'b0;
        end
        else begin
        if(clk_out) begin
            //HIGH PHASE
            if(count == HIGH_COUNT - 1) begin
                clk_out <= 1'b0;
                count   <= 'd0;
            end
            else begin
                count <= count + 'd1;
            end
        end  
        else begin
            //LOW PHASE
            if(count == LOW_COUNT - 1) begin
                clk_out <= 1'b1;
                count   <= 'd0;
            end
            else begin
                count <= count + 'd1;
            end
        end 
        end
    end
endmodule
