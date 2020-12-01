module BCD_converter(D,Bin,CHK);

input [9:0] D;
output [3:0] Bin;
output CHK;

wire  w18;
wire [3:0] b15;
wire [9:0] b16;
wire  w27;
wire  w31;
wire  b15_0;
wire  b15_1;
wire  b15_2;
wire  b15_3;
wire  b16_1_w28;
wire  b16_2_w24;
wire  b16_3_w30;
wire  b16_4_w19;
wire  b16_5_w25;
wire  b16_6_w16;
wire  b16_7_w17;
wire  b16_8_w15;
wire  b16_9_w26;
wire  b16_0_w29;

assign b16 = D;
assign Bin = b15;
assign CHK = w31;

assign b15[3] = b15_3;
assign b15[2] = b15_2;
assign b15[1] = b15_1;
assign b15[0] = b15_0;

assign b16_1_w28 = {b16[1]};
assign b16_2_w24 = {b16[2]};
assign b16_3_w30 = {b16[3]};
assign b16_4_w19 = {b16[4]};
assign b16_5_w25 = {b16[5]};
assign b16_6_w16 = {b16[6]};
assign b16_7_w17 = {b16[7]};
assign b16_8_w15 = {b16[8]};
assign b16_9_w26 = {b16[9]};
assign b16_0_w29 = {b16[0]};

PNU_ZERO
     s1 (
      .o1(w18));

PNU_OR4
     s2 (
      .o1(b15_1),
      .i1(b16_2_w24),
      .i2(b16_3_w30),
      .i3(b16_6_w16),
      .i4(b16_7_w17));

PNU_OR4
     s3 (
      .o1(b15_2),
      .i1(b16_4_w19),
      .i2(b16_5_w25),
      .i3(b16_6_w16),
      .i4(b16_7_w17));

PNU_OR2
     s4 (
      .o1(b15_3),
      .i1(b16_8_w15),
      .i2(b16_9_w26));

PNU_OR8
     s0 (
      .i7(w18),
      .i5(w18),
      .i3(w18),
      .o1(b15_0),
      .i1(b16_1_w28),
      .i2(b16_3_w30),
      .i4(b16_5_w25),
      .i6(b16_7_w17),
      .i8(b16_9_w26));

PNU_OR8
     s5 (
      .i1(b16_1_w28),
      .i2(b16_2_w24),
      .i3(b16_3_w30),
      .i4(b16_4_w19),
      .i5(b16_5_w25),
      .i6(b16_6_w16),
      .i7(b16_7_w17),
      .i8(b16_8_w15),
      .o1(w27));

PNU_OR3
     s6 (
      .i2(b16_9_w26),
      .i1(w27),
      .i3(b16_0_w29),
      .o1(w31));

endmodule

