module time_register(clock,start,reset,write,setHour10,setMinute10,setMinute1,setSecond10,setSecond1,getHour10,getHour1,getMinute10,getMinute1,getSecond10,getSecond1,setHour1,complete);

input clock;
input start;
input reset;
input write;
input [3:0] setHour10;
input [3:0] setMinute10;
input [3:0] setMinute1;
input [3:0] setSecond10;
input [3:0] setSecond1;
output [3:0] getHour10;
output [3:0] getHour1;
output [3:0] getMinute10;
output [3:0] getMinute1;
output [3:0] getSecond10;
output [3:0] getSecond1;
input [3:0] setHour1;
output complete;

wire [3:0] b8;
wire [3:0] b9;
wire [3:0] b10;
wire [3:0] b11;
wire [3:0] b25;
wire  w30;
wire  w26;
wire [3:0] b22;
wire [3:0] b23;
wire  w18;
wire  w19;
wire  w20;
wire [3:0] b24;
wire [3:0] b26;
wire [3:0] b28;
wire [3:0] b30;
wire [3:0] b27;
wire [3:0] b31;
wire [3:0] b33;
wire [3:0] b32;
wire [3:0] b34;
wire [3:0] b35;
wire  w31;
wire [3:0] b37;
wire  w32;
wire [3:0] b36;
wire [3:0] b38;
wire [3:0] b39;
wire [3:0] b40;
wire [3:0] b41;
wire [3:0] b42;
wire  w33;

assign w19 = clock;
assign w30 = start;
assign w18 = reset;
assign w26 = write;
assign b25 = setHour10;
assign b30 = setMinute10;
assign b33 = setMinute1;
assign b34 = setSecond10;
assign b37 = setSecond1;
assign getHour10 = b23;
assign getHour1 = b22;
assign getMinute10 = b39;
assign getMinute1 = b40;
assign getSecond10 = b41;
assign getSecond1 = b42;
assign b28 = setHour1;
assign complete = w32;

PNU_CLK_DIV
     #(
      .cnt_num(500000))
     s0 (
      .en(w30),
      .rst(w18),
      .clk(w19),
      .div_clk(w20));

register_4bit
     s3 (
      .Dout(b23),
      .RST(w18),
      .CLK(w19),
      .Din(b24),
      .Ce(w33));

register_4bit
     s4 (
      .Din(b8),
      .Dout(b22),
      .RST(w18),
      .CLK(w19),
      .Ce(w33));

register_4bit
     s5 (
      .Din(b9),
      .RST(w18),
      .CLK(w19),
      .Dout(b39),
      .Ce(w33));

register_4bit
     s6 (
      .Din(b10),
      .RST(w18),
      .CLK(w19),
      .Dout(b40),
      .Ce(w33));

register_4bit
     s7 (
      .Din(b11),
      .RST(w18),
      .CLK(w19),
      .Dout(b41),
      .Ce(w33));

register_4bit
     s8 (
      .RST(w18),
      .CLK(w19),
      .Din(b38),
      .Dout(b42),
      .Ce(w33));

multi_mux4
     s15 (
      .a(b25),
      .out(b24),
      .b(b26),
      .en(w31));

multi_mux4
     s17 (
      .en(w31),
      .a(b37),
      .b(b36),
      .out(b38));

timer
     #(
      .S3(12),
      .check(0),
      .cpl1(2),
      .cpl2(4),
      .cpl3(5),
      .cpl4(7),
      .cpl5(8),
      .cpl6(11),
      .hour1(9),
      .hour2(10),
      .minute1(3),
      .minute2(6),
      .second(1))
     s10 (
      .setHour1(b22),
      .setHour10(b23),
      .reset(w18),
      .clock(w19),
      .start(w20),
      .getHour10(b26),
      .getHour1(b27),
      .getMinute10(b31),
      .getMinute1(b32),
      .getSecond10(b35),
      .complete(w31),
      .isZero(w32),
      .getSecond1(b36),
      .setMinute10(b39),
      .setMinute1(b40),
      .setSecond10(b41),
      .setSecond1(b42));

multi_mux4
     s11 (
      .out(b8),
      .a(b28),
      .b(b27),
      .en(w31));

multi_mux4
     s12 (
      .out(b9),
      .a(b30),
      .b(b31),
      .en(w31));

multi_mux4
     s13 (
      .out(b10),
      .a(b33),
      .b(b32),
      .en(w31));

multi_mux4
     s14 (
      .out(b11),
      .a(b34),
      .b(b35),
      .en(w31));

PNU_OR2
     s16 (
      .i1(w26),
      .i2(w31),
      .o1(w33));

endmodule

