`timescale 1ns/1ns
module testbench();

wire [4:0] f;
reg [4:0] x;
reg [4:0] y;
reg [1:0] s;
reg c_in;

reg cc;
reg [4:0] i,j;
reg [1:0] t;
alu aaa(f,c_out,s,x,y,c_in);

initial begin
	$dumpfile("d.vcd");
	$dumpvars(0,f,c_out,s,x,y,c_in);
	x = 0;
	y = 0;
	s = 0;
	c_in = 0;
	#20
	cc = 0;
	i = 0;
	j = 0;
	t = 0;
	repeat(4)begin
		s = t;
		t = t + 1;
		repeat(32) begin
			x = i;
			i = i + 1;
			repeat(32) begin
				y = j;
				j = j + 1;
				repeat(2) begin
				c_in = cc;
				cc = cc + 1;
				#10;
				end
			end
		end
	end
	
	$finish;
	
end

endmodule