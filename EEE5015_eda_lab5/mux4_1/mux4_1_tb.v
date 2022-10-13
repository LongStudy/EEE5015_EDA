module mux4_1_tb();

  reg [1:0] in1, in2, in3, in4, sel;
  wire [1:0] dout;

  mux4_1 u0_mux4_1 (in1, in2, in3, in4, sel, dout);

  initial begin
    in1 = 1; in2 = 0; in3 = 3; in4 = 2; sel = 0;
    #10        sel= 1;
    #10        sel= 2;
    #10        sel= 3;
    #10 $finish;
  end

  initial begin
    $monitor("@ time=%0t,  in1=%b, in2=%b, in3=%b, in4=%b, sel=%b, dout=%b",$time, in1,in2,in3,in4,sel, dout);
  end

  initial begin
    #5   if (dout != 2'b01) $display("Error: for dout=%b", dout);
    #10  if (dout != 2'b00) $display("Error: for dout=%b", dout);
    #10  if (dout != 2'b11) $display("Error: for dout=%b", dout);
    #10  if (dout != 2'b10) $display("Error: for dout=%b", dout);
  end

initial begin
    $vcdpluson; 
  end  

endmodule
