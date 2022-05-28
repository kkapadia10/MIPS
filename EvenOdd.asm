# Exercise 5. 
# Prints 'even' if the inputted number is even; and, 'odd' if the inputted number is odd.
# @author Kaden Kapadia
# @version 4/30/2022

.data
msg: .asciiz "Enter an integer: "
even: .asciiz "That number is even"
odd: .asciiz "That number is odd"
.text
.globl main2

main2: 
# prints the message
la $a0, msg
li $v0, 4
syscall

# reads and sets the inputted integer to $t0
li $v0, 5
syscall
move $t0, $v0

# divides the inputted integer by 2, and sets the remainder value to $t2 (the remainder value will either be 0 or 1)
li $t1, 2
div $t0, $t1
mfhi $t2

# if the remainder value equals 1, go to the odd print block
beq $t2, 1, oddblock

# print 'Even' uf the remainder value is not 1 (remainder value is 0)
la $a0, even
li $v0, 4
syscall

# jumps to the end 
j end

# prints 'Odd' if the remainder value is 1
oddblock:
la $a0, odd
li $v0, 4
syscall

# Exits the program
end:
li $v0, 10
syscall
