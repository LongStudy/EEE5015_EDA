module seq_detect_tb();
    reg			clk;
    reg			rst_n;
    reg 		din;
    wire		result;

    seq_detect u_seq_detect(
        .clk(clk),
        .rst_n(rst_n),
        .din(din),
        .result(result)
    );

    integer seed;
    initial begin
        if(!$value$plusargs("seed=%d",seed)) begin
            seed = 100;
        end else begin
            $display("Random function with the SEED=%d", seed);
        end
    end 

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

    initial begin
        rst_n 	 = 1'b1;
        #10
        rst_n 	 = 1'b0;
        #10
        rst_n 	 = 1'b1;
    end

    always @(posedge clk) begin
        din <= {$random(seed)}%2;	
    end

    initial begin
        #5000 $finish;
    end

    initial begin
        $vcdpluson; 
    end

endmodule