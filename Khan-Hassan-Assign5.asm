# Hassan Khan
# Assignment #5

.text
main:

# Calling min procedure
la $a0, A
lw $a1, size
jal min_start
# Printing min value and label
la $a0, minlabel
move $a1, $v0
jal PrintInt
jal PrintNewLine

# Calling max procedure
la $a0, A
lw $a1, size
jal max_start
# Printing max value and label
la $a0, maxlabel
move $a1, $v0
jal PrintInt
jal PrintNewLine

# Calling sum procedure
la $a0, A
lw $a1, size
jal sum_start
# Printing sum value and label
la $a0, sumlabel
move $a1, $v0
jal PrintInt
jal PrintNewLine

# Calling sum again for the avg procedure
la $a0, A
lw $a1, size
jal sum_start
# Calling avg procedure
move $a0, $v0
lw $a1, size
jal avg_start

# Printing avg value and label
la $a0, avglabel
move $a1, $v0
jal PrintInt
jal PrintNewLine

j Exit

################## Procedures ####################

min_start:
# Pushing $ra, $a0 and $a1 on the stack:
addi $sp, $sp,-4
sw $ra,0($sp)

addi $sp, $sp,-4
sw $a0,0($sp)

addi $sp, $sp,-4
sw $a1,0($sp)

# First value is set as the minimum
# Array is looped through to find the next smallest value, comparing each element to the set minimum value
# Eventually final min value is returned

li $t0, 0
li $t2, 0
mul $t2, $t0, 4
add $t2, $t2, $a0
lw $s4,($t2) # loading first value in array into $s4
j min_loop

min_loop:
bge $t0, $a1, min_exit
li $t2, 0
mul $t2, $t0, 4
add $t2, $t2, $a0
lw $s3,($t2) # $s3 contains array index
blt $s3, $s4, min_
addi $t0, $t0, 1
j min_loop

min_:
move $s4, $s3
addi $t0, $t0, 1
j min_loop

min_exit:
move $v0, $s4	
# Popping $a1, $a0 and $ra off the stack in reverse order:
lw $a1,0($sp)
addi $sp, $sp, 4

lw $a0,0($sp)
addi $sp, $sp, 4

lw $ra,0($sp)
addi $sp, $sp, 4
jr $ra

max_start:
# Pushing $ra, $a0, $a1 on the stack
addi $sp, $sp,-4
sw $ra,0($sp)

addi $sp, $sp,-4
sw $a0,0($sp)

addi $sp, $sp,-4
sw $a1,0($sp)

# First value is set as maximum
# Array is looped through to find the next largest value, comparing each element to the set maximum value
# Eventually final max value is returned

li $t0, 0
li $t2, 0
mul $t2, $t0, 4
add $t2, $t2, $a0
lw $s4,($t2) # loading first array value into $s4
j max_loop

max_loop:
bge $t0, $a1, max_exit
li $t2, 0
mul $t2, $t0, 4
add $t2, $t2, $a0
lw $s3,($t2) # $s3 contains array index
bgt $s3, $s4, max_
addi $t0, $t0, 1
j max_loop

max_:
move $s4, $s3
addi $t0, $t0, 1
j max_loop

max_exit:	
move $v0, $s4
# Popping $a1, $a0 and $ra off the stack in reverse order:
lw $a1,0($sp)
addi $sp, $sp, 4

lw $a0,0($sp)
addi $sp, $sp, 4

lw $ra,0($sp)
addi $sp, $sp, 4
jr $ra

sum_start:
# Pushing $ra, $a0 and $a1 on the stack:
addi $sp, $sp,-4
sw $ra,0($sp)

addi $sp, $sp,-4
sw $a0,0($sp)

addi $sp, $sp,-4
sw $a1,0($sp)

# Sum is set as 0
# Looping through array and adding elements to sum
# Sum value is returned
li $t0, 0
li $v0, 0
j sum_loop

sum_loop:
bge $t0, $a1, sum_exit
li $t2, 0
mul $t2, $t0, 4
add $t2, $t2, $a0
lw $s3,($t2) # $s3 contains array index
add $v0, $v0, $s3
addi $t0, $t0, 1
j sum_loop

sum_exit:
# Popping #a1, $a0 and $ra off the stack in reverse order:
lw $a1,0($sp)
addi $sp, $sp, 4

lw $a0,0($sp)
addi $sp, $sp, 4

lw $ra,0($sp)
addi $sp, $sp, 4
jr $ra

avg_start:
# Pushing $ra, $a0 and $a1 on the stack:
addi $sp, $sp,-4
sw $ra,0($sp)

addi $sp, $sp,-4
sw $a0,0($sp)

addi $sp, $sp,-4
sw $a1,0($sp)

# Dividing sum by array size
div $v0, $a0, $a1
			
# Popping #a1, $a0 and $ra off the stack in reverse order:
lw $a1,0($sp)
addi $sp, $sp, 4

lw $a0,0($sp)
addi $sp, $sp, 4

lw $ra,0($sp)
addi $sp, $sp, 4
jr $ra # avg value returned


.data
A: 		.word 11, 250, 20, 70, 60, 140,150, 80, 90,100, 1, 30, 40, 120,130, 5
size: 		.word 16 # length of array A
min: 		.word 0
max: 		.word 0
sum: 		.word 0
average: 	.word 0
largestInt: 	.word 2147483647 # You may want to use this for min procedure

minlabel:	 .asciiz "The minimum is "
maxlabel:	 .asciiz "The maximum is "
sumlabel:	 .asciiz "The sum is "
avglabel:	 .asciiz "The average is "
.include "utils.asm"
