
module divider1000(rst_n,clk,clk_out);
    input clk,rst_n;
    output reg clk_out;

reg [9:0] cnt;
 
 
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        cnt <= 0;
        clk_out <= 0;
    end
    else
    begin
        if(cnt == 1000)
        begin
            clk_out <= ~clk_out;
            cnt <= 0;
        end
        else
        begin
            cnt <= cnt + 1;
        end
    end
end

endmodule

