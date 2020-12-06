module manual_setting(keypad,hour_ten_out,hour_one_out,clk,rst,sharp,min_ten_out,min_one_out,sec_one_out,sec_ten_out,completeSetting,en,h,m,s);

input [9:0] keypad;
output [3:0] hour_ten_out;
output [3:0] hour_one_out;
input clk;
input rst;
input sharp;
output [3:0] min_ten_out;
output [3:0] min_one_out;
output [3:0] sec_one_out;
output [3:0] sec_ten_out;
output completeSetting;
input en;
output h;
output m;
output s;

wire [3:0] b9;
wire [3:0] b15;
wire [3:0] b16;
wire [3:0] b17;
wire [3:0] b18;
wire [3:0] b12;
wire [3:0] b13;
wire  w16;
wire  w19;
wire  w20;
wire [9:0] b19;
wire  w18;
wire  w17;
wire  w24;
wire  w22;
wire  w25;
wire  w28;
wire  w27;
wire  w26;
wire  w21;
wire  w23;
wire [7:0] b19_9to2_b22;
wire  b19_1_w29;
wire  b19_0_w30;

assign b19 = keypad;
assign hour_ten_out = b15;
assign hour_one_out = b16;
assign w17 = clk;
assign w18 = rst;
assign w16 = sharp;
assign min_ten_out = b13;
assign min_one_out = b12;
assign sec_one_out = b18;
assign sec_ten_out = b17;
assign completeSetting = w19;
assign w20 = en;
assign h = w28;
assign m = w27;
assign s = w26;

assign b19_9to2_b22[7:0] = {b19[9:2]};
assign b19_1_w29 = {b19[1]};
assign b19_0_w30 = {b19[0]};

shift_register_4bit
     s5 (
      .Din(b9),
      .ten_out(b15),
      .one_out(b16),
      .RST(w18),
      .CLK(w17),
      .Ce(w24));

shift_register_4bit
     s3 (
      .Din(b9),
      .one_out(b12),
      .ten_out(b13),
      .RST(w18),
      .CLK(w17),
      .Ce(w22));

shift_register_4bit
     s6 (
      .Din(b9),
      .ten_out(b17),
      .one_out(b18),
      .RST(w18),
      .CLK(w17),
      .Ce(w25));

enable_time
     #(
      .S0(3),
      .hour(0),
      .input_wait(4),
      .min(1),
      .sec(2))
     s4 (
      .sharp(w16),
      .completeSetting(w19),
      .en(w20),
      .reset(w18),
      .clock(w17),
      .hour_en(w28),
      .min_en(w27),
      .sec_en(w26));

Decimal_to_Binary_Converter
     s7 (
      .b(b9),
      .d(b19));

multiOR
     s8 (
      .in(b19_9to2_b22),
      .out(w23));

PNU_AND2
     s10 (
      .o1(w24),
      .i2(w28),
      .i1(w21));

PNU_AND2
     s11 (
      .o1(w22),
      .i2(w27),
      .i1(w21));

PNU_AND2
     s12 (
      .o1(w25),
      .i2(w26),
      .i1(w21));

PNU_OR3
     s9 (
      .o1(w21),
      .i1(w23),
      .i3(b19_1_w29),
      .i2(b19_0_w30));

endmodule

