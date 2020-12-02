module multi_mux4(a,b,en,out);

input [3:0] a;
input [3:0] b;
input en;
output [3:0] out;

wire [3:0] b0;
wire [3:0] b1;
wire  w10;
wire [3:0] b11;
wire  b1_3_w2;
wire  b1_2_w3;
wire  b1_1_w4;
wire  b1_0_w5;
wire  b0_0_w6;
wire  b0_1_w7;
wire  b0_2_w8;
wire  b0_3_w9;
wire  b11_0;
wire  b11_1;
wire  b11_2;
wire  b11_3;

assign b1 = a;
assign b0 = b;
assign w10 = en;
assign out = b11;

assign b11[3] = b11_3;
assign b11[2] = b11_2;
assign b11[1] = b11_1;
assign b11[0] = b11_0;

assign b1_3_w2 = {b1[3]};
assign b1_2_w3 = {b1[2]};
assign b1_1_w4 = {b1[1]};
assign b1_0_w5 = {b1[0]};
assign b0_0_w6 = {b0[0]};
assign b0_1_w7 = {b0[1]};
assign b0_2_w8 = {b0[2]};
assign b0_3_w9 = {b0[3]};

PNU_MUX2
     s0 (
      .i1(b1_0_w5),
      .i2(b0_0_w6),
      .e1(w10),
      .o1(b11_0));

PNU_MUX2
     s1 (
      .i1(b1_1_w4),
      .i2(b0_1_w7),
      .e1(w10),
      .o1(b11_1));

PNU_MUX2
     s2 (
      .i1(b1_2_w3),
      .i2(b0_2_w8),
      .e1(w10),
      .o1(b11_2));

PNU_MUX2
     s3 (
      .i1(b1_3_w2),
      .i2(b0_3_w9),
      .e1(w10),
      .o1(b11_3));

endmodule

