		.data
minus:		.asciiz "texto em minusculas"
maius:		.space 20
		.text
		.globl main
main:		#i=$t0; &minus[0]=$a0; &maius[0]=$a1; &minus[i]=$t1; &maius[i]=$t2; cópia de minus[i]=$t3
		la $a0,minus
		la $a1,maius
		li $t0,0
while:		addu $t1,$a0,$t0		#$t1=&minus[0+i*1];
		lb $t3,0($t1)			#$t3=minus[i];
		beq $t3,'\0',endW		#if(minus[i]=="\0"):goto(endW)
		blt $t3,'a',else		#if(minus[i]<'a'):goto(else)
		bgt $t3,'z',else		#if(minus[i]>'z'):goto(else)
		addi $t3,$t3,'A'		#$t3+="A";
		subi $t3,$t3,'a'		#$t3-="a";
else:		addu $t2,$a1,$t0		#$t2=&maius[0+i*1]
		sb $t3,0($t2)
		addi $t0,$t0,1			#i++;
		j while
endW:		li $v0,4
		la $a0,maius
		syscall				#printstr(maius);
		li $v0,10
		syscall				#exit();
