.globl monkeyTrouble sleepIn posNeg
.text

monkeyTrouble:
		bne $a0, $a1, false
		beq $a0, $a1, true
	false:
		add $v0, $zero, $zero
		j end
	true:
		addi $v0, $zero, 1
		j end
	end:
		jr $ra
	
sleepIn:
	not $a0, $a0
	andi $a0, $a0, 1
	or $v0, $a0, $a1
	jr $ra

posNeg:
		addi $a3, $zero, 1 # True result in a3
		slti $t0, $a0, 0 # store true in t0 if a0 less than 0
		slti $t1, $a1, 0 # store true in t1 if a1 less than 0
		beq $a2, $a3, true1
		j false1
	true1:
		and $v0, $t0, $t1
		j end1
	false1:
		add $t3, $t0, $zero # Not the 'a' input
		not $t3, $t3
		andi $t3, $t3, 1
		
		add $t4, $t1, $zero
		not $t4, $t4 # Not the 'b' input
		andi $t4, $t4, 1
		
		and $s0, $t0, $t4 # And 'a' and not 'b'
		and $s1, $t1, $t3 # And 'b' and not 'a'
		or $v0, $s0, $s1 # or the so and s1 values
		j end1
	end1:
		jr $ra
		
	
