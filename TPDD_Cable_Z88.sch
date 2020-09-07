EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "TPDD-RS-232"
Date "2020-08-07"
Rev ""
Comp "Brian K. White"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 000_LOCAL:Transistor_BJT_DTA114E Q1
U 1 1 5F2DFF29
P 5100 3300
F 0 "Q1" V 4930 3540 50  0000 C CNN
F 1 "DTA114EKA" V 5010 3650 50  0000 C CNN
F 2 "000_LOCAL:SC-59" H 5100 3300 50  0001 L CNN
F 3 "https://www.rohm.com/datasheet/DTA114EEB/dta114eebtl-e" H 5100 3300 50  0001 L CNN
	1    5100 3300
	0    1    1    0   
$EndComp
$Comp
L 000_LOCAL:Transistor_BJT_DTA114E Q2
U 1 1 5F2E2C8F
P 5100 3800
F 0 "Q2" V 4940 4050 50  0000 C CNN
F 1 "DTA114EKA" V 5020 4160 50  0000 C CNN
F 2 "000_LOCAL:SC-59" H 5100 3800 50  0001 L CNN
F 3 "https://www.rohm.com/datasheet/DTA114EEB/dta114eebtl-e" H 5100 3800 50  0001 L CNN
	1    5100 3800
	0    1    1    0   
$EndComp
$Comp
L 000_LOCAL:Transistor_BJT_DTA114E Q3
U 1 1 5F2E424E
P 5100 4300
F 0 "Q3" V 4940 4550 50  0000 C CNN
F 1 "DTA114EKA" V 5020 4660 50  0000 C CNN
F 2 "000_LOCAL:SC-59" H 5100 4300 50  0001 L CNN
F 3 "https://www.rohm.com/datasheet/DTA114EEB/dta114eebtl-e" H 5100 4300 50  0001 L CNN
	1    5100 4300
	0    1    1    0   
$EndComp
Text Label 3600 3800 2    50   ~ 0
SG
Text Label 4100 3800 0    50   ~ 0
RTS
Text Label 3600 3900 2    50   ~ 0
DSR_TTL
Text Label 3600 4000 2    50   ~ 0
DTR
Text Label 4100 4000 0    50   ~ 0
RX_TTL
Text Label 3600 4100 2    50   ~ 0
TX
Text Label 6270 4200 2    50   ~ 0
TX
Text Label 6270 4100 2    50   ~ 0
RX
Text Label 6270 3700 2    50   ~ 0
RTS
Text Label 6270 3900 2    50   ~ 0
CTS
Text Label 6270 3800 2    50   ~ 0
DSR
Text Label 6270 3600 2    50   ~ 0
SG
Text Label 6270 4000 2    50   ~ 0
DTR
Wire Wire Line
	5300 3400 5800 3400
Wire Wire Line
	4700 4050 5100 4050
Text Notes 4050 3300 2    100  ~ 0
TPDD
Wire Wire Line
	4700 3050 4700 3550
Wire Wire Line
	5100 3550 4700 3550
Connection ~ 4700 3550
Wire Wire Line
	4700 3550 4700 4050
Text Label 4900 4400 2    50   ~ 0
RX_TTL
Text Label 4900 3900 2    50   ~ 0
CTS_TTL
Text Label 4900 3400 2    50   ~ 0
DSR_TTL
Text Label 5300 3400 0    50   ~ 0
DSR
Text Label 5300 3900 0    50   ~ 0
CTS
Text Label 5300 4400 0    50   ~ 0
RX
$Comp
L 000_LOCAL:1x7_stagger_wirepads J1
U 1 1 5F2FF8FD
P 6570 4000
F 0 "J1" H 6470 3350 50  0000 C CNN
F 1 "Wire Solder Pads" H 6470 3450 50  0000 C CNN
F 2 "000_LOCAL:D7_1.5mm_wirepads" H 6570 4000 50  0001 C CNN
F 3 " ~" H 6570 4000 50  0001 C CNN
	1    6570 4000
	1    0    0    1   
