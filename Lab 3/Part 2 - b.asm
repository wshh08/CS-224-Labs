# Ali Altaf Salemwala
# Lab 3
# Part 2 - b

.globl get_rand_FP
.data
	n:	.asciiz "\n"
.text
main:
	li $t0, 10		# array of $t0 normal values of IEEE 754 32-bit floating-point numbers
loop:
	li $a0, 0xFE95AB23
	jal get_rand_FP
	add $a0, $v0, $0
	addi $t0, $t0, -1
	li $v0, 34
	syscall
	la $a0, n
	li $v0, 4
	syscall
	bnez $t0, loop
bitte:
	li $v0, 10
	syscall

get_rand_FP:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
find:
	li $v0, 41
	syscall
	bltz $a0, find
	jal special_case
	bnez $v0, find
	add $v0, $a0, $0
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 8
	jr $ra			# $v0 contians normal IEEE 754 32-bit floating-point number