module LZC(
input [24:0] num,
output reg [5:0] count);

always @(*)  
casex (num)  
	25'b0000000000000000000000000: count=6'd25;
	25'b0000000000000000000000001: count=6'd24;
	25'b000000000000000000000001x: count=6'd23;
	25'b00000000000000000000001xx: count=6'd22;
	25'b0000000000000000000001xxx: count=6'd21;
	25'b000000000000000000001xxxx: count=6'd20;
	25'b00000000000000000001xxxxx: count=6'd19;
	25'b0000000000000000001xxxxxx: count=6'd18;
	25'b000000000000000001xxxxxxx: count=6'd17;
	25'b00000000000000001xxxxxxxx: count=6'd16;
	25'b0000000000000001xxxxxxxxx: count=6'd15;
	25'b000000000000001xxxxxxxxxx: count=6'd14;
	25'b00000000000001xxxxxxxxxxx: count=6'd13;
	25'b0000000000001xxxxxxxxxxxx: count=6'd12;
	25'b000000000001xxxxxxxxxxxxx: count=6'd11;
	25'b00000000001xxxxxxxxxxxxxx: count=6'd10;
	25'b0000000001xxxxxxxxxxxxxxx: count=6'd9;
	25'b000000001xxxxxxxxxxxxxxxx: count=6'd8;
	25'b00000001xxxxxxxxxxxxxxxxx: count=6'd7;
	25'b0000001xxxxxxxxxxxxxxxxxx: count=6'd6;
	25'b000001xxxxxxxxxxxxxxxxxxx: count=6'd5;
	25'b00001xxxxxxxxxxxxxxxxxxxx: count=6'd4;
	25'b0001xxxxxxxxxxxxxxxxxxxxx: count=6'd3;
	25'b001xxxxxxxxxxxxxxxxxxxxxx: count=6'd2;
	25'b01xxxxxxxxxxxxxxxxxxxxxxx: count=6'd1;
  
default: count=6'b000000;  
endcase  

endmodule
