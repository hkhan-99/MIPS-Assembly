# Hassan Khan
# Lab 16

.text
main:

# Reading user input
la $a0, fahr_prompt
jal PromptInt
mov.s $f12, $f0

# Calling subroutine for conversion
jal f2c

# Printing result
la $a0, cels_prompt
jal PrintInt

jal PrintNewLine

# Check if Celsius <= 0
l.s $f1, zero    # Loading 0.0 into $f1
c.le.s $f0, $f1    # Comparing $f0 and $f1 (Celsius <= 0)
bc1t freeze_msg    # Branch to freeze_msg if celsius <= 0

# Check if Celsius >= 100
l.s $f1, hundred   # Loading 100.0 into $f1
c.le.s $f1, $f0    # Comparing $f1 and $f0 (100 <= Celsius)
bc1t boil_msg      # Branch to boil_msg if celsius >= 100

# Exiting cleanly
jal Exit

# -----------------------------------------
freeze_msg:
    # Printing freeze water message
    la $a0, freeze
    jal PrintString
    jal Exit

boil_msg:
    la $a0, boil  # Load address of message into $a0
    jal PrintString
    jal Exit

############################
# Function: Converts fahrenheit to celsius
# float f2c (float fahr)
# {
#  return ((5.0/9.0)*(fahr - 32.0));
# }
# 
# Parameter: user input of temperature in fahrenheit, stored in $f12
# Returns: converted celsius value in $f0
########################
f2c:
lwc1 $f16, const5 
lwc1 $f18, const9
div.s $f16, $f16, $f18 # (5.0/9.0)
lwc1 $f18, const32
sub.s $f18, $f12, $f18 # (fahr - 32.0)
mul.s $f0, $f16, $f18 # ((5.0/9.0)*(fahr - 32,0));

jr $ra

.data
const5: .float 5.0
const9: .float 9.0
const32: .float 32.0
fahr_prompt: .asciiz "Please enter temperature in Fahrenheit: "
cels_prompt: .asciiz "The temperature in Celsius is "
boil: .asciiz "You could boil water.\n"
freeze: .asciiz "You could freeze water.\n"
zero: .float 0.0           # Define 0.0 as a float
hundred: .float 100.0      # Define 100.0 as a float
.include "futils.asm"
