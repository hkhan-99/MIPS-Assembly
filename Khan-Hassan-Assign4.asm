# Hassan Khan
# Assignment #4

# Display prompt asking the user to enter the edge length of the base of right triangle
# int length = input("Please enter the edge length of the base of right triangle: ");

# While the entered length is greater than or equal to 0
# while (length >= 0) {
#      Initialize loop counter
#    int i = 1
    
#      Loop from 1 to the entered length
#     while (i <= length) {
#         Print '#' characters
#        print("#" repeated i times)
#        Increment loop counter
#        i = i + 1
#    }
    
# 	Take user input for a new edge length
#    	length = input("Please enter the edge length of the base of right triangle:");
#	if (length <= 0)
#	{
#		procedure call from utils.asm to exit cleanly: j Exit
#		print("Exiting the program");
#	}
# }
#---------------------------------------------------------------------------

.text
    main:
    # Display prompt asking the user to enter the edge length of the base of right triangle
    # int length = input("Please enter the edge length of the base of right triangle: ");
       
        la $a0, edge_length
        jal PromptInt
       
        move $s0, $v0    # passing in edge_val as parameter
	jal printTriangle

# While the entered length is greater than or equal to 0
# while (length >= 0) {
#      Initialize loop counter
#    int i = 1
    
#      Loop from 1 to the entered length
#     while (i <= length) {
#         Print '#' characters
#        print("#" repeated i times)
#        Increment loop counter
#        i = i + 1
#    }
    
# 	Take user input for a new edge length
#    	length = input("Please enter the edge length of the base of right triangle:");
#	if (length <= 0)
#	{
#		procedure call from utils.asm to exit cleanly: j Exit
#		print("Exiting the program");
#	}
# }

printTriangle:
    	blez  $s0, exitmsg # if $t0 = $s0 branch to endmsg
       beq $t0, $s0, Exit # for($t0 <= edge_length; $t0++)
                    		
        addi $t0, $t0, 1    # incrementing $t0
        li $t1, 1       # loading 1 in $t1

        jal PrintNewLine      # newline = new row

    inner_loop:
        bgt $t1, $t0, printTriangle  # for($t1 <= $t0; $t1++)

        li $v0, 4       # printing hashtags
        la $a0, hashtag
        syscall 
    
        addi $t1, $t1, 1    # incrementing $t1
        
        j inner_loop
        
        jr $ra
        
  # exiting cleanly    
        
   exitmsg:
   li $v0, 4
   la $a0, msg
   syscall
   li $v0, 10
   syscall
   
.data
    edge_length: .asciiz "Please enter the edge length of the base of right triangle: "
    hashtag: .asciiz "#"
    msg: .asciiz "Exiting the program."
.include "utils.asm"
