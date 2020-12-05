module piezo(clk,rst,piezo,button);

input clk;
input rst;
output piezo;
input [7:0] button;

wire [7:0] b19;
wire  w7;
wire  w12;
wire  w13;
wire  w15;
wire  w16;
wire  w17;
wire  w18;
wire  w19;
wire  w20;
wire  w21;
wire  w22;
wire  b19_0_w3;
wire  b19_1_w4;
wire  b19_2_w5;
wire  b19_3_w6;
wire  b19_4_w8;
wire  b19_5_w9;
wire  b19_6_w10;
wire  b19_7_w11;

assign w12 = clk;
assign w13 = rst;
assign piezo = w7;
assign b19 = button;

assign b19_0_w3 = {b19[0]};
assign b19_1_w4 = {b19[1]};
assign b19_2_w5 = {b19[2]};
assign b19_3_w6 = {b19[3]};
assign b19_4_w8 = {b19[4]};
assign b19_5_w9 = {b19[5]};
assign b19_6_w10 = {b19[6]};
assign b19_7_w11 = {b19[7]};

PNU_CLK_DIV
     #(
      .cnt_num(3405))
     s2 (
      .en(b19_1_w4),
      .clk(w12),
      .rst(w13),
      .div_clk(w15));

PNU_CLK_DIV
     #(
      .cnt_num(3822))
     s14 (
      .en(b19_0_w3),
      .clk(w12),
      .rst(w13),
      .div_clk(w22));

PNU_CLK_DIV
     #(
      .cnt_num(3034))
     s3 (
      .en(b19_2_w5),
      .clk(w12),
      .rst(w13),
      .div_clk(w16));

PNU_CLK_DIV
     #(
      .cnt_num(2863))
     s4 (
      .en(b19_3_w6),
      .clk(w12),
      .rst(w13),
      .div_clk(w17));

PNU_CLK_DIV
     #(
      .cnt_num(2551))
     s5 (
      .en(b19_4_w8),
      .clk(w12),
      .rst(w13),
      .div_clk(w18));

PNU_CLK_DIV
     #(
      .cnt_num(2273))
     s6 (
      .en(b19_5_w9),
      .clk(w12),
      .rst(w13),
      .div_clk(w19));

PNU_CLK_DIV
     #(
      .cnt_num(2025))
     s7 (
      .en(b19_6_w10),
      .clk(w12),
      .rst(w13),
      .div_clk(w20));

PNU_CLK_DIV
     #(
      .cnt_num(1911))
     s8 (
      .en(b19_7_w11),
      .clk(w12),
      .rst(w13),
      .div_clk(w21));

PNU_OR8
     s9 (
      .o1(w7),
      .i2(w15),
      .i3(w16),
      .i4(w17),
      .i5(w18),
      .i6(w19),
      .i7(w20),
      .i8(w21),
      .i1(w22));

endmodule

