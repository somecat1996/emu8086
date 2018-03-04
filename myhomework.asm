data_seg segment
    ;A DW 000001H, 000003H, 000002H
    ;A DW 0087FH, 0EA92H, 00DABH, 0E5D0H, 0ADBAH, 043C8H, 01B67H, 0422EH, 040D7H, 05F6AH, 0D963H, 0546EH, 0554CH, 0C2F7H, 02648H, 0C405H, 0685CH, 0DCDCH, 02711H, 02F3CH, 0FC81H, 07D9AH, 0EF91H, 0C876H, 022FAH, 0620FH, 01798H, 02EAFH, 0BCC4H, 06454H, 0D943H, 0E4C8H, 0086FH, 07E1EH, 0FF0EH, 01826H, 06479H, 00F28H, 0E7BEH, 0C4F3H, 0DDEDH, 01B55H, 02E38H, 0986EH, 0200AH, 06024H, 03C1AH, 0C061H, 0A54BH, 07709H
    ;A DW 062A7H, 07D5BH, 04B3EH, 03DF4H, 093F0H, 0B05CH, 023DFH, 0D0F6H, 06692H, 0629AH, 0D1FFH, 09CB9H, 0D7AEH, 08BA5H, 02B15H, 0F2A3H, 04697H, 0A4EDH, 0243AH, 01321H, 02148H, 0FCD8H, 07316H, 09E11H, 0D13FH, 00530H, 0C099H, 0D743H, 05E77H, 0EFE9H, 0E2CFH, 068AEH, 0BF10H, 05CABH, 0600EH, 004E8H, 0A957H, 0FEA1H, 0FC9FH, 00A2CH, 037C7H, 087F3H, 015D0H, 081EFH, 0B38EH, 02CD3H, 084C4H, 04199H, 0F2FEH, 0E549H
    A DW 06AD0H, 0E338H, 04CD4H, 0BDB0H, 07514H, 0211BH, 017E1H, 058EAH, 0D575H, 035CCH, 0E0ACH, 00572H, 04326H, 0F410H, 04E53H, 0FEE9H, 0D020H, 0037DH, 07374H, 0EBC5H, 0382BH, 099C5H, 0AC7AH, 04A9DH, 07D55H, 02672H, 0388DH, 032A5H, 00991H, 0DE6BH, 0C88FH, 0238BH, 03B9EH, 03373H, 04CCAH, 0490BH, 0A2BEH, 067A7H, 08BD2H, 0FB0EH, 07915H, 0CAC5H, 01799H, 0721EH, 00B9BH, 0A91CH, 0BD31H, 0C97BH, 0AE29H, 0F9C8H
data_seg ends 

stack_seg segment
    ST DW 100 DUP(0)
    TOP EQU 200
stack_seg ends

code_seg segment
    assume cs:code_seg, ds:data_seg, ss:stack_seg
start:
    MOV AX, stack_seg
    MOV SS, AX
    MOV SP, TOP
    MOV AX, data_seg
    MOV DS, AX
    MOV AX, 0D
    MOV BX, 98D
    
    CALL quicksort
    
    MOV AX, 4C00H
    INT 21H
    
quicksort proc near
    PUSH AX
    PUSH BX
    PUSH SI
    
    MOV SI, SP
    MOV DX, BX
    SUB DX, AX
    JZ LABEL7
    JS LABEL7
    LABEL2:
    MOV DX, [BX]
    XCHG AX, BX
    SUB DX, [BX]
    XCHG AX, BX
    JS LABEL1
    SUB BX, 2D
    MOV DX, BX
    SUB DX, AX
    JZ LABEL5
    JS LABEL7
    JMP LABEL2
    LABEL1:
    MOV DX, [BX]
    XCHG AX, BX
    XCHG DX, [BX]
    XCHG AX, BX
    MOV [BX], DX
    LABEL4: 
    MOV DX, [BX]
    XCHG AX, BX
    SUB DX, [BX]
    XCHG AX, BX
    JS LABEL3
    ADD AX, 2D
    MOV DX, BX
    SUB DX, AX
    JZ LABEL5
    JS LABEL7
    JMP LABEL4
    LABEL3:
    MOV DX, [BX]
    XCHG AX, BX
    XCHG DX, [BX]
    XCHG AX, BX
    MOV [BX], DX
    JMP LABEL2
    LABEL5:
    PUSH AX
    MOV SI, SP
    MOV AX, SS:[SI+6]
    SUB BX, 2
    MOV DX, BX
    SUB DX, AX
    JZ LABEL6
    JS LABEL6
    CALL quicksort
    LABEL6:
    POP AX
    ADD AX, 2
    MOV SI, SP
    MOV BX, SS:[SI+2]
    MOV DX, BX
    SUB DX, AX
    JZ LABEL7
    JS LABEL7
    CALL quicksort
    LABEL7:     
     
    POP SI
    POP BX
    POP AX
    RET
quicksort endp
code_seg ends
end start