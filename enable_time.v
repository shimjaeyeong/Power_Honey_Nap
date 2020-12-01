module enable_time(reset, clock, sharp, hour_en, min_en, sec_en);
  input reset;
  input clock;
  input sharp;
  output hour_en;
  output min_en;
  output sec_en;

  reg hour_en;
  reg min_en;
  reg sec_en;

  parameter [1:0] S0 = 0, S1 = 1, S2 = 2;
  reg [1:0] current_state, next_state;

  always @(posedge clock or negedge reset)
  begin: SYNCH
    if (reset == 1'b0)
       current_state <= S0;
    else
       current_state <= next_state;
  end

  always @(current_state or sharp)
  begin: COMBIN
     case (current_state)
        S0:
        begin
          if (sharp != 1'b1)
             begin
             next_state <= S0;
             end
          else if (sharp == 1'b1)
             begin
             next_state <= S1;
             end
          hour_en <= 1'b1;
          sec_en <= 1'b0;

        end

        S1:
        begin
          if (sharp == 1'b1)
             begin
             next_state <= S2;
             end
          else if (sharp != 1'b1)
             begin
             next_state <= S1;
             end
          min_en <= 1'b1;
          hour_en <= 1'b0;

        end

        S2:
        begin
          if (sharp != 1'b1)
             begin
             next_state <= S2;
             end
          else if (sharp == 1'b1)
             begin
             next_state <= S0;
             end
          sec_en <= 1'b1;
          min_en <= 1'b0;

        end


        default:
          next_state <= S0;
     endcase
  end

endmodule
