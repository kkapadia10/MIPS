# Extra Exercise. 
# The program chooses a random number, and asks the user to guess that number.
# The program will output hints such as 'too high' or 'too low' to make it easier for the user to guess the number. 
# For example: if the number is 70 and the user guesses 50, 'too low' is printed; similarly, if 90 is guessed, 'too high' is printed.
# @author Kaden Kapadia
# @version 4/30/2022

.data
enter: .asciiz "\nEnter a guess (the range for the number is 1-1000): "
low: .asciiz "Your guess is too low "
high: .asciiz "Your guess is too high "
correct: .asciiz "Congrats! Your guess is correct! "
.text
.globl main3

random:
# generates a random number from 1-1000, and stores it in $t0
li $a1, 1000
li $v0, 42
syscall
move $t0, $a0
syscall

main3:
# gets the user's guess
jal guess
# if the guess is equal to the random number, go to equal
beq $t0, $t1, equal
# if the guess is bigger than the random number, go to guessbig
blt $t0, $t1, guessbig
# if the guess is less than the random number, go to guesssmall
bgt $t0, $t1, guesssmall

# asks the user to guess a number
guess:
la $a0, enter
li $v0, 4
syscall

# stores the guess value to $t1
li $v0, 5
syscall
move $t1, $v0

jr $ra

# if the guess is higher than the random number, prints the high message
guessbig:
la $a0, high
li $v0, 4
syscall

# goes back to the start and redos the guess
j main3

# if the guess is smaller than the random number, prints the low message
guesssmall:
la $a0, low
li $v0, 4
syscall

# goes back to the start and redos the guess
j main3

# If the guess is correct, prints the correct message
equal:
la $a0, correct
li $v0, 4
syscall

# Exits the program
li $v0, 10
syscall