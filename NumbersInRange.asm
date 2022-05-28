# Exercise 6. 
# Gets a low value, a high value, and a step value. Prints all values in the range such that 
# low + step*(x) > high. 
# For example: if low is 2, high is 9, and step is 3, print: 2 5 8. 
# @author Kaden Kapadia
# @version 4/30/2022

.data
low: .asciiz "Enter an integer which will act as the lower value: "
high: .asciiz "Enter an integer which will act as the higher value: "
step: .asciiz "Etner the step amount: "

error: .asciiz "Make sure high value > low value "
addspace: .asciiz " "
.text
.globl main3

main3:
# prints the low value message
la $a0, low
li $v0, 4
syscall

# stores the low value in $t0
li $v0, 5
syscall
move $t0, $v0

# prints the high value message
la $a0, high
li $v0, 4
syscall

# stores the high value in $t1
li $v0, 5
syscall
move $t1, $v0

# prints the step value message
la $a0, step
li $v0, 4
syscall

# stores the step value in $t2
li $v0, 5
syscall
move $t2, $v0

# throws the error message if low > high
bgt $t0, $t1, errorblock

# prints the low value (low will always be printed because that is where the numbers start)
move $a0, $t0
li $v0, 1
syscall

# prints a ' ' after a number is printed
jal space

# if high > low, go to the valid block
blt $t0, $t1, valid

valid:
# sets $t3 to $t0 (low) + $t2 (step)
addu $t3, $t0, $t2
# if $t3 > high, go to the end block
bgt $t3, $t1, end
# if $t3 <= high, print the value of $t3
move $t0, $t3
move $a0, $t0
li $v0, 1		
syscall

# prints a ' ' after a number is printed
jal space

# repeats the valid loop until $t3 > high
j valid

# error message is printed if low > high
errorblock:
la $a0, error
li $v0, 4
syscall
j end

# prints a ' ' after a number is printed
space:
la $a0, addspace
li $v0, 4
syscall
jr $ra

# Exits the program
end:
li $v0, 10
syscall
