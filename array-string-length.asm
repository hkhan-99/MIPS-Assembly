.data
display: 	.asciiz "My string is: "
myStr: 		.asciiz "Hi!"
display2: 	.asciiz "The length is: "
str_length: .word 	0

.text

#Print the string
la $a0,display
jal PrintString

 la $a0,myStr
jal PrintString

jal PrintNewLine
 
# Calculate the string length
la $a0, myStr
jal strlen

# Save the string length to memory
sw $v0, str_length

# Print the string length
la $a0, display2
lw $a1,str_length
jal PrintInt

# Exit
jal Exit

##############################################	
# strlen
# Parameters:
#    $a0 - character array
# Returns:
#   $v0 - the length of the string
##############################################	
strlen:

    # Save ra on the stack
	#addi $sp, $sp,-4
	#sw $ra,0($sp)
    # Save $a0 on the stack
	#addi $sp, $sp,-4
	#sw $a0,0($sp)
	
	move $t3,$a0
	li $t2,0 # strlen and string array index
loop:
	add $t0,$t2,$t3
	lb $t1,($t0)
	beq $t1,$zero,exitFor
	addi $t2,$t2,1
	j loop
exitFor:
	#la $a0,display2
	#move $a1,$t2
	#jal PrintInt
	
	#jal PrintNewLine
	
	# pop #a0 off the stack
	#lw $a0,0($sp)
	#addi $sp, $sp, 4
	## pop $ra off the stack
	#lw $ra,0($sp)
	#addi $sp, $sp, 4

	# Set up return value and return from the procedure	
	move $v0,$t2
	jr $ra

.include "utils.asm"
