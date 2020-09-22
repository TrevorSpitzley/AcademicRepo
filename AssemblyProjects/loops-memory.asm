.globl indexOf max sum13 sum67
.data
	myarr: .word -5 -2
.text
	# code for running test
	la $a0, myarr  # put address of myarr into $a0
	li $a1, 2
	jal max
	move $s0, $v0  # save final result in $s0 so you can keep it around

	# exit program
	li $v0, 10
	syscall
# Trevor Spitzley and Emily Linderman

indexOf:
		addi $v0, $zero, -1 # Pre-stores -1 in return
		addi $s0, $zero, 1 # "True" boolean value 
		addi $s1, $zero, 0 # "False" boolean value
		addi $s2, $zero, 0 # For the 'i' value
	while:
		sll $t0, $s2, 2 # $t0 = i * 4
		add $t0, $t0, $a1 # Address of array[i] 
		lw $t1, 0($t0) # Loads first array element to $t1
		bgtz $t1, posNum # 'if $t1 is positive, branch to positive'
		j end # 'else, it is negative so jump exit loop and jump to end and return -1/$v0'
	posNum:
		beq $t1, $a0, found # Branch off if we found the value
		addi $s2, $s2, 1 # If not, incremement 'i'
		j while # Jump back to loop
	found:
		add $v0, $zero, $s2 # If found, add 'i' to return register
		j end
	end:
		jr $ra

max:
		addi $s0, $zero, 0 # poop
		addi $s1, $zero, 0 # False value
		addi $s2, $zero, 1 # True value
		addi $k0, $zero, 0 # For the 'i' value
		beq $a1, $zero, dontLoop
		sll $t0, $k0, 2 # $t0 = i * 4
		add $t0, $t0, $a0 # Address of array[i]
		lw $s0, 0($t0) # Loads array[i] into $s0 for base comparison
	while2:
		sll $t0, $k0, 2 # $t0 = i * 4
		add $t0, $t0, $a0 # Address of array[i]
		lw $t1, 0($t0) # Loads array[i] into $t1
		slt $t2, $k0, $a1 # $t2 = 1 if i < length, and $t2 = 0 if i >= length
		bne $t2, 1, dontLoop # If $t2 != 1, then i >= length, so dont loop
		# If $t2 == 1, meaning i < length
		slt $t3, $s0, $t1 # Checking if max < element. $t3 == 1 if max < element, and == 0 is max >= element
		beq $t3, $s2, newMax # Branch off if $t3 == 1 (Meaning max < element). 
		# If max >= element
		addi $k0, $k0, 1 # Increment 'i' if max >= element
		j while2 # Loop again
	newMax:
		add $s0, $zero, $t1 # Sets max equal to element if max < element
		addi $k0, $k0, 1 # Increments 'i' anyway
		j while2 # Loop again
	dontLoop:
		add $v0, $zero, $s0 # Sets return register equal to max element
		jr $ra

sum13:
		addi $s0, $zero, 1 # "True" boolean value 
		addi $s1, $zero, 0 # "False" boolean value
		addi $k0, $zero, 0 # For the 'i' increment
		addi $k1, $zero, 0 # Clears $k1 for our 'sum' return
		addi $t9, $zero, 13 # Store 13 to check against in our loop
	while3:
		sll $t0, $k0, 2 # $t0 = i * 4
		beq $k0, $a1, stop # Jumps to end if i == array size. If not, continue on.
		add $t0, $t0, $a0 # Address of array[i]
		lw $t1, 0($t0) # Loads array[i] into $t1
		beq $t1, $t9, next # Branch off if encountering 13. If not, continue on.
		add $k1, $k1, $t1 # Adds $t1 to 'sum'
		addi $k0, $k0, 1 # Increments 'i'
		j while3
	next:
		addi $k0, $k0, 1 # Skips 13
		sll $t0, $k0, 2 # $t0 = i * 4
		add $t0, $t0, $a0 # Address of array[i]
		lw $t1, 0($t0) # Loads array[i] into $t1
		beq $k0, $a1, stop # Jumps to end if i == array size. If not, continue on.
		beq $t1, $t9, next # Branch off if encountering 13. If not, continue on.
		addi $k0, $k0, 1 # Skips number directly after 13 as well
		j while3
	stop:
		add $v0, $zero, $k1 # Adds 'sum' to return register
		jr $ra
		
sum67:
		addi $s0, $zero, 1 # "True" boolean value 
		addi $s1, $zero, 0 # "False" boolean value
		addi $k0, $zero, 0 # For the 'i' increment
		addi $k1, $zero, 0 # Clears $k1 for our 'sum' return
		addi $t9, $zero, 6 # Store 6 to check against in our loop
		addi $t8, $zero, 7 # Store 7 to check against in our loop
		addi $t7, $zero, 0 # Using $t7 for our 'stop' boolean
	while4:
		sll $t0, $k0, 2 # $t0 = i * 4
		beq $k0, $a1, stop2 # Jumps to end if i == array size. If not, continue on.
		add $t0, $t0, $a0 # Address of array[i]
		lw $t1, 0($t0) # Loads array[i] into $t1
		# i < length
		beq $t1, $t9, setTrue # Branches of if nums[i] == 6
		# If not, check boolean
		beq $t7, $s1, addSum # If stop == false, add to sum in branch
		addi $k0, $k0, 1 # Increments 'i' before loop again
		# Check if nums[i] == 7
		beq $t1, $t8, setFalse # Branch off if nums[i]==7
		j while4 # Take it back now y'all
	addSum:
		add $k1, $k1, $t1 # Adds to sum
		addi $k0, $k0, 1 # Increments 'i'
	setFalse:
		addi $t7, $zero, 0 # Sets 'stop' to false
		j while4 # Take it back now y'all
	setTrue:
		addi $t7, $zero, 1 # Sets our 'stop' boolean to true 
		addi $k0, $k0, 1 # Increments 'i'
		j while4 # Back at it again
	stop2:
		add $v0, $zero, $k1 # Stores 'sum' in return
		jr $ra
