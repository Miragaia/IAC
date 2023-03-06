		.data
prompt1:	.asciiz "Introduza um numero\n"
result1:	.asciiz "O fatorial do numero "
result2:	.asciiz " é: "

		.text
main:		#n=$s0; f=$s1
		la $a0, prompt1
		li $v0,4
		syscall					#print_str(prompt1)
		li $v0,5
		syscall					#read_int()
		move $s0,$v0				#n=read_int()
		move $a0,$v0
		jal factorial				#factorial(n)
		move $s1,$v0				#f=factorial(n)
		la $a0, result1
		li $v0,4
		syscall					#print_str(result1)
		move $a0,$s0
		li $v0,1
		syscall					#print_int(n)
		la $a0, result2
		li $v0,4
		syscall					#print_str(result2)
		move $a0,$s1
		li $v0,1
		move $a0,$s1
		syscall					#print_int(f)
		li $v0,10
		syscall					#exit()		

factorial:	#num=$a0; res=$t0; i=$t1
		li $t0,1
		move $t1,$a0				#i=num
for:		
		ble $t1,0,endFor
		mul $t0,$t0,$t1				#res*=i
		subi $t1,$t1,1				#i--
		j for
endFor:		
		move $v0,$t0
		jr $ra					#return res