module shortcutSetting(keypad,clk,en,rst,sharp,completeSetting,hour_ten_out,hour_one_out,min_ten_out,min_one_out,sec_ten_out,sec_one_out,hour_ten_in,hour_one_in,min_ten_in,min_one_in,sec_ten_in,sec_one_in);

input [9:0] keypad;
input clk;
input en;
input rst;
input sharp;
output completeSetting;
output [3:0] hour_ten_out;
output [3:0] hour_one_out;
output [3:0] min_ten_out;
output [3:0] min_one_out;
output [3:0] sec_ten_out;
output [3:0] sec_one_out;
input [3:0] hour_ten_in;
input [3:0] hour_one_in;
input [3:0] min_ten_in;
input [3:0] min_one_in;
input [3:0] sec_ten_in;
input [3:0] sec_one_in;

wire [9:0] b3;
wire  w4;
wire  w5;
wire  w6;
wire  w7;
wire [3:0] b22;
wire [3:0] b23;
wire [3:0] b24;
wire [3:0] b28;
wire [3:0] b30;
wire [3:0] b32;
wire [3:0] b26;
wire [3:0] b34;
wire [3:0] b36;
wire [3:0] b37;
wire [3:0] b35;
wire [3:0] b33;
wire [3:0] b29;
wire [3:0] b27;
wire [3:0] b25;
wire [3:0] b39;
wire  w23;
wire [3:0] b31;
wire [3:0] b38;

assign b3 = keypad;
assign w7 = clk;
assign w6 = en;
assign w5 = rst;
assign w4 = sharp;
assign completeSetting = w23;
assign hour_ten_out = b36;
assign hour_one_out = b34;
assign min_ten_out = b32;
assign min_one_out = b30;
assign sec_ten_out = b28;
assign sec_one_out = b26;
assign b37 = hour_ten_in;
assign b35 = hour_one_in;
assign b33 = min_ten_in;
assign b31 = min_one_in;
assign b29 = sec_ten_in;
assign b27 = sec_one_in;

select_keypad
     #(
      .fiveSecond(0),
      .halfMinute(1),
      .input_wait(3),
      .oneMinute(2),
      .set_complete(4))
     s0 (
      .keypad(b3),
      .sharp(w4),
      .reset(w5),
      .en(w6),
      .clock(w7),
      .one_min(b22),
      .ten_sec(b23),
      .one_sec(b24),
      .completeSetting(w23));

allZero
     s3 (
      .zero_out(b39));

allZero
     s4 (
      .zero_out(b25));

time_adder
     s1 (
      .pMinute1(b22),
      .pSecond10(b23),
      .pSecond1(b24),
      .Second10(b28),
      .Minute1(b30),
      .Minute10(b32),
      .Second1(b26),
      .Hour1(b34),
      .Hour10(b36),
      .oHour10(b37),
      .oHour1(b35),
      .oMinute10(b33),
      .oSecond10(b29),
      .oSecond1(b27),
      .pMinute10(b25),
      .pHour1(b39),
      .oMinute1(b31),
      .pHour10(b38));

allZero
     s5 (
      .zero_out(b38));

endmodule

