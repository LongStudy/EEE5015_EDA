module seq_detect(

	input 				clk,
	input				rst_n,
	input 				din,
	output	reg 		result
    );
 
reg [5:0] tmp;
 
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		tmp <= 6'd0;
	end
	else begin
        tmp[5:0] <= {tmp[4:0],din};
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) result <= 1'b0;
	else if(tmp == 6'b111000 || tmp == 6'b101110) result <= 1'b1;
	else result <= 1'b0;
end

endmodule