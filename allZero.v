module allZero(zero_out);

output [3:0] zero_out;

wire [3:0] b4;
wire  b4_3;
wire  b4_0;
wire  b4_1;
wire  b4_2;

assign zero_out = b4;

assign b4[3] = b4_3;
assign b4[2] = b4_2;
assign b4[1] = b4_1;
assign b4[0] = b4_0;

PNU_ZERO
     s0 (
      .o1(b4_3));

PNU_ZERO
     s1 (
      .o1(b4_2));

PNU_ZERO
     s2 (
      .o1(b4_1));

PNU_ZERO
     s3 (
      .o1(b4_0));

endmodule

