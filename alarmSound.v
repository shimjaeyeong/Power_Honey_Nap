module alarmSound(clk,rst,led1,alarmSori,sharp,keypad);

input clk;
input rst;
output led1;
output alarmSori;
input sharp;
input keypad;

wire [12:0] b2;
wire  w3;
wire  w7;
wire  w10;
wire  w8;
wire  w12;
wire  w13;
wire  w9;
wire  w11;

assign w8 = clk;
assign w9 = rst;
assign led1 = w3;
assign alarmSori = w11;
assign w12 = sharp;
assign w13 = keypad;

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

alarm
     #(
      .S0(0),
      .S1(1),
      .S10(9),
      .S11(10),
      .S12(12),
      .S2(2),
      .S3(3),
      .S4(4),
      .S6(5),
      .S7(6),
      .S8(7),
      .S9(8),
      .st(11))
     s5 (
      .beat(b2),
      .light(w3),
      .clock(w7),
      .stop(w12),
      .start(w13),
      .reset(w9));

piezo
     s6 (
      .playSound(b2),
      .clk(w8),
      .rst(w9),
      .piezo(w11));

endmodule

