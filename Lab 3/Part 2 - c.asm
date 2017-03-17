# Ali Altaf Salemwala
# Lab 3
# Part 2 - c

.globl fillArray
main:
	li $a0, 5
	jal fillArray
	add $t0, $a0, $0
	add $a1, $v0, $0
print:
	lw $a0, ($a1)
	li $v0, 34
	syscall
	addi $t0, $t0, -1
	addi $a1, $a1, 4
	bnez $t0, print
	li $v0, 10
	syscall
fillArray:
	addi $sp, $sp, -16		# $a0 contains desired array size
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $a0, 0($sp)
	sll $a0, $a0, 2
	li $v0, 9
	syscall
	sw $v0, 12($sp)
	add $s0, $v0, $0
	add $a0, $v0, $a0
fill:
	beq $s0, $a0, filled
	jal get_rand_FP
	sw $v0, ($s0)
	addi $s0, $s0, 4
	j fill
filled:
	lw $v0, 12($sp)		# $v0 contains beginning address of array
	lw $ra, 8($sp)
	lw $s0, 4($sp)
	lw $a0, 0($sp)		# $ao contains size of array
	addi $sp, $sp, 16
	jr $ra