# Hassan Khan
# Lab 11

# int sum_proc(int g, h, i. x) {
# int f; 
# int k;
# int sum;
# f= (g + h);
# k= (i + x)*2;
# sum= f + k;
# return sum; }

# Register convention
# f = $s0 | k = $s1 | sum = $s2


.text
 .globl main

#####################################################
# Function: sum_proc
#  Pushes $s0,$s1,and $s2 onto the stack at the beginning of the procedure
#  loads g,h,i, and x into temporary registers for calculation
#  Performs f = (g + h); , k = (i + x)*2; , sum= f + k; 
#  Makes sure to return the sum ($s2) in $v0.
#  Pops $s0,$s1,and $s2 off at the end of the procedure.
#  Returns what's in $v0

# Parameters: 
# g, h, i, x || $a0, $a1, $a2, $a3

# Returns
# sum || $s2 stored in $v0
######################################################
sum_proc:
addi $sp, $sp, -4
sw $s0, 0($sp) # pushing $s0 on the stack
addi $sp, $sp, -4
sw $s1, 0($sp) # pushing $s1
addi $sp, $sp, -4
sw $s2, 0($sp) # pushing $s2
   
lw $t0, g # Loading g into $t0
lw $t1, h # h into $t1   
lw $t2, i # i into $t2
lw $t3, x # x into $t3

# f = (g + h);
add $s0, $t0, $t1
    
# k = (i + x)*2;
add $t4, $t2, $t3 # t4 = i + x
sll $s1, $t4, 1  # k= (i + x)*2

# Label for the return value
li $v0, 4
la $a0, returnval
syscall
    
# sum= f + k;
add $s2, $s0, $s1 # sum = f + k
move $v0, $s2 # sum returned in $v0

# Popping done recursively
lw $s2, 0($sp) # Popping $s2 off the stack
addi $sp, $sp, 4
lw $s1, 0($sp) # Popping $s1
addi $sp, $sp, 4
lw $s0, 0($sp) # Popping $s0
addi $sp, $sp, 4

jr $ra

main:
# Load g,h,i, and x into $a0-$a3 registers
lw $a0, g
lw $a1, h
lw $a2, i
lw $a3, x
    
# Loading the value of test into $s0, test2 into $s1, and test3 into $s2.  
lw $s0, test
lw $s1, test2
lw $s2, test3
    
# Calling sum_proc, passing g,h,i, and x into the procedure (in $a0-$a3)
jal sum_proc
    
# Printing the value returned from sum_proc (with label)
move $a0, $v0
li $v0, 1
syscall
    
# Newline
li $v0, 4
la $a0, line
syscall

# Finally, printing the value in $s0,$s1, and $s2 (with labels)

# s0 
li $v0, 4
la $a0, s0val
syscall
move $a0, $s0
li $v0, 1 
syscall

# Newline
li $v0, 4
la $a0, line
syscall

# s1   
li $v0, 4
la $a0, s1val
syscall   
move $a0, $s1
li $v0, 1
syscall

# Newline
li $v0, 4
la $a0, line
syscall

# s2
li $v0, 4
la $a0, s2val
syscall
move $a0, $s2
li $v0, 1
syscall

# Newline
li $v0, 4
la $a0, line
syscall
    
# Exiting cleanly
li $v0, 10
syscall

.data
g: .word 10
h: .word 15
i: .word 3
x: .word 2
test: .word 56
test2: .word 78
test3: .word 91
# LABELS-
returnval: .asciiz "Returned value: "
s0val: .asciiz "s0 = "
s1val: .asciiz "s1 = "
s2val: .asciiz "s2 = "
line: .asciiz "\n"


