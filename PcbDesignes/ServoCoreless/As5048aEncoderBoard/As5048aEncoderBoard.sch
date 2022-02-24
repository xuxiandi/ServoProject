EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L AS5048A-HTSP-500:AS5048A-HTSP-500 U1
U 1 1 5D656ED1
P 3400 2600
F 0 "U1" H 3400 3367 50  0000 C CNN
F 1 "AS5048A-HTSP-500" H 3400 3276 50  0000 C CNN
F 2 "SOP65P640X120-14N" H 3400 2600 50  0001 L BNN
F 3 "AS5048B Series 360° 3.3 / 5 V 14 bit Magnetic Rotary Encoder - TSSOP-14" H 3400 2600 50  0001 L BNN
F 4 "AS5048A-HTSP-500" H 3400 2600 50  0001 L BNN "Field4"
F 5 "TSSOP-14 ams" H 3400 2600 50  0001 L BNN "Field5"
F 6 "Unavailable" H 3400 2600 50  0001 L BNN "Field6"
F 7 "None" H 3400 2600 50  0001 L BNN "Field7"
F 8 "ams" H 3400 2600 50  0001 L BNN "Field8"
	1    3400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2700 2700 2700
Wire Wire Line
	2700 2700 2700 3450
Wire Wire Line
	2700 3450 4000 3450
Wire Wire Line
	4000 3450 4000 3200
Wire Wire Line
	4000 2200 4100 2200
Wire Wire Line
	4100 2200 4100 2100
Wire Wire Line
	4100 2100 4000 2100
$Comp
L power:+3.3V #PWR0101
U 1 1 5D65700D
P 4100 2100
F 0 "#PWR0101" H 4100 1950 50  0001 C CNN
F 1 "+3.3V" H 4115 2273 50  0000 C CNN
F 2 "" H 4100 2100 50  0001 C CNN
F 3 "" H 4100 2100 50  0001 C CNN
	1    4100 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5D657039
P 4000 3450
F 0 "#PWR0102" H 4000 3200 50  0001 C CNN
F 1 "GND" H 4005 3277 50  0000 C CNN
F 2 "" H 4000 3450 50  0001 C CNN
F 3 "" H 4000 3450 50  0001 C CNN
	1    4000 3450
	1    0    0    -1  
$EndComp
Connection ~ 4000 3450
Connection ~ 4100 2100
$Comp
L power:+3.3V #PWR0103
U 1 1 5D65A1F1
P 1850 1650
F 0 "#PWR0103" H 1850 1500 50  0001 C CNN
F 1 "+3.3V" V 1865 1778 50  0000 L CNN
F 2 "" H 1850 1650 50  0001 C CNN
F 3 "" H 1850 1650 50  0001 C CNN
	1    1850 1650
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5D65A431
P 1850 1800
F 0 "#PWR0104" H 1850 1550 50  0001 C CNN
F 1 "GND" V 1855 1672 50  0000 R CNN
F 2 "" H 1850 1800 50  0001 C CNN
F 3 "" H 1850 1800 50  0001 C CNN
	1    1850 1800
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 GND1
U 1 1 5D65C7B4
P 1650 1800
F 0 "GND1" H 1811 1811 50  0000 C CNN
F 1 "Conn_01x01" H 1570 1926 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1650 1800 50  0001 C CNN
F 3 "~" H 1650 1800 50  0001 C CNN
	1    1650 1800
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 Sc1
U 1 1 5D65C92D
P 1650 1950
F 0 "Sc1" H 1811 1929 50  0000 C CNN
F 1 "Conn_01x01" H 1570 2076 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1650 1950 50  0001 C CNN
F 3 "~" H 1650 1950 50  0001 C CNN
	1    1650 1950
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 Clk1
U 1 1 5D65CA8A
P 1650 2100
F 0 "Clk1" H 1811 2087 50  0000 C CNN
F 1 "Conn_01x01" H 1570 2226 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1650 2100 50  0001 C CNN
F 3 "~" H 1650 2100 50  0001 C CNN
	1    1650 2100
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 di1
U 1 1 5D65CBE9
P 1650 2250
F 0 "di1" H 1811 2244 50  0000 C CNN
F 1 "Conn_01x01" H 1570 2376 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1650 2250 50  0001 C CNN
F 3 "~" H 1650 2250 50  0001 C CNN
	1    1650 2250
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 do1
U 1 1 5D65CD52
P 1650 2400
F 0 "do1" H 1811 2402 50  0000 C CNN
F 1 "Conn_01x01" H 1570 2526 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1650 2400 50  0001 C CNN
F 3 "~" H 1650 2400 50  0001 C CNN
	1    1650 2400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2800 2100 2800 1950
Wire Wire Line
	2800 1950 1850 1950
Wire Wire Line
	2800 2200 2300 2200
Wire Wire Line
	2300 2200 2300 2100
Wire Wire Line
	2300 2100 1850 2100
Wire Wire Line
	2800 2400 2250 2400
Wire Wire Line
	2250 2400 2250 2250
Wire Wire Line
	2250 2250 1850 2250
Wire Wire Line
	2800 2500 2150 2500
Wire Wire Line
	2150 2500 2150 2400
Wire Wire Line
	2150 2400 1850 2400
$Comp
L Device:C C1
U 1 1 5D66594B
P 4250 2400
F 0 "C1" H 4365 2446 50  0000 L CNN
F 1 "C" H 4365 2355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4288 2250 50  0001 C CNN
F 3 "~" H 4250 2400 50  0001 C CNN
	1    4250 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3200 4250 3200
Wire Wire Line
	4250 3200 4250 2550
Connection ~ 4000 3200
Wire Wire Line
	4250 2250 4250 2100
Wire Wire Line
	4250 2100 4100 2100
$Comp
L Connector_Generic:Conn_01x01 3.3v1
U 1 1 5D65C4F9
P 1650 1650
F 0 "3.3v1" H 1811 1693 50  0000 C CNN
F 1 "Conn_01x01" H 1570 1776 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 1650 1650 50  0001 C CNN
F 3 "~" H 1650 1650 50  0001 C CNN
	1    1650 1650
	-1   0    0    -1  
$EndComp
$EndSCHEMATC