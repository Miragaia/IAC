			.data
frase:			.asciiz "Te3m In5tei1ros Mis8tura9dos" 
msg:			.asciiz "\nO nr de Alfas e: "

			.text
main:			#n:v0,a0 | frase:a0
			li $v0,4
			la $a0,msg
			syscall				#print_str(msg)
			
			la $a0,frase
			jal n_alphas			#n=n_alphas(frase)
			move $a0,$v0
			li $v0,1
			syscall				#print_int10(n)
			li $v0,10
			syscall				#exit()
			
n_alphas:		#str:a0 | i: t0 | alphas:v0 | &str[i]: t1 | str[i]: t2
			li $v0,0			#alphas=0
			li $t0,0			#i=0
			
for:			addu $t1,$a0,$t0		#&str[i]
			lb $t2, 0($t1)			#str[i]
			beq $t2,'\0',endFor	
			
			blt $t2, 'A',endIf
			bgt $t2, 'z',endIf
if:			addi $v0,$v0,1			#alphas++

endIf:			addi $t0,$t0,1			#i++
			j for

endFor: 		jr $ra