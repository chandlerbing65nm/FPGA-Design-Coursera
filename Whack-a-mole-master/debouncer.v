module debouncer(
input [1:0]pb,
input clk,
output [1:0]pb_out);

reg slow_clk_en;
reg [3:0]Q;
reg [1:0]Q2bar;
reg [23:0]counter=0;

  
always @(posedge clk)
    begin
     counter <= (counter>=1249999)?0:counter+1;
     slow_clk_en <= (counter < 624999)?1'b0:1'b1;
    end
always @ (posedge slow_clk_en) 
	begin
	
           Q[0] <= pb[0];
			  Q[1] <= Q[0];
			  Q2bar[0] <= ~Q[1];
	
				Q[2] <= pb[1];
			   Q[3] <= Q[2];
				Q2bar[1] <= ~Q[3];
			  
								
	end
assign pb_out[0] = Q[0] & Q2bar[0];
assign pb_out[1] = Q[2] & Q2bar[1];

endmodule