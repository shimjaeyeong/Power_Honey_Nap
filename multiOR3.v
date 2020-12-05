module multiOR3(in,out);

input [2:0] in;
output out;

wire [2:0] b4;
wire  w9;
wire  b4_0_w1;
wire  b4_1_w2;
wire  b4_2_w3;

assign b4 = in;
assign out = w9;

assign b4_0_w1 = {b4[0]};
assign b4_1_w2 = {b4[1]};
assign b4_2_w3 = {b4[2]};

PNU_OR3
     s0 (
      .i1(b4_0_w1),
      .i2(b4_1_w2),
      .i3(b4_2_w3),
      .o1(w9));

endmodule

