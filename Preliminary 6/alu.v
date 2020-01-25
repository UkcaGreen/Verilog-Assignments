`timescale 1ns/1ns
module alu(
	output reg [4:0] f,
	output reg c_out,
	input [1:0] s,
	input [4:0] x,
	input [4:0] y,
	input c_in
);

always @(x,y,s,c_in)begin

	case(s)

		2'b00:
		begin
			c_out <= (x <= y);
			f <= 5'b00000;
		end
		2'b01:
		begin 
			case(y[2:0])
			3'b000:{c_out,f} <= 5'b00000;
			3'b001:{c_out,f} <= 5'b00000;
			3'b010:{c_out,f} <= x;
			3'b011:{c_out,f} <= x;
			3'b100:{c_out,f} <= (~x)+1+(~x)+1;
			3'b101:{c_out,f} <= (~x)+1;
			3'b110:{c_out,f} <= (~x)+1;
			3'b111:{c_out,f} <= 5'b00000;
			endcase
		end
		2'b10:
		begin 
			{c_out,f} = x[4:2]*y[2:0];
		end
		2'b11:
		begin 
			{c_out,f} = (x)+(~y)+1+c_in;
		end
		
	endcase
	
end

endmodule