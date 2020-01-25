`timescale 1ns/1ns
module fsm(
	output reg [1:0] y,
	output reg [1:0] d,
	output reg [1:0] n,
	input x,
	input rst,
	input clk
);

wire x;
wire clk;
wire rst;

always @(n,x) begin

	case({n,x})
		3'b000:{d,y} <= 4'b1010;
		3'b001:{d,y} <= 4'b0011;
		3'b010:{d,y} <= 4'b1010;
		3'b011:{d,y} <= 4'b0011;
		3'b100:{d,y} <= 4'b1010;
		3'b101:{d,y} <= 4'b1110;
		3'b110:{d,y} <= 4'b1011;
		3'b111:{d,y} <= 4'b1101;
	endcase
	
end
	
	// Sync reset
	always @(posedge clk) begin
	if (rst == 1)
		begin
		n <= 2'b00;
		d <= 2'b00;
		end
	else
		n <= d;
	end

endmodule