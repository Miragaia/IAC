	.text
main:	li $t0 0x12345678
	li $t1 0x0000000f

	and $t2,$t0,$t1
	or $t3,$t0,$t1
	xor $t4,$t0,$t1
	nor $t5,$t0,$t1
	not $t6,$t0