module mntAdder(
input opControl,
input [23:0] mant1,
input [23:0] mant2,
output reg [24:0] mantSum);

always @(*)
case (opControl)
	1'b0: mantSum = {1'b0,mant1} + {1'b0,mant2};
	1'b1: mantSum = ({1'b0,mant1}>{1'b0,mant2}) ? ({1'b0,mant1} - {1'b0,mant2}) : ({1'b0,mant2} - {1'b0,mant1});
endcase
endmodule
