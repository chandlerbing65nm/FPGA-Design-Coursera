module countdowntimer(SEG,iSEG,reset,clk);

reg [32:0] counter;  
input reset;
reg rst;
input clk;
output [6:0] SEG;
output [6:0] iSEG;
//output [7:0] LED;
//reg [7:0] oLED;
reg [6:0] oSEG;
reg [6:0] iiSEG;

initial begin
counter <= 1000000000;
end
  
always @(posedge clk, posedge reset) begin 
	if(reset) begin
		counter <= 1000000000;
		oSEG <= 7'b1000000;
		iiSEG <= 7'b0100100;	
		end 
	else begin
    		counter <= counter-1'b1;
			//oSEG <= 7'b0;
			case(counter)
			
				950000000: oSEG <= 7'b0011000;//9
			950001000: iiSEG <= 7'b1111001;//1	
				900000000: oSEG <= 7'b0000000;//8 
				850000000: oSEG <= 7'b1111000;//7 
				800000000: oSEG <= 7'b0000010;//6	
				750000000: oSEG <= 7'b0010010;//5	
				700000000: oSEG <= 7'b0011001;//4 
				650000000: oSEG <= 7'b0110000;//3 
				600000000: oSEG <= 7'b0100100;//2
				550000000: oSEG <= 7'b1111001;	//1
				500000000: oSEG <= 7'b1000000;	//0
			
			
				450000000: oSEG <= 7'b0011000;//9
			450001000: iiSEG <= 7'b1000000;	//0
				400000000: oSEG <= 7'b0000000;//8 
				350000000: oSEG <= 7'b1111000;//7 
				300000000: oSEG <= 7'b0000010;//6	
				250000000: oSEG <= 7'b0010010;//5	
				200000000: oSEG <= 7'b0011001;//4 
				150000000: oSEG <= 7'b0110000;//3 
				100000000: oSEG <= 7'b0100100;//2
				50000000: oSEG <= 7'b1111001;	//1
				1000: oSEG <= 7'b1000000;	//0
				
				//100: oLED <= 8'b11111111;
			endcase
			
  			end 
	
end

assign SEG = oSEG;
assign iSEG = iiSEG;
//assign LED = oLED;
  
endmodule