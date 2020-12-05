module time_check(in,out);

input [23:0] in;
output out;

wire  w0;
wire  w1;
wire  w2;
wire [23:0] b3;
wire  w28;
wire  b3_0_w4;
wire  b3_1_w5;
wire  b3_2_w6;
wire  b3_3_w7;
wire  b3_4_w8;
wire  b3_5_w9;
wire  b3_6_w10;
wire  b3_7_w11;
wire  b3_8_w12;
wire  b3_9_w13;
wire  b3_10_w14;
wire  b3_11_w15;
wire  b3_12_w16;
wire  b3_13_w17;
wire  b3_14_w18;
wire  b3_15_w19;
wire  b3_16_w20;
wire  b3_17_w21;
wire  b3_18_w22;
wire  b3_19_w23;
wire  b3_20_w24;
wire  b3_21_w25;
wire  b3_22_w26;
wire  b3_23_w27;

assign b3 = in;
assign out = w28;

assign b3_0_w4 = {b3[0]};
assign b3_1_w5 = {b3[1]};
assign b3_2_w6 = {b3[2]};
assign b3_3_w7 = {b3[3]};
assign b3_4_w8 = {b3[4]};
assign b3_5_w9 = {b3[5]};
assign b3_6_w10 = {b3[6]};
assign b3_7_w11 = {b3[7]};
assign b3_8_w12 = {b3[8]};
assign b3_9_w13 = {b3[9]};
assign b3_10_w14 = {b3[10]};
assign b3_11_w15 = {b3[11]};
assign b3_12_w16 = {b3[12]};
assign b3_13_w17 = {b3[13]};
assign b3_14_w18 = {b3[14]};
assign b3_15_w19 = {b3[15]};
assign b3_16_w20 = {b3[16]};
assign b3_17_w21 = {b3[17]};
assign b3_18_w22 = {b3[18]};
assign b3_19_w23 = {b3[19]};
assign b3_20_w24 = {b3[20]};
assign b3_21_w25 = {b3[21]};
assign b3_22_w26 = {b3[22]};
assign b3_23_w27 = {b3[23]};

PNU_OR8
     s0 (
      .o1(w1),
      .i1(b3_0_w4),
      .i2(b3_1_w5),
      .i3(b3_2_w6),
      .i4(b3_3_w7),
      .i5(b3_4_w8),
      .i6(b3_5_w9),
      .i7(b3_6_w10),
      .i8(b3_7_w11));

PNU_OR8
     s1 (
      .o1(w0),
      .i1(b3_8_w12),
      .i2(b3_9_w13),
      .i3(b3_10_w14),
      .i4(b3_11_w15),
      .i5(b3_12_w16),
      .i6(b3_13_w17),
      .i7(b3_14_w18),
      .i8(b3_15_w19));

PNU_OR8
     s2 (
      .o1(w2),
      .i1(b3_16_w20),
      .i2(b3_17_w21),
      .i3(b3_18_w22),
      .i4(b3_19_w23),
      .i5(b3_20_w24),
      .i6(b3_21_w25),
      .i7(b3_22_w26),
      .i8(b3_23_w27));

PNU_OR3
     s3 (
      .i2(w0),
      .i1(w1),
      .i3(w2),
      .o1(w28));

endmodule

