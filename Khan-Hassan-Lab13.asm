# Hassan Khan
# Lab 13

.text
# prompting user for size of array
la $a0, prompt 
jal PromptInt 
move $t1, $v0 # storing user entry of array size in $t1

start_loop:
    	beq $t0,$t1, exit_loop
    	
    	li $v0, 42            # system call to generate random int
	la $a1, 101       # setting the upper bound
	syscall              # generated number will be in $a0
	move $a1, $a0 # to make sense for the PrintInt procedure
	
	# Dynamically allocating array
	li $v0, 9 # address of allocated memory
	lw $a0, 4($sp) #stack pointer/ holding no.of bytes to allocate
	syscall
	
	# Printing the values
	la $a0, element
	jal PrintInt

	jal PrintNewLine
	
	#End of for loop here
    	addi $t0,$t0,1
    	j start_loop
    	
exit_loop:               
	jal Exit
	
.data
prompt: .asciiz "What is the size of the array to be created? "
element: .asciiz "Element: "
.include "utils.asm"
