# Hassan Khan
# Lab #15

.text
main:
    # Loading values
    lwc1 $f0, hourlyRate # lwc1- "load word co-processor 1"   
    lwc1 $f1, constantExpense     
    lwc1 $f2, numberHours         

    # Prompting user to enter number of hours         
    la $a0, prompt
    jal PromptInt

    move $a0, $v0    # Moving input value to $a0

    
    mtc1 $a0, $f2 # moving to co-processor 1 / from a standard register to a floating point register ($a0 -> $f2)
    cvt.s.w $f2, $f2 # Converting the integer input to floating point- s <- w (word to float)

    # Calculate expenses
    jal calcExp 

    # Printing total expenses
    la $a0, total
    jal PrintString

    li $v0, 2     # service call for printing a float
    mov.s $f12, $f0 # "mov.s" is used when moving between floating point registers ($f12 -> $f3)
    syscall

    # Exiting cleanly
    li $v0, 10
    syscall

calcExp:
    # Calculations
    mul.s $f0, $f0, $f2    # hourlyRate * numberHours
    add.s $f0, $f0, $f1    # (hourlyRate * numberHours) + constantExpense
    jr $ra

.data
# String labels
prompt: .asciiz "Please enter the number of hours: "
total: .asciiz "The total expenses are "

# Variables
hourlyRate: .float 10.5
numberHours: .float 0.0
constantExpense: .float 315.30
expenses: .float 0.0
.include "utils.asm"
