module multi_clk_div (
        clk,     
        rst,      
        clk_div2,
        clk_div4, 
        clk_div8, 
        clk_div16    
    );
  
    input  clk;
    input  rst;
    output clk_div2;
    output clk_div4;
    output clk_div8;
    output clk_div16;
    
    reg [3:0] count;
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 0;
        else
            count <= count + 1'b1;
    end
    
      assign clk_div2  = count[0]; 
      assign clk_div4  = count[1]; 
      assign clk_div8  = count[2]; 
      assign clk_div16 = count[3]; 
    
endmodule
