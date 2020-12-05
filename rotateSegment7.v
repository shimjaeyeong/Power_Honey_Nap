module rotateSegment7(reset, clock, com, seg, dot, data1, data2, data3, data4, data5, data6, h, m, s);
  input reset;
  input clock;
  output [7:0] com;
  output [6:0] seg;
  output dot;
  input [6:0] data1;
  input [6:0] data2;
  input [6:0] data3;
  input [6:0] data4;
  input [6:0] data5;
  input [6:0] data6;
  input h;
  input m;
  input s;

  reg [7:0] com;
  reg [6:0] seg;
  reg dot;

  parameter [3:0] S3 = 0, S4 = 1, S5 = 2, S6 = 3, S7 = 4, S8 = 5, S0 = 6, S1 = 7, S2 = 8;
  reg [3:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= S3;
    else
       current_state <= next_state;
  end

  always @(current_state or data1 or data2 or data3 or data4 or data5 or data6 or h or m or s)
  begin: COMBIN
     case (current_state)
        S3:
        begin
             next_state <= S4;
          com <= 8'b11011111;
          seg <= data1;
          dot <= 1'b0;

        end

        S4:
        begin
          if (m == 1'b0)
             begin
             next_state <= S5;
             end
          else if (m == 1'b1)
             begin
             next_state <= S1;
             end
          com <= 8'b11101111;
          seg <= data2;
          dot <= 1'b1;

        end

        S5:
        begin
             next_state <= S6;
          com <= 8'b11110111;
          seg <= data3;
          dot <= 1'b0;

        end

        S6:
        begin
          if (s == 1'b0)
             begin
             next_state <= S7;
             end
          else if (s == 1'b1)
             begin
             next_state <= S2;
             end
          com <= 8'b11111011;
          seg <= data4;
          dot <= 1'b1;

        end

        S7:
        begin
             next_state <= S8;
          com <= 8'b11111101;
          seg <= data5;
          dot <= 1'b0;

        end

        S8:
        begin
          if (h == 1'b0)
             begin
             next_state <= S3;
             end
          else if (h == 1'b1)
             begin
             next_state <= S0;
             end
          com <= 8'b11111110;
          seg <= data6;
          dot <= 1'b1;

        end

        S0:
        begin
             next_state <= S5;
          com <= 8'b11101111;
          seg <= 7'b0000000;
          dot <= 1'b1;

        end

        S1:
        begin
             next_state <= S7;
          com <= 8'b11111011;
          seg <= 7'b0000000;
          dot <= 1'b1;

        end

        S2:
        begin
             next_state <= S3;
          com <= 8'b11111110;
          seg <= 7'b0000000;
          dot <= 1'b1;

        end


        default:
          next_state <= S3;
     endcase
  end

endmodule
