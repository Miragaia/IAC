		.data
prompt1:	.asciiz "Introduza uma string\n"
result:		.asciiz "O número de carateres numéricos: "
str:		.space 40
		.text
main:		#i=$t0; n=$t1; &str[0]=$a0; $t2=&str[0+i*1]; $t3= cópia de str[i]
		la $a0,prompt1
		li $v0,4
		syscall				#print_str(prompt1);			
		la $a0,str			#$a0=$&str[0]
		li $a1,40
		li $v0,8
		syscall				#read_string(str,40);
		li $t1,0			#n=0;
		li $t0,0			#i=0;
for:		addu $t2,$a0,$t0		#$t2=&str[i];
		lb $t3,0($t2)			#$t3=cópia de str[i];
		beq $t3,'\0',endF		#if(str[i]==0):goto(endF);
		blt $t3,'0',else		#if(str[i]<'0':goto(else);
		bgt $t3,'9',else		#if(str[i]>'9':goto(else);
		addi $t1,$t1,1			#n++;
else:		addi $t0,$t0,1			#i++;
		j for
endF:		la $a0,result
		li $v0,4
		syscall				#print_str(result);
		move $a0,$t1			#$a0=n;
		li $v0,1
		syscall				#print_int(n);
		li $v0,10
		syscall				#exit();