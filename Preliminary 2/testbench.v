`timescale 1 ns / 1 ns
module testBench();

reg r,c,g,p;
wire b;

myModule a(b,r,c,g,p);

// Behavioral Verilog
initial begin
	$dumpfile("Diagram.vcd");
	$dumpvars(0,b,r,c,g,p);
	
		r<=0; c<=0; g<=0; p<=0;
	#20 r<=0; c<=0; g<=0; p<=0;
	#20 r<=0; c<=0; g<=0; p<=1;
	#20 r<=0; c<=0; g<=1; p<=0;
	#20 r<=0; c<=0; g<=1; p<=1;
	#20 r<=0; c<=1; g<=0; p<=0;
	#20 r<=0; c<=1; g<=0; p<=1;
	#20 r<=0; c<=1; g<=1; p<=0;
	#20 r<=0; c<=1; g<=1; p<=1;
	#20 r<=1; c<=0; g<=0; p<=0;
	#20 r<=1; c<=0; g<=0; p<=1;
	#20 r<=1; c<=0; g<=1; p<=0;
	#20 r<=1; c<=0; g<=1; p<=1;
	#20 r<=1; c<=1; g<=0; p<=0;
	#20 r<=1; c<=1; g<=0; p<=1;
	#20 r<=1; c<=1; g<=1; p<=0;
	#20 r<=1; c<=1; g<=1; p<=1;
	#20;
	
end

endmodule