# Matt Wagers and Hassan Khan
# Team Lab
# CSCI 2340

#############################################################
# Function CountOccur(string, character):
#     integer variable counter set to 0
#     pointer to a constant character called ptr its setmto the start of the string
#     
#     While(character pointed to by ptr is not the end of the string)
#	{
#         If(character pointed to by ptr == specified character)
#             counter variable +1
#         Move pointer to the next character in the string
#	}
#     
#     Return the counter
######################################

.text
.globl CountOccur

CountOccur:
	move $t0, $a0 # String Pointer
	move $t1, $a1 # Character
	li $v0, 0 # Counter

	
CountLoop:
    lb $t2, 0($t0)  # Loading byte from the memory address pointed to by $t0 into register $t2
    beq $t2, $zero, EndCount  # Checking if the byte loaded is equal to zero (end of string)
    beq $t2, $t1, Increment   # Checking if the byte loaded is equal to the specified character ($t1)
    j Continue  # If neither condition is met, continue to the next iteration of the loop


Increment:
	addi $v0, $v0, 1 # Increment the counter
	
Continue:
	addi $t0, $t0, 1 # Moves to the next character in string
	j CountLoop
	
EndCount:
	jr $ra
