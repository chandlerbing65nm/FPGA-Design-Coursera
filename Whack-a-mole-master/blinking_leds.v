module blinking_leds (
input clk, 
input reset,
input [9:0] rnd,
output [7:0] LED);


reg [31:0] counter;
reg [7:0] LED_status;

initial 
	begin
	counter <= 32'b0;
	LED_status <= 0;
	end

always @(posedge clk or posedge reset) 
begin
	if (reset)
		begin
		counter <= 32'b0;
		LED_status <= 0;
		end
	else if (counter > 25000000) 
	begin
			LED_status <= 8'b0;
			case(rnd)
			10'b0000000000: LED_status[0] <= 1'b1;	//0
			10'b0000000001: LED_status[1] <= 1'b1; //1
			10'b0000000010: LED_status[2] <= 1'b1; //2
			10'b0000000011: LED_status[3] <= 1'b1;	//3
			10'b0000000100: LED_status[4] <= 1'b1;	//4
			10'b0000000101: LED_status[5] <= 1'b1; //5
			10'b0000000110: LED_status[6] <= 1'b1; //6
			10'b0000000111: LED_status[7] <= 1'b1;	//7
			endcase
			counter <= 32'b0;
	end
	else 
		begin
		counter <= counter + 1'b1;
		end
	
end

assign LED = LED_status;

endmodule