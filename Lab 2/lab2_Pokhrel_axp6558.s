.global sumS32
.global sumS8
.global sumU32_64
.global countNegative
.global countNonNegative
.global countMatches
.global uint8ToBinaryString
.global int16ToBinaryString
.global getParity
.global returnMax
.global returnMin


.text

@ Apar Pokhrel, 1001646558

sumS32:
    MOV R2, R0
    MOV R0, #0

add32Loop:
    LDR R3, [R2], #4
    ADD R0, R0, R3
    SUBS R1, R1, #1
    BNE add32Loop
    BX LR

  
sumS8:
    MOV R2,R0 
    MOV R0, #0

add8Loop:
    LDRSB R3, [R2],#1
    ADD R0,R0,R3
    SUBS R1,R1,#1
    BNE add8Loop
    BX LR

	

sumU32_64:
    MOV R2, R0
    MOV R0, #0
    MOV R3, R1
    MOV R1, #0

add64Loop:
    LDR R4,[R2],#4
    ADDS R0, R0 , R4 
    ADC  R1, R1, #0
    SUBS R3,R3,#1
    BNE add64Loop
    BX LR
   
	
	
countNegative:
    MOV R2, R0
    MOV R0, #0
   
cNegativeLoop:
    LDR R3, [R2], #4
    CMP R3, #0
    ADDMI R0, R0, #1
    SUBS R1, R1, #1
    BNE cNegativeLoop 
    BX LR
    
    

countNonNegative:
    MOV R2, R0
    MOV R0, #0

positiveLoop:
    LDR R3, [R2], #4
    CMP R3, #0
    ADDPL R0, R0, #1
    SUBS R1, R1, #1
    BNE positiveLoop 
    BX LR
   
    

countMatches:
    MOV R2, R0
    MOV R0, #0

countMatchesLoop:
    LDRSB R3, [R2], #1
    CMP R3, #0
    BEQ EndcountMatches
    CMP R3, R1
    ADDEQ R0, R0, #1
    B countMatchesLoop

EndcountMatches:
    CMP R0, #0
    MOVEQ R0, #-1
    BX LR   
    

uint8ToBinaryString:
    MOV R2, #0x80 /* mask where only bit 7 set */ 

uint8ToBinaryLoop:
    TST R1, R2
	MOVNE R3, # '1'
	MOVEQ R3, # '0'
	STRB R3, [R0], #1
	MOVS R2, R2, LSR #1
	BNE uint8ToBinaryLoop
	MOV R3, #0
	STRB R3, [R0]
	BX LR


int16ToBinaryString:
    MOV R2, #0x8000 /* mask where only bit 15 set */ 

int16ToBinaryLoop:
	TST R1, R2
	MOVNE R3, # '1'
	MOVEQ R3, # '0'
	STRB R3, [R0], #1
	MOVS R2, R2, LSR #1
	BNE int16ToBinaryLoop
	MOV R3, #0
	STRB R3, [R0]
	BX LR

	
getParity:
    MOV R2, R0
    MOV R0, #0
    MOV R1, #0x80000000

parityLoop:
    TST R1, R2
    ADDNE R0, R0, #1
    MOVS R1, R1, LSR #1
    BNE parityLoop
    AND R0, R0, #1
    BX LR


returnMax:
    MOV R2, R0
    LDR R0, [R2], #4
    SUB R1, R1, #1

returnMaxLoop:
    CMP R1, #0
    BEQ EndreturnMax
    LDR R3, [R2], #4
    CMP R3, R0
    MOVPL R0, R3
    SUBS R1, R1, #1
    BPL returnMaxLoop

EndreturnMax:
    BX LR
	


returnMin:
    MOV R2, R0
    LDR R0, [R2], #4
    SUB R1, R1, #1

returnMinLoop:
    CMP R1, #0
    BEQ EndreturnMin
    LDR R3, [R2], #4
    CMP R3, R0
    MOVMI R0, R3
    SUBS R1, R1, #1
    BPL returnMinLoop

EndreturnMin:
    BX LR


	





