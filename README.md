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
As seen from the schematic diagram, a transistor was included for both LDRs for stabilized signal sent to the microcontroller to either only 5V(HIGH) or 0V(LOW).
#### ![Schematic Diagram](https://github.com/wongddl/Counter-ASM/blob/main/Images/UPDOWN%20schematic.jpg)
###### Diagram by: Jan Tan

## Programming
Program starts with a loop where checker pins `Rb4 & Rb7` are triggered when the LDRs (can be replaced with SPST switches for easier diagnosing) are hovered over to check of which order from L2R or R2L where it will then proceed in the sequence to either `COUNTUP` or `COUNTDOWN`. The Output of the microcontroller a total of 8-bits, as mentioned before, those are 4-bits from TENS and the other 4-bits from ONES.
#### INPUT PINS
###### LDR1: `Rb6`, LDR2: `Rb7`
#### OUTPUT PINS
###### CHECKERPIN1: `Rb4`, CHECKERPIN2: `Rb5`
###### TENS: `Rb3`, `Rb2`,`Rb1`,`Rb0`
###### ONES: `Ra3`, `Ra2`,`Ra1`,`Ra0`

### INPUT CONCEPT
#### ![Counter input algorithm](https://github.com/wongddl/Counter-ASM/blob/main/Images/COUNTER.jpeg)
### OUTPUT CONCEPT
#### ![Counter output algorithm](https://github.com/wongddl/Counter-ASM/blob/main/Images/OUTPUT.jpeg)

###### Flowchart by: Dante


## CREDITS
This project thrives on collaborative efforts and embraces the open-source spirit. We believe in the value of open-source contributions and encourage those who utilize our work to reciprocate by adopting similar open-source practices.

