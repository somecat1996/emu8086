MOV AX, 2000H
MOV DS, AX
MOV SS, AX
MOV BX, 2050H
MOV SI, BX
MOV DI, 3050H
MOV SI, DI
MOV SP, 5FFFH
MOV CL, 25
MOV BL, CL
MOV AH, 0F0H
MOV CH, AH
MOV BYTE PTR [DI], 64
MOV WORD PTR [SI], 256
MOV DL, [SI+1]
MOV DH, 1[SI]    
MOV WORD PTR [BX][SI], 34H
MOV [BX+SI+4], BX
MOV BP, 2[BX+DI]
MOV [BP][DI], BX
MOV AX, [BP][DI]
MOV BL, AL
MOV ES, BX
PUSH BX
PUSH DI
POP CX
POP DX
XCHG AX, BP
XCHG DH, BL
SAHF
CMC
LAHF
STD
CLI                                         