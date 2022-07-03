module muxExcept(
input [31:0] ValidOp,
input [31:0] ExceptOp,
input exceptionFlag,
output reg[31:0] opOut
);

always @(*)
case (exceptionFlag)
	1'b0: opOut = ValidOp;
	1'b1: opOut = ExceptOp;
endcase
endmodule