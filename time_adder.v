module time_adder(oHour10,oHour1,oMinute10,oMinute1,oSecond10,oSecond1,pHour10,pHour1,pMinute10,pMinute1,pSecond10,pSecond1,Hour10,Hour1,Minute10,Minute1,Second10,Second1);

input [3:0] oHour10;
input [3:0] oHour1;
input [3:0] oMinute10;
input [3:0] oMinute1;
input [3:0] oSecond10;
input [3:0] oSecond1;
input [3:0] pHour10;
input [3:0] pHour1;
input [3:0] pMinute10;
input [3:0] pMinute1;
input [3:0] pSecond10;
input [3:0] pSecond1;
output [3:0] Hour10;
output [3:0] Hour1;
output [3:0] Minute10;
output [3:0] Minute1;
output [3:0] Second10;
output [3:0] Second1;

wire [3:0] b0;
wire [3:0] b1;
wire [3:0] b2;
wire [3:0] b3;
wire [3:0] b4;
wire [3:0] b5;
wire [3:0] b6;
wire [3:0] b7;
wire [3:0] b8;
wire [3:0] b9;
wire [3:0] b10;
wire [3:0] b11;
wire [3:0] b12;
wire [3:0] b13;
wire [3:0] b14;
wire [3:0] b15;
wire [3:0] b16;
wire [3:0] b17;
wire  w18;
wire  w19;
wire  w20;
wire  w21;
wire  w22;
wire  w23;

assign b0 = oHour10;
assign b1 = oHour1;
assign b2 = oMinute10;
assign b3 = oMinute1;
assign b4 = oSecond10;
assign b5 = oSecond1;
assign b6 = pHour10;
assign b7 = pHour1;
assign b8 = pMinute10;
assign b9 = pMinute1;
assign b10 = pSecond10;
assign b11 = pSecond1;
assign Hour10 = b12;
assign Hour1 = b13;
assign Minute10 = b14;
assign Minute1 = b15;
assign Second10 = b16;
assign Second1 = b17;

adder_carry10
     s0 (
      .A(b0),
      .B(b6),
      .S(b12),
      .Cin(w23),
      .Cout());

adder_carry10
     s1 (
      .A(b1),
      .B(b7),
      .S(b13),
      .Cin(w22),
      .Cout(w23));

adder_carry10
     s2 (
      .A(b3),
      .B(b9),
      .S(b15),
      .Cin(w20),
      .Cout(w21));

adder_carry6
     s3 (
      .A(b2),
      .B(b8),
      .S(b14),
      .Cin(w21),
      .Cout(w22));

adder_carry10
     s4 (
      .A(b5),
      .B(b11),
      .S(b17),
      .Cin(w18),
      .Cout(w19));

adder_carry6
     s5 (
      .A(b4),
      .B(b10),
      .S(b16),
      .Cin(w19),
      .Cout(w20));

PNU_ZERO
     s6 (
      .o1(w18));

endmodule

