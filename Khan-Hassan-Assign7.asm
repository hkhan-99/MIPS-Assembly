# Hassan Khan
# Assignment #7

.text
main:

loop:
    jal PrintNewLine

    la $a0, float1
    jal PromptFloat
    mov.s $f12, $f0  # Storing first float in $f12
    
    li $v0, 4        # Print string syscall
    la $a0, operator  # Load address of the operator prompt
    syscall
    li $v0, 12       # Read character syscall
    syscall
    move $t1, $v0 
    
    lb $t0, QuitOp   # Load quit operator
    beq $t1, $t0, quit # If operator is quit, exit
    
    lb $t0, PowOp    # Load power operator
    beq $t1, $t0, pow_
    
    la $a0, float2  # Load address of the second prompt
    jal PromptFloat
    mov.s $f13, $f0  # Storing second float in $f13
    
    
    lb $t0, AddOp    # Load add operator
    beq $t1, $t0, add_
    lb $t0, SubOp    # Load subtract operator
    beq $t1, $t0, sub_
    lb $t0, MulOp    # Load multiply operator
    beq $t1, $t0, mul_
    lb $t0, DivOp    # Load divide operator
    beq $t1, $t0, div_
    
    # Invalid operator
    la $a0, invalid_op
    jal PrintString
    
    j loop
    
add_:
    jal addCalc      # Jump to addCalc procedure
    j print_result

sub_:
    jal subCalc      # Jump to subCalc procedure
    j print_result

mul_:
    jal mulCalc      # Jump to mulCalc procedure
    j print_result

div_:
    jal divCalc      # Jump to divCalc procedure
    j print_result
    
pow_:
    li $v0, 4        # Print string syscall
    la $a0, exponent  # Load address of the exponent prompt
    syscall
    li $v0, 5        # Read integer syscall
    syscall
    
    move $t2, $v0    # Store exponent in $t2
    
    jal power        # Jump to power procedure
    j print_result
    
print_result:
    li $v0, 4        # Print string syscall
    la $a0, result  # Load address of the result prompt
    syscall
    li $v0, 2        # Print float syscall
    mov.s $f12, $f0
    syscall
    j loop
   
quit:
    la $a0, gb 
    jal PrintString
   jal Exit

# -------------------------------------------------------------------
# Procedure to add two floating point numbers
addCalc:
    add.s $f0, $f12, $f13
    jr $ra

# Procedure to subtract two floating point numbers
subCalc:
    sub.s $f0, $f12, $f13
    jr $ra

# Procedure to multiply two floating point numbers
mulCalc:
    mul.s $f0, $f12, $f13
    jr $ra

# Procedure to divide two floating point numbers
divCalc:
    div.s $f0, $f12, $f13
    jr $ra
    
# Procedure to calculate the power of a number
power:
    # $f12: base, $t2: integer exponent
    lwc1 $f16, one # just loading a 1
    
power_loop:
    beqz $t2, power_end # If exponent is 0, end loop
    mul.s $f16, $f16, $f12       # Multiply result by base
    subi $t2, $t2, 1           # Decrement exponent
    j power_loop
    
power_end:
    mov.s $f0, $f16
    jr $ra           # Return

.data
AddOp:  .byte '+' 
SubOp:  .byte '-' 
MulOp:  .byte '*' 
DivOp:  .byte '/' 
QuitOp: .byte '&' 
PowOp:  .byte '^' 
one: .float 1.0
float1: .asciiz "Enter First Float: "
operator: .asciiz "Enter Operator: "
float2: .asciiz "\nEnter Second Float: "
result: .asciiz "Result = "
exponent: .asciiz "\nEnter Exponent: "
gb: .asciiz "\nGoodbye."
invalid_op: .asciiz "Invalid operator was entered.\n"
.include "futils.asm"
