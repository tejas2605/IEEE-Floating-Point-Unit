module exception(
input [31:0]op1,
input [31:0]op2, 
output reg [31:0]addOutException,
output reg [31:0]multoutexception,
output reg exceptionFlagADD,
output reg exceptionFlagMUL
);

//exception flag default=0
initial begin
exceptionFlagADD=0;
exceptionFlagMUL=0;
end


always @(*)
begin
if((op1[22:0] && op1[30:23]=={8{1'b1}}) || (op2[22:0] && op2[30:23]=={8{1'b1}}))
	begin
	exceptionFlagADD=1;
	exceptionFlagMUL=1;
	addOutException={32{1'b1}};	//NaN
	multoutexception={32{1'b1}}; //NaN
	end
else if((op1[30:23]=={8{1'b1}} && op1[22:0]=={23{1'b0}}) && (op2[30:23]=={8{1'b1}} && op2[22:0]=={23{1'b0}}) && (op1[31]^op2[31]))
	begin
	exceptionFlagADD=1;
	exceptionFlagMUL=0;
	addOutException={32{1'b1}};	//infinity-infinity
	multoutexception={32{1'b0}};
	end

else if(((op1[30:0]==31'b0)&&(op2[30:23]=={8{1'b1}} && op2[22:0]=={23{1'b0}}))||((op2[30:0]==31'b0)&&(op1[30:23]=={8{1'b1}} && op2[22:0]=={23{1'b0}})))
	begin
	exceptionFlagADD=0;	
	exceptionFlagMUL=1;
	addOutException={32{1'b0}};
	multoutexception={32{1'b1}};	//0 x infinity
	end
else begin
	exceptionFlagADD=0;
	exceptionFlagMUL=0;
	addOutException={32{1'b0}};
	multoutexception={32{1'b0}};
	end
end
endmodule

