<<<<<<< HEAD
module manual_setting(keypad,hour_ten_out,hour_one_out,clk,rst,sharp,min_ten_out,min_one_out,sec_one_out,sec_ten_out,completeSetting,en);

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
wire [9:0] b14;
wire  w19;
wire  w17;
wire  w18;
wire  w20;

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
=======
module manual_setting(reset, clock, sharp, hour_en, min_en, sec_en, completeSetting);
  input reset;
  input clock;
  input sharp;
  output hour_en;
  output min_en;
  output sec_en;
  output completeSetting;

  reg hour_en;
  reg min_en;
  reg sec_en;
  reg completeSetting;

  parameter [1:0] hour = 0, minute = 1, second = 2, set_complete = 3;
  reg [1:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= hour;
    else
       current_state <= next_state;
  end
>>>>>>> dd39fb105bbddeb568bff323aafef41335e70aac

  always @(current_state or sharp)
  begin: COMBIN
     case (current_state)
        hour:
        begin
          if (sharp == 1'b0)
             begin
             next_state <= hour;
             end
          else if (sharp == 1'b1)
             begin
             next_state <= minute;
             end
          hour_en <= 1'b1;
          sec_en <= 1'b0;

<<<<<<< HEAD
shift_register_4bit
     s5 (
      .Din(b9),
      .ten_out(b15),
      .one_out(b16),
      .Ce(w13),
      .CLK(w17),
      .RST(w18));
=======
        end

        minute:
        begin
          if (sharp == 1'b1)
             begin
             next_state <= second;
             end
          else if (sharp == 1'b0)
             begin
             next_state <= minute;
             end
          min_en <= 1'b1;
          hour_en <= 1'b0;
>>>>>>> dd39fb105bbddeb568bff323aafef41335e70aac

        end

        second:
        begin
          if (sharp == 1'b0)
             begin
             next_state <= second;
             end
          else if (sharp == 1'b1)
             begin
             next_state <= set_complete;
             end
          sec_en <= 1'b1;
          min_en <= 1'b0;

<<<<<<< HEAD
enable_time
     #(
      .S0(3),
      .hour(0),
      .input_wait(4),
      .min(1),
      .sec(2))
     s4 (
      .hour_en(w13),
      .min_en(w14),
      .sec_en(w15),
      .sharp(w16),
      .completeSetting(w19),
      .clock(w17),
      .reset(w18),
      .en(w20));

endmodule
=======
        end

        set_complete:
        begin
          if (sharp == 1'b0)
             begin
             next_state <= hour;
             end
          completeSetting <= 1'b1;

        end
>>>>>>> dd39fb105bbddeb568bff323aafef41335e70aac


        default:
          next_state <= hour;
     endcase
  end

endmodule
