# Extra Exercise. 
# The program computes the fibonacci sequence. 
# For example, If the inputted number is 9, the program will run 9 fibonacci sequence's and return a value of 34.
#
# THE MESSAGE BELOW IS IMPORTANT
# Keep in mind that running the fitbonacci sequence 9 times will result in the 10th value of the sequence.
#
# @author Kaden Kapadia
# @version 4/30/2022

.data
fibonacci: .asciiz "Enter the number of fibonaccis you want the result of (number > 0 and if you enter too high of a number, the program will take some time to complete):  "
output1: .asciiz "Completing the fibonacci algorithm "
output2: .asciiz " times results in a value of "
newline: .asciiz "\n"
.text
.globl main4

main4:
# Asks the user to enter a number
la $a0, fibonacci   
li $v0, 4
syscall

# stores the user input to $t0
li $v0, 5  
syscall
move $t0, $v0

# Goes to the fib code block
move $a0, $t0
move $v0, $t0
jal fib
# stores the result in $t1
move $t1, $v0

# Prints the output1 statement
la $a0, output1
li $v0, 4
syscall

# Prints the value of n
move $a0, $t0
li $v0, 1
syscall

# Prints the output2 statement
la $a0, output2
li $v0, 4
syscall

# Prints the answer value
move $a0, $t1
li $v0, 1
syscall

# Prints a new line
la $a0, newline
li $v0, 4
syscall

# Ends the program
li $v0, 10
syscall

# Fib code block, calculates and returns the fibonacci sequence
fib:
# if user inputted number is 0, go to the zero code block
beqz $a0, zero
# if the user inputted number is 1, go to the one code block
beq $a0, 1, one

# Stores the adress of the fibonacci calculation on the stack
sub $sp, $sp, 4
sw $ra, 0($sp)

# subtracts the user inputted value by 1
sub $a0,$a0,1
# calls the fib code block with the new user inputted value (orignal number - 1)
jal fib
add $a0, $a0, 1

# stores the return address from the stack
lw $ra, 0($sp)
add $sp, $sp, 4

# pushes the return value onto the stack
sub $sp, $sp, 4
sw $v0, 0($sp)

# Stores the return adress onto the stack
sub $sp, $sp, 4
sw $ra, 0($sp)

# subtracts the user inputted value by 2
sub $a0, $a0, 2
# calls the fib code block with the new user inputted value (orignal number - 2)
jal fib
add $a0, $a0, 2

# stores the return address from the stack
lw $ra, 0($sp)
add $sp, $sp, 4

# pops the return value from the stack
lw $s0, 0($sp)
add $sp, $sp, 4

# computes the fibonacci sequence: each number is the sum of the two preceding numbers
add $v0, $v0, $s0
jr $ra

# the zero code block
zero:
li $v0, 0
jr $ra

# the one code block
one:
li $v0, 1
jr $ra