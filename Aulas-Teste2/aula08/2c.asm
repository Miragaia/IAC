		.data
maius:		.asciiz "texto em maiusculas"
minus:		.space 20
		.text
		.globl main
main:		#i=$t0; &minus[0]=$a0; &maius[0]=$a1; &minus[i]=$t1; &maius[i]=$t2; cópia de minus[i]=$t3
		la $a0,maius
		la $a1,minus
		li $t0,0
while:		addu $t1,$a0,$t0		#$t1=&maius[0+i*1];
		lb $t3,0($t1)			#$t3=maius[i];
		beq $t3,'\0',endW		#if(maius[i]=="\0"):goto(endW)
		blt $t3,'A',else		#if(maius[i]<'A'):goto(else)
		bgt $t3,'Z',else		#if(maius[i]>'Z'):goto(else)
		addi $t3,$t3,'a'		#$t3+="a";
		subi $t3,$t3,'A'		#$t3-="A";
else:		addu $t2,$a1,$t0		#$t2=&minus[0+i*1]
		sb $t3,0($t2)
		addi $t0,$t0,1			#i++;
		j while
endW:		li $v0,4
		la $a0,minus
		syscall				#printstr(maius);
		li $v0,10
		syscall				#exit();