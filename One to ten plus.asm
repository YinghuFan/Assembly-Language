DATAS SEGMENT
    ;此处输入数据段代码  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
    
    MOV AH,0;SUM
    MOV AL,1;PLUS
    
L0:
    CMP AL,10
    JA L1
    
    ADD AH,AL
    ADD AL,1
    JMP L0
    
L1:
	MOV AL,AH
	MOV AH,0
	MOV CL,10
	MOV CH,0
	CMP AX,10
	JB L2
	
DIVAGAIN:	
	DIV CL
	PUSH AX
	ADD CH,1
	CMP AX,10
	JB L2
	
	MOV AH,0
	JMP DIVAGAIN
L2:
	MOV DL,AL
	ADD DL,48
	MOV AH,2
	INT 21H
	
GETAGAIN:
	CMP CH,0
	JE OVER
	POP DX
	MOV DL,DH
	MOV AH,2
	INT 21H
	SUB CH,1
	JMP GETAGAIN

OVER:	
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