$EndComp
Wire Wire Line
	5300 4400 5900 4400
Wire Wire Line
	5900 4100 5900 4400
Wire Wire Line
	5800 3400 5800 3800
Wire Wire Line
	4500 2950 5900 2950
Wire Wire Line
	5900 2950 5900 3700
Wire Wire Line
	6000 4200 6000 4500
$Comp
L 000_LOCAL:Conn_02x04_Odd_Even J2
U 1 1 5F35826E
P 3800 3900
F 0 "J2" H 3840 4230 50  0000 C CNN
F 1 "TPDD" H 3850 4150 50  0000 C CNN
F 2 "000_LOCAL:2-6-2_tpdd" H 3800 3900 50  0001 C CNN
F 3 "~" H 3800 3900 50  0001 C CNN
	1    3800 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3800 3490 3800
Wire Wire Line
	3400 3400 3400 3900
Wire Wire Line
	3400 3900 3600 3900
Wire Wire Line
	5800 4000 5800 4600
Wire Wire Line
	3400 4600 3400 4000
Wire Wire Line
	3400 4000 3600 4000
Wire Wire Line
	3600 4100 3500 4100
Wire Wire Line
	3500 4100 3500 4500
Wire Wire Line
	4500 2950 4500 3800
Wire Notes Line
	6500 3600 7230 3600
Wire Notes Line
	6620 3700 7230 3700
Wire Notes Line
	6500 3800 7230 3800
Wire Notes Line
	6620 3900 7230 3900
Wire Notes Line
	6500 4000 7230 4000
Wire Notes Line
	6620 4100 7230 4100
Wire Notes Line
	6500 4200 7230 4200
Text Notes 6840 3890 0    50   ~ 0
cable
Text Label 4100 3900 0    50   ~ 0
CTS_TTL
Text Notes 7150 3230 0    50   ~ 0
RS-232 DTE
Wire Wire Line
	4900 3400 3400 3400
Wire Wire Line
	3500 4500 6000 4500
Wire Wire Line
	3400 4600 5800 4600
Wire Wire Line
	5300 3900 6270 3900
Wire Wire Line
	6270 4200 6000 4200
Wire Wire Line
	6270 4100 5900 4100
Wire Wire Line
	6270 4000 5800 4000
Wire Wire Line
	6270 3800 5800 3800
Wire Wire Line
	6270 3700 5900 3700
Wire Wire Line
	6000 3050 6000 3600
Wire Wire Line
	6000 3600 6270 3600
Wire Wire Line
	4700 3050 5100 3050
Connection ~ 5100 3050
Wire Wire Line
	5100 3050 6000 3050
Wire Wire Line
	4700 3050 3490 3050
Connection ~ 4700 3050
Wire Wire Line
	3490 3050 3490 3800
Text Notes 6780 4750 0    50   ~ 0
DE9M-DE9F extension cable\nCut off female plug.\nSolder wires to J1.\nMatch numbers on pcb silkscreen\nto pin numbers on male connector.
Wire Wire Line
	4500 3800 4100 3800
Wire Wire Line
	4900 3900 4100 3900
Wire Wire Line
	4500 4400 4900 4400
Wire Wire Line
	4500 4000 4100 4000
Wire Wire Line
	4500 4000 4500 4400
Text Notes 7230 3130 0    100  ~ 0
Z88
Text Notes 7170 3520 0    50   ~ 0
DE9 Male
Text Notes 7270 3640 0    50   ~ 0
7 SG
Text Notes 7270 3740 0    50   ~ 0
5 CTS
Text Notes 7270 3840 0    50   ~ 0
9 DTR
Text Notes 7270 3940 0    50   ~ 0
4 RTS
Text Notes 7260 4040 0    50   ~ 0
8 DCD
Text Notes 7270 4140 0    50   ~ 0
2 TX
Text Notes 7270 4240 0    50   ~ 0
3 RX
$EndSCHEMATC
