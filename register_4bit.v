module register_4bit(Ce,Din,CLK,RST,Dout);

input Ce;
input [3:0] Din;
input CLK;
input RST;
output [3:0] Dout;

wire [3:0] b0;
wire  w6;
wire  w7;
wire  w8;
wire [3:0] b9;
wire  b0_0;
wire  b0_1;
wire  b0_2;
wire  b0_3;
wire  b9_0_w11;
wire  b9_1_w12;
wire  b9_2_w13;
wire  b9_3_w14;

assign w8 = Ce;
assign b9 = Din;
assign w7 = CLK;
assign w6 = RST;
assign Dout = b0;

assign b0[3] = b0_3;
assign b0[2] = b0_2;
assign b0[1] = b0_1;
assign b0[0] = b0_0;

assign b9_0_w11 = {b9[0]};
assign b9_1_w12 = {b9[1]};
assign b9_2_w13 = {b9[2]};
assign b9_3_w14 = {b9[3]};

PNU_DFF_Ce
     s0 (
      .Q(b0_0),
      .reset(w6),
      .clock(w7),
      .Ce(w8),
      .D(b9_0_w11));

PNU_DFF_Ce
     s1 (
      .Q(b0_1),
      .reset(w6),
      .clock(w7),
      .Ce(w8),
      .D(b9_1_w12));

PNU_DFF_Ce
     s2 (
      .Q(b0_2),
      .reset(w6),
      .clock(w7),
      .Ce(w8),
      .D(b9_2_w13));

PNU_DFF_Ce
     s3 (
      .Q(b0_3),
      .reset(w6),
      .clock(w7),
      .Ce(w8),
      .D(b9_3_w14));

endmodule

