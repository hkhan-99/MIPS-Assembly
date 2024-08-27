#Hassan Khan
#Lab 3
#Hello World Program

.text
main:

#Printing the string "Hello World"
li $v0, 4 #Instructs the kernel that a string will be printed
la $a0, greeting #Identifying the string variable for the kernel to print 
syscall #invokes the kernel to perform an action; printing the string

# Exiting the program cleanly
li $v0, 10 #Instructs the kernel to exit the program
syscall #invokes the kernel to perform an action; exit the program

.data #Defining the string variable
greeting: .asciiz "Hello World\nGoodbye Cruel World!"


