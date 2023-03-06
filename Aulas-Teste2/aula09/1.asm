		.data
prompt1:	.asciiz "Introduza um numero\n"
result:		.asciiz "O fatorial do numero inserido é: "
		.text
main:		#n=$v0; f=$s0
		la $a0, prompt1
		li $v0,4
		syscall					#print_str(prompt1)
		li $v0,5
		syscall					#n=read_int()
		move $a0,$v0
		jal factorial				#factorial(n)
		move $s0,$v0				#f=factorial(n)
		la $a0, result
		li $v0,4
		syscall					#print_str(result)
		li $v0,1
		move $a0,$s0
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