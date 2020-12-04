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
wire [9:0] b14;
wire  w19;
wire  w17;
wire  w18;
wire  w20;
wire  w21;
wire  w22;
wire  w15;

assign b14 = keypad;
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
assign h = w21;
assign m = w22;
assign s = w15;

decimal_to_binary
     s0 (
      .b(b9),
      .d(b14));

shift_register_4bit
     s5 (
      .Din(b9),
      .ten_out(b15),
      .one_out(b16),
      .CLK(w17),
      .RST(w18),
      .Ce(w21));

shift_register_4bit
     s3 (
      .Din(b9),
      .one_out(b12),
      .ten_out(b13),
      .CLK(w17),
      .RST(w18),
      .Ce(w22));

shift_register_4bit
     s6 (
      .Din(b9),
      .ten_out(b17),
      .one_out(b18),
      .CLK(w17),
      .RST(w18),
      .Ce(w15));

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
      .clock(w17),
      .reset(w18),
      .en(w20),
      .hour_en(w21),
      .min_en(w22),
      .sec_en(w15));

endmodule

