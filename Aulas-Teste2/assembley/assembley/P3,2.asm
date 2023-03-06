	.data
prompt1: .asciiz "Introduza um numero: "
	.text
main:	la  $a0,prompt1
	li  $v0,4
	syscall
	
	li $v0, 5 
 	syscall
 	move $t1, $v0
 	
	li $t0,0
for:	bge $t0,$t1,endfor
	li $a0,'-'
	li $v0,11
	syscall
	addi $t0,$t0,1
	j for	
 	
endfor: 	li $v0, 10 #
 	syscall # exit()
