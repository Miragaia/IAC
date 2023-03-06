		.data
		.align 2
lista:		.space 24
str:		.asciiz "Insira 6 numeros: "
		.text
main:		#$t0=i
		li $t0,0				#i=0;
		li $v0,4
		la $a0,str
		syscall					#printstr("Insira 6 numeros: ");
		la $a0,lista				#$a0=&lista[0]
for:		bge $t0,6,endF
		li $v0,5
		syscall					#$v0=read_int();
		sll $t1,$t0,2				#$t1=i*4
		addu $t1,$a0,$t1			#$t1=lista + i*4
		sw $v0,0($t1)				#lista[i]=$v0;
		addi $t0,$t0,1				#i++;
		j for
endF:
		