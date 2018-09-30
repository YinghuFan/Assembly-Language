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
    
    MOV CL,10
    
    MOV AH,1
    INT 21H
    
    SUB AL,48
    MOV AH,0
    MUL CL
    
    MOV BX,AX
    
    MOV AH,1
    INT 21H
    
    SUB AL,48
    MOV AH,0
    ADD AX,BX
    MUL CL
    
    MOV BX,AX
    
    MOV AH,1
    INT 21H
    
    SUB AL,48
    MOV AH,0
    ADD AX,BX
    
    CALL OUT1
    
    MOV AH,4CH
    INT 21H
    
    OUT1 PROC
    
    MOV CL,10
    MOV CH,0
    
L0:
    CMP AX,10
    JB PRINT_SINGLE
    
    DIV CL;SHANG AL,YUSHU AH
    PUSH AX
    ADD CH,1
    MOV AH,0
    JMP L0
    
PRINT_SINGLE:
	MOV DL,AL
	ADD DL,48
	MOV AH,2
	INT 21H
	JMP POP_AGAIN
	
POP_AGAIN:
	CMP CH,0
	JE OVER
	POP DX
	SUB CH,1
	MOV DL,DH
	ADD DL,48
	MOV AH,2
	INT 21H
	JMP POP_AGAIN
	
OVER:    
    
    RET
    OUT1 ENDP
    
CODES ENDS
    END START
