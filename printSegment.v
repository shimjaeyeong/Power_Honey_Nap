module printSegment(bNum,seg);

input [3:0] bNum;
output [6:0] seg;

wire [3:0] b0;
wire [9:0] b22;
wire  w6;
wire [6:0] b23;
wire  w32;
wire  w33;
wire  w35;
wire  w36;
wire  w28;
wire  w31;
wire [7:0] b22_9to5_3to2_0_b2;
wire [7:0] b22_9to7_4to0_b4;
wire [7:0] b22_8to3_1to0_b5;
wire  b22_9_w7;
wire  b23_0;
wire  b23_1;
wire  b23_2;
wire  b23_3;
wire  b23_5;
wire  b23_6;
wire [3:0] b22_5_3to2_0_b17;
wire [2:0] b22_9to8_6_b18;
wire [3:0] b22_8_6_2_0_b19;
wire [2:0] b22_6to4_b24;
wire [2:0] b22_9to8_0_b25;
wire [2:0] b22_9to8_6_b26;
wire [3:0] b22_5to2_b27;
wire  b23_4;

assign b0 = bNum;
assign seg = b23;

assign b23[6] = b23_6;
assign b23[5] = b23_5;
assign b23[4] = b23_4;
assign b23[3] = b23_3;
assign b23[2] = b23_2;
assign b23[1] = b23_1;
assign b23[0] = b23_0;

assign b22_9to5_3to2_0_b2[7:0] = {b22[9:5], b22[3:2], b22[0]};
assign b22_9to7_4to0_b4[7:0] = {b22[9:7], b22[4:0]};
assign b22_8to3_1to0_b5[7:0] = {b22[8:3], b22[1:0]};
assign b22_9_w7 = {b22[9]};
assign b22_5_3to2_0_b17[3:0] = {b22[5], b22[3:2], b22[0]};
assign b22_9to8_6_b18[2:0] = {b22[9:8], b22[6]};
assign b22_8_6_2_0_b19[3:0] = {b22[8], b22[6], b22[2], b22[0]};
assign b22_6to4_b24[2:0] = {b22[6:4]};
assign b22_9to8_0_b25[2:0] = {b22[9:8], b22[0]};
assign b22_9to8_6_b26[2:0] = {b22[9:8], b22[6]};
assign b22_5to2_b27[3:0] = {b22[5:2]};

Binary_to_Decimal_Convert
     s16 (
      .binary(b0),
      .decimal(b22));

PNU_AND2
     s4 (
      .i1(w6),
      .i2(b22_9_w7),
      .o1(b23_2));

PNU_AND2
     s7 (
      .o1(b23_3),
      .i1(w32),
      .i2(w33));

PNU_AND2
     s12 (
      .o1(b23_5),
      .i1(w35),
      .i2(w36));

PNU_AND2
     s15 (
      .o1(b23_6),
      .i1(w28),
      .i2(w31));

multiOR
     s17 (
      .in(b22_9to5_3to2_0_b2),
      .out(b23_0));

multiOR
     s18 (
      .in(b22_9to7_4to0_b4),
      .out(b23_1));

multiOR
     s19 (
      .in(b22_8to3_1to0_b5),
      .out(w6));

multiOR4
     s20 (
      .in(b22_5_3to2_0_b17),
      .out(w32));

multiOR3
     s21 (
      .in(b22_9to8_6_b18),
      .out(w33));

multiOR4
     s22 (
      .in(b22_8_6_2_0_b19),
      .out(b23_4));

multiOR3
     s11 (
      .in(b22_6to4_b24),
      .out(w35));

multiOR3
     s13 (
      .in(b22_9to8_0_b25),
      .out(w36));

multiOR4
     s14 (
      .in(b22_5to2_b27),
      .out(w28));

multiOR3
     s23 (
      .in(b22_9to8_6_b26),
      .out(w31));

endmodule

