# Hassan Khan
# Assignment #3

#------------ Procedure Calls ----------------

# vv parameter specifying the message to print
la $a0, welcome
jal printMsg

# vv parameter specifying the message to print
la $a0, seconds
jal getInt

# vv parameter specifying no. of seconds that was stored in $s0
#  ..now being moved to $t0 to be passed in the procedure calcMins
move $t0, $s0
jal calcMins

# vv parameter specifying no. of seconds that was stored in $s0
#  ..now being moved to $t1 to be passed in the procedure calcHours
move $t1, $s0
jal calcHours

# vv 1st parameter specifying the string to print
# .. 2nd parameter specifying the integer to print:
# ... which were the minutes stored is $t0, now being moved to $a1
# ... to be passed into the procedure printInt
la $a0, minutes
move $a1, $t0
jal printInt

# vv 1st parameter specifying the string to print
# .. 2nd parameter specifying the integer to print:
# ... which were the hours stored is $t1, now being moved to $a1
# ... to be passed into the procedure printInt
la $a0, hours
move $a1, $t1
jal printInt

# Simply printing the goodbye message
la $a0, bye
jal printMsg

j Exit # exiting cleanly

# ----------------- Procedure building --------------------------
.text
######################################################
# printMsg: 
# Prints a message: "Welcome to the time converter."
# Parameters:
# 1st parameter specfies the message to print
# Returns:  
# none 
#############################################
printMsg:
li $v0, 4
# address already in $a0
syscall
jr $ra

#################################################################
# getInt: 
# Prompt the user for an integer and return the value entered.
# Parameters:
# 1st parameter specfies the message to print
# Returns:  
# the integer value entered by user
#############################################
getInt:
li $v0, 4
# address already in $a0
syscall

li $v0, 5
syscall
move $s0, $v0 # saving results from syscall
jr $ra

#########################################################################
# calcMins: 
# Accepts an integer that represents seconds and converts the value to 
#  number of minutes."
# Parameters:
# 1st parameter specifies the number of seconds
# Returns:  
# the number of minutes
#############################################
calcMins:
div $t0, $t0, 60
jr $ra 

#########################################################################
# calcHours: 
# Accepts an integer that represents seconds and converts the value to 
#  number of hours."
# Parameters:
# 1st parameter specifies the number of seconds
# Returns:  
# the number of hours
#############################################
calcHours:
div $t1, $t1, 3600
jr $ra

###########################################################
# printInt: 
# Prints a label and an integer
# Parameters:
# 1st parameter specfies the string to print
# 2nd parameter specifies the integer to print,
# ..value stored in $a1 moved to $a0 for printing
# Returns:  
# none 
#############################################
printInt:
li $v0, 4
# address in $a0
syscall

li $v0,1
move $a0, $a1
syscall
jr $ra

##############################################
# Exit: Exits the program
# Parameters: 
# none
# Returns:  
# none 
#############################################
Exit:
li $v0, 10
syscall

.data
welcome: .asciiz "Welcome to the time converter.\n"
seconds: .asciiz "Enter the number of seconds: "
minutes: .asciiz "Number of minutes: "
hours: .asciiz "\nNumber of hours: "
bye: .asciiz "\nGoodbye!"

