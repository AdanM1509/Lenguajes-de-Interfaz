; Archivo: macro_temporizacion.asm
    PROCESSOR 16F877A
    #include <xc.inc>

;==================== MACRO DE RETARDO ======================
#define RETARDO_MS() \
    MOVLW 0xFF    ; Valor alto para retardo \
    MOVWF cont1   \
ret1: \
    MOVLW 0xFF    \
    MOVWF cont2   \
ret2: \
    NOP \
    DECFSZ cont2, f \
    GOTO ret2 \
    DECFSZ cont1, f \
    GOTO ret1

;==================== VARIABLES =============================
    CBLOCK 0x20
        cont1
        cont2
    ENDC

;========================= MAIN =============================
PSECT main, class=CODE, reloc=2
    org 0x00

    BANKSEL TRISB
    CLRF TRISB
    BANKSEL PORTB
    CLRF PORTB

loop:
    BSF PORTB, 1
    RETARDO_MS()
    BCF PORTB, 1
    RETARDO_MS()
    GOTO loop
