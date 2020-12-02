module manual_setting(keypad,hour_ten_out,hour_one_out,clk,rst,sharp,min_ten_out,min_one_out,sec_one_out,sec_ten_out,completeSetting);

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

wire [3:0] b9;
wire [3:0] b15;
wire [3:0] b16;
wire [3:0] b17;
wire [3:0] b18;
wire [3:0] b12;
wire [3:0] b13;
wire  w13;
wire  w14;
wire  w15;
wire  w16;
wire  w17;
wire [9:0] b14;
wire  w18;
wire  w19;

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

decimal_to_binary
     s0 (
      .b(b9),
      .d(b14));

enable_time
     #(
      .hour(0),
      .minute(1),
      .second(2),
      .set_complete(3))
     s4 (
      .hour_en(w13),
      .min_en(w14),
      .sec_en(w15),
      .sharp(w16),
      .clock(w17),
      .reset(w18),
      .completeSetting(w19));

shift_register_4bit
     s5 (
      .Din(b9),
      .ten_out(b15),
      .one_out(b16),
      .Ce(w13),
      .CLK(w17),
      .RST(w18));

shift_register_4bit
     s3 (
      .Din(b9),
      .one_out(b12),
      .ten_out(b13),
      .Ce(w14),
      .CLK(w17),
      .RST(w18));

shift_register_4bit
     s6 (
      .Din(b9),
      .ten_out(b17),
      .one_out(b18),
      .Ce(w15),
      .CLK(w17),
      .RST(w18));

endmodule

