module alarmSound(clk,rst,led1,alarmSori,sharp,keypad);

input clk;
input rst;
output led1;
output alarmSori;
input sharp;
input keypad;

wire [12:0] b2;
wire  w3;
wire  w4;
wire  w7;
wire  w10;
wire  w8;
wire  w12;
wire  w13;
wire  w9;

assign w8 = clk;
assign w9 = rst;
assign led1 = w3;
assign alarmSori = w4;
assign w12 = sharp;
assign w13 = keypad;

piezo
     s1 (
      .playSound(b2),
      .piezo(w4),
      .clk(w8),
      .rst(w9));

alarm
     #(
      .S0(0),
      .S1(1),
      .S10(10),
      .S11(11),
      .S12(13),
      .S13(14),
      .S2(2),
      .S3(3),
      .S4(4),
      .S5(5),
      .S6(6),
      .S7(7),
      .S8(8),
      .S9(9),
      .st(12))
     s2 (
      .beat(b2),
      .light(w3),
      .clock(w7),
      .stop(w12),
      .start(w13),
      .reset(w9));

PNU_CLK_DIV
     #(
      .cnt_num(500000))
     s3 (
      .div_clk(w7),
      .en(w10),
      .clk(w8),
      .rst(w9));

PNU_ONE
     s4 (
      .o1(w10));

endmodule

