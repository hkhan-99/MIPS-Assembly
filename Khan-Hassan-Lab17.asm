# Hassan Khan
# Lab 17

# switch (k) {
# case 0: 
# 	a = b + c; 
# break;
# case 1: 
# 	a = d + e; 
# break;
# case 2: 
# 	a = d - e; 
# break;
# case 3: 
#	a = b - c; 
# break;
# default: 
#	a = 0; 
# break;
# }
# ---------------------
.text
main:
    # Print the prompt and read the value for k
    la $a0, prompt
    jal PromptInt

    # Save k to $s1
    move $s1, $v0

    # Load values for a-e from memory into registers
    lw $t0, a
    lw $t1, b 
    lw $t2, c
    lw $t3, d
    lw $t4, e

    # Load address of jumptable
    la $s5, jumptable

    # Compute word offset into the jumptable
    mul $t5, $s1, 4
    add $t6, $s5, $t5

    # Load a pointer into jumptable
    lw $t7, 0($t6)

    # Jump to the location in the jumptable
    jr $t7

# Jump to specific case in jumptable
case0:
    add $t0, $t1, $t2  # a = b + c
    j store_and_print

case1:
    add $t0, $t3, $t4  # a = d + e
    j store_and_print

case2:
    sub $t0, $t3, $t4  # a = d - e
    j store_and_print

case3:
    sub $t0, $t1, $t2  # a = b - c
    j store_and_print

default_case:
    li $t0, 0          # a = 0
    j store_and_print

store_and_print:
    # Store the value of a back into memory location
    sw $t0, a

    # Print the value of a from the memory location
    la $a0, output
    jal PrintString

    li $v0, 1
    lw $a0, a
    syscall

    # Exiting cleanly
    jal Exit
    
    
.data
.align 2
a: .word 0
b: .word 10
c: .word 5
d: .word 9
e: .word 7
jumptable: .word case0, case1, case2, case3, default_case
prompt: .asciiz "Please enter a value for k: "
output: .asciiz "The value of a is: "
.include "utils.asm"
