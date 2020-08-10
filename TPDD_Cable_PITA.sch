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
L Connector:DB25_Male J2
U 1 1 5F2D078E
P 6600 3600
F 0 "J2" H 6960 3680 50  0000 L CNN
F 1 "DB25_Male" H 6800 3600 50  0000 L CNN
F 2 "000_LOCAL:DSUB-25_Male_EdgeMount_P2.77mm" H 6600 3600 50  0001 C CNN
F 3 " ~" H 6600 3600 50  0001 C CNN
	1    6600 3600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:DTA114E Q1
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
L Transistor_BJT:DTA114E Q2
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
L Transistor_BJT:DTA114E Q3
U 1 1 5F2E424E
P 5100 4300
F 0 "Q3" V 4940 4550 50  0000 C CNN
F 1 "DTA114EKA" V 5020 4660 50  0000 C CNN
F 2 "000_LOCAL:SC-59" H 5100 4300 50  0001 L CNN
F 3 "https://www.rohm.com/datasheet/DTA114EEB/dta114eebtl-e" H 5100 4300 50  0001 L CNN
	1    5100 4300
	0    1    1    0   
$EndComp
Text Label 4000 3500 0    50   ~ 0
GND
Text Label 4000 3600 0    50   ~ 0
RTS
Text Label 4000 3700 0    50   ~ 0
DSR_TTL
Text Label 4000 3800 0    50   ~ 0
CTS_TTL
Text Label 4000 3900 0    50   ~ 0
DTR
Text Label 4000 4000 0    50   ~ 0
RXD_TTL
Text Label 4000 4100 0    50   ~ 0
TXD
Text Label 6300 4600 2    50   ~ 0
TXD
Text Label 6300 4400 2    50   ~ 0
RXD
Text Label 6300 4200 2    50   ~ 0
RTS
Text Label 6300 4000 2    50   ~ 0
CTS
Text Label 6300 3800 2    50   ~ 0
DSR
Text Label 6300 3600 2    50   ~ 0
GND
Text Label 6300 3500 2    50   ~ 0
DTR
Wire Wire Line
	4700 3400 4900 3400
Wire Wire Line
	4700 4400 4900 4400
Wire Wire Line
	4800 4050 5100 4050
Text Notes 6940 5180 2    100  ~ 0
Model 100
Text Notes 4100 4400 2    100  ~ 0
TPDD
$Comp
L 000_LOCAL:WirePads_01x07 J1
U 1 1 5F2DD465
P 3800 3800
F 0 "J1" H 3800 4400 50  0000 C CNN
F 1 "7 x wire pads" H 3800 4300 50  0000 C CNN
F 2 "000_LOCAL:pins_1x7_2mm" H 3800 3800 50  0001 C CNN
F 3 "~" H 3800 3800 50  0001 C CNN
	1    3800 3800
	-1   0    0    -1  
$EndComp
Text Label 4900 4400 2    50   ~ 0
RXD_TTL
Text Label 4900 3900 2    50   ~ 0
CTS_TTL
Text Label 4900 3400 2    50   ~ 0
DSR_TTL
Text Label 5300 3400 0    50   ~ 0
DSR
Text Label 5300 3900 0    50   ~ 0
CTS
Text Label 5300 4400 0    50   ~ 0
RXD
Wire Wire Line
	5100 3550 4800 3550
Wire Wire Line
	4800 3550 4800 4050
Wire Wire Line
	4000 3900 4400 3900
Wire Wire Line
	4400 3900 4400 2900
Wire Wire Line
	4000 3500 4500 3500
Wire Wire Line
	4000 4100 4400 4100
Wire Wire Line
	4000 4000 4700 4000
Wire Wire Line
	4700 4000 4700 4400
Wire Wire Line
	4000 3600 4500 3600
Wire Wire Line
	4000 3700 4700 3700
Wire Wire Line
	4700 3700 4700 3400
Wire Wire Line
	4400 2900 6000 2900
Wire Wire Line
	5300 3400 5800 3400
Wire Wire Line
	4000 3800 4700 3800
Wire Wire Line
	4700 3800 4700 3900
Wire Wire Line
	4700 3900 4900 3900
Wire Wire Line
	4500 3600 4500 4500
Wire Wire Line
	4500 4500 6000 4500
Wire Wire Line
	6000 4500 6000 4200
Wire Wire Line
	4400 4100 4400 4600
Wire Wire Line
	4400 4600 6300 4600
Wire Wire Line
	5300 4400 6300 4400
Wire Wire Line
	6300 4200 6000 4200
Wire Wire Line
	5300 3900 5700 3900
Wire Wire Line
	5700 3900 5700 4000
Wire Wire Line
	5700 4000 6300 4000
Wire Wire Line
	6300 3800 5800 3800
Wire Wire Line
	5800 3400 5800 3800
Wire Wire Line
	5900 3600 6300 3600
Wire Wire Line
	6000 2900 6000 3500
Wire Wire Line
	6000 3500 6300 3500
Wire Wire Line
	5900 3000 5900 3600
Wire Wire Line
	4500 3000 4500 3500
Wire Wire Line
	4800 3550 4800 3050
Wire Wire Line
	4800 3050 5100 3050
Connection ~ 4800 3550
Wire Wire Line
	4500 3000 4800 3000
Wire Wire Line
	4800 3050 4800 3000
Connection ~ 4800 3050
Connection ~ 4800 3000
Wire Wire Line
	4800 3000 5900 3000
$EndSCHEMATC
