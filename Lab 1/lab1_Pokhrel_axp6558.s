.global add64
.global sub64
.global minU8
.global minS8
.global isLessThanU32
.global isLessThanS32
.global shiftLeftU32
.global shiftU32
.global shiftS32
.global isEqualU16
.global isEqualS16
.global stringCopy
.global stringCat

.text

@ Apar Pokhrel, 1001646558

add64:
    ADDS R0, R0, R2
	ADC R1, R1, R3
	BX LR

sub64:
	SUBS R0, R0, R2
	SBC R1, R1, R3    @ subtract  with carry
	BX LR
    

minU8:
	CMP R0, R1
	BMI loop_minU
	MOV R0, R1
loop_minU:
	BX LR

	
minS8:
	CMP R0, R1
	BMI loop_minS
	MOV R0, R1
loop_minS:
	BX LR



isLessThanU32:
	CMP R0, R1
	MOV R0, #1
	BMI loop_lessU
	MOV R0, #0
loop_lessU:
	BX LR


isLessThanS32:
	CMP R0, R1
	MOV R0, #1
	BMI loop_lessS
	MOV R0, #0
loop_lessS:
	BX LR



shiftLeftU32:
	MOV R0, R0, LSL R1
	BX LR


shiftU32:
	CMP R1, #0
	MOV R4, R1
	MOV R3, R0
	MOV R2, #0
	SUB R1, R2, R1
	MOV R0, R3, ASR R1
	BMI loop_shiftU
	MOVPL R0, R3, LSL R4
loop_shifU:
	BX LR


shiftS32:
	CMP R1, #0
	MOV R4, R1
	MOV R3, R0
	MOV R2, #0
	SUB R1, R2, R1
	MOV R0, R3, ASR R1
	BMI loop_shiftS
	MOVPL R0, R3, LSL R4
loop_shifS:
	BX LR



isEqualU16:
	CMP R0, R1
	MOV R0, #1
	BEQ loop_isEqualU
	MOV R0, #0
loop_isEqualU:
	BX LR



isEqualS16:
	CMP R0, R1
	MOV R0, #1
	BEQ loop_isEqualS
	MOV R0, #0
loop_isEqualS:
	BX LR


stringCopy:
	MOV R3, R0
	MOV R4, R1
	LDRSB R2, [R4]
copy_loop:
	CMP R2, #0
	BEQ  final_Loop
	STRB R2, [R3]
	ADD R4, R4, #1
	LDRSB R2, [R4]
	ADD R3, R3, #1
	B copy_loop

final_loop:
	MOV R2, #0
	STRB R2, [R3]
	BX LR 


stringCat:
	MOV R2, R1 @ save address of first string


strcat_loop1:
    LDRB R3, [R2], #1 @ Retrieve byte from memory and check for null terminator

    CMP R3, #0
    BNE strcat_loop1    
    SUB R2, R2, #1 @ Move pointer back one position to over write null terminator

strcat_loop2:
    LDRB R3, [R0], #1
    STRB R3, [R2], #1 @ Advance pointer one address to save next byte
    CMP R3, #0
    BNE strcat_loop2
    BX LR












