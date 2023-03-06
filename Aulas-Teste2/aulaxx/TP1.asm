		.data
nums:		.word -2,3,-19,4,8,126,-131,17
msg:		.asciiz "O nr de impares: "
		
		.text
main:		#SIZE:s0 | i:t0 | imps:s1,a0 | nums:s2 | &nums[i]:t2 | nums[i]:t3
		li $s0,8				
		li $t0,0
		li $s1,0
		la $s2,nums
		
for:		bge $t0,$s0,endFor
		sll $t1,$t0,2				#t2=i*4
		add $t2,$s2,$t1				#t2=&nums[i]
		lw $t3,0($t2)				#t3=nums[i] (cópia)
		andi $t4,$t3,1				#t4=nums[i]&1
		beq $t4,$0,endIf
		addi $s1,$s1,1				#imps++	
endIf:		addi $t0,$t0,1				#i++
		j for
endFor:		
		li $v0,4
		la $a0,msg
		syscall					#print_str(msg)
		li $v0,1
		move $a0,$s1
		syscall					#print_int10(imps)
		li $v0,10
		syscall					#exit()