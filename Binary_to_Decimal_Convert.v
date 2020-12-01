module Binary_to_Decimal_Convert(binary,decimal);

input [3:0] binary;
output [9:0] decimal;

wire  w5;
wire  w6;
wire  w7;
wire  w8;
wire [3:0] b4;
wire  w13;
wire  w14;
wire  w15;
wire  w18;
wire  w19;
wire  w20;
wire  w23;
wire  w24;
wire  w25;
wire  w26;
wire  w27;
wire  w30;
wire  w31;
wire  w32;
wire  w33;
wire  w36;
wire  w37;
wire  w38;
wire  w39;
wire  w40;
wire  w41;
wire [9:0] b30;
wire  b4_2_w29;
wire  b4_1_w35;
wire  b4_3_w42;
wire  b4_0_w34;
wire  b30_0;
wire  b30_1;
wire  b30_2;
wire  b30_3;
wire  b30_4;
wire  b30_5;
wire  b30_6;
wire  b30_7;
wire  b30_8;
wire  b30_9;

assign b4 = binary;
assign decimal = b30;

assign b30[9] = b30_9;
assign b30[8] = b30_8;
assign b30[7] = b30_7;
assign b30[6] = b30_6;
assign b30[5] = b30_5;
assign b30[4] = b30_4;
assign b30[3] = b30_3;
assign b30[2] = b30_2;
assign b30[1] = b30_1;
assign b30[0] = b30_0;

assign b4_2_w29 = {b4[2]};
assign b4_1_w35 = {b4[1]};
assign b4_3_w42 = {b4[3]};
assign b4_0_w34 = {b4[0]};

PNU_AND4
     s0 (
      .i1(w5),
      .i2(w6),
      .i3(w7),
      .i4(w8),
      .o1(b30_0));

PNU_AND4
     s1 (
      .i1(w13),
      .i2(w14),
      .i3(w15),
      .i4(b4_0_w34),
      .o1(b30_1));

PNU_AND4
     s2 (
      .i1(w18),
      .i2(w19),
      .i4(w20),
      .i3(b4_1_w35),
      .o1(b30_2));

PNU_AND4
     s3 (
      .i1(w23),
      .i2(w24),
      .i3(b4_1_w35),
      .i4(b4_0_w34),
      .o1(b30_3));

PNU_AND4
     s4 (
      .i3(w25),
      .i1(w26),
      .i4(w27),
      .i2(b4_2_w29),
      .o1(b30_4));

PNU_AND4
     s5 (
      .i1(w30),
      .i3(w31),
      .i2(b4_2_w29),
      .i4(b4_0_w34),
      .o1(b30_5));

PNU_AND4
     s6 (
      .i1(w32),
      .i4(w33),
      .i2(b4_2_w29),
      .i3(b4_1_w35),
      .o1(b30_6));

PNU_AND4
     s7 (
      .i1(w36),
      .i2(b4_2_w29),
      .i3(b4_1_w35),
      .i4(b4_0_w34),
      .o1(b30_7));

PNU_AND4
     s8 (
      .i2(w37),
      .i3(w38),
      .i4(w39),
      .i1(b4_3_w42),
      .o1(b30_8));

PNU_AND4
     s9 (
      .i2(w40),
      .i3(w41),
      .i1(b4_3_w42),
      .i4(b4_0_w34),
      .o1(b30_9));

PNU_NOT
     s10 (
      .o1(w5),
      .i1(b4_3_w42));

PNU_NOT
     s11 (
      .o1(w6),
      .i1(b4_2_w29));

PNU_NOT
     s12 (
      .o1(w7),
      .i1(b4_1_w35));

PNU_NOT
     s13 (
      .o1(w8),
      .i1(b4_0_w34));

PNU_NOT
     s14 (
      .o1(w13),
      .i1(b4_3_w42));

PNU_NOT
     s15 (
      .o1(w14),
      .i1(b4_2_w29));

PNU_NOT
     s16 (
      .o1(w15),
      .i1(b4_1_w35));

PNU_NOT
     s17 (
      .o1(w18),
      .i1(b4_3_w42));

PNU_NOT
     s18 (
      .o1(w19),
      .i1(b4_2_w29));

PNU_NOT
     s19 (
      .o1(w20),
      .i1(b4_0_w34));

PNU_NOT
     s20 (
      .o1(w23),
      .i1(b4_3_w42));

PNU_NOT
     s21 (
      .o1(w24),
      .i1(b4_2_w29));

PNU_NOT
     s22 (
      .o1(w26),
      .i1(b4_3_w42));

PNU_NOT
     s23 (
      .o1(w25),
      .i1(b4_1_w35));

PNU_NOT
     s24 (
      .o1(w27),
      .i1(b4_0_w34));

PNU_NOT
     s25 (
      .o1(w30),
      .i1(b4_3_w42));

PNU_NOT
     s26 (
      .o1(w31),
      .i1(b4_1_w35));

PNU_NOT
     s27 (
      .o1(w32),
      .i1(b4_3_w42));

PNU_NOT
     s28 (
      .o1(w33),
      .i1(b4_0_w34));

PNU_NOT
     s29 (
      .o1(w36),
      .i1(b4_3_w42));

PNU_NOT
     s30 (
      .o1(w37),
      .i1(b4_2_w29));

PNU_NOT
     s31 (
      .o1(w38),
      .i1(b4_1_w35));

PNU_NOT
     s32 (
      .o1(w39),
      .i1(b4_0_w34));

PNU_NOT
     s33 (
      .o1(w40),
      .i1(b4_2_w29));

PNU_NOT
     s34 (
      .o1(w41),
      .i1(b4_1_w35));

endmodule

