module BCD_adder_subber (sum, mode, A, B);
//full adder subtractor circuit
//produces 9's complement for negative results

input mode; //mux select
input [3:0] A, B;

output [3:0] sum;

wire [3:0] B_comp;
complementer (B_comp, B);

wire [3:0] B_final;
mux2x1 (B_final, mode, B, B_comp);

BCD_adder (sum, A, B_final, mode);


endmodule
