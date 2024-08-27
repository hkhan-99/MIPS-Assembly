# Hassan Khan
# Assignment #1

# Favorite food questionnaire-
# taking string and integer inputs from user and output each input as result.

.text
main:
#Prompt for favorite food
li $v0, 4
la $a0, question1
syscall

#Read user's string input
li $v0, 8
la $a0, input
lw $a1, inputSize
syscall

#Prompt for how many times a week user eats their favorite food
li $v0, 4
la $a0, question2
syscall

#Read user's integer input
li $v0, 5
syscall

#Values entered are returned in $v0
#Saving that value in $t0
move $t0, $v0

############### vv OUTPUT vv ####################

#Output label of user's string input
li $v0, 4
la $a0, answer1
syscall

#Output user's string input
li $v0, 4
la $a0, input
syscall

#Since the user's integer input is to appear in the middle of a sentence,
#the output label for the integer is set in two parts.
#The first part of the output label (before the integer)
li $v0, 4
la $a0, answer2
syscall

#Output user's integer input
li $v0, 1
move $a0, $t0
syscall

#The second part of the output label (after the integer)
li $v0, 4
la $a0, answer2_1
syscall

#Exit program
li $v0, 10
syscall


.data
input:.space 81
inputSize: .word 80
question1: .asciiz "\nWelcome.\nWhat is your favorite food? "
answer1: .asciiz "\nYour favorite food is "

question2: .asciiz "How many times a week do you eat your favorite food? "
answer2: .asciiz "and you eat it "
answer2_1: " times a week.\nGoodbye!\n"
