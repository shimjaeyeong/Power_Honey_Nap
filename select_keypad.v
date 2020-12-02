module select_keypad(reset, clock, sharp, keypad, timer_en, one_sec, ten_sec, one_min, waiting);
  input reset;
  input clock;
  input sharp;
  input [9:0] keypad;
  output timer_en;
  output [3:0] one_sec;
  output [3:0] ten_sec;
  output [3:0] one_min;
  input waiting;

  reg timer_en;
  reg [3:0] one_sec;
  reg [3:0] ten_sec;
  reg [3:0] one_min;

  parameter [2:0] 5sec = 0, 30sec = 1, 1min = 2, wait = 3, set_complete = 4;
  reg [2:0] current_state, next_state;

  always @(posedge clock or negedge reset)
  begin: SYNCH
    if (reset == 1'b0)
       current_state <= wait;
    else
       current_state <= next_state;
  end

  always @(current_state or sharp or keypad or waiting)
  begin: COMBIN
     case (current_state)
        5sec:
        begin
             next_state <= wait;
          one_sec <= 4'b0101;

        end

        30sec:
        begin
             next_state <= wait;
          ten_sec <= 4'b0011;

        end

        1min:
        begin
             next_state <= wait;
          one_min <= 4'b0001;

        end

        wait:
        begin
          if (keypad == 10'b0000000010)
             begin
             next_state <= 5sec;
             end
          else if (keypad == 10'b0000000100)
             begin
             next_state <= 30sec;
             end
          else if (keypad == 10'b0000001000)
             begin
             next_state <= 1min;
             end
          else if (sharp == 1'b1)
             begin
             next_state <= set_complete;
             end
          else if (sharp != 1'b1)
             begin
             next_state <= wait;
             end
          waiting <= 1'b1;
          timer_en <= 1'b0;

        end

        set_complete:
        begin
          if (sharp == 1'b0)
             begin
             next_state <= wait;
             end
          timer_en <= 1'b1;
          sharp <= 1'b0;

        end


        default:
          next_state <= wait;
     endcase
  end

endmodule
