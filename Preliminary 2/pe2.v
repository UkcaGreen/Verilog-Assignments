`timescale 1 ns / 1 ns
module myModule(b,r,c,g,p);

input r,c,g,p;
output b;

wire and1, and2, and3;
wire or1;
wire not1;

// Gate level verilog
not(not1, p);

and(and1, g, c);
and(and2, not1, r);
or(or1, g, c);

and(and3, and2, or1);

or(b, and1, and3);

endmodule