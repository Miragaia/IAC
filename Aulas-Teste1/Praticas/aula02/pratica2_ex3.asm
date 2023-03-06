	.data
frase1: .asciiz "Introduza dois numeros :"
frase2: .ascilz "A soma dos numeros é: "
	.text
main: la $a0, frase1
	li $v0,4
	syscall #print_string("Introduza dois numeros");
	
	li $v0,5	#5 = read_int();
	syscall
	move $t0,$v0 #t0 = a = read_int();
	li $v0,5
	syscall	
	move $t1, $v0 #3 t1 = b = read_int();
	
	la $a0, frase2
	li $v0,4
	syscall		#print_string("A soma de números é:");
	add $a0,$t0,$t1
	li $v0,36		#1 = print_int10
	syscall			#print_int10( a + b)
	
	li $v0,10
	syscall		#exit();