.text
.globl move_left
.import "move_one.s"


#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  0 |  2 |  0 |  4 |	=> 	|  2 |  4 |  0 |  0 |
#	|----|----|----|----|		|----|----|----|----|
#



move_left:

addi sp sp -16    
sw ra 12(sp)       
sw s0 8(sp)        
sw s1 4(sp)

mv s0 a0
mv s1 a1

loop: 

mv a0 s0
mv a1 s1
jal move_one
bnez a0 loop



lw s1 4(sp)
lw s0 8(sp)
lw ra 12(sp)
addi sp sp 16
jr ra
