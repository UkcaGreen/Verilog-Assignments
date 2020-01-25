`timescale 1ns/1ns
module testbench();

wire [3:0] n;
wire [3:0] s;
wire [2:0] x;

reg clk;
initial clk = 1;
always #10 clk = ~clk;

integer i = 0;
reg [31:0] num;

reg rst;
initial rst = 1;

reg a;
initial a = 0;

fsm aaa(x,n,s,a,rst,clk);

initial begin
	$dumpfile("d.vcd");
	$dumpvars(0,x,n,s,a,rst,clk);
	#20
	num = 32'b10011001011000100000100011101001;
		for(i=31;i>=0;i=i-1) begin
			a = num[i];
			rst = 0;	
			#10;
		end
		rst <= 1;
	#20
	num = 32'b00001001011101011110001110011110;
		for(i=31;i>=0;i=i-1) begin
			a = num[i];
			rst = 0;	
			#10;
		end
		rst <= 1;
	#20
	num = 32'b01000101010001000011100001110001;
		for(i=31;i>=0;i=i-1) begin
			a = num[i];
			rst = 0;	
			#10;
		end
		rst <= 1;
	#20
	num = 32'b01010001011010001010100001110100;
		for(i=31;i>=0;i=i-1) begin
			a = num[i];
			rst = 0;
			#10;
		end
		rst <= 1;
	#20
	num = 32'b01100010000011010101110101000100;
		for(i=31;i>=0;i=i-1) begin
			a = num[i];
			rst = 0;	
			#10;
		end
	
end

endmodule