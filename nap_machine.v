module nap_machine(clock,reset,keypad,sharp,dip_switch,com,seg,modeSetAuto,modeSetManual,modeSleep,modeAlarm,modeCancel,modeInit,piezo,seg_dot,light,led_R,led_G,led_B,led8);

input clock;
input reset;
input [9:0] keypad;
input sharp;
input dip_switch;
output [7:0] com;
output [6:0] seg;
output modeSetAuto;
output modeSetManual;
output modeSleep;
output modeAlarm;
output modeCancel;
output modeInit;
output piezo;
output seg_dot;
output light;
output [3:0] led_R;
output [3:0] led_G;
output [3:0] led_B;
output led8;

wire [6:0] b18;
wire [6:0] b19;
wire [6:0] b20;
wire [6:0] b21;
wire [6:0] b22;
wire [6:0] b23;
wire [12:0] b40;
wire  w43;
wire  w44;
wire  w45;
wire  w19;
wire  w39;
wire  w41;
wire  w42;
wire [3:0] b47;
wire [3:0] b48;
wire [3:0] b49;
wire [3:0] b51;
wire [3:0] b50;
wire [3:0] b52;
wire [23:0] b69;
wire [23:0] b68;
wire [23:0] b73;
wire  w61;
wire  w63;
wire  w64;
wire  w65;
wire [7:0] b75;
wire [6:0] b76;
wire  w72;
wire  w66;
wire  w67;
wire  w68;
wire [3:0] b77;
wire [3:0] b78;
wire [3:0] b79;
wire  w76;
wire [12:0] b80;
wire [9:0] b81;
wire  w81;
wire  w40;
wire  w85;
wire  w83;
wire  w77;
wire  w79;
wire  w86;
wire  w82;
wire  w88;
wire  w89;
wire  w90;
wire  w80;
wire  w91;
wire  w75;
wire [9:0] b82;
wire  w87;
wire  w92;
wire  w78;
wire  w84;
wire [3:0] b69_3to0;
wire [3:0] b69_15to12;
wire [3:0] b69_11to8;
wire [3:0] b69_7to4;
wire [3:0] b68_23to20;
wire [3:0] b68_19to16;
wire [3:0] b68_15to12;
wire [3:0] b68_11to8;
wire [3:0] b68_7to4;
wire [3:0] b68_3to0;
wire [3:0] b69_19to16;
wire [3:0] b69_23to20;
wire [3:0] b73_7to4_b71;
wire [3:0] b73_3to0_b70;
wire [3:0] b73_11to8_b72;
wire [3:0] b73_15to12_b60;
wire [3:0] b73_19to16_b58;
wire [3:0] b73_23to20_b56;

assign w87 = clock;
assign w84 = reset;
assign b81 = keypad;
assign w89 = sharp;
assign w19 = dip_switch;
assign com = b75;
assign seg = b76;
assign modeSetAuto = w80;
assign modeSetManual = w82;
assign modeSleep = w78;
assign modeAlarm = w92;
assign modeCancel = w75;
assign modeInit = w85;
assign piezo = w45;
assign seg_dot = w72;
assign light = w76;
assign led_R = b77;
assign led_G = b78;
assign led_B = b79;
assign led8 = w91;

assign b69[23:20] = b69_23to20[3:0];
assign b69[19:16] = b69_19to16[3:0];
assign b69[15:12] = b69_15to12[3:0];
assign b69[11:8] = b69_11to8[3:0];
assign b69[7:4] = b69_7to4[3:0];
assign b69[3:0] = b69_3to0[3:0];
assign b68[23:20] = b68_23to20[3:0];
assign b68[19:16] = b68_19to16[3:0];
assign b68[15:12] = b68_15to12[3:0];
assign b68[11:8] = b68_11to8[3:0];
assign b68[7:4] = b68_7to4[3:0];
assign b68[3:0] = b68_3to0[3:0];

assign b73_7to4_b71[3:0] = {b73[7:4]};
assign b73_3to0_b70[3:0] = {b73[3:0]};
assign b73_11to8_b72[3:0] = {b73[11:8]};
assign b73_15to12_b60[3:0] = {b73[15:12]};
assign b73_19to16_b58[3:0] = {b73[19:16]};
assign b73_23to20_b56[3:0] = {b73[23:20]};

