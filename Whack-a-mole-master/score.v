module score(
input [1:0]pb, 
input [7:0]rnd,
input reset,
input clk,
output [6:0] SEG);

reg [6:0] oneSEG;
wire one, two,three;

assign one = pb[0] & rnd[0];
assign two = pb[1] & rnd[1];
assign three = one | two;

initial begin
	oneSEG <= 7'b1000000;
	end
	


always @(posedge three or posedge reset)
	begin
			if (reset) begin
			oneSEG <= 7'b1000000;
			end
			else if (oneSEG == 7'b1000000) begin
			oneSEG <= 7'b1111001;//1
			end
			else if (oneSEG == 7'b1111001) begin
			oneSEG <= 7'b0100100;//2
			end
			else if (oneSEG == 7'b0100100) begin
			oneSEG <= 7'b0110000;//3
			end
			else if (oneSEG == 7'b0110000) begin
			oneSEG <= 7'b0011001;//4
			end
			else if (oneSEG == 7'b0011001) begin
			oneSEG <= 7'b0010010;//5
			end
			else if (oneSEG == 7'b0010010) begin
			oneSEG <= 7'b0000010;//6
			end
			else if (oneSEG == 7'b0000010) begin
			oneSEG <= 7'b1111000;//7
			end
			else if (oneSEG == 7'b1111000) begin
			oneSEG <= 7'b0000000;//8
			end
			else if (oneSEG == 7'b0000000) begin
			oneSEG <= 7'b0011000;//9
			end
			else begin
			oneSEG <= oneSEG;
			end
	end

assign SEG = oneSEG;

endmodule