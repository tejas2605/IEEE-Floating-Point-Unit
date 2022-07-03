module adder(
input [31:0] op1,
input [31:0] op2,
output [31:0] addOut
);

wire opSign1, opSign2;
wire [7:0] opExp1;
wire [7:0] opExp2;
wire [22:0] opMnt1;
wire [22:0] opMnt2;

wire [8:0] expSmall;
wire [8:0] expLarge;
wire [8:0] expDiff;

wire [31:0] opLarge;
wire [31:0] opSmall;

wire [23:0] Mant_expSmall;
wire [23:0] Mant_expLarge;
wire [23:0] Mant_expSmall_shifted;

wire [24:0] Mantout;
wire [5:0] count;
wire [5:0] shift;

wire OF,UF;
wire [8:0] exp_temp;
reg [8:0] expShift;

wire signResult;
wire [8:0] expResult;
wire [7:0] expResult_chk;
wire [22:0] mantResult;
wire [22:0] mantResult_chk;

assign opSign1 = op1[31];
assign opExp1 = op1[30:23];
assign opMnt1 = op1[22:0];
assign opSign2 = op2[31];
assign opExp2 = op2[30:23];
assign opMnt2 = op2[22:0];

assign expLarge = (opExp1>opExp2) ? {1'b0,opExp1}:{1'b0,opExp2};
assign expSmall = (opExp1<=opExp2)?{1'b0,opExp1}:{1'b0,opExp2};
assign expDiff = expLarge - expSmall;

assign opSmall = (opExp1>opExp2) ? op2:op1;
assign opLarge = (opExp1<=opExp2) ? op2:op1;

assign Mant_expLarge = expLarge ? {1'b1,opLarge[22:0]} : {1'b0,opLarge[22:0]};
assign Mant_expSmall = expSmall ? {1'b1,opSmall[22:0]} : {1'b0,opSmall[22:0]};

mantShiftRight mntSR(Mant_expSmall, expDiff, Mant_expSmall_shifted);

assign signResult = (Mant_expLarge > Mant_expSmall_shifted) ? opLarge[31]:opSmall[31];

mntAdder mntSum(opLarge[31]^opSmall[31], Mant_expLarge, Mant_expSmall_shifted, Mantout);

LZCAdd shiftAmt(Mantout,count);
assign shift = (op1[30:0]|op2[30:0]) ? (1 - count) : 0;

assign exp_temp = expLarge + {{3{shift[5]}},shift};
assign OF = ($signed(exp_temp)>254) ? 1'b1 : 1'b0;
assign UF = ($signed(exp_temp)<0) ? 1'b1 : 1'b0;

always @(*)
case ({OF,UF})
	2'b00: expShift = {{3{shift[5]}},shift};
	2'b01: expShift = (0 - expLarge);
	default: expShift = 1;
endcase

assign expResult = ((op1[30:0]==op2[30:0]) & (opSign1^opSign2)) ? 0 : (expLarge + expShift);
mantNorm mantselect(Mantout,expShift,mantResult);

assign expResult_chk = (OF ? 8'b11111111:expResult[7:0]);
assign mantResult_chk = ((OF) ? 23'b0 : mantResult);
assign addOut = {signResult,expResult_chk,mantResult_chk};

endmodule