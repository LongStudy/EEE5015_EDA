
module divider1000_tb;
    reg clk,rst_n;
    wire clk_out;

    divider1000 u_divider1000(rst_n,clk,clk_out);

    reg [11:0] count;

    parameter CLK_PERIOD = 2;
    initial begin
        clk = 0;
        forever begin
            #(CLK_PERIOD/2) clk = ~clk;
        end
    end

    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 0;
        end
        else begin
            if (clk_out) begin
                count <= count + 1;
            end
        end
    end

    always @ (posedge rst_n or negedge rst_n) begin
        if (!rst_n) begin
        $display("%t:%m: resetting ......",$time); 
        end
        else begin
        $display("%t:%m: resetting finish", $time); 
        end
    end

    initial begin
        rst_n = 1;
        #100 
        rst_n = 0;
        #4 
        rst_n = 1;
        #2002
        if (clk_out != 1) $display("high error");
        else $display("%t:%m: high ok", $time);
        #2002
        if (clk_out != 0) $display("low error");
        else $display("%t:%m: low ok", $time);
        if(count != 1001) $display("divider error");
        else $display("%t:%m:divider ok", $time);
    end


    initial begin
        #5000 $finish;
    end


    initial begin
        $vcdpluson; 
    end

endmodule