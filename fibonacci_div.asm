.text
.globl main
main:
	li $s0, 2
	li $s1, 1
	div $s1, $s0
	
	li $v0, 1
	move $a0, $s1
	syscall;