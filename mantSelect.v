module mantBitSelect_mult(
input [47:0] mantProduct,
input [9:0] shift,
output reg [22:0] mantResult);

always @(*)
case (shift)
	10'b0000000001: mantResult = mantProduct[46:24];
	10'b0000000000: mantResult = mantProduct[45:23];
	10'b1111111111: mantResult = mantProduct[44:22];
	10'b1111111110: mantResult = mantProduct[43:21];
	10'b1111111101: mantResult = mantProduct[42:20];
	10'b1111111100: mantResult = mantProduct[41:19];
	10'b1111111011: mantResult = mantProduct[40:18];
	10'b1111111010: mantResult = mantProduct[39:17];
	10'b1111111001: mantResult = mantProduct[38:16];
	10'b1111111000: mantResult = mantProduct[37:15];
	10'b1111110111: mantResult = mantProduct[36:14];
	10'b1111110110: mantResult = mantProduct[35:13];
	10'b1111110101: mantResult = mantProduct[34:12];
	10'b1111110100: mantResult = mantProduct[33:11];
	10'b1111110011: mantResult = mantProduct[32:10];
	10'b1111110010: mantResult = mantProduct[31:9];
	10'b1111110001: mantResult = mantProduct[30:8];
	10'b1111110000: mantResult = mantProduct[29:7];
	10'b1111101111: mantResult = mantProduct[28:6];
	10'b1111101110: mantResult = mantProduct[27:5];
	10'b1111101101: mantResult = mantProduct[26:4];
	10'b1111101100: mantResult = mantProduct[25:3];
	10'b1111101011: mantResult = mantProduct[24:2];
	10'b1111101010: mantResult = mantProduct[23:1];
	10'b1111101001: mantResult = mantProduct[22:0];
		
default: mantResult = 23'b0;
 
endcase 
endmodule