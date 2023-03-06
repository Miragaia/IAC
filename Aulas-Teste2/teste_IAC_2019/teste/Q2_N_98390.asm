# ------------------------------------------------------------------
# DEP. ELECTRÓNICA, TELECOMUNICAÇÕES E INFORMÁTICA - Univ. Aveiro
#         Teste Teórico 2 de IAC - 29 de Junho de 2020
# 
# NOME: ____________Mariana Rosa__________________________________ Nº _____98390_____
# ------------------------------------------------------------------
# NOTA: Use este ficheiro para responder às questões 2a e 2b).
# ------------------------------------------------ 
# --------
# 2b) cotação: 2,0 valores
# ------------------- Código C -------------------
# int isqrt(unsigned int n );
# void main( void ) {
# static char* msg = "; A raíz inteira é: " ;
#  unsigned int r, n = 81;
#     print_int10( n ); 
#     print_str( msg ); 
#     r = isqrt( n ); 	// call isqrt
#     print_int10( r );  
#     exit(); 
# }
# -------------------------------------------------
# Registos:
# ----------
# Variável |  Registo(s)
#    msg   |  $a0
#    n 	   | $t0
#    r     |  $t2
# -------------------	
	.eqv	PRINT_INT10,1	
	.eqv	PRINT_STR,4
	.eqv	EXIT,10		
	
#		
	.data
msg:	.asciiz "; A raíz inteira é: "

	.text
	.globl main
main:
	li $t0, 81 #n=81=$t0
	
	move $a0, $t0
	li $v0, PRINT_INT10 #imprimir o n
	syscall  
	
	la $a0, msg #imprimir a msg
	li $v0, PRINT_STR
	syscall
	
	move $a0, $t0
	jal isqrt
	move $t2,$v0 # isqrt(n)
	
	move $a0, $t2   #imprimir o r
	li	$v0, PRINT_INT10
	syscall			
	
	li	$v0, EXIT #sair do programa
	syscall
	
	
	

# --------
# 2a) cotação: 4,0 valores
# ------------------- Código C -------------------
# unsigned int isqrt(unsigned int n ){
#     unsigned int  smc,lgc;    
#      if (n < 2) return n ;   
#      smc = isqrt( n >> 2 ) << 1; 
#      lgc = smc + 1;
#      if ( lgc*lgc > n ) return smc;  
#      return lgc ;   
# }
# -------------------------------------------------
# Registos:
# ----------
# Variável |  Registo(s)
#    n 	   |  $a0
#    smc   |  $s0
#    lgc   |  $s1
#          |
# -------------------
isqrt:	bgeu	$a0,2,else1 # se n>=2 vai para else1
	move	$v0,$a0
	jr	$ra	#devolve o n
	
else1:	#utilizar a stack, função não terminal
	addiu 	$sp, $sp, -16 #guardar espaço na stack
	sw 	$ra, 0($sp) 	 
	sw 	$a0, 4($sp) 	#n	
	sw	$s0,8($sp)   #smc
	sw	$s1,12($sp)  #lgc
	
	srl	$a0,$a0,2  #$a0=n>>2
	jal	isqrt	 #isqrt(n>>2)
	
	lw	$s0,8($sp)
	sll	$s0,$v0,1  # smc=isqrt(n>>2) << 1 = $s0
	
	lw	$s1,12($sp)
	addiu	$s1,$s0,1 #lgc= smc + 1
	
	mulu 	$t0,$s1,$s1 #$t0=lgc*lgc
	lw 	$a0, 4($sp) 
	lw 	$ra, 0($sp) 
	addiu	$sp, $sp, 16
	bleu	$t0,$a0,else2	# se lgc*lgs<=n vai para else2
	
	move	$v0,$s0
	jr	$ra	#devolve smc
	
	
else2:
	move	$v0,$s1	 #$v0=lgc
	jr	$ra












