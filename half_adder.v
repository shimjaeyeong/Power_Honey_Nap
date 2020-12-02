module half_adder(A,B,S,C);

input A;
input B;
output S;
output C;

wire  w0;
wire  w1;
wire  w2;
wire  w3;

assign w0 = A;
assign w1 = B;
assign S = w2;
assign C = w3;

PNU_XOR2
     s0 (
      .i1(w0),
      .i2(w1),
      .o1(w2));

PNU_AND2
     s1 (
      .i1(w0),
      .i2(w1),
      .o1(w3));

endmodule

