; Archivo: macro_puertos.asm
    PROCESSOR 16F877A
    #include <xc.inc>

;================== MACRO DE TOGGLE LED ====================
#define TOGGLE_LED(pin) \
    MOVF PORTB, W \
    XORLW 1 << pin \
    MOVWF PORTB

;========================= MAIN =============================
PSECT main, class=CODE, reloc=2
    org 0x00

    BANKSEL TRISB
    CLRF TRISB
    BANKSEL PORTB
    CLRF PORTB

loop:
    TOGGLE_LED(2)     ; Cambia estado del pin RB2
    CALL delay
    GOTO loop

;======================= SUBRUTINA ==========================
delay:
    MOVLW 0xFF
    MOVWF cont1
d1:
    MOVLW 0xFF
    MOVWF cont2
d2:
    NOP
    DECFSZ cont2, f
    GOTO d2
    DECFSZ cont1, f
    GOTO d1
    RETURN

;======================== VARIABLES =========================
    CBLOCK 0x20
        cont1
        cont2
    ENDC
