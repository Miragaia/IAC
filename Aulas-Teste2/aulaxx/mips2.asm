	.data
prompt1:	.asciiz	"Introduza um numero\n"
strpar: 	.asciiz	"O numero é par\n"
strimpt: 	.asciiz	"O numero é impar\n"
	.text
main:
	la  $a0,prompt1
	li  $v0,4		
	syscall			#print(prompt)
	
	li $v0, 5 
	syscall
	move $t0, $v0
	
	andi $t0,$v0,1
if: 	bne $t0,0,else
	la  $a0,strpar
	li  $v0,4
	syscall
	j endif

else: 	la, $a0, strimpt
	li $v0, 4
	syscall
endif: 	li, $v0, 10
	syscall