; Archivo: macro_inicio.asm
    PROCESSOR 16F877A
    #include <xc.inc>

;====================== MACRO DE INICIO ======================
#define INICIO() \
    BANKSEL TRISB ; Selecciona el banco para configurar TRISB \
    CLRF TRISB     ; Puerto B como salida \
    BANKSEL PORTB  ; Regresa a banco de PORTB \
    CLRF PORTB     ; Limpia el puerto B

;========================= MAIN =============================
PSECT main, class=CODE, reloc=2
    org 0x00

    INICIO()      ; Llama a la macro de inicialización

loop:
    BSF PORTB, 0  ; Enciende LED en RB0
    GOTO loop     ; Bucle infinito
