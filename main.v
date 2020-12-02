module main(reset, clock, switch, keypad, sharp, reset, init, enSetting, enSleep, enAlarm, enCancel, stop, completeSetting, completeSleep);
  input reset;
  input clock;
  input switch;
  input [9:0] keypad;
  input sharp;
  input reset;
  output init;
  output enSetting;
  output enSleep;
  output enAlarm;
  output enCancel;
  output stop;
  input completeSetting;
  input completeSleep;

  reg init;
  reg enSetting;
  reg enSleep;
  reg enAlarm;
  reg enCancel;
  reg stop;

  parameter [2:0] setting = 0, sleep = 1, alarm = 2, cancel = 3, start = 4;
  reg [2:0] current_state, next_state;

  always @(posedge clock or negedge reset)
  begin: SYNCH
    if (reset == 1'b0)
       current_state <= start;
    else
       current_state <= next_state;
  end

  always @(current_state or switch or keypad or sharp or reset or completeSetting or completeSleep)
  begin: COMBIN
     case (current_state)
        setting:
        begin
          if (completeSetting == 1'b1)
             begin
             next_state <= sleep;
             end
          else if (completeSetting == 1'b0)
             begin
             next_state <= setting;
             end
          enSetting <= 1'b1;

        end

        sleep:
        begin
          if (completeSleep == 1'b1)
             begin
             next_state <= alarm;
             end
          else if (sharp == 1'b1)
             begin
             next_state <= cancel;
             end
          else if (sharp == 1'b0)
             begin
             next_state <= sleep;
             end
          enSleep <= 1'b1;

        end

        alarm:
        begin
          if (sharp == 1'b1)
             begin
             next_state <= cancel;
             end
          else if (sharp == 1'b0)
             begin
             next_state <= alarm;
             end
          enAlarm <= 1'b1;

        end

        cancel:
        begin
             next_state <= start;
          enCancel <= 1'b1;

        end

        start:
        begin
             next_state <= setting;
          init <= 1'b1;

        end


        default:
          next_state <= start;
     endcase
  end

endmodule
