module piezo(clk,rst,playSound,piezo);

input clk;
input rst;
input [12:0] playSound;
output piezo;

wire  w15;
wire  w16;
wire  w17;
wire  w18;
wire  w19;
wire  w20;
wire  w21;
wire  w22;
wire  w31;
wire  w30;
wire  w29;
wire  w32;
wire  w36;
wire  w37;
wire [12:0] b29;
wire  w34;
wire  w33;
wire  w35;
wire  b29_1_w38;
wire  b29_12_w39;
wire  b29_11_w40;
wire  b29_10_w41;
wire  b29_9_w42;
wire  b29_8_w43;
wire  b29_7_w44;
wire  b29_6_w45;
wire  b29_5_w46;
wire  b29_4_w47;
wire  b29_3_w48;
wire  b29_2_w49;

assign w36 = clk;
assign w37 = rst;
assign b29 = playSound;
assign piezo = w35;

assign b29_1_w38 = {b29[1]};
assign b29_12_w39 = {b29[12]};
assign b29_11_w40 = {b29[11]};
assign b29_10_w41 = {b29[10]};
assign b29_9_w42 = {b29[9]};
assign b29_8_w43 = {b29[8]};
assign b29_7_w44 = {b29[7]};
assign b29_6_w45 = {b29[6]};
assign b29_5_w46 = {b29[5]};
assign b29_4_w47 = {b29[4]};
assign b29_3_w48 = {b29[3]};
assign b29_2_w49 = {b29[2]};

PNU_CLK_DIV
     #(
      .cnt_num(2703))
     s2 (
      .div_clk(w15),
      .clk(w36),
      .rst(w37),
      .en(b29_2_w49));

PNU_CLK_DIV
     #(
      .cnt_num(2863))
     s14 (
      .div_clk(w22),
      .clk(w36),
      .rst(w37),
      .en(b29_1_w38));

PNU_CLK_DIV
     #(
      .cnt_num(2551))
     s3 (
      .div_clk(w16),
      .clk(w36),
      .rst(w37),
      .en(b29_3_w48));

PNU_CLK_DIV
     #(
      .cnt_num(2273))
     s4 (
      .div_clk(w17),
      .clk(w36),
      .rst(w37),
      .en(b29_4_w47));

PNU_CLK_DIV
     #(
      .cnt_num(2145))
     s5 (
      .div_clk(w18),
      .clk(w36),
      .rst(w37),
      .en(b29_5_w46));

PNU_CLK_DIV
     #(
      .cnt_num(2025))
     s6 (
      .div_clk(w19),
      .clk(w36),
      .rst(w37),
      .en(b29_6_w45));

PNU_CLK_DIV
     #(
      .cnt_num(1911))
     s7 (
      .div_clk(w20),
      .clk(w36),
      .rst(w37),
      .en(b29_7_w44));

PNU_CLK_DIV
     #(
      .cnt_num(1804))
     s8 (
      .div_clk(w21),
      .clk(w36),
      .rst(w37),
      .en(b29_8_w43));

PNU_OR8
     s9 (
      .i2(w15),
      .i3(w16),
      .i4(w17),
      .i5(w18),
      .i6(w19),
      .i7(w20),
      .i8(w21),
      .i1(w22),
      .o1(w34));

PNU_CLK_DIV
     #(
      .cnt_num(1703))
     s10 (
      .div_clk(w31),
      .clk(w36),
      .rst(w37),
      .en(b29_9_w42));

PNU_CLK_DIV
     #(
      .cnt_num(1517))
     s11 (
      .div_clk(w29),
      .clk(w36),
      .rst(w37),
      .en(b29_10_w41));

PNU_CLK_DIV
     #(
      .cnt_num(1432))
     s12 (
      .div_clk(w30),
      .clk(w36),
      .rst(w37),
      .en(b29_11_w40));

PNU_CLK_DIV
     #(
      .cnt_num(1276))
     s13 (
      .div_clk(w32),
      .clk(w36),
      .rst(w37),
      .en(b29_12_w39));

PNU_OR4
     s15 (
      .i1(w31),
      .i3(w30),
      .i2(w29),
      .i4(w32),
      .o1(w33));

PNU_OR2
     s16 (
      .i1(w34),
      .i2(w33),
      .o1(w35));

endmodule

