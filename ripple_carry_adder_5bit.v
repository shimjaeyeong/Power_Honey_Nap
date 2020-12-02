module ripple_carry_adder_5bit(Cout,A,B,Cin,S);

output Cout;
input [4:0] A;
input [4:0] B;
input Cin;
output [4:0] S;

wire [4:0] b18;
wire [4:0] b20;
wire [4:0] b21;
wire  w20;
wire  w21;
wire  w22;
wire  w19;
wire  w23;
wire  w24;
wire  b18_4_w11;
wire  b20_4_w12;
wire  b18_3_w13;
wire  b20_3_w14;
wire  b18_2_w15;
wire  b20_2_w16;
wire  b18_1_w17;
wire  b20_1_w18;
wire  b21_1;
wire  b21_2;
wire  b21_3;
wire  b21_4;
wire  b21_0;
wire  b20_0_w26;
wire  b18_0_w27;

assign Cout = w23;
assign b18 = A;
assign b20 = B;
assign w19 = Cin;
assign S = b21;

assign b21[4] = b21_4;
assign b21[3] = b21_3;
assign b21[2] = b21_2;
assign b21[1] = b21_1;
assign b21[0] = b21_0;

assign b18_4_w11 = {b18[4]};
assign b20_4_w12 = {b20[4]};
assign b18_3_w13 = {b18[3]};
assign b20_3_w14 = {b20[3]};
assign b18_2_w15 = {b18[2]};
assign b20_2_w16 = {b20[2]};
assign b18_1_w17 = {b18[1]};
assign b20_1_w18 = {b20[1]};
assign b20_0_w26 = {b20[0]};
assign b18_0_w27 = {b18[0]};

full_adder
     s1 (
      .A(b18_2_w15),
      .B(b20_2_w16),
      .S(b21_2),
      .C(w21),
      .Cin(w22));

full_adder
     s2 (
      .A(b18_3_w13),
      .B(b20_3_w14),
      .S(b21_3),
      .C(w20),
      .Cin(w21));

full_adder
     s0 (
      .A(b18_1_w17),
      .B(b20_1_w18),
      .S(b21_1),
      .C(w22),
      .Cin(w24));

full_adder
     s3 (
      .A(b18_4_w11),
      .B(b20_4_w12),
      .S(b21_4),
      .Cin(w20),
      .C(w23));

full_adder
     s4 (
      .Cin(w19),
      .C(w24),
      .S(b21_0),
      .B(b20_0_w26),
      .A(b18_0_w27));

endmodule

