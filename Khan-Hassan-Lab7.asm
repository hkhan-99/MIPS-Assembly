# Hassan Khan
# Lab 7

.text
# Write code to load x,y,z, and q 
# into registers $s0-$s3 with lw using labels
lw $s0, x
lw $s1, y
lw $s2, z
lw $s3, q

# Write the code to print the value
# in registers $s0-$s3

# printing out the values with their appropriate text descriptions
# printing out value in x
li $v0, 4
la $a0, prompt1
syscall
li $v0, 1
move $a0, $s0
syscall

# printing out value in y
li $v0, 4
la $a0, prompt2
syscall
li $v0, 1
move $a0, $s1
syscall

# printing out value in z
li $v0, 4
la $a0, prompt3
syscall
li $v0, 1
move $a0, $s2
syscall

# printing out value in q
li $v0, 4
la $a0, prompt4
syscall
li $v0, 1
move $a0, $s3
syscall

# Write code to load the 4 integers starting
# at label a using register indirect access 
# into registers $s0-$s3
# Make sure the memory location is always set 
# to point to the integer you want to load
# Example: 
# After loading the address into $t0
# use lw to load the value from the address
# lw $s0,($t0)
# After loading the value, you need to advance
# the memory pointer to point to the next integer

# address loaded into $t0 and the first value 2 is loaded from the address
la $t0, a
lw $s0, ($t0)

# advancing memory pointer to 4 and loading the value from the address
addi $t0, $t0,4
lw $s1, ($t0)

## advancing memory pointer to 6 and loading the value from the address
addi $t0, $t0, 4
lw $s2, ($t0)

# advancing memory pointer to 12 and loading the value from the address
addi $t0, $t0,4
lw $s3, ($t0)

# Write the code to print the value
# in registers $s0-$s3

# printing out the values with their appropriate text descriptions
# printing out 2 
li $v0, 4
la $a0, prompt1
syscall
li $v0, 1
move $a0, $s0
syscall

# printing out 4
li $v0, 4
la $a0, prompt2
syscall
li $v0, 1
move $a0, $s1
syscall

# printing out 6
li $v0, 4
la $a0, prompt3
syscall
li $v0, 1
move $a0, $s2
syscall

# printing out 12
li $v0, 4
la $a0, prompt4
syscall
li $v0, 1
move $a0, $s3
syscall

# Write code to load the 4 integers starting
# at label e using register indirect plus offset access
# into registers $s0-$s3
# Example: 
# After loading the address into $t0
# use lw to load the value from the address
# Use the offset into the memory location to
# get to the correct address
# lw $s0,0($t0)

# address loaded into $t0 and the first value 5 is loaded from the address
la $t0, e
lw $s0, 0($t0) # access by offset 0

# address loaded into $t0 and the value 10 is loaded from the address
la $t0, e
lw $s1, 4($t0) # access by offset 4

# address loaded into $t0 and the value 15 is loaded from the address
la $t0, e
lw $s2, 8($t0) # access by offset 8

# address loaded into $t0 and the value 20 is loaded from the address
la $t0, e
lw $s3, 12($t0) # access by offset 12

# Write the code to print the value
# in registers $s0-$s3

# printing out the values with their appropriate text descriptions
# printing out 5 
li $v0, 4
la $a0, prompt1
syscall
li $v0, 1
move $a0, $s0
syscall

# printing out 10
li $v0, 4
la $a0, prompt2
syscall
li $v0, 1
move $a0, $s1
syscall

# printing out 15
li $v0, 4
la $a0, prompt3
syscall
li $v0, 1
move $a0, $s2
syscall

# printing out 20
li $v0, 4
la $a0, prompt4
syscall
li $v0, 1
move $a0, $s3
syscall

#Exit the program
li $v0, 10
syscall


.data
x: .word 10
y: .word 15
z: .word 7
q: .word 8
a: .word 2
   .word 4
   .word 6 
   .word 12
e: .word 5
   .word 10
   .word 15
   .word 20
prompt1: .asciiz "\nThe value in $s0 is : "
prompt2: .asciiz "\nThe value in $s1 is : "
prompt3: .asciiz "\nThe value in $s2 is : "
prompt4: .asciiz "\nThe value in $s3 is : "

