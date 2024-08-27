# Hassan Khan
# Assignment #6

.text
main:
    # Convert to lowercase
    la $a0, prompt_tolow
    jal PrintString

    li $v0, 8 # Read string from input
    la $a0, converted_str
    li $a1, 100 # Maximum length
    syscall

    # Call tolow procedure
    la $a0, converted_str # Pass address of input string
    la $a1, converted_str # Pass address to store converted string
    jal tolow
    move $t0, $v0 # Store the number of translations for lowercase

    # Print result for lowercase conversion
    la $a0, result_tolow
    jal PrintString
    
    la $a0, converted_str
    jal PrintString

    # Print a newline
    jal PrintNewLine

    # Print the number of translations for lowercase conversion
    la $a0, trans_count_str
    jal PrintString

    # Print the number of translations for lowercase conversion
    li $v0, 1
    move $a0, $t0
    syscall

    # Print a newline
    jal PrintNewLine

    # Convert to uppercase
    la $a0, prompt_toup
    jal PrintString
    
    li $v0, 8 # Read string from input
    la $a0, converted_str
    li $a1, 100 # Maximum length
    syscall

    # Call toup procedure
    la $a0, converted_str # Pass address of input string
    la $a1, converted_str # Pass address to store converted string
    jal toup
    move $t0, $v0 # Store the number of translations for uppercase

    # Print result for uppercase conversion
    la $a0, result_toup
    jal PrintString

    la $a0, converted_str
    jal PrintString

    # Print a newline
    jal PrintNewLine

    # Print the number of translations for uppercase conversion
    la $a0, trans_count_str
    jal PrintString

    # Print the number of translations for uppercase conversion
    li $v0, 1
    move $a0, $t0
    syscall

    # Print a newline
    jal PrintNewLine

    # Exit
    jal Exit

#############################################################################
# tolow - Convert a null terminated ASCII string to all lowercase letters.
# Parameters:
#	$a0 - Memory location of the string to convert
#	$a1 - Memory address of the string to copy the converted string into
# Returns:
#	v0 - Number of characters that were translated to lowercase
##################################################################
tolow:
    li $v0, 0 # Initialize the counter for translations to zero
    move $t1, $a1 # Store the address of the destination string
loop_tolow:
    lb $t2, ($a0) # Load the character from the source string
    beq $t2, $zero, exit_tolow # If it's the null terminator, exit the loop
    li $t3, 'A' # Load the ASCII value of 'A'
    li $t4, 'Z' # Load the ASCII value of 'Z'
    blt $t2, $t3, store_tolow # If the character is less than 'A', store it
    bgt $t2, $t4, store_tolow # If the character is greater than 'Z', store it
    addi $t2, $t2, 32 # Convert uppercase to lowercase by adding 32
    addi $v0, $v0, 1 # Increment the counter for translations
store_tolow:
    sb $t2, ($t1) # Store the character into the destination string
    addi $a0, $a0, 1 # Move to the next character in the source string
    addi $t1, $t1, 1 # Move to the next position in the destination string
    j loop_tolow # Repeat the loop
    
exit_tolow:
    sb $zero, ($t1) # Add null terminator to the end of the converted string
    jr $ra # Return from the procedure

##########################################################################
# toup - Convert a null terminated ASCII string to all uppercase letters.
# Parameters:
#	$a0 - Memory location of the string to convert
#	$a1 - Memory address of the string to copy the converted string into
# Returns:
#	$v0 - Number of characters that were translated to uppercase
################################################################
toup:
    li $v0, 0 # Initialize the counter for translations to zero
    move $t1, $a1 # Store the address of the destination string
loop_toup:
    lb $t2, ($a0) # Load the character from the source string
    beq $t2, $zero, exit_toup # If it's the null terminator, exit the loop
    li $t3, 'a' # Load the ASCII value of 'a'
    li $t4, 'z' # Load the ASCII value of 'z'
    blt $t2, $t3, store_toup # If the character is less than 'a', store it
    bgt $t2, $t4, store_toup # If the character is greater than 'z', store it
    addi $t2, $t2, -32 # Convert lowercase to uppercase by subtracting 32
    addi $v0, $v0, 1 # Increment the counter for translations
store_toup:
    sb $t2, ($t1) # Store the character into the destination string
    addi $a0, $a0, 1 # Move to the next character in the source string
    addi $t1, $t1, 1 # Move to the next position in the destination string
    j loop_toup # Repeat the loop
    
exit_toup:
    sb $zero, ($t1) # Add null terminator to the end of the converted string
    jr $ra # Return from the procedure
    
.data
prompt_tolow: .asciiz "Enter a string to convert to lowercase: "
prompt_toup: .asciiz "Enter a string to convert to uppercase: "
converted_str: .space 101 # Space for storing the converted string, including null terminator
newline: .asciiz "\n"
result_tolow: .asciiz "The converted string is: "
result_toup: .asciiz "The converted string is: "
trans_count_str: .asciiz "The number of translations is: "
.include "utils.asm"
