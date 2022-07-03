module sign_multOut(
input wire[31:0] op1,
input wire[31:0] op2,
output wire sign
);
assign sign = op1[31]^op2[31];
endmodule