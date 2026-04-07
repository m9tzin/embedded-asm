ORG 0000H           ; Vetor de reset
    LJMP INICIO     ; Pula para o inicio do programa

; ------------------------------------------------------------
; Programa Principal
; ------------------------------------------------------------
ORG 0030H
INICIO:
    MOV A, #01H     ; Acumul. = 0000 0001b -> LED1 aceso

DESLOCA_ESQ:
    MOV P1, A       ; Envia padrao para os LEDs
    LCALL DELAY     ; Aguarda ~0,1 seg
    RL A            ; Rotaciona para a esquerda
    CJNE A, #80H, DESLOCA_ESQ  ; Repete ate chegar no LED8 (1000 0000b)

DESLOCA_DIR:
    MOV P1, A       ; Envia padrao para os LEDs
    LCALL DELAY     ; Aguarda ~0,1 seg
    RR A            ; Rotaciona para a direita
    CJNE A, #01H, DESLOCA_DIR  ; Repete ate voltar ao LED1 (0000 0001b)

    SJMP DESLOCA_ESQ ; Reinicia o ciclo (bate-e-volta continuo)

; ------------------------------------------------------------
; Sub-rotina DELAY  (~100 ms para clock de 12 MHz)
;
; Calculo:
;   Loop interno: DJNZ R1 = 2 ciclos x 250 = 500 us
;   Loop externo: repete 200 vezes -> 200 x 500 us = 100.000 us
;                                                    = 100 ms
; ------------------------------------------------------------
DELAY:
    MOV R0, #200    ; Contador externo = 200

DELAY1:
    MOV R1, #250    ; Contador interno = 250

DELAY2:
    DJNZ R1, DELAY2 ; Decrementa R1 ate zero (loop interno)
    DJNZ R0, DELAY1 ; Decrementa R0 ate zero (loop externo)
    RET              ; Retorna da sub-rotina

END
