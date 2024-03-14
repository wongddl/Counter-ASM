# Counter-ASM
Swipeable Counter (00-99) with Light Dependent Resistors (LDRs) and 7-Segment Display (PIC16F84A Assembly).

## Introduction
This project is in Partial Fulfillment of the requirements for the degree in Bachelor of Science in Electronics Engineering.
###### Group Project by: `Jan Tan`, `Jay Villalon`, `Dante Wong de Lumen`, `Hugh Segovia`, `John Ombi-on`

## Objective
Design a system that counts from 00 to 99 using two 7-segment displays. The user can increment and decrement the counter by swiping their hand across Light Dependent Resistors (LDRs) with motion Left to Right (COUNTUP) or Right to Left (COUNTDOWN).

## Major Components
##### PIC16f84A
8-bit microcontroller used to program/control the project
##### Two LDRs
Used as input to the microcontroller
##### Two SN74LS47N
BCD (Binary Coded Decimal) to 7-Segment Decoder/Driver IC
##### Two 7-segment displays
Used as display the final output of the project

## Hardware
![Schematic Diagram](https://github.com/wongddl/Counter-ASM/blob/main/Images/UPDOWN%20schematic.jpg)

## Programming
Program starts with bits stored to our checker pins to check of which order of LDR is hovered over where it will then proceed in the sequence to either `COUNTUP` or `COUNTDOWN`. The Output of the microcontroller a total of 8-bits, as mentioned before, those are 4-bits from TENS and the other 4-bits from ONES.
#### INPUT PINS
###### LDR1: `Rb6`, LDR2: `Rb7`
#### OUTPUT PINS
###### CHECKERPIN1: `Rb4`, CHECKERPIN2: `Rb5`
###### TENS: `Rb3`, `Rb2`,`Rb1`,`Rb0`
###### ONES: `Ra3`, `Ra2`,`Ra1`,`Ra0
![Counter input algorithm](https://github.com/wongddl/Counter-ASM/blob/main/Images/COUNTER.jpeg)


## CREDITS
This application uses Open Source components. You can find the source code of his
open source projects along with license information below. I acknowledge and is 
grateful to the developer for their contributions to open source.


