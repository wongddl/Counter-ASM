#include "p16f84a.inc"
    

 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF

    org     0x00
    
STATUS	       equ       0x03
TRISA          equ       0x85
TRISB          equ       0x86
PORTA          equ       0x05
PORTB          equ       0x06
ONES           equ       0x08    ;ONES
TENS           equ       0x09    ;tens
COUNT3         equ       0x0C
COUNT4         equ       0x0D

    movlw       0x00
    movwf       PORTA
    movwf       PORTB


    goto        Main    


; ---------------- SETUP PORTS ---------------- ;

MAIN_PROG CODE


Main
    bsf     STATUS,5
    movlw   0x00
    movwf   TRISA
    movlw   0xC0
    movwf   TRISB
    bcf     STATUS,5


; ---------------- BEGINNING OF PROGRAM ---------------- ;
BENINGING
    call    CLEARPORTS
    goto    ldr_check1

ldr_check1
    btfss   PORTB,6                     ;checks switch1;
    goto    ldr_check2                  ;if switch1 == 0, checks switch2;
    goto    loopie

loopie   
    call    checkerPort1                ;if switch1 == 1, turns on checker port 1 then...;
    btfss   PORTB,7                     ;checks switch2;
    goto    loopie                      ;if switch2 == 0, loops back to check switch2 again;
    call    checkerPort2                ;if switch2 == 1, turns on checker port 2;
    goto    upCount                     ;then counts up;

ldr_check2
    btfss   PORTB,7                     ;checks switch2;
    goto    ldr_check1                  ;if switch2 == 0, checks switch1;
    goto    loopie2

loopie2 
    call    checkerPort2                ;if switch2 == 1, turns on checker port 2 then...;
    btfss   PORTB,6                     ;checks switch1;
    goto    loopie2                     ;if switch2 == 0, loops back to check switch1 again;
    call    checkerPort1                ;if switch2 == 1, turns on checker port 1 then...;
    goto    downCount


; ---------------- checker ports ---------------- ;
CLEARPORTS
    bcf     PORTB,4
    bcf     PORTB,5
    return

checkerPort1                            
    bsf     PORTB,4
    return

checkerPort2
    bsf     PORTB,5
    return                                             

; ---------------- COUNT FUNCTIONS ---------------- ;  
upCount
    movlw   0x09
    xorwf   ONES,0                          ;compares ONES to 1001(nine)
    btfsc   STATUS,2                      ;1 = equal, 0 = unequal
    goto    up1                         ; if ONES is 9 go #1
    goto    up2                         ; if ONES is not 9 go #2

downCount
    movlw   0x00
    xorwf   ONES,0                          ;compares ONES to 0000(zero)
    btfsc   STATUS,2                      ;1 = equal, 0 = unequal
    goto    down1                        ; if ONES is zero go #1
    goto    down2                        ; if ONES is not zero go #2

; -------- SUBCOUNT FUNCTIONS --------;
up1
    clrf    ONES
    movlw   0x09
    xorwf   TENS,0
    btfsc   STATUS,2                      ;compares TENS to 1001(nine)
    goto    up3                        ; if TENS is zero go #3
    goto    up4                        ; if TENS is not zero go #4
up2
    incf    ONES,1                        ;increments ONES then place into "w"
    goto    TURNON
up3
    movlw   0x00
    movwf   TENS
    goto    TURNON
up4
    incf    TENS,1
    goto    TURNON
; --  -- ;
down1
    movlw   0x09
    movwf   ONES      
    movlw   0x00
    xorwf   TENS,0                         ; W (xor) TENS
    btfsc   STATUS,2                      ;compares TENS to 0000(zero)
    goto    down3                        ; if TENS is zero go #3
    goto    down4                        ; if TENS is not zero go #4
down2
    decf    ONES,1                        ;decrement ONES then place into "w"
    goto    TURNON
down3
    movlw   0x09
    movwf   TENS
    goto    TURNON
down4
    decf    TENS,1
    goto    TURNON

; ---------------- SWITCH ON SUBROUTINE ---------------- ;   
TURNON                                  ;sends TENS and ONES value to PORTB and PORTA respectively
;- TENS -;
    movf    TENS,0
    movwf   PORTB
    call    DELAY
;- ONES -;
    movf    ONES,0
    movwf   PORTA
    call    DELAY

    goto    BENINGING

; ---------------- DELAYS SUBROUTINE ---------------- ;

DELAY
delay_loops	decfsz	COUNT3,1
		goto	delay_loops
		decfsz	COUNT4,1
		goto	delay_loops
		
	return

    END
