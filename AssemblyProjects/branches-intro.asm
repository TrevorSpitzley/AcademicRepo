.globl makes10 intMax close10 dateFashion
.text
#Emily Linderman, Trevor Spitzley, Owen Ganzer

makes10:
		beq $a0, 10, a10True
		beq $a1, 10, b10True
		add $a3, $a0, $a1
		beq $a3, 10, sumTrue
		addi $v0, $zero, 0
		j end
	a10True:
		addi $v0, $zero, 1
		j end
	b10True:
		addi $v0, $zero, 1
		j end
	sumTrue:
		addi $v0, $zero, 1
		j end
	end:
		jr $ra
		
intMax:
		bgt $a0, $a1, aMax #Branch if a0 greater than a1
		add $s0, $a1, $zero #Store b in max reg
		j check
	aMax:
		add $s0, $a0, $zero
		j check
	check:
		bgt $a2, $s0, cMax #Checks current max against C
		j end1
	cMax:
		sub $s0, $s0, $s0
		add $s0, $a2, $zero
		j end1
	end1:
		add $v0, $s0, $zero
		jr $ra
	
close10:
		subi $s0, $a0, 10 #store in a0, a0 - 10
		subi $s1, $a1, 10 #store in a0, a0 - 10
		abs $s0, $s0 #Absolute value of a0
		abs $s1, $s1 #Absolute value of a1
		bgt $s1, $s0, aGreater #Branch if B greater than A
		bgt $s0, $s1, bGreater #Branch if A greater than B
		j equal
	bGreater:
		 add $v0, $a1, $zero
		 j end2
	aGreater:
		add $v0, $a0, $zero
		j end2
	equal: 
		add $v0, $zero, $zero
		j end2
	end2:
		jr $ra
		
dateFashion:
		addi $s0, $zero, 2 #Set values of <= 2
		addi $s1, $zero, 8 #Set values of >= 8
		ble $a0, $s0, lessThan
		ble $a1, $s0, lessThan
		bge $a0, $s1, greaterThan
		bge $a1, $s1, greaterThan
		j maybe
	lessThan:
		add $v0, $zero, $zero
		j end3
	greaterThan:
		addi $v0, $zero, 2
		j end3
	maybe:
		addi $v0, $zero, 1
		j end3
	end3: 
		jr $ra