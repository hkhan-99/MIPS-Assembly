# Hassan Khan
# Lab #12

##############################################	
# Taken from factorial.asm
# Description:
# Passes the integer to the add_r procedure in $a0.
# The return value from add_r is stored in $v0.
# Prints the returned value.  
##############################################	

.data
	InInteger:   .asciiz "Please enter an integer: "
	Result:      .asciiz "Returned value = "
.text
	
	
	# Request an integer value:
 	la $a0, InInteger  #load the base address of message 	
	addi $v0, $zero, 4
	syscall
	
	# Read the Entered Integer:
	addi $v0, $zero, 5
	syscall	
		
	move $a0, $v0
	jal add_r
	move $s0, $v0
		
 	la $a0, Result  #load the base address of message 
 	addi $v0, $zero, 4
	syscall	

	move $a0, $s0
 	addi $v0, $zero, 1
	syscall	
	
	j exit

##############################################	
# add_r
# Description:
# int add_r(int n) 
# { 
#	if (n != 0) return n + add_r(n - 1);
#	else return 0;
# } 
#
# Parameters:
#    $a0 - n
#
# Returns:
#   $v0 - the factorial
##############################################	
add_r:
	# Push $ra on the stack
	addi $sp, $sp, -4     # adjust stack 
	sw   $ra, 0($sp)      # save return address
	# Push $a0 on the stack    
	addi $sp, $sp, -4     # adjust stack
	sw   $a0, 0($sp)      # save argument
	
	# Procedure logic starts here    
	bne  $a0,0,recur      # if n !-=0, branch to recur 
	addi $v0, $zero, 0    # if not, result is 0 in $v0 - exit condition
	    
	# Pop $a0 off the stack    
	lw   $a0,0($sp)       
	addi $sp, $sp, 4        
	# Pop $ra off the stack   
	lw   $ra,0($sp)	     
	addi $sp, $sp, 4

	jr   $ra              # Last return

recur:	
	addi $a0, $a0, -1     # else decrement n ($a0)      
	jal  add_r             # recursive call
	    
	# Pop $a0 off the stack    
	lw   $a0,0($sp)        
	addi $sp, $sp, 4        
	# Pop $ra off the stack   
	lw   $ra,0($sp)	
	addi $sp, $sp, 4
	
	add  $v0, $a0, $v0    # addition to get resulting factoria;    
	jr   $ra              # and return the result value

 #exit
exit:

   li $v0, 10
   syscall
