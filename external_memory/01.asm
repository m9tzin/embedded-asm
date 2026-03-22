; Matheus Sousa Marinho
ORG 0000H
    MOV R0, #30H      ; primeiro endereco da faixa
    MOV R7, #32       ; 4FH - 30H + 1 = 32 bytes (20H)
ZERA:
    MOV @R0, #00H     ; escreve 0 na posicao apontada por R0
    INC R0
    DJNZ R7, ZERA
FIM:
    SJMP FIM          ; encerra em loop (substituir por retorno se for sub-rotina)

END
