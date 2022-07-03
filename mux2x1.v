module muxOP(
input [31:0] addOut,
input [31:0] multOut,
input opControl,
output reg [31:0] opOut);

always @(*)
case (opControl)
	1'b0:opOut = addOut;
	1'b1:opOut = multOut;
endcase
endmodule