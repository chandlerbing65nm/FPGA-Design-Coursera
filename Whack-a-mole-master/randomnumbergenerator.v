module randomnumbergenerator (
input clk,
input reset,
output reg [9:0] rnd
);

wire feedback;
wire [9:0] lfsr_next;

//An LFSR cannot have an all 0 state, thus reset to non-zero value
reg [9:0] reset_value = 13;
reg [9:0] lfsr;
reg [3:0] count;

// pragma translate_off
integer f;
initial begin
f = $fopen("output.txt","w");
end
// pragma translate_on

always @ (posedge clk or posedge reset)
begin
if (reset) begin
lfsr <= reset_value;
count <= 4'hF;
rnd <= 0;
end
else begin
lfsr <= lfsr_next;
count <= count + 1;
// a new random value is ready
if (count == 4'd9) begin
count <= 0;
rnd <= lfsr%8; //assign the lfsr number to output after 10 shifts
// pragma translate_off
$fwrite(f,"%0d\n",rnd);
// pragma translate_on
end
end
end

// X10+x7
assign feedback = lfsr[9] ^ lfsr[6];
assign lfsr_next = {lfsr[8:0], feedback};

// pragma translate_off
always @ (*) begin
if (rnd == reset_value) begin
$fclose(f);
$finish();
end
end
// pragma translate_on
endmodule

