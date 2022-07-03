module FPU(
input [31:0] Data1,
input [31:0] Data2,
input Clock,
input In_Data_Valid,
input Op,
output reg [31:0] Data_Out,
output reg Out_Data_Valid
);

reg [31:0] op1;
reg [31:0] reg1;
reg [31:0] op2;
reg [31:0] reg2;
reg Clk_2;
reg OpReg;

wire [31:0] adderOut;
wire [31:0] addOutException;
wire [31:0] multiplierOut;
wire [31:0] multOutException;
wire EFAdd,EFMult;

wire [31:0] addOut_final;
wire [31:0] multOut_final;

// reg opFinish;
wire [31:0] Data_Out_Reg;

adder ADD(op1,op2,adderOut);
multiplier MULTIPLY(op1,op2,multiplierOut);

exception exceptBlock(op1,op2,addOutException,multOutException,EFAdd,EFMult);

muxExcept muxAdd(adderOut,addOutException,EFAdd,addOut_final);
muxExcept muxMult(multiplierOut,multOutException,EFMult,multOut_final);
muxOP operation(addOut_final,multOut_final,OpReg,Data_Out_Reg);

initial
begin
	op1 = 0;
	op2 = 0;
	Data_Out = 0;
	Clk_2 = 0;
	// opFinish = 0;
end

// always @(posedge Clock)
// begin
// if(In_Data_Valid)
	// Data_Out <= Data_Out_Reg;
// else
	// Data_Out <= Data_Out;
// end

always @(posedge Clock)
begin
if(In_Data_Valid)
	OpReg <= Op;
else
	OpReg <= OpReg;
end

always @(posedge Clk_2)
Data_Out <= Data_Out_Reg;

always @(posedge Clock)
begin
if(In_Data_Valid)
begin
	{op1,op2} <= {Data1,Data2};
end
else
	{op1,op2} <= {op1,op2};
end

always @(Data_Out)
begin
Out_Data_Valid <= 1'b1;
end

always @(negedge Clk_2)
if(Out_Data_Valid)
begin
	Out_Data_Valid <= 1'b0;
	// opFinish <= 1'b0;
end

always @(posedge Clock)
Clk_2 <= ~Clk_2; ///Clk/2 generation

// always @(posedge Clk_2)
// if(opFinish)
// begin
	// Out_Data_Valid <= 1'b1;
// end

endmodule