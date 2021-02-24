module ALU ( 
  input [2:0] Op_code,
  input [31:0] A, B,
  output [31:0] Y
);

reg [31:0] out;
wire [31:0] A1, B1;

assign A = A1;
assign B = B1;

	always@(B1 or A1 or Op_code)
	begin
		case(Op_code)
		000: out = A1;
		001: out = A1 + B1; 
		010: out = A1 - B1;
		011: out = A1 & B1;
		100: out = A1 | B1;
		101: out = A1 + 1'b1;
		110: out = A1 - 1'b1; 
		111: out = B1;
		default: out = A1 + B1;
		endcase
	end
assign Y = out;
endmodule