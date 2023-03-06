	.data
lista:	.space 24
str:	.asciiz "Insira 6 numeros: "
	.text
	li $t0,0	#$t0=i=0
	la $a0,str
	li $v0, 4
	syscall
	la $a1,lista	#$a1=&lista[0];
for:	bge $t0,6,endfor
	li $v0, 5
	syscall
	sll $t1,$t0,2			#$t1=4i;
	addu $t1,$a0,$t1		#$t1=lista + i*4
	sw $v0,0($t1)			#lista[i]=$v0;
	addi $t0,$t0,1			#i++;
	j for
endfor: 
	li $v0,10
	syscall	
	
	