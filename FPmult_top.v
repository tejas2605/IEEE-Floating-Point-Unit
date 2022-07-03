module multiplier (
input wire[31:0] op1,
input wire[31:0] op2,
output [31:0] multOut);

wire sign_out;
wire [9:0] exp_out;
wire [47:0] mant_out;
wire [5:0] count;
wire [5:0] shift;
wire [9:0] expResult;
wire [7:0] expResult_chk;
wire OF, UF;
wire [22:0] mantResult;
wire [22:0] mantResult_chk;
wire [9:0] exp_temp;
reg [9:0] expShift;

sign_multOut sign(op1,op2,sign_out);

mult_expAdd exp(op1,op2,exp_out);

mant_mult mantissa(op1,op2,mant_out);

LZC shiftAmt(mant_out[47:23],count);
 
assign shift = 1 - count;

assign exp_temp = exp_out + {{4{shift[5]}},shift};
assign OF = ($signed(exp_temp)>254) ? 1'b1 : 1'b0;
assign UF = ($signed(exp_temp)<0) ? 1'b1 : 1'b0;

always @(*)
case ({OF,UF})
	2'b00: expShift = {{4{shift[5]}},shift};
	2'b01: expShift = (0 - exp_out);
	default: expShift = 1;
endcase

assign expResult = (op1[30:0]&&op2[30:0])? (exp_out + expShift) : 0;

mantBitSelect_mult mantselect(mant_out,expShift,mantResult);
assign expResult_chk = (OF ? (8'b11111111):(expResult[7:0]));
assign mantResult_chk = ((OF) ? 23'b0 :((op1[30:0]&op2[30:0])? mantResult : 0));
// assign multOut = {sign_out,(OF ? 8'b11111111:expResult[7:0]),((OF|UF) ? 23'b0 : mantResult)};
// assign multOut = {sign_out, (OF ? (8'b11111111):(expResult[7:0])) , ((OF|UF) ? 23'b0 :((op1[30:0]&op2[30:0])? mantResult : 0))};
assign multOut = {sign_out, expResult_chk , mantResult_chk};
endmodule