module ripple_carry_adder_4bit(Cout,A,B,Cin,S);

output Cout;
input [3:0] A;
input [3:0] B;
input Cin;
output [3:0] S;

wire [3:0] b20;
wire [3:0] b21;
wire [3:0] b19;
wire  w20;
wire  w21;
wire  w22;
wire  w19;
wire  w23;
wire  b20_3_w11;
wire  b21_3_w12;
wire  b20_2_w13;
wire  b21_2_w14;
wire  b20_1_w15;
wire  b21_1_w16;
wire  b20_0_w17;
wire  b21_0_w18;
wire  b19_0;
wire  b19_1;
wire  b19_2;
wire  b19_3;

assign Cout = w23;
assign b20 = A;
assign b21 = B;
assign w19 = Cin;
assign S = b19;

assign b19[3] = b19_3;
assign b19[2] = b19_2;
assign b19[1] = b19_1;
assign b19[0] = b19_0;

assign b20_3_w11 = {b20[3]};
assign b21_3_w12 = {b21[3]};
assign b20_2_w13 = {b20[2]};
assign b21_2_w14 = {b21[2]};
assign b20_1_w15 = {b20[1]};
assign b21_1_w16 = {b21[1]};
assign b20_0_w17 = {b20[0]};
assign b21_0_w18 = {b21[0]};

full_adder
     s1 (
      .A(b20_1_w15),
      .B(b21_1_w16),
      .S(b19_1),
      .C(w21),
      .Cin(w22));

full_adder
     s2 (
      .A(b20_2_w13),
      .B(b21_2_w14),
      .S(b19_2),
      .C(w20),
      .Cin(w21));

full_adder
     s0 (
      .A(b20_0_w17),
      .B(b21_0_w18),
      .S(b19_0),
      .C(w22),
      .Cin(w19));

full_adder
     s3 (
      .A(b20_3_w11),
      .B(b21_3_w12),
      .S(b19_3),
      .Cin(w20),
      .C(w23));

endmodule

