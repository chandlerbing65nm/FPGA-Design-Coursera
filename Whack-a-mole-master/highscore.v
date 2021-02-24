module highscore(
input [6:0]score, 
input reset,
output [6:0] SEG1,
output [6:0] SEG2,
output [6:0] SEG3);


reg [6:0]oneSEG, twoSEG, threeSEG;

wire [6:0]number;
wire total;

assign SEG3 = threeSEG;

initial begin
	oneSEG <= 7'b0110110;//---
	twoSEG <= 7'b0110110;//---
	threeSEG <= 7'b0100100;//2 - the high score to beat
	end
	
assign number[0] = score[0] & threeSEG[0];
assign number[1] = score[1] & threeSEG[1];
assign number[2] = score[2] & threeSEG[2];
assign number[3] = score[3] & threeSEG[3];
assign number[4] = score[4] & threeSEG[4];
assign number[5] = score[5] & threeSEG[5];
assign number[6] = score[6] & threeSEG[6];

assign total = number[0] & number[1] & number[2] & number[3] & number[4] & number[5] & number[6];
	

always @(posedge reset or posedge total) 
begin

	if (reset) begin
			oneSEG <= 7'b0110110;//---
			twoSEG <= 7'b0110110;//---
			end
	else if (threeSEG == score) begin
			 oneSEG <= 7'b0100011;//---o
			 twoSEG <= 7'b0001011;//---h
			 end
	else begin
			oneSEG <= 7'b0000011;//b
			twoSEG <= 7'b0100011;//o
			end
end

assign SEG1 = oneSEG;
assign SEG2 = twoSEG;

endmodule