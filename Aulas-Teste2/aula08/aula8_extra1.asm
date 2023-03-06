	.data
lista:	.word 4,3,-2,1,27,45
str:		.asciiz "O conteudo do Array é: \n"
str2:		.asciiz "- "
	.text
	li $t0,0   	#i=0
	la $a0,str
	li $v0,4
	syscall
	la $a1,lista	#$a0=&lista[0];
for:	bge $t0,6,endfor
	move $t1,$t0			#$t1=i;
	sll $t1,,$t1,2			#$t1=4i;
	addu $a2,$a1,$t1		#$a2=lista+4i;
	lw $a0,0($a2)			#$a0=cópia de lista[i]
	li $v0,1
	syscall
	la $a0,str2
	li $v0,4
	syscall					#print_int10(lista[i]);
	addi $t0,$t0,1 	#i++
	j for
endfor: li $v0, 10
	syscall