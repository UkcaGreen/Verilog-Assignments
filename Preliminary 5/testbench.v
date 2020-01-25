`timescale 1ns/1ns
module testbench();

wire [1:0] d;
wire [1:0] n;
wire [1:0] y;

reg clk;
initial clk = 1;
always #10 clk = ~clk;

integer i = 0;
reg [31:0] num;

reg rst;
initial rst = 1;

reg x;
initial x = 0;

fsm aaa(y,d,n,x,rst,clk);

initial begin
	$dumpfile("d.vcd");
	$dumpvars(0,y,d,n,x,rst,clk);
	#20
	num = 32'b10011001110111110001111000101010;
		for(i=31;i>=0;i=i-1) begin
			x = num[i];
			rst = 0;	
			#20;
		end
		rst <= 1;
	#20
	num = 32'b00001001011101011110001110011110;
		for(i=31;i>=0;i=i-1) begin
			x = num[i];
			rst = 0;	
			#10;
		end
		rst <= 1;
	#20
	num = 32'b01000101010001000011100001110001;
		for(i=31;i>=0;i=i-1) begin
			x = num[i];
			rst = 0;	
			#20;
		end
		rst <= 1;
	#20
	num = 32'b01010001011010001010100001110100;
		for(i=31;i>=0;i=i-1) begin
			x = num[i];
			rst = 0;
			#20;
		end
		rst <= 1;
	#20
	num = 32'b01100010000011010101110101000100;
		for(i=31;i>=0;i=i-1) begin
			x = num[i];
			rst = 0;	
			#20;
		end
	
	$finish;
	
end

endmodule