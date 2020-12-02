module enable_time(reset, clock, sharp, hour_en, min_en, sec_en, completeSetting);
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

  always @(posedge clock or negedge reset)
  begin: SYNCH
    if (reset == 1'b0)
       current_state <= hour;
    else
       current_state <= next_state;
  end

  always @(current_state or sharp)
  begin: COMBIN
     case (current_state)
        hour:
        begin
          if (sharp != 1'b1)
             begin
             next_state <= hour;
             end
          else if (sharp == 1'b1)
             begin
             next_state <= minute;
             end
          hour_en <= 1'b1;
          sec_en <= 1'b0;

        end

        minute:
        begin
          if (sharp == 1'b1)
             begin
             next_state <= second;
             end
          else if (sharp != 1'b1)
             begin
             next_state <= minute;
             end
          min_en <= 1'b1;
          hour_en <= 1'b0;

        end

        second:
        begin
          if (sharp != 1'b1)
             begin
             next_state <= second;
             end
          else if (sharp == 1'b1)
             begin
             next_state <= set_complete;
             end
          sec_en <= 1'b1;
          min_en <= 1'b0;

        end

        set_complete:
        begin
          if (sharp == 1'b0)
             begin
             next_state <= hour;
             end
          completeSetting <= 1'b1;
          sharp <= 1'b0;

        end


        default:
          next_state <= hour;
     endcase
  end

endmodule
