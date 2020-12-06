module auto_setting(reset, clock, en, keypad, sharp, oHour10, oHour1, oMinute10, oMinute1, oSecond10, oSecond1, hour10, hour1, minute10, minute1, second10, second1, complete);
  input reset;
  input clock;
  input en;
  input [9:0] keypad;
  input sharp;
  input [3:0] oHour10;
  input [3:0] oHour1;
  input [3:0] oMinute10;
  input [3:0] oMinute1;
  input [3:0] oSecond10;
  input [3:0] oSecond1;
  output [3:0] hour10;
  output [3:0] hour1;
  output [3:0] minute10;
  output [3:0] minute1;
  output [3:0] second10;
  output [3:0] second1;
  output complete;

  reg [3:0] hour10;
  reg [3:0] hour1;
  reg [3:0] minute10;
  reg [3:0] minute1;
  reg [3:0] second10;
  reg [3:0] second1;
  reg complete;

  parameter [3:0] k1 = 0, k2 = 1, k3 = 2, S3 = 3, cpl = 4, c1 = 5, c2 = 6, c3 = 7, c4 = 8, c5 = 9, c6 = 10;
  reg [3:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= S3;
    else
       current_state <= next_state;
  end

  always @(current_state or en or keypad or sharp or oHour10 or oHour1 or oMinute10 or oMinute1 or oSecond10 or oSecond1)
  begin: COMBIN
     case (current_state)
        k1:
        begin
             next_state <= S3;
          hour10 <= oHour10;
          hour1 <= oHour1;
          minute10 <= oMinute10;
          minute1 <= oMinute1;
          second10 <= oSecond10;
          second1 <= oSecond1 + 4'b0101;
          complete <= 1'b0;

        end

        k2:
        begin
             next_state <= S3;
          hour10 <= oHour10;
          hour1 <= oHour1;
          minute10 <= oMinute10;
          minute1 <= oMinute1;
          second10 <= oSecond10 + 4'b0011;
          second1 <= oSecond1;
          complete <= 1'b0;

        end

        k3:
        begin
             next_state <= S3;
          hour10 <= oHour10;
          hour1 <= oHour1;
          minute10 <= oMinute10;
          minute1 <= oMinute1 + 4'b0001;
          second10 <= oSecond10;
          second1 <= oSecond1;
          complete <= 1'b0;

        end

        S3:
        begin
          if (en == 1'b1 && keypad == 10'b0000000010)
             begin
             next_state <= k1;
             end
          else if (en == 1'b1 && keypad == 10'b0000000100)
             begin
             next_state <= k2;
             end
          else if (en == 1'b1 && keypad == 10'b0000001000)
             begin
             next_state <= k3;
             end
          else if (en == 1'b1 && sharp == 1'b1)
             begin
             next_state <= cpl;
             end
          else if (en == 1'b0)
             begin
             next_state <= S3;
             end
          else if (en == 1'b1 && oHour10 > 4'b1001)
             begin
             next_state <= c1;
             end
          else if (en == 1'b1 && oHour1 > 4'b1001)
             begin
             next_state <= c2;
             end
          else if (en == 1'b1 && oMinute10 > 4'b0101)
             begin
             next_state <= c3;
             end
          else if (en == 1'b1 && oMinute10 > 4'b1001)
             begin
             next_state <= c4;
             end
          else if (en == 1'b1 && oSecond10 > 4'b0101)
             begin
             next_state <= c5;
             end
          else if (en == 1'b1 && oSecond1 > 4'b1001)
             begin
             next_state <= c6;
             end
          else
             begin
             next_state <= S3;
             end
          hour10 <= 4'b0000;
          hour1 <= 4'b0000;
          minute10 <= 4'b0000;
          minute1 <= 4'b0000;
          second10 <= 4'b0000;
          second1 <= 4'b0000;
          complete <= 1'b0;

        end

        cpl:
        begin
             next_state <= S3;
          hour10 <= oHour10;
          hour1 <= oHour1;
          minute10 <= oMinute10;
          minute1 <= oMinute1;
          second10 <= oSecond10;
          second1 <= oSecond1;
          complete <= 1'b1;

        end

        c1:
        begin
             next_state <= S3;
          hour10 <= 4'b1001;
          hour1 <= 4'b1001;
          minute10 <= 4'b0101;
          minute1 <= 4'b1001;
          second10 <= 4'b0101;
          second1 <= 4'b1001;
          complete <= 1'b0;

        end

        c2:
        begin
             next_state <= S3;
          hour10 <= oHour10 + 4'b0001;
          hour1 <= oHour1 - 4'b1010;
          minute10 <= oMinute10;
          minute1 <= oMinute1;
          second10 <= oSecond10;
          second1 <= oSecond1;
          complete <= 1'b0;

        end

        c3:
        begin
             next_state <= S3;
          hour10 <= oHour10;
          hour1 <= oHour1 + 4'b0001;
          minute10 <= oMinute10 - 4'b0110;
          minute1 <= oMinute1;
          second10 <= oSecond10;
          second1 <= oSecond1;
          complete <= 1'b0;

        end

        c4:
        begin
             next_state <= S3;
          hour10 <= oHour10;
          hour1 <= oHour1;
          minute10 <= oMinute10 + 4'b0001;
          minute1 <= oMinute1 - 4'b1010;
          second10 <= oSecond10;
          second1 <= oSecond1;
          complete <= 1'b0;

        end

        c5:
        begin
             next_state <= S3;
          hour10 <= oHour10;
          hour1 <= oHour1;
          minute10 <= oMinute10;
          minute1 <= oMinute1 + 4'b0001;
          second10 <= oSecond10 - 4'b0110;
          second1 <= oSecond1;
          complete <= 1'b0;

        end

        c6:
        begin
             next_state <= S3;
          hour10 <= oHour10;
          hour1 <= oHour1;
          minute10 <= oMinute10;
          minute1 <= oMinute1;
          second10 <= oSecond10 + 4'b0001;
          second1 <= oSecond1 - 4'b1010;
          complete <= 1'b0;

        end


        default:
          next_state <= S3;
     endcase
  end

endmodule
