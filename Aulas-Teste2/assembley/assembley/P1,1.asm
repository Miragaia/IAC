	.data
minhafrase: .asciiz "Hello World"

	.text
main:  	la  $a0, minhafrase
	la  $v0,4
	syscall 
	 
