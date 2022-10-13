module shifter4_tb();
    reg clk,rst_n,load,enable;
    reg [3:0] data;
    wire [3:0] q;

    shifter4 u_shifter4(rst_n,clk,load,data,enable,q);

    parameter CLK_PERIOD = 20;

    initial begin
        clk = 0;
        forever begin
            #(CLK_PERIOD/2) clk = ~clk;
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


    integer seed;
    initial begin
        if(!$value$plusargs("seed=%d",seed)) begin
            seed = 100;
        end else begin
            $display("Random function with the SEED=%d", seed);
        end
    end 
  

    initial begin
        rst_n = 1;
        load = 0;
        enable = 0;
        data = 0;
        #40 
        rst_n = 0;
        data = $random(seed);
        $display ("%t:%m: load data=%0d", $time, data);
        #10
        rst_n = 1;
        #10
        load = 1;
        #20 
        load = 0;
        #20 
        enable = 1;
    end


    initial begin
        #300 $finish;
    end


    initial begin
        $vcdpluson; 
    end

endmodule