module clock_div(input clk, output reg slow_clk

    );
    reg [23:0]counter=0;
    always @(posedge clk)
    begin
        counter <= (counter>=1250000)?0:counter+1;
        slow_clk <= (counter < 625000)?1'b0:1'b1;
    end
	 
endmodule