# Matthew Wagers & Hassan Khan
# Team Lab 
# CSCI 2340

##############################################################

# // Function to count occurrences of a character in a string
# function int countOccurrences(string str, char ch):
#     int count = 0
#     for each character c in str:
#         if c equals ch:
#             increment count by 1
#     return count
# 
# // Main function
# function int main():
#     string inputString
#     char inputChar
#     int occurrences
#     
#     // Prompt user for input
#     print("Please enter a string: ")
#     inputString = readString()
#     
#     print("Please enter a character to search for: ")
#     inputChar = readChar()
#     
#     // Calling the CountOccur procedure
#     countOccur(inputString, inputChar)
#     
#     // Display results
#     print("Search string = ")
#     print(inputString)
#     print("We found the character ")
#     print(inputChar)
#     print(" ")
#     print(occurrences)
#     print(" times")
#     
#     return value
#	Exiting the program cleanly

#################################

.data
promptString: .asciiz "Please enter a string: "
promptChar: .asciiz "Please enter a character to search for: "
outputString: .asciiz "\nSearch string = "
resultMsg: .asciiz "We found the character "
timesMsg: .asciiz " times\n"
a_space: .asciiz " "
inputString: .space 64
inputChar: .space 2


.text
.globl main

main:
	# Print prompt for string
	li $v0, 4
	la $a0, promptString
	syscall
	
	# Read the string
	li $v0, 8
	la $a0, inputString
	li $a1, 64
	syscall
	
	# Print the prompt for the Character to count
	li $v0, 4
	la $a0, promptChar
	syscall
	
	# Read the character
	li $v0, 12
	syscall
	sb $v0, inputChar
	
	# Call CountOccur
	la $a0, inputString
	lb $a1, inputChar
	jal CountOccur
	
	# Save result to $s0
	move $s0, $v0
	
	# Print the string that was entered
	li $v0, 4
	la $a0, outputString
	syscall
	li $v0, 4
	la $a0, inputString
	syscall
	
	# Print the character that was searched
	li $v0, 4
	la $a0, resultMsg
	syscall
	li $v0, 11
	lb $a0, inputChar
	syscall
	
	# This is a space :)
	li $v0, 4
	la $a0, a_space
	syscall
	
	# Print the number of characters found
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, timesMsg
	syscall
	
	
	# Exit the program
	li $v0, 10
	syscall

.data
.include "count-occur.asm"
