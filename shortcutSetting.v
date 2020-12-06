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
wire  w6;
wire [23:0] b49;
wire  w14;
wire [23:0] b24;
wire  w24;
wire [3:0] b25;
wire [3:0] b27;
wire [3:0] b29;
wire [23:0] b33;
wire [23:0] b42;
wire  w36;
wire  w38;
wire  w39;
wire  w40;
wire  w41;
wire [23:0] b50;
wire [3:0] b52;
wire [3:0] b54;
wire [3:0] b53;
wire [3:0] b33_23to20_b35;
wire [3:0] b33_19to16_b37;
wire [3:0] b33_15to12_b38;
wire [3:0] b33_11to8_b39;
wire [3:0] b33_7to4_b40;
wire [3:0] b42_3to0;
wire [3:0] b42_7to4;
wire [3:0] b42_11to8;
wire [3:0] b42_15to12;
wire [3:0] b42_19to16;
wire [3:0] b42_23to20;
wire [3:0] b50_23to20;
wire [3:0] b50_19to16;
wire [3:0] b50_15to12;
wire [3:0] b50_11to8;
wire [3:0] b50_7to4;
wire [3:0] b50_3to0;
wire [3:0] b33_3to0_b51;

assign b3 = keypad;
assign w36 = clk;
assign w6 = en;
assign w24 = rst;
assign w4 = sharp;
assign completeSetting = w14;
assign hour_ten_out[3:0] = b49[23:20];
assign hour_one_out[3:0] = b49[19:16];
assign min_ten_out[3:0] = b49[15:12];
assign min_one_out[3:0] = b49[11:8];
assign sec_ten_out[3:0] = b49[7:4];
assign sec_one_out[3:0] = b49[3:0];

assign b24[23:20] = hour_ten_in[3:0];
assign b24[19:16] = hour_one_in[3:0];
assign b24[15:12] = min_ten_in[3:0];
assign b24[11:8] = min_one_in[3:0];
assign b24[7:4] = sec_ten_in[3:0];
assign b24[3:0] = sec_one_in[3:0];
assign b42[23:20] = b42_23to20[3:0];
assign b42[19:16] = b42_19to16[3:0];
assign b42[15:12] = b42_15to12[3:0];
assign b42[11:8] = b42_11to8[3:0];
assign b42[7:4] = b42_7to4[3:0];
assign b42[3:0] = b42_3to0[3:0];
assign b50[23:20] = b50_23to20[3:0];
assign b50[19:16] = b50_19to16[3:0];
assign b50[15:12] = b50_15to12[3:0];
assign b50[11:8] = b50_11to8[3:0];
assign b50[7:4] = b50_7to4[3:0];
assign b50[3:0] = b50_3to0[3:0];

assign b33_23to20_b35[3:0] = {b33[23:20]};
assign b33_19to16_b37[3:0] = {b33[19:16]};
assign b33_15to12_b38[3:0] = {b33[15:12]};
assign b33_11to8_b39[3:0] = {b33[11:8]};
assign b33_7to4_b40[3:0] = {b33[7:4]};
assign b33_3to0_b51[3:0] = {b33[3:0]};

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
      .en(w6),
      .completeSetting(w14),
      .reset(w24),
      .one_sec(b25),
      .ten_sec(b27),
      .one_min(b29),
      .clock(w36));

time_adder
     #(
      .S0(0),
      .S1(1),
      .S10(7),
      .S11(8),
      .S12(9),
      .S13(10),
      .S14(11),
      .S15(12),
      .S2(2),
      .S3(4),
      .S4(5),
      .S6(3),
      .S9(6))
     s6 (
      .reset(w24),
      .pSecond1(b25),
      .pSecond10(b27),
      .pMinute1(b29),
      .oHour10(b33_23to20_b35),
      .oHour1(b33_19to16_b37),
      .oMinute10(b33_15to12_b38),
      .oMinute1(b33_11to8_b39),
      .oSecond10(b33_7to4_b40),
      .Second1(b42_3to0),
      .clock(w36),
      .complete(w39),
      .recursive(w40),
      .Second10(b42_7to4),
      .Minute1(b42_11to8),
      .Minute10(b42_15to12),
      .Hour1(b42_19to16),
      .Hour10(b42_23to20),
      .oSecond1(b33_3to0_b51),
      .pHour10(b52),
      .pHour1(b54),
      .pMinute10(b53));

time_mux2
     s7 (
      .time1(b24),
      .selected(b33),
      .en(w40),
      .time2(b42));

PNU_AND2
     s5 (
      .i2(w38),
      .i1(w39),
      .o1(w41));

PNU_NOT
     s8 (
      .o1(w38),
      .i1(w40));

time_mux2
     s9 (
      .en(w41),
      .selected(b49),
      .time2(b42),
      .time1(b50));

allZero
     s10 (
      .zero_out(b50_23to20));

allZero
     s11 (
      .zero_out(b50_19to16));

allZero
     s12 (
      .zero_out(b50_15to12));

allZero
     s13 (
      .zero_out(b50_11to8));

allZero
     s14 (
      .zero_out(b50_7to4));

allZero
     s15 (
      .zero_out(b50_3to0));

allZero
     s4 (
      .zero_out(b53));

allZero
     s16 (
      .zero_out(b54));

allZero
     s17 (
      .zero_out(b52));

endmodule

