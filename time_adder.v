module time_adder(reset, clock, oHour10, pHour10, oHour1, pHour1, oMinute10, pMinute10, oMinute1, pMinute1, oSecond10, pSecond10, oSecond1, pSecond1, en, Hour10, Hour1, Minute10, Minute1, Second10, Second1, complete, recursive);
  input reset;
  input clock;
  input [3:0] oHour10;
  input [3:0] pHour10;
  input [3:0] oHour1;
  input [3:0] pHour1;
  input [3:0] oMinute10;
  input [3:0] pMinute10;
  input [3:0] oMinute1;
  input [3:0] pMinute1;
  input [3:0] oSecond10;
  input [3:0] pSecond10;
  input [3:0] oSecond1;
  input [3:0] pSecond1;
  input en;
  output [3:0] Hour10;
  output [3:0] Hour1;
  output [3:0] Minute10;
  output [3:0] Minute1;
  output [3:0] Second10;
  output [3:0] Second1;
  output complete;
  output recursive;

  reg [3:0] Hour10;
  reg [3:0] Hour1;
  reg [3:0] Minute10;
  reg [3:0] Minute1;
  reg [3:0] Second10;
  reg [3:0] Second1;
  reg complete;
  reg recursive;

  parameter [3:0] S0 = 0, S1 = 1, S2 = 2, S6 = 3, S3 = 4, S4 = 5, S9 = 6, S10 = 7, S11 = 8, S12 = 9, S13 = 10, S14 = 11, S15 = 12, S5 = 13;
  reg [3:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= S5;
    else
       current_state <= next_state;
  end

  always @(current_state or oHour10 or pHour10 or oHour1 or pHour1 or oMinute10 or pMinute10 or oMinute1 or pMinute1 or oSecond10 or pSecond10 or oSecond1 or pSecond1 or en)
  begin: COMBIN
     case (current_state)
        S0:
        begin
          if (oHour10 + pHour10 < 4'b1010)
             begin
             next_state <= S1;
             end
          else if (oHour10 + pHour10 > 4'b1001)
             begin
             next_state <= S6;
             end
          Hour10 <= 4'b0000;
          Hour1 <= 4'b0000;
          Minute10 <= 4'b0000;
          Minute1 <= 4'b0000;
          Second10 <= 4'b0000;
          Second1 <= 4'b0000;
          complete <= 1'b0;
          recursive <= 1'b0;

        end

        S1:
        begin
          if (oHour1 + pHour1 < 4'b1010)
             begin
             next_state <= S2;
             end
          else if (oHour1 + pHour1 > 4'b1001)
             begin
             next_state <= S3;
             end
          Hour10 <= 4'b0000;
          Hour1 <= 4'b0000;
          Minute10 <= 4'b0000;
          Minute1 <= 4'b0000;
          Second10 <= 4'b0000;
          Second1 <= 4'b0000;
          complete <= 1'b0;
          recursive <= 1'b0;

        end

        S2:
        begin
          if (oMinute10 + pMinute10 > 4'b0101)
             begin
             next_state <= S4;
             end
          else if (oMinute10 + pMinute10 < 4'b0110)
             begin
             next_state <= S9;
             end
          Hour10 <= 4'b0000;
          Hour1 <= 4'b0000;
          Minute10 <= 4'b0000;
          Minute1 <= 4'b0000;
          Second10 <= 4'b0000;
          Second1 <= 4'b0000;
          complete <= 1'b0;

        end

        S6:
        begin
             next_state <= S5;
          Hour10 <= 4'b1001;
          Hour1 <= 4'b1001;
          Minute10 <= 4'b0101;
          Minute1 <= 4'b1001;
          Second10 <= 4'b0101;
          Second1 <= 4'b1001;
          complete <= 1'b1;
          recursive <= 1'b0;

        end

        S3:
        begin
             next_state <= S5;
          Hour10 <= oHour10 + pHour10 + 4'b0001;
          Hour1 <= oHour1 + pHour1 - 4'b1010;
          Minute10 <= oMinute10 + pMinute10;
          Minute1 <= oMinute1 + pMinute1;
          Second10 <= oSecond10 + pSecond10;
          Second1 <= oSecond1 + pSecond1;
          complete <= 1'b1;
          recursive <= 1'b1;

        end

        S4:
        begin
             next_state <= S5;
          Hour10 <= oHour10 + pHour10;
          Hour1 <= oHour1 + pHour1 + 4'b0001;
          Minute10 <= oMinute10 + pMinute10 - 4'b0110;
          Minute1 <= oMinute1 + pMinute1;
          Second10 <= oSecond10 + pSecond10;
          Second1 <= oSecond1 + pSecond1;
          complete <= 1'b1;
          recursive <= 1'b1;

        end

        S9:
        begin
          if (oMinute1 + pMinute1 > 4'b1001)
             begin
             next_state <= S10;
             end
          else if (oMinute1 + pMinute1 < 4'b1010)
             begin
             next_state <= S11;
             end
          Hour10 <= 4'b0000;
          Hour1 <= 4'b0000;
          Minute10 <= 4'b0000;
          Minute1 <= 4'b0000;
          Second10 <= 4'b0000;
          Second1 <= 4'b0000;
          complete <= 1'b0;

        end

        S10:
        begin
             next_state <= S5;
          Hour10 <= oHour10 + pHour10;
          Hour1 <= oHour1 + pHour1;
          Minute10 <= oMinute10 + pMinute10 + 4'b0001;
          Minute1 <= oMinute1 + pMinute1 - 4'b1010;
          Second10 <= oSecond10 + pSecond10;
          Second1 <= oSecond1 + pSecond1;
          complete <= 1'b1;
          recursive <= 1'b1;

        end

        S11:
        begin
          if (oSecond10 + pSecond10 > 4'b0101)
             begin
             next_state <= S12;
             end
          else if (oSecond10 + pSecond10 < 4'b0110)
             begin
             next_state <= S13;
             end
          Hour10 <= 4'b0000;
          Hour1 <= 4'b0000;
          Minute10 <= 4'b0000;
          Minute1 <= 4'b0000;
          Second10 <= 4'b0000;
          Second1 <= 4'b0000;
          complete <= 1'b0;

        end

        S12:
        begin
             next_state <= S5;
          Hour10 <= oHour10 + pHour10;
          Hour1 <= oHour1 + pHour1;
          Minute10 <= oMinute10 + pMinute10;
          Minute1 <= oMinute1 + pMinute1 + 4'b0001;
          Second10 <= oSecond10 + pSecond10 - 4'b0110;
          Second1 <= oSecond1 + pSecond1;
          complete <= 1'b1;
          recursive <= 1'b1;

        end

        S13:
        begin
          if (oSecond1 + pSecond1 > 4'b1001)
             begin
             next_state <= S14;
             end
          else if (oSecond1 + pSecond1 < 4'b1010)
             begin
             next_state <= S15;
             end
          Hour10 <= 4'b0000;
          Hour1 <= 4'b0000;
          Minute10 <= 4'b0000;
          Minute1 <= 4'b0000;
          Second10 <= 4'b0000;
          Second1 <= 4'b0000;
          complete <= 1'b0;

        end

        S14:
        begin
             next_state <= S5;
          Hour10 <= oHour10 + pHour10;
          Hour1 <= oHour1 + pHour1;
          Minute10 <= oMinute10 + pMinute10;
          Minute1 <= oMinute1 + pMinute1;
          Second10 <= oSecond10 + pSecond10 + 4'b0001;
          Second1 <= oSecond1 + pSecond1 - 4'b1010;
          complete <= 1'b1;
          recursive <= 1'b1;

        end

        S15:
        begin
             next_state <= S5;
          Hour10 <= oHour10 + pHour10;
          Hour1 <= oHour1 + pHour1;
          Minute10 <= oMinute10 + pMinute10;
          Minute1 <= oMinute1 + pMinute1;
          Second10 <= oSecond10 + pSecond10;
          Second1 <= oSecond1 + pSecond1;
          complete <= 1'b1;
          recursive <= 1'b0;

        end

        S5:
        begin
          if (en == 1'b1)
             begin
             next_state <= S0;
             end
          else if (en == 1'b0)
             begin
             next_state <= S5;
             end
        end


        default:
          next_state <= S5;
     endcase
  end

endmodule
