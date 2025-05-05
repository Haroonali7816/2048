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
addi sp sp -24
sw ra 20(sp)
sw s0 16(sp)
sw s1 12(sp)
sw s2 8(sp)
sw s3 4(sp)

mv s0 a0
mv s1 a1

mv a0 s0
mv a1 s1
jal move_left

mv a0 s0
mv a1 s1
jal merge
mv s2 a0
mv s3 a1

mv a0 s0
mv a1 s1
jal move_left
mv a0 s2
mv a1 s3

lw s3 4(sp)
lw s2 8(sp)
lw s1 12(sp)
lw s0 16(sp)
lw ra 20(sp)
addi sp sp 24
jr ra
