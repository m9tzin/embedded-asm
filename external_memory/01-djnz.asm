; Matheus Sousa Marinho
; 1. Faça um programa em Assembly 8051 que zere a posição de memória compreendida entre os endereços 30H e 7FH (inclusive) da RAM interna do 8051.
; Utilizando a instrução DJNZ.
ORG 0000H
    MOV R0, #30H      ; primeiro endereco da faixa
    MOV R1, #50H      ; quantidade de bytes: 7FH - 30H + 1 = 50H
VOLTA:
    MOV @R0, #00H     ; escreve 0 na posicao apontada por R0
    INC R0            ; incrementa R0
    DJNZ R1, VOLTA    ; repete ate zerar os 80 bytes da faixa
FIM:
    SJMP FIM
END
