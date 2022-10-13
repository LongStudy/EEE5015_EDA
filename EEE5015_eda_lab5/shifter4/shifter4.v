module shifter4(rst_n,clk,load,data,enable,q);
    input clk,rst_n,load,enable;
    input [3:0] data;
    output reg [3:0] q;


    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            q <= 0;
        end else begin
            if(load==1) begin
                q <= data;
            end else begin
                if(enable==1) begin
                    q <= { q[0] ,q[3:1] };
                end else begin
                    q <= q;
                end
            end
        end
    end


endmodule
