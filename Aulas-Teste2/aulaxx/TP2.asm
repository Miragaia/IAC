		.data
msg:		.asciiz "\n-->Teste2 de IAC, ex2b<--"
minus:		.asciiz "\nO nr de minusculas e: "
		
		.text
main:		#msg:a0 | minus:a0 | return de nr_minus(msg):v0,a0
		li $v0,4
		la $a0,msg
		syscall				#print_str(msg)
		la $a0,minus
		syscall				#print_str(minus)
		la $a0,msg
		jal nr_minus
		move $a0,$v0
		li $v0,1
		syscall				#print_int10(nr_minus(msg))
		li $v0,10
		syscall				#exit()

nr_minus:	#mins:t0,v0 | s:a0 | *s:t1
		li $t0,0			#mins=0
while:		lb $t1,0($a0)			#*s
		beq $t1,'\0',endWh
		blt $t1,'a',endIf
		bgt $t1,'z',endIf
		addi $t0,$t0,1			#mins++
endIf:		addi $a0,$a0,1			#s++
		j while
endWh:		move $v0,$t0
		jr $ra
		
