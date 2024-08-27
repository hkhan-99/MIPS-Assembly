# Hassan Khan
# Lab 9

#int a = 0;
#int b = 10;
#int c = 5;
#int d = 9;
#int e = 7;
#int k = input("Please enter a value for k:");
#while (k >= 0) {

# if (k == 0) {
# a = b + c;
# } elseif (k == 1) {
# a = d + e;
# } elseif (k == 2) {
# a = d - e;
# } elseif (k == 3) {
# a = b - c;
# } else {
# a = 0;
# }
# print("The value for a is:" + a);
# k = input("Please enter a value for k:");
# }
# print("Goodbye");

.text
    # 'Step1: Setting the sentinel value- prompting user for k value
    la $a0, enterprompt
    jal PromptInt
    # reading k value and saving it in $t0
    move $t0, $v0 # k is in $t0

    # Load values from memory into registers
    lw $s0, a
    lw $s1, b
    lw $s2, c
    lw $s3, d
    lw $s4, e

    # 'Step 2: Creating the label for the start of while loop
    while_loop:
    # 'Step 4: Checking in place for the sentinel- if k is less than 0
    blt $t0, 0, end_while

    # If statements
    beq $t0, 0, if_k_0
    beq $t0, 1, if_k_1
    beq $t0, 2, if_k_2
    beq $t0, 3, if_k_3

    # Invalid conditions
    bgt $t0, 3, else_k_gt_3 # k greater than 3
    blt $t0, 0, else_k_lt_0 # k less than 0

    # if (k == 0) {
    # a = b + c;
    if_k_0:
        add $s0, $s1, $s2
        j end_if

    # elseif (k == 1) {
    # a = d + e;
    if_k_1:
        add $s0, $s3, $s4
        j end_if

    # elseif (k == 2) {
    # a = d – e;
    if_k_2:
        sub $s0, $s3, $s4
        j end_if

    # elseif (k == 3) {
    # a = b – c;
    if_k_3:
        sub $s0, $s1, $s2
        j end_if

    # else {
    # a = 0;
    # }
    else_k_gt_3:
     li $s0, 0
    else_k_lt_0:
        li $s0, 0

    # 'Step 6: end_if with the service call to print the string label and integer
   end_if:
        # Printing the string
        li $v0, 4
        la $a0, valueprompt
        syscall

        # Printing the integer
        li $v0, 1
        move $a0, $s0
        syscall
        
        # newline after value is printed
        jal PrintNewLine

        # 'Step 5: Setting sentinel to be checked- prompting user for k value again
        li $v0, 4
        la $a0, enterprompt
        syscall

        # reading k value and saving it in $t0
        li $v0, 5
        syscall 
        move $t0, $v0 # k is in $t0


        # Jump back to the start of the while loop
        j while_loop

# 'Step 3: Create the label for the end of while loop
end_while:
    # Printing "Goodbye!"
    li $v0, 4
    la $a0, end
    syscall
    # Exiting cleanly
    j Exit
    
.data
a: .word 0
b: .word 10
c: .word 5
d: .word 9
e: .word 7

enterprompt: .asciiz "Please enter a value for k: "
valueprompt: .asciiz "The value of a is: "
end: .asciiz "Goodbye!"
.include "utils.asm"
