module timer(reset, clock, start, setHour10, setHour1, setMinute10, setMinute1, setSecond10, setSecond1, getHour10, getHour1, getMinute10, getMinute1, getSecond10, getSecond1, isZero, complete);
  input reset;
  input clock;
  input start;
  input [3:0] setHour10;
  input [3:0] setHour1;
  input [3:0] setMinute10;
  input [3:0] setMinute1;
  input [3:0] setSecond10;
  input [3:0] setSecond1;
  output [3:0] getHour10;
  output [3:0] getHour1;
  output [3:0] getMinute10;
  output [3:0] getMinute1;
  output [3:0] getSecond10;
  output [3:0] getSecond1;
  output isZero;
  output complete;

  reg [3:0] getHour10;
  reg [3:0] getHour1;
  reg [3:0] getMinute10;
  reg [3:0] getMinute1;
  reg [3:0] getSecond10;
  reg [3:0] getSecond1;
  reg isZero;
  reg complete;

  parameter [3:0] check = 0, second = 1, cpl1 = 2, minute1 = 3, cpl2 = 4, cpl3 = 5, minute2 = 6, cpl4 = 7, cpl5 = 8, hour1 = 9, hour2 = 10, cpl6 = 11, S3 = 12;
  reg [3:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= check;
    else
       current_state <= next_state;
  end

  always @(current_state or start or setHour10 or setHour1 or setMinute10 or setMinute1 or setSecond10 or setSecond1)
  begin: COMBIN
     case (current_state)
        check:
        begin
          if (setSecond1 == 4'b0000)
             begin
             next_state <= second;
             end
          else if (setSecond1 != 4'b0000)
             begin
             next_state <= cpl1;
             end
          else if (start == 1'b0)
             begin
             next_state <= check;
             end
        end

        second:
        begin
          if (setSecond10 != 4'b0000)
             begin
             next_state <= cpl2;
             end
          else if (setSecond10 == 4'b0000)
             begin
             next_state <= minute1;
             end
        end

        cpl1:
        begin
             next_state <= check;
          getSecond1 <= setSecond1 - 4'b0001;
          getSecond10 <= setSecond10;
          getMinute1 <= setMinute1;
          getMinute10 <= setMinute10;
          getHour1 <= setHour1;
          getHour10 <= setHour10;
          complete <= 1'b1;

        end

        minute1:
        begin
          if (setMinute1 != 4'b0000)
             begin
             next_state <= cpl3;
             end
          else if (setMinute1 == 4'b0000)
             begin
             next_state <= minute2;
             end
        end

        cpl2:
        begin
             next_state <= check;
          getSecond1 <= 4'b1001;
          getSecond10 <= setSecond10 - 4'b0001;
          getMinute1 <= setMinute1;
          getMinute10 <= setMinute10;
          getHour1 <= setHour1;
          getHour10 <= setHour10;
          complete <= 1'b1;

        end

        cpl3:
        begin
             next_state <= check;
          getSecond1 <= 4'b1001;
          getSecond10 <= 4'b0101;
          getMinute1 <= setMinute1 - 4'b0001;
          getMinute10 <= setMinute10;
          getHour1 <= setHour1;
          getHour10 <= setHour10;
          complete <= 1'b1;

        end

        minute2:
        begin
          if (setMinute10 != 4'b0000)
             begin
             next_state <= cpl4;
             end
          else if (setMinute10 == 4'b0000)
             begin
             next_state <= hour1;
             end
        end

        cpl4:
        begin
             next_state <= check;
          getSecond1 <= 4'b1001;
          getSecond10 <= 4'b0101;
          getMinute1 <= 4'b1001;
          getMinute10 <= setMinute10 - 4'b0001;
          getHour1 <= setHour1;
          getHour10 <= setHour10;
          complete <= 1'b1;

        end

        cpl5:
        begin
             next_state <= check;
          getSecond1 <= 4'b1001;
          getSecond10 <= 4'b0101;
          getMinute1 <= 4'b1001;
          getMinute10 <= 4'b0101;
          getHour1 <= setHour1 - 4'b0001;
          getHour10 <= setHour10;
          complete <= 1'b1;

        end

        hour1:
        begin
          if (setHour1 != 4'b0000)
             begin
             next_state <= cpl5;
             end
          else if (setHour1 == 4'b0000)
             begin
             next_state <= hour2;
             end
        end

        hour2:
        begin
          if (setHour10 != 4'b0000)
             begin
             next_state <= cpl6;
             end
          else if (setHour10 == 4'b0000)
             begin
             next_state <= S3;
             end
        end

        cpl6:
        begin
             next_state <= check;
          getSecond1 <= 4'b1001;
          getSecond10 <= 4'b0101;
          getMinute1 <= 4'b1001;
          getMinute10 <= 4'b0101;
          getHour1 <= 4'b1001;
          getHour10 <= setHour10 - 4'b0001;
          complete <= 1'b1;

        end

        S3:
        begin
             next_state <= check;
          getSecond1 <= 4'b0000;
          getSecond10 <= 4'b0000;
          getMinute1 <= 4'b0000;
          getMinute10 <= 4'b0000;
          getHour1 <= 4'b0000;
          getHour10 <= 4'b0000;
          complete <= 1'b1;
          isZero <= 1'b1;

        end


        default:
          next_state <= check;
     endcase
  end

endmodule
