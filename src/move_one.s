.text
.globl move_one

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|----|		|----|----|----|----|----|
#	|  2 |  0 |  2 |  0 |  4 |	=> 	|  2 |  2 |  0 |  4 |  0 |
#	|----|----|----|----|----|		|----|----|----|----|----|
#
#	a0 1 iff something changed else 0

move_one:
# We start with the concept that we take only index 1 till n-1 of the array because index 0 can't be moved left.
 li t0 1
 li a3 0 # to check if we have moved or not.

 loop:
  bge t0 a1 end # iterate over the whole array.
  slli t1 t0 2
  add t2 a0 t1

  # we now load the addresses
  lw t3 0(t2)
  lw t4 -4(t2)

  # we now load the actual values
  lh t5 0(t3)
  lh t6 0(t4)

  # now we check the conditions
  beqz t5 leave # we check if the current tile is zero
  bnez t6 leave # we check if the tile left to it is zero

 # Finally we move towards moving the tile
 sh t5 0(t4)
 sh x0 0(t3)
 li a3 1 # we change a0 to 1 indicating that we have atleast moved once.
 
 leave: 
 addi t0 t0 1
 j loop

 end:
 mv a0 a3
 jr ra
