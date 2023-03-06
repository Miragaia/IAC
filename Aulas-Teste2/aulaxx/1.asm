		.data
nums:		.word -2,3,6,4,8,126,-131,17

		.text
main:		#i:v0 | val: t2 | SIZE: s0 | &nums[0]:s1 | &nums[i]: t1 | cópia de nums[i]: t2
		li $s0,8				#SIZE=8
		li $t0,0				#i=0
		la $s1, nums
		
for:		bge $t0,$s0,endFor
		sll $t4,$t0,2
		addu $t1,$s1,$t4			#&nums[i]
		lw $t2, 0($t1)
		
		andi $t3,$t2,1				#val%2
		bne $t3,$0,endIf
		li $v0,1
		move $a0, $t2
		syscall					#print_int10(val)
		li $v0,11
		li $a0,','
		syscall					#print_char(",")
		
endIf:		addi $t0,$t0,1				#i++
		j for
		
		
endFor:		li $v0,10
		syscall					#exit()