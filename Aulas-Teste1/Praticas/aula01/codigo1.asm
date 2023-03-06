	.data
minhafrase: .asciiz	"Ola mundo"

	.text
main:	addi $v0,$0, 4
	la	$a0, minhafrase
	syscall	
	addi $v0,$s0,10
	syscall
	