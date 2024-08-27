# Lab 8 Solution
# Michelle Talley
# k = prompt("Please enter a value for k:");
# if (k == 0) {
#	a = b + c; 
# elseif (k == 1) {
#	a = d + e; 
# elseif (k == 2) {
#	a = d – e; 
# elseif (k == 3) {
#	a = b – c; 
# else {
#	a = 0;
#}
# print("The value of a is: " + a); 
#

.text
    #get user input
    la $a0,Inputk
    jal PromptInt
    move $s0,$v0

    # Load values from memory    
    # k is $s0
    # a is $s1
    lw $s2,b
    lw $s3,c
    lw $s4,d
    lw $s5,e
   
    # if block
    kis0:
        # if (k == 0)
        seq $t1, $s0, 0
        beqz  $t1, kis1
        # a = b + c
        add $s1,$s2,$s3 
        b end_if
    kis1:
        # if (k == 1)
        seq $t1, $s0, 1
        beqz $t1, kis2
        # a = d + e
        add $s1,$s4,$s5
        b end_if
    kis2:
        # if (k == 2)
        seq $t1, $s0, 2
        beqz $t1, kis3
        # a = d - e
        sub $s1,$s4,$s5
        b end_if
    kis3:
        # if (k == 3)
        seq $t1, $s0, 3
        beqz $t1, else
        # a = b - c
        sub $s1,$s2,$s3
        b end_if
    else:
        # else condition
        # a = 0
        move $s1,$zero
        b end_if
    end_if:
    
    # Store value back in a 
    sw $s1,a
    # Print the value to the console
    la $a0,Outputa
    lw $a1,a
    jal PrintInt
    
    # Exit the program
    jal Exit
    
.data
    a: .word 0
    b: .word 10
    c: .word 5
    d: .word 9
    e: .word 7
 
    Inputk:  .asciiz "Please enter a value for k:"
    Outputa: .asciiz "The value of a is: "
    
.include "utils.asm"

