module mux2x1 (B_final, select, B, Bcomp);
//2x1 quadruible mux

input select;
input [3:0] B, Bcomp;
output [3:0] B_final;

reg [3:0] B_final;
always @ (select, B, Bcomp)
begin 
	if (select == 0)
		begin
			B_final = B;
		end 
	else
		begin 
			B_final = Bcomp;
		end
end

endmodule
