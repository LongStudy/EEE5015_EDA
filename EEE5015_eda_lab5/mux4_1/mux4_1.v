module mux4_1 (in1, in2, in3, in4, sel, dout);
    input wire [1:0] in1, in2, in3, in4;
    input wire [1:0] sel;
    output wire [1:0] dout;
    assign dout = (sel == 0) ? in1 : (sel == 1) ? in2 : (sel == 2) ? in3 : in4;

endmodule