time_register
     s4 (
      .getHour10(b47),
      .getHour1(b48),
      .getMinute10(b49),
      .getMinute1(b51),
      .getSecond10(b50),
      .getSecond1(b52),
      .setSecond10(b73_7to4_b71),
      .setSecond1(b73_3to0_b70),
      .setMinute1(b73_11to8_b72),
      .setMinute10(b73_15to12_b60),
      .setHour1(b73_19to16_b58),
      .setHour10(b73_23to20_b56),
      .complete(w40),
      .reset(w83),
      .write(w91),
      .clock(w87),
      .start(w78));

printSegment
     s2 (
      .seg(b18),
      .bNum(b47));

printSegment
     s3 (
      .seg(b19),
      .bNum(b48));

printSegment
     s5 (
      .seg(b20),
      .bNum(b49));

printSegment
     s6 (
      .seg(b21),
      .bNum(b51));

printSegment
     s7 (
      .seg(b22),
      .bNum(b50));

printSegment
     s8 (
      .seg(b23),
      .bNum(b52));

lullaby
     #(
      .S1(1),
      .S10(10),
      .S100(100),
      .S101(101),
      .S102(102),
      .S103(103),
      .S104(110),
      .S105(111),
      .S106(112),
      .S107(113),
      .S108(114),
      .S109(115),
      .S11(11),
      .S110(116),
      .S111(117),
      .S112(118),
      .S113(119),
      .S114(120),
      .S115(121),
      .S116(122),
      .S117(104),
      .S118(105),
      .S119(106),
      .S12(12),
      .S120(107),
      .S121(108),
      .S122(109),
      .S13(13),
      .S14(14),
      .S15(15),
      .S16(16),
      .S17(17),
      .S18(18),
      .S19(19),
      .S2(2),
      .S20(20),
      .S21(21),
      .S22(22),
      .S23(23),
      .S24(24),
      .S25(25),
      .S26(26),
      .S27(27),
      .S28(28),
      .S29(29),
      .S3(3),
      .S30(30),
      .S31(31),
      .S32(32),
      .S33(33),
      .S34(34),
      .S35(35),
      .S36(36),
      .S37(37),
      .S38(38),
      .S39(39),
      .S4(4),
      .S40(40),
      .S41(41),
      .S42(42),
      .S43(43),
      .S44(44),
      .S45(45),
      .S46(46),
      .S47(47),
      .S48(48),
      .S49(49),
      .S5(5),
      .S50(50),
      .S51(51),
      .S52(52),
      .S53(53),
      .S54(54),
      .S55(55),
      .S56(56),
      .S57(57),
      .S58(58),
      .S59(59),
      .S6(6),
      .S60(60),
      .S61(61),
      .S62(62),
      .S63(63),
      .S64(64),
      .S65(65),
      .S66(66),
      .S67(67),
      .S68(68),
      .S69(69),
      .S7(7),
      .S70(70),
      .S71(71),
      .S72(72),
      .S73(73),
      .S74(74),
      .S75(75),
      .S76(76),
      .S77(77),
      .S78(78),
      .S79(79),
      .S8(8),
      .S80(80),
      .S81(81),
      .S82(82),
      .S83(83),
      .S84(84),
      .S85(85),
      .S86(86),
      .S87(87),
      .S88(88),
      .S89(89),
      .S9(9),
      .S90(90),
      .S91(91),
      .S92(92),
      .S93(93),
      .S94(94),
      .S95(95),
      .S96(96),
      .S97(97),
      .S98(98),
      .S99(99),
      .musicOff(0))
     s13 (
      .beat(b40),
      .clock(w81),
      .stop(w77),
      .start(w78),
      .reset(w84));

piezo
     s15 (
      .playSound(b40),
      .piezo(w43),
      .clk(w87),
      .rst(w84));

piezo
     s16 (
      .piezo(w44),
      .playSound(b80),
      .clk(w87),
      .rst(w84));

alarm
     #(
      .S0(0),
      .S1(1),
      .S10(10),
      .S11(11),
      .S12(13),
      .S2(2),
      .S3(3),
      .S4(4),
      .S6(6),
      .S7(7),
      .S8(8),
      .S9(9),
      .st(12))
     s17 (
      .light(w76),
      .beat(b80),
      .clock(w81),
      .stop(w79),
      .start(w92),
      .reset(w84));

PNU_OR2
     s18 (
      .i1(w43),
      .i2(w44),
      .o1(w45));

