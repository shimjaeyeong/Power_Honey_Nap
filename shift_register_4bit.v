module shift_register_4bit(CLK,RST,Din,ten_out,Ce,one_out);

input CLK;
input RST;
input [3:0] Din;
output [3:0] ten_out;
input Ce;
output [3:0] one_out;

wire  w0;
wire  w1;
wire [3:0] b3;
wire [3:0] b4;
wire  w5;
wire [3:0] b5;

assign w0 = CLK;
assign w1 = RST;
assign b3 = Din;
assign ten_out = b4;
assign w5 = Ce;
assign one_out = b5;

register_4bit
     s0 (
      .CLK(w0),
      .RST(w1),
      .Din(b3),
      .Ce(w5),
      .Dout(b5));

register_4bit
     s1 (
      .CLK(w0),
      .RST(w1),
      .Dout(b4),
      .Ce(w5),
      .Din(b5));

endmodule

