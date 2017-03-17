# Ali Altaf Salemwala
# Lab 3
# Part 2 - d

.globl CompareFP
main:
.data
	newLine:	.asciiz "\n"
.text
	li $a0, 2
	jal fillArray
	move $s0, $v0
	sll $a0, $a0, 2
	add $s1, $s0, $a0
	addi $s1, $s1, -4
compareLoop:
	lw $a0, ($s0)
	li $v0, 34
	syscall
	lw $a0, 4($s0)
	syscall
	la $a0, newLine
	li $v0, 4
	syscall
	lw $a0, ($s0)
	lw $a1, 4($s0)
	jal CompareFP
	add $a0, $v0, $0
	li $v0, 34
	syscall
	add $a0, $v1, $0
	syscall
	la $a0, newLine
	li $v0, 4
	syscall
	addi $s0, $s0, 4
	blt $s0, $s1, compareLoop
	li $v0, 10
	syscall
CompareFP:
#	addi $sp, $sp, -4
#	sw $ra, ($sp)
	andi $v0, $a0, 0x80000000
	andi $v1, $a1, 0x80000000
	beq $v0, $v1, sameSign
	beqz $v0, a0G
	j a1G
sameSign:
	sll $v0, $a0, 1
	sll $v1, $a1, 1
	andi $v0, $v0, 0xFF000000
	andi $v1, $v1, 0xFF000000
	beq $v0, $v1, sameExp
	bgtu $v0, $v1, a0G
	j a1G
sameExp:
	sll $v0, $a0, 9
	sll $v1, $a1, 9,
	bgtu $v0, $v1, a0G
	bgtu $v1, $v0, a1G
	j return
a0G:
	add $v0, $a0, $0
	add $v1, $a1, $0
	j return
a1G:
	add $v0, $a1, $0
	add $v1, $a0, $0
	j return
return:
#	lw $ra, ($sp)
#	addi $sp, $sp, 4
	jr $ra