main_state
     #(
      .alarm(2),
      .autoSetting(0),
      .cancel(3),
      .manualSetting(5),
      .sleep(1),
      .start(4))
     s0 (
      .switch(w19),
      .completeSetting(w39),
      .completeSleep(w40),
      .init(w85),
      .enManualSetting(w82),
      .sharp(w88),
      .enAutoSetting(w80),
      .enCancel(w75),
      .clock(w87),
      .enAlarm(w92),
      .enSleep(w78),
      .reset(w84));

shortcutSetting
     s19 (
      .completeSetting(w41),
      .hour_ten_in(b47),
      .hour_one_in(b48),
      .min_ten_in(b49),
      .min_one_in(b51),
      .sec_ten_in(b50),
      .sec_one_in(b52),
      .hour_ten_out(b68_23to20),
      .hour_one_out(b68_19to16),
      .min_ten_out(b68_15to12),
      .min_one_out(b68_11to8),
      .sec_ten_out(b68_7to4),
      .sec_one_out(b68_3to0),
      .sharp(w88),
      .en(w80),
      .keypad(b82),
      .clk(w87),
      .rst(w84));

PNU_OR2
     s21 (
      .o1(w39),
      .i1(w41),
      .i2(w42));

time_mux2
     s22 (
      .time1(b68),
      .time2(b69),
      .selected(b73),
      .en(w82));

time_check
     s20 (
      .in(b73),
      .out(w91));

manual_setting
     s24 (
      .completeSetting(w42),
      .sec_one_out(b69_3to0),
      .min_ten_out(b69_15to12),
      .min_one_out(b69_11to8),
      .sec_ten_out(b69_7to4),
      .hour_one_out(b69_19to16),
      .hour_ten_out(b69_23to20),
      .h(w63),
      .m(w64),
      .s(w65),
      .en(w82),
      .sharp(w88),
      .rst(w90),
      .keypad(b82),
      .clk(w87));

PNU_CLK_DIV
     #(
      .cnt_num(500000))
     s23 (
      .en(w61),
      .div_clk(w81),
      .clk(w87),
      .rst(w84));

PNU_ONE
     s25 (
      .o1(w61));

PNU_AND2
     s26 (
      .i2(w63),
      .o1(w66),
      .i1(w81));

PNU_AND2
     s27 (
      .i2(w64),
      .o1(w67),
      .i1(w81));

PNU_AND2
     s28 (
      .i1(w65),
      .o1(w68),
      .i2(w81));

rotateSegment7
     #(
      .S0(6),
      .S1(7),
      .S2(8),
      .S3(0),
      .S4(1),
      .S5(2),
      .S6(3),
      .S7(4),
      .S8(5))
     s30 (
      .data1(b18),
      .data2(b19),
      .data3(b20),
      .data4(b21),
      .data5(b22),
      .data6(b23),
      .com(b75),
      .seg(b76),
      .dot(w72),
      .h(w66),
      .m(w67),
      .s(w68),
      .clock(w87),
      .reset(w84));

crazy_light
     #(
      .S0(0),
      .S1(1),
      .S2(2),
      .S3(3),
      .S4(4),
      .S5(5),
      .S6(6))
     s29 (
      .r(b77),
      .g(b78),
      .b(b79),
      .clock(w81),
      .stop(w86),
      .start(w92),
      .reset(w84));

keypadL2P
     s33 (
      .input_key(b81),
      .keypad(b82),
      .clk(w87),
      .rst(w84));

PNU_OR4
     s31 (
      .o1(w77),
      .i2(w82),
      .i1(w80),
      .i4(w75),
      .i3(w92));

PNU_OR4
     s32 (
      .o1(w79),
      .i2(w82),
      .i1(w80),
      .i4(w75),
      .i3(w78));

PNU_OR4
     s34 (
      .o1(w86),
      .i2(w82),
      .i1(w80),
      .i4(w75),
      .i3(w78));

LTP
     s35 (
      .Pulse(w88),
      .Level(w89),
      .clk(w87),
      .rst(w84));

PNU_OR3
     s36 (
      .o1(w90),
      .i1(w80),
      .i2(w78),
      .i3(w84));

PNU_OR4
     s37 (
      .i3(w85),
      .o1(w83),
      .i1(w75),
      .i4(w92),
      .i2(w84));

endmodule

