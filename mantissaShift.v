module mantShiftRight(
input [23:0] mantissa,
input [8:0] shift,
output reg [23:0] mantShifted);

wire [47:0] extendedMant;

assign extendedMant = {{24{1'b0}},mantissa};

always @(*)
case (shift)
	9'd0: mantShifted = extendedMant[23:0];
	9'd1: mantShifted = extendedMant[24:1];
	9'd2: mantShifted = extendedMant[25:2];
	9'd3: mantShifted = extendedMant[26:3];
	9'd4: mantShifted = extendedMant[27:4];
	9'd5: mantShifted = extendedMant[28:5];
	9'd6: mantShifted = extendedMant[29:6];
	9'd7: mantShifted = extendedMant[30:7];
	9'd8: mantShifted = extendedMant[31:8];
	9'd9: mantShifted = extendedMant[32:9];
	9'd10: mantShifted = extendedMant[33:10];
	9'd11: mantShifted = extendedMant[34:11];
	9'd12: mantShifted = extendedMant[35:12];
	9'd13: mantShifted = extendedMant[36:13];
	9'd14: mantShifted = extendedMant[37:14];
	9'd15: mantShifted = extendedMant[38:15];
	9'd16: mantShifted = extendedMant[39:16];
	9'd17: mantShifted = extendedMant[40:17];
	9'd18: mantShifted = extendedMant[41:18];
	9'd19: mantShifted = extendedMant[42:19];
	9'd20: mantShifted = extendedMant[43:20];
	9'd21: mantShifted = extendedMant[44:21];
	9'd22: mantShifted = extendedMant[45:22];
	9'd23: mantShifted = extendedMant[46:23];
	
default: mantShifted = 24'b0;
 
endcase 
endmodule
