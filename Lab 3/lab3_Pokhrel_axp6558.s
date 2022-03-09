@ Apar Pokhrel, 1001646558

.global sortDecendingInPlace 
.global sumF32
.global prodF64
.global dotpF64
.global maxF32
.global absSumF64
.global sqrtSumF64
.global geoMean
.global getDirection
.global getAddNo
.global getCity


.text



sortDecendingInPlace :
   	MOV R2, #0  	@loop index1
    SUB R1, R1, #1 
    MOV R4, R1

startOrder:
    MOV R9, R0
    MOV R3, #0 		@loop index2
    CMP R2, R1
    BPL endOrder
    SUB R6,R4,R2 
    ADD R2, R2,#1	@increase counter


orderLoop:
    CMP R3, R6
    BMI sortLoop
    B startOrder

sortLoop:
    LDR R5, [R9]               
    LDR R7, [R9,#4]        
    CMP R5, R7              
    MOVMI R8, R7            
    MOVMI R7, R5            
    MOVMI R5, R8            
    STRMI R5, [R9]
    STRMI R7, [R9, #4]
    ADD R9, R9, #4
    ADD R3, R3, #1
    B orderLoop

endOrder:
    BX LR
   



sumF32:
    MOV R2, #0
	VMOV S0,R2 @ Zero out all 32 bits

fsum_loop:
	CMP R1, #0 @ test counter
	BEQ fsum_end @ if counter is zero, jump to exit
	VLDR.F32 S1, [R0] @ Load value at R0 into D1
	VADD.F32 S0,S1
	SUB R1, R1, #1 @ Decrement conter
	ADD R0, R0, #4 @ Move forward 32-bits
	B fsum_loop

fsum_end:
	VMOV R0, S0 @ Move S0 to R0
	BX LR

   
	

prodF64:
	MOV R2, #0
	VMOV D0, R2, R2 @ Zero out all 64 bits
	VLDR.F64 D0, [R0] @ Load value at R0 into D1
	ADD R0, R0, #8 @ Move forward 64-bits
	SUB R1, R1, #1 @ Decrement counter


product_loop:
	CMP R1, #0 @ test counter
	BEQ product_end @ if counter is zero, jump to exit
	VLDR.F64 D1, [R0] @ Load value at R0 into D1
	VMUL.F64 D0, D0, D1
	ADD R0, R0, #8 @ Move forward 64-bits
	SUB R1, R1, #1 @ Decrement counter
	B product_loop

product_end:
	VMOV R0, R1, D0 @ Move D0 to R1:R0
	BX LR
   

   

dotpF64:
	MOV R3, R0
    MOV R0, #0
    VMOV D0, R0, R0
	
dotprodLoop:
    CMP R2, #0
    BEQ dotprodEnd
    VLDR.F64 D1, [R3] 	@first index
    VLDR.F64 D2, [R1]	@second index
    ADD R3, R3, #8
    ADD R1, R1, #8
    VMUL.F64 D3, D1, D2
    VADD.F64 D0, D0, D3    	@first*first + second*second ...
    SUB R2, R2, #1
    B dotprodLoop

	
dotprodEnd:
    VMOV R0, R1, D0
    BX LR
	



maxF32:
	MOV R2, #0
	VMOV S0,R2 @ Zero out all 32 bits

max_loop:
	CMP R1, #0 @ test counter
	BEQ max_end @ if counter is zero, jump to exit
	VLDR.F32 S1, [R0] @ Load value at R0 into D1
	VCMP.F32 S1,S0
	VMOVPL S0,S1
	SUB R1, R1, #1 @ Decrement conter
	ADD R0, R0, #4 @ Move forward 32-bits
	B max_loop

max_end:
	VMOV R0, S0 @ Move S0 to R0
	BX LR
	
    

absSumF64:
	MOV R2, #0
	VMOV D0, R2, R2 @ Zero out all 64 bits

abs_loop:
	CMP R1, #0 @ test counter
	BEQ abs_end @ if counter is zero, jump to exit
	VLDR.F64 D1, [R0] @ Load value at R0 into D1
	VADD.F64 D0, D0, D1
	SUB R1, R1, #1 @ Decrement conter
	ADD R0, R0, #8 @ Move forward 64-bits
	B abs_loop

abs_end:
	VABS.F64 D0,D0
	VMOV R0, R1, D0 @ Move D0 to R1:R0
	BX LR
    
    

sqrtSumF64:
	MOV R2, #0
	VMOV D0, R2, R2 @ Zero out all 64 bits
	
sqrtloop:
	CMP R1, #0 @ test counter
	BEQ sqrt_end @ if counter is zero, jump to exit
	VLDR.F64 D1, [R0] @ Load value at R0 into D1
	VADD.F64 D0, D0, D1
	SUB R1, R1, #1 @ Decrement conter
	ADD R0, R0, #8 @ Move forward 64-bits
	B sqrtloop

sqrt_end:
	VABS.F64 D0,D0
	VSQRT.F64 D0,D0
	VMOV R0, R1, D0 @ Move D0 to R1:R0
	BX LR

   


geoMean:
    BX LR

	
getDirection:
	MOV R3, #120
    MUL R2, R1, R3
    ADD R0, R0, #44 @ changed
    ADD R0, R0, R2
    LDR R0, [R0]
    BX LR
   

getAddNo:
	MOV R3, #120
    MUL R2, R1, R3
    ADD R0, R0, #40	@changed
    ADD R0, R0, R2
    LDR R0, [R0]
    BX LR

	
    

getCity:
	MOV R3, #120
    MUL R2, R1, R3
    ADD R0, R0, #78	@changed
    ADD R0, R0, R2
    BX LR









	





