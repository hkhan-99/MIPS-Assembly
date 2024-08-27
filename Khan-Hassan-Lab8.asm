# Hassan Khan
# Lab 8

# if (k == 0) {  
# a = b + c; 
# elseif (k == 1) { 
# a = d + e;  
# elseif (k == 2) {  
# a = d – e;  
# elseif (k == 3) { 
# a = b – c;  
# else {  
# a = 0; 
# } 

.text
# Loading the values from memory into registers
lw $s0, a
lw $s1, b
lw $s2, c
lw $s3, d
lw $s4, e
 
# Prompting user for k value
li $v0, 4
la $a0, enterprompt
syscall

# reading k value and saving it in $t0
li $v0, 5
syscall 
move $t0, $v0 # k is in $t0

# calling if/else_if statements
beq $t0, 0 if # k = 0
beq $t0, 1, else_if # k = 1
beq $t0, 2, else_if2 # k = 2
beq $t0, 3, else_if3 # k = 3
# invalid conditions
bgt $t0, 3, else # k greater than 3
blt $t0, 0, else2 # k less than 3

# vv- if and else_if instructions starts here -vv

# if (k == 0) {  
# a = b + c; 
if: 
add $s0, $s1, $s2
la $a0, valueprompt
j end_if

# elseif (k == 1) { 
# a = d + e;  
else_if:
add $s0, $s3, $s4
la $a0, valueprompt
j end_if

# elseif (k == 2) {  
# a = d – e; 
else_if2:
sub $s0, $s3, $s4
la $a0, valueprompt
j end_if

# elseif (k == 3) { 
# a = b – c;  
else_if3:
sub $s0, $s1, $s2
la $a0, valueprompt
j end_if

# else {  
# a = 0; 
# } 
else:
la $a0, valueprompt
j end_if

else2:
la $a0, valueprompt
j end_if

# end_if with the service call to print string and integer
# ..and loading the final answer for 'a' in $a0
end_if:
li $v0, 4
sw $s0,a
syscall

li $v0, 1
lw $a0, a
syscall 



# exiting cleanly
li $v0, 10
syscall

.data
a: .word 0
b: .word 10
c: .word 5
d: .word 9
e: .word 7

enterprompt: .asciiz "Please enter a value for k: "
valueprompt: .asciiz "The value of a is: "
