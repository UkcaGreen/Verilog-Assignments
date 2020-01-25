`timescale 1 ns / 1 ns
module myModule(
output r,
input [4:0] i
);

wire [3:0] o_d;
wire [1:0] i_d;
wire [7:0] i_m;
wire [2:0] c_m;
wire not1, not2, not3;

assign c_m[2] = i[4];
assign c_m[1] = i[3];
assign c_m[0] = i[2];
assign i_d[1] = i[1];
assign i_d[0] = i[0];

// Gate level verilog
decoder_2_4 a(o_d,i_d);

not(not1, o_d[1]);
not(not2, i[1]);
not(not3, o_d[2]);

assign i_m[0] = i[1];
assign i_m[1] = o_d[2];
assign i_m[2] = o_d[1];
assign i_m[3] = o_d[1];
assign i_m[4] = not1;
assign i_m[5] = o_d[1];
assign i_m[6] = not2;
assign i_m[7] = not3;

mux_8_1 b(r,i_m,c_m);

endmodule