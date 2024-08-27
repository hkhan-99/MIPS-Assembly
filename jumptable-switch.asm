# $s0 = x
# $v0 = y
# x = 32; 
# z = prompt("Input a value from 1 to 3")
# switch (z) 
# case(1):  
#  x = x << 1; 
# break; 
# case(2):  
# x  = x << 2; 
# break; 
# case(3):  
# x = x << 3; 
# break; 
#print (x)
      
.data 
.align   2 
jumptable: .word   case0, case1, case2, case3 
prompt : .asciiz  "\n\nInput a value from 1 to 3: " 
.text 

# Print the prompt 
li $v0, 4   
la  $a0, prompt         
syscall 
li $v0, 5   
# Code to read an integer 
syscall 

# Save $v0 to $s1
move $s1,$v0

# Initialize $s0 to 32
li $s0,32

# Default for less than one 
blez $s1, output
# Default for greater than 3 
bgt $s1, 3, output     

# Load address of jumptable 
la $s3, jumptable  
# Compute word offset using sll or mul
#sll $t0, $s1, 2  
mul $t0,$s1,4
# Compute word offset into the jumptable
add $t1, $s3, $t0     
#Load a  a pointer into jumptable 
lw $t2, 0($t1) 
# Jump to the location in the jumptable 
jr $t2 
# Jump to specific case â€œswitchâ€? 
case0:   
# Empty case, place holder in jumptable       
b output 
case1:   
# Shift left logical one bit 
sll $s0, $s0, 1 
b output 
case2:   
# Shift left logical two bits 
sll $s0, $s0, 2 
b output 
case3:   
# Shift left logical three bits 
sll $s0, $s0, 3 
output: 
# Code to print an integer is 1 
li $v0, 1   
move $a0, $s0 
syscall 

# Exit cleanly
exit:
li $v0,10
syscall         
