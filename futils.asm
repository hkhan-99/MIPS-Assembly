#####################################################
# Function: Exit - exit the program
# Parameters:
# None
# Returns
# None
######################################################
.text
Exit:
    li $v0, 10
    syscall

#####################################################
# Function: PrintNewLine - prints a new line
# Parameters:
# None
# Returns
# None
######################################################
.text
PrintNewLine:
   li $v0, 4
   la $a0, __PNL_newline
   syscall
   jr $ra
.data
   __PNL_newline: .asciiz "\n"

#####################################################
# Function: PrintInt - prints a label and an integer
# Parameters:
# $a0 label to print
# $a1 integer to print
# Returns
# None
######################################################
.text 
PrintFloat:   
	# Print string. The string address is already in $a0 
	li $v0, 4
	syscall
	# Print float. The float value is in $f0 and 
	# is being moved to $f12.
	li $v0, 2
	mov.s $f12, $f0
	syscall
	#return
jr $ra

#####################################################
# Function: PromptInt - prints a label and prompts for
#           an integer
# Parameters:
# $a0 - label to print
# $a1 - integer to print
# Returns
# None
######################################################
.text
PromptFloat:
	# Print the prompt, which is already in $a0
	li $v0, 4
	syscall
	# Read the float value. At the end of the
	# syscall the value is placed in $f0
	li $v0, 6
	syscall
	#return
jr $ra

#####################################################
# Function: PrintString - prints a string
# Parameters:
# $a0 - string to print
# Returns
# None
######################################################
.text
PrintString:	
	addi $v0, $zero, 4
	syscall
	jr $ra
