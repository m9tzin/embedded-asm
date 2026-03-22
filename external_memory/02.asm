; Matheus Sousa Marinho
; 2. Faça um programa em Assembly 8051 que identifique, ao final do programa, no registrador A (Acumulador), quantas vezes o byte “C4H” aparece na faixa de endereços de 30H à 40H (inclusive) e na faixa de endereços de 50H à 60H (inclusive)

ORG 0000H
    MOV R7, #00H ; contador de vezes que o byte C4H aparece
    MOV R0, #30H ; primeiro endereço da faixa de endereços de 30H à 40H (inclusive)
VOLTA1:
    MOV A, @R0 ; move o byte da posição apontada por R0 para o acumulador
    CJNE A, #C4H, PULA1 ; compara o byte do acumulador com o byte C4H
    INC R7 ; incrementa o contador de vezes que o byte C4H aparece
PULA1:
    INC R0
    CJNE R0, #41H, VOLTA1 
    MOV R0, #50H ; primeiro endereço da faixa de endereços de 50H à 60H (inclusive)
VOLTA2:
    MOV A, @R0 ; move o byte da posição apontada por R0 para o acumulador
    CJNE A, #C4H, PULA2 ; compara o byte do acumulador com o byte C4H
    INC R7 ; incrementa o contador de vezes que o byte C4H aparece
PULA2:
    INC R0
    CJNE R0, #61H, VOLTA2 ; compara o ponteiro com o último endereço da faixa de endereços de 50H à 60H (inclusive)
    MOV A, R7 ; move o contador de vezes que o byte C4H aparece para o acumulador
END