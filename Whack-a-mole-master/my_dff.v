module my_dff(
input DFF_CLOCK, 
input [1:0]D, 
output reg Q
);

always @ (posedge DFF_CLOCK) 
begin
	if (D[0] == 1'b1) begin
		Q <= D[0];
		end
	else if (D[1] == 1'b1) begin
		Q <= D[1];
		end 
	else begin
		Q <= 1'b0;
		end
end

endmodule