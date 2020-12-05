module alarm(reset, clock, start, stop, light, beat);
  input reset;
  input clock;
  input start;
  input stop;
  output light;
  output [12:0] beat;

  reg light;
  reg [12:0] beat;

  parameter [3:0] S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S6 = 5, S7 = 6, S8 = 7, S9 = 8, S10 = 9, S11 = 10, st = 11, S12 = 12;
  reg [3:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= st;
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
             next_state <= st;
             end
          light <= 1'b1;
          beat <= 13'b0001000000000;

        end

        S1:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S2;
             end
          else if (stop == 1'b1)
             begin
             next_state <= st;
             end
          light <= 1'b0;
          beat <= 13'b0010000000000;

        end

        S2:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S3;
             end
          else if (stop == 1'b1)
             begin
             next_state <= st;
             end
          light <= 1'b0;
          beat <= 13'b1000000000000;

        end

        S3:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S4;
             end
          else if (stop == 1'b1)
             begin
             next_state <= st;
             end
          light <= 1'b1;
          beat <= 13'b0000000000001;

        end

        S4:
        begin
          if (stop == 1'b1)
             begin
             next_state <= st;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S6;
             end
          light <= 1'b0;
          beat <= 13'b1000000000000;

        end

        S6:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S7;
             end
          else if (stop == 1'b1)
             begin
             next_state <= st;
             end
          light <= 1'b1;
          beat <= 13'b0001000000000;

        end

        S7:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S8;
             end
          else if (stop == 1'b1)
             begin
             next_state <= st;
             end
          light <= 1'b0;
          beat <= 13'b0010000000000;

        end

        S8:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S9;
             end
          else if (stop == 1'b1)
             begin
             next_state <= st;
             end
          light <= 1'b0;
          beat <= 13'b1000000000000;

        end

        S9:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S10;
             end
          else if (stop == 1'b1)
             begin
             next_state <= st;
             end
          light <= 1'b1;
          beat <= 13'b0000000000001;

        end

        S10:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S11;
             end
          else if (stop == 1'b1)
             begin
             next_state <= st;
             end
          light <= 1'b0;
          beat <= 13'b1000000000000;

        end

        S11:
        begin
          if (stop == 1'b1)
             begin
             next_state <= st;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S12;
             end
          light <= 1'b0;
          beat <= 13'b0010000000000;

        end

        st:
        begin
          if (start == 1'b1)
             begin
             next_state <= S0;
             end
          else if (start == 1'b0)
             begin
             next_state <= st;
             end
        end

        S12:
        begin
          if (stop == 1'b1)
             begin
             next_state <= st;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S0;
             end
          light <= 1'b0;
          beat <= 13'b0001000000000;

        end


        default:
          next_state <= st;
     endcase
  end

endmodule
