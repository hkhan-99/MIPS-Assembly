# WARNING!!!!  Only run this program using the debugger.
# It is a bad, non-reentrant program!

.text
.globl main
main:
jal BadSubprogram
la $a0,string3
jal PrintString
jal Exit

BadSubprogram:
# Why does this fix the bad program?
addi $sp, $sp, -4 #push
sw $ra, 0($sp) 

la $a0,string1
jal PrintString

li $v0,4
la $a0,string2
syscall

# Why does this fix the bad program?
lw $ra, 0($sp)  #pop
addi $sp,$sp,4
jr $ra

.data
string1: .asciiz "\n in BadSubprogram\n"
string2: .asciiz "\n After call to PrintString\n"
string3: .asciiz "\n After call to BadSubprogram\n"
.include "utils.asm"
