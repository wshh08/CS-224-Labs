Lab3:
.data
	welcomeStr:	.asciiz "Welcome! This program will take from you a positive integer, and make an array of that size containing\nIEEE 754 single-precision non-special-case random values. It will also report the time taken to do this task.\nIt will also allow you to sort this array using a sorting algorithm of your choice, and will present the time taken by\nthe algorithm. You can do these tasks as many times as you want. Have fun!\n"
	NReqStr:	.asciiz "Enter the desired positive size of your array: "
.text
	la $a0, welcomeStr
	li $v0, 4
	syscall
NReq:
	la $a0 NReqStr
	syscall
	li $v0, 5
	bltz $v0, NReq
	move $s0, $v0		# $s0 contains N
	li $v0, 30
	syscall
	move $t0, $a0
	move $t1, $a1
	move $a0, $v0
	jal fillArray
	move $s1, $v0		# $s1 contains array beginning address
	li $v0, 30
	syscall			# HOW DO 64 BIT OPS???????
	li $v0, 10
	syscall