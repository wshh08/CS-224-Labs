.globl FastSort
main:
.data
	newLine:	.asciiz "\n"
.text
	li $a0, 2
	jal fillArray
	move $t0, $a0
	move $a1, $v0
	move $s0, $a1
	move $s1, $a0
	li $t1, 1
print:
	lw $a0, ($a1)
	li $v0, 34
	syscall
	addi $t0, $t0, -1
	addi $a1, $a1, 4
	bnez $t0, print
	beqz $t1, quit
	la $a0, newLine
	li $v0, 4
	syscall
	move $a0, $s0
	move $a1, $s1
	jal FastSort
	move $a1, $s0
	move $t0, $s1
	li $t1, 0
	j print
quit:
	li $v0, 10
	syscall
FastSort: