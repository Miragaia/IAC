	.data
resultado: .asciiz "Resultado final é "
nr1:	.asciiz "NR 1:"
nr2:	.asciiz "NR 2:"
	.text
main:	la  $a0,nr1
	li  $v0,4
	syscall  
	
	li $v0, 5 
 	syscall
 	move $t0, $v0
 	
 	la  $a0,nr2
	li  $v0,4
	syscall
	
	li $v0, 5 
 	syscall
 	move $t1, $v0
 	
 	la  $a0,resultado
	li  $v0,4
	syscall
	
 	add $t2, $t0,$t1
 	move $a0,$t2
	li $v0,1
 	syscall 
 	
 	li $v0, 10 #
 	syscall # exit()
 	
