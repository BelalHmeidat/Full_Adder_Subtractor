module complementer (B_comp, B);
//9's complementer
output [3:0] B_comp;
input [3:0] B;

assign B_comp [3] = ~B[3] & ~ B[2] & ~B[1];
assign B_comp [2] = B[2] ^ B[1];
assign B_comp [1] = B[1];
assign B_comp [0] = ~B[0];



endmodule

