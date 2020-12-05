module LTP_tb;

reg Level;
wire Pulse;
reg clk;
reg rst;

LTP
 U0 (
  .Level(Level),
  .Pulse(Pulse),
  .clk(clk),
  .rst(rst));

  initial
  begin
    Level = 1'b0;
    #200 Level = 1'b1;
    #300 Level = 1'b0;
    #300 Level = 1'b1;
    #300 Level = 1'b0;
    #100 Level = 1'b1;
    #100 Level = 1'b0;
    #200 Level = 1'b1;
    #800 Level = 1'b0;
    #200 Level = 1'b1;
    #200 Level = 1'b0;
    #800 Level = 1'b1;
    #200 Level = 1'b0;
  end

  initial
    clk = 1'b1;

  always
  begin : Genclk
    #50 clk = 1'b0;
    #50 clk = 1'b1;
  end

  initial
  begin
    rst = 1'b1;
    #100 rst = 1'b0;
  end

endmodule
