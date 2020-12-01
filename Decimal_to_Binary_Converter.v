module Decimal_to_Binary_Converter(d,b);

input [9:0] d;
output [3:0] b;

wire  w18;
wire [3:0] b15;
wire [9:0] b14;
wire  b15_0;
wire  b15_1;
wire  b15_2;
wire  b15_3;
wire  b14_1_w14;
wire  b14_2_w24;
wire  b14_3_w15;
wire  b14_4_w19;
wire  b14_5_w25;
wire  b14_6_w16;
wire  b14_7_w17;
wire  b14_8_w26;
wire  b14_9_w27;

assign b14 = d;
assign b = b15;

assign b15[3] = b15_3;
assign b15[2] = b15_2;
assign b15[1] = b15_1;
assign b15[0] = b15_0;

assign b14_1_w14 = {b14[1]};
assign b14_2_w24 = {b14[2]};
assign b14_3_w15 = {b14[3]};
assign b14_4_w19 = {b14[4]};
assign b14_5_w25 = {b14[5]};
assign b14_6_w16 = {b14[6]};
assign b14_7_w17 = {b14[7]};
assign b14_8_w26 = {b14[8]};
assign b14_9_w27 = {b14[9]};

PNU_ZERO
     s1 (
      .o1(w18));

PNU_OR4
     s2 (
      .o1(b15_1),
      .i1(b14_2_w24),
      .i2(b14_3_w15),
      .i3(b14_6_w16),
      .i4(b14_7_w17));

PNU_OR4
     s3 (
      .o1(b15_2),
      .i1(b14_4_w19),
      .i2(b14_5_w25),
      .i3(b14_6_w16),
      .i4(b14_7_w17));

PNU_OR2
     s4 (
      .o1(b15_3),
      .i1(b14_8_w26),
      .i2(b14_9_w27));

PNU_OR8
     s0 (
      .i7(w18),
      .i5(w18),
      .i3(w18),
      .o1(b15_0),
      .i1(b14_1_w14),
      .i2(b14_3_w15),
      .i4(b14_5_w25),
      .i6(b14_7_w17),
      .i8(b14_9_w27));

endmodule

