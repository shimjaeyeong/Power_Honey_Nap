module full_adder(A,B,Cin,S,C);

input A;
input B;
input Cin;
output S;
output C;

wire  w0;
wire  w1;
wire  w4;
wire  w3;
wire  w6;
wire  w5;
wire  w8;
wire  w7;

assign w0 = A;
assign w1 = B;
assign w3 = Cin;
assign S = w7;
assign C = w8;

half_adder
     s0 (
      .A(w0),
      .B(w1),
      .S(w4),
      .C(w5));

half_adder
     s1 (
      .A(w4),
      .B(w3),
      .C(w6),
      .S(w7));

PNU_OR2
     s2 (
      .i1(w6),
      .i2(w5),
      .o1(w8));

endmodule

