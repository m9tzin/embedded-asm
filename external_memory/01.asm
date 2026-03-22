; Matheus Sousa Marinho
; 1. Faça um programa em Assembly 8051 que zere a posição de memória compreendida entre os endereços 30H e 4FH (inclusive) da RAM interna do 8051.

ORG 0000H
    MOV R0, #30H      ; primeiro endereco da faixa
VOLTA:
    MOV @R0, #00H     ; escreve 0 na posicao apontada por R0
    INC R0
    CJNE R0, #80H, VOLTA
END
