module lullaby(reset, clock, start, stop, beat);
  input reset;
  input clock;
  input start;
  input stop;
  output [12:0] beat;

  reg [12:0] beat;

  parameter [6:0] musicOff = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11, S12 = 12, S13 = 13, S14 = 14, S15 = 15, S16 = 16, S17 = 17, S18 = 18, S19 = 19, S20 = 20, S21 = 21, S22 = 22, S23 = 23, S24 = 24, S25 = 25, S26 = 26, S27 = 27, S28 = 28, S29 = 29, S30 = 30, S31 = 31, S32 = 32, S33 = 33, S34 = 34, S35 = 35, S36 = 36, S37 = 37, S38 = 38, S39 = 39, S40 = 40, S41 = 41, S42 = 42, S43 = 43, S44 = 44, S45 = 45, S46 = 46, S47 = 47, S48 = 48, S49 = 49, S50 = 50, S51 = 51, S52 = 52, S53 = 53, S54 = 54, S55 = 55, S56 = 56, S57 = 57, S58 = 58, S59 = 59, S60 = 60, S61 = 61, S62 = 62, S63 = 63, S64 = 64, S65 = 65, S66 = 66, S67 = 67, S68 = 68, S69 = 69, S70 = 70, S71 = 71, S72 = 72, S73 = 73, S74 = 74, S75 = 75, S76 = 76, S77 = 77, S78 = 78, S79 = 79, S80 = 80, S81 = 81, S82 = 82, S83 = 83, S84 = 84, S85 = 85, S86 = 86, S87 = 87, S88 = 88, S89 = 89, S90 = 90, S91 = 91, S92 = 92, S93 = 93, S94 = 94, S95 = 95, S96 = 96, S97 = 97, S98 = 98, S99 = 99, S100 = 100, S101 = 101, S102 = 102, S103 = 103, S117 = 104, S118 = 105, S119 = 106, S120 = 107, S121 = 108, S122 = 109, S104 = 110, S105 = 111, S106 = 112, S107 = 113, S108 = 114, S109 = 115, S110 = 116, S111 = 117, S112 = 118, S113 = 119, S114 = 120, S115 = 121, S116 = 122;
  reg [6:0] current_state, next_state;

  always @(posedge clock or posedge reset)
  begin: SYNCH
    if (reset == 1'b1)
       current_state <= S1;
    else
       current_state <= next_state;
  end

  always @(current_state or start or stop)
  begin: COMBIN
     case (current_state)
        musicOff:
        begin
          if (start == 1'b1)
             begin
             next_state <= S1;
             end
          else if (start == 1'b0)
             begin
             next_state <= musicOff;
             end
        end

        S1:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S2;
             end
          beat <= 13'b0000000001000;

        end

        S2:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S3;
             end
          beat <= 13'b0000000010000;

        end

        S3:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S4;
             end
          beat <= 13'b0000000001000;

        end

        S4:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S5;
             end
          beat <= 13'b0000000000100;

        end

        S5:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S6;
             end
          beat <= 13'b0000000000001;

        end

        S6:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S7;
             end
          beat <= 13'b0000000000010;

        end

        S7:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S8;
             end
          beat <= 13'b0000000000001;

        end

        S8:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S9;
             end
          beat <= 13'b0000000000001;

        end

        S9:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S10;
             end
        end

        S10:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S11;
             end
        end

        S11:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S12;
             end
        end

        S12:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S13;
             end
        end

        S13:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S14;
             end
          beat <= 13'b0000000000001;

        end

        S14:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S15;
             end
          beat <= 13'b0000000010000;

        end

        S15:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S16;
             end
          beat <= 13'b0000000010000;

        end

        S16:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S17;
             end
          beat <= 13'b0000000010000;

        end

        S17:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S18;
             end
          beat <= 13'b0000001000000;

        end

        S18:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S19;
             end
          beat <= 13'b0000100000000;

        end

        S19:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S20;
             end
          beat <= 13'b0000001000000;

        end

        S20:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S21;
             end
          beat <= 13'b0000001000000;

        end

        S21:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S22;
             end
        end

        S22:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S23;
             end
        end

        S23:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S24;
             end
        end

        S24:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S25;
             end
        end

        S25:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S26;
             end
          beat <= 13'b0000000000100;

        end

        S26:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S27;
             end
          beat <= 13'b0000000000010;

        end

        S27:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S28;
             end
          beat <= 13'b0000000000100;

        end

        S28:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S29;
             end
          beat <= 13'b0000000000100;

        end

        S29:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S30;
             end
          beat <= 13'b0000000000010;

        end

        S30:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S31;
             end
          beat <= 13'b0000000000100;

        end

        S31:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S32;
             end
          beat <= 13'b0000000010000;

        end

        S32:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S33;
             end
          beat <= 13'b0000000010000;

        end

        S33:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S34;
             end
        end

        S34:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S35;
             end
        end

        S35:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S36;
             end
        end

        S36:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S37;
             end
        end

        S37:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S38;
             end
          beat <= 13'b0000000001000;

        end

        S38:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S39;
             end
          beat <= 13'b0000000001000;

        end

        S39:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S40;
             end
          beat <= 13'b0000000001000;

        end

        S40:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S41;
             end
          beat <= 13'b0000000010000;

        end

        S41:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S42;
             end
          beat <= 13'b0000000001000;

        end

        S42:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S43;
             end
          beat <= 13'b0000000010000;

        end

        S43:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S44;
             end
          beat <= 13'b0000001000000;

        end

        S44:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S45;
             end
          beat <= 13'b0000001000000;

        end

        S45:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S46;
             end
        end

        S46:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S47;
             end
        end

        S47:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S48;
             end
        end

        S48:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S49;
             end
        end

        S49:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S50;
             end
          beat <= 13'b0000100000000;

        end

        S50:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S51;
             end
          beat <= 13'b0000100000000;

        end

        S51:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S52;
             end
          beat <= 13'b0000100000000;

        end

        S52:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S53;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000100000000;

        end

        S53:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S54;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000010000000;

        end

        S54:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S55;
             end
          beat <= 13'b0000100000000;

        end

        S55:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S56;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0010000000000;

        end

        S56:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S57;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0010000000000;

        end

        S57:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S58;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S58:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S59;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S59:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S60;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S60:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S61;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S61:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S62;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S62:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S63;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S63:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S64;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S64:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S65;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S65:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S66;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000100000;

        end

        S66:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S67;
             end
          beat <= 13'b0000001000000;

        end

        S67:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S68;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0010000000000;

        end

        S68:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S69;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0010000000000;

        end

        S69:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S70;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S70:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S71;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S71:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S72;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S72:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S73;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S73:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S74;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end

        S74:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S75;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S75:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S76;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end

        S76:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S77;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000001000;

        end

        S77:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S78;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end

        S78:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S79;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S79:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S80;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000100;

        end

        S80:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S81;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000100;

        end

        S81:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S82;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S82:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S83;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S83:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S84;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S84:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S85;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S85:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S86;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000001000;

        end

        S86:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S87;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end

        S87:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S88;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000001000;

        end

        S88:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S89;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000100;

        end

        S89:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S90;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S90:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S91;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000100;

        end

        S91:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S92;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S92:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S93;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S93:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S94;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S94:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S95;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S95:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S96;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S96:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S97;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000010;

        end

        S97:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S98;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S98:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S99;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S99:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S100;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000100000;

        end

        S100:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S101;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end

        S101:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S102;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000001000;

        end

        S102:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S103;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end

        S103:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end

        S117:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S118;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S118:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S119;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S119:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S120;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S120:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S121;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S121:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S122;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S122:
        begin
          if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          else if (stop == 1'b0)
             begin
             next_state <= S1;
             end
          beat <= 13'b0000000000001;

        end

        S104:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S105;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S105:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S106;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000001;

        end

        S106:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S107;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S107:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S108;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S108:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S109;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
        end

        S109:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S110;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000000010;

        end

        S110:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S111;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S111:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S112;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000001000000;

        end

        S112:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S113;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000100000;

        end

        S113:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S114;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end

        S114:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S115;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000001000;

        end

        S115:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S116;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end

        S116:
        begin
          if (stop == 1'b0)
             begin
             next_state <= S117;
             end
          else if (stop == 1'b1)
             begin
             next_state <= musicOff;
             end
          beat <= 13'b0000000010000;

        end


        default:
          next_state <= S1;
     endcase
  end

endmodule
