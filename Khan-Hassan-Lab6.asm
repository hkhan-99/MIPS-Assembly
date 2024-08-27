# Hassan Khan
# Lab 6

.text
main:

# Calling the functions
jal Hello
jal PrintNewLine
jal Goodbye

j Exit

.text
##############################################
# Hello: Prints the string "Hello World"
# Parameters: 
# none
# Returns:  
# none 
#############################################
Hello:
li $v0, 4
la $a0, hello_func
syscall
jr $ra


##############################################
# PrintNewLine: Prints a new line
# Parameters: 
# none
# Returns:  
# none 
#############################################
PrintNewLine:
li $v0, 4
la $a0, PNL_func
syscall
jr $ra

##############################################
# Goodbye: Prints the string "Goodbye!"
# Parameters: 
# none
# Returns:  
# none 
#############################################
Goodbye:
li $v0, 4
la $a0, goodbye_func
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
hello_func: .asciiz "Hello World"
PNL_func: .asciiz "\n"
goodbye_func: .asciiz "Goodbye!"
