# Trevor Spitzley, Exam 2 practice problem
.globl foo
.text

# int foo(int a, int b){
#	return a + b;
# }

foo:
		add $v0, $a0, $a1
		jr $ra	