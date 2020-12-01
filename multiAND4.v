module multiAND4(in,out);

input [3:0] in;
output out;

wire [3:0] b5;
wire  w9;
wire  b5_0_w1;
wire  b5_1_w2;
wire  b5_2_w3;
wire  b5_3_w4;

assign b5 = in;
assign out = w9;

assign b5_0_w1 = {b5[0]};
assign b5_1_w2 = {b5[1]};
assign b5_2_w3 = {b5[2]};
assign b5_3_w4 = {b5[3]};

PNU_AND4
     s0 (
      .i1(b5_0_w1),
      .i2(b5_1_w2),
      .i3(b5_2_w3),
      .i4(b5_3_w4),
      .o1(w9));

endmodule

