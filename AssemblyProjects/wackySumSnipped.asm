# Trevor Spitzley and Emily Linderman Lab 10
.globl wackySum

#public static int wackySum(int a, int b, int c) {
#        int sum = 0;
#        for(int i = a; i <= b; i += c) {
#            sum += combineFour(i, (i+1)/2, (i+2)/2, (i+3));
#        }
#        return sum;
#    }
#public static int combineFour(int a, int b, int c, int d) {
#        int sum = a + b + c + d;
#        if (sum % 2 == 0) {
#            return sum;
#        } else {
#            return sum/2;
#        }
#    }
.text

# START INCLUDE HERE

wackySum:
		addi $sp, $sp, -28 # Makes room on the stack
		sw $t2, 24($sp)
		sw $t1, 20($sp)
		sw $t0, 16($sp)
		sw $s2, 12($sp) # Store return value
		sw $s1, 8($sp) # Store a0/'n' on stack
		sw $s0, 4($sp) # Store a1/'k' on stack
		sw $ra, 0($sp) # Store $ra on stack

		addi $t2, $0, 0 # Clears $t2/sets = 0 just in case
		
		# Copies of a0-a2 for reuse
		add $s0, $a0, $0 # Our 'a' copy/'i' counter
		
		# Set $s1 = ((int b) + 1) // Using b+1 allows for us to just use a 'slt' and 'beq' commands
		addi $s1, $a1, 1 # Our 'b' copy
		
		add $s2, $a2, $0 # Our 'c' copy
	loop:
		slt $t0, $s0, $s1 # Checks if 'a' is less than b+1. Effectively checking if 'a' is still <= 'b'
		# If true, t0 = 1. If false, t0 = 0.
		beq $t0, $0, end # If $s1 = 0, then 'a' > 'b'. $s1 = 1 otherwise, meaning 'a' <= 'b' 
		
		add $a0, $s0, $0 # To set 'a' in C.F. to 'i' 
		
		addi $a1, $s0, 1
		srl $a1, $a1, 1 # These 2 lines turn a1 of combineFour into (i+1)/2
		
		addi $a2, $s0, 2
		srl $a2, $a2, 1 # These lines turn a2 of combineFour into (i+2)/2
		
		addi $a3, $s0, 3 # This line turns a3 of comebineFour into (i+3)
		
		add $v0, $0, $0 # Clears v0 for next combineFour call
		
		jal combineFour
		
		add $t2, $t2, $v0 # Adds current sum to new sum and stores in temp return
		add $s0, $s0, $s2 # This line does 'i += c'
		#add $v0 $0, $0 # Clears out return
		j loop # Do it again!
	end:
		add $v0, $t2 $0 
		lw $t2, 24($sp) # Grab from stack
		lw $t1, 20($sp) # Grab from stack
		lw $t0, 16($sp) # Grab from stack
		lw $s2, 12($sp) # Grab a2 from stack
		lw $s1, 8($sp) # Grab a1 on stack
		lw $s0, 4($sp) # Grab a0 on stack
		lw $ra, 0($sp) # Grab $ra on stack
		addi $sp, $sp, 28 # Restore stack
		jr $ra # Return
		
# STOP INCLUDE HERE