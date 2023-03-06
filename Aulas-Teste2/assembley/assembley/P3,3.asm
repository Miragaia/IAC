	.data
prompt1: .asciiz "Introduza um numero: "
result:	.asciiz "O fatorial do número inserido é: "

	.text
main:	la  $a0,prompt1
	li  $v0,4
	syscall
	
	li $v0, 5 
 	syscall
 	move $t1, $v0
 	
 	li $t2,1
 	
 	move $t0,$t1
for:	ble $t0,0,endfor
	mul $t2,$t2,$t0
	sub $t0,$t0,1
	j for	
 	
endfor: 	
	la  $a0,result
	li  $v0,4
	syscall
	move  $a0,$t2
	li $v0,1
	syscall

	li $v0, 10 #
 	syscall # exit()
