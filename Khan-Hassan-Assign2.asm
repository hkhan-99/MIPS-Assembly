# Hassan Khan
# Assignment #2

#Pseudo Code
# main {
# int x = input("Enter a value for x: ")
# int y = input("Enter a value for y: ")
# int z = input("Enter a value for z: ")
# Calculating expression #1: ((5x + 3y + z) / 2) * 3
# Calculating expression #2: x^3 + 2x^2 + 3x + 4
# print("The result for expression 1 is: " + expression 1_result)
# print("The result for expression 2 is: " + expression 2_result)
# print("Goodbye!)}

# Register Conventions
# int x = $s0
# int y = $s1
# int z = $s2
# expression1_result = $t5
# expression2_result = $s6


.text
.globl main
main:

# int x = input("Enter a value for x: ")
#_________________________________________
# Prompting for x value
li $v0, 4
la $a0, xvalue
syscall

#Reading the x value and moving it to $s0
li $v0, 5
syscall
move $s0, $v0


# int y = input("Enter a value for y: ")
#__________________________________________
# Prompting for y value
li $v0, 4
la $a0, yvalue
syscall

#Reading the y value and moving it to $s1
li $v0, 5
syscall
move $s1, $v0


# int z = input("Enter a value for z: ")
#__________________________________________
# Prompting for z value
li $v0, 4
la $a0, zvalue
syscall

#Reading the z value and moving it to $s2
li $v0, 5
syscall
move $s2, $v0


# Calculating expression #1: ((5x + 3y + z) / 2) * 3
#________________________________________________________

# The breakdown
mul $t0, $s0, 5 # 5x
mul $t1, $s1, 3 #3y 
add $t2, $t0, $t1 #(5x + 3y)
add $t3, $t2, $s2 #(5x + 3y + z)
mul $t4, $t3, 3 # (5x + 3y + z) * 3

# Final form
# The order of operations slightly altered to achieve correctness
srl $t5, $t4, 1 # (5x + 3y + z) * 3)/2


# Calculating expression #2: x^3 + 2x^2 + 3x + 4
#________________________________________________________

# The breakdown
mul $t6, $s0, $s0 # x^2
mul $t6, $t6, $s0 # x^3 
mul $t7, $s0, $s0 # x^2
mul $t8, $t7, 2 # 2x^2
mul $t9, $s0, 3 # 3x
add $s4, $t6, $t8 # x^3 + 2x^2
add $s5, $s4, $t9 # x^3 + 2x^2 + 3x

#The final form
add $s6, $s5, 4 # x^3 + 2x^2 + 3x + 4


# print("The result for expression 1 is: " + expression 1_result)
#__________________________________________________________________

#printing the label for expression 1
li $v0, 4
la $a0, express1
syscall

#printing expression 1_result
li $v0, 1
move $a0, $t5
syscall

# print("The result for expression 2 is: " + expression 2_result)
#__________________________________________________________________

#printing the label for expression 2
li $v0, 4
la $a0, express2
syscall

#printing expression 2_result
li $v0, 1
move $a0, $s6
syscall


# print("Goodbye!)}
#____________________
#goodbye message
li $v0, 4
la $a0, msg
syscall

#----------------- End of Pseudo code -----------------

#space
li $v0, 4
la $a0, space
syscall

#exit 
li $v0, 10
syscall


.data
xvalue: .asciiz "Enter a value for x: "
yvalue: .asciiz "Enter a value for y: "
zvalue: .asciiz "Enter a value for z: "
express1: .asciiz "The result for expression 1 is: "
express2: .asciiz "\nThe result for expression 2 is: "
msg: .asciiz "\nGoodbye!"
space: .asciiz "\n"
