	.data
prompt1: 	.asciiz "Introduza uma string\n"
result: 	.asciiz "O número de carateres numéricos"
str:		.space 40
	.text
main: 	la $a0,prompt1
	li $v0, 4
	syscall
	
	la $a0,str	#$a0=$&str[0]
	li $a1,40
	li $v0,8
	syscall	
	li $t1,0  	#$t1=n=0
	li $t0,0  	#$t0=i=0
for:	addu $t2, $a0,$t0	#$t2=&str[i];
	lb $t3,0($t2)		#$t3=cópia de str[i];
	beq $t3,'\0',endfor
if: 	blt $t3, '0',endif
	bgt $t3, '9',endif
	addi $t1, $t1,1
endif: 	addi $t0,$t0,1
	j for
endfor: la $a0,result
	li $v0, 4
	syscall
	move $a0,$t1	#$a0=n;
	li $v0, 1
	syscall
	
	la $v0, 10
	syscall
	
	
	