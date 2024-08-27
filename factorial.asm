##############################################	
# factorial.asm
# Description:
# 1. Asks the user for an integer
# 2. Via to fact, calculates the factorial
#    of the number entered
# 3. Prints the resulting factorial
##############################################	

.data
	InInteger:   .asciiz "Please enter an integer:"
	Result:      .asciiz "The factorial result is:"
.text
	
	
	# Request an integer value:
 	la $a0, InInteger  #load the base address of message 	
	addi $v0, $zero, 4
	syscall
	
	# Read the Entered Integer:
	addi $v0, $zero, 5
	syscall	
		
	move $a0, $v0
	jal fact
	move $s0, $v0
		
 	la $a0, Result  #load the base address of message 
 	addi $v0, $zero, 4
	syscall	

	move $a0, $s0
 	addi $v0, $zero, 1
	syscall	
	
	j exit

##############################################	
# fact
# Description:
#      if(n == 1) return 1;
#        else return (n *fact(n-1));
#
# Parameters:
#    $a0 - n
#
# Returns:
#   $v0 - the factorial
##############################################	
fact:
	# Push $ra on the stack
	addi $sp, $sp, -4     # adjust stack 
	sw   $ra, 0($sp)      # save return address
	# Push $a0 on the stack    
	addi $sp, $sp, -4     # adjust stack
	sw   $a0, 0($sp)      # save argument
	
	# Procedure logic starts here    
	bne  $a0,1,recur      # if n !-=1, branch to recur 
	addi $v0, $zero, 1    # if not, result is 1in $v0 - exit condition
	    
	# Pop $a0 off the stack    
	lw   $a0,0($sp)       
	addi $sp, $sp, 4        
	# Pop $ra off the stack   
	lw   $ra,0($sp)	     
	addi $sp, $sp, 4

	jr   $ra              # Last return

recur:	
	addi $a0, $a0, -1     # else decrement n ($a0)      
	jal  fact             # recursive call
	    
	# Pop $a0 off the stack    
	lw   $a0,0($sp)        
	addi $sp, $sp, 4        
	# Pop $ra off the stack   
	lw   $ra,0($sp)	
	addi $sp, $sp, 4
	
	mul  $v0, $a0, $v0    # multiply to get result    
	jr   $ra              # and return

 #exit
exit:

   li $v0, 10
   syscall
