module mult_expAdd(
input wire[31:0] op1,
input wire[31:0] op2,
output wire [9:0] expOut);

wire [9:0] sum;
wire [9:0] exp1;
wire [9:0] exp2;

assign exp1={2'b00,op1[30:23]}-'d127;
assign exp2={2'b00,op2[30:23]}-'d127;
assign sum = exp1 + exp2;
assign expOut[9:0] = (sum + 'd127);

endmodule