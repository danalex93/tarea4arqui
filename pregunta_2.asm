.data
	msg1: .asciiz "Insert n: "
.text
.globl main
main:
	#Print msg1:
	li $v0, 4
	la $a0, msg1
	syscall

	#li.s $f0, 2.0
	#li.s $f1, 1.0
	#div.s $f12, $f1, $f0

	#Initialise:
	li.s $f0, 0.0 #f0
	li.s $f1, 1.0 #f1
	li.s $f2, 1.0 #f2
	li.s $f5, 1.0
	
	#Request user input:
	li $v0, 5
	syscall

	#Storage that input:
	move $s3, $v0
	j fib
fib:
	bne $s3, $zero, continue
	j exit

continue:
	mov.s $f4, $f1
	add.s $f1, $f1, $f0
	div.s $f0, $f5, $f1
	add.s $f2, $f2, $f0
	mov.s $f0, $f4
	sub $s3, $s3, 1
	j fib

exit:
	#Print number:
	li $v0, 2
	mov.s $f12, $f2
	syscall

	#Exit program:
	li $v0, 10
	syscall