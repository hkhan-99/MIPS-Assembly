# Hassan Khan
# Lab 5

# Pseudo Code:
# main {
# int a = input("Please enter the number to divide by 8: ")
# int b = int a / 8
# int c = input("That number divided by 8 is " + int b)

#---------vv Following the same register conventions vv---------------#

# int a = input("\nPlease enter the number to multiply by 4: ")
# int b = int a * 4
# int c = input("That number multiplied by 4 is " + int b)}

.text
main:

# Register Conventions
# a is $t0
# b is $s0
# c is $a0


########### Dividing by 8 - Implementing SRL ##########

# int a = input("Please enter the number to divide by 8: ")
#___________________________________________________________________
# Printing the first prompt
li $v0, 4
la $a0, prompt1
syscall

# Reading user's integer input
li $v0, 5
syscall

# Saving/moving their integer input to $t0
move $t0, $v0


# int b = int a / 8
#______________________
# Dividing user's integer input by 8 and saving it in $s0
srl $s0, $t0, 3


# int c = input("That number divided by 8 is " + int b)
#____________________________________________________
# Printing result label
li $v0, 4
la $a0, result1
syscall
# Printing the resulting integer value
li $v0, 1
move $a0, $s0
syscall


################ Multiplying by 4 - Implementing SLL ###########

# int a = input("\nPlease enter the number to multiply by 4: ")
#__________________________________________________________________
# Printing the second prompt
li $v0, 4
la $a0, prompt2
syscall

#Reading user's integer input
li $v0, 5
syscall

# Saving/moving their integer input to $t0
move $t0, $v0

# int b = int a * 4
#______________________
# Multiplying user's input by 4 and saving result in $s0
sll $s0, $t0, 2


# int c = input("That number multiplied by 4 is " + int b)}
#_________________________________________________________
# Printing result label
li $v0, 4
la $a0, result2
syscall

# Printing resulting integer value
li $v0, 1
move $a0, $s0
syscall

#--------------------- End of Pseudo code ---------------------------

# Just a space for neatness
li $v0, 4
la $a0, space
syscall


# Exit program
li $v0, 10
syscall


.data
prompt1: .asciiz "Please enter the number to divide by 8: "
result1: .asciiz "That number divided by 8 is "
prompt2: .asciiz "\nPlease enter the number to multiply by 4: "
result2: .asciiz "That number multiplied by 4 is "
space: .asciiz "\n"
