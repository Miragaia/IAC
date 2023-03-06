
# ------------------------------------------------------------------
# DEP. ELECTRÓNICA, TELECOMUNICAÇÕES E INFORMÁTICA - Univ. Aveiro
#         Teste Teórico 2 de IAC - 29 de Junho de 2020
# 
# NOME: ______________________Mariana Rosa________________________ Nº ________98390__
# ------------------------------------------------------------------
# NOTA: Use este ficheiro para responder à questão 1).
# ------------------------------------------------ 
# --------
# 1) cotação: 6,0 valores
# ------------------- Código C -------------------
# #define SIZE 20
# #define NBR_N 4030
# void main(){
# static char* msg = "Os divisores são: ";
#  static int fat[SIZE];
#  int i;
#  int* fatst = fat;
#     print_str( msg );
#     for (i = 1; i < NBR_N; i++) {   
#         // sugestão: instrução 'rem'
#         if ( (i==1) || (NBR_N % i == 0) ){
#		*fatst++ = i; 
# 		print_int10(i);
#		print_char( ',' );
#        }
#   }
#    exit();
# }
# -------------------------------------------------
# Registos:
# ----------
# Variável |  Registo(s)
#    msg   |  $a0
#    i 	   |  $t0
#   fat    |  $t2
#  fatst   |  $t5
# -------------------	
	.eqv	PRINT_INT10,1	
	.eqv	PRINT_CHAR,11
	.eqv 	print_str, 4
	.eqv	EXIT,10		
	.eqv    SIZE, 80 #20*4=80, são numeros inteiros
	.eqv 	NBR_N, 4030  
#		
	.data
fat:	.space SIZE #criar espaço
virgula:.asciiz ","
msg:	.asciiz  "Os divisores são: "

	
	.text
	.globl main
main:	
	
	la $a0, msg  #imprimir a msg
	li $v0, 4
	syscall
	
	li $t0,1 # $t0=i=0
	
	la $t2, fat #lista[0]
	li $t3, NBR_N #NBR_N= $t3
	
	li $t0,1 # $t0=i=0
	li $t1, 1 #constante 1

for:	sll $t4, $t0,2 # i*4
	add $t5, $t2,$t4 #*fatst=fat
	bge $t0 , $t3 , endfor  #se o i<NBR_N(4030), vai para o endfor

#temos duas condiçoes no if, precisamos de ter dois ifs diferentes

if1:     beq $t0, $t1, iff #Se i==1, ele executa o if

if2:	rem $t6, $t3, $t0 #Fica guardado em $t6 o resto do NBR_N por i (NBR_N%i)
	beq $t6,0, iff #se o resto for igual a 0 executa o if
	j else
	
iff:	add $t7,$t0,$t1 #i++
	sll $t8, $t7,2 #o valor obtido anteriormente*4, i++* 4
	add $t9,$t2,$t8 #*fatst++
	
	sw $t0,0($t9) #guardar o fatst++  em i
	
	move $a0,$t0
	li $v0, PRINT_INT10 #imprimir o i obtido anteriormente
	syscall
	
	la	$a0,virgula  #imprimir as virgulas
	li	$v0,4
	syscall

else: 	add $t0,$t0,$t1
	j for
	
endfor:	li	$v0 , 10  #sair do ciclo for e acabar o programa
	syscall	
	

