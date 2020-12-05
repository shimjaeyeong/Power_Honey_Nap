module select_keypad(reset, clock, en, sharp, keypad, one_sec, ten_sec, one_min, completeSetting);
  input reset;
  input clock;
  input en;
  input sharp;
  input [9:0] keypad;
  output [3:0] one_sec;
  output [3:0] ten_sec;
  output [3:0] one_min;
  output completeSetting;

  reg [3:0] one_sec;
  reg [3:0] ten_sec;
  reg [3:0] one_min;
  reg completeSetting;

  parameter [2:0] fiveSecond = 0, halfMinute = 1, oneMinute = 2, input_wait = 3, set_complete = 4;
  reg [2:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= input_wait;
    else
       current_state <= next_state;
  end

  always @(current_state or en or sharp or keypad)
  begin: COMBIN
     case (current_state)
        fiveSecond:
        begin
             next_state <= input_wait;
          one_sec <= 4'b0101;

        end

        halfMinute:
        begin
             next_state <= input_wait;
          ten_sec <= 4'b0011;

        end

        oneMinute:
        begin
             next_state <= input_wait;
          one_min <= 4'b0001;

        end

        input_wait:
        begin
          if (keypad == 10'b0000000010 && en == 1'b1)
             begin
             next_state <= fiveSecond;
             end
          else if (keypad == 10'b0000000100 && en == 1'b1)
             begin
             next_state <= halfMinute;
             end
          else if (keypad == 10'b0000001000 && en == 1'b1)
             begin
             next_state <= oneMinute;
             end
          else if (sharp == 1'b1 && en == 1'b1)
             begin
             next_state <= set_complete;
             end
          else if (en == 1'b0)
             begin
             next_state <= input_wait;
             end
          else
             begin
             next_state <= input_wait;
             end
          completeSetting <= 1'b0;
          one_sec <= 4'b0000;
          ten_sec <= 4'b0000;
          one_min <= 4'b0000;

        end

        set_complete:
        begin
             next_state <= input_wait;
          completeSetting <= 1'b1;

        end


        default:
          next_state <= input_wait;
     endcase
  end

endmodule
