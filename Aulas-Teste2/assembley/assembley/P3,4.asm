	.data
result: .asciiz "Resultado final é "
nr1:	.asciiz "NR: "
	.text
main:	

	li $t0,5
for:	ble $t0,0,endfor

	la  $a0,nr1
	li  $v0,4
	syscall  
	
	li $v0, 5 
	syscall
	move $t2,$v0
	#if t2>0 entao soma
	
if:	ble $t2,0,zemaria
	add $t1,$t1,$t2
zemaria:
	
 	sub $t0,$t0,1
 	
	j for
	
endfor:
	la  $a0,result
	li  $v0,4
	syscall
	move  $a0,$t1
	li $v0,1
	syscall
	
	li $v0, 10 #
 	syscall # exit()