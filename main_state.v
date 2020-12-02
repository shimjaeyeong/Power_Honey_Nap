module main_state(reset, clock, switch, completeSetting, completeSleep, sharp, init, enAutoSetting, enManualSetting, enSleep, enAlarm, enCancel);
  input reset;
  input clock;
  input switch;
  input completeSetting;
  input completeSleep;
  input sharp;
  output init;
  output enAutoSetting;
  output enManualSetting;
  output enSleep;
  output enAlarm;
  output enCancel;

  reg init;
  reg enAutoSetting;
  reg enManualSetting;
  reg enSleep;
  reg enAlarm;
  reg enCancel;

  parameter [2:0] sutoSetting = 0, sleep = 1, alarm = 2, cancel = 3, start = 4, manualSetting = 5;
  reg [2:0] current_state, next_state;

  always @(posedge clock or negedge reset)
  begin: SYNCH
    if (reset == 1'b0)
       current_state <= start;
    else
       current_state <= next_state;
  end

  always @(current_state or switch or completeSetting or completeSleep or sharp)
  begin: COMBIN
     case (current_state)
        sutoSetting:
        begin
          if (completeSetting == 1'b1)
             begin
             next_state <= sleep;
             end
          else if (completeSetting == 1'b0)
             begin
             next_state <= sutoSetting;
             end
          enAutoSetting <= 1'b1;

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
          if (switch == 1'b0)
             begin
             next_state <= sutoSetting;
             end
          else if (switch == 1'b1)
             begin
             next_state <= manualSetting;
             end
          init <= 1'b1;

        end

        manualSetting:
        begin
          if (completeSetting == 1'b0)
             begin
             next_state <= manualSetting;
             end
          else if (completeSetting == 1'b1)
             begin
             next_state <= sleep;
             end
          enManualSetting <= 1'b1;

        end


        default:
          next_state <= start;
     endcase
  end

endmodule
