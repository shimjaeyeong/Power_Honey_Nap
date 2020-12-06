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

wire [23:0] b49;
wire [23:0] b24;
wire [23:0] b75;
wire [23:0] b42;
wire  w38;
wire  w39;
wire  w41;
wire [23:0] b72;
wire  w53;
wire  w54;
wire  w55;
wire  w57;
wire  w58;
wire [9:0] b64;
wire  w61;
wire  w62;
wire  w59;
wire [23:0] b65;
wire  w64;
wire  w63;
wire  w60;
wire [23:0] b73;
wire [3:0] b75_23to20_b35;
wire [3:0] b75_19to16_b37;
wire [3:0] b75_15to12_b38;
wire [3:0] b75_11to8_b39;
wire [3:0] b75_7to4_b40;
wire [3:0] b42_3to0;
wire [3:0] b42_7to4;
wire [3:0] b42_11to8;
wire [3:0] b42_15to12;
wire [3:0] b42_19to16;
wire [3:0] b42_23to20;
wire [3:0] b72_23to20;
wire [3:0] b72_19to16;
wire [3:0] b72_15to12;
wire [3:0] b72_11to8;
wire [3:0] b72_7to4;
wire [3:0] b72_3to0;
wire [3:0] b75_3to0_b51;
wire [3:0] b65_23to20;
wire [3:0] b65_19to16;
wire [3:0] b65_15to12;
wire [3:0] b65_3to0;
wire [3:0] b65_7to4;
wire [3:0] b65_11to8;
wire [3:0] b73_11to8_b74;
wire [3:0] b73_7to4_b62;
wire [3:0] b73_3to0_b63;
wire [3:0] b73_23to20_b76;
wire [3:0] b73_19to16_b77;
wire [3:0] b73_15to12_b78;

assign b64 = keypad;
assign w60 = clk;
assign w61 = en;
assign w59 = rst;
assign w62 = sharp;
assign completeSetting = w63;
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
assign b72[23:20] = b72_23to20[3:0];
assign b72[19:16] = b72_19to16[3:0];
assign b72[15:12] = b72_15to12[3:0];
assign b72[11:8] = b72_11to8[3:0];
assign b72[7:4] = b72_7to4[3:0];
assign b72[3:0] = b72_3to0[3:0];
assign b65[23:20] = b65_23to20[3:0];
assign b65[19:16] = b65_19to16[3:0];
assign b65[15:12] = b65_15to12[3:0];
assign b65[11:8] = b65_11to8[3:0];
assign b65[7:4] = b65_7to4[3:0];
assign b65[3:0] = b65_3to0[3:0];

assign b75_23to20_b35[3:0] = {b75[23:20]};
assign b75_19to16_b37[3:0] = {b75[19:16]};
assign b75_15to12_b38[3:0] = {b75[15:12]};
assign b75_11to8_b39[3:0] = {b75[11:8]};
assign b75_7to4_b40[3:0] = {b75[7:4]};
assign b75_3to0_b51[3:0] = {b75[3:0]};
assign b73_11to8_b74[3:0] = {b73[11:8]};
assign b73_7to4_b62[3:0] = {b73[7:4]};
assign b73_3to0_b63[3:0] = {b73[3:0]};
assign b73_23to20_b76[3:0] = {b73[23:20]};
assign b73_19to16_b77[3:0] = {b73[19:16]};
assign b73_15to12_b78[3:0] = {b73[15:12]};

time_mux2
     s7 (
      .time1(b24),
      .time2(b42),
      .en(w64),
      .selected(b75));

PNU_AND2
     s5 (
      .i2(w38),
      .i1(w39),
      .o1(w41));

PNU_NOT
     s8 (
      .o1(w38),
      .i1(w64));

time_mux2
     s9 (
      .en(w41),
      .selected(b49),
      .time2(b42),
      .time1(b72));

allZero
     s10 (
      .zero_out(b72_23to20));

allZero
     s11 (
      .zero_out(b72_19to16));

allZero
     s12 (
      .zero_out(b72_15to12));

allZero
     s13 (
      .zero_out(b72_11to8));

allZero
     s14 (
      .zero_out(b72_7to4));

allZero
     s15 (
      .zero_out(b72_3to0));

allZero
     s4 (
      .zero_out(b65_15to12));

allZero
     s16 (
      .zero_out(b65_19to16));

allZero
     s17 (
      .zero_out(b65_23to20));

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
      .S5(13),
      .S6(3),
      .S9(6))
     s18 (
      .oHour10(b75_23to20_b35),
      .oHour1(b75_19to16_b37),
      .oMinute10(b75_15to12_b38),
      .oMinute1(b75_11to8_b39),
      .oSecond10(b75_7to4_b40),
      .Second1(b42_3to0),
      .complete(w39),
      .Second10(b42_7to4),
      .Minute1(b42_11to8),
      .Minute10(b42_15to12),
      .Hour1(b42_19to16),
      .Hour10(b42_23to20),
      .oSecond1(b75_3to0_b51),
      .en(w58),
      .reset(w59),
      .recursive(w64),
      .clock(w60),
      .pMinute1(b73_11to8_b74),
      .pSecond10(b73_7to4_b62),
      .pSecond1(b73_3to0_b63),
      .pHour10(b73_23to20_b76),
      .pHour1(b73_19to16_b77),
      .pMinute10(b73_15to12_b78));

multiOR4
     s19 (
      .out(w53),
      .in(b73_11to8_b74));

multiOR4
     s20 (
      .out(w54),
      .in(b73_7to4_b62));

multiOR4
     s21 (
      .out(w55),
      .in(b73_3to0_b63));

PNU_OR3
     s22 (
      .i1(w53),
      .i2(w54),
      .i3(w55),
      .o1(w57));

PNU_OR2
     s23 (
      .i2(w57),
      .o1(w58),
      .i1(w64));

select_keypad
     #(
      .fiveSecond(0),
      .halfMinute(1),
      .input_wait(3),
      .oneMinute(2),
      .set_complete(4))
     s24 (
      .keypad(b64),
      .en(w61),
      .sharp(w62),
      .reset(w59),
      .one_sec(b65_3to0),
      .ten_sec(b65_7to4),
      .one_min(b65_11to8),
      .completeSetting(w63),
      .clock(w60));

time_mux2
     s25 (
      .time1(b65),
      .en(w64),
      .time2(b72),
      .selected(b73));

endmodule

