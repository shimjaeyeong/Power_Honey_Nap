module keypadL2P(input_key,clk,rst,keypad);

input [9:0] input_key;
input clk;
input rst;
output [9:0] keypad;

wire [9:0] b24;
wire  w13;
wire  w15;
wire [9:0] b23;
wire  b24_9_w2;
wire  b24_8_w3;
wire  b24_7_w4;
wire  b24_6_w5;
wire  b24_5_w6;
wire  b24_4_w7;
wire  b24_3_w8;
wire  b24_2_w9;
wire  b24_0_w11;
wire  b24_1_w14;
wire  b23_8;
wire  b23_9;
wire  b23_7;
wire  b23_6;
wire  b23_5;
wire  b23_4;
wire  b23_3;
wire  b23_2;
wire  b23_1;
wire  b23_0;

assign b24 = input_key;
assign w13 = clk;
assign w15 = rst;
assign keypad = b23;

assign b23[9] = b23_9;
assign b23[8] = b23_8;
assign b23[7] = b23_7;
assign b23[6] = b23_6;
assign b23[5] = b23_5;
assign b23[4] = b23_4;
assign b23[3] = b23_3;
assign b23[2] = b23_2;
assign b23[1] = b23_1;
assign b23[0] = b23_0;

assign b24_9_w2 = {b24[9]};
assign b24_8_w3 = {b24[8]};
assign b24_7_w4 = {b24[7]};
assign b24_6_w5 = {b24[6]};
assign b24_5_w6 = {b24[5]};
assign b24_4_w7 = {b24[4]};
assign b24_3_w8 = {b24[3]};
assign b24_2_w9 = {b24[2]};
assign b24_0_w11 = {b24[0]};
assign b24_1_w14 = {b24[1]};

LTP
     s0 (
      .Level(b24_0_w11),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_0));

LTP
     s1 (
      .Level(b24_1_w14),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_1));

LTP
     s2 (
      .Level(b24_2_w9),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_2));

LTP
     s3 (
      .Level(b24_3_w8),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_3));

LTP
     s4 (
      .Level(b24_4_w7),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_4));

LTP
     s5 (
      .Level(b24_5_w6),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_5));

LTP
     s6 (
      .Level(b24_6_w5),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_6));

LTP
     s7 (
      .Level(b24_7_w4),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_7));

LTP
     s8 (
      .Level(b24_8_w3),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_8));

LTP
     s9 (
      .Level(b24_9_w2),
      .clk(w13),
      .rst(w15),
      .Pulse(b23_9));

endmodule

