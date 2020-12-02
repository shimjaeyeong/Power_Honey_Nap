module adder_carry6(Cout,A,B,Cin,S);

output Cout;
input [3:0] A;
input [3:0] B;
input Cin;
output [3:0] S;

wire [3:0] b20;
wire [3:0] b21;
wire [3:0] b30;
wire  w20;
wire  w21;
wire  w22;
wire  w19;
wire  w29;
wire [3:0] b27;
wire [3:0] b29;
wire  w36;
wire  w31;
wire  b20_3_w11;
wire  b21_3_w12;
wire  b20_2_w13;
wire  b21_2_w14;
wire  b20_1_w15;
wire  b21_1_w16;
wire  b20_0_w17;
wire  b21_0_w18;
wire  b30_0;
wire  b30_1;
wire  b30_2;
wire  b30_3;
wire  b29_0;
wire  b30_2_w34;
wire  b30_1_w37;
wire  b30_0_w30;
wire  b29_2;
wire  b29_1;

assign Cout = b29[1];
assign b20 = A;
assign b21 = B;
assign w19 = Cin;
assign S = b27;

assign b30[3] = b30_3;
assign b30[2] = b30_2;
assign b30[1] = b30_1;
assign b30[0] = b30_0;
assign b29[3] = b29_2;
assign b29[2] = b29_1;
assign b29[1] = b29_1;
assign b29[0] = b29_0;

assign b20_3_w11 = {b20[3]};
assign b21_3_w12 = {b21[3]};
assign b20_2_w13 = {b20[2]};
assign b21_2_w14 = {b21[2]};
assign b20_1_w15 = {b20[1]};
assign b21_1_w16 = {b21[1]};
assign b20_0_w17 = {b20[0]};
assign b21_0_w18 = {b21[0]};
assign b30_2_w34 = {b30[2]};
assign b30_1_w37 = {b30[1]};
assign b30_0_w30 = {b30[0]};

full_adder
     s1 (
      .A(b20_1_w15),
      .B(b21_1_w16),
      .S(b30_1),
      .C(w21),
      .Cin(w22));

full_adder
     s2 (
      .A(b20_2_w13),
      .B(b21_2_w14),
      .S(b30_2),
      .C(w20),
      .Cin(w21));

full_adder
     s0 (
      .A(b20_0_w17),
      .B(b21_0_w18),
      .S(b30_0),
      .C(w22),
      .Cin(w19));

full_adder
     s3 (
      .A(b20_3_w11),
      .B(b21_3_w12),
      .S(b30_3),
      .Cin(w20),
      .C(w31));

PNU_AND2
     s4 (
      .o1(w29),
      .i1(b30_2_w34),
      .i2(b30_1_w37));

ripple_carry_adder_4bit
     s8 (
      .S(b27),
      .B(b29),
      .Cin(w36),
      .A(b30),
      .Cout());

PNU_ZERO
     s9 (
      .o1(b29_2));

PNU_ZERO
     s12 (
      .o1(b29_0));

PNU_ZERO
     s13 (
      .o1(w36));

PNU_OR3
     s10 (
      .i2(w29),
      .i1(w31),
      .i3(b30_0_w30),
      .o1(b29_1));

endmodule

