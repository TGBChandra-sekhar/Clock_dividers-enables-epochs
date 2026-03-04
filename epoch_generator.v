module epoch_gen (
        clk,      
        rst,      
        epoch_1ms, 
        epoch_20ms,
        epoch_1s,
        epoch_1p5s 
    );  

    
    input clk;             // 40.92 MHz
    input rst;
    output reg epoch_1ms;  // 1 KHz
    output reg epoch_20ms; // 50 Hz
    output reg epoch_1s;   // 1 Hz
    output reg epoch_1p5s; // 666.66 KHz

    reg [31:0] count;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count      <= 0;
            epoch_1ms  <= 0;
            epoch_20ms <= 0;
            epoch_1s   <= 0;
            epoch_1p5s <= 0;
        end else begin
            count <= count + 1'b1;
    
            epoch_1ms  <= (count == 32'd40919);
            epoch_20ms <= (count == 32'd818399);
            epoch_1s   <= (count == 32'd40919999);
            epoch_1p5s <= (count == 32'd61379999);
    
            if (count == 32'd61379999)
                count <= 32'd0;
        end
    end

endmodule
