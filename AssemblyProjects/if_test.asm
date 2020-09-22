# Trevor Spitzley, Exam 2 question 2
.globl if_test
.text
# int if_test(int a, int b) {
#     if (a > b + 5) {
#         temp = a - 2;
#     } else {
#         temp = b + 3;
#     }
#    return b + temp;
# }

# MUST USE slt AND (beq OR bne)

if_test:
		addi $s0, $zero, 1 # Register for true value
		addi $t0, $a1, 5 # Stores B+5 in t0
		slt $t1, $t0, $a0 # If t0(B+5) < a0(A), then t1 = True/1
		beq $t1, $s0, BisLess
		addi $t0, $a1, 3 # Stores (B+3) in 'temp' register
		j return
	BisLess:
		subi $t0, $a0, 2 # Stores (A-2) in 'temp' register
		j return
	return:
		add $v0, $a1, $t0
		jr $ra