ModuleName alarmSound
LanguageType Veirlog
GridInterval 8
MillimetersIn100RealScaledUnit 25
ZoomOutScale 51
NumberOfHorzPapaers 8
NumberOfVertPapaers 4
Parameters
End
Wires
Wire Name: b2
LV: 12
RV: 0
Width: 13
Edges
Edge X1: 480 ,Y1: 152 ,X2: 544 ,Y2: 152
End
Branches
End
Wire Name: w3
LV: 0
RV: 0
Width: 1
Edges
Edge X1: 480 ,Y1: 184 ,X2: 496 ,Y2: 184
Edge X1: 496 ,Y1: 184 ,X2: 496 ,Y2: 216
Edge X1: 496 ,Y1: 216 ,X2: 768 ,Y2: 216
End
Branches
End
Wire Name: w4
LV: 0
RV: 0
Width: 1
Edges
Edge X1: 736 ,Y1: 152 ,X2: 768 ,Y2: 152
End
Branches
End
Wire Name: w7
LV: 0
RV: 0
Width: 1
Edges
Edge X1: 288 ,Y1: 176 ,X2: 336 ,Y2: 176
End
Branches
End
Wire Name: w10
LV: 0
RV: 0
Width: 1
Edges
Edge X1: 56 ,Y1: 176 ,X2: 80 ,Y2: 176
End
Branches
End
Wire Name: w8
LV: 0
RV: 0
Width: 1
Edges
Edge X1: 64 ,Y1: 192 ,X2: 80 ,Y2: 192
Edge X1: 64 ,Y1: 192 ,X2: 64 ,Y2: 248
Edge X1: 40 ,Y1: 248 ,X2: 64 ,Y2: 248
Edge X1: 64 ,Y1: 248 ,X2: 520 ,Y2: 248
Edge X1: 520 ,Y1: 168 ,X2: 520 ,Y2: 248
Edge X1: 520 ,Y1: 168 ,X2: 544 ,Y2: 168
End
Branches
End
Wire Name: w12
LV: 0
RV: 0
Width: 1
Edges
Edge X1: 304 ,Y1: 160 ,X2: 336 ,Y2: 160
End
Branches
End
Wire Name: w13
LV: 0
RV: 0
Width: 1
Edges
Edge X1: 264 ,Y1: 144 ,X2: 336 ,Y2: 144
End
Branches
End
Wire Name: w9
LV: 0
RV: 0
Width: 1
Edges
Edge X1: 336 ,Y1: 280 ,X2: 544 ,Y2: 280
Edge X1: 336 ,Y1: 192 ,X2: 336 ,Y2: 280
Edge X1: 80 ,Y1: 280 ,X2: 336 ,Y2: 280
Edge X1: 544 ,Y1: 184 ,X2: 544 ,Y2: 280
Edge X1: 56 ,Y1: 280 ,X2: 80 ,Y2: 280
Edge X1: 80 ,Y1: 208 ,X2: 80 ,Y2: 280
End
Branches
End
End
Ports
Port Left: 40 Top: 248 ,Orientation: 0
Portname: clk ,PortType: singlebit ,LanguageType: Veriilog ,PortDirection: 0 ,LV:
0
,Width:
1
,RV:
0
Port Left: 56 Top: 280 ,Orientation: 0
Portname: rst ,PortType: singlebit ,LanguageType: Veriilog ,PortDirection: 0 ,LV:
0
,Width:
1
,RV:
0
Port Left: 768 Top: 216 ,Orientation: 0
Portname: led1 ,PortType: singlebit ,LanguageType: Veriilog ,PortDirection: 2 ,LV:
0
,Width:
1
,RV:
0
Port Left: 768 Top: 152 ,Orientation: 0
Portname: alarmSori ,PortType: singlebit ,LanguageType: Veriilog ,PortDirection: 2 ,LV:
0
,Width:
1
,RV:
0
Port Left: 304 Top: 160 ,Orientation: 0
Portname: sharp ,PortType: singlebit ,LanguageType: Veriilog ,PortDirection: 0 ,LV:
0
,Width:
1
,RV:
0
Port Left: 264 Top: 144 ,Orientation: 0
Portname: keypad ,PortType: singlebit ,LanguageType: Veriilog ,PortDirection: 0 ,LV:
0
,Width:
1
,RV:
0
End
Symbols
Symbol Left: 568 Top: 144
Name: s1
LibraryName: (NoLibraryName)
IpName: piezo
SymbolParameters
End
Symbol Left: 360 Top: 136
Name: s2
LibraryName: (NoLibraryName)
IpName: alarm
SymbolParameters
Parameter Name: S0 ,Type: integer ,Value:
0
Parameter Name: S1 ,Type: integer ,Value:
1
Parameter Name: S10 ,Type: integer ,Value:
10
Parameter Name: S11 ,Type: integer ,Value:
11
Parameter Name: S12 ,Type: integer ,Value:
13
Parameter Name: S13 ,Type: integer ,Value:
14
Parameter Name: S2 ,Type: integer ,Value:
2
Parameter Name: S3 ,Type: integer ,Value:
3
Parameter Name: S4 ,Type: integer ,Value:
4
Parameter Name: S5 ,Type: integer ,Value:
5
Parameter Name: S6 ,Type: integer ,Value:
6
Parameter Name: S7 ,Type: integer ,Value:
7
Parameter Name: S8 ,Type: integer ,Value:
8
Parameter Name: S9 ,Type: integer ,Value:
9
Parameter Name: st ,Type: integer ,Value:
12
End
Symbol Left: 104 Top: 168
Name: s3
LibraryName: (NoLibraryName)
IpName: PNU_CLK_DIV
SymbolParameters
Parameter Name: cnt_num ,Type: integer ,Value:
1000000
End
Symbol Left: 48 Top: 160
Name: s4
LibraryName: PNULib
IpName: PNU_ONE
SymbolParameters
End
End
Texts
End
Links
End
