module enable_time(reset, clock, en, sharp, hour_en, min_en, sec_en, completeSetting);
  input reset;
  input clock;
  input en;
  input sharp;
  output hour_en;
  output min_en;
  output sec_en;
  output completeSetting;

  reg hour_en;
  reg min_en;
  reg sec_en;
  reg completeSetting;

  parameter [2:0] hour = 0, min = 1, sec = 2, S0 = 3, input_wait = 4;
  reg [2:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= input_wait;
    else
       current_state <= next_state;
  end

  always @(current_state or en or sharp)
  begin: COMBIN
     case (current_state)
        hour:
        begin
          if (en == 1'b1 && sharp == 1'b0)
             begin
             next_state <= hour;
             end
          else if (en == 1'b1 && sharp == 1'b1)
             begin
             next_state <= min;
             end
          else if (en == 1'b0)
             begin
             next_state <= input_wait;
             end
          completeSetting <= 1'b0;
          hour_en <= 1'b1;
          min_en <= 1'b0;
          sec_en <= 1'b0;

        end

        min:
        begin
          if (en == 1'b1 && sharp == 1'b1)
             begin
             next_state <= sec;
             end
          else if (en == 1'b1 && sharp == 1'b0)
             begin
             next_state <= min;
             end
          else if (en == 1'b0)
             begin
             next_state <= input_wait;
             end
          completeSetting <= 1'b0;
          hour_en <= 1'b0;
          min_en <= 1'b1;
          sec_en <= 1'b0;

        end

        sec:
        begin
          if (en == 1'b1 && sharp == 1'b0)
             begin
             next_state <= sec;
             end
          else if (en == 1'b1 && sharp == 1'b1)
             begin
             next_state <= S0;
             end
          else if (en == 1'b0)
             begin
             next_state <= input_wait;
             end
          completeSetting <= 1'b0;
          hour_en <= 1'b0;
          min_en <= 1'b0;
          sec_en <= 1'b1;

        end

        S0:
        begin
             next_state <= input_wait;
          completeSetting <= 1'b1;
          hour_en <= 1'b0;
          min_en <= 1'b0;
          sec_en <= 1'b0;

        end

        input_wait:
        begin
          if (en == 1'b1)
             begin
             next_state <= hour;
             end
          else if (en == 1'b0)
             begin
             next_state <= input_wait;
             end
          completeSetting <= 1'b0;
          hour_en <= 1'b0;
          min_en <= 1'b0;
          sec_en <= 1'b0;

        end


        default:
          next_state <= input_wait;
     endcase
  end

endmodule
