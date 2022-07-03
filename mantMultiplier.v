module mant_mult(
input wire[31:0] op1,
input wire[31:0] op2,
output wire [47:0] mantOut);

wire [23:0] op1ExtMnt;
wire [23:0] op2ExtMnt;

assign op1ExtMnt = (op1[30:23]) ? {1'b1,op1[22:0]} : {1'b0,op1[22:0]};
assign op2ExtMnt = (op2[30:23]) ? {1'b1,op2[22:0]} : {1'b0,op2[22:0]};

assign mantOut = op1ExtMnt * op2ExtMnt;

endmodule