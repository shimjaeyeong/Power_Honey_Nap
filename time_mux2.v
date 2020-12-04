module time_mux2(time1,selected,time2,en);

input [23:0] time1;
output [23:0] selected;
input [23:0] time2;
input en;

wire [23:0] b0;
wire [23:0] b1;
wire  w2;
wire [23:0] b5;
wire [3:0] b0_3to0_b3;
wire [3:0] b1_3to0_b4;
wire [3:0] b5_7to4;
wire [3:0] b5_11to8;
wire [3:0] b5_15to12;
wire [3:0] b5_19to16;
wire [3:0] b5_23to20;
wire [3:0] b1_7to4_b12;
wire [3:0] b0_7to4_b13;
wire [3:0] b0_11to8_b14;
wire [3:0] b1_11to8_b15;
wire [3:0] b0_15to12_b16;
wire [3:0] b1_15to12_b17;
wire [3:0] b1_19to16_b18;
wire [3:0] b0_19to16_b19;
wire [3:0] b1_23to20_b20;
wire [3:0] b0_23to20_b21;
wire [3:0] b5_3to0;

assign b0 = time1;
assign selected = b5;
assign b1 = time2;
assign w2 = en;

assign b5[23:20] = b5_23to20[3:0];
assign b5[19:16] = b5_19to16[3:0];
assign b5[15:12] = b5_15to12[3:0];
assign b5[11:8] = b5_11to8[3:0];
assign b5[7:4] = b5_7to4[3:0];
assign b5[3:0] = b5_3to0[3:0];

assign b0_3to0_b3[3:0] = {b0[3:0]};
assign b1_3to0_b4[3:0] = {b1[3:0]};
assign b1_7to4_b12[3:0] = {b1[7:4]};
assign b0_7to4_b13[3:0] = {b0[7:4]};
assign b0_11to8_b14[3:0] = {b0[11:8]};
assign b1_11to8_b15[3:0] = {b1[11:8]};
assign b0_15to12_b16[3:0] = {b0[15:12]};
assign b1_15to12_b17[3:0] = {b1[15:12]};
assign b1_19to16_b18[3:0] = {b1[19:16]};
assign b0_19to16_b19[3:0] = {b0[19:16]};
assign b1_23to20_b20[3:0] = {b1[23:20]};
assign b0_23to20_b21[3:0] = {b0[23:20]};

multi_mux4
     s0 (
      .en(w2),
      .a(b0_3to0_b3),
      .b(b1_3to0_b4),
      .out(b5_3to0));

multi_mux4
     s1 (
      .en(w2),
      .out(b5_7to4),
      .b(b1_7to4_b12),
      .a(b0_7to4_b13));

multi_mux4
     s2 (
      .en(w2),
      .out(b5_11to8),
      .a(b0_11to8_b14),
      .b(b1_11to8_b15));

multi_mux4
     s3 (
      .en(w2),
      .out(b5_15to12),
      .a(b0_15to12_b16),
      .b(b1_15to12_b17));

multi_mux4
     s5 (
      .en(w2),
      .out(b5_19to16),
      .b(b1_19to16_b18),
      .a(b0_19to16_b19));

multi_mux4
     s6 (
      .en(w2),
      .out(b5_23to20),
      .b(b1_23to20_b20),
      .a(b0_23to20_b21));

endmodule

