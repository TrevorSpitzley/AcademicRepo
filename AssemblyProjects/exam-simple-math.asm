# Trevor Spitzley Exam 2
.globl do_math
.text

# int do_math(int a, int b, int c, int d) {
#    return (a + b) - (c - d);
# }

do_math:
		add $t0, $a0, $a1 # Adds A and B, stores in $t0
		sub $t1, $a2, $a3 # Subs C and D, stores in $t1
		sub $v0, $t0, $t1 # Takes t0 = (A+B), and t1 = (C-D), and does return = t0 - t1. Which is return = (A+B) - (C-D)
		jr $ra