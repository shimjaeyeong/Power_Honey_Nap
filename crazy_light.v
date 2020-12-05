module crazy_light(reset, clock, start, stop, r, g, b);
  input reset;
  input clock;
  input start;
  input stop;
  output [3:0] r;
  output [3:0] g;
  output [3:0] b;

  reg [3:0] r;
  reg [3:0] g;
  reg [3:0] b;

  parameter [2:0] S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6;
  reg [2:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= S0;
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
             next_state <= S6;
             end
          r <= 4'b1111;

        end

        S1:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S2;
             end
          else if (stop == 1'b1)
             begin
             next_state <= S6;
             end
          r <= 4'b1111;
          g <= 4'b1111;

        end

        S2:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S3;
             end
          else if (stop == 1'b1)
             begin
             next_state <= S6;
             end
          g <= 4'b1111;

        end

        S3:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S4;
             end
          else if (stop == 1'b1)
             begin
             next_state <= S6;
             end
          g <= 4'b1111;
          b <= 4'b1111;

        end

        S4:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S5;
             end
          else if (stop == 1'b1)
             begin
             next_state <= S6;
             end
          b <= 4'b1111;

        end

        S5:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S0;
             end
          else if (stop == 1'b1)
             begin
             next_state <= S6;
             end
          r <= 4'b1111;
          b <= 4'b1111;

        end

        S6:
        begin
          if (start == 1'b1)
             begin
             next_state <= S0;
             end
          else if (start == 1'b0)
             begin
             next_state <= S6;
             end
          r <= 4'b0000;
          g <= 4'b0000;
          b <= 4'b0000;

        end


        default:
          next_state <= S0;
     endcase
  end

endmodule
