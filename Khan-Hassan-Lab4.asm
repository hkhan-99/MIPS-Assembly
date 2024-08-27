# Hassan Khan
# Lab 4

# Pseudo Code:
# main {
# int a = input("Please enter the first value to add: ")
# int b = input("Please enter the second value to add: ")
# int x = a + b
# ------------------------
# int c = input("Please enter the third value to subtract: ")
# int y = x - c
# print("The result is y")}

.text
main:
# Register Conventions
# a is $s0
# b is $s1
# x is $s2
# ---------
# c is $s3
# y is $s4

# int a = input("Please enter the first value to add: ")
li $v0, 4
la $a0, prompt1
syscall

#Reading the 1st integer add value
li $v0, 5
syscall

#Return values are stored in $v0
#Saving the value in $s0
move $s0, $v0

# int b = input("Please enter the second value to add: ")
li $v0, 4
la $a0, prompt2
syscall

#Reading the 2nd integer add value
li $v0, 5
syscall

#Return values are stored in $v0
#Saving the value in $s1
move $s1, $v0

# int x = a + b
add $s2, $s0, $s1

# ---------------------Substraction----------------------------

# int c = input("Please enter the third value to subtract: ")
li $v0, 4
la $a0, prompt3
syscall

#Reading the substraction integer value
li $v0, 5
syscall

#Return values are stored in $v0
#Saving the value in $s3
move $s3, $v0

# int y = x - c
sub $s4, $s2, $s3

# print("The result is y")}
li $v0, 4
la $a0, result
syscall

# Printing the final integer value
li $v0, 1
move $a0, $s4
syscall

#Exiting the program
li $v0, 10
syscall

.data
prompt1: .asciiz "Please enter the first value to add: "
prompt2: .asciiz "Please enter the second value to add: "
prompt3: .asciiz "Please enter the third value to subtract: "
result: .asciiz "The result is "