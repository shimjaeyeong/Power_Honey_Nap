module alarm(reset, clock, start, stop, light);
  input reset;
  input clock;
  input start;
  input stop;
  output light;

  reg light;

  parameter [3:0] S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11, wait = 12;
  reg [3:0] current_state, next_state;

  always @(posedge clock or negedge reset)
  begin: SYNCH
    if (reset == 1'b0)
       current_state <= wait;
    else
       current_state <= next_state;
  end

  always @(current_state or start or stop)
  begin: COMBIN
     case (current_state)
        S0:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S1;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b1;

        end

        S1:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S2;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b0;

        end

        S2:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S3;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b0;

        end

        S3:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S4;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b1;

        end

        S4:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S5;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b0;

        end

        S5:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S6;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b0;

        end

        S6:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S7;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b1;

        end

        S7:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S8;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b0;

        end

        S8:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S9;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b0;

        end

        S9:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S10;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b1;

        end

        S10:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S11;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b0;

        end

        S11:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S0;
             end
          else if (stop == 1'b1)
             begin
             next_state <= wait;
             end
          light <= 1'b0;

        end

        wait:
        begin
          if (start == 1'b1)
             begin
             next_state <= S0;
             end
        end


        default:
          next_state <= wait;
     endcase
  end

endmodule
