# Emily Lidnerman and Trevor Spitzley
# Lab 9 - Recursion
.globl nCk


.text

nCk:
		addi $sp, $sp, -16 # Makes room on the stack
		sw $s3, 12($sp) # Store return value
		sw $s0, 8($sp) # Store a0/'n' on stack
		sw $s1, 4($sp) # Store a1/'k' on stack
		sw $ra, 0($sp) # Store $ra on stack
		
		add $s0, $a0, $0 # Store a0/'n'
		add $s1, $a1, $0 # Store a1/'k'
		addi $t1, $0, 1 # Makes a 'true' value
		# Checks if n < k
		slt $t0, $a0, $a1 # t0 = 1 if a0 less than a1, 0 if a0 >= a1
		beq $t0, $t1, a0LessThan
		# If n > k, then lets check if k = 0, or k = 1, or k = n
		beq $s1, $t1, nCh1 # If k = 1, jump there for base case return
		beq $s1, $0, nCh0 # If k = 0, jump there for base case return
		beq $s0, $s1, nChn # If n = k, jump there for base case return
		
		# If n < 0 or k < 0
		slt $t2, $s0, $0 # t1 = 1 if 'n' is negative
		slt $t3, $s1, $0 # t2 = 1 if 'k' is negative
		beq $t2, $t1, nNegative # Branch off if 'n' is negative
		beq $t3, $t1, kNegative # Branch off if 'k' is negative
		
		addi $a0, $a0, -1 # Decrement n
		jal nCk # Jump back
		addi $a0, $s0, -1 # Decrement n for second return
		add $s3, $v0, $0 # Sets s3 to return1
		
		addi $a1, $s1, -1 # Decrement k
		jal nCk # Jump Back
		add $v0, $v0, $s3 # Adds both returns together
		
		# Clean stack
		lw $s3, 12($sp)# restore return1 register
		lw $s0, 8($sp) # Restore s0
		lw $s1, 4($sp) # Restore s1
		lw $ra, 0($sp) # Restore last call
		addi $sp, $sp, 16 # Restore stack
		jr $ra
		
	nNegative: # n is negative, return -1
		addi $v0, $0, -1 # Return -1
		lw $s3, 12($sp) # Restore return1 register
		lw $s0, 8($sp) # Restore s0
		lw $s1, 4($sp) # Restore s1
		lw $ra, 0($sp) # Restore last call
		addi $sp, $sp, 16 # Restore stack
		jr $ra
		
	kNegative: # k is negative, return -1
		addi $v0, $0, -1 # Return -1
		lw $s3, 12($sp) # Restore return1 register
		lw $s0, 8($sp) # Restore s0
		lw $s1, 4($sp) # Restore s1
		lw $ra, 0($sp) # Restore last call
		addi $sp, $sp, 16 # Restore stack
		jr $ra
		
	nChn:   # n Choose n = 1
		addi $v0, $0, 1 # Return '1'
		lw $s3, 12($sp)# Restore return1 register
		lw $s0, 8($sp) # Restore s0
		lw $s1, 4($sp) # Restore s1
		lw $ra, 0($sp) # Restore last call
		addi $sp, $sp, 16 # Restore stack
		jr $ra # Base case return
		
	nCh1:   # n Choose 1 = n
		add $v0, $a0, $0 # Return 'n'
		lw $s3, 12($sp) # Restore return1 register
		lw $s0, 8($sp) # Restore s0
		lw $s1, 4($sp) # Restore s1
		lw $ra, 0($sp) # Restore last call
		addi $sp, $sp, 16 # Restore stack
		jr $ra # Base case returned
		
	nCh0:	# n Choose 0 = 1
		addi $v0, $0, 1 # Return 1
		lw $s3, 12($sp) # Restore return1 register
		lw $s0, 8($sp) # Restore s0
		lw $s1, 4($sp) # Restore s1
		lw $ra, 0($sp) # Restore last call
		addi $sp, $sp, 16 # Restore stack
		jr $ra # Base case returned
		
	a0LessThan: # n < k base case, return -1
		addi $v0, $0, -1 # Makes -1 value for return
		lw $s3, 12($sp) # Restore return1 register
		lw $s0, 8($sp) # Restore s0
		lw $s1, 4($sp) # Restore s1
		lw $ra, 0($sp) # Restore last call
		addi $sp, $sp, 16
		jr $ra # Error case return
