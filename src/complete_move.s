.text
.globl complete_move
.import "move_left.s"
.import "merge.s"



#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  2 |  2 |  0 |  4 |  => 	|  4 |  4 |  0 |  0 |
#	|----|----|----|----|		|----|----|----|----|
#
#   BONUS: Return the number of merges in a0 and the
#          total base score of the merges in a1.


complete_move:
addi sp sp -16
sw ra 12(sp)
sw s0 8(sp)
sw s1 4(sp)

mv s0 a0
mv s1 a1

mv a0 s0
mv a1 s1
jal move_left

mv a0 s0
mv a1 s1
jal merge

mv a0 s0
mv a1 s1
jal move_left

lw s1 4(sp)
lw s0 8(sp)
lw ra 12(sp)
addi sp sp 16
jr ra
