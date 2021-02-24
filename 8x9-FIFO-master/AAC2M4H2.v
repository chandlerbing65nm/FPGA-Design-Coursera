module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr, 
  input RdInc, WrInc,
  input [8:0] DataIn,
  output reg [8:0] DataOut,
  input wire rden, wren);
//signal declarations

	reg [8:0] fifo_array[7:0];
	reg [2:0] wrptr, rdptr;
	reg [8:0] dmuxout;
	reg [7:0] en;
	integer i;
	
	always@(posedge clk or posedge rst)
		begin 
			if (rst == 1'b1)
			begin
				for (i=0; i<8; i=i+1)
				begin
				fifo_array[i] <= 9'b0;
				end
			end
			
			else if (wren == 1'b1)
				begin
					for (i=0; i<8; i=i+1)
					begin
						if (en == 1'b1)
							begin
							fifo_array[i] <= DataIn;
							end
						else 
							begin
							fifo_array[i] <= fifo_array[i];
							end
					end
				end
		end
	
	always@(posedge clk or posedge rst)
		begin
			if (rst == 1'b1)
				begin
				rdptr <= 3'b0;
				end
			else if (RdPtrClr == 1'b1)
				begin
				rdptr <= 3'b0;
				end
			else if (RdInc == 1'b1)
				begin
				rdptr <= rdptr + 1'b1;
				end
		end
		
	always@(posedge clk or posedge rst)
		begin
			if (rst == 1'b1)
				begin
				wrptr <= 3'b0;
				end
			else if (WrPtrClr == 1'b1)
				begin
				wrptr <= 3'b0;
				end
			else if (WrInc == 1'b1)
				begin
				wrptr <= wrptr + 1'b1;
				end
		end
		
	always@(rdptr)
		begin
			case (rdptr)
				000:dmuxout <= fifo_array[0];
				001:dmuxout <= fifo_array[1];
				010:dmuxout <= fifo_array[2];
				011:dmuxout <= fifo_array[3];
				100:dmuxout <= fifo_array[4];
				101:dmuxout <= fifo_array[5];
				110:dmuxout <= fifo_array[6];
				default: dmuxout[7] <= fifo_array[7];
			endcase
		end
		
	always@(wrptr) 
		begin
			case (wrptr)
				000:en <= 8'b00000001;
				001:en <= 8'b00000010;
				010:en <= 8'b00000100;
				011:en <= 8'b00001000;
				100:en <= 8'b00010000;
				101:en <= 8'b00100000;
				110:en <= 8'b01000000;
				default: en <= 8'b10000000;
			endcase
		end
		
	always@(rden or dmuxout)
		begin
			if (rden == 1'b1)
				begin
				DataOut <= dmuxout;
				end
			else
				begin
				DataOut <= 9'bZ;
				end
		end
		
endmodule
