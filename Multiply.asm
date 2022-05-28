# Exercise 4. 
# This program performs multiplication. It takes in two numbers and outputs their product. 
# @author Kaden Kapadia
# @version 4/30/2022

.data
msg: .asciiz "Enter an integer: "
msg2: .asciiz "Enter another integer: "
.text
.globl main

main: 
# prints the message
la $a0, msg
li $v0, 4
syscall

# reads sets the first integer to $t0
li $v0, 5
syscall
move $t0, $v0

# prints the message again
la $a0, msg2
li $v0, 4
syscall

# reads and sets the second integer to $t1
li $v0, 5
syscall
move $t1, $v0

# multplies the two integers together
mult $t0, $t1
mflo $t3

# prints out the product of the two integers
li $v0, 1
move $a0, $t3
syscall
