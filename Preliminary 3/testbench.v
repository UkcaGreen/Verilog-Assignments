`timescale 1ns / 1ns
module TestBench();

reg [4:0]x;
wire y;

myModule a(y, x);

reg [4:0] index;

initial begin
	$dumpfile("d.vcd");
	$dumpvars(0, y, x);
	
	index = 0;
	repeat(32) begin
		x = index;
		index = index + 1;
		#10;
	end
	
	$finish;
end

endmodule
