; bounce-back mas agora das extremidades
; Mesma logica do bate-volta original, mas com dois ponteiros
ORG 0000H
    LJMP INICIO

; ------------------------------------------------------------
; Programa Principal
; ------------------------------------------------------------
ORG 0030H
INICIO:
    MOV R2, #01H    ; Ponteiro 1: bit 0 (extremidade direita)
    MOV R3, #80H    ; Ponteiro 2: bit 7 (extremidade esquerda)

; --- Fase 1: R2 vai p/ esquerda (RL), R3 vai p/ direita (RR) ---
DESLOCA_ESQ:
    ; Combina os dois ponteiros e envia para P1
    MOV A, R2
    ORL A, R3
    MOV P1, A
    LCALL DELAY
    XRL A, R3
    MOV P1, A
    LCALL DELAY

    XRL A, R3
    MOV P1, A
    LCALL DELAY
    
    ; Rotaciona ponteiro 1 para esquerda
    MOV A, R2
    RL A
    MOV R2, A

    ; Rotaciona ponteiro 2 para direita
    MOV A, R3
    RR A
    MOV R3, A

    ; R2 chegou em 80H? (extremidade oposta)
    MOV A, R2
    CJNE A, #80H, DESLOCA_ESQ

; --- Fase 2: R2 volta p/ direita (RR), R3 volta p/ esquerda (RL) ---
DESLOCA_DIR:
    ; Combina os dois ponteiros e envia para P1
    MOV A, R2
    ORL A, R3
    MOV P1, A
    LCALL DELAY
    XRL A, R3
    MOV P1, A
    LCALL DELAY

    XRL A, R3
    MOV P1, A
    LCALL DELAY

    ; Rotaciona ponteiro 1 de volta (direita)
    MOV A, R2
    RR A
    MOV R2, A

    ; Rotaciona ponteiro 2 de volta (esquerda)
    MOV A, R3
    RL A
    MOV R3, A

    ; R2 voltou a 01H? (extremidade original)
    MOV A, R2
    CJNE A, #01H, DESLOCA_DIR

    SJMP DESLOCA_ESQ ; Reinicia o ciclo (bate-e-volta continuo)

DELAY:
    MOV R0, #200  ; Contador externo (simulacao: #2)

DELAY1:
    MOV R1, #200	    ; Contador interno (simulacao: #2)

DELAY2:
    DJNZ R1, DELAY2
    DJNZ R0, DELAY1
    RET

END


