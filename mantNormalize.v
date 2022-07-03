module mantNorm(
input [24:0] mantissa,
input [8:0] shift,
output reg [23:0] mantAdjusted);

wire [46:0] extendedMant;

assign extendedMant = {mantissa,{22{1'b0}}};

always @(*)
case (shift)
	9'b000000001: mantAdjusted = extendedMant[45:23]; //1
	9'b000000000: mantAdjusted = extendedMant[44:22]; //0
	9'b111111111: mantAdjusted = extendedMant[43:21]; //-1
	9'b111111110: mantAdjusted = extendedMant[42:20]; //-2
	9'b111111101: mantAdjusted = extendedMant[41:19]; //-3
	9'b111111100: mantAdjusted = extendedMant[40:18]; //-4
	9'b111111011: mantAdjusted = extendedMant[39:17]; //-5
	9'b111111010: mantAdjusted = extendedMant[38:16]; //-6
	9'b111111001: mantAdjusted = extendedMant[37:15]; //-7
	9'b111111000: mantAdjusted = extendedMant[36:14]; //-8
	9'b111110111: mantAdjusted = extendedMant[35:13]; //-9
	9'b111110110: mantAdjusted = extendedMant[34:12]; //-10
	9'b111110101: mantAdjusted = extendedMant[33:11]; //-11
	9'b111110100: mantAdjusted = extendedMant[32:10]; //-12
	9'b111110011: mantAdjusted = extendedMant[31:9]; //-13
	9'b111110010: mantAdjusted = extendedMant[30:8]; //-14
	9'b111110001: mantAdjusted = extendedMant[29:7]; //-15
	9'b111110000: mantAdjusted = extendedMant[28:6]; //-16
	9'b111101111: mantAdjusted = extendedMant[27:5]; //-17
	9'b111101110: mantAdjusted = extendedMant[26:4]; //-18
	9'b111101101: mantAdjusted = extendedMant[25:3]; //-19
	9'b111101100: mantAdjusted = extendedMant[24:2]; //-20
	9'b111101011: mantAdjusted = extendedMant[23:1]; //-21
	9'b111101010: mantAdjusted = extendedMant[22:0]; //-22
	
default: mantAdjusted = 23'b0;
 
endcase 
endmodule