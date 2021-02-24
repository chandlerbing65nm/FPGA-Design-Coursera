module FSM(
  input In1,
  input RST,
  input CLK, 
  output Out1
);
	reg [2:0]state;
	
	always@(posedge CLK or posedge RST)
		begin
			if (RST == 1'b1)
				begin
					state <= 3'b000;
				end	
			else begin
				case(state)
				3'b000: 
					begin
						if (In1 == 1'b1)
							begin
							state <= 3'b010; 
							end
						else 
							begin
							state <= 3'b000; 
							end
					end
						
				3'b010: 
					begin
						if (In1 == 1'b1)
							begin
							state <= 3'b010; 
							end
						else 
							begin
							state <= 3'b100; 
							end
					end
						
				3'b100: 
					begin
						if (In1 == 1'b1)
							begin
							state <= 3'b000; 
							end
						else 
							begin
							state <= 3'b100; 
							end
					end
				
				default:
					begin
					state <= 3'b000;
					end
				endcase
			end
		end
	assign Out1 = state? 3'b100 : 0;
endmodule