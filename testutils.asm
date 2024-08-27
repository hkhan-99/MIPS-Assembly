.text
.globl main
main:

la $a0, hi
jal PrintString

jal PrintNewLine

la $a0, intMsg
lw $a1,a
jal PrintInt

jal Exit

.data
a: .word 5
hi: .asciiz "hi"
intMsg: .asciiz "A is = "
.include "utils.asm"