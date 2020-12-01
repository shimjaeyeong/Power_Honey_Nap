module manual_setting(keypad,hour_ten_out,hour_one_out,clk,rst,sharp,min_ten_out,min_one_out,sec_one_out,sec_ten_out);

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

wire  w9;
wire [3:0] b9;
wire  w11;
wire [9:0] b14;
wire  w13;
wire  w14;
wire  w15;
wire [3:0] b15;
wire [3:0] b16;
wire [3:0] b17;
wire [3:0] b18;
wire [3:0] b12;
wire [3:0] b13;
wire  w16;

assign b14 = keypad;
assign hour_ten_out = b15;
assign hour_one_out = b16;
assign w11 = clk;
assign w9 = rst;
assign w16 = sharp;
assign min_ten_out = b13;
assign min_one_out = b12;
assign sec_one_out = b18;
assign sec_ten_out = b17;

decimal_to_binary
     s0 (
      .b(b9),
      .d(b14));

enable_time
     #(
      .S0(0),
      .S1(1),
      .S2(2))
     s4 (
      .reset(w9),
      .clock(w11),
      .hour_en(w13),
      .min_en(w14),
      .sec_en(w15),
      .sharp(w16));

shift_register_4bit
     s5 (
      .RST(w9),
      .Din(b9),
      .CLK(w11),
      .Ce(w13),
      .ten_out(b15),
      .one_out(b16));

shift_register_4bit
     s3 (
      .RST(w9),
      .Din(b9),
      .CLK(w11),
      .Ce(w14),
      .one_out(b12),
      .ten_out(b13));

shift_register_4bit
     s6 (
      .RST(w9),
      .Din(b9),
      .CLK(w11),
      .Ce(w15),
      .ten_out(b17),
      .one_out(b18));

endmodule

