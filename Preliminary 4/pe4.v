`timescale 1ns/1ns
module fsm(
	output reg [2:0] x,
	output reg [3:0] n,
	output reg [3:0] s,
	input a,
	input rst,
	input clk
);

wire a;
wire clk;
wire rst;

always @(s,a) begin
	
	x <= 3'b000;
	
	case(s)
		4'b0000: 
		begin
			if(a)
				n <= 4'b0001;
			else
				n <= 4'b0000;
		end
		
		4'b0001: 
		begin
			if(a)
				n <= 4'b0001;
			else
				n <= 4'b0010;
		end
		
		4'b0010: 
		begin
			if(a)
				n <= 4'b0011;
			else
				n <= 4'b0100;
		end
		
		4'b0011: 
		begin
			x <= 3'b001;
			if(a)
				n <= 4'b0001;
			else
				n <= 4'b0000;
		end
		
		4'b0100: 
		begin
			if(a)
				n <= 4'b0101;
			else
				n <= 4'b0110;
		end
		
		4'b0101: 
		begin
			x <= 3'b010;
			if(a)
				n <= 4'b0001;
			else
				n <= 4'b0000;
		end
		
		4'b0110: 
		begin
			if(a)
				n <= 4'b0000;
			else
				n <= 4'b0111;
		end
		
		4'b0111:
		begin
			x <= 3'b011;
			if(a)
				n <= 4'b0001;
			else
				n <= 4'b0000;
		end
		
		4'b1000: 
		begin
			if(a)
				n <= 4'b1001;
			else
				n <= 4'b1000;
		end
		
		4'b1001: 
		begin
			x <= 3'b111;
			if(a)
				n <= 4'b0001;
			else
				n <= 4'b0000;
		end
		
		default: n <= 4'b0000;
	endcase
	
end
	
	// Sync reset
	always @(posedge clk) begin
	if (rst == 1)
		begin
		s <= 4'b0000;
		n <= 4'b0000;
		end
	else
		s <= n;
	end

endmodule