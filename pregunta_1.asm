.data
	msg1: .asciiz "Insert n: "

.text
.globl main
main:
	#Print msg1:
	li $v0, 4
	la $a0, msg1
	syscall
	
	#Request user input:
	li $v0, 5
	syscall
	
	#Storage that input:
	move $s3, $v0

	#Initialise:
	li $s0, 0 #f0
	li $s1, 1 #f1
	j fib

fib:
	bne $s3, $zero, continue
	j exit

continue:
	move $t0, $s1
	add $s1, $s1, $s0
	move $s0, $t0
	sub $s3, $s3, 1
	j fib

exit:
	#Print number:
	li $v0, 1
	move $a0, $s1
	syscall

	#Exit program:
	li $v0, 10
	syscall