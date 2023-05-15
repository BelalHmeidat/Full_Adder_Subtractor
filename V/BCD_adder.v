module BCD_adder(final_sum, A, B, Cin);
//BCD Adder circuit
//two 4-bit adder circuits and a BCD error proccessing circuit in between

input [3:0] A, B; //4-bit addened and augened
input Cin; //carry in


output [3:0] final_sum;

//first 4-bit adder carries
wire C1, C2, C3;

wire Cout, final_Cout; //carry resulting from first 4-bit adder circuit and carry resulting afrer error proccessing respectively

wire [3:0] sum; //sum resulting from first 4-bit adder

///First 4-bit adder circuit
//first bit half adder (no carry so no full adder)
assign sum[0] = A[0] ^ B[0];
//assign C1 = Cin & A[0] || Cin & B[0] || A[0] & B[0]; //old code
assign C1 = A[0] & B[0];

//second bit adder
assign sum[1] = C1 ^ A[1] ^ B[1];
assign C2 = C1 & A[1] || C1 & B[1] || A[1] & B[1];

//third bit adder
assign sum[2] = C2 ^ A[2] ^ B[2];
assign C3 = C2 & A[2] || C2 & B[2] || A[2] & B[2];

//4th bit adder
assign sum[3] = C3 ^ A[3] ^ B[3];
assign Cout = C3 & A[3] || C3 & B[3] || A[3] & B[3];



//Error proccessing
assign final_Cout = (sum[3] & sum[2]) || (sum [3] & sum[1]) || Cout;

wire C4, C5;// C6; //seconed 4-bit adder circuit carries

///Second 4-bit adder circuit
//First bit doesn't goes out as is from previous adder
assign final_sum[0] = sum[0];
//No resulting carry

//Second bit half adder
//No need for full adder because the addened is 0
assign final_sum[1] = sum[1] ^ final_Cout;
assign C4 = sum[1] & final_Cout;

//Third bit full adder
assign final_sum[2] = sum[2] ^ final_Cout ^ C4;
assign C5 = sum[2] & final_Cout || sum[2] & C4 || final_Cout & C4;

//4th bit half adder (addened is 0)
assign final_sum[3] = sum[3] ^ C5;
//assign C6 = C5 & sum[3]; //resulting carry is not needed (I think)


endmodule 